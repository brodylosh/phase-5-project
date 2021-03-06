import { useState, useEffect } from 'react';
import { Card, Button, Row, Container, Spinner } from 'react-bootstrap';

function Requests({ currentUser }) {
  const [requestsList, setRequestsList] = useState([]);

  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    fetch(`/athletes/${currentUser.id}/deals`)
      .then((resp) => resp.json())
      .then((data) => {
        setIsLoading(false);
        setRequestsList(data);
      });
  }, [currentUser]);

  function acceptRequest(id) {
    let accepted = { completed: true };
    fetch(`/deals/${id}`, {
      method: 'PATCH',
      headers: {
        'content-type': 'application/json',
      },
      body: JSON.stringify(accepted),
    }).then((resp) => {
      if (resp.ok) {
        resp.json().then(() => {
          const filteredRequests = requestsList.filter(
            (deal) => deal.id !== id
          );
          setRequestsList(filteredRequests);
        });
      }
    });
  }

  function denyRequest(id) {
    let denied = { athlete_id: null, completed: true };
    fetch(`/deals/${id}`, {
      method: 'PATCH',
      headers: {
        'content-type': 'application/json',
      },
      body: JSON.stringify(denied),
    }).then((resp) => {
      if (resp.ok) {
        resp.json().then(() => {
          const filteredRequests = requestsList.filter(
            (deal) => deal.id !== id
          );
          setRequestsList(filteredRequests);
        });
      }
    });
  }

  let renderRequests = requestsList.map((deal) =>
    !deal.completed ? (
      <Card key={deal.id} className="deal-card">
        <Card.Header>{deal.title}</Card.Header>
        <Card.Body>
          <Card.Title>{deal.description}</Card.Title>
          <Card.Text>{deal.collaborator.name}</Card.Text>
          <Card.Text className="green">Offer: ${deal.offer}</Card.Text>
          <Card.Text>Expires: {deal.expiration_date}</Card.Text>
          <Card.Img
            src={
              deal.collaborator.image_url
                ? deal.collaborator.image_url
                : 'https://www.zimplaza.co.zw/wp-content/uploads/placeholdercompany5f3438282f524800f1d49cd2921bb0a56101e1aa16097ebd313b64778fc7c4bd1611448792.png'
            }
            className="deal-card-image"
          ></Card.Img>
          <Button
            size="small"
            variant="success"
            className="accept"
            onClick={() => acceptRequest(deal.id)}
          >
            Accept
          </Button>
          <Button
            size="small"
            variant="danger"
            onClick={() => denyRequest(deal.id)}
          >
            Deny
          </Button>
        </Card.Body>
      </Card>
    ) : null
  );

  return (
    <>
      <h1 className="page-header">deal requests</h1>
      <br />
      <Container>
        {isLoading ? (
          <Spinner animation="border" />
        ) : (
          <Row className="g-4">{renderRequests}</Row>
        )}
      </Container>
    </>
  );
}

export default Requests;

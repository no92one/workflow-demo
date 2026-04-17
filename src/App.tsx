import { useState, useEffect } from 'react'

interface message {
    message: string
}

export default function App() {

    const [message, setMessage] = useState('');

    useEffect(() => {
        (async () => {
            const response = await fetch('/api/hello');
            const data = await response.json();
            setMessage((data as message).message);
        })();
    }, []);

    return <>
        <h1>A message from our backend!</h1>
        <p>{message}</p>
    </>

}
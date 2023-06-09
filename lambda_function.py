import json

def lambda_handler(event, context):
    a = int(event['a'])
    b = int(event['b'])
    result = a * b

    response = {
        'statusCode': 200,
        'body': json.dumps({'result': result})
    }

    return response

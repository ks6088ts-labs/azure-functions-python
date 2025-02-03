from fastapi import APIRouter

router = APIRouter(
    prefix="/core",
    tags=["core"],
)


@router.get("/info")
def info():
    return {
        "hello": "world",
    }

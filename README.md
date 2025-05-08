### Quick test

```bash
docker run -d -p 8000:8000 ghcr.io/your-org/lifestyle-age:latest
curl -X POST \
  "http://localhost:8000/lifestyle_age?age=40&bmi=23&smoking=1&activity=180&alcohol=4&diet=1"
# → {"lifestyle_age":35,"delta":-5,"score":5}
```

## License

This project is licensed under the AGPL-3.0 License. See the `LICENSE` file for details (though we haven't explicitly created one in this session, it was in your original project structure).

## Citation

This API's concept of lifestyle factors and their impact is inspired by the following research:

Li, Y., Pan, A., Wang, D. D., Liu, X., Dhana, K., Franco, O. H., Kaptoge, S., Di Angelantonio, E., Stampfer, M., Willett, W. C., & Hu, F. B. (2018). Impact of Healthy Lifestyle Factors on Life Expectancies in the US Population. *Circulation*, *138*(4), 345–355. [https://doi.org/10.1161/CIRCULATIONAHA.117.032047](https://doi.org/10.1161/CIRCULATIONAHA.117.032047)

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800446;
	b=Ek5iEkRZwqrmREkWLjtCZmruWv4D+pyzf+Uhk8s3yGJCNBV1Xkj2WpFi9UFMzRMmXk0r
	 /TYekkhpcNzLTetDxmv1fxxREvKBQ30Ofr1mRi1fgLcgfAAieCScFFbRFuOkqJuWX3hdd
	 RNwQoAy0dMrh/bkhcaMxttVQwbY98LdMq4tpri6mJGlAOH2E6/YSk2k+/93/tyD4M3bry
	 LSiLPv7kvesMBLByWGFmicEY0ysLv6uXmOLFF3xXZp/eg6wFiqVAa7+rU1rQHJkba5rkZ
	 +vpY2tX5BPLAue4pJxSgTwTFx31qm0kgmzVAvMjDZ7dPwJ4TCuvK3Rt6uvasquwBEUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800446;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=drgLSRnt5uPABDepZHClizyF65DMZ6f3WXlDwV1zLHo=;
	b=LKa3i0sQw+Qdt6egAIs1z/UvICb4sy7JUXd8CX0NXvxVTRI360ccvWHSU+j0y03eKWn4
	 eEmlnvkt7xz9S8xXktIIU7eOzGB6yxDFkTA4cFuazd1lGcoXFU4yuQt5yKxofQq4o4CBU
	 biG72NYH30JwpYpdww4f+kftZOHwDCbb9AHu9DSFrMSRjBmnvTVVnShLzvXfCNLnNXu43
	 qkQZ7kcxz7ccoJf5CnENnoS/d6xSxv+eQ3r2cwAa0bzxdXv8gBxBV8b49inGDFMni5nQf
	 X4z7Jlaugz5qfr3yBrHIgzT4ruoJXI+b1svo9w1iJ0b4PSNonGbCsdTcjfqqARv6RFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8155pIt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB741606A32E;
	Wed,  4 Nov 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8155pIt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F5F1F000C1;
	Wed,  4 Nov 2026 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800445;
	bh=drgLSRnt5uPABDepZHClizyF65DMZ6f3WXlDwV1zLHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U8155pIt5MK3hkWVH9Jb3RTFDR0rZ+jCFBzbwDEI5mKsXtKh4+AsWedGRX2LWMOXv
	 26XccUgqD0qI0JxQGSIZ3VUf6vEj5WhwyHeW9qahVLyic8iAd7Iq6ZoEdLGU3y+B2x
	 r633ZRP9OLYoHnS2znt/x+0uocUPSqhElvJr/7xIKE0Sbs/vS0xrWaBPBjx8N6dBbw
	 vbj6BlPvx9AkAOASwuXxKNSD+VtHmsdCJPBX5jnYvnMUq3v9y8vcpV3DoPjrvrkhMh
	 RYC+OLuNyEnDA4d/N7FIaDoqwJzNfEcYzB1LqzfzUJmYmhKJidPCE1pj8SIQpqyPdY
	 2H2nwI07LSagA==
Date: Wed, 4 Nov 2026 14:54:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
Message-ID: <20261104-smart-scorpion-of-bliss-2e8371@quoll>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>

On Mon, Nov 02, 2026 at 02:20:58PM +0530, Nihal Kumar Gupta wrote:
> Glymur uses the X1E80100 CAMSS resources, but its CSI2 PHYs are
> described as standalone PHY nodes. Reusing the X1E80100 resources also
> reuses csiphy_res[], where port@3 maps to CSIPHY id 4.
> 
> Add Glymur resource data without reusing the X1E80100 CSIPHY resource
> table, so the standalone PHY path uses the graph port number as the
> CSIPHY id.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1db66976e51b81edeb223cebb6bbe84995d102c2..4f705a056eedbc7b09d2630ee6284b8d768cc6d5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5800,6 +5800,21 @@ static void camss_remove(struct platform_device *pdev)
>  	camss_genpd_cleanup(camss);
>  }
>  
> +static const struct camss_resources glymur_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1e80100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num = 5,

5? Your binding said three... Confusing.

> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources = {
>  	.version = CAMSS_8x16,
>  	.csiphy_res = csiphy_res_8x16,
> @@ -6049,6 +6064,7 @@ static const struct camss_resources x1e80100_resources = {
>  };
>  
>  static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>  	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>  	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>  	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -6068,7 +6084,6 @@ static const struct of_device_id camss_dt_match[] = {
>  	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>  	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>  	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },

Why do you keep breaking the order...

>  	{ }
>  };
>  
> 
> -- 
> 2.34.1
> 

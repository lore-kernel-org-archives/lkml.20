Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA5E3B4E9D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424145; cv=none; b=Sb0lf2f9G6WoQZbaRA0xNaXwK4q2XN9FD3d7gHbup3HJq509EZcmU3JYadMWdMEThSayQLG1t3KKolPYaNfwfXWwdEXKeW+AuyserZ3g9y0hmV3vN2EwICa9rKurJs6PrIAAfaLbTP+2+Uc4Wxxsblq+42QQdLyxANEXYQGj6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424145; c=relaxed/simple;
	bh=j/YkXCRb+DA7nNO9q31K7pBUxD0nnB4tRARb3P9panw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=l9NYxxWs3Yc4YXjiL45WGPACNnb/pOdVtpRCDjUgSaS+Nn56iwPGoscVeuxcxJwxJR4yTephZDnukdpCiVQpuCEkCRqgRNOD5W/9DANppjVeEwlvvGRyp5k1I5tL2v4haaeRVi35GHP5uO0ef5j4TNsBZ1ehZF9V2lKM31T9q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mRFGQaQd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mRFGQaQd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc3327fdso1352639f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788424141; x=1789028941; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4vKdHGO8+zOlAPBdoXMqgNoiUhAKGdphTDuXcL4XSA=;
        b=mRFGQaQde7qdWnv+c98cI5KLyy/7vLcC8qeD9geIQc+8meImGBg7E2P6M+RiM5FP8Y
         znQoySRkWarZkGMDGV93PPL6m4iXWuy74nkscUMmRYaaTpY35QUwXa2vm+ovvm1fCnU3
         k+0mLyNheymZn6BYr7bg1qZwpX5vFSy815omfyPycxGMyrhQ91pcVFIocR9NWZQdLE/a
         1+zbTYsgEl6M60qQeXjBhd7eo8fQQmA2D5cOaBPEhAVFg1t1Pxov+pcwCChLqMLPkaA1
         3LRKwntbu4qUyV5VOZeL1Tbh45EgGZN2d9zLp5qAeVbV8OfCZDy0w04WP9ktkTpc2wQZ
         ohWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424141; x=1789028941;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G4vKdHGO8+zOlAPBdoXMqgNoiUhAKGdphTDuXcL4XSA=;
        b=raJ4UJDgubHCdXtwwi77Ugs7k8GCmw51wZUT06VH6M3YX3bn7VNc/Ge5T3PFPyPBDM
         a4serq2GZnTmurW3JtL0kHxebKmXahL97AUQVbT7bzWNSYUrFAP7StQp+aQpmAolmIRT
         jH5FWc9nCHuvg6WCxxMJeZgONwOCfba9rjfCldHbMv+2Pv2LnR2H17WA5vflCYSRd1jE
         n/GvIz6zOB0oEM2me5ehI1vhZ6lq3fTS9XEZ76cS2grsQhNlJNIPED/8v2aaqo7cXBkd
         3r4OLL8CtevXijZOCyRgxuljy3K7I4YIyYiwHUHUTHJmQw9idN0lgYV4kxT/dgCLqBBA
         IFow==
X-Forwarded-Encrypted: i=1; AKwUvBxTTNJ83WCYQaDNw9qraeiVMCWDausll+BcULzh/lawQ1J9jYRQXTNTUyHyFwJejCL+1QxshWoj37xSi1g=@vger.kernel.org
X-Gm-Message-State: AFuF++mIi5rzaoOdXtwg17PWGYlT2AzR7DZkosNs9iqkHLiNPyachQXV
	kbffnxy+9x1ko7b0lg5X8/Pvn/i3/FpwLCF5+ezeKRRFM0GgnRQ4uXywfccn0lISVQU=
X-Gm-Gg: AYBFou0jvx9FcaLzbXq2zmMBEmz78jWKo3pJ0dCeCqT1eXg3MGLQyeA6iy459GgWyZd
	KSr2XomGgRh5L4Led5Xl9ofoI7eZ41Pqn3JF0DiVczTXJ2DvTzAvgDen+rjjhUamPx1ub7AD4tU
	YW5GXjgBqLEdg7m0Pg7GJXV0kOh9q/doFI/rSrD/bwVpuzgOimdSR1fvecGD0F9NFSsQRaUdYQg
	DXffMVnEEKJX8A9cWa82WCeHJCTRu9Faq6QVGldY5dqWAV2l4vNpsvnHvSChCQq8OHx24B8ueck
	4tm/zik66QNPz2dOLY97QdFK2lBC1fJuf7y3zJPdV0B3Vj63PL5sC6IKu/m9AJEftU16uqGai2e
	FA+zSmgbZPRyHJJvfeBeVVFocORF8nXERj6ZBx8st9is3mFESggmolwgsb/YY3PT1c16ncwpUKf
	FutAk/1VwSXamSSR0jFtMRoDvQgA+S7EZLdqyXA46QfmWy7YYws91YKpLi
X-Received: by 2002:a05:6000:186e:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-48488deedd2mr18283862f8f.1.1788424140416;
        Thu, 03 Sep 2026 01:29:00 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm12497978f8f.27.2026.09.03.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 10:28:51 +0200
Message-Id: <DL5JFZPXGYZF.2JXFWOJHEMWAF@baylibre.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: can: m_can: add ti,am62-m_can
 compatible
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
Cc: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
 <vishalm@ti.com>, <linux-can@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260902-temp-v4-0-3896f7d16ce8@ti.com>
 <20260902-temp-v4-1-3896f7d16ce8@ti.com>
In-Reply-To: <20260902-temp-v4-1-3896f7d16ce8@ti.com>

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Wed Sep 2, 2026 at 11:03 PM CEST, Kendall Willis wrote:
> Add "ti,am62-m_can" to the list of compatible strings for the M_CAN
> controller binding. This compatible identifies TI AM62 SoCs which
> support out-of-band wakeup capability.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b=
/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> index 2c9d37975bedd652b3060ab11ba75c37565edaad..89e5a44453372c57506e9cf3a=
009b55a70cc4446 100644
> --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: bosch,m_can
> +    enum:
> +      - bosch,m_can
> +      - ti,am62-m_can

I think you should use oneOf here to allow the use of

  compatible =3D "ti,am62-m_can", "bosch,m_can";

Best
Markus

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapkvwxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMr
dwD+KU6CuPk9zJ8NzOMyi92mXbApr4jbJz7igogpPtqaSJMBAOSyx5B9ln3sgQco
EmRUOaRu3BgZAwDtaQM5wfBkUNEF
=6Jsh
-----END PGP SIGNATURE-----

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30--

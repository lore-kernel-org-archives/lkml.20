Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790733;
	b=OPMk00yU/QFRwxstPCSvD2huTq9AeRl65C4pizKpP/i2IKlzS9WeQwTNneT9lY30ba+l
	 6CftXIJKXDwoNPi28XIICzk6+oLkdJFYHj1ELQom6CGp2y6qOwjmKTRf4ke3yuuuVWRyy
	 ipIzXh2cFW6JeFhD5UIUI5Qf2Yzim/SZhsrRf5O0oOeShZSACSSHEVv5exlr53Vv2Rqm+
	 K34HOPzbmYXl72ABZhlwMQ/fh7wwT+PY9hVkQnPR0zRGtnGpgGgpbm22m9PdbuzLNvn8X
	 3g3m22It83slIF7iVr7mCwMjX1fbPI5wvimN5+ELo4wXGj42pXo5acLr747jjUfYjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=JXUkcfVdYHLS91Uwpurj9n2UACTGti9F49kfa1ZCWrU=;
	b=DPx8VctMS16440SIbFV4h0h9g/POtm83MBG8OzUp6vOloUBtwXqRwEZ8vHvTbtj/W2FK
	 tUCRxR1vTUf82o5Z0Y0SBXTCK6Lbr6808POwydMIEcfe9Qn6cYF0bl8+3c8Jm0Jj/aBBo
	 8SVZ2rZ+YC+KwYx1jBiUWFinnmtREZdxU2Cef8iu795f0QHji8UkaOtsIKgngOrWTBEai
	 mWZM9uqUWzG+Rw2GGFrmM1F+tGKUiCFajqvO7JOrF7NGZQFoC5CRAPv8EejbPJKGQCC67
	 L9rscwD4w4T3Yp6+4qnIWVVNJJnONi/ZIcVefnxrJenKPQyTrIuvAHCvWuTEQiu6UwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JWOpqRwe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376E606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5376E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JWOpqRwe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5501895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793790731; x=1794395531; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JXUkcfVdYHLS91Uwpurj9n2UACTGti9F49kfa1ZCWrU=;
        b=JWOpqRwecaopor8yH0ZefUJnXs5kKZeycMNKPt5Ui5Eg2fVW6tAtCKrb5rRUcgrXBD
         8uJIxtHhhpRbn50+INj6AHW75qtRtdXLPaT91ZgN6nZTNl8+IWWmDlnQSSP3sMOhzksT
         3Ryi9R/M0KH93x8QtwCpuCp4Lq1tthpgfNafQ+MYg28KRs28IVviCFXz3CKAKu26bkVB
         +kLa1w3eHYUfumKIySZo0FJYRP5AGAB+7m86Iu4bor0bZVu8oDC3YGMf8PpeN8GnUAQ6
         mdftDgku7QnpdqbjF1R0cJ79LW7Jm6U2A1vZ4PfZdFgBZHpZVe8b3YFwnVyiyqewsN3M
         IgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790731; x=1794395531;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JXUkcfVdYHLS91Uwpurj9n2UACTGti9F49kfa1ZCWrU=;
        b=a6WUQ9bjYMwrc2VU5F5PFud6Pq7ixa6GWOh/C7efE88X4T3w8nskY0t1sMXn8v170f
         yE0GKGjaT0+pZDaLKgCwnTMEGHJ1QlKvQ1OsSD12fnrZnd4eTl27zlzvdK6RclLq6Xl3
         8P7SKn1eKQaq+UpJJbwykI1YB+UsnGzjBC9Sy8de1/YvQXqEZq+IYvu/f1ho3soOz5ef
         DbfEGZTIpfbrr/EYT79eYVPrmE0OGz2AWCWuEazuubexnD5s8hg3ZS8QYB1cUybCIFea
         JTQcNTIXKD8/wNPr5JyQQ3zx00s4oDLlZiTkUoaUHMXg4+wsPdGOR6W1JuiG5N8R7wie
         8qDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0OpwmRu4dkGHIL2TlEo82PIjz9saGBW+aBEyMsLFaWipC5IzIdS57j+4OU4+LGiybJl9l+S6jBICkBzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WINSmaa6TVDWwABNc/oOYOxIll8s1xo0bmw6zSDf6lJziF73B
	sWzYRDN8SnR8lLPtCtzfUdiY4VOfyIOOKKt/2HKWK9LD+/i9UP4u2Rotc/+sPt0VUl0=
X-Gm-Gg: AYBFou0whalUFmdRVaZCi8/IDJVfYhsIeYa23HqWVtCSLgDW2ak+rFFB/tqj+NkaM4n
	oFBAP+nJ3JBJTWC0ca+SV8S7MpgpZ81x20qxGJfcJuH+hyQynHq9MqVhd0vPyM2NVRhZ8Nb02GP
	YNKiukR9ymKLphw6gbXQEvs8ghAKtzdiwuEMp4AR9dx67vFlvBX7MnSQnD9NWSUvQo1NEf+meaZ
	IhZsEeUrEP3nTgfGa3Wt55s6o33knLRvyti626ilpsZr0w/GkzzhXCmlGUJSpy9TFto+x78tnMU
	ECsIQjJ8xE7gRBwT5QhrbwOQ2WdPOLjeJlMS6B/ijo/zR0APccbQa2Pucn/EDhM7v5UU/CJe2jX
	t8n0pusJbfEQPn3K32WfH57yHJs0t1ilIH3oXcvqr2a0LZUJ817JUesWqzYp56tRbr+CjRR0NsE
	FyzjTyaALYLHStiazX2UdfugRbjnNbTEg/CP+pWeAPeZP+DgZl0pLskU0bgb1w5run4GwWFyB2N
	elXCEbfqQQGsPnWuPDYPFNlZI/7k4N3JQM6DgI8prKb+05pX6jE50nuTQFTEnHHFi0qRT+uDvBj
	jXK+zdX1L7hyJNRhQnYqllZC
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr394806835e9.17.1793790730347;
        Wed, 04 Nov 2026 03:12:10 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:bc85:7836:468a:a1a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm180489085e9.13.2026.11.04.03.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:12:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1a89969498c359d1a140827ed6acbf92f89987135f1280b4d5669bb50fa6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 12:12:04 +0100
Message-Id: <DMMDQQGAJSRP.2RFOOW1YOKT8F@baylibre.com>
Cc: "Kendall Willis" <k-willis@ti.com>, <linux-can@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] can: tcan4x5x: Add suspend error handling
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: =?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Marc Kleine-Budde"
 <mkl@pengutronix.de>, "Vincent Mailhol" <mailhol@kernel.org>, "Sean
 Nyekjaer" <sean@geanix.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com> <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-2-7efa2b172cce@baylibre.com> <9aba5682e371f5969d3ddca1c6a763485bc25285.camel@geanix.com>
In-Reply-To: <9aba5682e371f5969d3ddca1c6a763485bc25285.camel@geanix.com>

--1a89969498c359d1a140827ed6acbf92f89987135f1280b4d5669bb50fa6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On Fri Oct 16, 2026 at 12:04 PM CEST, Martin Hundeb=C3=B8ll wrote:
> Hi Markus,
>
> On Fri, 2026-10-16 at 11:57 +0200, Markus Schneider-Pargmann wrote:
>> diff --git a/drivers/net/can/m_can/tcan4x5x-core.c
>> b/drivers/net/can/m_can/tcan4x5x-core.c
>> index a5b8829aa519..b69312413d62 100644
>> --- a/drivers/net/can/m_can/tcan4x5x-core.c
>> +++ b/drivers/net/can/m_can/tcan4x5x-core.c
>> @@ -575,11 +575,20 @@ static int __maybe_unused
>> tcan4x5x_suspend(struct device *dev)
>> =C2=A0{
>> =C2=A0	struct m_can_classdev *cdev =3D dev_get_drvdata(dev);
>> =C2=A0	struct spi_device *spi =3D to_spi_device(dev);
>> +	int ret;
>>=20
>> =C2=A0	if (cdev->pm_wake_source)
>> =C2=A0		enable_irq_wake(spi->irq);
>>=20
>> -	return m_can_class_suspend(dev);
>> +	ret =3D m_can_class_suspend(dev);
>> +	if (ret)
>> +		goto err_disable_irq;
>> +	return 0;
>> +
>> +err_disable_irq:
>> +	if (cdev->pm_wake_source)
>> +		disable_irq_wake(spi->irq);
>> +	return ret;
>
> Wouldn't this be better written in the shorter form:
>
> 	ret =3D m_can_class_suspend(dev);
> 	if (ret && dev->pm_wake_source)
> 		disable_irq_wake(spi->irq);
>
> 	return ret;
>
> ?

Thanks for your review. I personally prefer the variant with a goto. It
is not as compact but it is extendable if this function needs another
instruction with error handling at some point.

Best
Markus

--1a89969498c359d1a140827ed6acbf92f89987135f1280b4d5669bb50fa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCausTBBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlP6
PQD+LtlVjH3/wReXE9RPzwo6wtqTfo+QNCgoDCb1Raz8jGcBAPtyCB2nUPxKiL0p
tOVeJ7sfKgFNAASX6epFGzYIeAkP
=tpW6
-----END PGP SIGNATURE-----

--1a89969498c359d1a140827ed6acbf92f89987135f1280b4d5669bb50fa6--

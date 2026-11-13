Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572562;
	b=qc/e3wKbbloJNcsggYA5eiAzp7FqLcdGYUWmthBzBasHhmJes7Qw7J54NkBYwV+m+bh+
	 pgtYOzKW/Ly9Qj80Hg1TfoMTGhmq/5EtQsOe0iXQZFg1GVsNoWVFHLkc4x0ewjOp2luWX
	 Si/fwGVT5LZc7le2Cr6W9/clcMp50Q1B29MnAfmGYPuM6OQf8uN8JvHcG2/YRZ6pImhB4
	 g+B0kyRRUCTBoijW37Foojh61NPcVkCFVf50zxKwSbuobcHu/SdENEplGYn/T5lb5EjPA
	 ma7qenmyzB1qPugCljWw8CT5t8jFsJLuYXPdV76u//sGU+fq3tSa5LR4rmDJnziLqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572562;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=;
	b=uMTW9XPrWOAqRPs0g6jjXY9OlF3L77NyKIX7GFELiC19fOLiEX0mYyfdYH3iml6GkYkL
	 /A2FAvrv80tjInmYminuavG6s9qlWyRYZW5nJv4sJtBaCL4CI8CiQCfBepuj5hxxZF5ig
	 VHngZ0rCTNbXzd6NNi744SNqeV36OltdqAvX1/EPArt1h2Q5GLPS+P9K1qgL9y3fFVINO
	 qWHaMLZ8DNPJBoApkNLUXZltOlicM/rNuKohoAkYxFqdFfGivNA3VojAevnRc67IHDHu5
	 fwM5GBMoceu9kylCwnddiiV+pIun+MKQSbCTNhMDtDzoR50gWuyUD7JwUwAUA768jKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J61J2RlG;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F3606A323;
	Fri, 13 Nov 2026 12:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J61J2RlG
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2BF10D083;
	Fri, 13 Nov 2026 13:22:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794572555;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=;
	b=J61J2RlGRjEsEE6mYDlVh+W6EKAnBwQMCIPUPIH5V5wET80lOO2qzOauM2FK9+G9Ag2g68
	ZG7JTelmpH6iJOVn9HTxL0Mgx9L/ZigrBjyVjAOARyMJX3IHawEJ2RJ5XZIFWmhSqDSr7E
	Um+kdq6zBt1rDvK5Dk0ipM1ckQrbNb11VBnxQfVBqtabkue3JvwfWo37SoCP8fHA6/j1I2
	YoDoMVPToxUZcDexRhB2EN4JIgKrBeRW6IX786drIaxGM92xezYHGchkxe/7GiDPx7vdnx
	7ooM/pj4dc9GKdLI8ioQzBXjzpYhLma8ZJCf6IwyvzjCVEbfO4KAYo4DYMACIw==
Date: Fri, 13 Nov 2026 13:22:31 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113132231.631638ad@wsk>
In-Reply-To: <c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
	<20261113120947.6c9fb820@wsk>
	<c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

> On 13/11/2026 12:09, =C5=81ukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote: =20
> >>> Add "national,lm77" as compatible for the National (now TI) LM77
> >>> digital I2C temperature sensor.   =20
> >>
> >> Are you sure this is a trivial device, not like LM75? No
> >> interrupts, no VS supply? Datasheet disagrees. =20
> >=20
> > In my case the T_CRIT_A and INT are not connected on the schematic.
> > Moreover, the V+ is connected to board's 3V3. =20
>=20
> But they are there and binding should be complete.
> What's more,
> existing lm75 binding does not require these so there is no issue
> adding to the existing binding file.

Please be aware that internal operation of lm77 is a different than
lm75 and hence it has its own Linux driver.

It seems like I cannot re-use the lm75.yaml and will need to add new
national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
(lm75 has only one interrupt).

>=20
>=20
> >=20
> > Hence, the conclusion that this sensor works as "simple" I2C based
> > temperature sensor. =20
>=20
> Only because you posted incomplete binding...
>=20

I've posted information which is in sync with what I can test and
validate, but I do understand that I shall follow the policy from file:
https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindin=
gs.txt

> Best regards,
> Krzysztof



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264748;
	b=kAZl5lh+8uICbo4R9auG5Zl7f5MPEWq1xFwZS+p+GcfYo49sbLwnS8SlWT4KzqT8vEHl
	 Hat48dnSZiIHMUx4R3TwNOmnMX40E0aQbOct1tfDm+4TP7FRV1wa4UySRKn36t59NG/Hu
	 F2QMqI29d8cfxx1c6MkD0rYeLjttle/XZM1zBM1ETxn4C/ZI3uXVssUJ7XwM9S4Pntemo
	 8vSmEPviK4mbIRk0VwiRHTLIg/sj3gdUmnIktrBOP7hbvjnT09Yaf8viQ1LSRC0ccM3UL
	 vG494gTTD2X/VTvd5xMwqkiSpG52O55RGCTa7luhtkMbo5SdG8/bL1IrAGz3HqFol0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264748;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=oXz35iXIDdGnCFrTaO69Fo6Aj9mTfKBE0PXTwxvdqCc=;
	b=0zHFQ1WLbjoT5oOUJRSBbaTnXdbE1+Tjn2bS1Xfgdn6SDXv8Wq+YG1vT4SgKzpAxq4HO
	 AEWXObIMhK3VoDDt9J3Zfq22GsqkLGX3/tayxHQJ1jiuwtH5F4r396VvtmxsAvLKVJX1Z
	 18xh+X9FWkHzAbYSeAHoqNzQEtZuS1D/rWv92Fx99t/VH4npy8H4Gm9WlWTfAmO31lWY1
	 KICqtvLm8UxzFTTyew3Psq+3ay3yFJfDymCkUZO12t0phAMaN6cPDvm4/5qj1cwND1T/Y
	 zxuMbEFnxPMtx+ro0KqT2GDf3O4EDJZRKACZWSrAZjPNrli8nbfNFLTK8uQRZVksqdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MOTF+iFk;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA6606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFA6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MOTF+iFk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB7831A138A;
	Thu, 29 Oct 2026 09:05:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76A1960360;
	Thu, 29 Oct 2026 09:05:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6393103290F5;
	Thu, 29 Oct 2026 10:05:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793264742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oXz35iXIDdGnCFrTaO69Fo6Aj9mTfKBE0PXTwxvdqCc=;
	b=MOTF+iFkZ6s2UwV3iPDaAGhZFPho5OGAvuN0nmUbFwsQljFaJZTf25sMEdS+a3oEyHrWwF
	5MBvPJMJjf4CuQmN+2PO08mrSgwtD+mmoeA6eSN2QYjNI2ALupe9+CdiBWKoeZ2msbNO/n
	KcnVtbkKVcMV79IowIVESZDAEf0x1HERcDqP378mHNOT9k+uFnacXqMJNKDfzRGOosLzis
	+Rcmqw6svdkBuDU9GorhRb73v+5qrKiiHQigWV3xyWEAxQL2FvSmzPklnEUO7fesRoSLmp
	rXVPtvJcE0pwE0idrKdwSHwfWEbgXi/AEmidMYyC1aitTwUpbdwW1DnZEJ1XOQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 10:05:38 +0100
Message-Id: <DMH7AO649J2M.2XFQNV3VXL6UP@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>
 <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
In-Reply-To: <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

On Thu Oct 29, 2026 at 9:41 AM CET, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 10:39:23AM +0100, Paul Louvel wrote:
>> +          regulator-temp-warn-kelvin:
>> +            enum: [0, 1, 368, 383, 398, 413]
>> +
>> +          regulator-ramp-delay:
>> +            enum: [40000, 20000, 1000, 500]
>> +
>> +          regulator-min-microvolt:
>> +            minimum: 1000000
>> +            maximum: 48000000
>> +
>> +          regulator-max-microvolt:
>> +            minimum: 1000000
>> +            maximum: 48000000
>> +
>> +          regulator-min-microamp:
>> +            minimum: 500000
>> +            maximum: 7000000
>> +
>> +          regulator-max-microamp:
>> +            minimum: 500000
>> +            maximum: 7000000
>> +
>> +        unevaluatedProperties: false
>
> Place this line after description, that's the convention for child nodes
> for readability.
>
>> +
>> +      vcc1:
>> +        type: object
>> +        $ref: regulator.yaml#
>> +        description: |
>> +          LDO regulator for auxiliary use.
>> +          It can used to power, for example, a PD controller that will =
drive this PMIC.
>> +
>> +        properties:
>> +          regulator-min-microvolt:
>> +            minimum: 5000000
>> +            maximum: 5000000
>> +
>> +          regulator-max-microvolt:
>> +            minimum: 5000000
>> +            maximum: 5000000
>> +
>> +        unevaluatedProperties: false
>
> Place this line after description, that's the convention for child nodes
> for readability.
>
>> +
>> +    additionalProperties: false
>
> Place this line after description (for relevant block), that's the
> convention for child nodes for readability.
>
>> +
>> +  ti,sync-pin:
>> +    description: |
>> +      Selects the function of the SYNC pin, used when several converter=
s
>> +      operate in parallel.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [input-rising, input-falling, output-rising, output-falling]
>> +    default: input-rising
>> +
>> +  ti,ivp-thres-microvolt:
>
> Use either existing over-voltage-threshold-microvolt from battery schema
> or ti,ovp-microvolt from the other TI binding.

IVP is not the same as OVP.

>
>> +    description: |
>> +      Input Overvoltage Protection and Regulation Threshold.
>> +      It shall avoid any damage to the device in case the current flows=
 from the
>> +      output to the input and the input source cannot sink current.
>> +      This threshold is used for IVP (Input Voltage Protection) and IVR=
 (Input
>> +      Voltage Regulation).
>> +    oneOf:
>> +      - multipleOf: 125000
>> +        minimum: 4750000
>> +        maximum: 23250000
>> +      - multipleOf: 250000
>> +        minimum: 23500000
>> +        maximum: 50000000
>> +    default: 50000000
>> +
>> +  ti,ivp:
>> +    description: Enable the IVP feature of the regulator.
>> +    type: boolean
>> +
>> +  ti,ivr:
>> +    description: Enable the IVR feature of the regulator.
>> +    type: boolean
>
> Why wouldn't you want to enable these two always?
>

By default, these are off when the device is powered on and these features =
exist
only for reverse-current situation.

Also if IVP and IVR is on, only the regulation feature is enabled, not the
protection feature. This is a requirement from the datasheet. It is not ide=
al
and I should not reflect that requirement in the DT.
It should be ti,ivp or ti,ivr but not both because it is confusing.

Or:

ti,input-voltage-mode:
  enum: [protection, regulation]
  ...

>> +
>> +  ti,nint:
>> +    description: |
>> +      Configures the nFLT/nINT pin to act as an interrupt pin.
>> +
>> +      nFLT mode: The pin remains low until the cause of the status chan=
ge ceases.
>> +      In this mode use an level irq trigger.
>> +
>> +      nINT mode: The pin is asserted low to signal a status change.
>> +      In this mode use an edge irq trigger.
>> +    type: boolean
>> +
>> +  ti,cable-drop-compensation:
>> +    description: |
>> +      The cable drop compensation feature helps to keep the output volt=
age at the
>> +      nominal value over a wide range of load current without the need =
for
>> +      additional remote sensing. The cable drop compensation measures t=
he
>> +      current and offsets the output voltage proportionally to the meas=
ured
>> +      current.
>> +    type: boolean
>> +
>> +dependencies:
>> +  ti,ivr: ["ti,ivp"]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>
> Best regards,
> Krzysztof

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


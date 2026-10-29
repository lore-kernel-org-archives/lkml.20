Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283196;
	b=ygdVnt3e4HgW+9eAaAVSpLCjK8Aaw+m69BuY6CvRtDBKnaZkF6LwjH+o9I9pe1dRu/B2
	 Bvb0sWBkRbu34fsyynrDpbaPQ+J6URn2EFZpq2FwXPwqn/mPKwUdqHRS9EwENXeaWDfDK
	 cS7rOzfzId/AQwRyDI767+3cYO+qh8uKtsJDn1xk8U5gFeBP+9kuaJ+/c9h7afV+RJnh+
	 ZdTvbf/eV2xAwidsHQzaPUOAA82X2Qct2wjdusXk65k9arWuoi6eRN6MD0q3uT8dd7rvo
	 YKua9qVE3UTT/Mne7DXU6bOyd7UtUobKaUh9y3bAl2S+shfKf+3i+RGChnF/VNUT6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283196;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=iKi9fa1Klsxc3H4mM5m3XWdHRLpBfiA/5YAAlNBmJo4=;
	b=0ZI5e32GAezd4sL7URZ3Iflyev+IMo4z9JSli0zhYSK9whlTPxQBcfWwuTQg3ognJKxQ
	 Dn/k5n5D7owo/IsbbJ8efgRZ9FL8lZHZ7T6BsiATXFY8IEj/tDDBS8tOtdEn+fqC2/eVn
	 bxauDN371ssZfw3x/gUI3IZKq2zdAYOgzcWOAxXMIMtz0DBTU+wRhejBQDtpJoNPVtCZL
	 5KrdF1MQyDIhUxO4rGBO1qTIbNvMk2EPfM6i14th959HnBAlxaQqyaCwBkDg5/AwR173E
	 KRRrfqVDBoaJQcM5hRh/9iqddejArepzX5sRmH1QUeMqU+EriZ4Z1OBe8oKDG1NiW0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AihZAXH9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F401B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AihZAXH9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 867C51A139E;
	Thu, 29 Oct 2026 14:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46C5C60360;
	Thu, 29 Oct 2026 14:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C8C1103287D5;
	Thu, 29 Oct 2026 15:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793283193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iKi9fa1Klsxc3H4mM5m3XWdHRLpBfiA/5YAAlNBmJo4=;
	b=AihZAXH9+98sBSigsaRLjEm2rl2KxNsvqwbAyAnd17LltXefyuQSlUU69Mgb2/Hpw5Fkan
	Vt/EufyJcGdmT5wH3gVFrOn7mlh1NJOvc0RgrVQOtnXZ4CX+WF+nnFGh/BKwi/BDMpLGli
	1u9cRnhl5xY/S0QFABSjPHPwtnDwSHTN/f9c82pbqaGdM+48Fy8C/7gKEY4vqLujg0wS1B
	tPlh0kBbP4vhO6MVBRNRbF6ywgJSgYZaRdUFhqMVNUplzcvFGKb4CAM3klz/sgz0q7UsoK
	2NHMuWuMaTul4hqOo4xvlp1UMpGJmFmEXjQhNnaPiBJjEZGkfxHrKPBE8m/RhA==
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
Date: Thu, 29 Oct 2026 15:13:09 +0100
Message-Id: <DMHDU487Z307.JDRRJ5K8E53A@bootlin.com>
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>
 <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
 <DMH7AO649J2M.2XFQNV3VXL6UP@bootlin.com>
 <a4a57e41-4e1c-4c94-8b92-6b50f8321ee9@kernel.org>
In-Reply-To: <a4a57e41-4e1c-4c94-8b92-6b50f8321ee9@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 29, 2026 at 1:42 PM CET, Krzysztof Kozlowski wrote:
> On 29/10/2026 10:05, Paul Louvel wrote:
>> Hi Krzysztof,
>>=20
>> On Thu Oct 29, 2026 at 9:41 AM CET, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 27, 2026 at 10:39:23AM +0100, Paul Louvel wrote:
>>>> +          regulator-temp-warn-kelvin:
>>>> +            enum: [0, 1, 368, 383, 398, 413]
>>>> +
>>>> +          regulator-ramp-delay:
>>>> +            enum: [40000, 20000, 1000, 500]
>>>> +
>>>> +          regulator-min-microvolt:
>>>> +            minimum: 1000000
>>>> +            maximum: 48000000
>>>> +
>>>> +          regulator-max-microvolt:
>>>> +            minimum: 1000000
>>>> +            maximum: 48000000
>>>> +
>>>> +          regulator-min-microamp:
>>>> +            minimum: 500000
>>>> +            maximum: 7000000
>>>> +
>>>> +          regulator-max-microamp:
>>>> +            minimum: 500000
>>>> +            maximum: 7000000
>>>> +
>>>> +        unevaluatedProperties: false
>>>
>>> Place this line after description, that's the convention for child node=
s
>>> for readability.
>>>
>>>> +
>>>> +      vcc1:
>>>> +        type: object
>>>> +        $ref: regulator.yaml#
>>>> +        description: |
>>>> +          LDO regulator for auxiliary use.
>>>> +          It can used to power, for example, a PD controller that wil=
l drive this PMIC.
>>>> +
>>>> +        properties:
>>>> +          regulator-min-microvolt:
>>>> +            minimum: 5000000
>>>> +            maximum: 5000000
>>>> +
>>>> +          regulator-max-microvolt:
>>>> +            minimum: 5000000
>>>> +            maximum: 5000000
>>>> +
>>>> +        unevaluatedProperties: false
>>>
>>> Place this line after description, that's the convention for child node=
s
>>> for readability.
>>>
>>>> +
>>>> +    additionalProperties: false
>>>
>>> Place this line after description (for relevant block), that's the
>>> convention for child nodes for readability.
>>>
>>>> +
>>>> +  ti,sync-pin:
>>>> +    description: |
>>>> +      Selects the function of the SYNC pin, used when several convert=
ers
>>>> +      operate in parallel.
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    enum: [input-rising, input-falling, output-rising, output-falling=
]
>>>> +    default: input-rising
>>>> +
>>>> +  ti,ivp-thres-microvolt:
>>>
>>> Use either existing over-voltage-threshold-microvolt from battery schem=
a
>>> or ti,ovp-microvolt from the other TI binding.
>>=20
>> IVP is not the same as OVP.
>
> ... because? OVP is overv-oltage protection, so ivp is not input
> over-voltage protection?

Sorry, for me, OVP in this context was output voltage protection, and IVP i=
nput
voltage protection. I prefer 'ti,ovp-microvolt' but it does not really stat=
e
that this protection is for input voltage.

>
> Best regards,
> Krzysztof

Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


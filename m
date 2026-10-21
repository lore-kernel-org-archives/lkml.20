Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602720;
	b=SwJJUlCf0qgPRiX/VDrcHJVdJEBcOT+eKcz+qKxvneHH1trIeJFvnT/nvimP8vX61uHy
	 zwCWyl5MZL6f58FTYGkHV87FHv6LuZAMDIo4rPysIvmUP0s67A3itgLhhnYAYIL+xPZxe
	 C2QnlyDcFtQdJtrrHbHfLBCU5GB7Cq35yQBDG6bL5Uf6Ki3tJIdR7xV9oqj0nxoDN8xGx
	 cdbToK0WjApyhnC0jAmToUnvckPn/9pZ2JhT0sJY/2qka+oYt3KD5wdyl6QL7MWUkRp6W
	 fPixYjOYdEEXZhQTpqhOqIHll9XUbNqRqOvXIr8Z1b0nkAvcz27Fq/FZ8+t/yz3Q+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602720;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=1tnzbTVQ51uWZal+Jth6879qYR8Xa8UKPaBRBV/R8Yw=;
	b=5EGuO7OUYLmPxYeHXAGOcTYeldH5JHMdA6ipeO0yfOiUtj7yV8LzBZfcxnUeZlqo38mk
	 rWXgxP/STfaYrU+ojBKc9eQoy3F4Hgkn/URl4jeW59RoNom+w+YloPb7mrFHroTYplr/F
	 EOaesSePrgqcZ50kjlZQtKF7jVoOkhvEU4pTefWiPgvAF2qsfBP99NDiREPzmL6pj7UGC
	 9q7+K2bk+6/6uom7BhCtYrOKwCI+GH5t7i/w3p/001CconRqqsL3t4ce1Wi8k7s3X+Bkw
	 /SISH1FGwhFqCC9knBSfMLd0IuxLETbU8F/srdxdG2tGrdgVXOuXkkXHUJSishq2xCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FFPDORY8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0460A263E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F0460A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FFPDORY8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D11094E41266;
	Wed, 21 Oct 2026 17:11:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F01D606E3;
	Wed, 21 Oct 2026 17:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2218C103289F5;
	Wed, 21 Oct 2026 19:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792602715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1tnzbTVQ51uWZal+Jth6879qYR8Xa8UKPaBRBV/R8Yw=;
	b=FFPDORY8amXem0dXx+KM4QkcYhR4YxwcmnlvfN5R02wk3st8BP2sBZ8EytAUMvqU7W1+VF
	cLEsbeHGkcZnXyr9i5aftrn3eLTe4nokqn5sT6sWlx+PBFv3prmA/GaOOoCJ2OrZYkUU/g
	gTGgq0sbFmKONpet23SsyVRCYY9Jt2omxtxGpe22TVUdGD8KctUAojpZYvtgJzhd/I7f5R
	rQqiUUtlDK1cnFX2u7InHqX7oPqL1L/Dk5nEE3LEHghx7jzVdzR07p2ZR3k6vC9q2+UnW0
	B+f6ABGnRsNBOXq5pl9O6h4bxvF+6klq5m5HFm982uisSC/PlHhwZEYJqSAZUw==
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
Date: Wed, 21 Oct 2026 19:11:51 +0200
Message-Id: <DMAOMKRB8DT6.2DUZQCDZW47X2@bootlin.com>
Subject: Re: [PATCH 1/5] regulator: dt-bindings: Add
 regulator-boot-force-off property
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Conor Dooley" <conor@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
 <20261021-wind-reopen-490475bc470d@spud>
In-Reply-To: <20261021-wind-reopen-490475bc470d@spud>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 21, 2026 at 7:01 PM CEST, Conor Dooley wrote:
> On Wed, Oct 21, 2026 at 12:27:42PM +0200, Paul Louvel wrote:
>> Introduce a new property to immediately disable the regulator at boot
>> time.
>> This property is useful when a consumer device may query the state of
>> the regulator at boot time, and want to disable it right away, without a
>> prior regulator_enable().
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>  Documentation/devicetree/bindings/regulator/regulator.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml =
b/Documentation/devicetree/bindings/regulator/regulator.yaml
>> index 019aeb664cae..2da8f70d7e7a 100644
>> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
>> @@ -41,6 +41,14 @@ properties:
>>      description: boolean, regulator should never be disabled
>>      type: boolean
>> =20
>> +  regulator-boot-force-off:
>> +    description: a regulator may be enabled by default when the system =
powers up.
>> +      A consumer may query the regulator's state during boot and disabl=
e it if
>> +      it is already enabled, potentially resulting in an unbalanced dis=
able
>> +      operation. This property ensures that the regulator is disabled a=
t boot,
>> +      regardless of its previous state.
>
> To be honest, I'm not sure how the commentary about querying the state
> or being unbalanced is relevant to the description - that sounds like
> something specific to the linux regulator framework?

Yes it is. Maybe I miss something, does this binding is used outside linux =
?

>
> In fact, I'm not sure why this is needed at all? Can't you just change
> the software so that it is okay to disable a regulator that has an
> explicit enable count of zero?
>

Do you mean by calling regulator_force_disable() instead ? I thinked about =
that
but I don't think this is ideal.
Or just patch the core to allow unbalanced disable downstream ?
My intent was to provide an upstream solution to the problem I described in=
 the
cover letter.

>> +    type: boolean
>> +
>>    regulator-boot-on:
>>      description: bootloader/firmware enabled regulator.
>>        It's expected that this regulator was left on by the bootloader.
>>=20
>> --=20
>> 2.56.0
>>=20





--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


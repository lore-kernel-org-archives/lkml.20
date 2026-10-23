Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751471;
	b=0898o9t1blFCKLFkI0KGFo5FBA7187QLVWSebAXfYUQfqFjw0kNlBYlkgG+4l4Aq65dD
	 t93zFr947GSxMAeBz6EBitG1r0AbWNukoaRzPNgSwbeTs/SS+31eUKjFlkiaCRtASmVG0
	 90/JTK4BA0gQiYhItxhk9U8IvCxNo5hSpha5N8Kqz8f8XSdlDH1Msjhn9jWcwxPu91nc/
	 AUIaIBZKNwUnE4uy2rSSq4xLaZxq5J1x+LKKeHYH2/wv26q+RmU0WRGtRrDp0eC1OQfZf
	 /06/UWjHYo0deyYeYacGTZkRSJDpzNSSSaDOT7fTZQKY/Xu4Uo3a2Qes6ooxpatE4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751471;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=FFNqFEwFgmTg1p4Fk7JuIP0CoJmYr6GfqhYnioUfpek=;
	b=y/M00udJt6JZ//qa2BUeNCe9hIrU+LgLVIcYS3oAjWb2JBfbe2dtpEVAk7uJQgAgqm69
	 f/kq7BTx1eAakUvccRoxVXdFIiP+83L1IU2yDTKixPHuJ04AG6Pgip8HeyZof9kj4KKVS
	 4+jKNXCCbcSe86aC1eXV1ph6EYaB43OiyeDXLjIzkOhxeZUGN0mOWLHNEFlSH97Zr0rQq
	 2LI6NhKQL3sqT+H6BKcwOkW6ZbgFaFIx3yAn7uDdPEzSk4Z4fLbc8Y1cViakLbZSFYC5B
	 N2cIzjvHsxDWe2d+ksf2w79VX9oef7D4qOBJeSvVbkeD8S3YoyFE1BmoWzs+msRZUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nemdAz46;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF9606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDF9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nemdAz46
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C4CEB4E412D7;
	Fri, 23 Oct 2026 10:31:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75F1060398;
	Fri, 23 Oct 2026 10:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5022610328E3F;
	Fri, 23 Oct 2026 12:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792751466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FFNqFEwFgmTg1p4Fk7JuIP0CoJmYr6GfqhYnioUfpek=;
	b=nemdAz46S0wvbIsJF5IHrk7GnmqiwlkKubA/vyN4/7WPoWSRDeyLwqlXlST+DKI3P62vIm
	rqbMsVxmGXFrb5SVdTZkPsvLOAj66gZ/bzv8ucDjIaJld64vBWn6w8sHYMLH9UwfwoPyBT
	TjjfZh/aAtrHJoteNmJntWlyPmp5WS9BaJf7ZvBd7zDxG+hEd3nggBJ6Kni4DS63hz4Pw8
	K/FPcNCvzd7FXg7qREUELBX18UqmXouGnLJm+mEG46yiXu3tF5nU+uaPAmYYxvuXiNecIT
	/rNCGYCGJ9eXVarbyLc/EScAkmFF0U1o49b7bXQ5EqZKm3IzuV3/IfBLoArQ5A==
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
Date: Fri, 23 Oct 2026 12:31:03 +0200
Message-Id: <DMC5CSRL5BQD.19J2TWQM88FX6@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] Add TI LM51772 buck-boost voltage regulator
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <atoS4Rrxw_UIH_np@sirena.org.uk>
In-Reply-To: <atoS4Rrxw_UIH_np@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 22, 2026 at 3:42 PM CEST, Mark Brown wrote:
> On Wed, Oct 21, 2026 at 12:27:41PM +0200, Paul Louvel wrote:
>
>> static int ptn5110_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data =
*data, bool source,
>> 				 bool sink)
>> {
>> 	struct ptn5110_priv *priv =3D container_of(data, struct ptn5110_priv, d=
ata);
>> 	int ret;
>>=20
>> 	ret =3D regulator_is_enabled(priv->vbus_high);
>> 	if (ret < 0)
>> 		return ret;
>>=20
>> 	if (ret && !source)
>> 		return regulator_disable(priv->vbus_high);
>
> This is buggy, if the driver is not using regulator_get_exclusive() it
> has no idea why the underlying physical regulator is enabled or if it
> has the ability to affect that state.  Even if the regulator is held
> exclusively we still do reference counting for the driver so it needs to
> be certain that it never enables twice.  Outside of bootstrapping your
> driver's internal state you should neve use regulator_is_enabled().

Ok. The PTN5110 should take ownership of the regulator with
devm_regulator_get_exclusive() then, because there is no reason the regulat=
or
for power delivery should be shared with any other consumer.
Then making sure the regulator is disabled at probe should not lead to
unbalanced disabled because the core would have incremented the enable coun=
t to
1 [1].
regulator_is_enabled() can then be removed because we own the regulator and=
 its
state should not change.

The pattern shown above is used in the MT6370 TCPCI driver [2].

[1]: https://elixir.bootlin.com/linux/v7.3/source/drivers/regulator/core.c#=
L2521
[2]: https://elixir.bootlin.com/linux/v7.3/source/drivers/usb/typec/tcpm/tc=
pci_mt6370.c#L77

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


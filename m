Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983496;
	b=rMaQGzRBoTzLiMx+fXOIGhr8sA4+kGyIFQ2Arxppx2/VoaGlI2eJpkZ2sx0+gHll9fBu
	 cvw7a1D6nnymQYY6xQjIKSHoEk83QbTgwPTijY2NFypJn/lpGMtw6cODq7IjK5ftmHXBz
	 x2JM5PeS2yIxp6YP+LF5fg/VwDF/62Hkao+gEfRaMDnOLurbYHv9i65h7c0hFT3FPhzNs
	 zz4+tuRkl8jgWJc8Y9EdFD3jWQJ63uNa057PtZwGkdpS1UYopouS0Lfb9Ia24jNbm0UXw
	 t8CbBPkACVEqgwNs9iPT8EVOOrgKmNHEuIBL47m/mbLkSXeVtV7patlyTm0qxjaudcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983496;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=S7vUAwurxcIsMKz8lL//wcXwplYnwUYMhp7eqi+Ugh4=;
	b=OSefmYBvhfLIh5zza6Hzv2sw6D5bGs15/AcjRdWdt21o3+PLHrH6cNOVzDwN9+E+QWAO
	 1E03nG9QeES5yLCvEHXHk57bpySwhgs3Z4DJ2Eknqse/dZ2hT0E4C1i8WfuMesGhmQps7
	 UUf6xkAefOdnE3uAbgMnRo3VBNXc+/WHTiNiT8Aw83lMV/FmPD1+G+pdQfkGLaMtIi6+b
	 WHKbtWALMI0qLvT1g1qDOPKNZvem6ad9bwaExjDcdezv+rz64WLQ2g1Fo/Vv9XoUSu3QZ
	 MlI+rxBzsGtWebibLwlk2nAH5HVab7GUpmGyW8SlCvS+f/2JE3PlXIRfn5Y1JxgMX6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OhZRLBkk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C59606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C59606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OhZRLBkk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EE8B4E41474;
	Fri,  6 Nov 2026 16:44:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6388A5FFBC;
	Fri,  6 Nov 2026 16:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D2AE103292A9;
	Fri,  6 Nov 2026 17:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793983485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S7vUAwurxcIsMKz8lL//wcXwplYnwUYMhp7eqi+Ugh4=;
	b=OhZRLBkk+O1BMe8P+J4i5GoJBspPU4NrG0q9MBrII3RGhTWU2Z6ae8P80w/F7xdhCYhCbP
	n9JjvluNh0XQohTGnmgfMKwMI2xSFFk8OKoBQyJcawTTqzzqTdA/hYFln+fQ9h7MZLI+1T
	CfIaypE1T1gMLyacw0mWH+xT3tCq4SdXIE8JpQbTsPU6yRYz3YpbvlEFixc2eJWK+Zx6+w
	c+0eeINpRNDMCwS/+JsAeFHqdY5xx1iNFoeimK+A/+ZA9rX3hVNkondbYgyzgldp8liazC
	SQ5GYeBUe3kR5r67UZamicrIhsTs7KDhJ7A+EbG56e6L2R08oSMK1vfRgSm9RA==
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
Date: Fri, 06 Nov 2026 17:44:42 +0100
Message-Id: <DMOA2IJB4L56.1AIE3BMYG9QJJ@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
 <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
In-Reply-To: <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On Fri Nov 6, 2026 at 1:22 PM CET, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 12:17:40PM +0100, Paul Louvel wrote:
>> On Fri Nov 6, 2026 at 11:12 AM CET, Paul Louvel wrote:
>> > Add driver for the TI LM51772 buck-boost voltage regulator.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Sure, thanks for the feedback.
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


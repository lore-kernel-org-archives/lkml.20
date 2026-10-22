Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672773;
	b=qbptuhvUYsYkQkrsKvS9dEZlGON83OtJ0LUhmrFP5EIEX5G9vur3+9RV6x642V0Q06Br
	 y7Cu5Uifr6ZNV5+ihrSxwzBDAafymLawi/SUtTrMNoXzWOL/pUSawwS7kief6k12f04+g
	 Fbd5T0qvR7w+cwit1Jn/gtQErJXogxOGUFzqNRRNQYekmFtDXdSgBd7UyVkvKVIV3x+FQ
	 dLkYqqjrQ7BetOO2Jbd+WZqv3DObRn3369D389F8rPzy2iFJMyDxjliZZ953zNQnJVvLB
	 l3KEsmqj4u2bhHHs1T8DAsqDfM9mywBllet8r4O2fS6IFwwHVU4NABaFfgnnL6ZY+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672773;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=vr2qfukLrxjT0h6sozS6wYrlPR0+n8rkfwJQ3XNYr0Y=;
	b=pF3MjVu2+504w0L6BeE2PJ4tOW+GhjtUoK/uhJHWoxIVWdHOHJgDUGhtuhKbUQiC5naC
	 bfx2XYxyxy760acYPFs2PxhbJP2LFIQF7hiNK/4RGrdOk7peEcBEF8Y/X9i0IyStrwZ/v
	 XZ5exDf+ZkPDVcuGQe0E3a6Hrhib8xwUG2FaH51Yc0TYLL/oLFy7UqR7OdrvFRCnTc8G3
	 Hdj/X7hOgzRGore9+0CPUSuNEJCe7GWdklOGe+1wwGAXxeeiOb6Y4Bk0tvYwBGz5Zvox0
	 8N/BcXiQZRtmWBZggC3X9ck53q5DHYYs2KFK78Cyff5mW60MzzI12nnnhXCdFSzkHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rzJ+QTGM;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB71606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rzJ+QTGM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE7BE4E412B4;
	Thu, 22 Oct 2026 12:39:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80BC560360;
	Thu, 22 Oct 2026 12:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62B6410328F2E;
	Thu, 22 Oct 2026 14:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792672764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vr2qfukLrxjT0h6sozS6wYrlPR0+n8rkfwJQ3XNYr0Y=;
	b=rzJ+QTGM2KsPnMHhk5iYDr09q/fzMAFMWI04kaL+VbDQ6Cmk5MD82CebDoXwTenJEilayL
	+J3H+3TDuIwi9jPKjrtOw0MrK6Rr7Z5oNkClrW0gHEXJ2jKeZ+PDH5w28h3EmvEUseFHi6
	yS9LvGKTyXUbN5BZsRsH7ZOviG1GNWgWWlqGto4if9HPu/7UWA4E69Tqe2kx70Bry4OCgW
	7JlUChGu8PF04b9pqLdj9ButmrPdsnmDoT/T7QTTrZQRZHPE+pcbqDuIgqE+C0nEW6RLt5
	f+IMwuJ2F/A5j7aszvEH99Amm+JBpE6yA5zWC+dknaee8MOpLHBi7E/IXJ8nzQ==
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
Date: Thu, 22 Oct 2026 14:39:20 +0200
Message-Id: <DMBDGGZBYN60.37URQHQR2TS4C@bootlin.com>
Cc: "Conor Dooley" <conor@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/5] regulator: dt-bindings: Add
 regulator-boot-force-off property
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
 <20261021-wind-reopen-490475bc470d@spud>
 <DMAOMKRB8DT6.2DUZQCDZW47X2@bootlin.com> <atn_-NKv45AsROu3@sirena.co.uk>
In-Reply-To: <atn_-NKv45AsROu3@sirena.co.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On Thu Oct 22, 2026 at 2:22 PM CEST, Mark Brown wrote:
> On Wed, Oct 21, 2026 at 07:11:51PM +0200, Paul Louvel wrote:
>> On Wed Oct 21, 2026 at 7:01 PM CEST, Conor Dooley wrote:
>> > On Wed, Oct 21, 2026 at 12:27:42PM +0200, Paul Louvel wrote:
>
>> >> +  regulator-boot-force-off:
>> >> +    description: a regulator may be enabled by default when the syst=
em powers up.
>> >> +      A consumer may query the regulator's state during boot and dis=
able it if
>> >> +      it is already enabled, potentially resulting in an unbalanced =
disable
>> >> +      operation. This property ensures that the regulator is disable=
d at boot,
>> >> +      regardless of its previous state.
>
>> > To be honest, I'm not sure how the commentary about querying the state
>> > or being unbalanced is relevant to the description - that sounds like
>> > something specific to the linux regulator framework?
>
> I'm fairly sure this is about masking some driver bug, a driver should
> never be disabling something it didn't enable.
>
>> Yes it is. Maybe I miss something, does this binding is used outside lin=
ux ?
>
> Pretty sure u-boot uses it.
>
>> > In fact, I'm not sure why this is needed at all? Can't you just change
>> > the software so that it is okay to disable a regulator that has an
>> > explicit enable count of zero?
>
>> Do you mean by calling regulator_force_disable() instead ? I thinked abo=
ut that
>> but I don't think this is ideal.
>
> No, you should only be using that API for recovering from catastrophic
> hardware errors where you're cutting power to do something like
> preventing physical damange to the system and serious disruption to
> other users is an acceptable cost.

Then I think a straightforward solution without any core change would be to=
 call
regulator_enable() and immediately follow it with regulator_disable() in th=
e
consumer driver's probe function to ensure that the regulator is in a known
disabled state.

I have considered this solution, but it doesn't feel quite right either, bu=
t
neither does this patch.

Thanks,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


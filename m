Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837388;
	b=I6qN63jTEW+enEVBEKLsarpPklElcT439roJRveWh8I28TNijUmuke1IujS72dl01+jo
	 U4wZ47tJlh+hC9ffxob9FYDOeO60X/H/gG/xnI1YETVGCzb6/H2yb62eGQJo2pxXGODqm
	 NldzheeHqDmwjcEkfHJVEoH2Nt1/Qz/avNMEBG1Y1a3DZwZmcrPKu24jV4nyOc1B1TuqZ
	 WlgHHaZT7ypllF7Psv0Wh1m8kPYoE9AuHzaUd6UyXI25bQgzoBmngWW1uig0SfUqZBGol
	 4kDWhKq+YlAhnDYIopCvQbevFLACcZrZZPeBk8Fk/yMFMlT2qtQarooxLcYA/nUMo3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837388;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=lRLh+6ly/zzKoywkZKGuB1GGj84cUkixJQdHrkjHSDI=;
	b=seCXnJzSlUL2Nzc3Dg2BR9tfbtstBcincRT5BG/mVjmIvu6lWNqWzO7cfKvH1brKuQJv
	 5hlm/LzCkLvoI2EynevklwdUea/NXe038HTqB96qFtvCdOjN4uW48Uri4S3Jc6AQdI4f7
	 fahANQy06gmzlJjL5mP+iMh6eWgwmnRfKGpz4zjyS4NdWVklhKNA4VBuuyOpX8wbNfDgy
	 MgPHebDgJ8qNTXtlZTzuQKAuPSysH2xSiba+YrjDw6anNqhOmUZ9udgc7bBguwKBmpUaY
	 OyKxIy9rBcmpLekphqn3TybH/6yaEQ/3U4MjhmTBM0X8NZz651z9+j9rXf5I1oRn8bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UU4rwlcq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C068606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C068606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UU4rwlcq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C74D1C4EFD7;
	Mon, 16 Nov 2026 13:56:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD6436023F;
	Mon, 16 Nov 2026 13:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9801611BC051A;
	Mon, 16 Nov 2026 14:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRLh+6ly/zzKoywkZKGuB1GGj84cUkixJQdHrkjHSDI=;
	b=UU4rwlcqjirfQp7/rZvYV3fF/Eo9GbwHtJ54CuOcxg87TpP36NfPrWr9BhCUWWEb0cp06T
	KcJGSg+JEUZeB6kMhgBNP8NaCgbzGr0OFdq/lNw70lKM/TX9lSSGf8+QC9yxTOLuzHW1v1
	y/k1lEPAEP08cbpDIoN1wUwcWEdyepaBZEjSNQTMObIQ1TeUHcZwed00oHrW+aHtbmzKCH
	03Jdoc4miFHVQurIg7Yh4vDeF2b9Omy4SmBVaCfxFAStZqWQmUkJHVeWu0cibgQnfgpk8M
	rIMbrnxzxfZWmTsxB+8TOT3o1Qgfr8Aunb6JDQojaQkAgIyXmsZV28X1j2jS3g==
Message-ID: <2a117360a6842fd3b1929aeade3b05320c9ad4d8.camel@bootlin.com>
Subject: Re: [PATCH] clkdev: Improve clock discovery with clk_find()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Nov 2026 14:56:23 +0100
In-Reply-To: <20261103084915.8405-1-paul.cercueil@bootlin.com>
References: <20261103084915.8405-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

FYI I merged this patch into another patchset (of which you're in Cc)
called "ACPI: platform: ACPI 6.5 fixed clock support":
https://lore.kernel.org/linux-acpi/20261116135217.37038-1-paul.cercueil@boo=
tlin.com/T/

So that you also get the context about why it's needed.

Cheers,
-Paul

Le mardi 03 novembre 2026 =C3=A0 09:49 +0100, Paul Cercueil a =C3=A9crit=C2=
=A0:
> With a setup where a clock provider registers a clock with a device name
> "mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
> not actually return any match.
>=20
> Update the code so that we can support this while maintaining the
> existing behaviour:
>=20
> - clk_find("dev", "con") matches in order of priority ("dev", "con"),
> =C2=A0 ("dev", *) and (*, "con");
> - clk_find(NULL, "con") matches (*, "con");
> - clk_find("dev", NULL) matches the first case of ("dev", *).
> =C2=A0 Note that in that case we don't handle wildcards for the device na=
me
> =C2=A0 or it would end up matching everything.
>=20
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> ---
> =C2=A0drivers/clk/clkdev.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 919fc680ae4d..ee6c0afd6ec0 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, =
const
> char *con_id)
> =C2=A0			match +=3D 2;
> =C2=A0		}
> =C2=A0		if (p->con_id) {
> -			if (!con_id || strcmp(p->con_id, con_id))
> +			if (!con_id && !p->dev_id)
> +				continue;
> +			if (con_id && strcmp(p->con_id, con_id))
> =C2=A0				continue;
> =C2=A0			match +=3D 1;
> =C2=A0		}

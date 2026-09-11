Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EBB47799D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130738; cv=none; b=BT/6OXWvjRBN+sAvqHpKdL5b725lIN1UiwUXF5AHHg+pp3B1V1Wy8hov7qlYH0nVeYmXNqXqTYhxLiTu3RX9ii7CKzXD/xuUChpiw9DFKNwhC5b9iizowLw9+HajTORPvOCbCJcNsAuYFgAlsDmomDWGfGYG03vLO8TM+QBc2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130738; c=relaxed/simple;
	bh=QmKZIN4Z92+zljhew/dIODvISIyogRhyBnYCq41Nsv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BpSS09tK+86p69kHC1219V3CuMX3cqMOjkLFBPZ9poGZ6GD2rTEMvWs0g9BJClsRVEjAXOiFYgBQIbE4UMxRvBVXpOEqJvKGiRP/pFeldvNzYp1C9wfvp2ibcSvPsEiumWS4dTiEdbpMf+OTxQIZxr+5tVmlm17hFtCP4YVUhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JWnIE9R2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JWnIE9R2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D9AA94E401EF;
	Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DF20601DE;
	Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C7F211C7AF8E;
	Fri, 11 Sep 2026 14:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789130731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KjBGGwR20vQiI0jIm/6+LCpumwMENqAyvKhaULfuQBM=;
	b=JWnIE9R2695Os1cP34Ko1AFn6UyQ7adbR0kCQmuqHK99TUwEHndhQoniIsuTsCQeoY3Dtk
	NZxAOZLcJofMGXQA+bH0EiLOOhYRkREe5Y1gCeuG8XCxtgzDhi7XWsMtcB9pg8lyFsTqSX
	hKfVDZGvXIyp+7mcOBDSEY5EqFy/plyJvN34ZxCs+0z/xyPm3fqzlp/m942xkrUw73xFk7
	7yBh1Qn9QNJ4gzOYPCYM+BkxR5ocyNozj4uQFf+spHEO2mMp4rJVkDtcHdpvnYnMD8vmQz
	WdUR5OZM069m6/6nP1mLEwbvDQgCqdU295YqcCaF5hJhe8ywD6awR3ErwU4DHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Michael Walle" <mwalle@kernel.org>,  "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>,  "Richard Weinberger"
 <richard@nod.at>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  linux-kernel@vger.kernel.org,  "Steam
 Lin" <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,  "Jon Hunter"
 <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <20260911105245.408171F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 11 Sep 2026 10:52:44
	+0000")
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
	<20260911105245.408171F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 14:45:19 +0200
Message-ID: <877bksq7mo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Michael,

On 11/09/2026 at 10:52:44 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when
> read_sr2 is unsupported, leading to uninitialized stack memory use in
> callers and spurious -EIO errors.

The annoyingly right Sashiko robot is correct :-)

The best way I see to make sure this does not appear, is to just add
this fallback to make sure when we read both registers we just get zero
instead of random data in the buffer. Again, the idea is to make sure
callers do not need to be "QER aware".

--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -867,6 +867,8 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *s=
r)
=20
        if (nor->params->opcodes.read_sr2)
                ret =3D spi_nor_read_sr2(nor, &sr[1]);
+       else
+               sr[1] =3D 0;
=20
        return ret;
 }

What do you think?

Thanks,
Miqu=C3=A8l

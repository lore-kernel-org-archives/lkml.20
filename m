Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A232874E6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148970; cv=none; b=kx237tdnIzeK83b2snlXCpgH0M2WjAj4BZAmt61arCrWAvJHCaKRDqt2/ytsJ/WaKfzC5AbBUbAVRT7Pv4gBVIDcwZTmRRnytsBaROLIpNfIzT3whOChRdfnGtsO1cW3fAaXgfpLC/LUUSUrHNOHiOL893ao7S4bftJXBrNvGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148970; c=relaxed/simple;
	bh=WmWYV2k7FqhwmLYzxQ1/5AjtdXrLIU9ft5LFmuWJHGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jODefwvPGVYUygND3y/5DzVvE0Y4+lC7JqfTJde/uKYaD7KYycXwEEGA7WUHxOlFtdLDHjUQ+ae8Ly2/w0tJazRl16SOAmM77QNXg/iE9emSv2EDF2+So627GnxGNlXtRi4goizig89131ftCNL930h3EDE+K3IHu2mCmdOD5c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rTXxDP/4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rTXxDP/4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B72471A113A;
	Sun,  4 Oct 2026 21:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88600604FE;
	Sun,  4 Oct 2026 21:22:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60E1410328384;
	Sun,  4 Oct 2026 23:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791148966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WmWYV2k7FqhwmLYzxQ1/5AjtdXrLIU9ft5LFmuWJHGU=;
	b=rTXxDP/4cfRx+uJwv0cpboAYbzMtPt7OkQCiMndnI+f3I8/NzhH9sGnGuxCghbQyGJKpne
	19QEoOvreRwwBk55kvsRIQlWgQfiZQIcL/3n69SrojNtuZjegjmQD/TSDoEliQJGZqRXCf
	3PMbhlMwqjqiewKJZ5wU0ujYxhE841i1H3Wr6TvFZzqg09Jxs9IRf0q/1lKJCu6BzbQgui
	8wFUuctckV4GOj3e7lPkEIr2NlCmHD2ORXN4Wo0rNCBqzWMuuw0u0Vx8MIAUjS4nVCl8Sg
	VkLDj7K2nK5SBWsOF4ldsKFX2VMYllOLDEdOLYnXapeYhdRWM3ZVR+ftv/qWFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Richard Weinberger" <richard@nod.at>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Michael Walle"
 <mwalle@kernel.org>,  sashiko-reviews@lists.linux.dev,
  linux-mtd@lists.infradead.org,  "Steam Lin" <STLin2@winbond.com>,
  "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
In-Reply-To: <20261002123432.42F6E1F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 02 Oct 2026 12:34:31
	+0000")
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
	<20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
	<20261002123432.42F6E1F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 04 Oct 2026 23:22:41 +0200
Message-ID: <87tsn1i2ji.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 02/10/2026 at 12:34:31 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] mtd: spi-nor: state leak in spi_nor_write_sr_ll() due to
> missing WEL cleanup

I don't think we care. If the chip fails here, we probably have a bus
issue. Write Enable guards very little anyway.

> - [High] mtd: spi-nor: 16-bit status register writes erroneously
> rejected in 8-8-8 DTR mode

Not a problem with octal DTR chips: there is no "write sr1 and sr2
opcode".

I will disregard these two comments, unless someone asks me to take care
of them.

Miqu=C3=A8l

Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208464A2627
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343345; cv=none; b=p94fG8SjBHfyBSXCgOb27L15EW5DghVW3YGYvoVLAzbOGsXr2iUozTIbNGP+V4yRYeZVN4IBhfSM/hr01JWX0/cyptYYXwN7+9Z0NVx8xjMghFNQwRi0Zs1IOLDExzxxI29H7Yv/mgZqJRj2D1Axv1W4fC5kdN2yR81NLWnPfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343345; c=relaxed/simple;
	bh=yPKT79/4L8akVaekTApPvzEAYOIsi09R+7xf+tSfUKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JJrR1nvd7DFT28O/zHPKmkMwrF9p/xfoXvzLUj1uh5P15gCpos0HKWYpQN56c6V0pGrzKNkjlTISrq2VYHfCBb8V1me6WBSDuAH1H8hULOMel1MPurKlboEYGNYYr+5N//LTX0OTlm4lO+QIEfdNFy6YZ8FzdYsbirmRfCQjjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EivssIu2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EivssIu2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45558C653F4;
	Fri, 25 Sep 2026 13:36:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 683CC6073B;
	Fri, 25 Sep 2026 13:35:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A18410328BBC;
	Fri, 25 Sep 2026 15:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RIgFQa3K9BMUyYdYoij1l3EaF6VOi89oVBTPQ0Z1Exk=;
	b=EivssIu2EVRljDYUooK3tmHhzq4bDIYJz91uO1olWpEsh5oE7xKQIox/we/vSRNKJFc6Rj
	rpkrwOWwLvRbrIhjfjDgcUFWQGs2hPRMnZikIhlZNwatfQgOOmMJoj1VkVYXKOENpjgCvk
	k5vRMckHWgnHC6z/O4nn8x2oSgotWlwabMifmZf9vAc7/6X+2vY6kz+sh7rgwM/GJHfN+U
	abbG5zT1gXlVxXxc4hsK3yN+duVZGs4n9N68fXh1CBQJ8VJCBSOSUv7sSkk3a+6mvSegtW
	1W6SQV3Y4PDYw+8bK9ldb/4kBsS0w0VYXbtifXRzNqNColsLpl0psTbLPdJlOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
References: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
Subject: Re: [PATCH RESEND v2] mtd: spinand: winbond: Add support for
 W25N08LW
Message-Id: <179034334048.1124555.11337705616716481308.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 23 Sep 2026 14:52:29 +0100, Nuno Sá wrote:
> Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
> 4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.
> 
> The chip reuses the KV ECC status helper, but needs its own OOB
> layout because the geometry of its spare area differs from the
> existing Winbond parts. Only half of it is visible while the
> internal ECC is enabled, so the ECC region is reported as
> inaccessible and just the free bytes are exposed.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: spinand: winbond: Add support for W25N08LW
      commit: 01947ecc37bdead7d2e1f199185b936820b90eda

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


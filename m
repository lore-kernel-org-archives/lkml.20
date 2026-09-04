Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FD51A743
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545347; cv=none; b=Tmd+t0Sh+91TDm4b2S/qXJcJ/aNXGkM7Fo8UDAf3Nq0RWbI8lggr/wzlTCFk/nEM+iskIht+7EaUcq+JxkPAzV3rulF31JcMt4D4lRrWjvalbZx3ljIYyyUNN5XDE7kr99DhkTkndYsuw9yE7oie/M+C/I7ZuNlVtCXHhtlz88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545347; c=relaxed/simple;
	bh=swWNr1Is64pY1jdbG1EkIblvKqbltVE/Z7tNxUYT7dE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rp0KT/i7fN+aPI7W7XrGdnJkzFpjR+zBjEKS1rBJDXYVepI7gL+l7/u0KJceiW0FNtKhXORp1obRpDXsXVcJC8wHAtDyLelfBKTCp+NNxUMoZ5QsYqQDnUoM4oC/N2n1zN7eS6gYM2Esyutj77BhLvLioMQvZzbsk3l8DQrz+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RqviBPBR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RqviBPBR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6D644E41521;
	Fri,  4 Sep 2026 18:09:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 834516057F;
	Fri,  4 Sep 2026 18:09:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E8F111C78158;
	Fri,  4 Sep 2026 20:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MOVPy3AgFrv9YPxzdSMscEhii/3DK/sQJymlGxte/xY=;
	b=RqviBPBR/oDEpRKg1xTzhc1idFKhKBgX3wMGDVFSlIjM2rEmI/KeZfCDj4xprblmP74mF9
	GD9i31Rs0Zvyzf/QKvRt50j9cKd+oCr1x4qSFFSE1f0XpzzO2dSD71Lv6Bt/qCQaC1wtSE
	4cTl+T6AxpfE8ysAil9NoRcO27PWgCmKrxrlfsq7eXMNY3/IlR2tN+tR/0mfvxCp1u+ClS
	GElgmH01J9QnIxorethRywY9KlbRNcIWVcMrOa26agNx2HImcnrbhKgXU8jFgJPSJTm25z
	y2PasYzVplJvjHcVCKLlY7sxWtoIv2LkKDyR8FpMK2Zr343NdmWHluxVJx/ucA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>
In-Reply-To: <20260817-w25n04lw-v4-1-1b19c2a629e5@atmark-techno.com>
References: <20260817-w25n04lw-v4-1-1b19c2a629e5@atmark-techno.com>
Subject: Re: [PATCH v4] mtd: spinand: winbond: add support for W25N04LW
Message-Id: <178854533780.1533016.9237523207335099293.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:57 +0200
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

On Mon, 17 Aug 2026 05:29:17 +0000, Dominique Martinet wrote:
> Add support for Winbond W25N04LW 4Gbit SPI-NAND:
> > 1.8V 4G-bit
> > Raw serial SLC NAND flash memory
> > Dual/Quad SPI with 104MHz
> > buffer read, continuous read & sequential read
> 
> Highlights copied from datasheet:
> – Page size: 4,352 Bytes (4096 + 256 Bytes)
> – Block size: 64 pages (256K + 16K Bytes)
> - Built-in 8-Bit ECC for memory array
> – ECC status bits indicate ECC results
> – Bad Block Management and LUT access
> – Software and Hardware Write-Protect
> – Power Supply Lock-Down and OTP protection
> – Unique ID and Parameter page
> – Ten 4KB OTP pages per die
> – Read Level Setting for Read Retry
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: spinand: winbond: add support for W25N04LW
      commit: ea609469a3e37fc731636c7be6bc3e8983b2070b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


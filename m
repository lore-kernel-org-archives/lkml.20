Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925398;
	b=yefZyhDNGMRgskpAlL1HQbZ/dvAGtpfHoZfsqYV+ms0kqTWdoHxO6i8p9uLpiCTw4C4R
	 55VYFfwBJPR8zaGa5KXdAwdeGMkr9EpQfsqE2jfpvJNg9l8H8os6CMNFWnii8XonqmCtS
	 mn3ROJIh3vC9SYk5JzN9mcYNROJqondeuIAGxE0aH1Hs2YZXtkT6aLr9v7Pg7EjIFiE8q
	 S5U/6yAC9O3FNYCalBk5paCdTFGujVf1hyMahqhGHZ54VhDqXAXeI9HPFi0YRYE88RlaN
	 gBg7gUc8wtunPTYT6Vy5f6aJDoMueYGoNgV/qKLfWjHosxN20Hy/vgWA2BGmUKAAdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925398;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=lDjARk/TKyIY+6gtL116fhoYJSM5rMVECdu6F8I4r+4=;
	b=BkhYuqg3tgqYk6o3eWQ4G9ildbYA+wdTA4ZlS4tSizOle9U3gacCbElOKJ3a1IOpK6mu
	 B4Db9+p102vvI5cSGiQF6rrq9nyuMJexZ26J0vvJHMLDrbvab0bAi+9FhJRA60ZM66M6S
	 BIc+lifKmm7NMi5OjGkJJvoLZBIgBkSG5EfN6QtVdI+MknOSTepRS4GvEQm5ytrG91HmX
	 n+rnvwtqAAonOLErH7NYE38c+ZksIyHK52C1PryqnZ/rjFtiV4xG6ublXDi41gn8WrbAm
	 5BOLke+cPFnbZz8jzh4ii531yqNvyGGm+CbCUwDCADXM4IpgAkmrHwe25Iib6Kzu3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rEgKSgR3;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142E606A882
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E142E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rEgKSgR3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A49C64E4158E;
	Tue, 17 Nov 2026 14:23:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73E7F5FD6A;
	Tue, 17 Nov 2026 14:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9011C11BC0036;
	Tue, 17 Nov 2026 15:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lDjARk/TKyIY+6gtL116fhoYJSM5rMVECdu6F8I4r+4=;
	b=rEgKSgR3HmsgCjrD9Glac4eEYmkrmRhJo9Wlm1GNMOYokEdZXKiMTvUNhvsySo7//fyWfU
	L7hP6iftSft1hD63K5jGUrlAy7rfgWajarckzBqtigwGvjfHAP0xdnb++nz9tV01eS8xuZ
	jX4PVtxc6dUTgbXMVopp3uBjSX6UbFIkGJzOCvXAnej4phm8iRzpbN69lgHZW0FBCuQwyg
	aOp1Vn19CVePK98+zpyuZKLVlwosthW5mCH4C1AGfQCjVlOS5DbCjOt2XUXdKpai/kXx87
	8J7IeA+245B1HRawhIhSLTwL/22jDo94KiodcsCCUzmMHJdi346mFonDGX+VHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261013224134.42967-1-rosenp@gmail.com>
References: <20261013224134.42967-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: drop unused controller chips
 array
Message-Id: <179492539251.2259780.17318669528209958816.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 13 Oct 2026 15:41:34 -0700, Rosen Penev wrote:
> The chips[] array in struct fsl_ifc_nand_ctrl is only ever written to,
> never read.  Remove the array, the fsl_ifc_chip_remove() function that
> cleared it, and its callers in probe and remove.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: fsl_ifc: drop unused controller chips array
      commit: a84609cd5d50d7e21bdfcc397b3677e04f4821fa

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


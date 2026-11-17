Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923289;
	b=qIkMJUdDSC8gGqcGGgwwDrcNO8gGiibZvTdiHW63L7XcY///3hdJRzuXcUjfz9ZZtlf9
	 zhTubJHt7R4sGOzZMjSOIC56lU0IIPA6G23yb5oTjYpJqixUmhQZHqk3L0CB7Pu+NXCWW
	 M1fKPlJxMGKbfsrTxPOkW5CYjNywCwI81sHKpQJMOCwiWCXUxlLgqrJG3/XOCNmtNPpgW
	 PodZJIxhnKcKHdbb5IKq5zwkQCRfIeAFkmGRusXtgCsUMgz0ly+t/FO/3iTfsMms4XeDK
	 WnDT9/+4v1UFZOYlc5xWou6xHPvTCTK6LoLepfHN19we7bS1h3aZhCO/B6k6x6IDmPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923289;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7/No6nm3VqZ9ub4pTP4Vx+ggz6ddHlidtsXKbQn9Ewg=;
	b=NvdNO4UcJUhW4WxVMjg3NzVVeEyi9zxvp5DU+nU3vtlXPbnOIrJ6fPomiw5OkxTza/yg
	 FpugxAbR6CT1Sg8R8pZjn38G6VphQlj5kEt5EsHkbbHXNZn7FMPZx7GjxirqfnSSBIBP8
	 4UslvY1cpEPL+391gdGePCHTIN6TACiEI2UVTtkLy8FSSKaFS/l33+Dtzw90nkn2XoioZ
	 3kP/WqUwvnol/hHdqP4Sw6BqaCzUN8YRYs8n2jRA5U8YZF23lNzoRQ8wOgsG1KZjCSu+y
	 CSdhtWuN1Tp9hk+Lssi6UI0PiiQZC46tQGRTG6IWa7bK4BdE/kAHA35BITblvKdoqEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f4QlBeub;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27543606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27543606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f4QlBeub
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED420C79A97;
	Tue, 17 Nov 2026 13:48:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5925FC81;
	Tue, 17 Nov 2026 13:48:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB29811BC0035;
	Tue, 17 Nov 2026 14:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7/No6nm3VqZ9ub4pTP4Vx+ggz6ddHlidtsXKbQn9Ewg=;
	b=f4QlBeubnp8VPMHsOVjX7Q/rNIf1MSd8ACw7ZHi5A19vl0WJQJRqHQgD40zUVcQfwaehrx
	dpQEpm2RPnGDFxlw1iHouNUNwcCJuKSB+4mbgvSJz7OfSw1ZYqnPMTrfkEtiK99qFtI3JJ
	QRMtwLNZGb6Vt016szGxhZ5jt1y289kIHQK1ZXGKYkq71ZXlhXS5Sdcl5ty0HE4x0waPGH
	aUPsra6Tg+Sqo+QQmpIeL5TlhxoECfQy0K2xUndU367RAUtx41aFgLAjH/P7I9y2TipAJW
	7SzTE9PcojspodMn4yKzIgB6NxeVhEJlpe4hayTGr1HCqx7JwLDdxSrpxcTI0Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Shuai Liu <847807867@qq.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, 
 kevinshq@163.com
In-Reply-To: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
References: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
Subject: Re: [PATCH] mtd: rawnand: samsung: fix pages_per_eraseblock
 calculation
Message-Id: <179492327884.2243972.14920457693822487919.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:47:58 +0100
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

On Fri, 23 Oct 2026 16:16:07 +0800, Shuai Liu wrote:
> In samsung_nand_decode_id(), the division by memorg->pagesize binds
> tighter than the left shift due to C operator precedence, so the
> expression is evaluated as:
> 
>     (128 * 1024) << (shift / pagesize)
> 
> The shift amount is at most 7 while pagesize is at least 2048, so the
> integer division always yields 0 and pages_per_eraseblock ends up
> being 131072 regardless of the actual chip geometry.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: samsung: fix pages_per_eraseblock calculation
      commit: 9aec4c3b18530bc936eb339c96ea2258c4aa50ac

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


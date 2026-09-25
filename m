Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C273332EBB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343356; cv=none; b=Z6f2x5uh5ZeT4lrhX2+NoYYTvTHNuY0nLLm681yCZfah+4Ey69bGV7E2apgWPP60LsaD8wB81O0xgWoZ0B9DUcBnC84Sx3iUjXVsofddRet396+3022FaZWS6Hw3tFlyS6nKuDu7+ascF4PFZkmwlX38ZV19h85Kj9fFom7sd6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343356; c=relaxed/simple;
	bh=39q6BEjpZgezb53mT5yStqXJgjlzBiG6igM3ggKvPzs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A3Uxfs++qdzT/c7CJP4AOFabDSWITKok86ko7ulEDiNaYspuxt84+G240UCzu615tvInTXmiOhzn5TS5iARZue8BjZuMfmRtBwf838eXvWUl4ZGjAa3KWHXEEPZnQPRqqBj+9qFBgigACG+4l4C6SKBFFsILME/iLYU6V+jgFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aaesvga7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aaesvga7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B696F1A101B;
	Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A25A6073B;
	Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D26AA10328856;
	Fri, 25 Sep 2026 15:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BoExT3wMYMTBTdfD+8f471BMXyCUHpLSXmvrC16wwjg=;
	b=aaesvga7LKpmdbE7hg1CIA3w3a62rD7qhECgEcpbj1rTBAspSol6+7QvHK+hqiEgK7AHcA
	TrCF/8nKGg3Y3kRPO9EXE1NZQT6TjJ7Qe6ZO3Y45akXC0YLXBpHidyYEbnPCz87QIzw746
	KhNILil8KKxUk4OumSskxQEMKhKc116yZ27BTkQhM5zT5GrfGOcs23Pb7e8fPeJlYTPzff
	ZaeZBr1xk9Ogljx+XsCx0FdRwCsaaKoZ9Fra6XrGm+7CyNt7YQrRuCigysKAttcapVFfCZ
	CrlQ4dBRT/tX/H0XhYabFDZV3jCrV9cKOOoQMNgyWxu72FPclY1HWakYptmREQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
References: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: drop stray empty line from
 struct 'bam_transaction'
Message-Id: <179034335167.1124555.8908415916892946013.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:51 +0200
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

On Sun, 20 Sep 2026 22:16:18 +0200, Gabor Juhos wrote:
> Drop a superfluous empty line from the end of the 'bam_positions'
> structure group within the 'bam_transaction' structure.
> 
> No functional changes.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: nand: qpic_common: drop stray empty line from struct 'bam_transaction'
      commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


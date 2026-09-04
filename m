Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694D511187
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543480; cv=none; b=VXwo25r6GuitavjKBOKNPUVMlzG1o15zEQORuzj8eiDWRjwUMV3xRMVX7iKbWrrTJxDEajQzoKnxgOdW1OSVvaLYD0eP1d3jOiwKVmks/VsukaVpHD+bSJZUKlCvw4Bqy44U3A0W/On2+LKUawHK+O7HCm0KpQHXwHn7c3w+PtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543480; c=relaxed/simple;
	bh=IiKpIb78OuaUgZYZhZ32BfQqeunq1kdvpm8jWyRnizQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bmeq7In91Ef3jNUqKiKI8OKVvoFpHWihw9XIlmGZ7FHkqkgxwGXAIf6J62rMJqQgE7XnaCwAJlFQUum85JcVqrImXHB+DvVryIb+RBBT+IH03W8yObuXhDp6pnz4KWWXCt6V0zq9ZGFmlQl4dlgJ9yvS5vlyS+Br7R0nd4T2pgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D5YsaLZH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D5YsaLZH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 919F11A19B3;
	Fri,  4 Sep 2026 17:37:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F2916057F;
	Fri,  4 Sep 2026 17:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EA8C11C79AE2;
	Fri,  4 Sep 2026 19:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sRwuyM3KB9pVS5pi5uzPWsr88LNSKO5QvEKxVsYBojg=;
	b=D5YsaLZHrmgAQIQVkaWNAmZ8KqgfCx3R/Hrv6r+1uDta3TlZ2gT+7g6NxLSZUzKo4rI20H
	UOFEypirf42od5JaOvHb6qOljsp4Z016iZlbun6EsIwDoN96CeM8CTIm2DSjCcdcXUhs03
	xpnw7VEj9skynJiN1EOdRuxdP09850MC6LxAJqLPZVgSGK7Nav6wshOG9npEROrdo+ETB/
	cHiFo0wmjcFbP49qjsQfqqUQf6mtXqGN5Zl16D5T+qTVFVaYZvH+q2Hx6B03B6nTy8W6vF
	g+2gUhy/ixxdu8CwuyGCbqasVc5qMT4RpLZXBz4F9/rUKsfUGogGI4t2XYHJ6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Pan <peterpandong@micron.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, han.xu@oss.nxp.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Xu <han.xu@nxp.com>, stable@vger.kernel.org
In-Reply-To: <20260813-spinand_qe-v2-1-376193ac7b1a@nxp.com>
References: <20260813-spinand_qe-v2-1-376193ac7b1a@nxp.com>
Subject: Re: [PATCH v2] mtd: spinand: Enable QE on all dies
Message-Id: <178854347108.1467647.2799589444007410894.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:37:51 +0200
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

On Thu, 13 Aug 2026 08:07:24 -0500, han.xu@oss.nxp.com wrote:
> The QUAD ENABLE (QE) bit is stored in a per-die configuration
> register on some SPI-NAND devices. When a device contains multiple
> dies, updating the QE bit only on the currently selected die can
> leave the remaining dies operating in non-quad mode.
> 
> Iterate over all targets and update the QE setting on each die
> during initialization to ensure consistent quad I/O operation
> across the entire device.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: spinand: Enable QE on all dies
      commit: 63d6cace2c4a7f36c1cb44f1bb5e0f3ef19e5c7f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


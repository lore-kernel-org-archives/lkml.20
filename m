Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12951C35E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545354; cv=none; b=Tvn3XL/xIaE1rEBTi4tUgQ5g8lUy4y+CIeezzfWCTJAAvmrk1eWasaOL1s77DqvZSc11sbJA+TIf7h0LxHvSSSeJH5ZkcKiZBKHi/0Bl7/E/saCM3hRbS9X1F2iOUSMvhlSsS3XHZK/dQX/cJiYnkim5uNMPCUKE9r2tC+OOO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545354; c=relaxed/simple;
	bh=KrOce6335rV66EN5CP2VbV6tk/enuB2M7JqjffCSU7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NNcyGmdchUdRrigZBaS5e6KXjsIZNOxzZ+SvS9MVziPQOWKjz2Is+NcTxJcNb8K00q3COYIsB5ENQEyQVOPqbKsH8zpgYUBmXnDq++VKrJJS1IW9grTJy7RPHjvUTaVzYFQFo4nF9I1cF3UiVAZksG+Uy+4f/awT3R3EAgI7HBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vyWjpJHS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vyWjpJHS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 943DB1A199C;
	Fri,  4 Sep 2026 18:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 680026057F;
	Fri,  4 Sep 2026 18:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB29011C78158;
	Fri,  4 Sep 2026 20:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b9P1SmkyHsBAp9kZVcmo7gZHQc9uLFb8O7j7foVbYtY=;
	b=vyWjpJHSvje2L00RsNQBQje5WhAfEXmE5q/T2wTJw/bDi7YdRTD50/9YPPDfYCrVi7Tru9
	CEr6tHvxPCjhefuxGJfsWnzpo6zPQZXZc/QGQ3FVlxlEBBpMk+wETqsO3utpxCDzU7YArk
	bwr4ZZfniSMtLvAbUE+22VvfXguwewvbpyey6z8d7403uUhFOp8/N74LDbSKqkn7N5tMCk
	Fz62MGy+2RV9C0goBUhn44JGiagikOkvTeFolk2Ep2c/b5KH1k3NPWgEQK3d5qlZimXjO1
	0rToESXOMDmS25Z9CjMs81JUBV98wIJfUONkVZc5GKfXkWs8kmzEqBIzyUeF2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, han.xu@oss.nxp.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 imx@lists.linux.dev, Bill Lee <blee@issi.com>, Jeff Kim <jekim@issi.com>, 
 Han Xu <han.xu@nxp.com>
In-Reply-To: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
References: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for ISSI SPI NAND flash
Message-Id: <178854534888.1533016.11676487212538727490.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:08 +0200
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

On Thu, 27 Aug 2026 15:39:12 -0500, han.xu@oss.nxp.com wrote:
> Add a new manufacturer driver for ISSI SPI NAND devices (manufacturer
> ID 0x9d). The following devices are supported:
> 
>   - IS37/IS38SMW01G8B: 1Gb, 1.8V
>   - IS37/IS38SMW02G8B: 2Gb, 1.8V
>   - IS37/IS38SML04G8B: 4Gb, 3.3V, 2-die stacked
>   - IS37/IS38SMW04G8B: 4Gb, 1.8V, 2-die stacked
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: spinand: add support for ISSI SPI NAND flash
      commit: f4f2a54cfef7cd23a54b8427a00c2dae83ffaf2e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


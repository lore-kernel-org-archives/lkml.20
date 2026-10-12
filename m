Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778744CE69F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829265; cv=none; b=MLVMdsc4REi5EjXuCsxtMmYQptWUdBnYfa6JhHrNMahlLGyLty/gaNcr9E868R7N1CCYOFjSmtsjjnZPpR4bxnQXWAr0hfBccc/ErY+80pyhVxoLnUXPm0umMbAPK+vGItkV7gcVEnja+L2Ivgau8gd4YIWC0S88hQc6IKq796c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829265; c=relaxed/simple;
	bh=WsbvIzHkv+RPcZiwtZ9ERX5vy3BZ7tsO4Vx0shzKZhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEFCJTDRNO/kdV9bNAQqIsPXuAPUVCNVeh6fAN1ovBLkgC5mUS7/eo0OCFI0BIm1LnLOrO50QVrfuGDpS7AMvjU61Z8HwP4rVw04OiJ1apwFYXwxzPAHlcQTmReTg5v94Fed5xhLDRZ/F6toUqjs+grAaUOWJQ7QFTWcThFUTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IzvzsRrq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IzvzsRrq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D30144E411FE;
	Mon, 12 Oct 2026 18:21:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A57FB601A6;
	Mon, 12 Oct 2026 18:21:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 436DD11D70CC1;
	Mon, 12 Oct 2026 20:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/L02SlBz+A++KZb1a49p5CTI9HjuYhf4KaDbAR2TNI=;
	b=IzvzsRrqjtvS1DQ+6EEwc247S6/p0wmOZKTmkeiPelGv4sdhjuq5b70ZJZuHffxpR8auiK
	a1fdlGCgbmTzRYMRz1ewfZEK4R+tsDY+oneLNiULY8zamxPZxyvQmAhsB3JTkZAqPfu6C6
	WTlSVxDbnA/Ssh1unL13X/KlHvXIe3b0h9dKPPoXzInbXLtKv5v3jTzFPn9VQ1/hlmZ+Nx
	K/RYOuNpoadoI8PaLZPQp7RZLY+zisQI9oIND0CVTpOxQeMeLrG12Nt7cGjJeTASxrFEly
	BwS+qws5Z9wbgP4/tP+j17Rt79zWBMJ5mkTEf3sggVujUHqIhOYbpTOMgXUXzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260928200729.44594-1-rosenp@gmail.com>
References: <20260928200729.44594-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with
 devm_kzalloc
Message-Id: <179182925620.590599.4853901949776767576.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:56 +0200
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

On Mon, 28 Sep 2026 13:07:29 -0700, Rosen Penev wrote:
> Allocate the shared fsl_ifc_nand_ctrl structure against the controller
> device, which outlives all NAND child devices, so it is freed
> automatically.  This drops the manual kfree() and the broken chip
> counter that was decremented in remove() but never incremented
> anywhere, leaking the structure and leaving the freed pointer in
> ctrl->nand on re-probe.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
      commit: 104f277e8a469f71ac3c74a0e9ebb8bf64c3fa06

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


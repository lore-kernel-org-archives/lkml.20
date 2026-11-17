Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925409;
	b=DCzV3Gg2gt6D08VnHQIQX0VPIB/TqWxbr5c9A2NzwhKY4txgjM5P4/EPwr7AV96G4Hhs
	 22VRjgfDqKOPg5VKC1vbFyGUfuRkaKnGafO75kwOCoAh2z6uPlCLjpvgpOFNw+Goeac8a
	 FTgyaMGuusjo0N/C54uffNljQ+LrqeBx7ou6wQNfRybhJmo0WHUt/puRN/kozz2PA7ZbD
	 VbwFnr/WywyG4TtnwZaOJVeTw77lw3fHZr/5wdqe8JUEbT3evWZidMhIPcURGe+dlr+Vy
	 be7Qy2cAcjbBSUBTtrjdIDQnytAitgE/vD+ngInDr6Ml3kTmU78To4guu3AlF4FoiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925409;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=XtFQDcwceQa3Sr+OhE1k+wWRHerfk4qk4lkJyg2kfJo=;
	b=Cqz345uwk65gNtEq3f0XO76jKq+V0sPxW3UefstdMTvldw4Bp2A2qJFmohVETvcfxhsz
	 9BVmCCV6pVi5/w56QBxv8LUhfj9D3OqpDbtc+Rn6Kgb6ya781VRA20C6zDOdqWl5OcNhN
	 uIn+u5iBiRlodH0el5OK/YfI5bunBgLIHDX1RcZybfgOpSe53LJMMlK7B09myWFDWobxS
	 XRQPcDZ/W15+bDm1o4t2HR/fO6tH8nIqkB6DbPP6YEAvs1xj60d3/6jd8K+6SQ2H0t7ux
	 oi45z2cUmUlOS8lw/ly85cgDSVSgXXPUoM1IV/5gfeXExe1kjV4d2aAaHJYWrHsC76Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1q1S9Pd7;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7291B606A8B8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7291B606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1q1S9Pd7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E62A4E4157D;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 120E55FD6A;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B0D011BC0039;
	Tue, 17 Nov 2026 15:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XtFQDcwceQa3Sr+OhE1k+wWRHerfk4qk4lkJyg2kfJo=;
	b=1q1S9Pd77qyl4ks/rAZs4tWBzzKJxwbhs+GjdlKzNE8v8VfwmKF1gAM4tm+wT0HKqXcAI8
	V85azkHVlxyod7PF09JjNMsoOJcva5H4RmM0O9j269IgEIWVqqsjN9q2t52UD2l+Pt+Rba
	fGgerv2m2bVMgqfC3zwj7QEe38Clb9aL0GNUHpXkOwI/CzSrkE28jExKHZM51eC/e9M3I5
	XVTsoW4/jxNOIsB0teTHQ++StlGA6+fp+3tSLe+8N9qIiCkIiblYqh6LUj/14ctV8D/8lZ
	olnCiWeeX8ixtcvqSdcQJW7OSR/fmDNkexg9nNNHhdgJGQMCsn2h7SfendL1Aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@nxp.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
 Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees+treewide@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API
 functions
Message-Id: <179492540302.2259780.2818998667835752553.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:23 +0100
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

On Wed, 11 Nov 2026 15:24:45 -0500, Frank.Li@oss.nxp.com wrote:
> Use dmaengine_get_dma_device() instead of directly accessing chan->device
> and use dmaengine_prep_dma_memcpy() instead of calling the function pointer
> directly. This follows the dmaengine API convention of using accessor
> helpers to decouple drivers from internal dmaengine structures.
> 
> Affects cadence-nand-controller and fsmc_nand drivers.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: raw: use dmaengine accessor API functions
      (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372435;
	b=YaNtjIiSq16NrZ0bx3mnpWLLSmn2wldjrSK/c/VCsotPjM0wiKsEy5/inE3fYWmyJpEE
	 BP97tA1OTVZpNe++5pWa2Nzcjh0ZGDh7UcQbH5Eb4lJhoOudeNZrbN/on3Y8zmbs/OfqI
	 hUukqGNLgFCLh7BE8IunRTRDefzcqKHMT7XLcOs4BABqheX5yHXjxSFVMz+G7A1+q1bFO
	 6qniSS7bOqE5BJVyZ0QofIdTaI2zCxxcE4Crodbvhs6t2eBn+8zWUWP0+YcBMR7eG9p9j
	 isKCHzfmTodUxTHXOtplnD2bQoDF4DWDTLuuhSbJ1t6CcMl8D29BTYGR0OR5+2vDXrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372435;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=dDd4BvTxSR0uBUQSKnRsKxmPO1GwP0bmDkHq0sbZkg8=;
	b=nXLir1lYI3SYqu4cpAa0HDYGGLQVtNgpeMb0CESZ6Dkh6V3MeeySJZK8K0vAOWA2KXr1
	 8YXyMUNF0tK9h6zKyRJ6Q/M+Z53IGbjEVSLscgHIHpyBWYQhL9ZgHWHl8eAz8e7c3PCu6
	 FjnvhYp05jZk/XmNWQaRAujy9wPyjSQp129K9Wwr5B/L5vQsla67ZG0ZA5bZLZHMWyRQ/
	 nP5AUs7cXFaqoc/BSKFKd4yE/7KCu+Z3qiPlVR74ScblY/KP02LUcdBXLdGngocYoalKZ
	 7AKe40fvTdzH6Yc8FrLHuWaa7mSzbyEMfU90awF+h/F6rE6kuZLmrJWcJWSNHFs9Y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="tT/ippcm";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CB8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tT/ippcm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F22E74E41376
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:00:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF7B1603C2;
	Fri, 30 Oct 2026 15:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58361103290E8;
	Fri, 30 Oct 2026 16:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793372427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDd4BvTxSR0uBUQSKnRsKxmPO1GwP0bmDkHq0sbZkg8=;
	b=tT/ippcmnCNVkD9eNIMcwRGmgxafKoPkU+RG3W6+YYfU0nD9mMZlbMUs0P4gsz6LrhbyMN
	rYA8UPWtheXltmOKXmEF6gK1qBiKb4uPhX/DLGrTj/uG+Ha9tnYveuAort6dkWRxAmObGI
	S8CViDNR6AaeTEc00Bdym1et9NikSbzEsgcWNXbbXByt+bPDDOIQWqiW2ZLJ5srVW0JIWQ
	D9me8mITD7M33g+Yb9nT2LdtOsjjCIvkJyc3n85Z+9s/o2R0CBhfEcyNFWDzEJtxWlJWqd
	g86fonp5h9z9byzlHsKwez18YWY3yojofoL2lmvdx9ujBCWwtZMljrWJT13saQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Han Xu <han.xu@nxp.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Richard Weinberger <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <20261030143945.2923554-1-samarth.colleges@gmail.com> (Samarth
	Narang's message of "Fri, 30 Oct 2026 14:39:45 +0000")
References: <20261030143945.2923554-1-samarth.colleges@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 16:00:23 +0100
Message-ID: <87zevvcjy0.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index 527165ccc..a8106de2c 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  	if (!to) {
>  		dev_err(this->dev, "DMA timeout, last DMA\n");
>  		gpmi_dump_info(this);
> +		/* Retire the APBH chain before its buffers are unmapped. */

Please drop this comment.

Otherwise fine.

> +		dmaengine_terminate_sync(get_dma_chan(this));
>  		ret =3D -ETIMEDOUT;
>  		goto unmap;
>  	}
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

Thanks,
Miqu=C3=A8l

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374212;
	b=Twv6YnYlky989Nlh/oQ8GpzWshNdNnaCY0x7Tn7YW6YdKwO6QRxxn032YuVMM/SJE3dw
	 W902v1d61OLVBdFZ0B3dBCdRJbANxUIVjlyUIdrwBMj95AdpmZYHCGpEf9H3otgMEa4+S
	 qpxWef57mc6C8rzQuCQNqocaEECj2wmbt1r/r8XhKLbhOU2h7sso58vCysGE4asEq8LoI
	 4O6A4WKdUyVR8Co+VAQHUliCDmk9LmQ9+YskqPnY7MI/O9TYDWpbOn78aKMu7DGdq/OTa
	 uFjBvyBbwEQHgYSFGKehrBnGqDGWaBYMyvv9KsZbOHXc+W1FZlBZTqJ49Lp+1uNb4AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374212;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=1o4CZDZu+gULwQEasnXj9CMdx8xc0cnQ7Pve1CdeUsM=;
	b=vKReKz+UBb/K0RDawJVu/SodPOWFVMpIzPgiarF8YFamO7qQ0iJsTdxqw4GJfU4nsA6a
	 g/8YtYoXx0iHOLdzVY5NLGS9SBZkevy492pnTQ+roTLwbQC2hfpfnFfH68VC4r4hYBP6W
	 Ppw2BLp7soSEM8miznfFR3fR11IErHyp/8z7wr9YJ3l7faQr/A8bMpUJZfyPvoIEg7Yb5
	 iryXMinOLaeSniNfPjIPhWngbBz7t89sTo8RWxitbR3cXXwzDbfvJ0Zj5SDCywLhDdMPH
	 V0S9bIOOyrWTO+VyyECT89l2pg1ZsXte4y+SabyWBm2YOftHqhdWV5iuxfp5J7fmmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Vq6KJY5/";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9237606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9237606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vq6KJY5/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 096604E41378
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:30:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6F5D603C2;
	Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD7F81032912E;
	Fri, 30 Oct 2026 16:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793374206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1o4CZDZu+gULwQEasnXj9CMdx8xc0cnQ7Pve1CdeUsM=;
	b=Vq6KJY5/MC4ZIDB6v8sJFdtKcMSg2Z7pOq1l33uLq1CTt3KgQ9M3QJ7ZNMWFThmrkLnm91
	gS/e0cmipNsiSCTlQyKBMl/b6jY9pE/UvIKd9uzDhK8q+6e5nZ2+2+Oe5o9En7X3uKLKL5
	LCzd199jgcx1W1vSFj2IopJ/fIHOlpA5YoiqnhUYSSmHwcekM5EzCbweuGjEvxWDECG8gY
	qsk7BXjPSpBBW4vSdyeRxnLPiWK42LeVQonVGiSskhyu+hbeeL2Gm9swlOVU7hgs9piX9W
	9orN1VNV54tTIyudtE1wnoEZEp8t8cpfmBng6iZComo/LpUucmjhYojMB6jRxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Richard Weinberger <richard@nod.at>,
  linux-mtd@lists.infradead.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: retire data DMA before
 unmapping on errors
In-Reply-To: <20261030151843.2953269-1-samarth.colleges@gmail.com> (Samarth
	Narang's message of "Fri, 30 Oct 2026 15:18:43 +0000")
References: <20261030151843.2953269-1-samarth.colleges@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 16:30:01 +0100
Message-ID: <87tsm3cikm.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 30/10/2026 at 15:18:43 GMT, Samarth Narang <samarth.colleges@gmail.com> wrote:

> When ECC descriptor preparation or submission fails in
> stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
> terminating the previously issued DMA descriptor. The descriptor may
> remain queued and execute when the next page operation starts,
> potentially writing into a buffer that has already been unmapped and
> returned to the NAND core. The timeout paths have a similar issue, as
> they use dmaengine_terminate_all(), which does not guarantee that DMA
> has stopped before the buffer is unmapped.
>
> Terminate the outstanding data descriptor on ECC error paths and use
> dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
> stopped before the associated mapping is released.
>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

Seems like you have a lot of them, so I'll drop the individual
submissions. Please create a series with all the ones related to the
subsystem you would like to contribute.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616053;
	b=WpjTuUnKZLzcUpcqnznv0WG3wPAeeBHQFVmeecIxpRDVmOhSHwr52wipHJ+1QNeV7rKn
	 ylLOCXHWzGnaKMa1avgI840NcY9bE2uox4nFY0Bq6tUGotf8oStFXcrr6fzHol2jkGRKV
	 rEheuEND2+OJNSLcmWPr/Vj2uRxFmr3ORmXRF9Np3Tz8nEpMdX9qlDLiWSJZEnZP3Ixrp
	 uo2RT4TCY2HURyuTsM6BHyshgYNGQeiYBpjIuzey5DcbyYCjbT7CFMcSZCoGlQiUEAeVU
	 6WPPcxRMLPt9rxACeeD4YRfyeREa8IB7gCkSqsEDxn+CrH9yhFnzTAlrZXnz/sKbFOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616053;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=S4XqQHkYxMLzJBKd/RIGFP6W6LvgbNjSzobYrrP08ig=;
	b=o16VrglZiI0RFg5dHjfk4DeBzBWRi9cp4V0mvkXvl+dTTVLiCaVO0RCAm/tpK20u+wEH
	 9Z7YDuVxNbn2M7loO7RUcHrMp1/oDObVyKx6CkOifjUkLyzxtOn6mNnAzaRIsB1aB4cGG
	 1vlw1Kro5dsOfoBy/xpPRr3JYyayp/Pl7XmezieHsJTESFPJ1K7gQWu0IjZmqXaT9BRhY
	 xqLw7pTd4FHs88z0kExYPNCgQ4qKexTTAONm+QG+EIx/vbP4U4gh/JTxk/ualz5F+U7uM
	 iDhDtFHiRqLHnDWFdGpYR6R90lBN0FNwQutYjPyuwy13yJknZ29ctURD3Zn9LRKAkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pz2OBLgz;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07BD606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07BD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pz2OBLgz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F4DA4E413C2;
	Mon,  2 Nov 2026 10:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D897160750;
	Mon,  2 Nov 2026 10:40:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9BC810329123;
	Mon,  2 Nov 2026 11:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793616048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S4XqQHkYxMLzJBKd/RIGFP6W6LvgbNjSzobYrrP08ig=;
	b=Pz2OBLgz8P+QXSTBWZA/IZfDReBRnNcdOXtbRSIklIozAgVqN/zs5TyY+bvBNlNBCvwhpz
	t3Hg95mJtbwX1FfpJqb7T2r8xwwThAYaS8KU2UaHST75vvhpA6Ioufqq6Iyt7zkAyVJgFM
	VDbf5D6OCR5kqEkFWiC5IVhoLOPh1c+kdqmJqKRGRPT0KdNDvdV/yqs0dfIEDEenHRd+on
	U+oHLoo+4mucLCiwijpmRuEYV5r0DC6UUi5V/5L5bHhJ8G9/KQl0dOZ4rqEYhPlIRYDfhN
	5oA5WphUTafQKAgiGEnGrI08Xssmsibe/UleP85uFjEFYTAvAasKyz3l1KKCkg==
Message-ID: <d9e8d715-fae0-4e81-9ffb-f7ceb0453542@bootlin.com>
Date: Mon, 2 Nov 2026 11:40:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com,
 ovidiu.panait.rb@renesas.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
 <179361503537.3131.1099699821303752523@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179361503537.3131.1099699821303752523@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/2/26 11:23, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new common-MSI error path runs stmmac_tx_err() without any
>   synchronization against TX NAPI or the transmit path for the same…
> - [Medium] In multi-MSI mode the patch adds new callers of
>   stmmac_tx_err() for a channel, and nothing serializes them.
> - [Medium] Use-after-free of the TX ring during AF_XDP pool
>   setup/teardown while the device is up.

These are unlikely, but real. I'll address that in V2, as well
as the typo Magnus spotted :)

Maxime

pw-bot: cr


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906360;
	b=L1sCYBc2ls6rWA20S49vsGMQU0By5u6NdKvIHeNAfVtZ/czXm+u8vqiJERu/8j8g8oFM
	 94kOw+Zf/8NpT/MR1SBzbXm/NnPFZHQ42JgfWekAcHjG4yWQfGz89eI4wvR5unPUK+Sft
	 8wec/qmzX2ec0rURrY/ZBF8Ox+czxcfhE0KrGtvAzYwaZqxhac0sgUbZPgagF5hZ78WgF
	 LMA9DL32LmI+YZWtWJXunVLIGsCst0H6Odikgn5uJngyQMZSgUvbT9L7SMk4/nIJbUyVd
	 x3zNX/l1aPMIEMcRguC7qZFAKpYzyM8Am7ExS4DF5/AbXN/Cw2W9IyUHc9/VE5bmzaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906360;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ehnUiJwedFsDrAATUReQKnLArX2RJeKTYfe7cGHZo7I=;
	b=1FV08X/N0MkgQ3gn7mUPpUBJPutp4N1wzDOUcn3i27vBzbEz7xKgXC0+BdGUNkO16gGV
	 LWg4LDUY2/1642frOMavn0a75EXsqszoL/M8cViw1jGSFXTM72diGz8+FcX1uf/rzVquA
	 CwPXLfdjvTaDmGZSJfHuigCq8QswCiH0sRQx0yZ5PO5xuR7PrMM12aPDJ5FgkFRivyVOc
	 NcO4L2oLHf+Vr7uvzmzJpBq4/GW3gL/2Zo0XIEC09YuSamkRBgA/qZYZrdNPfrFjbwV2M
	 hiJihlkgkQ9QRdlGBCMX8LywtYnnpep94bZY0Twl98MFcBEw2IZC2uGAxWKG9JBWBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=iuUcHZ8b;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90653606A329;
	Tue, 17 Nov 2026 09:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90653606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=iuUcHZ8b
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27A00A02C3;
	Tue, 17 Nov 2026 10:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794906351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ehnUiJwedFsDrAATUReQKnLArX2RJeKTYfe7cGHZo7I=;
	b=iuUcHZ8btS/bwWKTtjcsF5tmxeXys+hM3WNg/PMk0jXn0eyPUM3kW1qYRgK+TgspjDMmj+
	awxTlJsUcAvlrrMAphVh/FeQwTmHCaA4cvJ8EJ+vb8NGj3hk205AYTO27KEPOE4hcKIPMU
	IA0vJC1qpe0dM4oipUHisRlCK+RaoXdpDFH1voDKUkL5cxcOiWfRl1UB5OUln1U/GkyReU
	tSX6iuk6iKyUi2i4kOxE5oktMBjtQdEGXt8uwV0IXL6bgbdzC+VG7AbT76uXB2yPIRAyBj
	xP9inhTqXfMMRdoTSqa0CWpn2u3zoP7N9W60RWXWCHEBrSBinby2S5v5UdmQ6Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:05:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org, florian.fainelli@broadcom.com,
 justin.chen@broadcom.com
Cc: opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com
Subject: Re: [PATCH net-next v7 6/9] net: bcmgenet: split frames that end just
 past the transmit threshold
In-Reply-To: <179474771225.2199510.15415138115246393692@kernel.org>
References: <20261112-nb-genet-mtu-nn-v2-v7-6-43a5d90b3256@tipi-net.de>
 <179474771225.2199510.15415138115246393692@kernel.org>
Message-ID: <3d17930b465b31cee713aa4c690d490e@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 15.11.2026 14:01, netdev-bot+sashiko@kernel.org wrote:
> [...]

> [Severity: Medium]
> The commit message says the window "is one DMA transfer wide". The TX
> DMA burst size, though, is set per platform in bcmgenet_dma_init():
> 
> 	bcmgenet_tdma_writel(priv, priv->dma_max_burst_length,
> 			     DMA_SCB_BURST_SIZE);
> 
> bcm2711_plat_data uses .dma_max_burst_length = 0x08. The v2, v3, v4, v5
> and bcm7712 platform data use DMA_MAX_BURST_LENGTH (0x10).
> 
> Suppose the window grows with the programmed burst. On the 0x10 burst
> parts, a frame could end 64 bytes or more past tx_thld_len and still
> fall inside one transfer. Would bcmgenet_xmit() then skip the split for
> it? That would leave the Tx DMA stall and the bcmgenet_init_dma()
> failure in place on those cores.
> 
> The measurements in the message come from one v5. Once "net: bcmgenet:
> allow the MTU to be changed" raises max_mtu on every non-v1 core, this
> case becomes reachable.
> 
> Should the window be derived from dma_max_burst_length, or has 64 been
> checked on a core with a 0x10 burst?

Right, bcm2711 has the reduced burst length. I don't know the details 
why
this is required, but my tests with 0x10 have confirmed that this quirk 
is
needed. I will derive it from burst length in v8.

> [...]

> [Severity: Medium]
> Does ENET_THLD_MAX (3840 bytes) fit in the TBUF of every GENET version
> that gets it here? bcmgenet_tx_pkt_rdy_thld() returns the same value
> for all versions. bcmgenet_set_mtu_regs() then writes it on v2 and
> later, with no clamp per version.
> 
> init_umac() programs the TBUF size control only on v3 and later:
> 
> 	if (!GENET_IS_V1(priv) && !GENET_IS_V2(priv))
> 		bcmgenet_rbuf_writel(priv, 1, RBUF_TBUF_SIZE_CTRL);
> 
> So v2 has different TBUF sizing but gets the same threshold. The
> measurements in the commit message are from a v5 only.
> 
> Suppose a core's TBUF cannot hold 3840 bytes. Could a frame longer than
> that TBUF then never reach the threshold and stall the transmitter?
> 
> "net: bcmgenet: allow the MTU to be changed" later sets
> dev->max_mtu = ENET_MAX_MTU for every non-v1 core. That would make this
> setting reachable on v2 through v4.

I only have tested with v5 (bcm2711).

Florian / Justin: Can you test with older versions or confirm that they 
will
behave the same. Otherwise I can also cap max_mtu to v5 only.

> [ ... ]

--
pw-bot: cr

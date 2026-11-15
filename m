Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771658;
	b=FzRdJzr/lkxPsMvlZPa4HaWa2G9tiPZjnGrzyLSstTsfGYQuL67V/MFx8ns+b3TGbJRu
	 6wsE4P5iHm5tv4gG0mcL6rwXTWF/Q5oU61xFbkpuMrHvffBTdmWJzSusiZAp9vgUGx5+3
	 pCD506kUqYkP+9YVNE1E2r4bPQcgiNfoorB4Iz2pCfw1T9UDuuUlonoLhEG/e7fYZpDTq
	 y2fJGGUBhdt3cjgRBy1cDTDm3FUo7QG/6bkThIvoyR2+VamFufRrARcP7t5inGejIIh2H
	 TTRu8nwCcmDaKH9MlKC/4iqnZn0GZKVGcdnxKoYmDwdWDdOiVIzPJlp3TBRH3vaQ5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771658;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=9Z/SeLigb7cKZ8AenGFKvsGPiHPN7jeIOZeKFYBKPbY=;
	b=n6C6cptDivGLhiLcDBQbjTqlRv5bUwyShudveKw3dfMpHBE8kFI7r+Ybp1J7BuoeP2rn
	 siY4dTNP0P5ZWzeJtRSX6jlgAvpg3nIdj1xHjWphecTYkIZQJWeYgsHF7g1xlkCHKPEL7
	 duoUiodPLXGiBnNzFqHVKKgm2j7IPHOCrgcbAs2oKKq55cOvmCnstuBu2WromMx6ZIOYk
	 3rAYKssJVP3rMvF/czKuJ1iyZxXnByWNtRta2iJSqPFsbl78moCqrtGkQIYZyzxVenaUG
	 /QJtw8LmBe1AVw2sbLV23z4KqBkEhpJLoROe6dz7QYg5HGQvl1fTEVyq7B5YGyZhK/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yWY28+xR;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A146606A31F;
	Sun, 15 Nov 2026 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A146606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yWY28+xR
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57395A15A5;
	Sun, 15 Nov 2026 20:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794771656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Z/SeLigb7cKZ8AenGFKvsGPiHPN7jeIOZeKFYBKPbY=;
	b=yWY28+xR+uME0tIkAhr6W+D54FEYTar3UfmQ29bGapl8Xt9Us9v6la1EqRQx8CzrCHhk2s
	OgE7SYbSdMA8NVXaRbQDaQWAid9YLmvbFu3LavUJPUYkMi1D3i6+fPotd8cn7oIbtg4aiD
	CnniVTMDuscpm8DXyfF/TVgnueGb0N47PECPFb160IkU5NVCZtXaNh4xFM6kDGSNnxx2x3
	DRuo57WoaKekYx0wX+vT0zh63ZYfNbgY2KNFfizynNwuPpX5PC4bN5KzfBT5FLN1zj11I1
	Pof4Fl4n4aI5ctvJeBu7LcW+QbGpivOkSeXuNXDdtd1F7lszO3CZuKhUqpp/VA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 20:40:55 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Valerio
 <pvalerio@redhat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next v6 2/2] net: macb: distribute evenly Tx SRAM
 segments
In-Reply-To: <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
References: <20261113-macb-set-channels-v6-0-5de59d9e7f02@bootlin.com>
 <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
Message-ID: <00aea741bd079eb9168fb2ef9b656f25@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 13.11.2026 18:32, Théo Lebrun wrote:
> GEM has registers to configure the Tx SRAM segments distribution across
> queues. The reset value is apprioriate (even spread) but we need to
> care if/when number of active queues is modified (or if we inherited
> unevenly initialised hardware from bootloader).
> 
> To distribute segments, we take as input the number of queues
> (ctx->num_queues) and the number of segments (found inside DCFG6).
> Its output is a number of segments for each queue, formatted as
> powers-of-two (eg 2 for queue 0 means it has 2^2=4 segments).
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      | 14 ++++++
>  drivers/net/ethernet/cadence/macb_main.c | 76 
> +++++++++++++++++++++++++++++++-

> [...]

>  static void macb_init_hw(struct macb *bp)
>  {
>  	u32 config;
> @@ -3465,6 +3522,20 @@ static void macb_init_hw(struct macb *bp)
>  	if (bp->caps & MACB_CAPS_JUMBO)
>  		bp->rx_frm_len_mask = MACB_RX_JFRMLEN_MASK;
> 
> +	/* Distribute Tx SRAM segments evenly based on active number of 
> queues.
> +	 * TXQSEGALLOC is only documented for some GEM integrations.
> +	 */
> +	if (bp->caps & MACB_CAPS_TXQSEGALLOC) {
> +		unsigned int num_segments;
> +		u32 val;
> +
> +		num_segments = 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE,
> +					       gem_readl(bp, DCFG6));
> +		val = gem_sram_distribute_segments(bp->ctx->num_queues,
> +						   num_segments);
> +		gem_writel(bp, TXQSEGALLOC_LOWER, val);

This only runs on open, not on a context swap. So ethtool -L on a
running interface keeps the old split until the next down/up?

> [...]

Regards,
Nicolai

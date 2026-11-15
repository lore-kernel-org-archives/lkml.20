Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771573;
	b=Up1Pqj/G5z7dwqgMeC+YNnjM81yMxamNVqa5siZaHN0BYNYlcV4ZZi1hpi0GHFHgrrSn
	 pbdhrR4YA+L2BcBkunGNIbcbM/1+myVksQMBLtWZtBM94i0PrrwAtNs7I0fXZ2rqbED7N
	 5R2FKb8jtSKNP/1ufaJ8zHrEcnz5yr5NeGlOM6YTfjZo+qLcaelfBVkY7vgzELYHnZEDk
	 6rHncFLTsGNLCQjxLCCAHYtAkwaeLYx6Nr5jSXtPx0tGPZ6ObIvfpG3IbRKJttA5nTntT
	 vYeQbuIsXzSpwCiLgyRx8HI73XCvAsBohs2vBED4xw7va5sjooN+WevAiZG7Ug9INkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771573;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=jWvcQguugJJmaOTWfGcO5C8vl8bBwsJMp17FuaFFPd8=;
	b=HPVZda1SvkSKgHNVKkotHJm1Pczccu1kjucv+AMBWYAJVeNOJ7Eic/rQhulAONKlT6XU
	 ZxeRgrsJWrBqN3smfN+c2788AKEeLQ7VaEYSnepQSbfXbi3BbwNLTbrSfS4tAijdCfJnI
	 qj5cfYeRslxtRGhG9YfXmSfXGCZc76SGjwM6NgpNPtg+DaU+8b4GXTTQHu3N6u/E3IaJ8
	 6hbSATBp64/uTcO8gy5RS//yinNrUvanJXBF8ZsU4vXzU44rRxdMb1oWKdzHYyTAdjFx/
	 rFEkkmiQV4SnDmjQgYV2WqKxPUzR1P4LDFUkoFfs9sTy7Um2xy3C7/Syuj2AiX4jt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=g+NJQwOj;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAC606A881;
	Sun, 15 Nov 2026 19:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AAC606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=g+NJQwOj
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7757A1649;
	Sun, 15 Nov 2026 20:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794771564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jWvcQguugJJmaOTWfGcO5C8vl8bBwsJMp17FuaFFPd8=;
	b=g+NJQwOjR1M5zeuXwatlNshn+nXRLYrqnCyBYGIZznNDkD/VFqCwESuWkyS8wi8wo65nmU
	KoaQ9V5PQCEwp8eY3LRzro3yrOzUBOQqD/cRr3yoCLtNsiTVQQKMq8SSxi0jzsJdRZevPC
	7c9Sb4sD9YK7if4n2zkB8kdq7akvuT6vrXCABP35LT9VO7j23p0i2svN0hzM1/SBlTrGDW
	sQ1Cr3301piW+w7zpxzobifeK1iIpNSo/EdX4hJXivqiaMo31Z2QvBcfJn6ysT6HTqNJuu
	aqXMK+O/fdmSwZCytVmlzr3Pnq7whVaY31rPCdS0GUxCiMhJw1E5LGP7+9fu1w==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 20:39:22 +0100
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
Subject: Re: [PATCH net-next v6 1/2] net: macb: implement
 ethtool_ops.get|set_channels()
In-Reply-To: <20261113-macb-set-channels-v6-1-5de59d9e7f02@bootlin.com>
References: <20261113-macb-set-channels-v6-0-5de59d9e7f02@bootlin.com>
 <20261113-macb-set-channels-v6-1-5de59d9e7f02@bootlin.com>
Message-ID: <0d65e4cc9a68684cd69ffa7feb5b7440@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Théo

On 13.11.2026 18:32, Théo Lebrun wrote:

> [...]

> @@ -3351,16 +3374,21 @@ static void macb_context_swap_end(struct macb 
> *bp,
> 
>  	lockdep_assert_held(&bp->mac_cfg_lock);
> 
> -	/* Swap contexts & give buffer pointers to HW. */
> +	/* Swap contexts & give buffer pointers to HW.
> +	 * !new_ctx means that the swap failed and we keep the old context.
> +	 */
> +
> +	if (new_ctx) {
> +		old_ctx = bp->ctx;
> +		WRITE_ONCE(bp->ctx, new_ctx);
> +		wmb(); /* ensure IRQ enabled below read the new context */
> +	}
> 
> -	old_ctx = bp->ctx;
> -	WRITE_ONCE(bp->ctx, new_ctx);
> -	wmb(); /* ensure IRQ enabled below read the new context */
>  	macb_init_buffers(bp);

The NULL case reuses the old rings without mog_init_rings(). The HW
restarts at descriptor 0 but head/tail don't, so Tx stalls after a
failed ethtool -L? macb_hresp_error_task() reinits the rings first.

> [...]

Regards,
Nicolai

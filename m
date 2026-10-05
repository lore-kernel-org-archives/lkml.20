Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD444C4E8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791243689; cv=none; b=Nb8/E1ZvayooAm0ONlDAF/uUNwVaPlnBVqlDgBtZwq5FBzb3Zuj/u/XMCJDH4TsuKFrE/srvI/V1mxumaQProW7Mrh0MzPbfEb5IlWp4cgDwrbO4Y6D0+TeKf0aERFQ0dt45Yx0VhbswmbpCrOM93rXAR4t91I0FeP413GZohSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791243689; c=relaxed/simple;
	bh=Rry9zH3S4yeRlxilFjNByj3MH7caPFStVCZJRxgzncQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orPtsIsbTyLQUuBDRAaIlQXV3YNAi7jSwcOMXGKCg/Q1EzqYioQ7G6DKN2Pk9DoKGhas7AZsDfzYe5q50FeDyEL7NBeTaPRMTlQ+kbydiyJlZ+vVgvYH8hhKmy0z7jBrBR5kVGGP3EkAE6XG28LCDGMGorfhjF3LheFTSjpFCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=jlSrIR6u; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="jlSrIR6u"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so1286132a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791243687; x=1791848487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MV9congHlVCrHEqybgP75xi1HGXEwIeAsocmSQkvZMs=;
        b=jlSrIR6urVzxQSV9wdkGAP94UO44jEZNXNE84MMO7cEdUH6OTtt6YJuiV9t9WJiTbX
         gySD7bM1jXXLm/QuE9nTjv4iUWs0DsVDiC571+zt3AWvtvHOG2hkcr0m7tvl7GOD/1Wy
         RgKrN/AoMwWDdhICJF4KTuMjBhEx/vN8A0dLh2HUxwQsWNTJv5Q/VNeuTrJwqqXu3ccu
         0xYAP5CH2Hiu8g0xT/MBLrGGE7pp+yZ3gCWzzFuVTWt2aGvDDq1hskNF6zmSj01iTzSD
         K/hNVNWXyWNmNb9/G1LX0sw4haSpfkzs+EV4R4Z8DrxDxCUUjqpTg1N0BD5qWSOXQxM2
         L4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791243687; x=1791848487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MV9congHlVCrHEqybgP75xi1HGXEwIeAsocmSQkvZMs=;
        b=q70Buu+POsMQri34HpGAfTxN6bu4rjBGBA6kHqKDcac7ob5NYhpGz0W852yiG1zLYG
         seiznUu7SOY8TuFbbTKCpctLIp+yWPUVdu17bd7lejyfrsdR6DoBKdhUIXyX5vKl6uL6
         tAarrAq4Wlp06vS6bw3Fpw8jDJC5aU4JgmavNLoieCJGf2xiHqM56tpJdUcwbUwl9l50
         DNVTueo/wFhAwWc6nz+IsoEpvAo6a4Jymi7ojvKzq0Ni8jEWQF5mIItJrhLi87ogzKqh
         D8c7voffEXrUuDJI9X+z2wi5ierU98blSI0XN+ZnD7rdIvgSxujo4yDtTRYUWstA+5Yn
         7cqw==
X-Forwarded-Encrypted: i=1; AKwUvBwKXogbt5zao+VxSJ9erZXGK4/s+sqWdj6Q2OULUtg12bQZVubxHsimMJuSf+Teo4fALS+0T0dkZ1iSceE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMtfmTCz59C7aZvCGU9mccjeuHGjvr1US6lm+Zj3HvBERI2LXW
	W+DhfMUIyRBFElgKR2urMhN4kz3w5zu3IN5al50LyiJYs3H4+5EGMh6y/Hlz98Vncwk=
X-Gm-Gg: AYBFou0l9E3V5I/XDDnkmsIMy2TzMmhHY+xISH8pYpwDfmjaBm8rN2DDdFQh51sDQfr
	NDE3FFFGgU5Fm3FCBzRfbxpHA+qd2/8HR38HA/YlJKrQi4EsgFYS8mvbAiLTD8ZZtnqPJ4MvhT5
	jJc5lbmX3fdDBeXTF3eDrpNWu9TFkwsrjLKAOFXalTyhIk/dd99Bk3uVNgCvrn+KADrzDRyjboK
	T/PJLv1GoS+fajc7oYP2q/wdjyQ2Ge/93i7jWnxDU8tUzqYyS+osvoWxHF2FniRTHkEOpzFPhtl
	0jn943HWoU11ZyDnnv0S6ArxwoXv1bFCzlEf39jpDdqsKl8SQ3tfdlF6iTK0OgTyR2Y4vXO4doF
	+VMhHLLV+M2XUNPanU0CJHnIltkgxARSlucJy5jWicb7GuLxa+A+jds+5G0xMfvdFAL2dYN5zHh
	VjqwFHmrHsTPIw4oRgdaXkxuqgN7MgP4ti3lhXkMkJLsyrPAI7laXeeuBZp7eQP9gvdJhFmEM9g
	A0A0p6whB6DOrPJWHqTscw=
X-Received: by 2002:a17:90b:5805:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3a6ce6e6756mr7887037a91.19.1791243686911;
        Mon, 05 Oct 2026 16:41:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8211b74c8sm2765205a91.0.2026.10.05.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:41:25 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:41:24 -0700
From: Joe Damato <joe@dama.to>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	daniel@iogearbox.net, jacob.e.keller@intel.com,
	suraj.gupta2@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, daniel@iogearbox.net,
	jacob.e.keller@intel.com, suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004083759.1016519-1-maimon.sagi@gmail.com>

On Sun, Oct 04, 2026 at 11:37:59AM +0300, Sagi Maimon wrote:
> axienet_dma_bd_release() walks the RX ring to unmap and free every
> receive buffer before releasing it, but frees the TX descriptor ring
> with dma_free_coherent() alone.  Any descriptor that
> axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> its streaming DMA mapping, and both are lost.
> 
> axienet_stop() disables TX NAPI and stops the DMA engine before calling
> it, so nothing reclaims those descriptors afterwards.  Bringing the
> interface down while frames are in flight therefore leaks up to
> lp->tx_bd_num skbs and mappings each time.
> 
> Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> every descriptor whose cntrl is still set - axienet_free_tx_chain()
> clears it on reclaim - and free any skb still attached, as a drop.
> This relies on axienet_stop() having stopped the DMA engine first, as
> the RX walk in the same function already does.
 
[...]

> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Assisted-by: LLM sparse
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caught a
>       NULL tx_bd_v from a first open; after a close followed by a failed
>       reset the walk would have read the freed ring (Sashiko).
>     - Reword the comment on the skb free: a descriptor can complete after
>       TX NAPI was disabled, so "never transmitted" was not always true
>       (Sashiko).
>     - Say in the commit message which hardware the test ran on.
>     - Kept Jacob's Reviewed-by, as the changes are small; please say if
>       that is not OK.
>     - The hardware test is v1's.  The changes since only affect the
>       failed-reset paths, which it did not exercise, and how the freed skbs
>       are accounted.
>     - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon.sagi@gmail.com/

[...]

> 
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 09443623a3e2..c88c671f8b2d 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -186,11 +186,34 @@ static void axienet_dma_bd_release(struct net_device *ndev)

[...]

> +	lp->tx_bd_v = NULL;
>  
>  	if (!lp->rx_bd_v)
>  		return;
> @@ -221,6 +244,7 @@ static void axienet_dma_bd_release(struct net_device *ndev)
>  			  sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
>  			  lp->rx_bd_v,
>  			  lp->rx_bd_p);
> +	lp->rx_bd_v = NULL;
>  }

The added null writes makes me think that centralizing this code and using it
from both axienet_dma_err_handler and axienet_dma_bd_release (instead of
repeating it) is a good idea like I mentioned in the last post.

The code seems right tho even tho I don't like duplicating the logic.

Reviewed-by: Joe Damato <joe@dama.to>

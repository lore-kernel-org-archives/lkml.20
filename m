Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253949;
	b=vbi/0gkCWI0RzbUJaKfCwkP2Si/A12O95GBrYI5srhl+vJs7JKHV4f0/diIIvlRCtrc4
	 qNc0C9m85m1p3ZJLLZMqdEGZAN54hzEd5y+Rw+Wjp7zuRudzlQi1kn+awWJHAz0s6C8Mt
	 RU9v+jRBYww19gyCJqjCFWtzB5iNaVQg5jIISrvF6wXxHJ5PMnDU6XG1nhJ7SJN90xZsT
	 b/xlj3AdaGYc++9uLNjvb3AY5I6lR8vVupYVB+2R8Yr8xwRUX9oLQdqBpdxZgmirGgypO
	 pXFI4WdQT031dKtZm6ZCaKatIN713sdR7Fzb7PyoJ3MT1X9qXB2Banl8INgppm5VqSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CYn/R34FqaVTugz9HGa38ChMyKLFvEBcLq0J7uZaCd4=;
	b=SaNzOW8/NX7w4n9e58c5jN0SmG4mSzS1RdF51H1eRWzXCBcjc+H5Mgxb2dnyQC45zyjq
	 SGACwCqM15pqaQMTPAgzqgToWDWPFADvmQikhGXAoAukQgNMrHEERGzmzdE5AJqikjneo
	 AkntrARmqrKwBWn9NKKjFKiHudZm56EQb5/vk/RzDj6G0cRleGsm4/13LvOvhVxjjQPY1
	 Ac1QOnTluB8k1oiq4DfaNdU9GlBQNvlKnIWr0orCqjj2cjGr5YV9cYrEhEdV4zCZGckL1
	 /kceex2W6IksTD5TpZTmHMD7pUtX3DGHFBTXi/AS1VJ7Lyd3QhdaihLzaZjqujok67w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q35kc13h;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202D606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8202D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q35kc13h
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso643314a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794253948; x=1794858748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYn/R34FqaVTugz9HGa38ChMyKLFvEBcLq0J7uZaCd4=;
        b=Q35kc13hDlHEj8m7smn++e/6LurYuxhyfq8J7QmjTx6zRcpCWdRyR7UnNht2Ce0ROJ
         ybI7J/uUxA4yMfvOB8Q4XandA+vzQZpTdCERnFn5KnRqKdeeQToygYOR4q2bfR0yGcMB
         knj6FcJ5Y3sfi9GVyxpDO1DiK3klGGe5J6JLZ1D+p2uX2DWGjAE6uWCSzsan+meO2RnS
         +6v5jYzo23kKaQvtnnqZvaHxJICQy5Rk1ay9p2Ut2I3Gxe/tH7UVFgqAEuvhKeB6zSvD
         cFVKjg0+rm1nPxR/6wvACwLZJNSUHXW0bu2e7KieJBy9AdRm4EMaqpBVYEt97Z9jEZ/G
         59WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253948; x=1794858748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYn/R34FqaVTugz9HGa38ChMyKLFvEBcLq0J7uZaCd4=;
        b=auw+whABzOz+MfZoU9E+mJfGpyVGv3DDqCnjvQ8+i0dan+TKVmVUgsQhiIDqvNMGgz
         Z+pS6xPCt3NtNHsPD9Cp2/Ob17m6N0eOh/KlCma21Ltj88ytgMiSyXaNE8c9yCz/TrX+
         qHq3+ETcDUpFkPSnVO62Y+8ogleoKwOY443qLNcj3J2yy9UVAon97fWqysq2n+uFAjcq
         sDak9E9jpPNKBvKczRZ9yKSnh0iCSpS6PSeXGsqijdABI03Pqine9kWXErRjYjdCgwGb
         inxocDd5+/vGZNsB0lJPRp/xle7jKWCju0uI6EDUBHeiBz9Bk8P9sUSNekIQofO7TA9J
         6DpQ==
X-Forwarded-Encrypted: i=1; AL+hErGgLa3kz4YyAx6HIUvq3csvhLYBvL5ClqgUw3Xs/zjpn+rZBiPMd6QuPVA4AP+XPqZ/NaQ3dXH26hi++lM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BYoOxHTtzMrhlcEntad9g+UABEcCL0+y/TJTFH53t/dHRSg66
	edxG1lPgLwwBp3E1SOu/Od9VQJEbyb65g22atiI1Efj9lJCORb4hkDpd82et0YEFlPE=
X-Gm-Gg: AYBFou3CLX7DcEmE9dHIFIptoRmdlwp+hofSE1gL7/bFpG4FBm97BHExouviPPOJQ5Z
	prNZMpBm69uixy7TQnc9ohuIFOeaTQmUM84qUAPW2x3bIeEp4On7MsulyUsgsUdqbhxkBT08pQW
	8Nw8wArNmcOunLumPiouVrWN4wteC8QSsOXoSwQty7/Ud/E5j4fju0Ano+k+fpMO7MSU8TsOCBo
	X7qI5iS6pewjVqH2f3qzwEtjkRoLdr0VPjG3Wz42PqwBLRGLR8FWSGJ0LxPO8S0cRRhEmQtvFw2
	aZFSquQu5Zw6CSAYXYR2L2rrtLYRaoBMPmcY+RF/bSZh2vS9fIlIFYzQm2CF8olt02rNlUAR0tK
	nnovBDa3fPjS3WVT25UvDnikXcIp2kTIh1JmSHm2P2kxO+JZ8Dg5W9oQAl/BJ+Wh24XIvo2T/jy
	oYxmIIkbJJ88Z2pMt3zh0YiKPSp3aTC9TyC7j9372tFwcgaVysjpmg97OcSvG/lkuv9Gm5vL7iV
	4Z7qoeBiK9gNjnDHXgrgwWikfdHFhqNt5EKz7aSgWC9EHs4RQGPgDYKs9/GoTufoQMkPKfgWwWK
	deqTg3Yhj6kybBTsAALbpqe2TGmdNRxTP1bWps4Qfw==
X-Received: by 2002:a17:90b:5244:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b166cfb53bmr620088a91.65.1794253947447;
        Mon, 09 Nov 2026 11:52:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1677849b1sm718789a91.17.2026.11.09.11.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:52:25 -0800 (PST)
Date: Mon, 9 Nov 2026 11:52:25 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 3/4] bnxt_en: stop DMA before releasing rings the
 firmware did not free
Message-ID: <avIkeUg5Qxf6LGQY@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
References: <20261106191423.4194081-4-joe@dama.to>
 <179408153226.994134.1709355150317602595@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179408153226.994134.1709355150317602595@kernel.org>

On Sat, Nov 07, 2026 at 07:58:52PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 · Medium: 4 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix leaves out completion/NQ rings and stat contexts.
> - [High] The queue-restart path still frees ring memory after a RING_FREE
>   failure.
> - [Medium] bnxt_stop_dma() calls pci_clear_master() on the whole PCI
>   function without quiescing anything else that uses it.
> - [Medium] The trigger for an irreversible bus-master disable is broader
>   than the commit justifies.
> - [Medium] Bus mastering can be turned back on while stale firmware rings
>   may still exist.
> - [Medium] RING_FREE failures that only happen because a firmware reset
>   is in progress are counted as stuck rings, and in the final series…
> 
> --
> 
> bnxt_en: stop DMA before releasing rings the firmware did not free
> 
> This commit makes bnxt_hwrm_ring_free() count TX, RX and RX AGG rings
> whose HWRM_RING_FREE failed and return -EIO when any failed. The error
> goes up through bnxt_hwrm_resource_free() to the close, half-close and
> init_chip error paths. Those paths then call a new bnxt_stop_dma() helper,
> which clears PCI bus mastering before ring memory is released.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index ea8529c789947..b5ef86bf92bf5 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -7773,21 +7773,25 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
> >  			memset(cpr->cp_desc_ring[i], 0, size);
> >  }
> >  
> > -static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> > +static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> >  {
> > +	int stuck = 0;
> >  	u32 type;
> >  	int i;
> >  
> >  	if (!bp->bnapi)
> > -		return;
> > +		return 0;
> >  
> >  	for (i = 0; i < bp->tx_nr_rings; i++)
> > -		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
> > +		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path))
> > +			stuck++;
> 
> [Severity: Medium]
> Does every non-zero return here really mean the firmware did not free the
> ring? hwrm_ring_free_send_msg() returns the same -EIO for several
> different cases:
> 
> hwrm_ring_free_send_msg() {
> 	...
> 	if (rc || error_code) {
> 		netdev_err(bp->dev, "hwrm_ring_free type %d failed. rc:%x err:%x\n",
> 			   ring_type, rc, error_code);
> 		return -EIO;
> 	}
> 	...
> }
> 
> A timeout ends up here. So does a firmware reply with a non-zero
> error_code, for example a rejection of a ring ID the firmware no longer
> tracks. Local failures from __hwrm_send() also end up here: -EBUSY when
> BNXT_NO_FW_ACCESS() becomes true, or -ENOMEM from token acquisition.
> 
> The commit message only makes the case for "When HWRM_RING_FREE is not
> answered". An explicit error reply means the firmware processed the
> command.
> 
> Before this patch such a reply was only logged and the device could be
> reopened. Now it leads to bnxt_stop_dma() and the driver has to be
> rebound. Should stuck only count the case where no response arrived?

I think this is legit, will fix in next revision.

> >  
> >  	bnxt_cancel_dim(bp);
> >  	for (i = 0; i < bp->rx_nr_rings; i++) {
> > -		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
> > -		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
> > +		if (bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path))
> > +			stuck++;
> > +		if (bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path))
> > +			stuck++;
> >  	}
> 
> [Severity: High]
> Earlier in the series these helpers were changed to return the RING_FREE
> status, but the queue restart path still ignores it. Can that path free
> ring memory after an unanswered RING_FREE?
> 
> bnxt_queue_stop() {
> 	...
> 	bnxt_hwrm_rx_ring_free(bp, rxr, false);
> 	bnxt_hwrm_rx_agg_ring_free(bp, rxr, false);
> 	...
> 	if (bp->tph_mode) {
> 		bnxt_hwrm_cp_ring_free(bp, rxr->rx_cpr);
> 		bnxt_clear_one_cp_ring(bp, rxr->rx_cpr);
> 	}
> 	...
> 	return 0;
> }
> 
> With TPH, bnxt_tx_queue_stop() does the same for TX, then unmaps the TX
> buffers straight away:
> 
> 		bnxt_hwrm_tx_ring_free(bp, txr, true);
> 		bnxt_hwrm_cp_ring_free(bp, txr->tx_cpr);
> 		bnxt_free_one_tx_ring_skbs(bp, txr, txr->txq_index);
> 		bnxt_clear_one_cp_ring(bp, txr->tx_cpr);
> 
> bnxt_queue_stop() returns 0, so netdev_rx_queue_restart() treats the stop
> as successful and calls ndo_queue_mem_free(old_mem). That frees the old
> RX descriptor rings and the page_pool buffers the firmware may still be
> writing to:
> 
> netdev_rx_queue_restart()
>   bnxt_queue_stop()
>     bnxt_hwrm_rx_ring_free()    <- -EIO, ignored
>   ndo_queue_mem_free(old_mem)
> 
> This path can be reached from bnxt_tph_update() on an IRQ affinity
> change, from devmem dmabuf bind/unbind, or from io_uring zcrx
> registration.
> 
> Neither this patch nor the later "bnxt_en: refuse to open a device with
> stopped DMA" changes these paths. Should they be handled the same way?

I think this is work that should be deferred to net-next because it addresses
a different path than this series is trying to fix. So, I'm going to disagree
with Sashiko on this one. I think the feedback is valid, but I don't think it
make sense to include in this series.

> >  
> >  	/* The completion rings are about to be freed.  After that the
> > @@ -7817,6 +7821,19 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> >  			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
> >  		}
> >  	}
> > +
> > +	if (!stuck)
> > +		return 0;
> 
> [Severity: High]
> Only the TX, RX and RX AGG frees are counted in stuck. Can the firmware
> still own completion or NQ ring memory when this returns 0?

Same as in my other reply; I only saw this issue on hardware where RX and TX
failed. I suppose it is possible that only completion or NQ rings fail, but I
have not observed this.

I think dealing with that case is probably net-next material since it doesn't
address the failure I actually saw in prod.

> > +
> > +	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
> > +	return -EIO;
> > +}
> > +
> > +static void bnxt_stop_dma(struct bnxt *bp)
> > +{
> > +	netdev_err(bp->dev,
> > +		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
> > +	pci_clear_master(bp->pdev);
> 
> [Severity: Medium]
> The commit message says:
> 
>   "bnxt_hwrm_resource_free() still frees the remaining firmware
>   resources before returning the error, so the shutdown can send every
>   message it needs to before the device is stopped."
> 
> Is that accurate? The firmware DMA-writes HWRM responses into host
> memory:
> 
> __hwrm_req_init() {
> 	...
> 	ctx->req->resp_addr = cpu_to_le64(dma_handle + BNXT_HWRM_RESP_OFFSET);
> 	...
> }
> 
> Once bus mastering is cleared, every later HWRM can only time out, and
> bnxt_close() still sends messages after the close:
> 
> bnxt_close() {
> 	...
> 	bnxt_close_nic(bp, true, true);
> 	bnxt_hwrm_shutdown_link(bp);
> 	bnxt_hwrm_if_change(bp, false);
> 	...
> }
> 
> bnxt_fw_reset_close() likewise sends HWRM_FUNC_DRV_UNRGTR through
> bnxt_hwrm_func_drv_unrgtr() after __bnxt_close_nic().
> 
> pci_clear_master() also acts on the whole PCI function, which the bnxt_re
> auxiliary device shares. The normal close and TX timeout reset paths
> (bnxt_close(), and bnxt_reset() -> bnxt_reset_task()) never call
> bnxt_ulp_stop().
> 
> The driver's existing paths that disable the device all call
> bnxt_ulp_stop() first: bnxt_fw_exception()/bnxt_fw_reset() before
> bnxt_fw_reset_close(), bnxt_io_error_detected() and bnxt_suspend().
> 
> Would bnxt_re lose DMA, MSI-X delivery and its HWRM channel here without
> being notified?
> 
> A separate concern, an immediate reopen through bnxt_reset_task() ->
> bnxt_open_nic(), is fixed later in the series by "bnxt_en: refuse to
> open a device with stopped DMA". The ULP and post-stop HWRM issues are
> still present at the end of the series.

I think this is legit and should be addressed in the next revision.

> [Severity: Medium]
> Can bus mastering be turned back on while the firmware still has the
> stuck rings? No caller of pci_set_master() in the driver checks for the
> stopped state first. For example:
> 
> bnxt_resume() {
> 	...
> 	pci_set_master(bp->pdev);
> 	if (bnxt_hwrm_ver_get(bp)) {
> 		rc = -ENODEV;
> 		goto resume_exit;
> 	}
> 	rc = bnxt_hwrm_func_reset(bp);
> 	if (rc) {
> 		rc = -EBUSY;
> 		goto resume_exit;
> 	}
> 	...
> }
> 
> VER_GET or FUNC_RESET may well fail if the firmware has already stopped
> answering RING_FREE. Resume then exits with bus mastering on and nothing
> reset.
> 
> If the function kept its ring context across suspend (D3hot without an
> internal reset), could the stuck RX rings then DMA into pages that
> bnxt_free_mem() has already released?
> 
> bnxt_fw_reset_task() also calls pci_set_master() unconditionally in its
> ENABLE_DEV state.
> 
> The later "bnxt_en: refuse to open a device with stopped DMA" only blocks
> bnxt_open*(). So "the driver must be rebound to recover" holds for open,
> but not for bus mastering being re-enabled.

Honestly not sure about this one. Maybe I'm reading this wrong, but it seems
like before this series DMA stayed enabled the entire time memory was freed
and this series does not make that worse.

So, I gotta think about this one, but I am kinda feeling like this net-next
material, too?

> >  }
> >  
> >  static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
> 
> [ ... ]
> 
> > @@ -13540,7 +13561,8 @@ static void __bnxt_close_nic(struct bnxt *bp, bool irq_re_init,
> >  	if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
> >  		bnxt_clear_rss_ctxs(bp);
> >  	/* Flush rings and disable interrupts */
> > -	bnxt_shutdown_nic(bp, irq_re_init);
> > +	if (bnxt_shutdown_nic(bp, irq_re_init))
> > +		bnxt_stop_dma(bp);
> 
> [Severity: Medium]
> What happens when the only reason these RING_FREEs fail is a firmware
> reset in progress?
> 
> NAPI and bnxt_timer are still running here, because bnxt_disable_napi()
> and timer_delete_sync() come after bnxt_shutdown_nic(). The async
> RESET_NOTIFY handler can set BNXT_STATE_FW_FATAL_COND after
> hwrm_ring_free_send_msg() has passed its BNXT_NO_FW_ACCESS() check.
> __hwrm_send() then returns -EBUSY.
> 
> __hwrm_send() also abandons the wait if the firmware health register
> reports not healthy:
> 
> __hwrm_send() {
> 	...
> 				if (hwrm_wait_must_abort(bp, req_type, &sts)) {
> 					hwrm_err(bp, ctx, "Resp cmpl intr abandoning msg: 0x%x due to firmware status: 0x%x\n",
> 						 req_type, sts);
> 					goto exit;
> 	...
> }
> 
> bnxt_close_nic() already notes that "Some firmware messages may fail as
> we proceed to close" when BNXT_STATE_IN_FW_RESET is set. With this
> patch, each such failure becomes -EIO, stuck++ and then bnxt_stop_dma().
> 
> That includes the FW reset close path itself:
> 
> bnxt_fw_reset_task()
>   bnxt_fw_reset_close()
>     __bnxt_close_nic()
>       bnxt_shutdown_nic()    <- -EIO
>       bnxt_stop_dma()
> 
> After the later "bnxt_en: refuse to open a device with stopped DMA",
> bnxt_stop_dma() also sets BNXT_STATE_DMA_STOPPED, and nothing clears it.
> 
> The reset still re-enables bus mastering in ENABLE_DEV. But in the
> OPENING state, bnxt_open() then fails in bnxt_check_dma_stopped() with
> -ENODEV, and bnxt_fw_reset_abort() runs.
> 
> If a close races with a reset, bnxt_close_nic() sets ABORT_ERR. A later
> bnxt_open() is then refused before it reaches bnxt_reinit_after_abort(),
> which doesn't call pci_set_master() anyway.
> 
> Before this patch a coordinated FW reset could recover the device. Is it
> intended that a rebind is now the only way to recover?

I think this is legit and should be addressed in the next revision.

pw-bot: cr

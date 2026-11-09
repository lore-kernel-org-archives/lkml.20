Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254479;
	b=zC9aCg2LeIyB5CgD3vEKsNoh1SdZ4erozZT0jmD1BlNabmrLOF98Oi+0VFAMkzDlpkUU
	 QnrcWd4uiHy5cNeesAikjOugl49eNI91IiecTU3AsjkDr+vY9Cogy8PYr5ENPk/nQ1f5F
	 qZoM7cAduWzGPHDzB4EK8rj7G+f2u8CmuzyxPTFot3db6n1tqNUQPFQdG/O/3YawKk2mR
	 PrffN5HHJviiIxDQq4zHFSsHuFQ2hdSHaSC8ZESyNH8Oe0uZMiwqNhSgyPcs260jzFTHA
	 z2g1fsxtkHCIf2NGHAu1D0ZRhITKnZW/bQtAwadCjLCyUffrplylS3AK+krcp50BooA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yA23z4yOnKKRlyyLN3GGBrI/kuieXon5A0VUpF0/2ig=;
	b=IlexdPv0ji1EsjwQnEnupV8n1/23Foqyxg7Avv+fRST/vD8T6qHU3BSQ20lYhyHhiTyn
	 6ubnqyhkFFmZwa7tBO8vUGbVdG1rYtuLDYILqgXw5SKhFfwORv9rqzyrjgZjZ7zd5tW6P
	 e4zQLLVHSi2YvD9NAY3MuRhXSDP7QEODFlmRbEADJp2cwXlIdXRSFl/8v/vlMSpv9MSX9
	 jUqPgmqdWIswS135jZ3NDDqUsCSlOmoJHxlz9ser1h4m3yv6KswA5/QJqSbvYpoos9Vh2
	 hntGtfXc5xqL6bUOT2b6+QviFHztk00JGNQtU8bBW5MImcXnZ9B9FwgCyiqpwkJOzeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RSP7PjJg;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0F606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE0F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RSP7PjJg
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab938dc83so500450a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794254478; x=1794859278; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yA23z4yOnKKRlyyLN3GGBrI/kuieXon5A0VUpF0/2ig=;
        b=RSP7PjJgSKGdEsZIhIntAgjQ7XFA1XLJxkZ+5pkFGSlvYOP2v+iCQmVUHXExBjE3Oo
         WS/iFyWLU8VIE0Z/tHaac+s9mVvB6xEHkjePPZl8FkNhMrCq5oiOVVfPLSClRuUDzuPa
         vSnaIZ5dbWaQ+0/e4GgqIEAF9yYxqW1+ycGai5Q46NGEJUv19Of/PMICfMEdHGStXFMf
         uLlFd8b6m44HofFENfcyn5h9Yja+ydUd20utIP2f1ZFfdPcfCdKArk8PEzS1iBdB6GMU
         x46tznanicGEj7xgEFzYezK1uO5xeUW12j/p5dPsPw6Q4YPFT4G4OgWxlEkno9xK8ke2
         dkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254478; x=1794859278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yA23z4yOnKKRlyyLN3GGBrI/kuieXon5A0VUpF0/2ig=;
        b=omhQA61RyXcXrQAViubiacxuttdHgJu+eOiziECK+URK0yjL++oV9R8Nbb4ij6lN2L
         uoknT60NydQ+9gCRE8MIsWbzWTglyvlh3atKt2bGVKaYEIHRI+qa7xTQqBdl9hOu/Thi
         F4+Tl9FTiWO63rd0DhWUdH4jNldq6n53a5Urjq/xkQIaOmEvWrox6c+xCzSJ86dg2QLO
         SNP1Hg8df8ebPkbGfVmzce7fH5XPqyrst9RsML+6NWz8ytvrDR/NY2J1F0kODg70yFAM
         Ik4YiyFPzHUE6oDBGkeDPooTV6YGfFXhk+Xe7c4WWshcQviMuKb5e0EikSHDX5I9fF1v
         Ns/w==
X-Forwarded-Encrypted: i=1; AL+hErHK9AecI3Ml7MGY5D68oo4rMNUYvF+jj+JfC04gXoIsNuS35bjOajNM0XuJP9qCNKilgX5RdN6uA09Bih0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JrptrMddiQRLtW5tGMspPtj6mMtOLo9xF2IkKiYoCahtrh7gl
	NbbCAU3ga526KfAPK/lqweewbTjE+64XINvvPMCZxWtSlJG5o5cx403hk3ri51BxDTI=
X-Gm-Gg: AYBFou18t2RoWM60ebULRZy2OMZkAmOuHeEOg6NBhPWz1Gd3aF+Z4P9jHF4ig8RMFFR
	le1YE74DcpqdnPcHbZRrb9zO0sv5HsDPU6Caku0VAMa6SJTfpbA+hNVu5kJ25pnXNI1y+R3Rrti
	eTK+0YB8Fwy9LKfLbj1gspZsu8s3ybW//LsgFHsiTMvRAxRQhrm2wBePly0KGOwrBQM1Y7YxxX0
	AND3xVAtQhY/yDAOFz2OBK15TQvvVqS/OQYUCH3TvYbPA0hSq1CQRhnnKdbG0YTX8zrrP5UNEFP
	n7KLpuEjmo+nmz8zxz4YgT4vRwyNrAB4ZUOxEgn41NdKYcSyZDMhrCWgRYrN0BHgujWxo0uIISh
	v67hNuT5AU1eSrBc7LcLvwIEv5ppzrkB+f8vXlD5VENcvcXifbDdu0oULePVu9gvANu7ELrjVEh
	i9keVzNsxmhiOnAu6owK0lzzIPlsKpKJK+1mTqMGoU19zgLBfg2tFMjmtP0DlswXR+wt3++TNOI
	HgJlbRSup8NxlA9/0gLVDATV72nqfSg8bKouiZJkR9exsNSACrCQyIth3puQkxgJB5FgrSyR3l4
	mDmi/JL9NZVZmbbLtZLVXDDa8BNQKOIoh0wWbEQ6
X-Received: by 2002:a17:90b:57ec:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b166cde77dmr665628a91.17.1794254478070;
        Mon, 09 Nov 2026 12:01:18 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm743210a91.9.2026.11.09.12.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:01:17 -0800 (PST)
Date: Mon, 9 Nov 2026 12:01:16 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 4/4] bnxt_en: refuse to open a device with stopped
 DMA
Message-ID: <avImjJ+PNQBhGwXT@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
References: <20261106191423.4194081-5-joe@dama.to>
 <179408153359.994134.12098598533748017138@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179408153359.994134.12098598533748017138@kernel.org>

On Sat, Nov 07, 2026 at 07:58:53PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch blocks driver recovery after a full device reset.
> - [Medium] bnxt_en: missing BNXT_STATE_DMA_STOPPED check in
>   BNXT_NO_FW_ACCESS()
> 
> --
> 
> bnxt_en: refuse to open a device with stopped DMA
> 
> This adds a BNXT_STATE_DMA_STOPPED bit. bnxt_stop_dma() sets it after
> the firmware fails to free rings and bus mastering is cleared. While the
> bit is set, bnxt_open(), bnxt_open_nic() and bnxt_half_open_nic() refuse
> to open the device, so the user has to rebind the driver.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index b5ef86bf92bf5..eb885fd74064f 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -7833,9 +7833,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
> >  {
> >  	netdev_err(bp->dev,
> >  		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
> > +	set_bit(BNXT_STATE_DMA_STOPPED, &bp->state);
> >  	pci_clear_master(bp->pdev);
> >  }
> 
> [Severity: Medium]
> Once bnxt_stop_dma() has cleared bus mastering, can any later HWRM
> command complete? The firmware writes HWRM responses into host memory
> by DMA. With BNXT_FW_CAP_SHORT_CMD it also fetches the request by DMA.
> With the master bit cleared, __hwrm_send() should just poll until
> each command times out.
> 
> BNXT_NO_FW_ACCESS() only tests BNXT_STATE_FW_FATAL_COND and
> pci_channel_offline(). The new BNXT_STATE_DMA_STOPPED bit is never
> consulted there, so nothing stops these commands from being sent.
> 
> After the failed ring free, __bnxt_close_nic() continues into
> bnxt_free_mem(), which calls bnxt_free_ntp_fltrs() and
> bnxt_free_l2_filters(). bnxt_close() then sends
> bnxt_hwrm_shutdown_link() and bnxt_hwrm_if_change(). The netif_close()
> teardown after a failed bnxt_open_nic() goes through the same path.
> 
> Suppose the user follows the log message and rebinds the driver.
> bnxt_remove_one() still sends bnxt_hwrm_func_drv_unrgtr() and the rest
> of the teardown commands, and each of them waits for its full timeout
> too.
> 
> Most of this runs under rtnl_lock and the netdev instance lock. Every
> stalled command lengthens how long those locks are held. Close and
> unbind of a device that has already failed can therefore take a long
> time.
> 
> Should BNXT_NO_FW_ACCESS() also test BNXT_STATE_DMA_STOPPED, so that
> __hwrm_send() fails these commands immediately? If so, the bit would
> have to be cleared wherever bus mastering is turned back on:
> bnxt_fw_reset_task(), bnxt_resume() and bnxt_io_slot_reset().
> Otherwise the HWRM commands those paths send right after
> pci_set_master() would be refused as well.

I think this is legit and BNXT_NO_FW_ACCESS should test
BNXT_STATE_DMA_STOPPED. So, I'll do that in the next version.

> [ ... ]
> 
> > @@ -13505,6 +13521,10 @@ static int bnxt_open(struct net_device *dev)
> >  	struct bnxt *bp = netdev_priv(dev);
> >  	int rc;
> >  
> > +	rc = bnxt_check_dma_stopped(bp);
> > +	if (rc)
> > +		return rc;
> > +
> >  	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
> >  		rc = bnxt_reinit_after_abort(bp);
> >  		if (rc) {
> 
> [Severity: Medium]
> Nothing in the driver clears BNXT_STATE_DMA_STOPPED. That includes the
> paths that fully reset the device and call pci_set_master() again.
> 
> This check also runs before bnxt_reinit_after_abort() and
> bnxt_hwrm_if_change(). Could that make the firmware reset, resume and AER
> recovery paths fail every time?
> 
> In a non-fatal firmware reset, bnxt_fw_reset_close()->__bnxt_close_nic()
> still sends HWRM_RING_FREE. Ring free is only skipped for FW_FATAL_COND
> or when the PCI channel is offline. If ring free fails there:
> 
> __bnxt_close_nic()
>     if (bnxt_shutdown_nic(bp, irq_re_init))
>         bnxt_stop_dma(bp);
> 
> bnxt_fw_reset_task() then turns bus mastering back on and waits for the
> firmware to come up, but the open is refused:
> 
> bnxt_fw_reset_task()
>     pci_set_master(bp->pdev);
>     ...
>     case BNXT_FW_RESET_STATE_OPENING:
>         ...
>         rc = bnxt_open(bp->dev);
>         if (rc) {
>             netdev_err(bp->dev, "bnxt_open() failed during FW reset\n");
>             bnxt_fw_reset_abort(bp, rc);
> 
> Suspend/resume looks similar. bnxt_suspend()->bnxt_close() can set the
> bit, and then bnxt_resume() does:
> 
> bnxt_resume()
>     pci_set_master(bp->pdev);
>     if (bnxt_hwrm_ver_get(bp)) {
>     ...
>     rc = bnxt_hwrm_func_reset(bp);
>     ...
>     if (netif_running(dev)) {
>         rc = bnxt_open(dev);
> 
> A rebind runs the same pci_set_master() plus HWRM_FUNC_RESET sequence, in
> bnxt_init_board() and bnxt_fw_init_one_p1(). Even so, bnxt_open() fails
> here and the netdev stays detached.
> 
> AER has the same problem. Suppose an earlier failed close left the bit
> set. bnxt_io_slot_reset() hard resets the slot, calls pci_set_master()
> and then bnxt_hwrm_func_reset(). After that, bnxt_io_resume()->bnxt_open()
> and any later ifup are still refused.
> 
> With only the preceding commit "bnxt_en: stop DMA before releasing rings
> the firmware did not free", these paths turned bus mastering back on and
> bnxt_open() succeeded.
> 
> The fatal firmware error path already handles a similar case.
> bnxt_fw_fatal_close() calls pci_disable_device(), and the reset task
> later calls pci_set_master() and reopens the device.
> 
> The commit message says "the device needs manual intervention by the
> user to become usable again". Does that still hold once the firmware or
> the function has been reset?
> 
> Should the bit be cleared, or the check skipped, after a firmware reset,
> HWRM_FUNC_RESET or slot reset completes?

IMHO, this behavior is intentional. If ring free fails for some reason the
device is intentionally left unrecoverable without manual intervention.

It's not clear to me if other paths should be able to clear the bit and
re-enable DMA.

So, I think I'm going to disagree with Sashiko on this one.

pw-bot: cr

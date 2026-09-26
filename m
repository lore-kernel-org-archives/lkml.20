Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1A45C6E0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436219; cv=none; b=eIpUgsaffob75ZKig5Ckc+V4RMGBqwW0TA1BKifGhQkUQ23gOFRBjyKxZguDSQ2eUHkmtoZHOGiU8jE17ag7Zr1lOM1uXImwL6VQwng8iKRNZETXco1Bf5p2SSiRu0HYgl199XJGOsD5THqlq2An35QQzmSvKMV8c8nORFakRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436219; c=relaxed/simple;
	bh=0umEdwiL8pHccpdqd2wUgGrHwmhXMyTGQxPB/23fc2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8cIb7J7ZLyJzTjTcbuYRMbMlzecyb403ZwcLEdhnz5eAyG/69WNnkBqPY2PG1nftFOJbbCZnF6c03fhsfS0NdRIwSdXugwd2GOE6uIAg4mpc1XcWx1CFCF1JkU+1CMLPXgzq3TSlrItPhV8w7Kxz6h6zaPuKbguJ24g+O626F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz8t1790436087t11894747
X-QQ-Originating-IP: lOj93Et+AslTzArJ8F/+z6u0i9S4wSuteJ+XAzVqYrc=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 26 Sep 2026 23:21:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14288034212453184480
EX-QQ-RecipientCnt: 12
Date: Sat, 26 Sep 2026 23:21:24 +0800
From: Yibo Dong <dong100@mucse.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, vadim.fedorenko@linux.dev,
	u.kleine-koenig@baylibre.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, yaojun@mucse.com
Subject: Re: [PATCH net-next v13 2/5] net: rnpgbe: Add basic TX packet
 transmission support
Message-ID: <E0433BAD8940027F+20260926152124.GA880591@nic-Precision-5820-Tower>
References: <5CF5340DA3D4CE3C+20260920092622.345496-1-dong100@mucse.com>
 <178998604523.2160803.309404195274642417@kernel.org>
 <20260925160705.GQ13925@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925160705.GQ13925@horms.kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: No3MeJ/+VGEEFUcudV61MkvhBVqBHTrcCjufQSPMAGFatjsXNbCVVi+3
	eZudE+j9kTO2JnydNWhUYko7oQYsALGtdDYihaLDkb6B2lSfhFSfYVmRsRUSxke6BPvIMNx
	zy6ipGC7JMRc4zFcSPOTbOcJ3IVYfUiHtnP5kfTc3Nvl+1Y1WWuq3kOCzEBif8jjoBq9QLh
	3f1/BMr1gsKCX+bM8TFfXtzwkgUI/iFEqQW9H4InzaVi8j9TmbRU6UEuVUynS8u0e9AF9o4
	6a+hVpegQCbkc0W+g3HobjS9IoJ0aHjPbhiIwJ1OARWb5qqo8EKdnL3u+FMD1IvbewXGDii
	4nvjoup8QdnKHVud9y62SKdom2oI0QTxaGxwIEEvGM7SGzqeyP5giAtdVlYHmToJNlj0u1E
	Kl/wW1poNDzJhIy9iURPp66BWWaLVhd8/YqwPV4ntN44xP+0+WLHPbj+WbPu+btyIrUWs3J
	XU+VljYcUID1pc0cYBchSi9ZREPOi9G/np66lFOQEWLjGXyOX88TMavjukZ9jY02INQkvFW
	nr/S7MAEPjK32q6ap9zIIigUjMvrsoHzK38M7RWL+R1n3LkbL1b1InPmQk3WYCp49gDKU6W
	cTFWXT1ZrtSTUl09mwC7JdeQdAiPEXZg3q1Y97rhUq4LDARJt9TMkV/FubluJNfH1nbekcq
	HxZkfHPGlZSKoKNA3OQJYLnyprzzjpgMiXPHh3F2Q/BIqXIvTcyrrFfm6VumUrWt5jH6eBN
	c03jXud5hnZoaOe63H8/MuD9JgVCslWMDL3nb9kZMNpb9yZSH3iAevtSwKgoiM1M8PIcCLT
	YJQ08VwXb4sBBTeL/BqYX9FexC9tnzM+y+vKHz1QSA7H61DpPszo6x2CQP8HNKZbc4KP4wK
	dWjiEp/D264Sh935p1FlmZTEyxyVckDn9KFvppB++nWW8cjJWcm6PlnuXbRbEJq1VDDQBC3
	PSGlQeuH5eCT/122ovP+DqtQtJmQ456HBAoyfAOyJB84VjRzUlb+xQoHYu7XOAm9H1Ebcnr
	QjKTZ+SCjVSII/v5nipLbnaMl17n058oCYuYxfN+k9/zSPXMQ2GgWnDJp3nFnDYxji5FcAS
	g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Fri, Sep 25, 2026 at 05:07:05PM +0100, Simon Horman wrote:
> On Mon, Sep 21, 2026 at 10:20:45AM +0000, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential
> > issue(s) to consider.
> > 
> > Critical: 0 · High: 0 · Medium: 2 · Low: 3
> > 
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchwork
> > know by including "pw-bot: cr" as a separate line at the end of your reply
> > (one such reply per series is enough).
> 
> Hi Dong,
> 
> There is an expectation that the patch author responds to these
> AI-generated reviews as described above.
> 
> In order to move things along I'll provide some feedback on this one
> (but not the other's for this patchset).
> 

Thanks for the heads‑up and your feedback.
I will fix the issues and send out a revised version for this patchset.
Starting from the next submission, I will respond promptly to AI‑generated reviews.

> > 
> > [Severity: Medium]
> > Should the return value of dma_set_mask_and_coherent() still be checked
> > here? The previous code aborted probe and printed "No usable DMA
> > configuration, aborting", and dma_set_mask_and_coherent() is a plain static
> > inline int with no __must_check, so a failure is now completely silent.
> > 
> > If dma_supported() rejects a 56-bit mask, neither the streaming nor the
> > coherent mask is changed, the device keeps the PCI core's 32-bit default,
> > and probe continues through pci_request_mem_regions() to register_netdev().
> > 
> > The dma_get_mask() test above keeps highmem frags away by not setting
> > NETIF_F_HIGHDMA, but it does not cover the linear-data mapping in
> > rnpgbe_tx_map():
> > 
> > 	dma = dma_map_single(tx_ring->dev, skb->data, size,
> > 			     DMA_TO_DEVICE);
> > 	...
> > 	if (dma_mapping_error(tx_ring->dev, dma))
> > 		goto err_unmap;
> > 
> > nor the descriptor allocation in rnpgbe_setup_tx_resources():
> > 
> > 	tx_ring->desc = dma_alloc_coherent(dev, tx_ring->size, &tx_ring->dma,
> > 					   GFP_KERNEL);
> > 
> > So every frame whose linear data sits above 4GB would be dropped with only
> > the private per-ring dropped counter moving and no kernel message.
> > 
> > The commit message says only:
> > 
> >   "Configure streaming and coherent DMA masks for the hardware's 56-bit
> >   DMA addressing capability."
> > 
> > Could it also state that a DMA configuration failure is now non-fatal and
> > unreported, or could the check and the error path be restored?
> > 
> > The call is still unchecked at the end of the series, so no later patch
> > covers this.
> 
> I wonder if this is a side-effect of the development of this patch-set.
> It does look like a regression that should be addressed in this patch.
> 
I left the return value unchecked because Documentation/core-api/dma-api-howto.rst
states that dma_set_mask_and_coherent() does not fail for masks wider than 32 bits.
And feedback for other patches point this out:
https://lore.kernel.org/netdev/20260814123330.4b8056f5@kernel.org/
So maybe uncheck the return of dma_set_mask_and_coherent here is ok? Or
I should check the return?
> -- 
> pw-bot: changes-requested
> 

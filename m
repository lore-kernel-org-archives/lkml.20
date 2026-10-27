Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102254;
	b=QEDx6xhzz659OUtFXPXnkLLklL2jC031cmUXAy7Ez3TLQv7xLdK0Tk/lxWjwP2ia600j
	 G611hI1kcKY2ccVIBVjj81he6FcEAF/QziEV66Fql1CxccmxOoKqZrqrYGk2vRBw66psD
	 1+8vh+AdXsSpD0JK60WiHvGHh+XX1YppflsDRfRNPGFjt41v/cTu2O/Zf4FN1hc/q2Msk
	 wWdRF76H7BnHLoF1vepFqWLiFcup8GgdCuzsosQRhLFH419Sz97iTp13MX3R5m1bdwhCX
	 /06yaxHAPFzGca1DOsYdBc+WjRX8wrNwurwcmJd4hIBNLBPEbaTE+qQ8EPoYrbAxeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U88qweYnCYrU71r8T0Ehm+T7NZ7CYd13glJQesIl94g=;
	b=xJWA13aoubbXO6Ijc1LOtYV4Qqksq6InYWG02edKpi6E2HEhxdU2YXbrKbwarJohyMne
	 yj0NPs9G3IQ78/afDB8Nx5LtNJ1MrqTGXkjhM1dMLIlJG1pvDM3VSq26K55NVebpnW5SD
	 o7UL5qDSznQ5mxv6AktYU2mmt70KYW3XolLtYAADl8ng/h/XGboWVGRAWVnRRR7JXdnkz
	 3TbW3DDDnu30rXDQvRAhi6Kv03GK/p3M2B9S+VDPt1uly+z3n/35q41yc9/89Toxq0KHZ
	 OX5NRcAgpz3Ic/jLvRfQhj3LmOKZuRFhEr0xS4LwKg43c9WnumAAzzzb41/rVz65Wfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MWn5tv2T;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94636606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94636606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MWn5tv2T
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9f6a16afcso39495ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793102253; x=1793707053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U88qweYnCYrU71r8T0Ehm+T7NZ7CYd13glJQesIl94g=;
        b=MWn5tv2T6nORDeJlQMGcbmz+uBELnLCHME98VH01oxejJGbCyGKqQvoYP7SB7tNzfD
         fM4lpxigjR4nEWb1/NfNxyRTHKIZxjM1brk43cS15K37TfS0M/0TtT8OVt2e89FNfSSX
         eFBXqk2qG8sUrc9fZejphgPPjd28UAjshJjh77JTbgNUuodEUxyOPogHGFzQCTkUEGXi
         ZFIJ1BdAI0mp8oz39hADY8jXtwzx4I1GjJek5MAhLC9sbrr22nx+2UnNndl4rJRyIPtQ
         tKu3VdgEgnf/C6kPIuhNkEVZYiT7zhQ0v8l78a+igWsJLKXYfGFRUltlbMJoh2Pj7wGQ
         QRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102253; x=1793707053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U88qweYnCYrU71r8T0Ehm+T7NZ7CYd13glJQesIl94g=;
        b=TMiFMLbhzroayfnrR0cTL3UC+r9wtao7e0pi4GtEG5hGSj4GO9IUt+RS/gcUvAiEQ9
         e/mXANLptJVfcxh/9pm5PfbtWXARaDn+v+5VaX1R119G0iCygaEWxXAobCt7r9pXrQLU
         EB3g/QfWZ8oUP02h+cCAdBnGQersTUQejlcGbIDyIL4OX3slb46BzIAGGhD/VLxr9kkH
         4G34MH7G3Gokck74cJ/a6S7asoXo2oQjKyf+hHdy8J2Pv5bYT5vFqtwHqNvMLmDW/3Hv
         3TuZMTS/R22XeFn62/N1V/Nrm6fmDMCkrma6U59XUwGYObPa3rPPThxK1PtCJBHWZo/0
         FE+A==
X-Forwarded-Encrypted: i=1; AKwUvBwnkvXyMn+ZZ1cy6yeIsO3/w0BO8geLL4WmfX8/Hz3gneBUPIWpl6N6b92ZMBrooJPiZOQD4GPvHH281JQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHpjzvDgldFcxvVCnjjPrJIPkDseYGXkz1dd1dZieNjn41AGpF
	01KI2LI60eQo0HihnskbWPAn3bef2wiSk8McBFpPqkdu6DdgKqiR/zPQD6WuI017hA==
X-Gm-Gg: AYBFou3O2PcFtIFl68hs+j1ftS5b2Row87hACo85DJQiYnRetm9owzHP00GX4bSj+NA
	fY6d5PL+khHKui9G6Kc+J4z2qpbGgl/7M29rPefTYGr/kPi3j3cooApfmp2jHLFJZiP1Z/dLR+S
	1ydLp2LQJWToUbrfaKpYa2pz3gAHaSz5Cl63/OyM1UiU8mf+f7BnYiSFtYaIiPaaEThz94I/d1W
	ECR3p4jAMZE7W7/rB0Za69ktveYHa8rxeSRwV21fvbAKprg+bclnN1x7FvxyB2F5tLVuxYxv5QI
	nIrCthX6VMmadTWELWtpvIIXSrIyk7/uHjB3fkbute2BihS+0929jGeov/AsjMWC1XRNmyryaBu
	WX15GrRxNJn/aOKds9yX3jJZQC8vKX1Fp12RzvkeYa9NbP4ArojtcbO4ANovIu5cUtgsuLXdPMS
	q9lp+3y9G3PoMHY9YjgmsW94ZZNnTjOUy0KH3mbShRGQPQb5OymIoUoJBqAJTweT5F8H7K1wMPH
	cbCwPZOYU0j1YtY3iRnXj8FaH4e2K9yZMxYdBleGJZHz+TmpO+IOVr+yCiEcoS/luszkg40Rivo
	Jp2napoa6APJLNymShC0GlTfSBtPGvWHzYc7L04=
X-Received: by 2002:a17:902:fc87:b0:2ea:1fa0:8068 with SMTP id d9443c01a7336-2eae7be30b6mr4320395ad.16.1793102252395;
        Tue, 27 Oct 2026 04:57:32 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm3633646a91.11.2026.10.27.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:57:31 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:57:25 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-nfs@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org, Shivaji Kant <shivajikant@google.com>,
	Tom Talpey <tom@talpey.com>,
	Unnati Sachan <unnatisachan@google.com>
Subject: Re: [RFC PATCH v1 4/8] xprtrdma: return -EREMOTEIO on P2PDMA map
 failure
Message-ID: <auCRpd73dok7Yys7@google.com>
References: <20261006233248.705086-1-praan@google.com>
 <20261006233248.705086-5-praan@google.com>
 <20261012070134.GG27033@unreal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012070134.GG27033@unreal>

On Mon, Oct 12, 2026 at 10:01:34AM +0300, Leon Romanovsky wrote:
> On Tue, Oct 06, 2026 at 11:32:44PM +0000, Pranjal Shrivastava wrote:
> > ib_dma_map_sg() returns 0 on any failure, so frwr_map() cannot tell
> > why a mapping failed and reports -EIO. Use ib_dma_map_sgtable_attrs()
> > instead, which returns the reason. Pass up -EREMOTEIO, which means
> > the device cannot reach the P2PDMA memory, so the RPC fails with the
> > same error as other P2PDMA refusals. Every other mapping failure
> > still returns -EIO.
> > 
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  net/sunrpc/xprtrdma/frwr_ops.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/net/sunrpc/xprtrdma/frwr_ops.c b/net/sunrpc/xprtrdma/frwr_ops.c
> > index e83cef19e656..a55d5e11c0e2 100644
> > --- a/net/sunrpc/xprtrdma/frwr_ops.c
> > +++ b/net/sunrpc/xprtrdma/frwr_ops.c
> > @@ -293,7 +293,8 @@ int frwr_map(struct rpcrdma_xprt *r_xprt,
> >  	bool sg_gaps = ep->re_mrtype == IB_MR_TYPE_SG_GAPS;
> >  	unsigned int max_depth = ep->re_max_fr_depth;
> >  	struct ib_reg_wr *reg_wr;
> > -	int i, n, dma_nents;
> > +	struct sg_table sgt;
> > +	int i, n, dma_nents, ret;
> >  	struct ib_mr *ibmr;
> >  	u8 key;
> >  
> > @@ -381,10 +382,13 @@ int frwr_map(struct rpcrdma_xprt *r_xprt,
> >  	mr->mr_dir = rpcrdma_data_dir(writing);
> >  	mr->mr_nents = i;
> >  
> > -	dma_nents = ib_dma_map_sg(ep->re_id->device, mr->mr_sg, mr->mr_nents,
> > -				  mr->mr_dir);
> > -	if (!dma_nents)
> > +	/* Unlike ib_dma_map_sg(), this reports why a mapping failed */
> > +	sgt.sgl = mr->mr_sg;
> > +	sgt.orig_nents = mr->mr_nents;
> > +	ret = ib_dma_map_sgtable_attrs(ep->re_id->device, &sgt, mr->mr_dir, 0);
> 
> Please avoid using this function. We are gradually moving away from SG tables
> in the RDMA code.
> 
> In general, it is never good thing to built API around try-and-fail
> approach. It will require from us to be aware of "specific" usage for
> the return value from one subsystem by another.
> 

Fair, I'll drop ib_dma_map_sgtable_attrs(), keep ib_dma_map_sg() as it 
is today, and check reachability explicitly before mapping instead.

rpcrdma_p2pdma_allowed() already asks ib_dma_pci_p2p_dma_supported()
whether the device can do P2PDMA at all. It would also run
pci_p2pdma_state() against the device's dma_device for the payload
pages, and refuse the RPC with -EREMOTEIO on
PCI_P2PDMA_MAP_NOT_SUPPORTED. A mapping failure then stays a plain
-EIO, and nothing depends on the DMA layer's return value.

xprtrdma can be built as a module, though, and pci_p2pdma_state() is
an inline wrapper around __pci_p2pdma_update_state(), which isn't
exported. I see two ways to handle that: export
__pci_p2pdma_update_state() as is, or add a small exported helper in
p2pdma.c that returns the map type for a page and a device, e.g.
pci_p2pdma_page_map_type(). Which would you prefer?

Thanks,
Praan

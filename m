Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B143C13F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415636; cv=none; b=klYCqo1F94QiVTp3LVyq3zNgGsTB9ZllbIrOTd5PBksmIt9FfNNGVwpal3bEeOuU4hO66cYHmL4JOCPgE8NmYg8KSKcNkEVJZaG9Zsjw9ZbXlOu47hSkuFXn+k3Sp8cU+xMgwlBkM1e2iG+WGsBAdzimVaYsOhGcjOq12wsAKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415636; c=relaxed/simple;
	bh=Qlu2kSPeQ9fQnX7dfvoM0kmKFMfGiV5UUteJMfTnJLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5iJtQnGpJLYoLu+ubDr31NQhJjBYQDCgnaIYqQzLz6qpodncIyR/tm+PoBKj1qyVWTJaLXFC0Plh6dITUEK03/CTH0/whHm7SGYaC7ZPT+8UoRJdFRrTboS8WQJlcnB+xoiOpkb8DljMLo2MjYEQpUFmTMNv+7sbwT2wVtIF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0lxdCMA; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0lxdCMA"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1533116a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788415634; x=1789020434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gBUuqGg91aYvqgQOgpAhdv5iVIgNNaz0N9DNOLXqnd8=;
        b=o0lxdCMAsm3DZyC1qyrOKk46oLlc6GiOQg7hcy8lo+85FUFXW3d55nnRYo5cJbFE9m
         OhxGQf9w4cBsru2sNe8/YFebakDo0XJhXrQBtoXey2ya0LGkOd7IgGfVp15N0D+hXhyF
         EWmu0yCLXp5RL6VaFm1TGIc3GD2bLkqpYhWLot8s1Qnp6CTqHMW0xbnISuWq4Oc/ZPQr
         dwHWbLhBBSFz8S9L5mGl65DRsr3btN+2keub6LQLkKqt6qiObBxgoC6UEVrUQyTmBT/3
         knFJMmIlDtB1Uo7Tq9zyVu4zLaaIhC9Elijhwi6xKxYCZhTok/hwzdLV/nbup7EYASEK
         30ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788415634; x=1789020434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBUuqGg91aYvqgQOgpAhdv5iVIgNNaz0N9DNOLXqnd8=;
        b=QZPJc+wceNErvfs0tU1Y3TTn2mIw4Xrg2S+sJxGrASqqwBmBlEP0jd0J9EaVzsKfDS
         JEl5pblEC4qYDRf97PlcWw75sD+8s9czN3Eme6pGlTZXP1NSbdkOLA3CrkMDlNd0UAYj
         4xuHCuaJrdS71qhlcUkO2BHArTzAlcxRoqMyWY6z9lOSxteuVYYTAfnI5axO9keS5vB3
         xVlX7odKLlWAv6UEILjgMsa2haLQnHRPlQIWATKsd5zuItT0M1LpzjH5YtAydHkd00Wj
         7Es/HsWuwDKqjZ7WV7c8Ci3SIKucFb+GC+Fb6e7yF8hbM6mXssbzNyaiZuVW7PvyrVg/
         BzIA==
X-Forwarded-Encrypted: i=1; AKwUvBxi+rS/2l5aSR4d5zAVE1/qF2Xj3r9KbHyPyG/cYgbGCslZxjhDRxRSlfGa4oI6VoHVMvzMiJlqjyk0fSU=@vger.kernel.org
X-Gm-Message-State: AFuF++nIbiy0d6pbHE7WmBvEarbotmGz0xI1GcEWBG07xJY5O/SbTVbG
	H3Z8+ErOG5/N+AJtAIYbE5a0ft38uTKDXjzAsooOzXUHzmwLDBUv9f1I
X-Gm-Gg: AYBFou3R/p04vyFklMppn1L7wIe9hl3kNpBO+uTgs0OKWK8uBmlesprl8arvpxnrVja
	W+u9i7VJBu8Xs0asB/UryxShpAVs5S/Gq2de5Pwl6wpkt8rLz22pLOYyBMO7ohQwBl/u3yrRWIH
	8rGsa/oC58CvZLb0s5tc64PpOkStafMZf37hf1rFa+2vp1PZTdpPXGZjNVY2dNMVOKw7hjhqAKI
	Ne2cnG3ANT9es5tWVPXuJHbxCAlA2HGeB3M2iKow2ahxjjo12XiSeQTQrR9KNmu5QYEpV3naMad
	W+G9OnGBVYF0qudiJI+KnQe+GpflRkLt0c1v45ChmYUyXfYjsbbR+ndl46YgdjkyVl+qxONl7KK
	lYwFlq1QpcyYvEsQj8iBCmvkI/wZFidlrDcHhGXQ0B4PcvlaJ6KdA3ai9pK0HFOeuIo47DYg7uk
	7blP4pO1P9G1hV4/h5wPAaycRz9rIriEJ7F86EHExJ9W0u/FXGflN+ituUE6dl3kcjZVjTbU2Xh
	b0kZc8=
X-Received: by 2002:a17:90b:4b0f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39aee15920cmr13300583a91.13.1788415633539;
        Wed, 02 Sep 2026 23:07:13 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325367238fsm3671440eec.2.2026.09.02.23.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:07:12 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:37:06 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Alex Williamson <alex@shazbot.org>
Cc: bhelgaas@google.com, skhan@linuxfoundation.org, jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: quirks: Fix out-of-bounds MMIO read in
 nvme_disable_and_flr()
Message-ID: <apkOikPtaTVYnJ1W@kernel>
References: <20260817092448.4395-1-raizudeen.kerneldev@gmail.com>
 <20260902115117.34a30084@shazbot.org>
 <apjoiNcvvJLv2grA@kernel>
 <20260902222156.393e2457@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902222156.393e2457@shazbot.org>

On Wed, Sep 02, 2026 at 10:21:56PM -0600, Alex Williamson wrote:
> On Thu, 3 Sep 2026 08:54:56 +0530
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> 
> > On Wed, Sep 02, 2026 at 11:51:17AM -0600, Alex Williamson wrote:
> > > On Mon, 17 Aug 2026 14:54:47 +0530
> > > Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> > >   
> > > > In nvme_disable_and_flr(), the PCI bar is mapped using
> > > > NVME_REG_CC + sizeof(cfg) which is (0x14 + 4 = 0x18 bytes)
> > > > 
> > > > However, the function later reads the controller status from
> > > > NVME_REG_CSTS - offset 0x1C, which is outside the mapped 0x18 byte
> > > > boundary and it can cause a page fault or kernel panic on architectures
> > > > that enforce strict MMIO boundaries.  
> > > 
> > > What are those architectures?  The bug and fix look correct, but the
> > > risk seems overstated.  Thanks,
> > > 
> > > Alex
> > >   
> > Hi Alex,
> > 
> > Arm64, risc-v do panic on out-of-bounds mmio. But you are right that the
> > risk is overstated, since most standard servers return all ones instead
> > of crashing.
> 
> Are you building with some sort of sanity or debug checking enabled?
> 
> While we're clearly violating the API accessing beyond the requested
> length, it's my understanding that we're generally working with
> PAGE_SIZE mappings at the MMU, so unless we're crossing a page, the
> access should work regardless.  Even for the cited archs.
> 
> The -1 return is typically related to how the platform handles
> master-abort when accessing unimplemented or disabled MMIO space.  This
> out-of-bounds access shouldn't be triggering that, it's still within
> the enabled BAR range of the device.
> 
> Anyway, I'd be curious to see the backtrace and whether there's a
> config option to enable such sanity checking.  Thanks,
> 
> Alex
>
No, I am not runnning with any debug enabled, So I don't have a
bactrace. You are completely right about the PAGE_SIZE mappings. I agree
that I was mistaken about the panic. 

Also, I already sent a v2 that drops that speculation and just focuses
on the undefined behavior of the out-of-bounds read.

Thanks, 
Mohamad Raizudeen
> > > > Fix this by increasing the mapping size to include NVME_REG_CSTS.
> > > > 
> > > > Fixes: ffb0863426eb9 ("PCI: Disable Samsung SM961/PM961 NVMe before FLR")
> > > > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > > > ---
> > > >  drivers/pci/quirks.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > > index b09f27f7846f..ed03892cc960 100644
> > > > --- a/drivers/pci/quirks.c
> > > > +++ b/drivers/pci/quirks.c
> > > > @@ -4090,7 +4090,7 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
> > > >  	if (probe)
> > > >  		return 0;
> > > >  
> > > > -	bar = pci_iomap(dev, 0, NVME_REG_CC + sizeof(cfg));
> > > > +	bar = pci_iomap(dev, 0, NVME_REG_CSTS + sizeof(cfg));
> > > >  	if (!bar)
> > > >  		return -ENOTTY;
> > > >    
> > >   
> 

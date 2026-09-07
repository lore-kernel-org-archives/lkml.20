Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D29E40BCBB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820143; cv=none; b=Zmz0oXScw8MyaTw9HbYBPJvlXB+4Lbo0LaZDM4/joyXZUlYVbiaGkHpnpJw7Y/1OyclnoPfdTDRU1GXPTCek1sGeTbzA4OoSb28vUCVaAO/Xhm1oEkwUJjnCiRPLZ2itm2qlj0kB0o2Xm9vB2boYxToEPkoP1PFJSiV6oYet6sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820143; c=relaxed/simple;
	bh=n5smKdbmoLdH/KsjFUvdZ/gYh+7Nhl/mQBlm4196Mz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYKL6wm6NtAs4iXwfqSsYcow/QDXZQuj0NMv243PmnCEttoPLlYuewy5RkVr97BYgkLRNgtY+Ho+OaG6+hYsQd3vcaMOLCwOmlnkdMlDqGq3mzClUMJrebufK0QlFIzSWNxak5oQcYOrToHGIJsIEdeTQ24wOxjUvxsYIJ6p+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsZ8SVM6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsZ8SVM6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso38774495ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788820142; x=1789424942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MjzhtBXM0iX2iDGhUeHjUxxReJ7nNqiLgIG0FGKsSc=;
        b=DsZ8SVM6atrJItwHTtrAp49qOYWULOAD1o1RueKEyVv1HgZPN2m5ve7ofxidnoKLdU
         FzchROwgu/VQz0B9FJ61sQ4aCHDxoPlWEIUZ8lghsd5Bd/lQL9jV6QwGBkWl/sidATKW
         wFFYXi8WZBuRALRE9Qy5bQ+TAss5IdfV6qwRLtsxLkHJ01u2XjtRNRHvGwT7UHPr0rys
         op37TGXX0tNHLUMjZnMXsK+QJp9Q2ylc6pZGKfXQIyHa9vQYNzTA7mU2JiWGo5fq91ik
         vssqxFSwkMBG4d+2B9hj/l7IkOFgdkUaAz03LC0q2xssFQ/Rio9QDr2e+ikh6qs79UVj
         e6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820142; x=1789424942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MjzhtBXM0iX2iDGhUeHjUxxReJ7nNqiLgIG0FGKsSc=;
        b=RdcIs+WWWlF/5XzTqi6ZzsLTERSahSFf5TENgxYVzB6BP/NYlajWaoHyZR4BWiqcA/
         3LbChKxatdb0HQK4UHEGlU0MYu7MV4knVynC6hOOK3v5BghShyIxcBdA2ZE0h/lif7GE
         xZ7bsbJRiCENr2xqQU58wCS2YdID1HgS2yjlIAXWlPshxaItpjXcB7WDIR380i0ThM3o
         ll6AgOtmQUV6iZRCzhkHZ5CF/YSgqWMuqHXidmnA4UZdyCilf9Y5F1g7c7gM8sXdlLmd
         Hzm7LUZdScH8FlcmJ7zntNkQNltGRklkp0HaWXCd9RlyYvLaR0tH5AiRrUtJjtxbIsUY
         zmKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbuc+C55KPrkbc0EFlTTnFoOk+Csv47+0OyKl4/Ec3AXKV1Owuig1deSjhZ4wgOnhwv1Ov6kvdq5Yf6s0=@vger.kernel.org
X-Gm-Message-State: AFuF++kNfWFxrfFBTkVZNPhUu5o1T6I8fMjmrsSWhznaIKXLzNpTdsaa
	GKJpxzRlzqUVBnHoc7bOQoIup/wEw93rMK9tu3JOLKPEslbKHW8KiToa
X-Gm-Gg: AYBFou28DT19FvJgL9LyDGY250h0OzPrPFWjnU5vY0e62R2H/gNWvVyAWcLaYS42C8e
	y7o3+7OiFciVOPWaajVOUKMl0+A+b6UZKga0gE7hHqDRYYWRHQe38Ej+FQcgEjDFtcvy6lJySUw
	E+/X7Jzgbu/368l2jnvO6tkEGw9eiYlbdGqXpM7e2bqgIuiYO2moYNZ1RuiJclexv8pJUVIGsHf
	2GFvjazbHkSJZrNEWeR85sHgyHchfTlpbgTB1PpjL7OQIF8nw4FId+svahCffo7gsRhAZQNWs9E
	N9/Tfu8y8IIZbukpcDPL9H5sdElHmC7OvrENqAstqTRqzZ1vRvqoA16FVbX/FiJLEcxFua9RFfB
	ATPWbsHEQzmTOWCVV93MiTG+r48+292tswaAbS/DMl0c88wVoBbYu0SSNif8mdi3+oaiinFyMtT
	jovMIdOlnBR/MbVQ/rp79GABXDBD4jkDpCoO291j5Jq4Ej2lNy7i5ZpqiNkjfIYUoWO6RSnA==
X-Received: by 2002:a17:902:8a8d:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2db122edd50mr271424715ad.5.1788820141536;
        Mon, 07 Sep 2026 15:29:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm50444525ad.3.2026.09.07.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:29:01 -0700 (PDT)
Date: Tue, 8 Sep 2026 06:28:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <ap86IO78I_1AZbkU@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260907102849.w7yn43x6m3f2rnuj@skbuf>
 <ap6fcP7Oct109dkY@inochi.infowork>
 <20260907115712.dg5pw4ajvrtdipey@skbuf>
 <ap6ngAxlztCAFSH0@inochi.infowork>
 <20260907121653.4ajpkjt2i5opmwzc@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907121653.4ajpkjt2i5opmwzc@skbuf>

On Mon, Sep 07, 2026 at 03:16:53PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 07, 2026 at 08:05:57PM +0800, Inochi Amaoto wrote:
> > On Mon, Sep 07, 2026 at 02:57:12PM +0300, Vladimir Oltean wrote:
> > > On Mon, Sep 07, 2026 at 07:29:49PM +0800, Inochi Amaoto wrote:
> > > > Yes, I have one for it. This is the spacemit pcie driver.
> > > > https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
> > > > 
> > > > But it only uses a few of these helpers. So should I remove all the
> > > > things that are not directly used, and let others add these if they
> > > > need?
> > > 
> > > How many functions would go away, and how difficult would they be to
> > > reconstruct, if we only were to add them on an "as-needed" basis?
> > > 
> > > If the answer is "many", I suppose you could also leave a note in
> > > phy.rst that links to v2 and mentions unimplemented functions because
> > > they lack a user.
> > > 
> > 
> > In fact I think it is happy. This PCIe driver only use three APIs:
> > - devm_of_phy_bulk_get_all
> > - phy_bulk_init
> > - phy_bulk_exit
> > 
> > So most of them will be removed as only a few are on the path.
> > I will follow you suggestion. Thanks.
> > 
> > Regards,
> > Inochi
> 
> I think you should call phy_bulk_power_on()/phy_bulk_power_off() as
> well from the PCI controller driver, even if the PHY provider driver
> doesn't (currently) implement them. The Generic PHY API is about
> offering some degree of mutual consumer<->provider intercompatibility,
> not just a pretentious indirect function call k1_pcie_init() ->
> k1_pcie_phy_init().
> 
> So those 2 functions should also make it to your v3 patch set.
> 

Good. That's the point I have missed. I will add them, thanks.

> BTW, do you need a stable tag to be provided by linux-phy, to continue
> your work on PCI in this development cycle? You should mention this in
> your cover letter, because it does require a bit of maintainer
> preparation beforehand.
> 

I think I need. The most problem of PCI driver is already fixed so I
think there is a chance for it to get merged.

Regards,
Inochi

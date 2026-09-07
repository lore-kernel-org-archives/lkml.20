Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F436478870
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786308; cv=none; b=Vfa7/4zpEAcYsucIlpTDuu8FEGgP+rjmch/BBvQGzGfiuTaCmA6Vv5nUzAJAdc9+D8upP3u5+OA8ooYqIby/p5hkGPcEMDxIt0NLerArpc+3xHuqvoFGnFZ+YXpxZpnaYk9D1zwLuE+JWbAIChhUKRUncE7PsZGeX4pg7zWcorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786308; c=relaxed/simple;
	bh=1n3O55QHCNOEOkhOkb+CI0DxB0s2gPnAibl0K8I5Qow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeOZqkLcJU/fSSGWKWg4w2yCroGqJo3EkObKElhyXe854uz0RT555PpITPCBHwycmi8aUBImVGQl+dS8VW9+mUAIpYLRUyyA2kAYTLC2fQ8jF/j7jNqw1Goyqe9ZxV0bQmUUqRgIU+vRXdak5nD/3/e0gLuFtngcBpdP2NOv7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP41IBsl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP41IBsl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1a5b5eso720565e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786288; x=1789391088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ozz1uZ9Dd3kKM267cb2w1ezLL6vpOE5QOnfezxsq4H8=;
        b=VP41IBslo1nwd9iUU1mej3PYvUpjS70PK5FGTyJZZjF9uxZFg6gPZM11b7PMNPkBHJ
         dpHeOIfPlBiJ00pRn87VtuPkWzNMer3YCvANYxJEYKSWbg0xRs6Cd0R1w2yh3U4O9NiO
         EsIzZc2Ur7wCh3D5mdZrIarIh8AeBja3WdP+CdKGFg0EUNlC0nzx1EuwDwQa3XMi0lJ9
         49YD9dhGSviBA8/M1m0QtmVmf2muIUQQU561b9rKs1RSUGTnC27+JVZA97WYWH1HUqLz
         19/MJbI0tnFh7o7H9zQkLnoblwQjTQhkmfVMv+1GQrHAIyeuzhOXGmzSB9Jd5d0yd4Ts
         p1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786288; x=1789391088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ozz1uZ9Dd3kKM267cb2w1ezLL6vpOE5QOnfezxsq4H8=;
        b=cSOIzmfO9Esm+Ctvx3TKN7wwIfu4L9GFWshRoVZh/spNnP+IehbWAyRhexJE4NbG0d
         g6oZIM4+sWGgSDuauUMhXRmFoNgIf8F1dZyt2A6Vcnoj8OUKKIfluJsVQbV+wLT9ca+I
         RmHVgmClBp5T5NyEpSV6AIbfA5+e/9t1CJ8UrV6veQJWgH7iygmF1o7spZ5jH8Dbd9t5
         q2NyG4+APLcpJ3cUMoL7XTmfbaPLZxF5Z3Hc1BPqv3s+w70ZiL/og7BnGPfblDB6KC9b
         31q7jBRRdlZv++O8D6mkgVB0GcFIA1BAYupzrWocdfSPgEFPv4XTkUdskYnS0PWNN8A2
         Tndg==
X-Forwarded-Encrypted: i=1; AKwUvBzwDfgq1lJy2arbm8Y+7ukVbKpkL1E47BijTYg31GvQPRgIB1mxD2qWDjcE7w6fqTiFAtWI472xvsN3RBY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhQ0Jp+AL5yCLcvmivR+IwAd+6axy4ndhngeEf7f8llAuX5Fol
	6jcgKlnDNt65V6+v508Wh4NxiTt+2sEqC9Yi97pH1VanWlFu94wgldfv
X-Gm-Gg: AYBFou1fmTyVfEBbm5Mqbrs3FldQgGSf/Nvrf91G1lA2SrKb2eOerEj/1mInpCtK4M+
	oZg51PhTSs01p6NlflSYHqjL7gzLuYaBf9oChjoUbx1OlMo8E3piYlMMIyDLe5AqExfLVrKx6xA
	Ye3Lou7n93iipk8AnZdZXoNIlTap+TEXteuRjXSPexM7jhaeaMX/3gSsRYDIE8L9ENS3BWpH+NI
	GCxLI2fNoSxL3/WfAgs1OT+Xv2lA5vY3Og8ggZrr0yZYzN4D09eoy5M/pmVEv1CDBKbBiq1qxDh
	ugkWsREZvyOCeCM6rE/SSP1mOui3VcoTBgRHQ53EUhoydx7g16GvYKEuvU9vxDfT20VqJp/p50r
	hP59RJYHMgocWrSQ+2duYYByLCobUe+ksUh7ftvV6wrl7KmmXAPAVOiGAnxoJ8qRE26jyna0oCH
	lkzIf/pB5oeFwtJhfDbRJ+WpjP2Uv867kolO57Q0fQcG4hqgt4FG0=
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr129690105e9.2.1788786288114;
        Mon, 07 Sep 2026 06:04:48 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm280376825e9.11.2026.09.07.06.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:04:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:04:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <20260907130444.zwuiczzhlk6yalpi@skbuf>
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
> BTW, do you need a stable tag to be provided by linux-phy, to continue
> your work on PCI in this development cycle? You should mention this in
> your cover letter, because it does require a bit of maintainer
> preparation beforehand.

Since we were talking about drivers/ata/libahci_platform.c on the other
patch - you could consider also converting this to the PHY bulk API and
this would give you some more coverage so that you don't remove unused
functions from your submission.

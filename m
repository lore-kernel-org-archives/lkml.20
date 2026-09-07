Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85B434E5F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783419; cv=none; b=h+G4tPtwBvennnlE9/czHE2BhjMzcTmSqCPXpBxe9jul9v8kX6FmhOI9YUNDmboVuZ14QNJFiWSBqiYGwcfPSS4MzsTwqjsN5WruFt18yK7aRHQFapvRZkZMwIaQC2/slhjp9aa6KA30pVuzv2jtgkdPBGEVyaZLdx5WTR7PstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783419; c=relaxed/simple;
	bh=DZjr2bwT+NyW0cj4goDHNlLohv9UcRt4T2/ikxrNQKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvUQ6tEUsd0S3s55GKA3vR7zEOErIWnd2V4iJX133RhVaU/pDsaZQjSIRvXegH+QfDpny0xaGTySwUDd65DQSUAPDzUeCrqxLbWbl/Km/1xjrNV/J0nbEGl4zQldUNEWvqgSWW3JgRU664IqCZVf5dXCT7JGxFkcuhPFqZl5oIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTwzc+3a; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTwzc+3a"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so282752f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783416; x=1789388216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wWAlUzVTWK+l/c0CBIcXBp0GcykYm1XFSVWNetoGyg=;
        b=CTwzc+3aB+NnTrgDws/sMm1B8OE5BLnJr6ZWeunQwMrCKwTKw87Gisviv9WTPXeZK5
         Mcll6cKjdfS9T1Rp6JLChEBNj4o5TayNpVWVHodVO8ZYLbRfGn5U6lVnCuLn7muGm5VV
         1238DQl4+Zh7crO20SHl25JhSGF83/2Gbfd132L2geB5hMxMfKWSHYMGSLPtXP1YUphz
         rPjRyi3Yu9ZifT1Q5zo1F+aAxOPjBs556n1Fg6w5J7TDL0IDqIMis3lwBc0QaGlic1yI
         s/VI7ef5i8xCjQGMR+DgJ2Aipfs5Ky153bmvBRG1gIljBXCM8AWVJjzolsEMWPanhSMu
         5wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783416; x=1789388216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wWAlUzVTWK+l/c0CBIcXBp0GcykYm1XFSVWNetoGyg=;
        b=IGur7i+IWAeaF0iWtyM7HRsriNOtsLk0fdRA9XJrLO8L/njXbMcT3T6PIvTYOXXlj0
         2h5fcBSyIgl+nFlETsV+MEeGgBKCTk59VXJ8vpgP7koGTrTFvd1C++hb75mP9rxwh4ir
         2RxB970r7Ty/4NU6MELwNu8WN5e9/P1roKOfNZU4B7GcHvbUaUVZNt+wJ5sOBCFZQMUV
         5AAg6UITMRVOG61+YyxJex0hGd8rTouf9GFIWDCpVdaQ+3/gMansjiY/t3VWgXpxa0UV
         R+/iEhs1rgvNqGiW+Q7SCk0gYEydjVirq7jhRXX/ymhVPFT/mK9FlZOfYANPwSSdvXHV
         gYjg==
X-Forwarded-Encrypted: i=1; AKwUvByRpqw5zdhhCQMu3DAnfxObfxiNM8vdj918dSfso5deqkq3W8QlaKbyfV9Tt/r06WU0y1q8Q/mmZjYf2Eg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7PHnLPiTmQR9V0yfI8bjDHTAGV2CkowVioB0hwG62lyWp86ns
	EUT4Cc2u4fjowb4rFewgxVQcDFxERQA73Qw01eEwPUkj1FQA09c+/24n
X-Gm-Gg: AYBFou2K6nVsCAjGuC8YMC49UujjKsNhqK1Z3amy0sNsKqL2J/Zmv7AZAt8EIi+CF/p
	l1SIxWxpKhzkJWGtG8JjH0PlH7xZf5UOkfYc90oMOUJRpP03yL20QG8k7bH9VfkUpPyUekk3pAK
	BZWryAHpp2e5lSCJWGZpM1rTQXZXX5R7SRiRhCQ/ecFNDyuwV6PBQVozAcBuQmiU3nqwev5bwPc
	taudIHUcwvUdPVOAz/lVh6JQKc+VRwJnHnpkvxeeCVccu7A4AEmJgxQ+dAWA7JUhfxO/RnekYSR
	i4x2utuUmSyoJOyTk2l7FlNt+6s/YCl+4zroo+DdaoxYZzvCm3BqnXEt/K1ccXKuilp7b7epYsz
	ycnAzu4cV5Nj0vue9b3w4722QqTjBuI0Taz8ix0kN9wUQAJDvE61cGrQM2wezH8A1vVVG/2gg/X
	Y+VdIRL7I4T1KJCe3f2epz/ff0u0RM/U84FFRO22FE3k9PeIS8eg==
X-Received: by 2002:a05:6000:144e:b0:485:8d31:ccf9 with SMTP id ffacd0b85a97d-485907ef7a6mr12996882f8f.4.1788783416126;
        Mon, 07 Sep 2026 05:16:56 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm24401218f8f.2.2026.09.07.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:16:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:16:53 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <20260907121653.4ajpkjt2i5opmwzc@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260907102849.w7yn43x6m3f2rnuj@skbuf>
 <ap6fcP7Oct109dkY@inochi.infowork>
 <20260907115712.dg5pw4ajvrtdipey@skbuf>
 <ap6ngAxlztCAFSH0@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6ngAxlztCAFSH0@inochi.infowork>

On Mon, Sep 07, 2026 at 08:05:57PM +0800, Inochi Amaoto wrote:
> On Mon, Sep 07, 2026 at 02:57:12PM +0300, Vladimir Oltean wrote:
> > On Mon, Sep 07, 2026 at 07:29:49PM +0800, Inochi Amaoto wrote:
> > > Yes, I have one for it. This is the spacemit pcie driver.
> > > https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
> > > 
> > > But it only uses a few of these helpers. So should I remove all the
> > > things that are not directly used, and let others add these if they
> > > need?
> > 
> > How many functions would go away, and how difficult would they be to
> > reconstruct, if we only were to add them on an "as-needed" basis?
> > 
> > If the answer is "many", I suppose you could also leave a note in
> > phy.rst that links to v2 and mentions unimplemented functions because
> > they lack a user.
> > 
> 
> In fact I think it is happy. This PCIe driver only use three APIs:
> - devm_of_phy_bulk_get_all
> - phy_bulk_init
> - phy_bulk_exit
> 
> So most of them will be removed as only a few are on the path.
> I will follow you suggestion. Thanks.
> 
> Regards,
> Inochi

I think you should call phy_bulk_power_on()/phy_bulk_power_off() as
well from the PCI controller driver, even if the PHY provider driver
doesn't (currently) implement them. The Generic PHY API is about
offering some degree of mutual consumer<->provider intercompatibility,
not just a pretentious indirect function call k1_pcie_init() ->
k1_pcie_phy_init().

So those 2 functions should also make it to your v3 patch set.

BTW, do you need a stable tag to be provided by linux-phy, to continue
your work on PCI in this development cycle? You should mention this in
your cover letter, because it does require a bit of maintainer
preparation beforehand.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F034A3F13;
	Tue,  8 Sep 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862681; cv=none; b=BwZLgGXCrhjKY1KYoCymnWZ6ynO5RDgqvpkzD95RGU7VEXGPpDpmoeF/26zk577CfUK08LNGLTUjgMf2Bgk392x7v0CJqkmcZZV/DnjhFL/O8R5+PqVRRGfwqXbjK2A5bcG1fX3R/06Gh3HzuRCpbFkSZpGUKT9mG+XpZSLbkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862681; c=relaxed/simple;
	bh=REefT6Y4BF9qgcV86uQSOz0t9HuJ3hYnZlBIuoh/3Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9GWmP1pahoRyAe0xGj1oO8yWbG4qPYTF6Z3HnR3iBocIq6ninB2g+ONE6oBVVsaujpvN3YOmiOHTTz2meCOkJBYZ3VcCq77HdMnD0/ESIXNdGeDaIswjcb4JPU9ue2REjNAmRg/5yYDtuUO0/wiMZ3XSejtMRlODXbhTelQAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwavFRK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwavFRK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798C01F00A3A;
	Tue,  8 Sep 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862680;
	bh=1BUq9DqNfvFJpJpxO4ESAHte1Bx4yrvo0vCrnSZ9Wno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwavFRK/ztSyhXEhkjmbGgqiZw9sxr6mV1TbmhsRFf12TB/TYGglIbkUGeV7tUtxg
	 F148rzwylaMteqXTQlfgqCpYKWA3xLRuiSk/6ZuEdUVkyxHT5HaPDlNP0bbVm6Mp4p
	 FjSWVQUHDyaswMIHtvx1lOd10oe48Ss+ENBMUdnmWGrLP856Z/MdRVE992y9WKpPde
	 +MjO72CMnbl+RMjRI6UWUrE7V/VLv19l77g/zVYAe07/V28dqEfQXF1MRWhBgAn38K
	 WdW1TZooWTeccR2yS/OgrcO2v9FkbaEz0BGcv51hlHvuCPSmslvFgE1NzbkgrltoCJ
	 qqFQ5EJFaso2A==
Date: Tue, 8 Sep 2026 13:17:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	sumit.garg@kernel.org, ardb@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap_gztTqHQv_GD35@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
 <ap-74AkHSGXbFCF_@kernel.org>
 <ap_RRSM7RBONvHaR@orome>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_RRSM7RBONvHaR@orome>

On Tue, Sep 08, 2026 at 11:18:53AM +0200, Thierry Reding wrote:
> On Tue, Sep 08, 2026 at 10:40:16AM +0300, Mike Rapoport wrote:
> > On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> > > On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > > > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > > > Keeping last-level mappings is interesting on some architectures as it
> > > > > allows mapping/unmapping pages from the kernel direct map without the
> > > > > risk of splitting blocks which, under the break-before-make rule, may
> > > > > trigger page-faults the kernel can't handle.
> > > > > 
> > > > > However, mapping the entire direct map at PTE-level is costly. So
> > > > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> > > > 
> > > > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> > > 
> > > The idea was to have something close from NOMAP, to emphasis it is one or the
> > > other. But PTE_MAP sounds good too.
> > 
> > Could be PTEMAP if you prefer.
> > My point was that unlike PTE, "LL" is not perceived as last-level, it
> > should be looked up.
> 
> We were discussing the concept of enabling entire block mappings to be
> removed at once from the linear map, so at that point "PTE"MAP may no
> longer be accurate.
> 
> I imagine that in some scenarios we might be able to go to PUD mappings
> for something like VPR (say systems with a fair amount of system memory
> and we want to carve out 4 GiB for VPR, split into four 1 GiB chunks).

_LEAFMAP then? ;-)
 
> Thierry



-- 
Sincerely yours,
Mike.

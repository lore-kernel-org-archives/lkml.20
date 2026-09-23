Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240653B32E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177071; cv=none; b=u3FfPMPiBL0+cUJPJ8Uiyu5eFzM1w3BAsqZJ6n7twiBlmuKpggCDCTFiuB4Lg+ol/5hz8gizal/G79EbUzUSbITGa1mR35qIsn3nRdtPSpdSkyFvAjkcp3vUscy/kP9oQT5sPQW1cawIqvrl7uTrCdbxYbJ/XYzHkeZLMgmQ69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177071; c=relaxed/simple;
	bh=NYa7lzrDyEG/58XwTA2LcOHsOYKMnwjd0FctfadBdsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFI6onkdUEPCmHAgSl19AQEc3AMeJIU0h9VXSz2xPb/FpGeNIMX97+xPtKFr9hHFhl7+ulE/ZE4iXKksblG6rVpm2HbuLFkcvXHhYY8pR9rOBraUZJXOU/B6Bxx+CsWjJjzghCuK/1UxagUEO2hH8tdSVDW6nP55vZvzKeKV7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jMAoQ6WK; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jMAoQ6WK"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so362446241.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790177068; x=1790781868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DLCbEVM2yeFpINaieYUT1nKrAhZHHWf3GyoE7bLHvDg=;
        b=jMAoQ6WKJzRrOkG/QY8sgwqZ1c8y/aQ0jzAvgHsL/8Ifg9Mg/pUukeZ5VPynU2PrK0
         bvZoR0quOz7CRX5zLLLy97s7NWbtIEJ/oNZxIH5rE0TuUd8NdSWUbPny7bjgAaPb84cL
         nGYdBm1pDQsEn+Z47Poql9IAG7qBQEDxzWB7yPIVz1rjdEVonlVdnGtRO7C2l7sdq3Dt
         fQbnwmhrJy/3/9uLVyWcFfOTnJykjQqvY/fMU+PNm3R9sqvgkpuACLTjI/g7xFq4dV1t
         5Sl56hk/g2Fmy6DqjWKcnXsJkEdXsXzDwo4PD+24hkBigbmC+3VedNteIsrCQ8BK4Az0
         7c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177068; x=1790781868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLCbEVM2yeFpINaieYUT1nKrAhZHHWf3GyoE7bLHvDg=;
        b=GTEhi7XYYKz+0Wm4A+ghCGZQ+iySrj8PooxQVawUcELY8F/+b5bpN+QgANxCsumA2k
         M9JV1O5kRO6vbuIjw13y7ySO/FBay1+QPW7cW0sv2gLgtR/LokO0wKpIdj0IQxo5ktox
         1HAATUTsF1zyDonGBPs5tG4jDI3w5F9V+dfkDdW+pFeYEe1+9rTclzdz7Ym3SMPF6xlr
         wYqleJRu45+WrmBFf2nWnCC8/4snGea+UYN7KXsMqoo0dvntxdfov8nS5KBI/QGf1vDO
         XCyd7LSETjlhEra+lSNmJQWyfyjyWp5DGkLDbw3K29w2xXGI+Wusv45AYjh5zdzK2m5v
         YEZQ==
X-Forwarded-Encrypted: i=1; AKwUvByB34cqNfqKtQGYh41ZX+VUngi8odwVnQgbn72bm0i06rifEXSBehampxiSa8PyS93pZ/knGyGGrgyJsXA=@vger.kernel.org
X-Gm-Message-State: AFuF++mGdDtaT2lx9CJgRA2h8qVUp8HxEvHDuKtcHZ0YFuGMKAsSAZ+K
	z6FBp1BoZITjrgT00ArqaAbEOFWtTJi+WbWtKUmmCCs+XnGJj8z0dp60a2QOGsVMiJU=
X-Gm-Gg: AYBFou1BZNhH5pAdng7msVcmYcmsKkvlrNFGn3j+UiMA+zZKkpb3YJ4Jw+7HKvICX/u
	34QrXZFprhZ5duLaONyF4Uxx0qCSjs3AjykkQsWOwuEscd57u+b9+0hOr/0YwJe5tdTbyvIOGF5
	ZB3ghaLRmp2XiDdVuw/5yMjjQJ4VYgthuVgfAoDwsznQ/wNx/R4doqineajXt+LBcysCYpgdCzk
	xRv3VJqEn1W3n47d/XQB+jc7mkdpUP2I9JKAzpji2qRE9eMaVW27t0g2jbTJiHH2BMeChGMOA4G
	EN6xpcLYbUjgqgtQ+JJ9vrQULPsUSg8uvxPUP9vKIG/6jFUjRlF3zKhnBcvAJVChJH4V0LEltAu
	0hV+TPJugHD8jip0pCLKujacMCKrqQjlCNYf2HWwVmWBDfueAhXfJM2WntFByE6Y9WMrnipcXg1
	XFg0OrhT+vCPTu+nkFV6crUlt9v3dRNoGJanoPgiaKTVjLNziOrnARzgqv8FhINhe1WzJd5+7QW
	pyWaL/oGizX1xH5/Pz4qA9NioFTerCCmv/5LPMplvH8B7BPdkaPHZWoARo6P7fhCw==
X-Received: by 2002:a05:6102:2b89:b0:7a2:2148:c800 with SMTP id ada2fe7eead31-7ac1d2d4b61mr2458963137.17.1790177068540;
        Wed, 23 Sep 2026 08:24:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485dce4sm250217085a.23.2026.09.23.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:24:25 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, baolin.wang@linux.alibaba.com, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, 
	kas@kernel.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
Message-ID: <arPut2xL8oU6Hr3F@gourry-fedora-PF4VCD3F>
References: <20260914155115.439742-1-gourry@gourry.net>
 <20260922130558.48402-1-lance.yang@linux.dev>
 <arMxm4ia5Md-Zt4R@gourry-fedora-PF4VCD3F>
 <80206444-d0c3-4dab-a5e3-a2909e58ea33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80206444-d0c3-4dab-a5e3-a2909e58ea33@kernel.org>

On Wed, Sep 23, 2026 at 08:32:29AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/23/26 03:59, Gregory Price wrote:
> > On Tue, Sep 22, 2026 at 09:05:58PM +0800, Lance Yang wrote:
> > 
> > There is some concern around NOLOCK here yes, in fact sashiko picked
> > this issue up and I've been poking at it.
> 
> It's possible to document it as unsupported, add a VM_WARN_ON_ONCE etc.
> It's not necessary for bulk alloc to support ALLOC_NOLOCK just because it
> takes flags. e.g. kmalloc_nolock() supports a subset of gfp flags as well.
> 

It seemed simpler to just support it than to create more future
footguns.  I can RFC my current rework if you like, i attempted
to deduplicate the logic via a prepare_alloc_flags() called from
both the bulk and non-bulk contexts.

But if we prefer the WARNs over adding the new semantics to the bulk
allocator, that also doesn't seem unreasonable.

~Gregory

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3083438A8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660999; cv=none; b=QQh+PeB3s5kmTzd1NWjAPMq8XRgIexuDU8kduoqrac+AzGBEU5MQa/hR0Wz4Cl8zz3zDbZLeP0sHiapc7CIA9lgZfzfCLPR3iFvUXlOGqHH3ejLRkhh7q8UKh9DC/g2aQu/aeqZFOQBvmhPlNF9/USHi5gfLuFeDAI2rGLEnMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660999; c=relaxed/simple;
	bh=bji6kgyW1R2VmlJjfjX09W0brxlZ3p+S+hs/OMlhbR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9GuW0o8OWcxub4coMza/LRfUUtMDFX5TnBaBv6Bo8GCcRs0BnAQnhvmhu0/L5F+KBZb5n69InOxH3J1iv0Ri4j/A5nJ4MCJcdMaO08XwmbrBpDDjq8Z/um99+U499pfeYsHT+00RnJMRx6ZVg8HYARaQ9AEJ3gKju76BS8QegQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCyqXecE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCyqXecE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0465F1F00899;
	Thu, 17 Sep 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660996;
	bh=Cpr1q5iPo4prGN6gHLTCnzlEG3QCR+sTiAllOyw0NCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCyqXecEXXVSPfVycrbJM29G7wUwtFS1xEC3VTKCCCVZ3pVzhWC5rFCf7i9ypiYuV
	 4NbkfjBZU1n8h+bdQHCSNHej39CBcy9jO8lMDQyZ9nTfxIkMyZQx1S0Jj8Ubuw4THn
	 RumPVt6hJdZlyBCfIG2tRzCeMxjYplAj7TNbIXoSc45GKUPJsvsaPbAkEIRQVbgyvn
	 lvYRoZgVwXLd9ggl0AlTcO8nQCBmGI310S4T8kaCyc5d2d0S6R++DhqLrLFHl+wrvg
	 0SnHpjMefPK6bEnEbVWjhOvB20WRinGUdZa1elsmCc78b587xzVWf2iyrzZX+V9BnX
	 i9eTyO3XMMd0Q==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 79507198003A;
	Thu, 17 Sep 2026 12:03:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 17 Sep 2026 12:03:13 -0400
X-ME-Sender: <xms:Pg-sajjONsWks_q7-E0ZfFSYS96rOgSPkfg-OER_k6I0tWXUpwi6DA>
    <xme:Pg-sav6cHgJBDbIA2BYLi88IIpJXIcmxT2MLD0QfijW_zHun5g9-1mBf0GWd5R42W
    Ita3O6nF6fy-Hfgani08AEI9nYEtEKVy9xegZ9jIn7aJgyTQNb97qM>
X-ME-Received: <xmr:Pg-sagYTFb3P4h_bHFb9T63eODSYGOgGosdJISQH2fP_YwnYIIs1Pvs_NPs>
X-ME-Proxy-Cause: dmFkZTFnWkP/oAjipqhpTyrH15eGRA2bD+A1Xse0B1GSy4xsn8XucvU9sl01MM0Ad0L70K
    RV8rNBOACHl/J1H6Nd7+ghCe17B4OtPsza4h/afczVaboD6XRqg2guprqOWvlU/5CndUAg
    sQ6kUD57YdyJu/WvN0rt/M5l5nKVGS591lpJ/WU2LBIWGf7Vp6j+m5x98KMIj2AD66Tsjw
    KWbEf23UJsl1IsBoDBtObZNzY/nesLje/i595bUpiDidS6up0Icxc7FOr2hpXeOxO6Jrul
    EhWqE8wLo1kUgPbR7ABGGoWKKCdzS3x+CNyoU4etePtnXw8nYT+SRbEW9s8SpefM/Vconi
    E/N6yZH/A04TnMVgCjMdA1NuwXfBgqBFW2TpWi2bm6r643LmRbAHWO0Zx8bdtplEuPGQSQ
    EOZc2tyGZtU8z9wgpFhPqBSx7J+CEdwfkBHoGpkZ3rdh5nwD+zBEelJEkoc0Yie39JVFjb
    Na98vLAMsiOUHwPQUGEcM9bButD8GnTmzzCYGVQDVIYQMOGWS/hbwZj+WMe0wlaeeaQgDN
    rEHmbHAWKWKL9gXUV0Evous+WVXD8DN3NPJwJ9fV77QPCfN6ftjx/c4ia9EUdmqsedZUI2
    sDbBalUG3HP9Ee4TCZKbMDvgTArPeS7pkSYvcoodvihft81sk6egcXWFKwpg
X-ME-Proxy: <xmx:Pg-sasc0SRbuaaM32D9HWaijW5Dm9oC1pwOWdO7zVxm8nD2xfeGOig>
    <xmx:Pg-sat4XkrLWtgPIHrvRMkxfbWuWILjpjl3qlsxuGy7tQIdafnVHhQ>
    <xmx:Pg-saoXjJyFEED-Rrp8mP0TAqAw9UvCNr8PXWxUtZprcynxzdUW8KQ>
    <xmx:Pg-sakYZUierAGOZfbyBTikdsoUxPjvSLBKkIJlT5kYUNGHuJ7Wj_w>
    <xmx:Pw-sanw_dutvM2gvxEXJ0awKigW7SUKTXr92icOa2M7k7oeqoNgR5ATL>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 12:03:10 -0400 (EDT)
Date: Thu, 17 Sep 2026 17:03:09 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	usama.arif@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the
 huge zero page
Message-ID: <aqwPHfWhKGty-Q_4@thinkstation>
References: <20260917121010.60966-1-lance.yang@linux.dev>
 <aqv5r6Ar0vyKXa_x@thinkstation>
 <8c70259a-94ed-415c-89c1-572145c64670@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c70259a-94ed-415c-89c1-572145c64670@kernel.org>

On Thu, Sep 17, 2026 at 05:29:48PM +0200, David Hildenbrand (Arm) wrote:
> On 9/17/26 16:32, Kiryl Shutsemau wrote:
> > On Thu, Sep 17, 2026 at 08:10:10PM +0800, Lance Yang wrote:
> >> vm_mixed_zeropage_allowed() validates zeropage insertion into
> >> VM_MIXEDMAP VMAs. No in-tree user needs to insert the huge zero page
> >> through vmf_insert_pfn_pmd().
> >>
> >> Return VM_FAULT_SIGBUS if vmf_insert_pfn_pmd() is asked to map it.
> >>
> >> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
> >> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
> >> Suggested-by: David Hildenbrand <david@kernel.org>
> >> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > 
> > The patch looks fine, but don't we want to cover the same for non-huge
> > zero page in vmf_insert_pfn_prot()?
> 
> Why would the zeropage be a problem in PFNMAP mapping?

Nothing enforces that it is read-only.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

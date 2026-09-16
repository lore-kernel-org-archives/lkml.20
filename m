Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38757305688
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570354; cv=none; b=K7TuwUGhC2P0RFZx2P+4+FPti3XqFhVxqZhPV5bOqiOi2RGz6T7CqEUUBkBgZ6rw9ZmNC5GrVxLgZldCiJzANE3KFKcL3Dv+ok265EruBjMrqpVvdRqnbdSuAarw/DB4V6GuqsvPq0uBkCfhQv3dMZ07nalZ6vvguI3GKZ7o8PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570354; c=relaxed/simple;
	bh=dj7n99KgJfjUzz4TqBvohp9kIZhLDMTiLvHQ5lH3x9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ip4sDJQt1gKeOsAnp/9P5Nbmy5mWk/q9PQFuc1ZjwHOjIKZ3ERTBx6wvkYBfULjGW2My6+UhlqmvWIrJc/nYFAvJnuwUmx7zurKC//iUjSpvbiJApU2MH7BXobXT7BDRlgsujCBVnOXAzoMaLF7ca8YV62V417Rf99QfiwcBfNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5+lHe5C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5+lHe5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C951F00898;
	Wed, 16 Sep 2026 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570352;
	bh=TkGGqC3RMjVvrwfy5PwG4mz/vkltLL19QkUFctkO/vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5+lHe5CWEWL2KtQmFkFB55b5iXu4N9Vek0dyGZX1/3zO3ka8nm6/J9Ov3Uj+Twdj
	 oZldKiVpGMPSt7OcgjlmFSWnMS/exKe6A2pnW9s1kh5304G4Lx0wP1JhVWJlv0A1pJ
	 iFShXHn3WBtgXYPWGZ539lIZ9fl6yZvh5/dprhSO7jjKRNI8hSfJo0uZT/O8N8rdR+
	 v8/wkxAhlUAABocYQX2cNdmIDYSMZvBLU8kbehw2VwMGkg2pCL/gj5ll41fUIPPhxA
	 YSTkOrIzqmrECES5q8nUpza3n6FL8lUJhmcUvDHJGiPm3SGSKJf5hVjqr0mGH3r07p
	 vz9mwlnt3vLDQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2F234198003A;
	Wed, 16 Sep 2026 10:52:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 16 Sep 2026 10:52:30 -0400
X-ME-Sender: <xms:KK2qaoHqtAINeNtGRzs1bE4Or1Idw98GmCNo7yvp41p8sHitUvCovg>
    <xme:KK2qajpVBmvzQkmEYsGWHVTg8yM_vmXkodksSZldIgXfwWRjUSgHH3LWiXwuoFgpv
    bcL-CF7740d_Z8JNlZts4mMMbGlmAZ0_nUO64i2DP3V5-bQ6xJ61kibPw>
X-ME-Received: <xmr:KK2qag6NZ0z5r-gHaF-grFcuWVlB11opbmTnXReLIiT7MVmlhJLugr7FVYU>
X-ME-Proxy-Cause: dmFkZTFzC/SjMeXXYY7YnWd3sVIZz68pRPeSBwlUQuzQ26K4k+iWC1VyTPjTOqnFxtjXHM
    W+YMnfQ6l3qQK5dykE8MoWFvEFfnx5MIry9NjqzHKL2Ec5pJpS9Q7SksQNlgzvfkwIKbVF
    oW082Dc2+YFWvz85JNW7R14spIgFcnNMSYHY2HFrVIrBU4VXhIPN94DOg1fkGdV/6cpPI+
    0IXahSkrs6gw44MEjwRtsMCkDTWG+VJhTHbz2pkYOSy2rISqm8afDQp+IA0s98PUVOUPPX
    eaRTiqmCx/zCy6Mw3tqLGr05WwD78p33GgJa84mbueHlZb9u5obu9GWKZTmbsmdQW8CugE
    /606BWJpaqYpYVdKXebre5PN3BaydsB1N6Nzp8zQ8MGhLHrejFhhX9dMqLWNsmRuaUqJae
    XfrmXUu/Cud+YTFoRhxcEho8ftXAl87qUivoOg1HQx/oGfqycEVMCdUSUi92hGuLnypDj7
    LhbZS1kYAxEKHQOHdzmgvUMbMZK6naSOpJHoI0kHcdXOIk6ZlynEG2hmqhAtnIHhW68lnY
    7YewUskzTjR/ngkqwNIdRuHY0eLneIWm53ya0cn73ls6UWyRp96a3bYZAu7akT0KZ0bbjC
    j67aoGD5Aj2Gy2/JB6+fG5MCjofwib3Bupn67WA9x6D0303UOFDeOxMNyLNA
X-ME-Proxy: <xmx:KK2qakQPScdB7OJALGudxXnH-3-BbzUl1YXCMJyU6EEInS2pQ2s-VQ>
    <xmx:KK2qag7TDVEdRyDMWRjoqZkl5P2gU85hqDlXjFHdJI5sA_dfeAN9jw>
    <xmx:KK2qam2D551vsUIl4CMorYd6gC2AYPELFyRQQ-TLIj5Vtyi9h_b9Xg>
    <xmx:KK2qann2JoRQaIxtNsPm0grXVthoz223TdcDfMcqvc4pvr4B0tnQpQ>
    <xmx:KK2qalkdTbUAKqx4tr0L4tfabsAqurcYNp45tH53pVGWD6p9sytvv02h>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 10:52:23 -0400 (EDT)
Date: Wed, 16 Sep 2026 15:52:23 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, 
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, 
	lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com, 
	kernel-team@meta.com
Subject: Re: [RESEND v7 09/29] mm/debug_vm_pgtable: test PMD swap-exclusive
 helpers
Message-ID: <aqqtFKfRDap3ksTl@thinkstation>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-10-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-10-usama.arif@linux.dev>

On Mon, Sep 14, 2026 at 05:27:59AM -0700, Usama Arif wrote:
> An architecture that picked a PMD exclusive bit overlapping the swap type
> or offset field would otherwise only be caught by data corruption at
> runtime. Mirror pte_swap_exclusive_tests() at PMD level.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

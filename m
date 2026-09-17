Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15843469FC;
	Thu, 17 Sep 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630869; cv=none; b=YiCUTjnwUnLmujMeoLTUIVB/1IRVhFi24BHVPUAsXR21qncW5hp3F81T84RdDj+GH/s2OCZ79SWnVn9HdhZla8+ttdF6ZgvpSbeCDYVmkNV4V6/TfugdgNcTdfNB8HuoF8PtYH/UrTiDXEdtsudF7P4Ple8BPKlwNBn9+7Ho3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630869; c=relaxed/simple;
	bh=ODu4TBlU145Yy0CHkOOJrtHC8EHycFWF7w6wzjvsB3c=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=lThtL9f2GV2GxFuVJ6J691RibYyb5ENLLYQOpm2QUrLDMalwNpivBi5lsiZHs8JReIwz7nO1ggTLtoy3Z2pEQRZBNxV2LROL14Jhwfml96lxVe6bE/tm+H8zyoo2wlUNINGoqIQqyMH6bL4xk/AT2iSzDFPWWYPA7oLTc4O8vZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCKcHToy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCKcHToy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2678A1F000FF;
	Thu, 17 Sep 2026 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630868;
	bh=unHzs8AmLeied82z5XajBgVCmX9rGOIH63gfwiwzlEw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VCKcHToykQHUK3KLMsFOfJi52WtYj2xDx3YhcffiTyYFiTbT6rrW1T5/H8XRz9fsd
	 LwPark6HFPoxdThTzS6OjSLTavEOAzfI4e6KFNCjcc6t68ZN5YdbcsukTWnFLPqikw
	 kk5B+/tgSEHiHx89VgzD8r/RrqJ6Xt9JvPtghBnZsrhePaUSTIGEwwYF+50ivLUeKC
	 NdAmMTPpwmtziWognzeSs1qypOIVOh1Cl5O17iYd7c079S+3BMFDCo7FWvPjfaTYNc
	 sGRsIhNTs+gKnb+GhDLX/tJU+MChR5gernDXVU4gEJMEJqpXTmpgpSF5uSSSz7BKNO
	 RCfUNUBOB/o9w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: [PATCH 0/2] init, hugetlb: fix early parameter ordering
From: Mike Rapoport <rppt@kernel.org>
To: Zhenghui Hao <zhenghui.hao@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
Date: Thu, 17 Sep 2026 10:41:04 +0300
Message-Id: <178963086483.2200502.14463144472620315064.b4-reply@b4>
X-Mailer: b4 0.17-dev

Hi,

On 2026-09-17 14:55 +0800, Zhenghui Hao wrote:
> hugetlb records its command line parameters from early_param()
> handlers and consumes them later from hugetlb_bootmem_alloc().
> 
> Commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
> zones and memory map") moved that consumer into mm_core_init_early(),
> which runs before the generic parse_early_param() call in
> start_kernel().  Architectures that call parse_early_param() from
> setup_arch() are not affected, but on parisc the parameters are then
> recorded after they have already been consumed and are silently
> dropped.

Since parisc is one of very few architectures that does not call
parse_early_param() from setup_arch(), I think an easier fix would be
local to parisc.

And there is another related question more to parisc maintainers: do we
really need hugetlb on parisc these days?

> Patch 1/2 moves parse_early_param() before mm_core_init_early(),
> together with jump_label_init() and static_call_init() so that the
> "parameters may set static keys" guarantee still holds.
> 
> Patch 2/2 makes this class of ordering problem non-silent.  It cannot
> fire once 1/2 is applied; if you would rather take only the fix,
> please drop 2/2.
> 
> Not tested on parisc hardware.
> 
> Zhenghui Hao (2):
>   init: parse early parameters before memory initialization
>   hugetlb: report cmdline parameters recorded too late
> 
>  init/main.c  |  8 ++++----
>  mm/hugetlb.c | 14 ++++++++++++++
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> -- 
> 2.53.0
> 
> 



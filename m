Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421181;
	b=N83uKj1VLDJED4mAIz0obsHQ6CBiIpEv/OLHr6EaZ1Ew+8QGB4EnKoUYSDYCZ0HsnJ54
	 wxFwESDIQYEcSjwDhALJ1uRaxPlt+yeEDa0G1kwLxpmnHo5vI9Rw+2R1jtMDCynjoi4Zv
	 GenjlFXnjM/mkvtpCVBf1aIeApN8OlzAxbF3RfRvlUOMic21VyLGmbgGxFRamr43pE1nS
	 gVrOmoLnF1AQiqBExHfV1B/IUC3jt8vjr66Ucum9CdoKprJUGDtwWEIiz94lDpvQ39ciG
	 Hv5c9S1VC2dBxAqpx+eO4H0ZveoVbJ8XEJyfBEPLWVPtin2807FuvE3RWEFgx2k122A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421181;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pfXEXdjQzZILw838pgfZ70Et9pyX3bVcetws/5uL/zw=;
	b=U30VPwm+mAHP5d7zFDS7q6H4C1BUZzuN6Nqtlorr3otvGOMubm69ZfbmQSoZdZTo5BGT
	 m7wuPFT6QwVwc/8r16/KQsgDOyH9TrbjVxq18GZ/WH4AZVKzfridNLcRUzTIYDjiBR3lT
	 KAQnLtZkXklWL3fmRqVY5aC3iOj+YE2LKA1TH9JoRYyNv8LxQOq3pxU7kJ+/hTIzWxtGJ
	 33MAeYXgoVawmSBX2DpxQUGb5K6KMACXGYdnNvqcrD6FuT20oCTJJH68iqVLGoIDzwyO7
	 fT6Zu901FYrVmAz8QyJLRIQUv+fIZF2c2EToVNvfygOLM5NC7q47YeOhtszvpfBA3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cj5Tvm3G;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F304A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F304A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cj5Tvm3G
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A15E1576;
	Wed, 11 Nov 2026 10:19:37 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BBAA3F632;
	Wed, 11 Nov 2026 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794421180; bh=pxMbuBYnl7smF+fcq5aPZzge8JNq0PsIOWBvviY84Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cj5Tvm3GOgQ6hwsYhv5MYuKsZdtkk5Gxs/yjbSHzfcAJbDMNnsmY077R/ag8kn/wg
	 7wi6Zvd1tg/X9S2bA3EtIvFKuopik1Auxq+lW5Ku+MDefJSPklDMDjSXkW0lw2MCC6
	 +QzpnS9PTiDv/BBv5Fw2y6/jB1jiKY0wjM4snZoM=
Date: Wed, 11 Nov 2026 18:19:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yuanhe Shu <xiangzao@linux.alibaba.com>, akpm@linux-foundation.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	"Garg, Shivank" <shivankg@amd.com>, vbabka@kernel.org,
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linmiaohe@huawei.com,
	nao.horiguchi@gmail.com, ziy@nvidia.com, wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com, mgorman@techsingularity.net,
	chengkaitao@kylinos.cn, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Message-ID: <avSxtpwhTbfHi4zh@arm.com>
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
 <16cf88a0-6652-4276-95fb-12306e417701@kernel.org>
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
In-Reply-To: <16cf88a0-6652-4276-95fb-12306e417701@kernel.org>

On Wed, Nov 11, 2026 at 10:36:40AM +0100, David Hildenbrand wrote:
> On 11/10/26 12:26, Yuanhe Shu wrote:
> 
> While the file touches highmem.h, this really isn't about highmem at all, right?
> 
> This really affects any architecture except the ones that define
> copy_mc_to_kernel (x86+powerpc).

I think is_page_hwpoison() is compiled out unless CONFIG_MEMORY_FAILURE
is enabled. Only arm64, parisc, powerpc and x86 enable it with the
latter two having proper mc support.

> > The !copy_mc fallbacks of copy_mc_user_highpage() and
> > copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
> > set while the data stays readable, there is no fault to recover
> > from: the copy completes, the destination folio carries no poison
> > marker, and the poison is consumed silently.
> > 
> > Check the source page with is_page_hwpoison() in both fallbacks,
> > before the copy, and return PAGE_SIZE, the not-copied-bytes
> > convention of the real copy_mc paths, so the callers take their
> > existing error paths.  On archs with copy_mc this code does not
> > compile.
> > 
> > Measured on arm64, where the fallback code compiles: a
> > kernel-space microbenchmark measures 90.00 ns per copy before the
> > patch and 90.71 ns after, 0.8% of the copy itself.
> 
> CCing Catalin. I'm surprised that arm64 cannot recover from a copy from a
> hwpoisoned page.

Yeah, it's been around for some time. Lack of review cycles on our side
as well.

-- 
Catalin

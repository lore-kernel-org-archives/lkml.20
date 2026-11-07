Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034938;
	b=nV5epetHULmwStCtcLnFTu8l9GlARtovWYPwYwdLd4fhIGC2tqB++eMOcwpUyBjo3wT1
	 d9ahmyPMrBAJslyyi6FNTYiEzxh3L+fskDw58tbdmO5HqF7sHBvW8hysOGXBN1NItZEJP
	 nNYo0wc0HnFWD9vJKHLnkclGjzbbLyCEZebNnqY3AXubdizLVvjzlfsI6xlivFUnchwie
	 5T2tk5hUYLzF58rCjQwilPactGEePF7im6jiIhubgxej98VNPpwSGxZCiasV1u28zn+EX
	 dktC8IzJogBw8+ws/8bLD/wCnhAb87zJqJ+RtD+HTfeKPEHnf3TBVD5oYaiQJo5v8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034938;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=SNyW7L7svCZC+4vm04JJa3Y3COX/LWxh617gbF6SI0E=;
	b=X3t3Tc7hFwhO1gC38Oof/Yx9XYEA4OJb1KRxG/QxD/4grvczIpBsEONKTGTcSrnxpPCQ
	 dWqrpBkqjSnUJJGEV9JK2OZnGxVLUVj1H3C7w1v/lfnf7EtuFPJsEY5Zjp40CnpBhrHqu
	 UOBvVJchPAge7lVcUNuuiASnoHz9id38elxqgvLg4AhElAdtNqENYRoBVe41r/w5P0ZpH
	 pfAYzJ0esXkMUKDWzbn65xtc+X9Txh0Ndov9X0Ys9Yt8gslviUtEQK2CXHojdIBlmmrZW
	 X9iy4BF9TnlFlAo/ydiO/TP8te6oxKv+NnCjyqGsAYVCfeFZEXTE6eefw2E2PAQve2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I3yQwc+n;
	arc=none smtp.remote-ip=91.218.175.210
Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I3yQwc+n
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1eU8LB4FiA31cEPkSs3z/GNpYbcTIlce7/3o/u8t5mo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794034934; v=1; x=1794639734;
 b=I3yQwc+nnr9dZ9rJHoIeeQfQUjIaGc2f/SLqKrFxDV2I480KdIkDlwFLnBpoNmKhbVN3fUXJ
 61MUGbXwbuS+9RE94YjhsGLI1nsOE0EUWlJkqkywRE5Q624MjkvGo6fGlaAjtrHSpshsbklTY2m
 LIEKSxp9znNWy0ITPbV6NfYw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 89d1383c0cbcfc28;
	Sat, 07 Nov 2026 07:02:14 +0000
X-Mizu-Trace-ID: 89d1383c0cbcfc28
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-8-jthoughton@google.com>
Date: Sat, 7 Nov 2026 15:01:47 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
> architecture lacks support. This serves only to avoid confusion for
> users.
>=20
> arm64 support for HVO is conditional on certain hardware features =
being
> enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
> all secondary CPUs will have started, and the system feature set will
> have stabilized, including HVO-through-BBM, which
> arch_hugetlb_vmemmap_optimization_supported() checks for.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb_vmemmap.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 8596a462fee6..817ce39d4cf3 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
> 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct =
pages */
> 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
>=20
> +	/*
> +	 * Architectures that need to probe CPU support for HVO have =
done
> +	 * such probing now. =
arch_hugetlb_vmemmap_optimization_supported()
> +	 * will return the correct value.
> +	 */
> +	if (!arch_hugetlb_vmemmap_optimization_supported()) {

I'm wondering if we could put this architectural check into =
hugetlb_vmemmap_optimizable(),


> +		if (vmemmap_optimize_enabled)
> +			pr_info("vmemmap optimization not supported by =
hardware\n");

then, we do not need those code. If the current kernel does not support =
HVO,
then the sysctl does not exist. It's already a common case when the size =
of
struct page is not power of two. If users really want to know whether =
HVO
is enabled, they can check via this sysctl file. Therefore, we don't =
need to
print a log line.

Thanks,
Muchun

> +		/*
> +		 * Return early to avoid setting up the hugetlb vmemmap
> +		 * sysctls; HVO is not usable.
> +		 */
> +		return 0;
> +	}
> +
> 	for_each_hstate(h) {
> 		if (hugetlb_vmemmap_optimizable(h)) {
> 			register_sysctl_init("vm", =
hugetlb_vmemmap_sysctls);
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


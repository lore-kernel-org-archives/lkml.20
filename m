Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886F5187E1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083661; cv=none; b=E1p+FthwRO5sw9/pbiVRxAVS0LqJlWeJCoa3L36LrWTs6oRCpgk+qJcKGuIA2AhwqMD6iYaP2cE6JPBiBCpkKWznCNxunUbs6c4F9E8ACNe6RH+/RG361eCbF9cZ6St2lHYUgeMY8bwhOHQhIC2/BV2LQh6XLpZ2j0UWCmg00+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083661; c=relaxed/simple;
	bh=SW3lscw7FZTt++SdKIYmyi6xhzruZ2CTAVhjOyh5558=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MhBq3Uz5XclbnAMjSb8usN5PP/+WFg0REnNzDc9lmro6kB+BXAQdOHx3+I0DcQ+WG1ABFhG1Rxde1N3bU0zq/AqbJCMzsq6+2dlLY76iCs3Fpn4ni5nG0eEWvo/WJNVqIPFvo7TsQz//xarpZnqa61to/i/vV45mx9bps1Lv9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScK32LSy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScK32LSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15EB1F000FF;
	Tue, 22 Sep 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083659;
	bh=hOgpW4IgnM+iWttR9xGzJPKFkLCxSHMpX5I4y07+yQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScK32LSyDrY7d5+C8okcVeEUzggCwaZYw48LGkNFs79g2d6FsaGQjUnycanFRtVn/
	 hVgC5C16xSQSsH2ZWl7i3uAL/tMCQoA+/QwbuNe64iWM6kBd3o1Eb3mmpc7HjHD8Yx
	 kFY95VDNDpXS71ZTlFVcgX8Nqc/33yM7UhzutJO2t1MBcf/W7Rjhot17y1bDFDaJ3U
	 ljz6jq4Tl7ABUOVZvYSOLHqjIbCdkQ6img71hVkM5E+Bx1hisyF41hkCYvstoSB3tP
	 bGoAXpXw1TTnkBf9sdeMUMjmG8UJIdgk4LYOkKO09YGtGblsPQySTBTwIpEtSDfjqk
	 5B4IZ4Ors4mVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kho: fix global scratch size calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sourabh Jain" <sourabhjain@linux.ibm.com>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, linux-mm@kvack.org, "Mike
 Rapoport" <rppt@kernel.org>, kexec@lists.infradead.org, =?utf-8?b?Uml0?=
 =?utf-8?b?ZXNoIEhhcmphbmkgKElCTSk=?= <ritesh.list@gmail.com>, "George Guo" <guodongtai@kylinos.cn>, "Pratyush
 Yadav" <pratyush@kernel.org>, linux-kernel@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Alexander
 Graf" <graf@amazon.com>
In-Reply-To: <20260922131217.698809-1-sourabhjain@linux.ibm.com>
References: <20260922131217.698809-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 13:27:38 +0000
Message-Id: <20260922132738.B15EB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kho: lowmem scratch exhaustion due to missing node-specific lowmem=
 reservations
--

commit 45b67db1813edaa6fb1bdfe7033f0598a814cd63
Author: Sourabh Jain <sourabhjain@linux.ibm.com>

kho: fix global scratch size calculation

This commit updates the scratch size calculations to correctly distinguish
between memory reserved for a specific NUMA node and memory reserved with
NUMA_NO_NODE. It introduces memblock_reserved_size_nid() to calculate
reserved memory based on reservation type and NUMA node, fixing an issue
where per-node reservations were incorrectly included in the global scratch
allocation.

> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index 7c4d86daf86d5..dc809e1e768c0 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
[ ... ]
> @@ -787,17 +787,17 @@ static void __init scratch_size_update(void)
>  	if (scratch_scale) {
>  		phys_addr_t size;
> =20
> -		size =3D memblock_reserved_kern_size(ARCH_LOW_ADDRESS_LIMIT,
> -						   NUMA_NO_NODE);
> -		size -=3D memblock_reserved_hugetlb_size(ARCH_LOW_ADDRESS_LIMIT,
> -						       NUMA_NO_NODE);
> +		size =3D memblock_reserved_size_nid(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NO=
DE,
> +						  MEMBLOCK_RSRV_KERN);

[Severity: High]
Does checking NUMA_NO_NODE here exclude node-specific lowmem reservations
(like node-bound DMA pools) from the lowmem scratch size calculation?

If the successor kernel requires lowmem for these node-specific reservations
during early boot, could shrinking the global lowmem scratch memory lead to
memblock allocation failures and a panic?

> +		size -=3D memblock_reserved_size_nid(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_N=
ODE,
> +						   MEMBLOCK_RSRV_HUGETLB);
>  		size =3D size * scratch_scale / 100;
>  		scratch_size_lowmem =3D size;
[ ... ]
> @@ -815,11 +815,11 @@ static phys_addr_t __init scratch_size_node(int nid)
>  	phys_addr_t size;
> =20
>  	if (scratch_scale) {
> -		size =3D memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						   nid);
> +		size =3D memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, nid,
> +						  MEMBLOCK_RSRV_KERN);

[Severity: High]
Are the node-specific lowmem reservations that were excluded from
scratch_size_lowmem now being counted here instead? Since this counts
with MEMBLOCK_ALLOC_ANYWHERE, will these reservations potentially be satisf=
ied
using scratch memory in highmem?

If the successor kernel restricts its memblock allocations to
MEMBLOCK_KHO_SCRATCH regions, won't it be unable to recreate its
node-specific lowmem reservations if the per-node scratch memory was placed
in highmem?

>  		/* Do not count HugeTLB pages. */
> -		size -=3D memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						       nid);
> +		size -=3D memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, nid,
> +						   MEMBLOCK_RSRV_HUGETLB);
>  		size =3D size * scratch_scale / 100;
>  	} else {
>  		size =3D scratch_size_pernode;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922131217.6988=
09-1-sourabhjain@linux.ibm.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E648380E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584992; cv=none; b=IxlKPMo4dbjlinPCDgYdZzH+cMms7sjNlD25tNYQ8jjYyKDsBeOVZiUJc+e/vRfzH2rByZCjnJfLWIPZR1icF/TQBzKb7/MuuY5LNFlZO/vpxTEHsy2PpA7TF3Gvg8996rv5L+XX7gyqzs2yaw3E7FopcaTgEUx6rEbfHDWpx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584992; c=relaxed/simple;
	bh=5uYaqStOoWl8YMzYMqjsA8VvAK1731syKn+wugFrE44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pz9YMyBQivvmAmSDNFKcSsIQME1SOrZXfLbzVANKOwspsrjvPiwOIe+x9V+zB3bwtbvKzVn5hrA5gnVH57Z0ysUVaTFMhJt6MTJsa0I/KIpNXqTK+XjnO0hGP3DiKEg7HnGsizQAhlgUJIWn8l41t0+Ahz4fJ5+PjxnHJ8gS6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MT2w6zGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MT2w6zGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CDB1F00893;
	Mon, 28 Sep 2026 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584991;
	bh=E76/YfWbHqZZH9AFPe/RZhLmVNncPaFjzlO3MR/eBew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MT2w6zGlGUb23+uuNLyCwCEpY5WWukQVFYDPyhv3KmOe059p/K53PHsfZuM3HPs+6
	 MdEfsHyzTVtXVzK6/pPvFsPCZaRxIEr+SOsWmS2rWh8S87FVhSIBm7tC3zpEDL7UHS
	 oYC0WXMuRZlp/PHXjImBGChHWyX85GAfj6j3yoOqg0X17g3CYoxw5acwM5devozjKF
	 yYjKC3YM9WdRerSnW3nZsLS6j3YF2gBnHV/JCyN1cWKqzHKVwljm0BF+gI6Vi37XNH
	 7tc2+xSwfBvTtOUynyXFI1il1589u5YA8LhnC2Yh599ZiovBN67AdemETzsVsJhCc3
	 xN2V6+Y5cAGpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] powerpc: add support for Kexec HandOver (KHO)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sourabh Jain" <sourabhjain@linux.ibm.com>
Cc: "Hari Bathini" <hbathini@linux.ibm.com>, kexec@lists.infradead.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, "Alexander
 Graf" <graf@amazon.com>, linuxppc-dev@lists.ozlabs.org, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Mahesh Salgaonkar" <mahesh@linux.ibm.com>, "Shivang
 Upadhyay" <shivangu@linux.ibm.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baoquan
 He" <baoquan.he@linux.dev>, =?utf-8?b?Uml0ZXNoIEhhcmphbmkgKElCTSk=?= <ritesh.list@gmail.com>, "Shrikanth
 Hegde" <sshegde@linux.ibm.com>, "Aditya Gupta" <adityag@linux.ibm.com>, "Mike
 Rapoport" <rppt@kernel.org>, =?utf-8?b?Q2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JP?=
 =?utf-8?b?VVAp?= <chleroy@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Nicholas
 Piggin" <npiggin@gmail.com>
In-Reply-To: <20260928083226.107807-3-sourabhjain@linux.ibm.com>
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
 <20260928083226.107807-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:43:09 +0000
Message-Id: <20260928084310.10CDB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] boot: late KHO initialization allows memblock to clobber preserved=
 memory
--

commit 2f581dec390379323e7a0b4e4badb03487eea55f
Author: Sourabh Jain <sourabhjain@linux.ibm.com>

powerpc: add support for Kexec HandOver (KHO)

Add architecture bits to enable CONFIG_KEXEC_HANDOVER on powerpc. This
patch checks for KHO information in the device tree before unflattening it,
allowing a kernel booted via KHO kexec to recover the FDT and scratch regio=
n.
It also moves early_init_dt_check_kho() to be called from setup_arch().

> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/set=
up-common.c
> index 4afaba19b5867..53c2f1897bfe1 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -923,6 +923,8 @@ void __init setup_arch(char **cmdline_p)
>  	/* Set a half-reasonable default so udelay does something sensible */
>  	loops_per_jiffy =3D 500000000 / HZ;
> =20
> +	early_init_dt_check_kho();
> +
>  	/* Unflatten the device-tree passed by prom_init or kexec */
>  	unflatten_device_tree();

[Severity: High]
Does calling early_init_dt_check_kho() in setup_arch() happen too late to
protect against early memblock allocations clobbering preserved KHO memory?

The Kexec HandOver (KHO) mechanism uses a scratch memory region to strictly
confine early boot memory allocations in the successor kernel. This prevents
them from overwriting memory pages preserved by the previous kernel, and is
enforced when kho_populate() invokes memblock_set_kho_scratch_only().

However, setup_arch() is invoked from start_kernel() long after early_setup=
()
completes. During early_setup(), substantial dynamic memblock allocations o=
ccur
before KHO scratch memory confinement is enforced.

For example, move_device_tree() allocates memory for the FDT:

arch/powerpc/kernel/prom.c:move_device_tree() {
	...
	p =3D memblock_alloc_raw(size, PAGE_SIZE);
	...
}

This is called via early_init_devtree() from early_setup():

arch/powerpc/kernel/setup_64.c:early_setup() {
	...
	early_init_devtree(__va(dt_ptr));

	allocate_paca_ptrs();
	allocate_paca(boot_cpuid);
	...=20
	early_init_mmu();
	...
}

Because KHO scratch-only mode has not yet been enforced during these early
allocations, could they use standard memblock policies and overwrite preser=
ved
KHO memory state, corrupting the handover?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928083226.1078=
07-1-sourabhjain@linux.ibm.com?part=3D2

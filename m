Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE52481FDF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584915; cv=none; b=RcHk5P34OhlBqRjgTxQFN8egcRAue5QK/n+IAXL2Dyjp3PTzp+zOnPG6F0F0CTVzilQl2h7k94bUogCznqjuBQPERQaGdt9H2OwTY0T1n9UvBlBQ2lzyNswmtAyBJqdOldUG866aqL4p76SsEjtfEaun8q/C6JZAVgCScQ3K64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584915; c=relaxed/simple;
	bh=syRIFCGxP7le/AhGOEen2HsWL9sATLgQ49Pe9mAQXSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B5rVPvTmufZzvjbz8hsyph/6AOMEEawUncM+kCZi++owI8Uz3m/+DitnEx3S9+aUvIIRBeUCs56sW8ruSPwqhyM4KtHtWdTZfLI2PN7BgQhClJSUiJgAIeEDB2zs/DBEf/Hbv5kUOwgUbDY98pEbjNDZ7KxL5dmDo6ugIgZXytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PD8hEsHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PD8hEsHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52D21F000FF;
	Mon, 28 Sep 2026 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584913;
	bh=TdNzTDhEchXUCyf1n2C/rpdeXch7Ae3LIrA75qOk4gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PD8hEsHegiJzwCoePhw1+13WgFrtcq5hV7DTTk9e9nX3Q4vTo9/bAAqtyfPzV33VA
	 UvFDDccr/S4U2abGu8aTXiyCYGLlo13zWYfcYy/ejx2oy769fRe1PrVDyliVYT9UOt
	 d8tLB6Q/U34borY1Xq3wUDCcDFbihcCGYan8Qmg0olnueWp8k11Q7DEYl6ZwoN1aiG
	 oSS/UCTtpOjOgQM86e8R3yQuUyY3LmKwW36neXL9zEbJ9QR9W77mSlPjPrMEtd8oGH
	 wZbMTRv9ATeMpjc9W1QR+bD1H6DPnrBEY2l8YvzjNhAvZXfCdMwAB+vdpMD7xQp7j9
	 tW8irqCisFMJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] kho: check scratch vs CMA alignment at runtime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sourabh Jain" <sourabhjain@linux.ibm.com>
Cc: "Aditya Gupta" <adityag@linux.ibm.com>, "Baoquan He" <baoquan.he@linux.dev>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Pratyush Yadav" <pratyush@kernel.org>, kexec@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JPVVAp?= <chleroy@kernel.org>, "Mahesh
 Salgaonkar" <mahesh@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Hari
 Bathini" <hbathini@linux.ibm.com>, "Mike Rapoport" <rppt@kernel.org>, linux-kernel@vger.kernel.org, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, linuxppc-dev@lists.ozlabs.org, "Andrew
 Morton" <akpm@linux-foundation.org>, "Alexander Graf" <graf@amazon.com>, "Shrikanth
 Hegde" <sshegde@linux.ibm.com>, "Shivang Upadhyay" <shivangu@linux.ibm.com>, "Nicholas
 Piggin" <npiggin@gmail.com>, =?utf-8?b?Uml0ZXNoIEhhcmphbmkgKElCTSk=?= <ritesh.list@gmail.com>
In-Reply-To: <20260928083226.107807-2-sourabhjain@linux.ibm.com>
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
 <20260928083226.107807-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:41:52 +0000
Message-Id: <20260928084152.B52D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kho: bypassed scratch alignment check during resume causes memory =
corruption
--

commit cbd7cb7f008e704b389d8dfe3306e1e83e49e8a8
Author: Sourabh Jain <sourabhjain@linux.ibm.com>

kho: check scratch vs CMA alignment at runtime

KHO requires the scratch alignment to be at least CMA_MIN_ALIGNMENT_BYTES,
which was previously enforced with a static_assert(). This commit replaces
the static_assert() with a runtime check in kho_reserve_scratch() to allow
KHO on configurations where the minimum alignment is not a constant.

> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index 7c4d86daf86d5..dc76dd6b74da7 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c

[ ... ]

> @@ -836,6 +828,21 @@ static void __init kho_reserve_scratch(void)
>  	if (!kho_enable)
>  		return;
> =20
> +	/*
> +	 * This is the minimal alignment required by deferred struct page init.
> +	 * deferred_init_memmap_chunk frees memory to the buddy allocator, whic=
h looks
> +	 * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
> +	 * If KHO scratch is not aligned to that value, buddy can access uninit=
ialized
> +	 * struct pages, which can cause a crash.
> +	 */
> +	if (WARN_ON_ONCE(SCRATCH_ALIGNMENT_BYTES < CMA_MIN_ALIGNMENT_BYTES)) {
> +		pr_err("scratch alignment %lu < CMA minimum %lu, disabling\n",
> +		       (unsigned long)SCRATCH_ALIGNMENT_BYTES,
> +		       (unsigned long)CMA_MIN_ALIGNMENT_BYTES);
> +		kho_enable =3D false;
> +		return;
> +	}
> +

[Severity: High]
Does this new runtime check get bypassed during a KHO resume?

During a KHO resume, kho_memory_init() skips kho_reserve_scratch():

kernel/liveupdate/kexec_handover.c:kho_memory_init() {
	if (kho_in.scratch_phys)
		kho_mem_retrieve();
	else
		kho_reserve_scratch();
}

If a predecessor kernel passes a scratch region with a smaller alignment,
and the successor kernel has a larger pageblock_order, bypassing this check
means kho_init() will iterate over the provided scratch memory using the
successor kernel's larger pageblock_nr_pages:

kernel/liveupdate/kexec_handover.c:kho_init() {
		for (pfn =3D base_pfn; pfn < base_pfn + count;
		     pfn +=3D pageblock_nr_pages)
			init_cma_reserved_pageblock(pfn_to_page(pfn));
}

Can this lead to init_cma_reserved_pageblock() overwriting state for pages
outside the actual scratch region bounds, or cause a crash in the buddy
allocator if __free_pages() is called on an unaligned PFN?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928083226.1078=
07-1-sourabhjain@linux.ibm.com?part=3D1

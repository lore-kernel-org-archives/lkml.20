Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612303;
	b=KAQQWVz94MO4tkwmWrKgUUhSQD356pl5DE2IsJpvJI+ADC3d+rFx1mwVuUXQOOq/i2gT
	 C9cfKXh1OP4+XWR2HeNiyZgsNjl1IjBxutNfLWGp5dqUWjfSW+XrBvR19voYXw8+aPtZz
	 OsfnsGRJ4Ed9jl91m1k7StM5wEM4volZliZZFa1x530aU01ipGZMJXULEwRKD6NKJrYwf
	 mvydSeT6PcXoAF2TW6G9X5d4lSE/rGq7r5Ne0bYTrJCXQeAZ6kpuIAXCCgOKIp5Z3UAia
	 WEpGnoraY1Hqhb5oqe1FRuOHtqd/4AZ1CWoIcbMVGsGpQ5tfFLKJV0zlQAmUS6R1y5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612303;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=4YOkdhIkIlSfmCpxC2cFcd/08KpoDti4oEtbsSEH1T0=;
	b=BV6/trU6NRSzwSoMedJ7kdNperuuIZxYSai/xn9qxhD0Gq2cec68qe56MJuUB1oiNBKD
	 vr20YSvwhfIlvvJS19sh0M/SNflIZlerspcY+fvdU6WljXSmuIPBOc/3jCPZhbH5PKs1O
	 D7SYlyzrXYRNPUem1r/6FYTAYyvH1nyp07Lvo0T1VF5Zf4t5PxQieJj1uIT118+mfTSQp
	 Ly/Fp4E2pVF4JGWQyCwXJS5zdSUWzLcmRulpf11X3nEd2ODySJs2BWJE6VMZlZBD1f5He
	 gfGdnWP6jLNyRCijxnMMcFN2GkwWsuZy17SlIZ0qSg8Ki4k5kc8kR9SCLS7nsOb/Duw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BvN9ujV1;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147F60A2633
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D147F60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BvN9ujV1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612303; x=1824148303;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=b/drm6ctQL/uBthlpUAr2Zt/NlcNJ+2M/NwQl04CKWQ=;
  b=BvN9ujV1OIzfuG0yWSkAeU3jpjmG8LW5IfIMNDi8j8Yv4lR4euHgzt92
   Gc6eDYiLG8X4B13JBa0cAKrtv+2sJHJ/EL/evkzEoAoenqQ68FWMLv+aO
   6VzRlfFlVY3EJwUCtA1rKDFgho6cfyBfcetIJfD9hNWDLUSeqENkPJsrU
   3MycmHgOX8JcthI9lq+DFVf3CxnAGFkX6vaQpll1p6urGJHTWA14G5DXF
   0u3i+KmJFDF0wITsSmhnfOw6SlvHrdiIxVx9IDQdX6He2KdNfMu5krOyJ
   DBABm08ZrS1a+HdljXRHCiyAVRTxH3LF2gkxGH8cgPZeOd9o+KVAJgQiJ
   w==;
X-CSE-ConnectionGUID: VUXqe7upRO+E4SMYNFTBRQ==
X-CSE-MsgGUID: sBj6XMz+Rhqlh5Embkj7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230206"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:42 -0700
X-CSE-ConnectionGUID: 68bQTZR2RyesOSmwfWoldQ==
X-CSE-MsgGUID: mv2ZLkz7RVKH+dfI2UX2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092188"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:42 -0700
Subject: [RFC][PATCH 16/24] x86/mm: Kill shadow stack page permission warning
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:42 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195142.A928EE5D@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Shadow stack permissions are now normal and valid for kernel mappings.
Kill the warning.

---

 b/arch/x86/include/asm/pgtable.h |    3 ---
 1 file changed, 3 deletions(-)

diff -puN arch/x86/include/asm/pgtable.h~axe-shstk-pte-warning arch/x86/include/asm/pgtable.h
--- a/arch/x86/include/asm/pgtable.h~axe-shstk-pte-warning	2026-10-21 12:36:40.424885841 -0700
+++ b/arch/x86/include/asm/pgtable.h	2026-10-21 12:36:40.427885846 -0700
@@ -730,9 +730,6 @@ static inline pgprotval_t check_pgprot(p
 static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
 {
 	phys_addr_t pfn = (phys_addr_t)page_nr << PAGE_SHIFT;
-	/* This bit combination is used to mark shadow stacks */
-	WARN_ON_ONCE((pgprot_val(pgprot) & (_PAGE_DIRTY | _PAGE_RW)) ==
-			_PAGE_DIRTY);
 	pfn ^= protnone_mask(pgprot_val(pgprot));
 	pfn &= PTE_PFN_MASK;
 	return __pte(pfn | check_pgprot(pgprot));
_

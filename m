Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C5361970
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182347; cv=none; b=nXX3aWHB6LVwr+rBDfY1RjIUSCtQSZaDqNbd2hZvH9L+Ss91yP41FRbUo1s/ucbMZbeSc2qLgfWdHBtJGfkK4m/2Pk3ELu9IKdllcIQ3WoX2coFYupELQeqnm10IQ7PvWjBSLwggAkzuk03PUsDu7XG853KyH5Wgcgm4waXFUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182347; c=relaxed/simple;
	bh=0k1Zz1txYZH1PwdNSJa0KLKBMvPX3hwqFYmvK9C9q94=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eMwtnHc2RGpLJHvXSZZI0YdrMoQDPYh+jKQXx95/Gg6J6jPTOT6ys812xOaGS4t5w0dVMDVRHuRnKMP4lYOByAKMzQjZrBcBARyDsiRxay1lLx9OsH+X2i3V5vPOpuUIfdSgasoj4ig9RWBhPhiY2yvCGdypamEppocxdwGHt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op4xTJIz; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op4xTJIz"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso622365f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182344; x=1791787144; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jUXKHUsl8I+TxZpA4AmD7FcPh3xLEY1fLS46VnzRfSU=;
        b=Op4xTJIzjxglNcWyIfBLTQUXCfGy8FAOMPmlqZFCVDYg3iZmxYh+xSx/+LtpHDmN81
         T5VHgxKyncRIp+5QIuBvUwywb9xQYm/oShWWxU6t9wQGfbmZi85/ev0WiWjl8rTaV9gx
         PdA842VwTW4VNiX4gu0IR/SEmos+fLwl3Uelc85MGOO+hCoFX+FhgouFv0kVb20m/T6N
         veXtmaCk46oH3asOf3zW+AxDoBWI8aQktycu9BMywSscs7ijdnMZK9iVGGFPUKZN+iCS
         T3in5eXSObo/R2SZaCBWWxjnJ+0DznKfP4jkiephwUpmt19jTDQqH+x/hBuTWTLjHUDd
         +njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182344; x=1791787144;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUXKHUsl8I+TxZpA4AmD7FcPh3xLEY1fLS46VnzRfSU=;
        b=HIvDDFcV/FC++DBbd+c14jU1AFRJEW3D1EU0RHd5uq71mEkAt5oiAlI0UCnmxgDpiT
         nm+BR1EmKDU+TwPKEcSk5WtH+AOTFZAHIQxB7vwgC5WAPZXGRvhrIpR/yMLAjGoYRNBS
         sOl2OyKZ37KTaDQD+hSyYnhUHCYSPp/ztwk+LMPm3G+/Jx4CDFLa3/FjRiaFdETYO8yX
         +CVnp92hxa1nuW+D0v4Cndzu+zxFsV6cJCnccRELa3K0wFLI6H0eMl1gUBNkLzSytM+l
         o7axMQmSNp1DnnzWhfHJt8Ks5y8ol4IJooflEs9RwQ7/XfIeOhB0VK60/ps4MZ+0osGJ
         l1Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwoJp3yMkkmapKrCnwi1lEscV0T+HsSY/p4xgVErnj4PA3NrpKpOuvqzBkcqwqAiV6qhDcot6CJOK5DF9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJErUjCJnvVVjVGqhoDJxKoiQlz/7ifKfv89Ffcn3E1lq4y87OG
	mRt0e5W+zgH4GMJRSkS4Td+kCaaXP26CbkaY54wcCb+zR+1kFu/F5HDj
X-Gm-Gg: AYBFou2WOyuRIxe2IUuQxKLaTalGJuRwBRx/GEvX511Pl/vm62fYcDe+3Km4AeeMhoB
	8vHxAwRlOLQEjs1hVq47YY+aSVtWxeuGPUa9EzNdPf2bdKze/se+RFH0nEnTnbXkgI5UmOkHh+j
	iH97QNpzNbeTzobtgZwRJuBGwjeeSDoibi3px50aNqmJ0VRHh8ah9EQTMAb8Ni88XjXoAq6unmY
	I/hKuysCfuxGQ1Wm4pjSl9+QKt8+deS0luJXpPlHYyS8m7t+VS89bgQPoxb/CT1dNyb1IpZVsZo
	CvowiupY8ekJdb23qooZvQzGAhIFdU+hhDuqUSpNflSLRXCjaLYWbXjEnQvkdGrwmasHYXvYSHj
	IkCwaLDT/yJ6+vpdBqWp0h6s4CNDSJHHSqm7FdnGzMqbBexXCZOCPcgJ1uYd/MiG6xDEXDHTnMY
	Fp4xURNNONh9r920a/WKBqynG7atqsxDC4H4kANlkabkVVeXywmF4Ut838/2PVay/pLtH01Gl51
	A3ImSj5oJLvwkKqxNLCe2DEm2G5M6rE/SZaDdjeC4SO1LYJoyBaLw==
X-Received: by 2002:a5d:6b84:0:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48b1273e475mr13370049f8f.33.1791182343892;
        Sun, 04 Oct 2026 23:39:03 -0700 (PDT)
Received: from smtpclient.apple ([141.226.89.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c63904832sm967264f8f.14.2026.10.04.23.38.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 23:39:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/1] x86/mm: fix incomplete page-table invalidation with
 TCE
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20261005052302.43042-1-lance.yang@linux.dev>
Date: Mon, 5 Oct 2026 09:38:47 +0300
Cc: dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 riel@surriel.com,
 linux-kernel@vger.kernel.org,
 qi.zheng@linux.dev,
 thomas.lendacky@amd.com,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 brendan.jackman@linux.dev,
 jannh@google.com,
 mhklinux@outlook.com,
 andrew.cooper3@citrix.com,
 Manali.Shukla@amd.com,
 mingo@kernel.org,
 stable@vger.kernel.org,
 toshi.kani@hpe.com,
 david@kernel.org,
 mikhail.v.gavrilov@gmail.com,
 pfalcato@suse.de
Content-Transfer-Encoding: 7bit
Message-Id: <D8AEF6EF-D92A-4838-95A7-EB93BE319BE1@gmail.com>
References: <20261005052302.43042-1-lance.yang@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> 
> 
> On 5 Oct 2026, at 8:23, Lance Yang <lance.yang@linux.dev> wrote:
> 
> pud_free_pmd_page() uses a single-address invalidation to flush the
> paging-structure caches before freeing the page tables. With AMD TCE
> enabled, this only invalidates upper-level entries associated with the
> target address. Cached PMD entries for other addresses in the PUD range can
> still reference the PTE pages being freed.
> 
> The AMD manual quoted in the commit enabling TCE says these instructions
> remove
> 
>  "only those upper-level entries that lead to the target PTE in the page
>  table hierarchy, leaving unrelated upper-level entries intact."
> 
> Even with all PTEs cleared, speculative page walks can cache present PMD
> entries after the earlier TLB purge.
> 
> Use a full TLB flush before freeing the page tables on CPUs with TCE. Keep
> the single-address invalidation otherwise.
> 
> Fixes: 440a65b7d25f ("x86/mm: Enable AMD translation cache extensions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
> arch/x86/mm/pgtable.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index 4a105f283cfb..6b7fa44f1bf6 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -727,7 +727,16 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
> 	 * via normal page walks. Make them unreachable
> 	 * in cached mid-level walks too:
> 	 */
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
> +	if (boot_cpu_has(X86_FEATURE_TCE)) {
> +		/*
> +		 * With TCE enabled, a single-address flush does not invalidate
> +		 * cached PMD entries for the rest of the PUD range.
> +		 */
> +		flush_tlb_all();
> +	} else {
> +		/* INVLPG to clear all paging-structure caches */
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
> +	}
> 


It might be cleaner to replace flush_tlb_all() with:

	flush_tlb_kernel_range(addr, addr + PUD_SIZE - 1);

While the flush-ceiling would usually end up doing a full flush, the
code would be easier to follow (the very least). Maybe adding stride
to kernel TLB range flushing would make sense in the future.






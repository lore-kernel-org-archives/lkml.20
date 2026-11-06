Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931175;
	b=Y4mntPqpBp9MxwkhtaP+Rzh3SjuhRBQf3FqTG4nST+YFMgxF7+KquQ1ClqO7Wc/qPIkA
	 9ElsDNJfY2k19FDI4jFs1TUmyNdKB8nT4Pw+FBCwf2wMV915dgk971GsSSv3xK5uvoeAC
	 /4Ej//nkf8R+UDmAogg8NdtOP5QPn4+v9kAHsKN57wKCNMGh2XbE+5BJF9BnMfyBbFEFS
	 ut/hM9SUZ19n3LW/BLkcTkjdV8s4c+IzFc5ldkGGp+G0UY8pQQdWcmRQVc7iuFszvRFTj
	 960W5P29OyzTnLq83D1GS3H77FDijxHhi2zY2kIReWaH/ukb2hR/FhQHglAUrnX0phA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2NrJEZHpWhPu2W0WafZ8uMlfwRmvxVzRyikkUkgFqo8=;
	b=3E7ROl1qzaTQrN9IpgsVC4sQ/dZ+Znzykndj7bBtv/PY1MbaCn6Rh2khQyxiON6hgVtk
	 +cVuIOv50GLHbn2XICA0XVDcalOV2nS4VA20hQovjfGUy3Rg2WHogL0bKISBmpmSW3Cy+
	 QSRtL/CbIdpalbzDVJyHCqBUdtSSXKk2O1IumGNeRpzkc6dgOOXRBOcHypjsntMT/k1a3
	 gNHeRVkf184wpo22p97dW5r8MUmw2g30q6AST2r4KgaYsQPFugH12UJi/1zYFhhCdiLzr
	 TDb4JtSDtZr1VKIY/C0v7Tg4kcIyQbFOnfbfQuULjzjBhr2ew6mnm8BA4tXwNW1ZV9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfAtxdSu;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938F6606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938F6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfAtxdSu
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso93055a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793931174; x=1794535974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NrJEZHpWhPu2W0WafZ8uMlfwRmvxVzRyikkUkgFqo8=;
        b=cfAtxdSuTMvg6yfivBv0Tn75CYFhLF6AIig2YkHEwmTO+N6uCR1srjEyNb9UH+6f2T
         geu2EqyRX35mbMjmne5ppzhSsMO+5oeAHWVL3q2v41XWTua9wXztTyJXvb92vT8YAwmD
         pGIiRAxJ8yMiTJ8uvNtB3uWLeC2XeN3pMKiRV6ZRSqd1bkzgkBgk6snEEDEorH/q1Bly
         QKx211jun98VOEXvvzdSYrI++TkonIBtguo4gOr4PSPhTW1R2/bUJeC3NFBffG9DlW5s
         JbBY7iovbiwOr7zlBK6hcEK/cDM1VAUtke5iPVfxDW+NW/VkcGj5KYRK8wyBCZcSE4ly
         qpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931174; x=1794535974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NrJEZHpWhPu2W0WafZ8uMlfwRmvxVzRyikkUkgFqo8=;
        b=QDmcg4/LZoBG4zku2X+4PR418H1yyKQ0UyC8baU6iKCUNOYqC251HrTPaEGl2uxdwF
         qXmSSZMYHL+/RRWtl/5UGCmsjJQTGhdQTZYfKvJ7+C6zt7Jpiziv7TzWK7FJG5rpe+KY
         FMouYsf+j22m3D+eJqkA2wFcR6T5WZowuJWbCcYy6GaRKQRmupMaj43oQAL0+uvkBE8s
         mKGDAJDCXADyaNevRfqb7ZkWxal14UVdXnIV4cfzj4q0TR1OP2YRnMj7Dn8+yL+VBhqh
         ZOxVTW17hGMBE2qMVpJRrDGN5MFusjitHzLk4DaO7IbRaN2xuVQo91N+mZ+JRFussawU
         VVpQ==
X-Forwarded-Encrypted: i=1; AL+hErHRO32mRAsc/kQ/pLqrMy3FvB95EFlyfjMGjR40P0wkFgQq2903zS0CJ2oSb7boYDIPllss7C8PPisVZx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C2icSVKth7PVr/hrZU7Oq3ldvCLPXfheFU0DB+9QkNG8wO5O4
	odhcaZswOayTTRYjFRjJvDKwUEnqBixURXM4mLxy8vJs0e0l6k/BEPk5
X-Gm-Gg: AYBFou1JQjiROXBN7NVKIx/Teu1lOJ/Leg1z5olaLwS96DRmc91xznYfqXZvMNrzas+
	eKBw944dtiWmDF7NrFNXKfv5MZXD3gZRjww6hGA23rrwsGxQ5DzMKngUheSMnxFadJfSUX0mRnG
	tTqWfAXZcwYwzkWhOXs65TngK5nn/PobkTFojpY6kJesiyFWDX2SIwsykw/i4gJWEM8Q6PR5fvH
	CPjKySBPZdoyPfeTnJ/O/sIuJZv0/3C4Qvi73kt0iToCYXl7XAfu1xnugKHyK8CUXkyqMD7JeF9
	+bpy/WAjQxB3wtRq2FyqkZp8Mlhec8xThyGKvLAAAehojtY5HMgZhx0IquV0wkFbi/z/hP5L1cA
	HXe2Mh/nxnVe6Z/1mhvh4wm9E/scMKoyoJupE4TJFprUk4tlrEHtMuzSfzEJ8GnududLTZ/5ZFQ
	DrbpixUMGtqn0544vCsjcKvdr+WvyWjtDcBQwlbMA9EIFrtBA/fJrQQForKvfsbFAPH+uxo45B4
	xxtHqfyvvH22U0UwVLLrayOEpMhZP+ilIT5F1DKK+syGqxTPpeZVjIW8tKrIpUmmU1zvUD0EKbe
	nbXxTp7JkCoZ4ns26HHYvnoJ8nU9qlRqjsbUDTAusOmiVrnRJ6vt2HH7Ygm6m0od
X-Received: by 2002:a17:90a:e703:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b0db6dfb59mr920602a91.13.1793931173907;
        Thu, 05 Nov 2026 18:12:53 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm5665814a91.8.2026.11.05.18.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:12:53 -0800 (PST)
Date: Fri, 6 Nov 2026 10:12:46 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <257ab860-b408-4897-838b-e7b68f981d6c@gmail.com>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
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
In-Reply-To: <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>

On Thu, Nov 05, 2026 at 08:57:24PM +0000, Lorenzo Stoakes (ARM) wrote:
> khugepaged walks an mm's VMAs under the mmap read lock in
> collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
> them if encountered.
>
> It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
> when these are encountered, however only checking this budget once an
> eligible PMD-spanning VMA is encountered.
>
> It can therefore hold the mmap read lock for a long time if there are a
> large number of ineligible VMAs present in an mm, over which time no mmap
> write locks (and thus no VMA write locks) can be acquired.
>
> Address this by checking whether the mmap lock is contended after every
> KHUGEPAGED_MAX_VMA_SCAN_BATCH VMAs walked, that is a quarter of the
> pages_to_scan budget, and if so dropping and re-acquiring the mmap read
> lock before resuming the walk from the per-mm cursor.
>
> As the walk is resumed from the cursor rather than the VMA that was current
> when the lock was dropped, the cursor must never move backwards. A VMA
> ending at the top of the address space causes ALIGN() to wrap the cursor to
> zero, so treat such a VMA as the last in the mm rather than skipping past
> it.
>
> This was tested locally with ~1M ineligible VMAs mapped ahead of a
> collapsible region of memory, and resulted in a reduced mmap_lock hold time
> of 170us down from 95ms.
>
> This was also observed to reduce mmap_lock stalls in concurrent threads of
> a similar duration. Note that a reader re-acquiring the lock can currently
> steal it from a writer that is queued but not yet running, so the full
> benefit to writers depends on the separate rwsem change at [0].
>
> Local measurements indicated no change for ordinary use cases, so this is
> all upside.
>
> This work came out of investigations into mmap stalls when getting latency
> numbers for an unrelated patch series.
>
> [0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/khugepaged.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 216c4b8d28c4..eaa01dae5a03 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -66,6 +66,12 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
>
>  static struct kmem_cache *mm_slot_cache __ro_after_init;
>
> +/*
> + * The number of VMAs to walk before checking for, and relieving, mmap lock
> + * contention, as a function of the pages_to_scan budget.
> + */
> +#define KHUGEPAGED_MAX_VMA_SCAN_BATCH(pages_to_scan) ((pages_to_scan) / 4)
> +

When pages_to_scan to equate 1/2/3, KHUGEPAGED_MAX_VMA_SCAN_BATCH(progress_max)
always to 0, we will never scan anything.

The following code will solve this problem.

#define KHUGEPAGED_MAX_VMA_SCAN_BATCH(pages_to_scan) max((pages_to_scan) / 4, 1)

>  /**
>   * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
>   * @slot: hash lookup from mm to mm_slot
> @@ -2910,6 +2916,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>  	struct mm_struct *mm;
>  	struct vm_area_struct *vma;
>  	unsigned int progress_prev = cc->progress;
> +	unsigned int nr_vmas_batch = 0;
>
>  	lockdep_assert_held(&khugepaged_mm_lock);
>  	*result = SCAN_FAIL;
> @@ -2942,15 +2949,35 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>  	for_each_vma(vmi, vma) {
>  		unsigned long hstart, hend;
>
> +		/* Relieve mmap lock contention after walking a batch of VMAs. */
> +		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH(progress_max)) {
> +			nr_vmas_batch = 0;
> +			if (mmap_lock_is_contended(mm)) {
> +				mmap_read_unlock(mm);
> +				cond_resched();
> +				mmap_read_lock(mm);
> +				vma_iter_set(&vmi, mm_slot->address);
> +				continue;
> +			}
> +		}
> +
>  		cond_resched();
>  		if (unlikely(collapse_test_exit_or_disable(mm))) {
>  			cc->progress++;
>  			break;
>  		}
>  		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
> -			/* Unable to collapse, skip to the next candidate. */
> -			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> +			const unsigned long next =
> +				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> +
>  			cc->progress++;
> +			/* Check for overflow. */
> +			if (unlikely(next < vma->vm_end)) {

I think you want it to be like that.

			if (unlikely(next >= vma->vm_end)) {
					  ^^

> +				vma = NULL;
> +				break;
> +			}
> +			/* Unable to collapse, skip to the next candidate. */
> +			mm_slot->address = next;
>  			continue;
>  		}
>  		hstart = ALIGN(vma->vm_start, HPAGE_PMD_SIZE);
>
> --
> 2.56.0
>
>

--
Cheers,
Vernon

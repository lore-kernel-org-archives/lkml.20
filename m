Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915597;
	b=h4PaONmryS2nXjtco0JVAF639qR6NpFU1t6UdoYrvDOUCYODto1cab1+ne0JCzbAbXlz
	 4tp4N4Qe9LqG57/tITB0USQk/fDnLapD5MCZtFfL5fQt4LEFQsvdUlsR2jtH3vl/b4cqf
	 nNwDqEgR9QEReRVjgan/BYEshOSKiZQftncvtvo1u0W2SWNXDVsom+oClsdbgNdvzOpc8
	 iTPHH1qG3MPqp6E3Fi68hecL36Jnyqd/hWGRtwEg26PyXp42SriW+Ep1x0MltwbvlmeLK
	 PgXr6Rn6k3tFmWsBPYWCk8+XaH9WlkEaGuWSNdPwpKQgP1scueu2gKD86Wj9zq0e3+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ydingrYB6uW4rebn/QPgfSs9E1VGseZYnprZrlSzIHI=;
	b=sd2vgJFA4wZvwFALQB2kQn52UerApHF+iKHLkbpIDUTvTpKb6W34E+FLLtlWjOaGIrz3
	 nEQx2ufgyocs3o/fnVEMs5ZwW+f366s2KCHyfQ6oYXCcg63M7QI0Lwr8l1zc1ySevOkYG
	 Dao6w0Mkf4Bm6lIRJL4hk68c1syj6IXFPVkJEhYoI8F+dtaGMGTHb5I0BqaR6XuUEf/Zt
	 fiv6fHbqzPnMu1iQOmrAoMSbvT1+DrPvvoJ5PRl1U3Fc1BGtvxweHllu/5hMFyjx3yYZi
	 cAV2f+3oRWvd0eEJD/thWewZL97q/u/S9aqQh6hLOhY4Y5urB8uWttLvCF3CzGSqztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9S1fSUv;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231F606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4231F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9S1fSUv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so137535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793915596; x=1794520396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydingrYB6uW4rebn/QPgfSs9E1VGseZYnprZrlSzIHI=;
        b=Z9S1fSUvIRc3h4VJqyRCHNBtVBHQ4wHYKSDI/ZvWDSPmYw30deLUTCSosxLlgrkLuO
         imYgLSdby4iHxevIUSieExpDWlrVv5ABq3QocQY6MluqaKTZdMt811lZH6ScQTYZAUtl
         K3RczEQmzE7X4OTKPVBpLgj6+L2gSb/Etlo/cTDzdmA+frwzU0kcLr/jTuy+Kqfyyk04
         Rlk1GbE1RKZQ57BFgfTNZ9AG6BJqYY3yJYz6ScFwif90QCueaOUzyRzw1PqxL42wjfLY
         lWzwFqbOVavFQNe7QacUPWuqzjiZtr0bJUFd5wKQlj4HMFKpdK4RE36ITExb64/bBkg5
         EAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915596; x=1794520396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydingrYB6uW4rebn/QPgfSs9E1VGseZYnprZrlSzIHI=;
        b=uvy7TCT9ZcWB98E9ee9ZgGsTxnLZ8jgCR8vI2iMIzk0SnOPJM01zaDTSCGId4wkIs1
         M30CXunhJ8I3TUatdEFOHq5PRli69MaojXopqckB7CjKcv3BGXz8MlTNBDuGnWpXFVYi
         sEqyDKNIJsvZ8MQRBIwkXJYZN8HeTRS3zA6US+q0tZtt9vlJu1q6hXuBoKL6nkgmbbKt
         VHl01AvDcbWNOKzNvsfs5J6dAN6eci8d+L3V6o3eVki/lrFNTLsV4UGlRKDr5Epk5lZm
         0Aj/gW0hKajqVxVXLtL+sCYOi+nNj3XJJVTERkcT0xAsGREGi30mjqVA4VZ7eVcBoNP7
         bSSA==
X-Forwarded-Encrypted: i=1; AKwUvBwEZdmBmSsJDWOj1SiRI7p8f/r6rFNU+GjQ8tisOLL69zPuWtUYcW3V4arqpBQOmUxffTLaCm4drUsJzSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n+BwQLPFjKyCcqqgoIK8YBEzzmuc6Ji8vJ0bQgxqNNHXEUq3a
	J5zMcWqBpl3HNg+RKW6UBEbgWjU0DO6P1LKycLeGiLQEMYmSq3yzCiXk
X-Gm-Gg: AYBFou0l5c5VoGUZXHgIZMP3A6B3yCdtUGFK7Buzf4R0gilC4jqPccjda0xNH92ocGh
	3Cr+ffCCOwsG6RNxLluApyrQ7W/yc2BcEURxp2QnFTtBdTe5AA6Lw9zu0BOueFS3P7lMXYfOHqJ
	fF0jAhnuTmAWqDxuh4XejbbKiVFTVkBvGA5wUGwdFslO0X5zscrXlP2G4kpkeoxn1yhM4GvPe9I
	q08/lzKAcj7XITBudA20Ol3CKsGyaB+l9fH2kAfo8qDCUS0/+yXzv8RsHCes/zVgNDHV2w6Yt62
	cTslAgwQw16SnIGvWp4JbG0ikIcKFDcoScC5ItH/JU65h5cE/AAfZmQ2AVD3zn9M/3tM/DJeiH1
	LuPiCApMy/lGYvZSx9ikaWCCKMUASVsXlaN02mSECvssA5gqcQHe51iE/ujhXK7nMR1k2kGWCqM
	/qDAfkk9JCOtSQEcBMZKS8mqAXJmRDZMmZuPJP/qa7n44j27MHiF/XJgxEIGrHZinO8ex8U018U
	D2UYPK3b2EZa3r3wJ1XpP9Y6Zc7e5qvBToHvGopI/qCOoNaT6jXQs2tUXkP8TShrCB22Ms3bjr6
	B5xyU5LCTOwl5IZ3GxHPppL2
X-Received: by 2002:a05:600c:6992:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4b6df11da05mr6193785e9.22.1793915595572;
        Thu, 05 Nov 2026 13:53:15 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm5295235e9.2.2026.11.05.13.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:53:15 -0800 (PST)
Message-ID: <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com>
Date: Thu, 5 Nov 2026 22:53:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 9:57 PM, Lorenzo Stoakes (ARM) wrote:
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

with pages_to_scan below 4 the batch is 0, so under constant contention
we keep dropping the lock at the cursor and never scan anything, don't we?

-- 
cheers,
jose a. p-a

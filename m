Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3658408612
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443298; cv=none; b=ssCzrq54SoWf4lCKYHY/8Brrs7iIDuznlUHggTKV3Xto2J6N638Uz0O/iefhWM+TLn5WY39mfN3mm3dOwfvvRQJSOxrgDBS6dGVQrNUeNKaHIvPU+/ZZpKuah9turn9KYbAvMyZ/bTxiplPEDOVquX27n1iLttCl7cUSWb37QNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443298; c=relaxed/simple;
	bh=jr2y5YBeZ5xMRQ3tq+2uCrOfY3ZtO2MmYbhMK/cmHIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlMiJYNDD9l3G0fuyFfJmjvULLIgk+t4u+uZ0yMNimx2rCuBqc0DkUrGQl4Mn/9gE19omjK3tSalzyyVUV/Ef4S07HUVhigsQxoMu1/AJrXjC1vCMfyUbx3JPj1Pjq2+mKty+AwRRN+0o3PvlRF0JNiQJ8RGZ52W6LcAmute/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uux30GfJ; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uux30GfJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jr2y5YBeZ5xMRQ3tq+2uCrOfY3ZtO2MmYbhMK/cmHIc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789443293; v=1; x=1790048093;
 b=uux30GfJClPJRKn5Zqz/AVX7MbpASZSLRxusAOjz43LMFnhloqyfsqfULUBC8fn+vLbnJzj/
 2bKXfY27ab2+AQKC3qT08ri28fnQNWOrxceihiJPLx3QkrCZwB4+YezNPHI00m4BU+Dj4kosP37
 FwS0uXAKYzHZGk/un0pLvRD8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25793230337e1572;
	Tue, 15 Sep 2026 03:34:53 +0000
X-Mizu-Trace-ID: 25793230337e1572
X-Migadu-Flow: FLOW_OUT
Message-ID: <184d0913-7984-4d28-aaab-59642a1d344e@linux.dev>
Date: Tue, 15 Sep 2026 11:34:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 01/29] mm: rename pmd_to_softleaf_folio() to
 pmd_softleaf_to_folio()
To: Usama Arif <usama.arif@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com,
 linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, luizcap@redhat.com,
 kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-2-usama.arif@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260914122950.3283997-2-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/26 8:27 PM, Usama Arif wrote:
> pmd_to_softleaf_folio() reads as if it converted a PMD into a folio. What
> it does is decode the softleaf entry stored in the PMD and return the
> folio that entry references - the direction softleaf_to_folio() already
> spells out.
> 
> No functional change intended.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   include/linux/leafops.h | 4 ++--
>   mm/huge_memory.c        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index 4c1476ae32343..7c13c58a5e218 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -657,7 +657,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>   }
>   
>   /**
> - * pmd_to_softleaf_folio() - Convert the PMD entry to a folio.
> + * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
>    * @pmd: PMD entry.
>    *
>    * The PMD entry is expected to be a valid PMD softleaf entry.
> @@ -665,7 +665,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>    * Returns: the folio the softleaf entry references if this is a valid softleaf
>    * entry, otherwise NULL.
>    */
> -static inline struct folio *pmd_to_softleaf_folio(pmd_t pmd)
> +static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>   {
>   	const softleaf_t entry = softleaf_from_pmd(pmd);
>   
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 7140a1031fb2e..ee8d46827ffdc 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2518,7 +2518,7 @@ static struct folio *normal_or_softleaf_folio_pmd(struct vm_area_struct *vma,
>   
>   	if (!thp_migration_supported())
>   		WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> -	return pmd_to_softleaf_folio(pmdval);
> +	return pmd_softleaf_to_folio(pmdval);
>   }
>   
>   static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,


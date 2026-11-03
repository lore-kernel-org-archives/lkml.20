Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735318;
	b=neqBhkbMDNJ7CNiNiAMQSC/b0V4D7zydVvbfPOd7fBV4KLtvHvY1OfaypZGyccUZQbik
	 rvJzl4KHOvJIHoUUm7iSZOOJhYfuroMm7zRHf2CFnosCPWN0HHhN/ORNOLztwuLXOuK2r
	 5uXKoivkMTrttfVBqlS6C7o9ueAgZd+thcR/ZxFM09FVqafeW9sozGp/uhDXlhZKqX/ao
	 Xw9pTd65Hn7Sf1EuEortdmYnE7xEN3SUAl3FxTdutpoku8641rXf/+v9ZVoc94f2i7H91
	 U5jgaY99hS+RyaAJSKYyq21FsDo6qUV7xtrskUR8TO5DR+iVPOQ4ONgsnQEYJftQi6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mmIYdzsXtSLJ4H9TN4ODtrKjdEj6BTA0VO5FF1tJVsk=;
	b=G3cbO8axSmZJdfgR72Dpfwb7RLvWWsSX+lmE7mhS7MEcKL8S2edghQgcZ0DT5YUxRx2Q
	 274dMUhMkhFIAF2jpVJTbAttod+OKVTnOJdvbfS7HAwC+jAzv6XrOEwRM+UhICMSl8pQf
	 dE8x7BNbxh5wwoesUzlF/jvbJl5E/OBCOWRpQL3WrKOjDKNdS9JUw5Ez9NxdcmvSlvzqt
	 rb25P86VgqJQEoN1HFhiwIthX24qnoG16YP9wOl5Y509xYCTB/TA5H/9XHoxf5ZAN+xZ/
	 fkxUKsB2wppgXkrIPnCxSkr6M10OrPbDKjqHSwOskyqad8dv7PYZPcVV+zhAKSrD3Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=e4JNb9+o;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A7606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=e4JNb9+o
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc365db987so3096072137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793735317; x=1794340117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmIYdzsXtSLJ4H9TN4ODtrKjdEj6BTA0VO5FF1tJVsk=;
        b=e4JNb9+owrYIEwf1V23PHkD7rOBUZ+SuEEboYQT1ciknAHv/TyndPdXQfCcx7LlvL9
         cDmEaXae0raZNt9VS3Ua9HSkau4Qyq0DRZkUfqec+f7XkcdoGa+pBARVE3//x5oB0Zoa
         haCAYBZG2+2YMGFPT3xxic6dlwThz14Vx0h7RO05AHI4YRYdoYaa9FQodaHmVsrG+xAG
         BOD7OYMOnUeTKwQQ9WF8zkV6lqd7ahhVYcS3jg/FoT+rStMy3R5UmW3X5dJ74vEeO0Jp
         bYYH7AY30qmsBMSwTJo0BxOf6tqCLuUQVmzjkFgKvf1YYoCmYLy1jarKKT4vsAHqsavo
         Tz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735317; x=1794340117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmIYdzsXtSLJ4H9TN4ODtrKjdEj6BTA0VO5FF1tJVsk=;
        b=izUuJwlvBQanlSmUUuBs8ejw3hA+V/dLMZlbZWkTC20fD+TIigEiu8la93f4/SLDuu
         b3ef527qtSc99YENWgasb6O545Sf+j9qk8gz93OUvubMhyxc127kdWw3UvOD/WmfG96s
         +LekIAGclow3aRRvzUC38Fj8VbF0+u/NwpzZchmzLwjxbCInHSOjw/cnAwh/+Ghdi1eV
         Lkx5KXLnqm8GJeXZsDsjvyUqv9cK7Wu4Q9brecwIleyC82uHS/88tNSUQLZzas30274m
         eJ5WarhAP+bETsuIhlE5ciDzmOvC4+hYXbh1Y4qnlQcvZGoxPNL7YoyVCht3N2rbPTAp
         yklQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjv835Xx+YbSY9l48Esfm3RGOKfEZBMplQKZ7IkoA33L2qhBhJz8tg8U8uY4e8Ya99geWeQAz51/VATKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6v1E+Ia5nUQRBDYLabmTqubctbFbjwkQD5Nt7PSeJSjMA3WQv
	+DNby8RgDXooO6rDgOXMoaIz3NYj99rbqEBeyfxLk1fzftpNmSjZel7tt2gkKWgYFlk=
X-Gm-Gg: AYBFou3Vyb0HvqtizeH5uqDcRV4BrWzFnp9iTiMHF9rImAbxmj+xy9Z7cieh3KMagE6
	gvZ/qJZUgXSgFmIXdN02OS08/1GNgIDaBd0c91l+HV0y9eGXs15XKzuXGHey+Xyl/U/Aaf//QE6
	jBBJhuChncMVsFV8cAEnjEBJiFWO1oTxdXsKis70NyT7xFlxqZX/aHzLamLJa4PlczPLUQPXPGX
	0MChjcgJ1I5GdxRke7VTJqSojBE+EYswyuFnWY/tKnhZ0NEF7iCKQxt2XIoSdcw5w94Xzb5TnPL
	NmOsz7s22+zcdrspg5tj0NfnUrGnZQFSxDHOhJEZiI9xspfrzg/cWOpJUvbfwQ2gkTxxpwkh9tb
	cJwelT8ZN7sy1JcyM3cfzRalk8WRmWSkSS9LFLxDYi88PdTGuLDQZD6K5EH/OkobDqNgcGm1tiN
	sVqISO9ZNJU6bAeveZx4Y4bpxUemg6K/zpFjwxhehMeR47u1pPUlqVDsMGJtHGK8y53SE2kZUuN
	TtL3vtM+bg/YA8cq0pIoAtXg4lllqjqSGRmRLBiBIUqc+AngvQMfNeU7g6kIODI8Z5d21TStzIr
	gU/wFEahBv1eAPhc2s/+Fgm/qrVb2W5UTRm/XsNN5+nPawAH1udJS1yPlAt2bUx0Wf7/Qb7oenN
	13X/Clx5r27qEBwprJ3wLWGHweSExm/I=
X-Received: by 2002:a05:6102:549f:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d072735c70mr6239243137.30.1793735317321;
        Tue, 03 Nov 2026 11:48:37 -0800 (PST)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9c906fcsm51783241.11.2026.11.03.11.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:48:36 -0800 (PST)
Date: Tue, 3 Nov 2026 14:48:36 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
Message-ID: <auo3PzmisfK3br1l@google.com>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
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
In-Reply-To: <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>

On 11-03 13:49, Mike Rapoport (Microsoft) wrote:
> The lowmem and the global bootmem areas can have zero size, for example
> when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> either of those areas is explicitly set to zero with kho_bootmem=.
> 
> For a zero-sized allocation memblock returns an address without reserving
> anything, and that empty area is recorded in kho_bootmem. If there is no
> memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> fails and KHO gets disabled.
> 
> Extract a helper that checks for zero size and allocates memory from
> memblock, and use it to skip empty areas the same way as empty per-node
> areas are skipped.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 61 ++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 32 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe31819..f268c57413a7e 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -820,6 +820,27 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>  	return false;
>  }
>  
> +static int __init kho_reserve_bootmem_area(int *idx, phys_addr_t size,
> +					   phys_addr_t end, int nid)
> +{
> +	phys_addr_t addr;
> +	int i = *idx;
> +
> +	if (!size)
> +		return 0;
> +
> +	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
> +					nid, true);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	kho_bootmem[i].addr = addr;
> +	kho_bootmem[i].size = size;
> +	*idx = i + 1;
> +
> +	return 0;
> +}
> +
>  /**
>   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
>   *
> @@ -832,7 +853,7 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>  static void __init kho_reserve_bootmem(void)
>  {
>  	int nid, i = 0, max_nr_bootmem;
> -	phys_addr_t addr, size;
> +	phys_addr_t size;
>  
>  	if (!kho_enable)
>  		return;
> @@ -852,56 +873,32 @@ static void __init kho_reserve_bootmem(void)
>  	 * reserve bootmem area in low memory for lowmem allocations in the
>  	 * next kernel
>  	 */
> -	size = bootmem_size_lowmem;
> -	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
> -					 ARCH_LOW_ADDRESS_LIMIT);
> -	if (!addr) {
> +	if (kho_reserve_bootmem_area(&i, bootmem_size_lowmem,
> +				     ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE)) {
>  		pr_err("Failed to reserve lowmem bootmem\n");

You are adding a helper that returns an error code and then ignoring it 
at all call sites. Even though it can only return -ENOMEM right now, 
dropping the return value is not good practice.

Either capture and print the error in pr_err(), or even better have 
kho_reserve_bootmem_area() return bool and move the pr_err() 
inside it, using nid != NUMA_NO_NODE for per-node areas and a name 
argument for "lowmem"/"global".

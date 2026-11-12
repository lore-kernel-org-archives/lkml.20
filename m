Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472719;
	b=VpZS/TpUEmCoorCGRpetn7yR/DBgg/K0mqqxDhmTFdXvxCBS9E62FfF+XYmKuImFjvWD
	 jn2yKrsVhXCS27jUwuC90au+u1Zor+gjIEzYPQ+6NWkvM+h9accZjeIgc0Vizy2hy+a25
	 6BoM/EOIHuxEshrFviYwfkWwLYS1UxqwE5AykjdjpcCQNN75oWlATnNfTLOtGRw1VGDmi
	 26zZ+H9gUSde0fEBYqpgQmkOmUp7WtX7s4VAwJ14f/Vgj0Wg58wnzUFdbizvTuC7HcinO
	 SxSbUGRplbZLCXTM2pOLpy6LZulTw6ZFEhXvpsozxZnmC4DRtLqQ6pX6JzI/iSy+z7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dvTW0HYPuDs0zvfRlKwp5jFkeDKeUCmm+3AkWFYGUPc=;
	b=Uyi8DHfdsZRyoyoi5meZ3OcZkCJtDhN0VrSeuEuKoFVVP666cwdLniozl7NQaey81HwG
	 ELWWp5BQVH0dIJuJCKM+zjMMfKfTJbgQyIM6yv/BcXvLCb/CZAZJqT4m6QujgxjLfT1K3
	 9V8+RzOHdHXlULhiEvBVQNzniVE6BcE2i8eh1QO2sBCkzskrqx1sBP5ys637uG+n14cFC
	 lscxO3fK7zGYMaYvfDc36Kz921qeqzJY2CVMZVyJr4hj7l48aKFRjckl/UQr9dN2187kH
	 DGxdjXnwIoLiQuvQqhmNIVoTFNV1sHEOLwA2cuGZnVXnTRFAbzgc6Ouu+m2Qc4C8mtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lsBV7ql1;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2F0606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2F0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lsBV7ql1
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso1524547a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472718; x=1795077518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvTW0HYPuDs0zvfRlKwp5jFkeDKeUCmm+3AkWFYGUPc=;
        b=lsBV7ql1n0dCE2h8c0NkPG41Gu1R9GylPG5seCstfGAGl783cHDW+zZf30utOij1r1
         w5c17Y1FMzPebPW/TEctmTXtmSuAfsweVrkFf1WgMX/vh23+GfdrMybvwOYngGpYHuCs
         0achl4yGpsWJsUv7eSb4Lssiz/163tWdnGs1QWioqehR6NcI0vUzAWznNHRpHlL9gmWP
         XRATI/0/lw3+SG9hKnZI4YyIg9sRu1noRx+BWiVcgjt1I/y6kN3QN4ioBlPCr36F14k4
         9z75JIUpKLKU+gUknfnAe4m54agtVDRmIJ6rLUkakliyyfm0CYCWg2FWgDV5jgm00hZZ
         TgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472718; x=1795077518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvTW0HYPuDs0zvfRlKwp5jFkeDKeUCmm+3AkWFYGUPc=;
        b=eSnLDQL3qylHldUwO/A7BnNAZakreOEFUWzF4zbkn0yAMboviFjE7bEpmL/kcZmbwv
         wji0cpThB0P7sy5roB8G2ZwCZBM85yipPUv/iMXRMtlJG9w4BeVE/gzl2JgQfHjRGequ
         unR6D6NfVuMtF03MwowfIecgNmspCxZkzIzqo65yBz7NZ/OxMCxFQuPmJ2kt2ujviAOq
         kilj60U2qLxB7QtgcxrkbU78+XZ8RKR49YzWl9/whEAJ9BOgAGHz957o61kMAZ6cCFat
         ZxMPPuq6BaK3H0gzZXu0QksmFZ91kYU8LX3+s23Oo+l/SjbHK8ZhCKzug89aISB/UnpI
         pyng==
X-Forwarded-Encrypted: i=1; AL+hErFNMnpklqRNtEFa+9jw+BypPts9voV03ZkLVpDb2V0mH44nnOnuBVhtqv+5KASU+bfvrVuK5SpkF42arz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7sDab+sNBCFh16cfD0xMPPC3QzqumuThHiiXpY5IDOAsDngLF
	As3n808Y5v8nKV8ehaF6XhvimmZ7IAWw0tt2TcIeQ9ekrLlAsrjKPsro
X-Gm-Gg: AYBFou2pzJ90fkh3yrKoqBp+Vyo64C1KTt/OLm/+8NwZVbxOl7FQ2iBReA8NquEwMvF
	cKXU/W9RJbj4/YUbDr28lapJhHdBxDrMiTOqtqg2u4ZOhGdplYRFBF83KJvKDas986RO1ah772B
	F8vouMa1J6PbkaCdbg5o64+nYLw26J+n6MEPUm8ar182yVsZzvwhQEabasHJC8FYglgNrxShLAB
	7WmPRH2ptq8sXaFyHuSFmYGEQgdQtvr2odRp9QUC0bCyEtRlb9w5FQwJiw7R/byl1XoS0ZUyMvE
	BztZ8IOcTAIJROzBoBTbAM8xpEDREyM8//iNs6N+kGDMrZoRVS8EnAbJXLEnLeFlaccJStkAQa9
	uIlIvbTSipQhbrWUNTS9x8TZIWKICXnuZq35UQH61+a/JFkfVmgZyOR36A02Ua2HpVzDNefduCe
	TuHNF++Pq81ix/vTc1YtMeZSnxRK6Tw0IpuxlujYt7GXs/UWWiilV4DKPAMZrQv8Ik370HC7j7D
	Pt+XDxEQpbd3n26el4rJogwCo2SIYxIHkqFhHmibICT8S3dVFE9+LQ+qlKbrFmne90AlzAPpPX4
	HVgfm/8K7rqdQ1vxCck095sEcQ3MYKF2TGEwKp/GbyhJ7MU6M2EqYj2PHw0IF8jAAdm8djrvuw=
	=
X-Received: by 2002:a17:90b:1d0b:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b182fb601fmr3766750a91.58.1794472718076;
        Thu, 12 Nov 2026 00:38:38 -0800 (PST)
Received: from KASONG-MC4 ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8ab32sm3786590a91.13.2026.11.12.00.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:38:37 -0800 (PST)
Date: Thu, 12 Nov 2026 16:38:20 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest
 generation
Message-ID: <avV52J2rD19cjM2J@KASONG-MC4>
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
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
In-Reply-To: <20261112081928.3014946-1-ridong.chen@linux.dev>

On Thu, Nov 12, 2026 at 04:19:28PM +0800, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> folio_deactivate() is used by MADV_COLD and DAMOS_LRU_DEPRIO to move a
> folio towards eviction. lru_deactivate() does that by deleting the folio
> from its LRU list, clearing PG_active and PG_referenced, and adding it
> back with lruvec_add_folio().
> 
> With MGLRU, lru_gen_folio_seq() places a swap-backed folio that is not
> in the swap cache, i.e. an anon or shmem folio, into max_seq - 1,
> regardless of its refs. That generation is active per
> lru_gen_is_active(), so such a folio never reaches an inactive
> generation, and a folio that has aged into min_seq + 1 is moved to a
> younger generation instead. PGDEACTIVATE is still counted. Other folios
> are not affected: with their refs cleared they are placed into the
> oldest generation.
> 
> On a 4-generation memcg, 64MB of aged anon memory in min_seq + 1 ends up
> in max_seq - 1 after MADV_COLD, while 64MB of file memory in the same
> generation ends up in min_seq.
> 
> As a result, MADV_COLD can make anon memory less likely to be reclaimed.
> It can be reproduced with a single process in a memcg with swap enabled:
> 
>   1) map two 64MB anon regions A and B and fault them in, A first;
>   2) age the memcg twice through /sys/kernel/debug/lru_gen, so that both
>      regions are in the same generation, min_seq + 1;
>   3) apply MADV_COLD to B only, A is the control;
>   4) reclaim the size of one region from anon only:
>      echo "64M swappiness=max" > memory.reclaim;
>   5) count the swapped out pages of A and B from /proc/self/pagemap.
> 
> B is expected to be swapped out instead of A. Three runs on mm-new:
> 
>                      A swapped out        B (MADV_COLD) swapped out
>   before             16384 pages          15 ~ 128 pages
>   after              0 ~ 157 pages        16384 pages
> 
> Use lruvec_add_folio_tail() for MGLRU, which treats the folio as
> reclaiming and adds it to the tail of the oldest generation, the same
> place lru_deactivate_file() puts a clean file folio. The other folios,
> which were added to the head of the oldest generation, are now added to
> its tail as well, so they are reclaimed first as MADV_COLD intends.
> 
> Fixes: 081488051d28 ("mm/mglru: fix underprotected page cache")
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---

...

> 
>  mm/folio.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/folio.c b/mm/folio.c
> index ea3adb6a89d7..c412d9b398e4 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec, struct folio *folio)
>  	lruvec_del_folio(lruvec, folio);
>  	folio_clear_active(folio);
>  	folio_clear_referenced(folio);
> -	lruvec_add_folio(lruvec, folio);
> +	/*
> +	 * For MGLRU, lruvec_add_folio() places anon folios that are not in
> +	 * the swap cache into the second youngest generation, which is an
> +	 * active one. Add the folio to the oldest generation instead, like
> +	 * lru_deactivate_file() does for clean folios.
> +	 */
> +	if (lru_gen_enabled())
> +		lruvec_add_folio_tail(lruvec, folio);
> +	else
> +		lruvec_add_folio(lruvec, folio);

Hi Ridong,

One question here, why MGLRU/CLRU have to use two different ways to
add the folio back?  Will this cause over aggressive reclaim of the
folio?

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634898;
	b=B/zWO+b8FvxBxOu/NEviWALWmDlm3EeERavpE9nwF1lLffmcANq9G1iOHgoPn+xvr/nP
	 OKZ7j2hgkyoJNzJHGIsg4PdCIEenzxprLEB6MjrEFidY1Y+2N+Wj6xUSJgzsSeBF/VOUK
	 DSABqqz00vjMcK7u64mKscIDiMbU6bYKO+gvCqqLRNFiSEzRE4CMknqU1hTQz/ajsaB1o
	 7vledCQc6flRyPL8dz/t1B8xz71B2OrJ9XjAYE0i8NA/nSyIW8blGPCQx/4MjEgdHAF8S
	 WP6C62HdiSNqDso5hUsSLFySmsyhTl4+LYcjSzz8mmSJk1YEzG+hpRNC46UwxaD/Z6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=28knMo2Wj7+Tn329XmbrSNL2GjeVASRAZu/1W0UCdF0=;
	b=RzGNIrvvtXJl/9TJocT87371RvDbkFzcDo+el7vS0pjuTO6fig+a86MuKmXg8jGO27X5
	 jzC+pilAIWhZP34mCGijM+xAuxbk/e4JLlT5KQaU+ZOcNZb23L6pkBBYVUpo0WNz6Opn+
	 oBAcqnOFls628RQWtIAFFeXxTvLNh9tp/p5ZNHT5SaiCT5POuBil4qvzrxcsBFL+8XrDK
	 BXvgKb8/UT3NkaIYCMsYckTsPCdEjv42XkCC7TLgLoFqFHLibHAcyayPurhCt4yMBUOz5
	 sxav3UIs95FQ/lzarsU8WzAowaDxKP21aZUpHaa9MI5mv+jpwK71VMjk2E4lCUkemyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWyc8It6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BC607B47D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7BC607B47D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWyc8It6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20474415e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634897; cv=none;
        d=google.com; s=arc-20260327;
        b=Daj6PwsoY8DT5pVKr8l9MO5yqRMFJBB8N+BMeZuE5HgSYONgt1dDmf2kNWUbAPNNgP
         kO3H4LjBrGY0LX1NHUr83ggbEjHzmqvDVBcgDXf5xqKfSTtMJlwxjzyR/AFb8S85z2eC
         oD4Mu5U3S5zDU4P1gM/LQdDrG6YRvtKYoi/A7dIAGj4mz/Gk9XmpVw1vrOAv2FIxuaK6
         67y7mDGRjHTPV3wSJD+K7k1tfoeZkfnbRsLbUYO6gUE2YX7d5XJxiD59RhQSUWsrGDy0
         Wf9C6YGKA/lv8fZfwXjVoHInptWN+hIFAZrvTidJ0xQFb32ncN8png2C9CvDB7YHc069
         nvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28knMo2Wj7+Tn329XmbrSNL2GjeVASRAZu/1W0UCdF0=;
        fh=kr6F+Ba1AM7sJE94Z9KEN9YtZKPwpFbYxR70JeXIGFU=;
        b=TMoW5/5s+CGdyOleAMlSo1iaEzrOnbATBhRXopKllAMKodrcjfKsVrxeNwqXBcZKJE
         caYvXaZxx1Gb/E8tP30zQl1ejGTw4YhXmLicKnhic5iydprAbSxLaLOBf9L9iS4n6nAO
         xdM6UCVRBoCdrnu1H9Q12pN1JBgWCmHpWSXuRm2cE/aAmQ6PtXl1zv+kqlU6BU+jwKRW
         ga5T2e9DBUCROTVNfD1QYOUrf1cbOEF3BOKpZgkilGOphHELqYM04aGtWWMRgQSADiEo
         zhTV34fTWTf5KgMu4qBHmBjjQXrktLRSb0oXqAa8k8koR/vWoby2likRAr++5Ei66Gib
         FvCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634897; x=1794239697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=28knMo2Wj7+Tn329XmbrSNL2GjeVASRAZu/1W0UCdF0=;
        b=CWyc8It6GIUe1s4FpTNBONkhPIvqgTDeu1OpsjLzLEC1K8Av/JYOj8kjhdHwZbrsFf
         BSuu4jVmW4n18mII+zgyU9+vPpOmfy2LoqQUmxKMDlzhe13yR04H4M0mkWNbM5rjf880
         mEarg8EYta6vRrL2/NyTAdBAfUHWmHj9NepPoSRfOJm2wemQfOqf0DSomMcWz6rS44wP
         dl91Wam0H7ZmHAqIVuX3pOoQGv5mjeoMw1e0C+zhPrm2VGNT7QNeeGrruUfb3kMjUxuw
         7NIi7roCBgeUC9wqRSszhYVlJDLQVNrh5hHZ94ld6G9M7qlQ/87d1uKzl5SdtcJtTYHL
         VZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634897; x=1794239697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28knMo2Wj7+Tn329XmbrSNL2GjeVASRAZu/1W0UCdF0=;
        b=m1nYHWcG3QZ6+v+FOwUJ/G20RPWyFE2sRl1JCYvwsNiOhyRSZFg71xgJCdW0lE0XCs
         XZvkZrXUTjhRyudbn40YWNQIPeSavlNXuUEYXP57bdHEBvkzhbl0Oi6FZMtV5NaOq/DV
         3ezz1dWkmBta2fdkf/RZImy+PPPHphaehVKNsQYeXsDkEwgjeWt2CXq844Fiwk6KGyHu
         iq4jda/fLuidaZGc4m4762ZyiafZWW+fF+0QBY0EPmBcTq3mNQBkFjkFp7OWXGk6/mXw
         VpW5qJ3DDXQyAhBPjCYyQEzmJy5XkpzkasYixFV4xhW/JX0oHpgarV3SYRAH2MrWp4Tv
         oeaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPGkv4Hu8Iv9Ecly15NK5yD5VS3595y8V/yDiQWMLxANq13Osm+Won8ootW/2bIwe3gD7rXkcTdlmgahw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwQbc7UyH13h4ZNKou8olTmyjxaEw/1Cddxya2DIOSZC2O1p3e
	KB+6uyDqnlONNMU9XdehGK1G74aPcMhYfFMstMPAFoE8NzE21RqSNeXY7uvls6518vTerHECqCI
	3UBfWQrbi6Ctssk+2/84Ks0MSPB08MdU=
X-Gm-Gg: AYBFou15uXuShZICmpriC2qQM2mZrP1seKxTASf1DK5btROSl4Db9EDWK9k1TWO4FTi
	2ENapohxusITrfVGKYmxuWa2W1H2CuUvq518sE3V1kmo2xbt53X+ounqVTvQHrvm5e8SH4ILOXm
	wztXtpt21sEWgaCgHaCbWQVQy+vnIFbDvmfsqgtFRgaZkwb1VCSBCxHWxn0mPkxKHJU15Qb2Zj8
	pMlJsx09RtV7cbcJZGNl9vHjWE+OakU87OqSI+sQBdLjstgWHqIAz9pEBNeO0W0hIB7/XL3Eozk
	ImrLnMYIGj2DhYqXn/piP55xEejHz4Abttqsm2LLIl05dn9w4qO3jLzVnDkldF/FpoQEZIa6m5p
	lPf/fmxZkDrzY79umHhyUWgi7GReF6D6LGB6RiNhXy9PpWko9ZPAb5MKbPuwORbAu1M6ozIwKoQ
	BQD4ObhvZQ+r9AUxv/CsHLzEN1V7KF+Ju4QgoRCfaAzSekKTIa6BeR
X-Received: by 2002:a05:600c:628d:b0:4a2:1a:a128 with SMTP id
 5b1f17b1804b1-4ac17d19b68mr233026445e9.19.1793634896692; Mon, 02 Nov 2026
 07:54:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102144835.304017-1-alex@ghiti.fr>
In-Reply-To: <20261102144835.304017-1-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 2 Nov 2026 08:54:44 -0700
X-Gm-Features: AclHuK9VGAGEYt8i3X82mNf0XeGwG-aeAsfLvH9z2F83pQYMolBUNoambfzcprU
Message-ID: <CAKEwX=PQ4_AuOJR3gVMLkUBC4qe+sc5dUEkhXCA4QFn-BSZS7w@mail.gmail.com>
Subject: Re: [PATCH v4] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry@kernel.org, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:48=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.
>
> zswap is the same kind of in-memory, synchronous backend as zram, not a
> swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> swapin_readahead().
>
> Here are the results from bypassing readahead for zswap too: it was
> measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shrink=
er
> off, on Sapphire Rapids and 3 iterations.
>
>   768M memcg (sustained swap thrash):
>     metric                 mm-new    + bypass    delta
>     build time (s)          405.0       341.7    -15.6%
>     zswap-in (GB)            79.5        53.0     -33%
>     zswap-out (GB)          144.8       115.6     -20%
>     swap readahead (pages)  6.79M       0.45M     -93%
>     swap_ra hit (%)          72.1        89.9     +18pp
>
>   1G memcg (light pressure, build not memory-bound):
>     metric                 mm-new    + bypass    delta
>     build time (s)          177.7       176.0    ~same (no regression)
>     zswap-in (GB)            10.2         7.5     -26%
>     zswap-out (GB)           27.7        25.1      -9%
>     swap readahead (pages)  1.07M       0.08M     -93%
>     swap_ra hit (%)          68.6        87.2     +19pp
>
> Similar gains were observed on an AMD EPYC 7D13 host.
>
> All the results above use the default page-cluster=3D3 and
> vma_ra_enabled=3Dtrue. Setting page-cluster to 0 gives the same gain on a
> zswap-only system, but page-cluster is global: it also disables readahead
> for the asynchronous swap backends that other tenants of the same host
> may use.
>
> The gain is from no longer prefetching pages that are pointless for an
> in-memory backend: readahead inflates anon residency and thrashes the
> page cache (file pages get evicted and re-read), lengthens each fault by
> synchronously (de)compressing a cluster of neighbours, and adds
> compression traffic when those extra pages are reclaimed.
>
> Bypassing swap readahead for zswap therefore makes sense.
>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Acked-by: Yosry Ahmed <yosry@kernel.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>

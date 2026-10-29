Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301478;
	b=5rJ5/D0Igq7H5lD0nIXzMwc4I1pEjft9Hm1f0rlekkFzxUOpW9mBr6DxOJNSIsdXywAX
	 oVvOSwv1tz9aAJ4aJh8SsZnjIAVB7xPIbDSwdJra4A41PDyz3yj+VQWC/7jdwkdU5Eesd
	 r+fySamtGEu4VxL8YxN6kqyd5RObqy25ONJzwDDi6tgO3Iny/tpRCiR8Fc2djVytulCOF
	 N0XcvHGho4xzNLTdPBd2khRkELLdn9jFMUeeV951h3L5sNY9GAbVjqJUYtF4Sbtb/7rvY
	 ILlCwEHsbQrkOJ6oYPbbkXxkejQwizFTeJrTnV9VYRFvNtL5w2AgmHfJQ3aWyE6uAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/ulCvwB2xwRabyK+mOG5zQB868mEQ7a193kjvrG/0Sg=;
	b=cdrGJkRqH5M8YGtI/t24nBvqWcRMycs5DkX6+AeaAh6WnLRpWZ2jEVkjPM9tDkZLOf1v
	 yNOjskWQwaUGBfWx9LD6YzgjRWMiX/inqKEdyqhR/P8eERHc8cYkHWw9AgUOPUvKHYqJF
	 0i55/bt3hh/eJv2l40Xc87cubLBEDa7meawtULQe1vtrAB1QW7XGgYQpStD8H8bG5SSBu
	 WBlXVFG5ClF/pxUMG51LhssAM0NGphrXb9M13LhI4ennlNLczCj8dTnxC16QhfeQzPeoa
	 XqLHkf3RZ+6IHhRjcitfwyZtKDJOaTPbkVmNBsFfjxSGrctvsNo70gfUHT46TLW2MNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=gBMaCZnf;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=gBMaCZnf
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798af41644so2051763d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793301476; x=1793906276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ulCvwB2xwRabyK+mOG5zQB868mEQ7a193kjvrG/0Sg=;
        b=gBMaCZnfEHzvdpxRC3G99RRCV1PII4S9DLB8gXI+TdO7z/ALvtzOGCkM3K7FGycc4P
         qB5oGn/6a9lIM4CFK9Dlq3PNcpINRq7KT/Rdvd0AsXW/TzJYsZZjwV1I7HGmn0SEecgF
         prDhrXvBNk02mgv4ZlSJ3vVtfSriJ2hqIaGiKYCAtm67bU8dkg5+x89EvuP5rNSQeavh
         llpzyFB9cQOAWMr7Q7ipO9/vGBpXxAuFxDPkUzCWublErrjtg+P1d84CkDiRWPPcUPDT
         OVqBoLD2+jw23OWyaog1gNH/0LIFr+RsdIcuw+lHkmzxVASAqu79nnqPWHAarLFVVIr2
         Rwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301476; x=1793906276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulCvwB2xwRabyK+mOG5zQB868mEQ7a193kjvrG/0Sg=;
        b=Bu+NfMl9zF3ihjy1s5irE4fcht4JWcyPw47+STiy6ccPMfr1EMB8F3LjTgOWFLPIUy
         ZV6puiKYvmRqz7x32ki3D190Q7mNL/rPKajr3YeLvSg4ejUinu9pWc7lYUuZyQzZ5vQh
         E+W9v8aGcjijmUoTmHa8wUfkEX0SDr5a3mm1W0FaCQBO2H5Gy7x6ztlRH4yTmTf2ySrU
         bgMav0JK09RuWH5iyLCu5+WLCFkYZhM0AAPgTVIOhr9Ntkhp6w5IT2y6sFmpooHaYEO9
         GLc5GN1ymEOUQmqHqn2QMYoAYq4TLKA8/Vs7U+IA+RXeEmxw0WvI+9PsegfIsDGDVnNa
         vPgA==
X-Forwarded-Encrypted: i=1; AKwUvBwyb9+wnXAiWzeF5bk9fenIikcakvQ/6RIaCoVOuEArIZo0fwACmAHC50d1bJDUUhie1F1sEIKrDONpPsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuCkPZEAxFjbD4B1v/W+wCIDgpFHKUxdwBS3WzJdbM0Qz1QoRw
	psVp32JLJD41w03SPEvJ45KS4z96vdII2ji9JudePtrFh3JrhQnf4Q60Sc52zNKzB9I=
X-Gm-Gg: AYBFou00B1/xy4/qeuSBOf+SIyX0lXOTezGZFltl9Fr2YRRv+VsVyr5dg9K7w8vCMuq
	Yt1/wYgNMcRp7/KybxgwB0lBS3xagAHEM0yrAxFfN9Y/E1IEhgLubVJ/CrzTCzckQQXtuLvZHfj
	mwVbhO5efj6uzHkuve4seU6NzL8bZJ9uv2udFCIdGR+Rc6swnY0o0N+J/tYmLaRQbISMTiJLZ8V
	9xgR04hC+sLoHr0wGCCjX0KIPY9xh8c/8C550YEQzR0SinDQ4XAQpD9dJyklEXBA/q2iyc4hpx0
	I/IvQ6UfnFcEfgAaJgV6tiT23gOmeKgomODwbpzGijnttYi0b1szDp4iA+S3QsZsuI7ELSIKkL4
	uOyKzUGH/VF9d3aZ0Ti0ECNE9QInsmpCUPehiuZ5IxTb+KPPcIRHLxHmbpl9bKHxsyiJp7addE6
	M9bAGJC30xs++87+N1ZHaFtG83bKLP387e5aMgOGL533MwRyM46vBHliquBPUrI4hYtlWJP8u6n
	acmkm2J4u+hc6fJb+8w39AeoBohXJr5+O/IqaTspfeC252ZgENGoc7f2uwta0keujbtkcipEBRR
	wO8d5TBWGE+8DyJcre4YG0IXABvY
X-Received: by 2002:a53:b193:0:b0:677:cdbf:41ad with SMTP id 956f58d0204a3-67ba4c90d54mr59919d50.12.1793301476120;
        Thu, 29 Oct 2026 12:17:56 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba3a2552fsm148947d50.17.2026.10.29.12.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:17:54 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:17:54 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/zswap: drop the stale zswap entry of a zero folio
Message-ID: <auOb4tvXoDbsx4jz@cmpxchg.org>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-1-73f73a59f2fc@tencent.com>
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
In-Reply-To: <20261030-swap-fixes-v1-1-73f73a59f2fc@tencent.com>

On Fri, Oct 30, 2026 at 02:31:41AM +0800, Kairui Song via B4 Relay wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> A folio can stay in the swap cache after zswap_store() has stored it,
> when a swapin fault gets a reference on it before reclaim can remove it.
> do_swap_page() maps an exclusive folio writable and, for a read fault,
> keeps it in the swap cache, so it can be modified and swapped out again
> to the same slot. zswap_store() handles this, it replaces the old entry,
> or drops it if the store fails or zswap got disabled, "otherwise,
> writeback could overwrite the new data in the swapfile".
> 
> swap_writeout() does not get as far as zswap_store() if the folio is
> zero-filled now. It only sets the zero flag of the slot, and the zswap
> entry with the previous contents stays in the tree and on the LRU:
> 
>   reclaim            fault              zswap shrinker
>   zswap_store(D1)
>                      swap cache hit,
>                      map, write zeroes
>   swap_writeout()
>     zero flag set
>   folio reclaimed
>                                         zswap_writeback_entry()
>                                           swap_cache_alloc_folio()
>                                           decompress D1, uptodate
>                      swap cache hit:
>                      maps D1
> 
> Swapin looks at the zero flag first, but only when it has to read the
> folio. The folio that zswap writeback leaves in the swap cache is up to
> date as far as anybody can tell, so the process gets its old data back
> instead of the zeroes it has written, until that folio is reclaimed.
> 
> Invalidate the zswap entries in the zero-filled case as well. The folio
> is locked and in the swap cache, which keeps zswap writeback away.
> 
> Fixes: 0ca0c24e3211 ("mm: store zero pages to be swapped out in a bitmap")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> [kasong@tencent.com: fix zswap_invalidate() arguments]
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

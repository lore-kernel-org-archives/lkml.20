Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688504;
	b=Vivj2wA90pnK2dVIZOGbZxWj/hASeXIiByzODmc3qpEn3iLkQcFWAudC8zYi6q7suwhb
	 FOBMnCbIlac/v29Xqz217Jrd2y2hP6IPmqIeXJTUEfWOuNag2h4mMjy2AbKfPnOjmtJSn
	 xxYG9yVMIOV09SpZAT0pANgy7/ntqk7nQcWp8xDLEKeLGXbcjUaWXK5gkzZ9g8+yYRreN
	 2cZaJqxbe3FM/mofa69Tw+9OkkdJAR1xB8AiRzkUvrVJS7Vzt9LUMTI6qxCudyiykhUtV
	 fQ3HoWv+xL5JwfJUGH8JIxK+nPJIuu7g+kjyHIhE3f2kiqxAlLfIcEiqADiRg0PVK0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RT/hDzEuwThvLNevH0thxyzvch5KgmlhrTj6s7q01rE=;
	b=m2tpAaGzqFatVJxX9A7NdbskOsdLkR50D5+NA8MKMrect+Cn5ZulUo8gKmx1SLrJSVfM
	 Z6yXsgHJNhqG0tuzt9DZxTvK0/MMyM5DtqPgjgiORirFA57953jZFsjNDNu13q9x3skQj
	 ZQjIyH6u/9vnR6Jhb+dJBn3u9Bj9O/Iu4uW4mCuPfrQqaVPY8K9w6jyYT98F6ZB/StF/O
	 4ERCfd4n5a5oe1i+ED7mF7KfPxmxxUN/e86I77HmKdURUgt8TwaqFzoNAOaF/vomPXNa0
	 uJ73YzDELaWlbd1E/pj13bhomDnv/5Y6YIcPFfw1VdjWBU4t+IMLweFYySmznuWehvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=kvLD+A7b;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EBD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=kvLD+A7b
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0f59a5fdeso614367b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792688502; x=1793293302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RT/hDzEuwThvLNevH0thxyzvch5KgmlhrTj6s7q01rE=;
        b=kvLD+A7bzrUjvZtW2kCh0gYTLZoGZlevKNQ3Oyblayvom6zXhbpX3UCcMe8LvYXkYj
         PcfgYNw2OgYJvSlYrq2EkCxCLxAMpzGQ77acA4S/gi/DPITHzSlhR9DrA+xFgPBjvRj1
         RWmZ3MeK0krhsW6Chd0fwYDRVWqNLUpcdXkzuIOlwJ8pwzzpBV7Qfv1Kat2rud6wfMlK
         u+QPlmyI87GLSeYKLgokU2FYvnOEBwClPK273Z/UkCB+/Y0DLT3AQUIjNwEQ+DjJGeTx
         MERGO34k0vE29apd+ASqtSDZ+P5d6Okm+9cFPHYTvYUfs6zVm5kCbg/ZisFnsaKJJnVL
         pxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688502; x=1793293302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RT/hDzEuwThvLNevH0thxyzvch5KgmlhrTj6s7q01rE=;
        b=qbXvFBOw4BI9yZoG3QEXUdcyquJ1Py2OGf2MvtOEbtYeu1aPg+GHrVEN4XhpkAIAdq
         +zX0wtVbrLdr1UqMXDoweVw9ONqYEjWdOqwX3+sG/3OKFQ6sEHQr1byDSuQpmxeY+vuF
         PYqK5vznIY3FS6VfHg8sTCyyXbOHb4ya8UDFT1Jtk9Hs6ILb3/F64WdASZ1Wnoazh3Fh
         H3AaHeKYqZkWWFTmSesMJQ9znF9ptFT9gcun0BtbRX+th7067mf4b6T3+HbHFBiuAWMh
         ptmln3I1HPO9F1kjv9ollkzRnGX7Eok0dMb8t1ZM6hgoMwdLVQ/0DF/oaLrV7Xo8p+jW
         LO2A==
X-Forwarded-Encrypted: i=1; AKwUvBy87HV3t+quQp5AeUpKoht7/ONHhpr5u0JmyWPAOYm8E04hjNPM9TZOaKqVJx/k2BH2B7CpY2ztXX+5D4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5feNhLp3FFc4ycJhuoWYLPbwllqNyra0vU0z/Qe/+MsBlgQzO
	ovOxMEqE3TCgP06nA560UJoNbWjyasfici0qJgOV72A4eIaJ9mQijJOKGoHDDeHSksc=
X-Gm-Gg: AYBFou1ZCYsX73U/PK+CMr3ss6hlVhgH/UuqO5+qLUIE5OBSOSw9Xu/BInMFBdkmSwr
	phBTl3lNQTIzbq6qMBCdfP1sgY5OwDnJ7zqcuKc3l8FzH4E4ELr5kx/7bKI64NXnF+D6WfyvO2G
	IJ75ACsX/BjCDZQ46zSrayNA/fg0cfWjNELiySSVJgemfSxSvanJ3sAsQvsnYKZM7938itK5dad
	MYybjRPzQN9OeRO1/I9YqZMR2zzwXCsHzM29Aht4msPwp9BECcAlQ3+st1YK2a+jtd4mc2JMuZP
	mAcqrzT/eHCYPs63HB/7XpsC4btcFlbPBKWISEKJRHA5lVa7jSUu3pWpD/jWlARvzgeQcX+W7nU
	a8PoAPkiczSNBw+LhJ4ZB2xNcLf2ozx9HgMzktf2oYBtbMe/hD5se5k4xmMrGsuUVRMgs4sHxUr
	iZrrV2oaoQeQ9J1N6uYB7S8jYKcrPiOAUfq1OzbbL1KInQxkIBxxc9nvIOOKxVsAdJjYXSkGD+G
	7KGQQARIdGBCWRh8lAjNNTnRkM2eQn1fCrtEekXkGJ5HLzcyUkp9bLpkQLnZIPhQSVy6+Afiw2g
X-Received: by 2002:a05:690c:6612:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b133d6f248mr38447107b3.49.1792688501986;
        Thu, 22 Oct 2026 10:01:41 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b156164125sm1096567b3.31.2026.10.22.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:01:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:01:36 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, brendan.jackman@linux.dev, ziy@nvidia.com
Subject: Re: [PATCH v2] mm/page_alloc: mark pages freed by
 __free_pages_core() as not tagged
Message-ID: <atpBcB-9GOfKFVdx@cmpxchg.org>
References: <20261022122752.74774-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261022122752.74774-1-zenghui.yu@linux.dev>

On Thu, Oct 22, 2026 at 08:27:52PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> Onlining hotplugged memory (e.g., a dev_dax device bound to kmem) with
> CONFIG_MEM_ALLOC_PROFILING_DEBUG triggers:
> 
>   alloc_tag was not set
>   WARNING: ./include/linux/alloc_tag.h:166 at __pgalloc_tag_sub+0x1fc/0x254
>   Call trace:
>    __pgalloc_tag_sub+0x1fc/0x254 (P)
>    __free_pages_ok+0x14c/0x6ac
>    __free_pages_core+0xa8/0x188
>    generic_online_page+0x14/0x20
>    online_pages+0x220/0x3b0
>    memory_subsys_online+0xfc/0x198
>    device_online+0x58/0xe0
>    state_store+0xf0/0xf8
> 
> Pages entering the buddy through __free_pages_core() have never been
> allocated, so their allocation tag references are NULL.  The free path,
> __free_pages_prepare() -> pgalloc_tag_sub(), expects a valid tag or a
> CODETAG_EMPTY mark and warns otherwise.  Paths feeding never-allocated
> pages into the buddy are therefore expected to mark them with
> clear_page_tag_ref() first, like init_cma_reserved_pageblock() and
> free_reserved_pages() do; of __free_pages_core()'s callers only
> memblock_free_pages() clears the tag ref itself, and the hotplug
> onlining path was missed.
> 
> Since all __free_pages_core() callers free never-allocated pages, mark the
> head page as not tagged in __free_pages_core() itself instead of relying on
> each caller, and drop the now-redundant clearing from
> memblock_free_pages().
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

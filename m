Received: from mail-ed2-f19.google.com (mail-ed2-f19.google.com [74.125.228.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7653ED1B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079231; cv=none; b=MYyMik0YeY2SjuJUN6Ufsc6qnXm4MqOCSSMvaXMB1Sl8DBLFp4W/2G7gLLLTmOI/GmqvqT/Mo0oHYEN96Iv7cM5kZtZ7r8sCOio8/IqBMr9kmn99H9+gnV5Sb/5KR/NTpjpTaa2PedoMuC2nT3sFSWLlY7SKfbkPd8hYborJyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079231; c=relaxed/simple;
	bh=YI5qeuYEzeG0ydgPhXQYpf3v0xARxeUmxUKsKpI6Szs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owPB6cuPT5z86nnjyu6IEpNfUK05kOx4PpX0mZM39wekozSFSA3ik0ac9rKUBd/aaOGPb6b45VH8fTZow61ZORuek3+4ca2l/j64HJA0SwHqV+pQy32whFoNDJMQXv0liM8Ai1AkDvVM3ssa5/tL+WZMRFxV6aP9fjheLV5G23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LscFlo8W; arc=none smtp.client-ip=74.125.228.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LscFlo8W"
Received: by mail-ed2-f19.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so6440933a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079229; x=1790684029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjbpV8gXw6DnzPOP9Yav5BVijNjxxO/HGQyrKRqAqnI=;
        b=LscFlo8WvI5sm8M2I95FkrTYjOuyh7+AeqIfQjYVyALUROYAUnOImR/EtJYQE4GRod
         HP83IIvK5LvPz43GCZtAXwWSBaew/hIrqTv0gwjFbPXirHTRr+xQ7UEvVqD2GzxqZJ1w
         Cps1G8ClVJpw2Bf0lde7FizPSoo5+XuVg+1UnfuP6c1JLqWFQUE+VF8aKFksAHq9Rype
         6Raow56+ssg3gVZqQ17MK+g7Fzlr4TgSoby5DnUPwGFxasrwtvlVSleAWuv3bIlMN50h
         8MTxf1S4mBcJdRk/h5Ofl3U+Rf+DQI9zo//9K0MAZ7JhE+RlfxTO/ftzTJ45+uX2MPJh
         j8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079229; x=1790684029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjbpV8gXw6DnzPOP9Yav5BVijNjxxO/HGQyrKRqAqnI=;
        b=kpaDKi7P16Vy0Xo1JhkEGsUzXpM6qRrIEWjNxv1KqYWGtcDfCi6xxBEmH5v+s2DOGY
         5yI0IDZRMq3XoSHdG5lgl8z9rpk494RFXsfvanS7YKkBsNrALKrWrX+ZXZgRPo2WIpOn
         Fvkp04BFF6TOvAjiLs/KAI8L/kBj3DvS3G1aaiKqwlpWsk9iyKPrrrdqEdlFKmJWDpgb
         LZOqegN07buSzqYldTUu2HMlvOFdxbzRh7LxxDdWcNCkyr/HsJdHzEZRt/6An9uFDD90
         0Bmi//MyiSXZ9lTqRcHe9PZMeJsRVxNVSDH7n/tSPunfP1wzx04EiLlVxvDTWoVxeCGc
         YqNw==
X-Forwarded-Encrypted: i=1; AKwUvByTloAeqpiKQlnz4DaOL+b5Z152hxgzfxCBEnARnbX3l70528dlE5Jd6G2Ooo1hYbasJollANX8SXx3UJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++k3hBoDGxRfT8V2GT09MeE5X0wVT7u7j6XIIMD0Tv+GnKssMKMF
	JMoJyP8DDLs6WnwAGER4MMwDeBMhI1DqH3VSL/JuqCrYI1q9QCT+T/n0
X-Gm-Gg: AYBFou3qWRlbGhBc8y0ugzIvhqrwGIRzJHtrZWoayuchmgc5OO8UOLKEM19VdySqVzb
	GqWb4Lz4cyKpsyDJsu30DnFO2JDtSxJjrWSGIwlzk0RpGSx6tO+gz8dCuC4F1ex8tfla4ewPI7m
	F4F435W+6dLfXRvhJ3Lszqd2YrmMAGCi9ixA63PT/8yPKrJd+IMd6w7v2roRE7u1DfOxwIY8Rnh
	al11L0+NqrSgHyWUKnPA3bm1QLhpjIKaObpQnX4V698m07wK9U4vuuoi3gFDnzIjdWIMvy6OulN
	yZVZ0r+o6cR9zYyDOxBxKVjbWhMmhQrmOy/nsKB94OCLvZ0elxzSUXFgy8ZiA70Vra0RF0RoEJE
	prJ24XTb0w1/h5b2kWkULDj7uF6FCMzx7r/8Cy5N4GjmHtY/4Z5GoC3OncT1tYB+rfBxW780z7Q
	vl0uXZAj1xDTyIBaozoc8KHrEAqoo2AM3vvlNT
X-Received: by 2002:a05:6402:249a:b0:6aa:734a:a08f with SMTP id 4fb4d7f45d1cf-6aa734aa2b2mr8449809a12.38.1790079228363;
        Tue, 22 Sep 2026 05:13:48 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44e6abdsm917994a12.13.2026.09.22.05.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:13:47 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:13:45 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
Message-ID: <arJw-VKQNxWA0RSc@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>

On Mon, Sep 21, 2026 at 09:17:23PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() unconditionally searches all vmap nodes even when
> called with a non-vmalloc address (e.g. a slab or stack pointer from
> mem_dump_obj()).  Add an is_vmalloc_or_module_addr() check at the
> entry to avoid the unnecessary per-node trylock and rb-tree traversal.
> 
> Use is_vmalloc_or_module_addr() rather than is_vmalloc_addr() because
> module, BPF, and execmem allocations reside in MODULES_VADDR..MODULES_END
> on x86_64, arm64, and riscv -- outside VMALLOC_START..VMALLOC_END -- but
> are still tracked in the same vmap_nodes rb-tree.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 30c610f678dc..d8095b558365 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long addr;
>  	unsigned long nr_pages;
>  
> +	if (!is_vmalloc_or_module_addr(object))
> +		return false;
> +
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>  
>  	/*
> 
> -- 
> 2.25.1
>
Do we need this check? If it is not the vmalloc address, we just return
noting. Another question is why do you want is_vmalloc_or_module_addr()?

vmalloc_dump_obj() is about VMALLOC_START..VMALLOC_END, IMO.

There are only two users of it and both rely on the VMALLOC_START..VMALLOC_END
range:

<snip>
*** mm/kasan/report.c:
print_address_description[403] if (!vmalloc_dump_obj(addr))

*** mm/util.c:
mem_dump_obj[1096]             if (vmalloc_dump_obj(object))
<snip>

	if (is_vmalloc_addr(addr)) {
		pr_err("The buggy address belongs to a");
		if (!vmalloc_dump_obj(addr))
			pr_cont(" vmalloc virtual mapping\n");
		page = vmalloc_to_page(addr);
	}

and

<snip>
	if (vmalloc_dump_obj(object))
		return;

	if (is_vmalloc_addr(object))
		type = "vmalloc memory";
<snip>

--
Uladzislau Rezki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771104;
	b=ipaVHYGOhzahi5D1BZoxg1BOwtWg/dYdH+PYmZZQBM5YwsRe+vvck2Ds//WndJ6o5Vcu
	 ++WWwSO8I/UlrPWGk47uUJTOMaqgbgdj6Kjyr7rll25G/Ac72J5baKt0RIChvAsObeGhJ
	 DQ9C84NYIZr5qOuav3H2/y8c/60F8t2jB/69S1cwb2rsVU/kzYK/CizzN6ZQaF83vhWwa
	 DW771hxywyNet2OTEeRfv7zvJjFmz5AJwVhNrpmRI+N3swvyUrDsTyU2pDKPa6AyQ5egn
	 XqsaIZa3m2NtsT66XX6P0O0C9i4fbXmVY2aqpAPqn6usdMU3LP17uTY6hkRe68vp0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
	b=l/H/gJPVnTgFou7dRze6eiGUVgeZ5iBbrqMWm0Mx6ihtmE2dmx+7xRlZItjTtr/er3/8
	 v2dmgOLBhMy9ByzqEplyO7SJxy2TW/QJzLqr1cmq9rk68UFLES6Vtj1az2J339ara1xCc
	 pJ7O+fkFx9aqB3iwoxp6OLSAeF+YULrHtoMfq6DnqKGQP2GBQnDKRBsB33s2SFsaoTzkf
	 vL2++95oxXiusql9T1BdnZ6smksbzxkKfnTU8/xWOPcoW7yHtyM9mvQT5oS0DApaICMDj
	 +3LJWWTNcQJVcezoQYlpYC4kxJGJ2jEx+V8f89gqEogP+hFu33u2jleON0oi/QcdcZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTx3+SOh;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE50606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTx3+SOh
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so65827a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771104; x=1793375904; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
        b=PTx3+SOhTdnUC4l9QD39mzvDBiRvCJt5QG2Znwe0srIuIEhUJHRM3FUgALlOCZC4gu
         qpjaRZxY+Guwr4ugPHVqYeuGevQv2QafXFhobLSduTUFHskSQzQ2hlSFUDxJ+eptKuF4
         YDTaHS7NriA0WBIKczxLaKmqwZbbT87SHmNHaynZsHX6Abe8Cce1Ql2PMn9xh8fb8Jtn
         0auAl2nnXl1i5R+mQBN9JENdebgSsgGyZNa3VoSLY7iGHKd650/imzOW4DjDdAX+VwLK
         SeNV0+1330zbD00mA7a9LhynPip0JZpa/XPPChke4zCXYZZGlJPAAmwUhP9X5BtyHBi8
         kx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771104; x=1793375904;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
        b=xKbN2i2WrmF3Xe3x2PvERGKZeAHqA9YLX15xRzvyZiFS0hdJ2YF2kTw5e3lGtza3rI
         xjTW55E0Oai9/mQy0F7Oc2mx47U0AbD03nh8N4fhOPpJ78xbDX5ar/24b6C43yUq9Q+9
         rz2fh8JRmcXdhqLb4YJWv//fcxs43JORDFA5kYyTwtktMMUI634MFk+0suVv8J6/zliX
         PK0BZ0Xm5fdSKM5+6u0hOaXf44aFaFOHN3WMCm/zkAO7bNv0LomCG3Fn14jDpw7EFoIo
         5rmxLgUEULt4hr4xGPczvchZ22wJQpedcc0bqE9k8ZeMjZmrVSTg/CGknnBrLjfTubJg
         jWgg==
X-Forwarded-Encrypted: i=1; AKwUvByIKKu9Lp+CnmokKXYXX33iylr+e3NBmz2rH2e9jDeuRa7hhfwTcMxccS0QuHDfPZaNoURdAw40j0J0M84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ18jWw5C+eEW7LIEWoxyLpkbbBbJTJRu+6GP+pu5AeiRvZ3Xtr
	lZS6/ZAzHesz9w8ziVHavU+9KWcC0zNyCEW2jo+GH8AzkgMIZvI0MkDK
X-Gm-Gg: AYBFou0osv7oRhRj8nuq837vzdV7bhS8f1kjoF6E761q2RpTQz06TIM7uPaWsm1Doty
	gl8B0YoM/F0M7hFMPoo3OY1O8qDv44a0NNcOUYy0hC9uuHkX0y5FjRanv/suklVOV2IKpGBwzao
	sxKF11hGtUaUJQDovOUP7YojypbKMtY2h3Tfg6LFHjz/U4fGuLVkpsocuZMcPKnOIu/QVLEBFGB
	19GcOSK4AFNz+rwIXo0WFI21H+2WubnX9d84FZY5+eGEkdX7aqDIgbN5vSjD5qvJ4zq7f7N9k8P
	DaNq79p3u9JAdCAgSxLOcTES4AAC0VQBH3gIPU/iFBRgndsTbReR/Bd9o21Nz/fdqPxJSTwvwH7
	wKazyHOLe3EZ79JxKbe+EFnkzM9MWXqhqgkvdEmyYA8D4MtOdKO0pk7YeC5bCZAi09d/aFrYDbL
	eUEXIHdJDxHxyFunQDtY6WAr5CiTG9mR6YsK7PdlS+DZ6Hf/5TLMaiqR0/XWH6R+lYcMUrMbeVG
	VaQGmjnEVYuJj527LFYGw1oHRWQ82KBGqdLWeOqP5sRtNxIPxOkHuSoyCoHd2Pe1Jw6vMn41pT1
	qU5XLnabTovLJs5xNVUDUDMIyBb4UtAFEbuq5DkwufBHrUE9a3G6+11HcecL
X-Received: by 2002:a17:90b:3e48:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3adce7398c5mr1635912a91.24.1792771103440;
        Fri, 23 Oct 2026 08:58:23 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd84b1basm707058a91.14.2026.10.23.08.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:58:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 15:58:22 +0000
Message-Id: <DMCCBEPCIWH0.2JEDKE64WPJRQ@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] mm/page_owner: add bpf_iter and kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "zhen.ni" <zhen.ni@easystack.cn>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>,
 <ziy@nvidia.com>, <shuah@kernel.org>
In-Reply-To: <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn>
References: <20261021112437.1799213-1-zhen.ni@easystack.cn> <DMAURQCKK6CG.10CZ7MFXGJO3V@gmail.com> <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 23, 2026 at 07:51 AM zhen.ni <zhen.ni@easystack.cn> wrote:

tldr: it's still nack

> underlying iteration logic. This shape is also what Documentation/bpf/
> bpf_iterators.rst prescribes:
>
> When adding a new BPF iterator program, it is expected that similar
> functionality will be added as open-coded iterator for maximum
> flexibility.

It says what to do when an iterator is added. It doesn't say that
one is needed.
Iterators are for kernel data structures that a prog cannot walk
on its own: tasks, cgroups, kmem_caches.
pfn is a number. bpf_for() is the iterator.

> 1. What range to scan. Where do ctx->start and ctx->nr come from? No
> in-tree iterator context provides them, and a prog cannot derive them:
> min_low_pfn..max_pfn, memblock holes, and offline sections are all
> kernel state. The loop bounds alone require either another kfunc or a
> kernel-side walk — which is exactly what the iter target already is.

From user space. It's a syscall prog, like scan_open_coded() in your
patch 7. Its ctx is what user space passes in ctx_in.
/proc/zoneinfo has start_pfn and spanned for every zone.
In holes and offline sections pfn_to_online_page() returns NULL
and bpf_page_owner_read() returns -ENOENT.

> 2. What makes a page eligible. The alignment test in the sketch is the
> only part the kernel agrees is expressible in a prog. Everything before
> it reads state a prog doesn’t have a handle to: pfn_valid() over
> MAX_ORDER_NR_PAGES areas, pfn_to_online_page() under get_online_mems(),
> skip_buddy_pages(), the PAGE_EXT_OWNER / PAGE_EXT_OWNER_ALLOCATED flags
> in page_ext, and taking the record snapshot inside the RCU window so the
> checked value and the reported value are the same copy.

bpf_page_owner_read() in the diff does all of that:
pfn_to_online_page(), page_ext_get(), PAGE_EXT_OWNER_ALLOCATED check
and the copy of the record before page_ext_put().
PAGE_EXT_OWNER is set together with PAGE_EXT_OWNER_ALLOCATED and it's
never cleared. No need to check both.
__reset_page_owner() clears PAGE_EXT_OWNER_ALLOCATED, so
skip_buddy_pages() and MAX_ORDER_NR_PAGES steps only make the walk
faster. They don't change what is eligible.

> 3. The walk is deliberately lockless, so exposing struct page to the
> prog is not safe. The pfn validity check and the page_ext dereference
> must happen under the same kernel-controlled RCU window. Otherwise the

The prog doesn't see struct page or page_ext. It passes a pfn and gets
a copy of the record. The lookup, the check and the copy are in one RCU
section inside the kfunc. offline_page_ext() does synchronize_rcu()
before freeing page_ext.
page_ext_from_phys() does the same lookup from any context.

> 4. One record doesn’t give the prog the useful data. The record holds
> only opaque handle/free_handle tokens; stack-depot resolution exists
> solely in the kernel. The memcg is neither in the record nor trivially
> reachable — the path is built by cgroup_path() walking the kernfs parent
> chain. The NUMA node comes from page_owner_get_nid(), which bypasses
> page_to_nid()’s poison check. And so on.

The handle is the key to filter and aggregate by.
page_owner_stacks/show_stacks_handles maps handles to stacks.
Same for memcg. bpf_page_cgroup_ino() in the diff returns the id.
st_ino of the cgroup directory is that id.

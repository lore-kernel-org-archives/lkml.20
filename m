Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247282;
	b=WITTGFrXhUbkCiurtlQV05I+9ZnBMzUjnvaIQqlPCv30ta9Yt0JfOcg9eQ4r6jlyk3Vt
	 DL73VgvoZK/6DJj88IAzjejFg/3yv1IPeNENh3jjZTuhT8cFCgXpu2wukS2B29OVWB6dW
	 xOayEgJ/DwvkNid2bAXFSOpcEi2ewxCQpMet+ZR6dRgntw1nzxbQHxAeMQcRrkO7YoWKS
	 edstMi6uS5awDBRfHHdqZ53hRdHlZIAga4T/+sQKq7uKnoBMiS3JYTOVoLPk7mxUEB3ld
	 kB+FVZcmgaiouS4hF/ZbENZuYuBvrVC8nNad63ocC0g15ZjR3Mh0+F/lNzRIb9/wbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
	b=a7mTBqIHwdRkWPDQMJDZ9AIxl4CNy8HNIZt9/unlVH9FkQBNeYUG9Q1qDKBwnQquEtFs
	 Ys5XtPzU1xw2zIGOSBGy+NkUOecrf8Qs2Xs6phc77T4yh2HmIA0h2FxwdcQZcgxhGQEiI
	 dteuyJ8AfLMvMAzybRYnuOuzq3oGcDEA7LVYZ5qPblwEGSF1i5ks9TRcH1E12jlY2654Y
	 1+3Ls9R9RQHG/tGr6oMsUD59U5DoDPz6WBO91dQ4MGqQLy5QA5tK47VDHhyJED8h7z1Y+
	 laDMBTGpwYm4Ks9WbfHVVvFmgIkwtUvuCBp+JyYd3cJe5q3/eFgvY8YISwvmcSwnVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BJ1V9n2A;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3965D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BJ1V9n2A
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so159853566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794247280; x=1794852080; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
        b=BJ1V9n2AfADpR7dsa3wDijiT851F6urrq6crD7eUpAMOKrYZADJ+K4ih3waAiAG6fL
         EAjk0herI9n34LsL4j8P74jeW1R8C8fQc1gGBi5OGvEDKNwnwYvFvw+6P+2N2QQ7AO0m
         DgHGiDYRiOX09JRBbDZ/VYprdS1OJCYEPl2Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247280; x=1794852080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
        b=zBlRv7SQYNZCcAPzdoPIfX+rtuXe9obcQ3bnTzixIAXq4dcAM/Ahx3knYZyD9NHbFV
         47Q4v5S/W3Yy17SL9lOtK0i/wTprLYA1Hwh04mhFsGqshRinHpwVbHsrZHMEVp/8hzff
         +1cMkiT38SelhPPO3b2YIPCJHYbrAKYlwFbNfvrX5m+N0LnoDHmJP4Js2ENapHVDwr3h
         AIUTiubSosNYDQYy4yjfZLj4LzaPrgTwXk1N0OzxCYIxMhHuwa3b2u5+4dMnduaFipP0
         OPEjJGcHae3YG0tBCL5OPb9z03otbT7QC5n2TCypzbWbtv2YN//BU4n/77yRyO/wRuwX
         KiZg==
X-Forwarded-Encrypted: i=1; AL+hErFU2Ak25jmwYEXouCwKNZGAgGN8icVljQOxgI6Btmft0IJYa+2hPo+4usxRJEJJWwZcuEDRvDtbs1kjS/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xj5GW7gqe/kebAixNrCh2/9ZbNaen6M399wVgh7TNdaCVqm8o
	UjYFB+JZYWcEpktV7+NpXDRy+r9VG+jLvH5qpZafs78Pm1dA0OjyhuQFuI3QvEG0ghNKPqQJhSa
	5mO/+g+9YPQ==
X-Gm-Gg: AYBFou0BHXE1EgGKVsrYrju/OxxyIrkzhR6aq3j6yUfHdUK75bQzAWVzpR+SaaPYSyB
	30JJtFYmrrzGU9PgGCMvDwIqjQ+Hwm+T2LAljj5kxVQ/bGu4gxlwyxl0LIEoYizeIjaCknMz7C4
	0ICpXfROIckMjQY6jI3aYBEQs1vZyiJ+cevOxCXQLD/u/M9WHylCjRndIxXvR68u7o/QHASzqW+
	7ZruAfx5RrSuRdmnp1CmNA0NRQAGt/GRbn06vxxQEH9LnVt1pOUi+1/9ZZMHYVPdRW7d1xMLVju
	ntDprISi+pfVcQZPTSXQv8QB7nv37GbG5OEx2CG+/alNCo366r1jJ1Z9RvZ3AFrY0+Tsu1G/vFK
	hVEiGhaRl0ugpd56Tx+eRpfwsnPI26k3xRaTaWp5WSdUurTSIrS2KEXEJ2yVzjl/OMsoGSVqrpX
	5KYsxhL3zcfJgyqsrPwPGjbuEOw5SseTvwoXwxO7ly1JZddSIR9XF3qc8womky2YU3zrQiE6Mi1
	4zzxheXcxN3/1AgUdGVjFm7ySM78k85pXI1hZpCX7ifzmaRPZ0+FSo2beN/0eh2McwFhhO+vjjB
	Yl6mJsMZDHv1V7gXJExrPM3imnU8lPN60KyPwTRk2WMuELIQ0eE+pm1WAW4CpzYfU0hw7ltEZJT
	yFQ==
X-Received: by 2002:a17:906:c0c3:b0:c41:a5da:1511 with SMTP id a640c23a62f3a-c50495f2fe9mr6864466b.25.1794247279605;
        Mon, 09 Nov 2026 10:01:19 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4ae089sm200790266b.53.2026.11.09.10.01.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:01:18 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so158447566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG7CUBa3aIFgZz+mhUsQQIeFOyE2oAlLCnyWdiT44ukokFsm5XA5tvaCBNr0Cfz6ZK4ksxz6IeFFlg0xh8=@vger.kernel.org
X-Received: by 2002:a17:906:478c:b0:c41:b94c:4538 with SMTP id
 a640c23a62f3a-c504973c481mr7202666b.47.1794247278274; Mon, 09 Nov 2026
 10:01:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-2-kas@kernel.org>
 <ecad7b3c-7244-425a-9413-04d49f221057@kernel.org> <au2lsbDkyWt-To0C@thinkstation>
 <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org> <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
 <8504e28f-faeb-41e3-842e-0cb74d1a25ad@kernel.org>
In-Reply-To: <8504e28f-faeb-41e3-842e-0cb74d1a25ad@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 10:01:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihE=ioLKrwzz=WQSJg6HhB-syu4hqZ2QFwgnwYmmLEgg@mail.gmail.com>
X-Gm-Features: AclHuK-A_qW69_o6tagKDJ1G6Q8E_NGG5rYMm4wqMXtGYWO1MbLxTJtWgkQTGLI
Message-ID: <CAHk-=wihE=ioLKrwzz=WQSJg6HhB-syu4hqZ2QFwgnwYmmLEgg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/18] mm: free PG_rcu_free folios only after an
 RCU grace period
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 09:24, David Hildenbrand (Arm) <david@kernel.org> wrote:
> >
> > I think trying to corral it into some special case is the last thing
> > we want to do. It only makes things less potentially useful and more
> > fragile.
> Let me wrap my head around how this would look when we decouple pages from
> folios, where pages might not have a ->lru anymore, or not even a refcount.

So for an example of a place that already does RCU freeing of pages -
*not* folios - look at the TLB shootdown.

It's very round-about and hard to tell, but it's using

  tlb_remove_table_free
    call_rcu(&batch->rcu, tlb_remove_table_rcu);

and that then does

  tlb_remove_table_rcu ->
    __tlb_remove_table_free ->
      __tlb_remove_table ->
        pagetable_dtor_free ->
          pagetable_free ->
            __pagetable_free ->
               __free_pages(page, compound_order(page))

(and I might have messed this up - this really is a rats nest of
nested inline functions).

And in order to do this all, it sets up *another* page just to contain
the batching (which is also RCU-free'd)

Now, the batching is probably a very good thing in that context, so
I'm not actually suggesting this should be converted to some common
RCU-freeing thing.

Rather, I'm pointing out that we have existing hacks in this area that
have grown up over time and would have been a *lot* less hacky if we
had had a proper RCU-freeing page allocator back when that whole TLB
freeing code was written.

So I'm not saying "we should unify this". But I *am* saying "look, RCU
freeing of pages is _already_ a thing, and we have complicated hacky
things in place for it".

And they are complicated not because they necessarily should be
complicated, but because we solved the TLB shootdown after we already
had tons of complex architecture-specific code in place, and we
basically ended up adding that RCU phase on top of that existing
per-architecture complexity and abstraction.

*NOW* it would be actually fairly painful to try to convert the TLB
shootdown to a new order. But originally, it would have been very nice
if we had just had a "Oh, mark this page for RCU freeing".

(In all fairness, we also did it that way because some architectures
don't need the RCU delay simply because they have some other hardware
page walking infrastructure than the actual page tables the kernel
builds up. Not that those architectures *matter* today, but some of
that per-architecture inline function stuff is required to basically
isolate these kinds of decisions from the MM code - that deep inline
function indirection has a reason that is entirely independent of the
freeing side).

                    Linus

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060591;
	b=HUOjhzj1FaH+QNQhRsVSY4y7eABXFYkkktHlYOM7Lir1cmxGelQJo5CLFcJlSd1UEWXt
	 3OduT6ahwPT4CKLcW3heoXYP7AScbj95jlpTS5Isaujbijab5J2LibWr+MLsBBDk5sb4m
	 tiVtwTUgTE3+35JLdvdJTR0N0pc0c0K49b0j8ftD+mEVuDI6Th/0EqgvJIT2jxjl29rAK
	 xCcfwyg5fbEWLlDTzRkPrJdZDY2Av0XmwwTj+DbGoEmDDcvEZ1ZjcAmvRAL8g881qlgrF
	 fVyAKZrWGLpuVRCE+750DBIUhIWsFa6AKzsQatlwo52rj4xky4lNUNlUTvEssi1kfaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060591;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=SBdEtgRELMv6cL39Iu6zE/ZqIOSWwe9mTx9+6PfSIrc=;
	b=teHQu4+4QqHRoUe8z8p63fxeOlaGrMiuezM1HN9F7K/QRubeN10/OGWK9oWCEmYqzKjL
	 IGAIuc/cp/1TRpmw9xOe62q4+VhJcC0uIlB53hB/QBZlPQp9aAupuaAYRZqYY8zvtemr2
	 shHQkBdR+OMFPhY6gnPBwaFemzgZH1RmzMdSqgl9Obv/Cw7zR+chyKW2byqGeS7qy9qkX
	 kn4E12V1w1h+SLSWu1hhTT0ko6WsjadtqGG5XFdqGSXLeOSOG38xxliaF8A/IjLpj9Vs9
	 8U2mDvBu/HpQyA1zp0wQFKb225MmR1Mmcuk5v/NZzSkf8iAqNrsrOral/gqqL/lcx5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAD606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FAD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1089300a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060591; x=1794665391;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBdEtgRELMv6cL39Iu6zE/ZqIOSWwe9mTx9+6PfSIrc=;
        b=XsNJaa0R0eBLzTzv1ysGYvygcO97NLyHB1yjsLg7xOctm8nWigY8IuND/yjeHKeWLb
         qpdttu9fooB545g7SXjBoL60y0wuAaLUba9wv0jC4OpGm3iSk/+RvKYrqGWPlNBa9V4t
         PlIW1CXATg79DjIISw9n6Dck+zlPKU3RvvyCkhhqKt+iNNNlAel7tVQgRDdXHwG1bEy0
         chBddKV1bs9u0nv53Bhm1JTeA6VX8AQLfFFllHXxC5PS6vkdC4unbk0erEXs4n8CaaAc
         NsHznY9U9e8trp9P7t+yLEVd4zogaIbK2SQY8nhK2zppv4IZY2fJe+v75tbrtC+6b91/
         lluw==
X-Gm-Message-State: APuU4Z8Un1ZF4YrfX3M4D+r4x0PhgclCZAsdtQFtxcmJhhTK8F/lVKuk
	8LkgTF3GM6lHX52skcorxHyKjdV/kFynwrb8kq7FMG9X0571veKSqUW6GRV/9SSKYn0=
X-Gm-Gg: AYBFou2iZAJpX7EjfY4PGt4T8RQAj9hyMeIqMZgtS7uJSr8OQ/NLEKR765z7an5gkTf
	UIES9vWJMSRdzdyVa/hJ9gSFih5iNyLPAZ/Fx9dmTidko489KWDrvBCohIwJ5cCXq4nbsLRnLTk
	tV1ZCCGNV+e2cqpd+EkYSHOYz+28g7Q+93y1yOGij8LmSpvuGTP4BbYXR12BFx9GFaQ1IUu50Cw
	+JlmyHbSAzZovds1pLfY1WaoaNFsoEOjZ+z1uhpLGSOfJVUToKELZhHWT2hfz+hVrknTY7lwgOp
	nayhbm64UChXoL0P4Y+trSW4iiv1vjkkkZMdmYH6N5Fx339s6mC+Oexo8a/H/nxpf4fHpDS99D+
	30mjcshLGgoWYMYvqGVX+MNb4A8enAM2YTb9V6vG2YLa70UI3bnUaVZ+fV3A4Q5q7O9a3+H3OE9
	8Er8u/LbLL394zSf0Dn/+glUF46imXoaV0Ye2e7gcQFGw8y8E0MUiKAB29MxZrGs1eolZUmw1yA
	1g3bwYbJyCvtSaNzOme1uhP2feXqUUCf8Hz47kLWVNXcu5kFjAWifkcREchKJd84Mca1vC8A5rY
	DpyspRW/LbQreNdVeMZciW+1Eu9GC2VNsnTTBbIPZvgrECKtH0gbD/OxYRCII0kI
X-Received: by 2002:a17:90b:2ccf:b0:3b0:a757:4f85 with SMTP id 98e67ed59e1d1-3b0db6057b7mr5701042a91.2.1794060590772;
        Sat, 07 Nov 2026 06:09:50 -0800 (PST)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10581caccsm3494948a91.10.2026.11.07.06.09.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 06:09:50 -0800 (PST)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3146014c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:09:49 -0800 (PST)
X-Received: by 2002:a05:6122:6602:b0:5c9:66f7:2f23 with SMTP id
 71dfb90a1353d-5ecc42df9e1mr2329243e0c.2.1794060189583; Sat, 07 Nov 2026
 06:03:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 7 Nov 2026 15:02:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGh0WfSPa1d58kGPXtXXf8LQ5LBFo8qj+dndnWeB9JcQ@mail.gmail.com>
X-Gm-Features: AclHuK9fsrEpFiBrWdBJF0kgNP9QpJMfoBLXf5BNXAcgFnzksV9WKiF90MMkcOA
Message-ID: <CAMuHMdXGh0WfSPa1d58kGPXtXXf8LQ5LBFo8qj+dndnWeB9JcQ@mail.gmail.com>
Subject: Re: [PATCH v3] lib/tests: add KUnit tests for the priority sorted
 list (plist)
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>, 
	Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Marco Elver <elver@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Borislav Petkov <bp@alien8.de>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Petr Mladek <pmladek@suse.com>, Eric Biggers <ebiggers@kernel.org>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Thomas Maarseveen <maarseveent@gmail.com>, 
	Nickolai Zeldovich <nickolai@csail.mit.edu>, Thomas Gleixner <tglx@kernel.org>, 
	Adam Harshbarger <handyhandyman.adam@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yuehong,

On Sat, 7 Nov 2026 at 05:43, Yuehong Wu <wuyuehong@cmss.chinamobile.com> wrote:
> lib/plist.c has no KUnit coverage; its only test is the in-module
> plist_test() under CONFIG_DEBUG_PLIST, which BUG_ON()s on the first
> violation and does not report results in KTAP format.  The
> ordering-sensitive code paths have been changed three times since
> mid-2024:
>
>   commit c8dab79f9eef ("lib/plist.c: avoid worst case scenario in
>   plist_add")
>   commit 95d4b3450ebe ("lib/plist.c: add shortcut for plist_requeue()")
>   commit 43c91b152243 ("lib/plist: fix plist_requeue() corrupting order
>   in the last bucket")
>
> The first two are performance optimizations; the third one fixes a real
> ordering bug.  A deterministic case for that wrap-around now lives in the
> CONFIG_DEBUG_PLIST self-test, which only runs when that debug option is
> enabled by hand and stops at the first BUG_ON().
> plist_kunit_requeue_last_bucket() covers the same shape here, and the
> other cases pin down the ordering invariants the two optimizations rely
> on.  KUnit coverage makes such regressions visible wherever KUnit is
> enabled, which CONFIG_DEBUG_PLIST is not.
>
> Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
> plist_del() and plist_requeue() and validates the invariants documented
> in include/linux/plist.h after every operation:
>
>   - node_list stays sorted by ascending numeric priority (descending
>     priority order), and its prev links agree with its next links;
>
>   - exactly the first node of each bucket is linked on prio_list, the
>     ring's prev links agree with its next links, and the headless ring
>     visits the bucket heads in node_list order before wrapping back to
>     the first bucket (a single bucket degenerates to a self loop on the
>     first node).
>
> The fixed cases cover bucket head handover on delete (first, middle and
> last bucket), the plist_requeue() shortcut with and without a following
> bucket, requeueing the head of the first and of the last bucket where
> the ring wraps around, requeueing inside a single bucket, the
> INT_MIN/INT_MAX extremes, and plist_first_entry()/plist_last_entry().
>
> A deterministic pseudo-random add/del/requeue churn test mirrors the
> in-module test, but draws priorities from a small range, so that
> multi-node buckets actually occur with the 24 nodes it uses, and every
> requeue in the loop moves a node (a requeue without a same-priority
> successor is a no-op).  The in-module test stays: it also carries the
> plist_add() worst-case timing benchmark, and CONFIG_DEBUG_PLIST keeps
> plist_check_head() in the fast path.
>
> The suite is wired up as CONFIG_PLIST_KUNIT_TEST next to the other
> library KUnit tests and is enabled by default with KUNIT_ALL_TESTS.
> lib/plist.c is built into the kernel, so export plist_add(), plist_del()
> and plist_requeue() for KUnit with EXPORT_SYMBOL_IF_KUNIT() and let the
> test import EXPORTED_FOR_KUNIT_TESTING; that keeps the test tristate
> like the other library KUnit tests.
>
> The tests build both as a module and into the kernel.  Built into the
> kernel, with kunit.enable=1 kunit.filter_glob=plist*, all 18 tests pass
> under QEMU/KVM.  Reverting the last fix above makes three of them fail
> (plist_kunit_requeue_basic, plist_kunit_requeue_last_bucket and
> plist_kunit_random), all with the list coming out unsorted, so the
> suite does catch the bug it was written for.

Thanks for the update!

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611052109.GqbzRkv1-lkp@intel.com/
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I don't think any of the above tags are appropriate: they are not
related to the reason for creating your patch patch, but merely review
comments raised on earlier versions of your patch.

Hence please drop them.

> Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

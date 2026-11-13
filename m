Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607544;
	b=c3k4jD/9EFBVOhxDYB8S7EYiNF42kYQrX7vO6xc5+A4hU/zMbAmmRmRFMD/E41LF9QyC
	 EVzI38rKlvH8TsGS0fnztDiJ/OxvA28OAenYa67U6Qe5bkzDHX88NzcgrQX/MdkJuzeuy
	 hpOKXyKlHiQM8dkIdQjq8h7ji5426k6ryRyRqE2hGbdYY4KNW0NxdoUvIphT4Ae37tXaV
	 0yDmlgOd3kGmsdlMWruuo9qgCzNdtprq6IpZHZJWZxpO0IcDPIOqys2pJuonkDFU0lTDa
	 iQpBBYuFW6UoQfBbKKdNpXSXrvmM76o9wYZMlpsLizWri/0KAQSEXxT18KnNR8N+Ipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2L0U74R9+mkRFuCmWnre9IxfyFESeJ4+6hhn8GJhTV0=;
	b=SvTT27mJOGFMDtgDmW8vUTH84ChGz1ocLDkOhRt+OyT+ypl0Jg6xpSOQFPn2GMaPBO3h
	 4wc1E1X6lQ1rIKHu/Iluw+21qnWBRZj/v9yLr9xjx3BZ3Ls49c+kjHDg88VWuMSrRcidJ
	 iZCNXX+ntVtW/VRP3+2Zn5zMPeCv0xHXYLE2OV37nK2f7kpUE+61WPTi47U8UzShMUCF/
	 pDT1WDLBQK37+ecoA5aN2H6jMRyTdDAyGAavCs1A9TaKpHRwO+xfGJz1jDeN8ETIFnTZe
	 Bvmuzc0EDYwhC300I3Fl5MVb81Orzt1DKwv372OKmaYt5IigEwORLyJa/hdpr6W5ftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8h1G0PU;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602E606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7602E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8h1G0PU
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b30cbfa628so15297487b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607542; x=1795212342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2L0U74R9+mkRFuCmWnre9IxfyFESeJ4+6hhn8GJhTV0=;
        b=F8h1G0PUEaWPWMOKfakJC6dT16YkfO2TZGOFcY7Hi7Cbl7fMq0t89V1I3Ehy8TMXkh
         DiXTsRyxenwGnuTE+Z48qQaC8PkUm/L+qxRlFPMphxhVq+RTIaT4TRKFQMN7nHnQsnx0
         EKWK6xh4uOOkCQvX9eXEv1AHB6e29MFAqdUacWxDw7NbT5D2reidDtIR0QLfTrGYtcHS
         8ZoBjP2cRjn2TmMqNtKfLSp4SmBNiw9thqJ8ecYczzZfPKkcs6rHsKYdaFT1mgZK+9wm
         7D7onApjJhzN66WYnpJlpsW2QjFWSGFMY1qGRXtz1cAVcJhQ++qQHvb2s3blyqy7uK7c
         Sr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607542; x=1795212342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2L0U74R9+mkRFuCmWnre9IxfyFESeJ4+6hhn8GJhTV0=;
        b=beE7pDqeNZjncLKMiPyBSUzwpeciU/CUc6ycINijFnhzhJKuUgcm6hc7gu1DsLtN0d
         k0BzMKN0Al/7zky1S9rVRo+1MMGlLHjUm1pfHuJa4JED0UdHK/elw5aA6KhQsArFNMlE
         ZjMHQCJnyOi5D79RWhcbYv5h8YajOuekEKFzwcrPvboEgtX1IRR5BoiqnrOJhKAvOq9k
         i6FC4Ux0A68uVPvWJ1ZiBsNF9Lg7brlBAi6UmlWQsJEyujPlSeRxtpxhENkH2YcaxY18
         DqyG3D+XZtDtXDhjLrGYvYWHhJMULhFyNg/SCRN6oTiq119dns57hyj7bwCpVJ6Y8EVN
         VD2Q==
X-Forwarded-Encrypted: i=1; AL+hErFUxJGk0ZCvRzO9cvBv5e7nViDN7ZlbDvA+b03WUPho1E/NSLD6LKJ/cG7bVg0yL69JMGck6bkJw/7PFPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0cpf1TDjabwxAG4LzNffmjKCC1LC4AZwRU0/3bZuMI5SPAo5m
	/AwDC4GyufwjBfRcuoDBj3jfX10/WToYhW1CVDJIMKuK/K4M3Sa4dwqC
X-Gm-Gg: AYBFou2wf0RuG/hUojIa3NhcJrlFkZ2K6bhq/dJEwgAkZ/7usA6pSilzhKIKpJtCPcz
	03vq6x5F7sJ9w+7N/kM7S581r+uDy4xYTZ0+C6ulFsU8f8WO3He9h8wuVn1sRO4uCofPjL+PT7C
	hyIXc2thOM3wqWpxbblajWk1y5FWrGO6aAM0fHArSKHdjSxmUKzN9nDkyPknA8nua5WRz92NKGv
	a2A+qP6VO8kJYDI2RH9EoTko9N9IP+Ap7xdPpvtduzzfUfn7NltTuPFR1eAtuNKxf/Bi8+NI0tU
	ukkM2yPArqv9/ea5tdijeEgahSGPZXrz9I8sHEbSPshDn9QRnguhazWIVd91CilPCiTTFmKR121
	/Ri4XcrUu45Hn5xkLcgL/tzQbI3dfW3Onftv29u2VwWi/Y1xCyTK+i9h20VXf4Z5MizYjFxmahw
	oBM1J6+uqQ+tcXJVMJkJXsU6wLd3CKb3otVl4RwafKNpx7O7PDwWMUXdgp9Vl9sMVzZF2o0SOYW
	bwwE2XW/+bzSEh7xWBrkjgCuT5er8A7qYvIEuqvpJvo8jnrSslT11wboP+pbEwg1oVsDzOw1RI6
	S8TZ78rguT/aMwFnfvFPb9TYl/ylhA9uuk9yamZAsUWwGbJcE5x6gQ6qRsVIf6NoNNniyi7Kt4U
	YtYe7mA==
X-Received: by 2002:a05:690c:e284:20b0:8b3:8c44:26df with SMTP id 00721157ae682-8b4aa26fccdmr19298447b3.34.1794607541274;
        Fri, 13 Nov 2026 14:05:41 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:11::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm30354847b3.43.2026.11.13.14.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:40 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Balbir Singh <balbirs@nvidia.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v9 0/7] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Fri, 13 Nov 2026 14:05:27 -0800
Message-ID: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v8 --> v9
=========
- Rebase onto mm-new as of 11/13/2026
- Fix draining issues raised by Sashiko for 7/7. Drop the lazy drain of
  disabled stock, instead relying on slot ruse, drain_all_stock, or
  CPU hotplug, just like any other stale stock.

INTRODUCTION
============
Memcg keeps a per-CPU stock of precharged pages so that small and
frequent allocations do not walk the page_counter hierarchy every time.
Today, the stock implementation lives in memcontrol code, even though
the operation it caches is a page_counter charge. This makes it
difficult to add new page_counters to a memcg and preserve the fast path
behavior.

This series moves the stock into the page_counter layer.
page_counter_try_charge() consumes the stock, charges a batch to the
hierarchy on a miss, and refills the stock with the surplus. Memcg no
longer manages the stock in try_charge_memcg.

So the stock keeps the existing layout, which is still a per-CPU bank
of 7 slots, each holding a count of precharged pages that it hands out.
It maintains exclusion using local locks on each CPU, and for remote
drains we schedule on the memcg workqueue.

This change gives us the following benefits:
- Separate charge caching (page_counter) from charge policy (memcg).
- Makes it simple to keep stock out of interior cgroups on cgroup v2.
- Prepares for future work for stock improvement, which can now be
  isolated from memcg changes.

With this change, make sure to preserve:
- All locking behavior is unchanged from before.
- Non-leaf cgroups do not hold stock. Specifically, their stock is
  drained when they become a parent, and remaining stock (isolated CPUs,
  concurrent refills, etc.) gets drained just like any stale stock.
- Exact charging for non-spinning callers.
- Stocks only exist for the memory and memsw page_counters as before.
  Other page_counters (swap, v1 kmem, v1 tcpmem, hugetlb_cgroup, dmem)
  don't stock as before.

EFFECT ON CGROUP V2 USERS
=========================
Currently when a cgroup becomes a parent, it doesn't drain the stock.
Rather, it just prevents new charges from accumulating by nature of
parent cgroups not usually having processes. We can do a little better.
When a cgroup becomes a parent, schedule drains right away, in addition
to making sure parents don't accumulate new charges.

Note that it was possible for interior cgroups to use stock before
(reparented objcgs, swapins, etc). We remove those to not strand stock
charge in interior cgroups.

Everything else is preserved. We preserve all draining, refilling,
and (un)charging behavior, including the uncharge path's refills
and direct uncharges.

EFFECT ON CGROUP V1 USERS
=========================
The memory and memsw counters now have separate stocks, which can hit,
evict, and drain independently. Their raw values can therefore drift
apart by the stocked amounts, even though every charge is applied to
both.

To preserve the user-visible property that
memory.usage_in_bytes <= memory.memsw.usage_in_bytes, the memory
value reports the smaller of the two values. Both raw values are already
upper bounds on real usage, so this stays within the fuzz that
usage_in_bytes always had (and this is also already documented, see
section 5.5 usage_in_bytes in Documentation/admin-guide/cgroup-v1/
memory.rst).

TESTING
=======
This series should not have big changes to performance, so I ran some
benchmarks to verify that. I did testing on a 16-CPU, 32G machine VM.
I ran repeated anonymous memory faults and MADV_DONTNEED to measure the
CPU time spent per page. So + number is worse. I ran each experiment
5 times, with 4 workers.

+-----------+-----------+--------------+-------+
|           | base (ns) | patched (ns) | delta |
+-----------+-----------+--------------+-------+
| cgroup v1 |     890.6 |        901.8 | +1.2% |
| cgroup v2 |     893.5 |        902.2 | +1.0% |
+-----------+-----------+--------------+-------+

Joshua Hahn (7):
  mm/memcontrol: flatten try_charge_memcg control flow
  mm/page_counter: introduce per-CPU stock
  mm/page_counter: make page_counter_try_charge() stock-aware
  mm/memcontrol: check PF_MEMALLOC after trying the limits
  mm/memcontrol: move memory stock to page counters
  mm/memcontrol: add stock to the memsw page counter
  mm/memcontrol: restrict memory stock to leaf cgroups on v2

 include/linux/page_counter.h |  35 ++-
 kernel/cgroup/dmem.c         |   2 +-
 mm/hugetlb_cgroup.c          |   2 +-
 mm/memcontrol-v1.c           |  17 +-
 mm/memcontrol.c              | 435 +++++++++++++----------------------
 mm/page_counter.c            | 227 +++++++++++++++++-
 6 files changed, 429 insertions(+), 289 deletions(-)

-- 
2.53.1-Meta


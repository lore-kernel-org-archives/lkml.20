Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160838;
	b=n8h4sXsdGmq6JLX1TCZUN3Wat3KNGUr4sfYqigdMxxAWpXSMBnWzAM2LyT5Bm6LlPyXi
	 3qbYLUNEY4UtbFHYv0LQMEuMAJVYwlemYnmuwrsuHn9RRVgw3PtGe3xFMJhhUcLWa839/
	 /Jk+gOiacnED5zXH7SB0ei9DuH9TaKwEJ7qYxHQVMJF+29ApMsV8SV1GM9AjZghjImx2P
	 C7Vru+JAFJ0bOuyPACCp+zlMrOxTTMvKTncIfnktMI1xosZfE0a5H4I1ceIbKmFVnxNBf
	 Y/JtUQdUb2sjsP8s0OIeWmf+ioY8kSZnHPtNvNZ+b7+3tCMsggCgzx506cBFlIrBT1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160838;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Mime-Version:
	 X-Lms-Return-Path:Content-Transfer-Encoding:To:Content-Type:
	 X-Original-From:Cc:From:Subject:Date:X-Mailer;
	bh=Ufn0FgIJu+3KUWz3Ja9xTt0y5cutm6hq8a8JjEz61Gs=;
	b=GZhhj7yMLCFjxqMyiC8EIj9sdz5WVwfIkvLSG5ZG07yPxgTxwRz2eKvTG9niKcsGBmms
	 V/SUqTIg2qLklQLQPFpr5KQ15oGvfBYdsGOlb9Ph46tbKbCx4mMFDUkLKna37CJo52QAy
	 r+0JfTmQuB2R/Gfw1wicSV6YmxhIE7ZmYB5iMfloYimaDHWQ20cz/mQ/rODcIEFA2sYS6
	 gIrHp+Uo0rs+Leau8Q+uIq6Z3tSZD//ObmzYLTYYbilnzFzOPIA16HQ2dmwalItaVghKN
	 aLvU7wGtLqbPureZfFy1GwGDlxTwCvPuzXDSPQfwHwFMm25hGGw8g5844gRhm3bVWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=QPVr+U0A;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D5606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0D5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=QPVr+U0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793160831; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Ufn0FgIJu+3KUWz3Ja9xTt0y5cutm6hq8a8JjEz61Gs=;
 b=QPVr+U0ANHSlCCAX8olEc2ciXekwax7Kkr/vj4atUOGWVA+dOWxQGoZuiJxcUyvDthqQq3
 LEup4EKSz9FnUrqUTaTbLR2baaXNbD6AelTh+18wnSvsJjiClny4VIt8UpAOfeaYGIELS9
 RpRfi0iIlGTTle4QzucTwM6ycY1+otCjFiHBt2lQVf+mszioWks+B/m51wNemHM/z6tzvK
 OF/TgbxZGts6KwPU4ywCGe8bN1y0bGC5R8RC3Amslxq8bTjj3HflrMQtf/t4jS2LYH2Kkx
 F0xTER+tNqYR28NjSwXCyj/pcJCXpSdR3HMoClWjq2FqmJACupr/wfBxZcXckQ==
Message-Id: <20261028041253.74839-1-lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae1767e+81b04e+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH v2 0/3] sched/numa: refine memory tiering promotion heuristics
Date: Wed, 28 Oct 2026 12:12:50 +0800
X-Mailer: git-send-email 2.45.2

This version narrows the series to memory tiering.  The generic normal
NUMA balancing cleanups and heuristic changes from v1 are not included.

Patch 1 makes the free-space promotion bypass configurable while keeping
the existing eager-promotion behavior as the default.  Disabling the
bypass forces slow-tier promotions through the normal hotness and
rate-limit checks, which helps workloads that intentionally keep part of
their memory on a slow tier avoid short cold bursts refilling the fast
tier.

Patch 2 keeps memory-tiering-only promotion faults out of normal AutoNUMA
task-placement statistics.  Slow-tier NUMA hint faults use the folio
last-cpupid field as access-time metadata, so those faults should not be
interpreted as normal placement feedback.  The patch marks them explicitly
and skips the placement accounting path.

Patch 3 builds on that separation.  Once tiering faults are no longer fed
into task placement stats, tiering-only mode can use tiering-specific
outcomes to tune the scan period: hot feedback speeds scanning up, while
cold, throttled, failed or empty windows slow it down.  This prevents
tiering-only promotion feedback from being handled by the normal placement
heuristic, where repeated promotions can otherwise push the scan period
towards the maximum.

Li Zhe (3):
  sched/numa: make free-space tiering promotion bypass configurable
  sched/numa: do not feed tiering promotions into task placement stats
  sched/numa: fix scan-period adjustment for tiering-only mode

 include/linux/mmzone.h               |   5 +-
 include/linux/sched.h                |  17 ++++
 include/linux/sched/numa_balancing.h |  10 ++
 kernel/sched/debug.c                 |   2 +
 kernel/sched/fair.c                  | 140 +++++++++++++++++++++++++--
 kernel/sched/sched.h                 |   1 +
 mm/memory.c                          |   6 +-
 7 files changed, 168 insertions(+), 13 deletions(-)

---
v1: https://lore.kernel.org/all/20261014094347.99157-1-lizhe.67@bytedance.com/

Changes since v1:
- Dropped the generic normal NUMA balancing patches.
- Added patch 3 to dynamically adjust the scan period in
  memory-tiering-only mode.

-- 
2.20.1

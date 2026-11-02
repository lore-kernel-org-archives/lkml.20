Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599278;
	b=OvjpJKBGx0WUtiQ9Tivbm6SfdCTYFIzvYiULYpaMc8juM6nPTwptdGu1o0mb3r63LJ6L
	 sh4qFJ8w6wF/Y8jLnpeBq9eO9xCqVh0MJBnRueHDnEyeP2Dy0WDhuA57RZQkmoY7tix3p
	 7UQ6oc/aP/k93l6LHiFpjFQ+XloVSGQOroUryly40NzrB+W80WREw8Jjt5TYIopU35wS9
	 ekPPauT9BS2VyDSyL+kCC1wFSKHzZEQ1szMDHpYZiACPAgpBAw8teUGEFqS7PAAVJmOtJ
	 7di3BLSPKYBh0NGDfsUdCmfWHpfwfg8k5cTNmpVQnWydXKgifvqwtKD3XO5T7DbiINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=ou8EB+rPMhnf6RRUAQStNUkip0wMkSd2FjxAyfUCwH4=;
	b=g7B9KtEEkLISRb0wizogYjfHwNGJ+0HgmhFaw5KunXgd4KOOUnoIyjH43qGQSAK07amM
	 W2cKDpVV26dvYerIr/HAuscy3trvYtugmcLJyOBo42sLoDMD4R2mVLaTyN65XHY5sZ5pJ
	 em5l45jJrLY/Xb2ifNVXYrrF9o0IychCw3lNY6XSAI6OH86LDlPW7IUxn0w0WF5qNDlAs
	 Q7mBt+ire3xN/h31vQ7kfl9/dSD569wGAwFo5s9qO07/7wyCz2eoHYBs0yiGbPQJE1sMj
	 cfMI+H3bj64865OjitQTF+vpkHTfAbFdRJHWv/UFjEHqu+H53ICB7N1uXSWT68cnv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAt93oyS;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06666606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06666606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAt93oyS
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so5397986eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793599277; x=1794204077; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ou8EB+rPMhnf6RRUAQStNUkip0wMkSd2FjxAyfUCwH4=;
        b=vAt93oyST0TOWWjaRGac3B2kdtPpouocthcWK1tzbB6OilItbjc5NR+e/q1Q8UWRe+
         PQ+ZbdULCo6loIh9ZVFmQEsQJr9UPlgUylzXc+NnzECjNsfbzic870pEDuTTuxKMDDD/
         UGF7CFd8ViDI8ennlQZ8lPx5Zfp31ELzCOhDZk3B5b8S/V/NJqVHnQKXYBDlzxZ/7zhB
         D3td762eghKIvtZKWYBoQ50EkBdCX9DS2eztcrmpMTeovILV8U1Ywx+8Cp3aAV+Giq/d
         RNEtqlt/Ehb/amxtCaTzHxr8gF1/4/iEuWJmIg/HEILCem6TVIHhaDjQDhdj/fFxRkMP
         8Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599277; x=1794204077;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ou8EB+rPMhnf6RRUAQStNUkip0wMkSd2FjxAyfUCwH4=;
        b=ORwJrYcX1/h3A5XX+LmdaDTlITAIPBPf8YyDhx6tQ+5OiI0hsxR0G6ID9FRRiC3zji
         /fbvd1DdVGE2aKAdA4MovdvaLa8QJNTNQH2gXztE+yZI2bkuhvzycayNTNdIVHQTPt5L
         ETNQ0a9jkfo+wWFp6m8ZSo/0sBZMQ86uqDnN0RQIy0RDgmqaPePTjaRoFV23abEREd5y
         vONf5s1nCOJOeSOdc3PhtAUNZ6GrPiX/T5lAREzubcnalAuQ/VE8IfZe3Oo61cEOWaCm
         S7vIfkDpZT59LYamNC9HCTZg3xHDV6mTFf0r8J+Rc0Uv76JfyEicT7VPGsaOlkCc6MOc
         4gQg==
X-Forwarded-Encrypted: i=1; AKwUvBy9LpK3LnpYYVex6Vtu0/KdWIlYCkCNAvhLxzEZTwOfay2pRsNAz780D1L/rsPsdvxfM9Jt8XIbA8rHl3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSYe4D0QOl0ZVMD5gncIa3nMWE9H4YbzqjWeUtkIRWa1UAOlvD
	qXxjDl6Akza2b2U3WYKmPhB7CJQZfPDGxdI1P3r9V2wTrNiWtjiHwnMX
X-Gm-Gg: AYBFou3v39WLPBgE5j79wA5RXcdYB69KGUYz2eTkF3thlOeBjXlKMw17vhzKaRQs8KI
	MdHeX9RrSwKFyKoLOttQOdV0Eq5uJbRUbu5iIFsvGL+/1JQ9C5hOjBPmao30F081usyY9u8SZTh
	vhimpUrBSlitiyLh6x24bXb6pMFu9fb6/v42sQyCznroXDm1FgYL7W5xLEbpUdsN5U3wekNjMcK
	74Cafrd4XqpLRjeDi733T5/qRrXg3Ww/QJwgs3CaT66PAGgLnLjq3WH+/y8EaPCKiKr+TKu7UcT
	DYm/pNjw4TmL0x88X64K4aN0T9hFoafvJE6pjknROCtho34xRyD34OXku1d9nsSv5R/Y4Fh0vIQ
	myVzEcqTbv3+p0K8AUoFL/YK3Y03TwJK47OWfJCiSBzFkitqs1vOp/tya1oCBw3aGMdwRgJSbvG
	vQeXEf5gxyGjTFtn9NOeE88YgkTZkSYThi/3rp9EcoJy4p9HYSrZqf05Qtd2bzx1mjrLyrifQlB
	b5DB26HR7yM/CB4xHfMhpD9AxrV0Oo2mpMxnI3+dmRCS/GQbcs9WHuIWOgBrJYtyFlvcbCsAgTG
	IWnOTWWgo8fV5BIU//db3/71
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-36a42417707mr13155080eec.30.1793599276780;
        Sun, 01 Nov 2026 22:01:16 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm28755363eec.4.2026.11.01.22.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:01:16 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] mm/compaction: stop repeating failed async
 compaction on every THP fault
Date: Mon, 02 Nov 2026 01:01:06 -0500
Message-Id: <20261102-bug-mm-thp-async-compact-defer-v2-0-b407e974db54@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIn6GoC/42NTQ6CMBBGr0Jm7Zj+gKgr72FYtGWASSw0LRIJ4
 e5WTuDyffny3gaJIlOCe7FBpIUTT2MGdSrADWbsCbnNDEqoixRCon336D3OQ0CT1tGhm3wwbsa
 WOopor1pX0nZWVS1kSYjU8ecIPJvMA6d5iuvRW+Rv/Vu9SBQoZF26+qZ0qcWj94Zf5/yCZt/3L
 1k2+CzMAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Mooncake, the KV cache store used with vLLM and SGLang, backs each
rank's host segment with MADV_HUGEPAGE memory and registers it with
the EFA NIC, which long-term pins it. Its commit c3fa13ecaf10 [1]
reports:

  "under the default local NUMA policy every THP fault on a full node
   runs direct compaction before falling back. With 8 ranks x 190GB
   this made registration take ~38 minutes."

Mooncake now binds the segment MPOL_INTERLEAVE across all allowed
nodes, so that no node fills before the others. That gives up
node-local placement, and a task that sets its own memory policy
still gets the stall.

A THP fault on a MADV_HUGEPAGE VMA tries the local node first, with a
single round of async direct compaction, before falling back to other
nodes. A failed async run is never deferred, so when the free memory
of the local node is scattered between pages that can't be migrated,
such as long-term pins, every 2M fault scans the zone again and fails.
A node that is simply full doesn't pay this: compaction_suitable()
turns compaction away before it scans anything.

Patch 1 splits the deferral state by migration mode. Patch 2 defers
async compaction on its own state after it fails, leaving sync
compaction as it is.

Populating a 4 GiB MADV_HUGEPAGE buffer on a node fragmented by pinned
memory, direct compactions drop from 649-1473 to 9-41 and the time
spent in compaction from 118.6-264.2 ms to 2.6-5.1 ms, with no fewer
THPs on the local node. Details are in patch 2.

[1] https://github.com/kvcache-ai/Mooncake/commit/c3fa13ecaf1038df933dcb784ff8ffe026381100

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Describe the Mooncake report in the cover letter
- Emit mm_compaction_defer_reset for both states (Sashiko)
- Reset the pageblock skip hints only from sync compaction (Sashiko)
- Rebase on v7.4-rc1 and rerun the tests

v1: https://lore.kernel.org/r/20261001-bug-mm-thp-async-compact-defer-v1-0-0174c7923430@gmail.com

---
Qiliang Yuan (2):
      mm/compaction: keep compaction deferral state per migration mode
      mm/compaction: defer failed async direct compaction

 include/linux/mmzone.h            |  7 ++--
 include/trace/events/compaction.h | 27 +++++++------
 mm/compaction.c                   | 82 ++++++++++++++++++++++-----------------
 3 files changed, 66 insertions(+), 50 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261001-bug-mm-thp-async-compact-defer-b83351bfb25d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


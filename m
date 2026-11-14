Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652935;
	b=5raNs8/c+YpmHbClYeFISIUC55Ysy26TeDGjIPFt6Co7JOegwJ9TAeNgx0ok29eeTipx
	 O5chkPn7ub0VwFDgeZXdl3mFA4QCUIKOSMO37Zw19jZIbDEv3F6L6EkAGnxVQ/Sbkh421
	 p/qx67LKP7mE2ZQW7slw89jFnuGZt+P3HyAIG8x8jEBSQCW0KLLqt8ldaDoRP+Xs9+6nf
	 mnhnR9A8W406kB28IxnFFe7oUAiaMl1MD9yDbIRcU941WQAg+i8aRIoTwIrXY87W6lcWF
	 2ZZ1XgkP5vPkhqaMWzUzrlZQ9H7cwUfQmj/25d0ucABVz/aFOFbS6Ak8cyFUjhxJZFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=148aWTr+MJXOnF2cH6V3oulG0+3oXARg0p2xHAe8Uo0=;
	b=fJvheNMh8K+LLigYfOioYCPioLMesfPMCWl/Dgr3PomyYqIlYQ7w2oiY2zVFtj9BirY0
	 zIWoaq786GvlSbRntBIWEhHwQe6C2P2SKLW1eVHljNbjOafWjrP1VyZ2+RMZynzagx01l
	 QbWpXlm7bMgbqM90x6L7jS521baqY6/fazRN+UHW1SSiA9AdXs3yi44C5kcDpQ7Z0d9Lv
	 04SjoHTrve46HR02WKWtcXfJDz4mzagG+Y4geSRDKm9ShqXHZVB4SVtwSI0ejcLrWJkE3
	 AeaRg7xVDWfU7WS04h+xiMy7AibmJOQG1IzZjBzlmMkVCosyfnc04YK+xJcnbuzWxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=khLa5X+C;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0616606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0616606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=khLa5X+C
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so2949383eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794652934; x=1795257734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=148aWTr+MJXOnF2cH6V3oulG0+3oXARg0p2xHAe8Uo0=;
        b=khLa5X+Cs+pk9dBlY2EELfwAoYYfnAjEonbMB2/250t3BJMxuQS2OqrAmPyWuOMBsh
         /yUsLKYAwl3HZqj4HdkPIJakUgjS2I68pEsD3+05vYRnHb1PiaCRkOyA2+X0a1DYy2HH
         LeDn2T7j7dePCKbRFHC3KlPZaVRYNRyhWf5o0xIvBP2RaDeX9dSdCec+2OTllI3XWxQC
         DPVIlCt5h9jlRDbiQntg/N2ai+/FWS4F9SjucSw+QlRM+im6ya8kK1ajWdk+H7LP7udM
         MNG/Ue9hsxhMiO2rRWjn0yQ8MkfNTVTh7BWMsg8s/csLHvCWF/1AmMNro7YgV9r9MImv
         0rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652934; x=1795257734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=148aWTr+MJXOnF2cH6V3oulG0+3oXARg0p2xHAe8Uo0=;
        b=rA6b4sOzm/l/dBBWqunapIprdG9CUZqmJJvMK1EL25NqWFauF9NvWifvlh7+52427E
         OpkLNVK4oUYRS0j11tsX2jdHXH+j+kkHeADGXw79xbZxwEzSVK6/9aIN0qteM3BMn7JF
         dk5jNLeefEUI5C0GU2MN3VTKxgggvAPWFngfWtTjLVFGjfOIgXKN5Rx7WI3+MHcxX1ES
         rmS1YenWwa1Zhlxn0NY8J0xxVLhEaq/79lRSR9VBR7NqGShgRkFyzQG7sQkbogjuJgrX
         qxDRe0EH9iANFDAA3Fa7aYhrKEIcOY9C6VnSTM3Zdn29yh71At6i8py1cr+TRs1W+Xo3
         5b9Q==
X-Forwarded-Encrypted: i=1; AL+hErH+24iwiKga5nx7R1QvZlGOvqxvq0Xcu+75wcelLukK629gkU3DT610UCAA7SirXSV6dRn+vCV2/XJ1JeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3sFtTIj7LWAT/ihC6IQ+3cpdCXjj/bv2lWVORmAKrxMG9hTf3
	MqnKzbf7YpKNW9js0NgBzlPDnr3yuSRq2183PoX4a5uaZjeJ9wpjOGGvV0y6LZiJWPg=
X-Gm-Gg: AYBFou0jAI+EGcy2+G4kHQxHlbi1yzzltMtgnZIwISGacm2aI/yyuPwAO7kjbW++pl3
	OuoIowiwyzjvQ3YjsnV2PQaNI8tPQLyVyiV9wjPikoA8P8EdvkNllJGV4qrLPB51b/FxdL9Oj9v
	ghhYo6/J65D4MRrNsj8F7PZP1+x8NucCE8MlM+rwfOLGwDYi8qywmtb9Y2ByR5tDxvBI4B0fOpJ
	Oz7sA3Ol+gQotSHUXNXJT3VmURhPCAIP8CYNtD9qZ6CanmrETRQySKSE778dTRAqFILFk9i3uWv
	G9Ji76SRiab/BNzR3EL25scOFyTmTMWHzzQGkNlQMkyNSSgbRzGPKHIXjYwDBZpaJqJw0ZjFmRg
	1SQSeiAoXUdYLCYJvaMYTL25FymaQQy76tc9eKr8eVW3ozk8JrUixP/DPvkPjSafrtDO8c7oYpi
	OgmI3+O/z5dJhQkPCU+gWac0/v4/bhRDZE6Hg/56s6FVUniKfpNmRHARLfq5ml/ilY2BbnINqYK
	Y/DPqlIWiUJcovmu/bLxBrimPZLLzXdyILCq4+kBfLsgK3dEMdzDAbdiDP2AuepYDSFwi+siw6S
	mJP1Z3OZDoM0Un/kd9NoY0XoO09Hzr+Gv7jBNbea/S9tSno9d05LXRp1Gtl18HtjQJUpba9XrlK
	URUb9pg==
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr1864427eec.14.1794652933413;
        Sat, 14 Nov 2026 02:42:13 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm15772917eec.7.2026.11.14.02.42.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 02:42:12 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Mostafa Saleh <smostafa@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Usama Arif <usama.arif@bytedance.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/3] KMSAN: Move per-page metadata out of struct page
Date: Sat, 14 Nov 2026 18:41:46 +0800
Message-ID: <20261114104150.58424-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This series fixes a KMSAN metadata-loss bug triggered when boot-time
gigantic HugeTLB pages initialize their page descriptors after
kmsan_init_shadow(). KMSAN currently stores each page's shadow and origin
pointers in struct page, so the later descriptor initialization loses the
metadata mappings and leaks their backing pages.

Preserving the pointers around __init_single_page() would either add
KMSAN-specific save and restore logic to the HugeTLB loop or make the
generic memmap initializer retain sanitizer-private state. Moving
kmsan_init_shadow() after HugeTLB setup is not viable either. Its metadata
comes from memblock, while gigantic page descriptors are initialized later
in page_alloc_init_late(), after memblock teardown and after the KMSAN
runtime is enabled.

Moving the metadata to page_ext is therefore part of the fix, not a
standalone refactoring. page_ext storage is independent of struct page
contents, so later descriptor initialization cannot erase the metadata and
the HugeTLB and generic memmap paths remain unaware of KMSAN.

The first two patches provide the metadata-access and early-allocation
groundwork; the final patch moves the metadata to page_ext.

Muchun Song (3):
  kmsan: encapsulate per-page metadata access
  mm/page_ext: support early allocation for SPARSEMEM
  kmsan: fix metadata loss during HugeTLB struct page reinitialization

 include/linux/kmsan.h    |   3 +
 include/linux/mm_types.h |  12 ----
 include/linux/page_ext.h |  27 +++-----
 lib/Kconfig.kmsan        |   1 +
 mm/Makefile              |   8 +++
 mm/kmsan/shadow.c        | 120 +++++++++++++++++++++++++---------
 mm/mm_init.c             |  11 +---
 mm/page_ext.c            | 136 ++++++++++++++++++++++++++++++---------
 8 files changed, 219 insertions(+), 99 deletions(-)


base-commit: 6ec534d64f85e949a5d58070678dcd7711875a7c
-- 
2.54.0


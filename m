Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464092;
	b=FTREwsPWwfeJOCaw+QQh2mFKQ7r2EWtZYlWtRR+PHeOJXcIZtnJh3SO5BQruEjRTyBSE
	 dn4x481S4vik+o0OmY20ynAkD2qUAxnMBAdbY3ru7HS178GUJgI3+8j1z/T4edA4TZ6NF
	 Cmm8LzlELeUJyb0429ShtMLqtQBreQM/AbhZnettIVZTWqKCm51jExB8zKvDBmvdCDzyC
	 +cKHRuD+43hFvRDagW4x3RW6vgizgQLFFJzwE5zqLN+w41WWdu9cbqm0IkciGLKxmBOa9
	 QvUyykgyUwojgKlwt197z2YNMz32K4uKYz6W86opEKKnO1qDpGxGMmYe9tOh5Y0+drg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ROppqsELXHGeGLcCYxsSX2/ig91E8qLeW9utj4B4bq4=;
	b=aYpI0eFuPbDEnUFzYWKw6vXbdcOsZYyssDwbdgztCH3H1Q5XY3oeciwn3aSTJXLBF0sr
	 l0f+EZY6hn1ci46re2CIfcs2Qx6BLandPeQ+wzKP8Ri11ijO9fLRxkR/Q6SsX3zAqxwks
	 BJvYGqDrC+RBPfDgSiad3AEtFCHccBThyOvH492TScUTmskGUxZUq4akfTgCZGXgmuvf/
	 zUdCI5mbnWClNAzqtUM8s4HLcTd5WFx7vdiPyS3tnI4rQxlOPo9UytX6xVcuLhXLb8nh8
	 b6kl/pN/fng+qsdcUhad8GsS9tXL0fqWrupOoN6lhIv2LwfWOkBFydQpnBH/KsfluWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n2+yKnQA;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E9C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E9C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n2+yKnQA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo1758383eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464092; x=1793068892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROppqsELXHGeGLcCYxsSX2/ig91E8qLeW9utj4B4bq4=;
        b=n2+yKnQA6lsbw+FYDcVL6Vr5n2JrEUCBBUKfmIDzmsFo7T+vYE22VYZEVb8o1P7uTU
         iYzniSM2EReWW/JY+Jf3OCjQFs0z6EJFH5m1eZQzynMBnqIDFpreI+hIdkdQE+GGWBQA
         kHBtyWAVjibfV0FCpav99yWu3AlIl4jN34i7EMcprwU5nmw8+ML/C68WZllNNi8hOl7e
         GxRcYuWZgC7cFHxUUd181ScPDj8hmYe9r2/YRUp5VkMrdzILhKn6PaUr91vtqFNazGPD
         sBh3PS0Z/E+okhvn/REpxD2VYPnIWsOsDhJfKvUUTybCftBvJDtG56wZSA4YRvAE2RXS
         AFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464092; x=1793068892;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROppqsELXHGeGLcCYxsSX2/ig91E8qLeW9utj4B4bq4=;
        b=rBw98Qr/o5tyB4f+z92IFQ6xXtGTIkk5Hm1pRbpI/fnoNWnzepgE3qpd4owiW2qNYz
         yaMs1wJ92+1QmRamogmkdmHbE1NaILknOQgZuChtBZrSJl6ZjvpXvhvq/q1RnJ3lcWId
         wCqBXO7UHQtyzF6A4HZpC8UTMM0l1zJpJyN+addt0d3pEmGNeRzyWNw6Rxmg4ZNH38+h
         AiLvSzYpwYirSEWmErIVprIA0GpJvxq9bVUlidNDQYC0t2+cHxPmAtAyW4J8V+LEkH77
         XBAqDGYCybYbD5aM+2nuyuHcP+x/Bp2NPQuxQJrEXItPV4bbVDLWhoIBvfVy6ipbXJGa
         cmaA==
X-Forwarded-Encrypted: i=1; AKwUvBzpJ224RavGPyPu9XFYrfLlzzjncZJ8uNePbGCswazGZjgkYJYcdQXhWGzl/WHinI5rjxJALAfera62uPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTnNmKlm0wkDlitIv58J3fcrwKrJnSwFXMp1FKmr3yrFV3ybEs
	0oxPYyYN3BFxpthONU1vbWBAGuSLkSrpAFZxlJFPqWk3p9SRitE775zq
X-Gm-Gg: AYBFou00cEDvFmEKu2OcTtWx96Wy2rinbEt2PvfDa1ZTTtk+G98wPhYuX8k95xdo82N
	Z/vgtX4FUe5W+vD9EYPWJ3KyhFCOG1l/JilUDeNDX9A5h2Jfev6mpJCO1zEQ+oXUnL8tsGZOZER
	La2UjTNkRFgbnGSP3oHs0r8d2ArHe3i9gk5ad3Hy7WMLHaq8R1LJL9UtXudLO43qQMmmD3UWlQu
	s680FkgvwvxVRlOE9W3Uln0TaCndbg158mq2XhK4GW2Y2BkCtSbvdgC8hKl/sENqisC8oRUjz8S
	vBWem7GxVdLL/AQ+z2zfpFyAUw0EcWk7vQaY6SDqOiGWy1HWwXC6L5DszYnxQ3UjEOaf7YJoEHY
	ocKBLoRyfXBc/8IWglQgg2DYVCpb92lM7gUWIMEaSUvd+ivkjv0YKvmFouw/iVM4Q2T7LeA7h12
	B/h5UmFbYftyM76N4FcmjnjspsQI3m4zGkubBsamtAOjCU6lqrnvW6ddmn2kTXykAG1Lh/IggEG
	tADj+sjieg1caYeSaBXYevtNgkS3wVWKrhg24mGvXjapxHIp1P9YztR9ba/OUZ3
X-Received: by 2002:a05:693c:62dc:b0:366:6644:2839 with SMTP id 5a478bee46e88-3666644361bmr61423eec.3.1792464091268;
        Mon, 19 Oct 2026 19:41:31 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36632d8b273sm1116057eec.15.2026.10.19.19.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:41:30 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Nico Pache <nico.pache@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: khugepaged selftest: intermittent collapse_full(madvise:anon) failure and low-memory false failures on arm64 64K
Date: Tue, 20 Oct 2026 10:41:16 +0800
Message-ID: <20261020024116.2949892-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I ran the khugepaged selftest (as of linux-next 20261019, tip 3d229ce89862,
which includes Kiryl's "run every supported collapse order by default"
series) across several QEMU configurations while setting up a test
environment for mTHP collapse work. Two observations that may be worth
acting on; full logs available on request.

Environment: QEMU virt, cortex-a76, 2 CPUs, khugepaged test run from a
statically linked binary inside a busybox initramfs (no distro userspace).

1. Intermittent collapse_full(madvise:anon) failure on arm64 64K pages
---------------------------------------------------------------------
With 6G of guest memory (so order-13 PMD folios are allocatable), over 7
complete runs I saw one failure:

  # Run test: collapse_full (madvise:anon)
  # Collapse multiple fully populated PTE table... Fail: Bad return value
  not ok 80 collapse_full

The other 6 runs were fully green (102 pass / 0 fail / 3 skip each). The
failing run did not report an allocation failure or OOM in the kernel log.
A minimal probe (mmap 512M, memset, single MADV_COLLAPSE) succeeds
deterministically on the same setup, so the failure seems specific to the
test's sequence rather than a plain allocation shortfall.

This is the same symptom family as bddffa2f9cbf ("kselftest: mm: fix
intermittent failure khugepaged test") — there may be a residual flaky
spot on 64K-page configurations. I was not able to reproduce it
deterministically; happy to run more instrumented iterations if that
would help.

2. Low-memory runs fail without a skip guard
--------------------------------------------
With 2G of guest memory, six cases fail outright (starting with
"Allocate huge page on fault... Fail") because an order-13 (512M) folio
cannot be allocated. collapse_compound_extreme() already skips itself
with "PMD too large for fault-time THP construction" on this
configuration; the PMD-order cases have no equivalent protection, so a
low-memory or fragmentation-heavy environment reports what looks like
kernel bugs rather than resource limitations.

A skip guard along the lines of "cannot allocate a PMD-order folio even
before the test proper — skipping" (or a documented minimum memory
requirement) would make the suite's results readable on such setups.

3. Confirmed skips on 64K (for the coverage ledger)
---------------------------------------------------
  ok 9   # SKIP collapse_order_mixed_sources: no supported source order below target
  ok 91/92 # SKIP collapse_compound_extreme: PMD too large for fault-time THP construction

These match the gaps noted in the v6 cover letter.

Baseline for comparison: x86-64 4K with a swap device attached is fully
green (76 pass / 0 fail / 1 skip — the mixed_sources skip).

Assisted-by: LLM (QEMU test harness)

-- 
Zhijian Han <hanzhijian1991@gmail.com>


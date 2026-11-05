Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854081;
	b=Jx2Yqxf6mcU/kafXfh75NvrEAfchPzYocx43yr+vuvryY8ToPyfhcHLJOwimlnFcHn6B
	 fCM8ebn2BX3hdmrWA1Q0fD+xMlm8SJUgcdAHmLzayouJ1xxEz2PDZKyA5Nvycm1cxYXod
	 Tyu7pZwRnO/Bdxz2HamZm7e5v2aEVHI8CuZ36ugVAALzjKFv6c25dJKH0Us519pBXz9uN
	 kIBQqSZIM3dH/x2ZQnI+Kc7eUpdKvEexyxYowJqZNQM9s+lK1suvqLBq6xga22GApoult
	 xiWVvr8aAaEgFJY5qNHFXZPEJRcSJHeoBRhDlxhF5f9QXvj46xtueKYmOc6zJs8MC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZ/laB7EjjzlJibu0SL3xlybjiUy40ADVZ8qce7qfBM=;
	b=DN+tFUO+fi7M4MQqcEL3/OBYABU5vbe4JlUJj6hPBrqRxROar1u+4V0ReBx09BxnOpep
	 p8Fnmn/RDEuBzTWi6nYZ6CIfa8NmeBwyYDj7N1tBzj3mlgf9QqS/fufCjAZne6DSELDnt
	 CFLyAedAbvjitbpFxa29nTIfCLZcmRARqVU3wPOpFwrT1t8I33XMDVYXQZ2pmLotCsJBU
	 HKuL02m/f8orN8mL42dl7WIhLmFTlS0+6oYMhXT+IrF+OBGtRazV7JZXPjwAY9YbU+1GI
	 c8GhXT9vCLbJDx+tjCigsv787o2U43UqQVLfekHS3dAnLAaPp/S8wclzF5zdwsNh85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RENQGIw2;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4085606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4085606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RENQGIw2
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so2042982c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793854080; x=1794458880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZ/laB7EjjzlJibu0SL3xlybjiUy40ADVZ8qce7qfBM=;
        b=RENQGIw2fXdz6cwkqBmrWSEx1sJ+69oy4zRqKse3yHtWwoIvjbpFfUkE/9rfqe8J2C
         Ez5XEsLPw1/JNyZBNDhMstsxWTsKdyFk5iEAMqB7NSQzZ6lK5AKWOLOxS5+1krdU2VYj
         ++OEvP2me0A64Gi8r4CB8KTwyTd0RdueKyPZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854080; x=1794458880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZ/laB7EjjzlJibu0SL3xlybjiUy40ADVZ8qce7qfBM=;
        b=ox+9oQHGiPzS9k3mboeGZ6py20ruf6mBJ/wsi85QYxxfo+/SQ5yi9YhVU//5uvWD6Y
         3BZhWtFjB5FsRup95aUKeRmTtlrs7/NW4fh3Zo+eBk6CPm5bd/8S92AfxYQrwipuoXbk
         yMPmZ+aH5Ct7j7Pv1JN9sV6FMck+9phrbD25FrophTsjgqI5uRAYbdKQqkXd7f08bkKe
         PAtq/MEqRku9wJFBBD79+LUE9MPwRlZ7+PdmYeQq8mmbCajrjezlqH97YNZtYuo6oQTH
         hTJbQFvr0KmoYoDHX+XxFAZ9ZeQ/GjJmqnKr/LVAiXEnXWIBUzABiAWZtg1xyooIhURv
         q4bw==
X-Forwarded-Encrypted: i=1; AKwUvBylPLFbWjeFU254hEJLS9dMWCGSL4xAA4En8UyvQkbCMw//UTfE86slI3YY12+5/Qkw6yptk80UTQb7Ncw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OnK+GITSpd8P9M3V7iP8Q3OUCagjthW+KkHh/e75lwWbhxH9P
	dH8Q0qkIJ+tf2czqD6rbXSsihggXZDS9HJ0FedS2mSbZG3MFsCxgXiNAmeUPKkSMQg==
X-Gm-Gg: AYBFou1DGT4MbfpzsYopAF67qg8683doXYnj13BEp/ogD+TxD3qDWggR/F2aYACGKny
	DpMmbD1yE+/u6aL7v6RHg8NzX5bMzKQMVaqcTk2efBI+R1W2PzwqWygYioQZA807vasbqNezFZ7
	JoTXr3JBS2pB+WfFUDxw/62o/kM9YuyaYK3SNucgbBWG5G0ZW0SJOZWtjGk2UmrDxrHhNRXwh8x
	KfWYgG7Ud7xmd48ShrlDYKoEX94mjkrPz/ZFYoWyLj7EhR4MzFw6yjLKw+F7i6XkNl8kYiDlXsb
	lT/xidfMNHoxEU69n50pXJo1XcxDj1HydJvQvy2zapu7jxx93526UOgshX6uVqNjdR0zIkKeOmM
	yO3sI3OvIfcWlxwGHhO42j0uQU8gbfoa5p0BUXnv3ZDT9LcNgFD7pV2hhY0PLyrLGXDEwzqnorN
	vcjJPFQSy/NglP9X70G0GQinljKIhm/dtWbbaybfI1H9nz+h9Tx8C+wUke/mIYKgABtIN07xY9+
	L3xiJ2Ju5B0IOlSO9+8be66MPkHi3MYrV2G/qWsANAyE6RC8kyhOp3IlS0WcRqaxmJEtzpi2QHI
	UiTujYPejCkbtqG2c4H7+LWFo4RWQcYt8B8k4YZrhqyWWXSEK3YRgs26fQzNkADXxfr754XIrOn
	UBd1aVZYXezQS7f+ZDQ==
X-Received: by 2002:a05:701b:4192:10b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1ac5c8369cbmr26358050c88.17.1793854079724;
        Wed, 04 Nov 2026 20:47:59 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm17142927c88.21.2026.11.04.20.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:47:59 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 0/7] zsmalloc: redesign object alloc API
Date: Thu,  5 Nov 2026 13:47:30 +0900
Message-ID: <20261105044752.1997895-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

Both zram and zswap already have per-entry structures that store zsmalloc
handles, so allocating a separate handle_cachep object per stored page is
redundant.  This series embeds struct zs_handle directly into zram and
zswap entries and drops handle_cachep, saving 8 bytes and a slab
alloc/free per stored object (2MB per 1GB of swapped out 4K pages).

It also folds zs_malloc() and zs_obj_write() into zs_store() so we don't
take pool->lock and look up object location again right after allocation.

A simple zram test on a 24-vCPU VM
==================================
165 fewer kernel instructions and 0.7-1.8% fewer kernel cycles per write;
lz4 single writer +2.3% IOPS / -2.6% average latency;
24 writers +0.9-+1.0% IOPS; no regressions.
Memory: 8 bytes less per stored page.

Sergey Senozhatsky (7):
  zram: drop stale comment in write_incompressible_page()
  zram: drop get_slot_handle() and set_slot_handle()
  zsmalloc: switch handle type to struct zs_handle
  zram: allocate zsmalloc object under slot lock
  zsmalloc: embed struct zs_handle into zram and zswap entries
  zsmalloc: fold zs_obj_write() into zs_store()
  zsmalloc: constify struct zs_handle pointer in read-only functions

 Documentation/admin-guide/mm/slab.rst        |   2 +-
 Documentation/core-api/memory-allocation.rst |   2 +-
 Documentation/mm/zsmalloc.rst                |   8 +-
 drivers/block/zram/Kconfig                   |   1 +
 drivers/block/zram/zram_drv.c                | 130 +++++-------
 drivers/block/zram/zram_drv.h                |  10 +-
 include/linux/zsmalloc.h                     |  37 +++-
 mm/Kconfig                                   |   3 +
 mm/zsmalloc.c                                | 204 +++++++++++--------
 mm/zswap.c                                   |  21 +-
 10 files changed, 229 insertions(+), 189 deletions(-)

-- 
2.56.0.398.g882cbad275-goog


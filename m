Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F27C3F107A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090463; cv=none; b=BtBjZ1lzQ5+am5ukcD2w+3aECliarXbh3SxQ8V2G/RWmQYTgGAUcAXnQ0Sns3hx4Hw3GotiUHih7MDyW5nBz9k6oDXCj3O4EVMkecFq66iIubXY2qWvm90F/+KPE19CEuWxPhaY+398uyLp6WNVYP5UnVC5rgOs842MmW+8IYuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090463; c=relaxed/simple;
	bh=99V+zqItZ6fU/7uCTUz10R0iljjlgX1UiQsjH//wRws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slXBsHgs1BAhy1wlkfWJO9/iSQZCbbn+xPqgqR62E9tT3OtKdYY2hT8Z24caCjMuE0ty47nLZE7g+JR7q5KeMvnZvhS+szqJiwEcUK6/MQPOnoKvI6VUqpF2SkxSM9RHaNm1YT3gosL8gKhjbc7oX7KVHH+tiX7AbWe0MnqSgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIKKCKEJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIKKCKEJ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so1997729a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788090462; x=1788695262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEcSXHEg8tyfxyhWOxmAF9EFu/jiyVD3VTzwPGOzoO4=;
        b=TIKKCKEJbgQMCOrfLMx2Fx6mLZJeizm2cRUz65cG2Hz2h227Myfcio6XnFJ4EbZZlt
         4+DTcFIl5bGi/JL4N+/H26TPRQ0CN9T/0yJWq5ESp/vKKijewj6ADUap7a83sUK/g05U
         x3RRLvSQPrGh6KcaTlqhLLLQ3JJBPvkKbaKWVt+JpXu+3bJOY+P4IZ5emtCCS8Q9/loQ
         DhN6m63v8NjP8j7aHDxj7V6nKqefASKtRTCYqKdLBk+W7xnaglUkY4bkZG1mSEHW4/sc
         XLC+TAtdWrrUdT+VoT2/wU4n6RlqElsaZz6xeT+uLh7V4RGBRn23RRVLs/5GKieYTwzY
         ciWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788090462; x=1788695262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEcSXHEg8tyfxyhWOxmAF9EFu/jiyVD3VTzwPGOzoO4=;
        b=m0QAOuA9cbrt5w4VSspCUfTuFJW15NAo3pBUqQZgdEitPu2lk1yRcM+kaNM+XVYSBS
         BZBjhvGxFX0pXTFOoZEAo5JvYoWqDo63LZiiaUZ9cAiEl0FS4YT8BN8QObYol2ZZDwXm
         qx9V46VZcrLIK0LK1hjM3rlZE/bIqH66stkOu1jCVdvyVwZGPw6cxuwKBY0alueYecys
         AQflPy2OIWZgCyoi8kmtp62lBU/NUELa0FAFups5zyzOXZGuZ76GIoozqXk6xGsDm+i9
         z/AOvLbDNExrdgbr4xTtsrFthsnac8brW6lXPmqaLhbOA60O4w0pj7C8rAyjnZhJagnY
         hhyg==
X-Forwarded-Encrypted: i=1; AHgh+RrhL4qk6k1f8+ssaK3Q81T7zjwPKYkSB8JqHN1RSFSzgKKpjKOjp15ToktkxS3iYeR7BIYq7j06ZudDhNU=@vger.kernel.org
X-Gm-Message-State: AFuF++ngFOkWz9KcnBkan0lb4wRi3i+gzG0smfEdA5TdVzfE3eYo+nU3
	UovywmuqrvYzNmvpSrRTBhhvS0muHix0Eg19D98J42Go94oncAy/l154
X-Gm-Gg: AR+sD12/h+dNmYzY+XB6doRwkBI4cXH/x5852yhkbD1+O8OgP0Y6LGlAQjomQj+Krqy
	5fuq7cKNEBT8kzmnBF6KWAlAZeUOKQrlTcQ92t85pwL389dX5G9ih+6ZsJVQuuXIrcFpJjg8UoO
	tLbNfmFnpSJSi0XJ+HvWbR9ceXOVZpzeKtvPZSDTDql0HzpK++2jongG8lIF5NSNPb6L1ZPLyiA
	7WYmNTFzTrPRF1FVHqJQczzSinjGz2hCAv9wG5aaTc9q7SiRvhSqYzsXchShWo8YAeR27rV/Foq
	m1LEozfsQT8Q4ctVQjG1o+1+2FMHDDFdbuYvWftIWchMMfOl/0QT/p4O4PN9519NDMmxYphaCN+
	wDACT+ewRI+RA3b65C+pQRoI1Dw5iMI64N2Sk7Miv+LO4id1YxAOqbK9B3vRWVk0Anyomf+e/Ju
	K/Tx2abiHitvjVxwwPkuJUXj3KNGji4w9u4mh+0LZm0pU5yIfZhpzKdHAGHEPZD+D+M46aJQxyb
	8A5+rZByN1QOXYzrMOvRrrgDhxEeaaqCh2n4u0=
X-Received: by 2002:a05:6a00:21cf:b0:857:73e2:910a with SMTP id d2e1a72fcca58-85773e29338mr16243231b3a.26.1788090461814;
        Sun, 30 Aug 2026 04:47:41 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([2409:8929:a7b:121:d0e3:2a32:8ea7:5ade])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397c0a7sm2395264b3a.49.2026.08.30.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:47:41 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jianyue Wu <wujianyue000@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 0/3] mm/zswap: shrink zswap_entry via a fixed pool index
Date: Sun, 30 Aug 2026 19:47:28 +0800
Message-ID: <20260830114731.8322-1-wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every stored page has a struct zswap_entry, so its size is pure per-page
overhead.  On x86_64 it is currently 56 bytes, of which 8 bytes are a
pointer to the owning zswap_pool.

Only a handful of pools are ever live: a new pool is created only when
the compressor is (re)set, and pools are reused across compressor
switches.  That makes a per-entry pool pointer more expensive than it
needs to be, and the RCU list that currently tracks pools is more
machinery than this needs once each pool already has a stable slot.

This series:

  1. Releases retired pools with queue_rcu_work() instead of
     synchronize_rcu() so the last put no longer blocks on an RCU grace
     period.
  2. Replaces the zswap_pools list with a fixed ZSWAP_MAX_POOLS (16)
     array and a separate RCU-protected current-pool pointer, giving
     each pool a stable slot index.  Slot 0 is left unused, and pool
     creation publishes the fully constructed pool directly into a free
     slot.
  3. Stores that u8 slot index in each zswap_entry instead of the pool
     pointer.  The u8 fits in padding after the bool referenced field,
     so the entry shrinks from 56 to 48 bytes on x86_64 (~2MiB of
     metadata saved per 1GiB of data held in zswap).

Runtime compressor switching is preserved, but the fixed array now
bounds the number of simultaneously live distinct compressor pools to 15
(slot 0 is reserved).  If all usable slots are full, creating a pool for
another compressor fails and the compressor switch is rejected.

Benchmark (x86_64, compressor=lzo, MADV_PAGEOUT store + fault-in load):

  - zswap_entry object_size: 56 -> 48 bytes
  - e2e store+load median latency: no measurable regression vs baseline
    at matched stored_delta

The extra cost per store/free/decompress is one array-index load
instead of a pointer dereference.  With a single (or few) live pool(s)
that does not show up against (de)compression.

Testing
=======

- sizeof_check: 56 -> 48 bytes on x86_64
- Boot with DEBUG_ATOMIC_SLEEP + lockdep/PROVE_RCU + KASAN:
  zswap store/load and compressor switch (retire + reuse) pass

This series is based on akpm/mm-unstable as of 2026-08-30
(42d64d4fef83).

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Changes since RFC v3:
  - Retire pools with queue_rcu_work() instead of call_rcu().
  - Queue the deferred RCU release work on system_percpu_wq.
  - Use rcu_dereference_check() with entry->pool_idx != 0 in
    zswap_entry_pool() instead of rcu_dereference_protected().
  - Simplify pool-slot publishing after confirming compressor parameter
    updates are serialized by the module parameter lock.

Link: https://lore.kernel.org/all/20260815-shrink_zswap_entry_0815_v2-v3-3-0171bd86a667@gmail.com/
Link: https://lore.kernel.org/all/20260731-shrink_zswap_entry_v2-0-0-v2-0-e72083aa8734@gmail.com/
Link: https://lore.kernel.org/all/20260726-shrink_zswap_entry_v1-0-0-v1-1-30957e4d0cb6@gmail.com/

Jianyue Wu (3):
  mm/zswap: release retired pools via queue_rcu_work() instead of
    synchronize_rcu()
  mm/zswap: replace the zswap_pools list with a fixed pools array
  mm/zswap: reference the pool by index to shrink struct zswap_entry

 mm/zswap.c | 140 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 101 insertions(+), 39 deletions(-)


base-commit: 42d64d4fef83a241c919c8693fdf0a21b2cb6061
-- 
2.43.0


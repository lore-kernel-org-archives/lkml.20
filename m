Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218874;
	b=19j47pgDkKfQBeTaoaoG73KahMRj2v1mXMlwv+asY0ysDTF18Q+BBh35gUtd/NS34Uif
	 +nBHloydPj04ea/vgO2Q32ouatJ22hPCTSIpCYopefYlrZcVouQnqABniaNZtJo2pGCdi
	 FiJ8K5pu9h1aGTkKxORRot6j+BxB5VCZXFKRN3HejuKPe2He7jQ1iUFRemGmdZ3t9ORi1
	 QtlJGrautBCOkAZqcYRXbLAt9IdKhhaH4cT/1ZBX0ovseo9RIZEX8wV7j6jx13h1ZgRGx
	 EADd3+WyVDJ48Lzmk8YgAyuKkeqoZIwApNmvHfkBrjAwQh8RI5b01AiEc/I7ImuUOzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References;
	bh=om8tdBMSIgCokEYF5704NEkqNK3MfST8p47zx4fkZms=;
	b=L6Qdb7qqkMNqTKOZYwCkbjnbbfhebRQFjELIcQmFl2JkE1WrpUuxkIWtHP9v1sCLGMjE
	 WJAUkszIXC6nCLEVsbvqqWU5/GGI8E85o7XoI31xkUDhDwnIBTZe0etk5891IXyWNzKT6
	 /UWTESAr+VwWLfazjiEhQcsYymNyHOjInDJIABEkFIHQ95JOi904MGLzM6TH2lwBS+zpn
	 pN+69oIGL8huIIqhFuyhh/lz48gaZ0rOP4pnM7mvdbLDGlRlkBjr13cp2b/VkMa5ghEub
	 kFzD6sf/rpfIP1OzdjoNOJYGcdRTcUByA2ugF1qYMVTkn/rIFwQ0ni/6PWPjILDVJFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpkoAJKz;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF666606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF666606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpkoAJKz
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so324023a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218873; x=1794823673; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=om8tdBMSIgCokEYF5704NEkqNK3MfST8p47zx4fkZms=;
        b=kpkoAJKzvFfzZWas09VUhTVQbKE6mMVHk7VYyT4No3RzCxcp4sVNimwy0AyQDM28sp
         cqmK/yGpv9hWnwAZDWLsHp0IFjVnX/ApP7MlXDPRoSQdd5kDpggGgE0GtVLFEbS0D5xk
         6LyczAtegNxWS6GMsk2+IsAyEfoHzZY5Kawsjx5kga3fWdLjLN3FPou51j1drws8/Uz3
         l0Ns6Lw+V0cj2HUBFV+in3YbBvTqnkLGfQ9Knij5eGFGM73H6Cqv2J9xSo8Mwy8nIZJ8
         fJe+Jh5nzQyuzUvZH7A9VSXOyVDCbA6iogszClRl8z5ecI2nJXeiNXhOW/zIoozOBU+o
         abOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218873; x=1794823673;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=om8tdBMSIgCokEYF5704NEkqNK3MfST8p47zx4fkZms=;
        b=kbef6pvGD8C2roNKjZPegTvipswAFOsVRP8xsOBP7Q5NG/6FmT4QJOrGxoQcwe1YEf
         LNznVivSDYm4Cbz3d3jJqZuYrblewt6psUbPA/q633zK/L3KAIPzC4s640D8qHmcrEaN
         FcyGiLVnJz0yhJ0PuRmp9IwhiazdbBKMVYwTfDE6n9w/NmZTzNTd2fPbCRs6D3T9dGmG
         OFiuZoAQrPyvKyZQqVqaxOBvFhcWm0qX0aeg+8Xw39K0BWDsAWcLfZpmb2w5i9UltAnx
         V+h7jdurm6K4/Aw3Lr4TkGisDBkN8hE7Hr5tKdpVU/a/aSqEqnTroQud3jblo4kKPiuD
         FVxA==
X-Forwarded-Encrypted: i=1; AL+hErHu/L46SrGHUjtCXNtQbNk33AvXpgIoIqP3XF6tpfDFveOwur3rWjMoLW3dO4X3GNHJicO9GYaGUfHbdWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qINazhkokzsGxlj/Ns+DorutZEQmDpeIFfnH/jw+nFM/eTYKY
	HLHP119vfLt5+v0HKd+WxhV4Et7515JssIalD9jMiT7NQ1IWSKjKVJdB
X-Gm-Gg: AYBFou2oG+4tmsODPzmVcJTq4L84ZDVO6xFm2bCpf/qCW1+JYZJzPkeCaoGN3WzmVa0
	P1uGcXJo8PW96dgBqmsMdIa0P4w67TM+59Ivo3vgvlF1tMFvvz/voz8lgCg+5NREBKQWDT0hn8a
	oXsqj1S6dazw2rH1QEuT2jboh6tXwjG83sJI8mADFFAmYGPDN0L/DoDQHOLQKxitkwfACZ2ybK2
	25+jU9EBbHjUWTO2dKxwhjEOPCLq9BasBcsUu9gW9JnqwXZ8vUV1a9O6lbhlM2b+zn/JTtsMs5q
	Bt0D0XR5Ygxf0EMIK/933x9VUjJ15KRj0uOpUicCij/93ZQxSDUeVFZQriVXj5phJDB9nMdDcKX
	JRXkcyTE1rTorbxItqaiwPwa/BYE6SDEEJBB+wHON5KqMjadA8DPpILCxlCb19ZVnSzDlIH4zZr
	xqSJMXQS8Z/Iftkk2hK7bWA0gD9zVqKwRWFlaHr2cnUy8ZL9LVh/OowN7KQxKknifDnKM9EGQsU
	K6K1+IgOcl/bRWpKFZDWbWloscJMpHqlgmvdVpGfApybYdAFw8W7lHVHPfILHoVyLM5WdGKhMdF
	QXuuR49w/vY8H6msMbtd39BsPTV+UyiWqH/ubg==
X-Received: by 2002:a17:90b:3d86:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b12d441c8dmr2831006a91.45.1794218873254;
        Mon, 09 Nov 2026 02:07:53 -0800 (PST)
Received: from [58.206.202.11] ([104.28.215.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm6303578a91.6.2026.11.09.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:52 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Haoran Wang <haoranwangsec@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, rostedt@goodmis.org, haoranwangsec@gmail.com
Subject: [PATCH v3] libcxgb: use raw_cpu_ptr() in ppm_get_cpu_entries()
Date: Mon, 09 Nov 2026 18:07:48 +0800
Message-ID: <20261109180748.33682-1-haoranwangsec@gmail.com>
In-Reply-To: <CANZ3JQQrrntu0TefPZC79pKSmsOfwAngRJyuaVm81DYaJNFHFQ@mail.gmail.com>
References: <179241614797.5916.13928836073297916808@whr> <CANZ3JQQrrntu0TefPZC79pKSmsOfwAngRJyuaVm81DYaJNFHFQ@mail.gmail.com>

ppm_get_cpu_entries() disables preemption with get_cpu(), reads the
current CPU's pool with per_cpu_ptr(), then acquires the pool's
spin_lock_bh() while preemption is still disabled, and finally put_cpu().

On PREEMPT_RT kernels spin_lock_bh() becomes a sleeping lock
(rt_spin_lock), so the task may sleep with preempt_count elevated:
scheduling while atomic, reported as a BUG by CONFIG_DEBUG_ATOMIC_SLEEP
and a deadlock once the lock is contended.  Any iSCSI offload I/O
through a Chelsio NIC that reaches ppm_get_cpu_entries() triggers it.

Read the current CPU with raw_cpu_ptr() without raising preempt_count,
and derive the global index base from pool->base (initialised when the
pools are allocated) instead of cpu * pool_index_max, so the base
always matches the pool that was locked.  The owning CPU remains in the
debug output, now derived from pool->base.

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>

---
(Resent with the complete Cc list; the earlier copy reached only you.)

Hi Sebastian,

thanks for the review.  v3 below addresses your comments:

- The commit message now describes what the patch does; the review
  rationale moved into the changelog below the --- separator.
- PREEMPT_RT spelled out.
- pr_debug() keeps printing the owning CPU of the pool, derived as
  pool->base / ppm->pool_index_max; the global index stays
  i + pool->base.
- Tested on: x86_64, compile-tested with CONFIG_PREEMPT_RT=y and
  CONFIG_DEBUG_ATOMIC_SLEEP=y; no Chelsio hardware at hand, so the
  change is not exercised on real offload I/O.

Changes since v2:
- Keep the owning CPU in the pr_debug() output, derived from
  pool->base / ppm->pool_index_max (suggested by Sebastian).
- Reword the commit message to describe what the patch does and move
  the review discussion into this changelog; spell PREEMPT_RT.

Changes since v1:
- Drop the cpu variable: read the global-index base from pool->base
  (initialised at pool allocation) instead of a cpu captured before
  the lock, so the base is always consistent with the pool that was
  locked.  The per-CPU pools are shards of the global ppod index
  space and not tied to the running CPU (ppm_unmark_entries() derives
  the owning pool from the index itself), so locking another CPU's
  pool after a migration is a cache-locality matter, not a
  correctness one.

 drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- a/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c
+++ b/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c
@@ -119,16 +119,13 @@
 			       unsigned long caller_data)
 {
 	struct cxgbi_ppm_pool *pool;
-	unsigned int cpu;
 	int i;
 
 	if (!ppm->pool)
 		return -EINVAL;
 
-	cpu = get_cpu();
-	pool = per_cpu_ptr(ppm->pool, cpu);
+	pool = raw_cpu_ptr(ppm->pool);
 	spin_lock_bh(&pool->lock);
-	put_cpu();
 
 	i = ppm_find_unused_entries(pool->bmap, ppm->pool_index_max,
 				    pool->next, count, 0);
@@ -145,10 +142,10 @@
 	spin_unlock_bh(&pool->lock);
 
 	pr_debug("%s: cpu %u, idx %d + %d (%d), next %u.\n",
-		 __func__, cpu, i, count, i + cpu * ppm->pool_index_max,
-		pool->next);
+		 __func__, pool->base / ppm->pool_index_max, i, count,
+		i + pool->base, pool->next);
 
-	i += cpu * ppm->pool_index_max;
+	i += pool->base;
 	ppm_mark_entries(ppm, i, count, caller_data);
 
 	return i;
@@ -375,6 +372,7 @@
 
 		memset(ppool, 0, alloc_sz);
 		spin_lock_init(&ppool->lock);
+		ppool->base = count;
 		count += ppmax;
 	}
 

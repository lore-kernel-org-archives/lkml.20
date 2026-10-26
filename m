Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039182;
	b=pLjQSivjC7GSEVdxylkZ6TBByWvENF6vwk855kd89C1agvq/ZhlFT5DmGKCFjgxdgsRS
	 fD/HlOlhtuSeQqgXTUOpLIModfAesB4L5ofPSEBvinH1zHZh6G+EcrJndhSkPx7Y4Edgh
	 1Dk/XGAIr3NITusCMdt3l18p72NLjz79mrSeLHaLbl5HUqRgy41b3kkTzLlA/6ddu70OG
	 NM/6/lyH8vN6NVLfWR8K1Rrau3qIRcB9qi/FG3pxb3pC2BvgJ2NPNh6pmLN/HZm6ZeKde
	 MR/I6m1wDf3IH/fFniiRh2/hqD42TDmxpcVEQn155+7IfwnIYejIEVSpwxT0S7T3fTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0FLF73cEf8/8Xru0kju449oktMHuGEexwCe5j4yh0Bs=;
	b=QvKdxBTw+rqyzoU/CQW4eJwYhygTVMiqMfXmF1l2HyOSRYizkg6dNsvO0Z2pCROXgPCo
	 TaSpKYAMfRqadqG/OGgIGmK9NEEblmxW4BSyo5lN8PkqRGvH+BPy1yI9qYohgCyu0QByT
	 Pyr8MOHaDQ54sUzL6Yy6PY4G78/1QDpWqZ1yZC/VKd8vBxxVlOrpjcunbHGBtG5gkEBvN
	 8lCYgbsNHSFRd3zI1lftzxf06BtB+OZK2rEj6c+Mrud30gzXsFLuGSrI3a19BMyzThpfy
	 NWXa0L5YxNlOGOcU3jLs/X4ADkit/qpmHv7Gc6pTg+ETYR1XnhOFWEuRDxTAepQkGCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eBIe5Wv8;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41747606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41747606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eBIe5Wv8
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so153720f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039179; x=1793643979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FLF73cEf8/8Xru0kju449oktMHuGEexwCe5j4yh0Bs=;
        b=eBIe5Wv8Hfc++gVv2BMFtDPfGc/EDixc28n1u1h1AnUh8ozSwUpIKJo4HufwkvGJuq
         8Typ5y5yGHCHUxl1vACgzJiLUP9A1OU20qxFsyeNHd5L+Mq4rg4xhdlIHtPEoq8mt2oQ
         8DoGkyQKiCiEyhoWbmtkuVIRd6kQYTppY5rVtHjPwmpCwLoAny17IQ9lupq4Cyp4UW8Y
         /6Lx3v2/B5nRePc0hL5f+pb0K5QsvuZCisHZJsKpw7rEM2ps+euxDjeTNv5zXFhdjzPI
         uuTClIDnNFe1dWQyCTsBQj2vze1O6xy/I3BCdzuzrE7aOuYkJBkATCLv301Ts/n/FRr0
         b5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039179; x=1793643979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FLF73cEf8/8Xru0kju449oktMHuGEexwCe5j4yh0Bs=;
        b=UCo+HoPb52sgU57vR8XFWyp9Wp9Qr+kq1Qz1W5cyuNgzhbiXDJ6UCxmSfoerKNxqeo
         uVQBV4kqM/GXvI1bpDitm2Y95rn4RoAGj5vIZ3H2cvUti82E5jBGYMUkEQH2vo18eV+R
         qVJFJiaJm1K14V7jGZysLzZQHcovL4o30/7fBtWjndt1xDA3STTT2+HUUD/C10668I4i
         3bP0nmW0vN1RGe0t19c8CtyO1ZMOPjZ1eNWlqIWHrbQZ+faC5JbwQsPjYKxTpoqN6CTo
         DIn9vheNf5kajujxtBIWueN0UlQ5gXxgwPZHvEaWPC1mlWMe+YyzOYGkT+oXWUwfyCl2
         hW7A==
X-Forwarded-Encrypted: i=1; AKwUvBzKVktrO4YF7L+b2524G1PC2r9o/KQ7kyAmFp/5CA9/1ISqDUbUPBanWkdW9+bN4P5xULQCwwZcfVi0Le0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjO4DL5zLbP1UwgsjzbStZ4glCzANBiwGb2Ch9GFhYLcp4Pyby
	p1oWEfvorpkVLBLaWUBG/yabwCWYOlzgxTBOlt5A0xJIuZx1pHxInE2v
X-Gm-Gg: AYBFou3di1PVEvUWY/Kyi9DuEKCGXedy8iuLXlxZG3GeFLb7apL1q4k8ollHircGiir
	9vzjXb1Ji+/QuNQP9WRr1ImPCu0MMnn1bbJzfqY2el1fsIB5Vx8FmEgGGMaIk9JrX7BxDjmOmDO
	hxLe071iZzk73c78ankHpEaKBj1KMpCcxvycTMwzkNVKHU1d5dOF2uvys1zCJ2hJPIVfkJCJamL
	mOKz2dyHi7prmVddWbekHERxaE7VLHahl5tKHG+Ly2xxb1LA5IxVXdcFPSzMytsPLWoIk8d43Jf
	9II7INEgFe90Cnj9SHflm7+JYYBYCEM+TjnZ43T8aujakdLRFO0sdHZr3lrxqm8vEKeUfaEZWJf
	SRd8zIk6egZWZGJ/rIJVuy3vXHf+xB4Mys6XFD1ZqYMFdlVqgUIVXjG1l/OSZXwRr2XCbtfvx8y
	eCjejaRh91tFMRMJGiY8w8F5iZrWJjAb7rL9n1ba2o63ZnZePwthT17PWsPLsfTsBIazbR78GsJ
	uTiOzvLHeghKHK9ziq9gc5amRQYrw64GHqF3KYNmFQNKORRA0YZ5PDAr+IlL9x7qfALnxrv7Xru
	QJUyvc0NxU/LvnldeOYNIcj0r8M=
X-Received: by 2002:a05:6000:e4f:b0:48e:39b0:ed84 with SMTP id ffacd0b85a97d-48e55a45541mr800284f8f.19.1793039179518;
        Mon, 26 Oct 2026 11:26:19 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm12830907f8f.40.2026.10.26.11.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:26:18 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v1] ftrace: Fix lost recursion records in ftrace_record_recursion()
Date: Mon, 26 Oct 2026 19:25:52 +0100
Message-ID: <20261026182553.221141-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

cached_function is set to the current ip before the cmpxchg() that
claims a slot in recursed_functions[]. When that cmpxchg() loses a
race for the same slot, the code bumps index and retries via "goto
again", but the retry immediately matches its own cached_function
write and returns without ever reaching the bumped-index cmpxchg().

Concretely, for two writers racing on the same index:

  CPU 0 (ip = A)                    CPU 1 (ip = B)
  --------------                    --------------
                                     cmpxchg(&recursed_functions[index].ip,
                                             0, B);      // succeeds
  cached_function = A;
  cmpxchg(&recursed_functions[index].ip,
          0, A);
    // fails, old == B
  index++;
  goto again;
  if (A == cached_function)         // true: matches A's own store
          return;                   // A is dropped, not retried

Once dropped this way, cached_function stays set to A, so every later
recursion of A also hits the fast path and returns before reaching the
retry, until some unrelated ip overwrites the cache.

Set cached_function only after the cmpxchg() has claimed the slot. The
retry path then leaves the cache untouched and no longer matches its
own store. When the cmpxchg() finds ip already present, the writer
that installed it sets the cache.

The bug was found with the help of an LLM.

Fixes: 773c16705058e ("ftrace: Add recording of functions that caused recursion")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Changes since RFC:
- Drop the cached_function update in the old == ip branch, as suggested
  by Steve, and adjust the changelog and the cached_function comment.
- Drop the stale "(use i for the next index)" remark.
- Drop the Assisted-by tag, which Documentation/process no longer
  documents since commit 1e035297ffdad ("docs: remove Assisted-by
  references"), and note in the changelog that an LLM found the bug.
- Rebase onto 6b4b543fa1875.

RFC: https://lore.kernel.org/r/20260917090217.6738-1-parri.andrea@gmail.com

Tested on x86_64 in a virtme-ng guest (4 CPUs) with a reproducer that
releases two kthreads to record distinct ips concurrently and checks that
both show up in recursed_functions: the base commit fails within a few
iterations, this patch passes 500 of 500.

The smp_mb__after_atomic() usage discussed on the RFC is left for a
separate patch.

 kernel/trace/trace_recursion_record.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_recursion_record.c
index bac4bc844ccd8..4f63bec052fca 100644
--- a/kernel/trace/trace_recursion_record.c
+++ b/kernel/trace/trace_recursion_record.c
@@ -17,8 +17,8 @@ static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSI
 static atomic_t nr_records;
 
 /*
- * Cache the last found function. Yes, updates to this is racey, but
- * so is memory cache ;-)
+ * Cache the last function found in or added to recursed_functions[].
+ * Updates to this are racy, but this is only a best-effort cache.
  */
 static unsigned long cached_function;
 
@@ -67,24 +67,25 @@ void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
 		}
 	}
 
-	cached_function = ip;
-
 	/*
 	 * We only want to add a function if it hasn't been added before.
-	 * Add to the current location before incrementing the count.
-	 * If it fails to add, then increment the index (save in i)
-	 * and try again.
+	 * Claim the current slot before incrementing the count. If the slot
+	 * is occupied by another function, advance to the next slot and retry.
+	 *
+	 * Do not update cached_function until ip is known to be present;
+	 * otherwise the retry would match its own cache update.
 	 */
 	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
 	if (old != 0) {
 		/* Did something else already added this for us? */
 		if (old == ip)
 			return;
-		/* Try the next location (use i for the next index) */
+		/* Try the next location */
 		index++;
 		goto again;
 	}
 
+	cached_function = ip;
 	recursed_functions[index].parent_ip = parent_ip;
 
 	/*

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.53.0


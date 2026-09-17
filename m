Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F43342467C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635768; cv=none; b=HrWXdTBeyrUx+HoHDkxpr64YqBUuBNaCfx3wXVXk66DaXn+kSdVlG2qfL1CWwfhvvLnM0zF1s5oGm5CYNONFe6+/4JzDln77F9spA6EFDpyfxSRP5oxh0LQwMjlNjjYlgbU7SLw2SXh12Ic0eoBYCqLqHq2n63okgP54XMfH7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635768; c=relaxed/simple;
	bh=ozQGAIMkvqqhkvZe4pcXRhsZdYTDnzGPu7fLJ+j23Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWAyelpX3azeqqcwkDlBKYUB5plQZM15zGds4W3bD5xoqIEB5ajzPJ3DPN0lCaU5ZJZq6IC7W48kgtVsd64ff72Le9N8YF15EsnB3KP00F/7kP8uEqfY83Wd0/Yv128zH5Wugf+/t2ibIxB18tT+oUdUSoVihcnQd/yAnTk34a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNSjtb2s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNSjtb2s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3566555e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789635764; x=1790240564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6V+0YBZBpJih1IEGrwmsUOqpoN+1krggl7KJMKg77no=;
        b=FNSjtb2s1WTy92cABFdOQXAD92IL850r8F7eq01+3QSpbDoXhvbFrBlCQJMUiBaFLa
         cwHhIKjCFt6NUEkXjYmSYG/CDTn63IGT1bIlr5rupy97IOiPwD/ihUKPlZp1RU07pAH6
         3PQ89DfHMSbpzxHSruERc538pLoDER//a7gNWh3BENxOSUW7BRVz2qQZCC7Qv59H+qFS
         OVd83NBAFGB9p1cumJpZrMbUi/46Mo9qbn7jRfOw9HjG8rfpSlYeQMobyOrHzefLa/7c
         h1PqDUQm5cqrR7hecG48I+Ejbuxjt8doFhD6h6avHnYAFQnkCQ9jMt8ZeqOaPeqzfK2p
         DooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635764; x=1790240564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V+0YBZBpJih1IEGrwmsUOqpoN+1krggl7KJMKg77no=;
        b=ZzTEZ8weS/pBCbHQM6kMuAPUULMuDQabBPuqounGewn1SQHM+ZcFfOHBn03GEFRU2S
         nPbXRtQo7EjqFyot+yD+E4X6zdbHWPlqljyAA6kaVT1v7v8GT4PsOGF25APitCyIPKNj
         s4Z5ZzHoOt1bBb4ODkPXCJaDUl0rVS1s7Th7BnbnIc9w8dakv2QjKyvKfBZWHu4DHJ3e
         NMYq56lrqvszVweBPSXOQtRT8Lp3FrO5z+ArClAPBCJB3F1ZMs1nhRxuNcFEmpXzRHdq
         tWPeGdyK05fM17xhgYMHDACmevd9V3yPGUFeChSd7Xk/4kgwi9hi3PRHCaVBmI1PDekg
         3mXQ==
X-Gm-Message-State: AFuF++n+RwAYur6zBM1ULNf3XQaPNXvIDMCk4wm8SQbaWBKHcKiyUx7w
	Y/ThewcEKp9xCcS/KQleH8ksq8Maf9xPyCZxeaudC645jUjjwhg8Fa6y
X-Gm-Gg: AYBFou1ibA/KdUcRh6cWxLy+JXOzZXQLJshJZafNWwSRR8lXQxiq4892q6bvEQXD8Fn
	vNwi+Pp6q1vg4osRj0QH5fRW7C/WKTIWRNa5LkWGZ/i3KbHRxwkcpZxUbZ3VppNm6owh7OIQoby
	7R40s+DvCLvdqYdcJnMHgupD7uVMiTtNW1y44cU3v11VWHI/YFGuNme1IeAJFaybcFJ/6Ecls0x
	4Y6579JkRDjPN8w90QQj6y+OeiF5jaodokiFjKJqDbjpAwv6fpiuiDcKoA2di83QrZnfOd24Wfn
	neiF3TTiCgHk2JgUKb8apN0+lTYEuYO7FBDcr4CmKEUkinMiBa5PlPY+EX9tqQL/V66L9qmpXbf
	B/GsCc7vtFPuP+7OjYLifUKq9y7/wwnmUz0Mc0fbjO8Gb4ruZAU24LSMYAJ+oioWvFNrSTc0Y5c
	nS0tHaqILCcTSJCFZJkQf2K5pHx/1r33DYJT/aZaLinu18q8pmNrPnAmfDOt+T9fsLwAyN7Y9IS
	kZUvf8jpGa5e5NIEVF/Mr53hvzac+a1YmqiL4IbsTSBr2V+jw==
X-Received: by 2002:a05:600d:1b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49f1d516a12mr135848715e9.8.1789635763947;
        Thu, 17 Sep 2026 02:02:43 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd967f1csm22095115e9.3.2026.09.17.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:02:43 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [RFC PATCH] ftrace: Fix lost recursion records in ftrace_record_recursion()
Date: Thu, 17 Sep 2026 11:02:17 +0200
Message-ID: <20260917090217.6738-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Only set cached_function once the record is confirmed present, either
because a concurrent writer already added it or because this writer
just claimed the slot. The retry path leaves it untouched, so it no
longer matches against a value it just wrote for itself.

Fixes: 773c16705058e ("ftrace: Add recording of functions that caused recursion")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Can't claim to fully understand the logic behind ftrace_record_recursion().
Notably, its smp_mb__after_atomic() calls and the lack of barrier comments
both look suspicious to my LKMM-trained eyes.  ;)  Hence the RFC.
---
 kernel/trace/trace_recursion_record.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_recursion_record.c
index bac4bc844ccd8..f42089c30f53c 100644
--- a/kernel/trace/trace_recursion_record.c
+++ b/kernel/trace/trace_recursion_record.c
@@ -17,8 +17,8 @@ static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSI
 static atomic_t nr_records;
 
 /*
- * Cache the last found function. Yes, updates to this is racey, but
- * so is memory cache ;-)
+ * Cache the last function confirmed present in recursed_functions[].
+ * Updates to this are racy, but this is only a best-effort cache.
  */
 static unsigned long cached_function;
 
@@ -67,24 +67,27 @@ void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
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
-		if (old == ip)
+		if (old == ip) {
+			cached_function = ip;
 			return;
+		}
 		/* Try the next location (use i for the next index) */
 		index++;
 		goto again;
 	}
 
+	cached_function = ip;
 	recursed_functions[index].parent_ip = parent_ip;
 
 	/*
-- 
2.53.0


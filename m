Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102488;
	b=Lu09QtkrMr7a5DxUFLTldOnZGrCA/AmlFaP5s1KmW/HMyf5cF7Tg/qEZUthqpjguCklj
	 2fkrxB+OicgbE6Y1Oby4Sz/J6Gj8MRQ3HFZ8ceTNGkrH7CPE2pavyfUOdB3txmxKSs+H0
	 hQSYv9Py/2bzKj54CltgRriQm0uKPBVCFxH2qyaTJSDKX2fzi+YjJu+VlATNgUM0aHj6j
	 EP9Fhsc9n9bRvPU2vtxDdkVQkSc1t7Gd61e9B9mGdnKVyKn5D/RPRFQMh1IPe6faFQi1Y
	 AF8udBw2PsDLMJ+ZKM7/CXjRTtN7i5/DYm1uF89w25i3/WkqSNPhsqmIDHOWpFpDw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102488;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fUGviiWetGSzTGAnyMu4M1XVs/C1V+ixL8ZHmeD0LfU=;
	b=F6v8erlqJSqA2tbBpv19C/miFeAkXdfTXuKO7ipAP9o2r5bxQkqRlQA3l7/b35UAaO96
	 wsi36hbMOzBvBuLRP19vVxplaWuViTcA9qphw2yanDbg6aqR/zoeJ9eCkg6/SUSrI9SJr
	 ju1zqfnK/Wc7Kqzxb+hJbkG+u5EwOvfjfZVXwljM3P+xQ6g9vsOP6Bd4GbRJfE+tN0DKw
	 yVHtVP03BC/m31kmfPFjPykTuCt0VzpRU2mMn0/XQUdWGHKsi2x8dIAIWt34DgUdpJcZ9
	 UeC6+xvZY7XNeJ43Cpu2QK06bPlzElyJW8mXyYDa4UZPmlWrCPsOJu8lYeBqvz8ENaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=rVQNyCcg;
	arc=none smtp.remote-ip=203.205.221.210
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB88606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB88606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=rVQNyCcg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793102477;
	bh=fUGviiWetGSzTGAnyMu4M1XVs/C1V+ixL8ZHmeD0LfU=;
	h=From:To:Cc:Subject:Date;
	b=rVQNyCcg1wiiuTfwyg0mg7QFMniyKsX2gPUFmBgXCrgxnA+uc7RONgg+7OVuYmE/b
	 1akt5agVLgVEq/fFbasVMN+ekhVOy5c2MuXNNDmONFClVspGFaVLDut/wA2zzYi8ss
	 rEPTAdk1V0LFsfkn3DZlPZtiQub2ljB7WR7DCEmU=
Received: from RE0700.barrietech.com ([122.234.183.103])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 4EA92E0; Tue, 27 Oct 2026 20:01:14 +0800
X-QQ-mid: xmsmtpt1793102474tey39p9ui
Message-ID: <tencent_58D610F93574D60C9AE734253AF69A528506@qq.com>
X-QQ-XMAILINFO: N10IrCOuXIAmRC3UH1fNZ2kU4orlxLarDA7EPMfuWZOI833ISTziBzizsE9WHp
	 U0lXL/AypDcG0a0jYIwfBkzmQgpU88cUq6mmeQv6Ts8oEwgifiGvcBCRSZD6PIxOk+iEx7VgYBW7
	 T2iBkpEXMsqbCQiKvWyrIKVY/dKXq+ESoIDZzYt6HHNqXPX/ZsfpzeDovWClJCPLd+KFP5SfQtyP
	 lytkMFxCE2/VaRpLBWWKUblDDih7NRpKxAKs+o2B2hmeNUaWQIfIvlrLV/mxVeaHJR1k4rhVq+K/
	 fL/M+SDjBZ7WR8yCOL0nlcE8AUrRXIZ3cR7iXPyO6RmC5LHIivNCKdu0htoCovP/DY7JNjOp8GLO
	 5uGQLnQ3AjhMNLn6t3d6QJSUOtHvBsBWbkvxLUGmtMNwtiacAyfB2AMThe0kzo5tcuw8z6wggGe7
	 Zv+UKc/otruu3EnBq1RRAf0n2kYUVhp9HYxkPFC7cczh5RM+gcbADP2HV7trq9A5fCuDXQ668D9y
	 mpws/qGsCUkK5NzNxTLUfT5gXCU2CqSeMrE3TnPUHga9W2zSFKCd484fUAD+NmoMGbYHTnOHym5w
	 zF+cvvnqKvTZqgbCyy8NtXWx7KEvIkJVq3jVxKYpbVILCQpBAb2YCxqLFOkYnCi9upavEySfMOPt
	 5RJq16CNW3GlB/LPSwjEcB+Aro4S5rLocpBgSMsrVs8ktvHEM/4FuQ9siRvE3wv0eFiTOd7Y6b1L
	 w8EYYEQYDkuNAb+EPBd+ncRfnFWzvUzYwBgtp8kD03+DY/JdroNNOyN3m3ksOcT8dH/oKd4qPfiX
	 mUZ/Aj51Jx6Em9j7YZl4tJbNwEOLeKsMXmMFI6p41ldV+UsHfZd1U9r10g3E/XOUwuDpRH45TMWq
	 gKl0t0iUDcPYXYHlON4vsJMhTv39LJ0RH5Xe3PRD0LbIGHjGpuYkVKFpwxE+uWBL+6wH1o1zrK2S
	 7RZvevOKbIQ1qqxCaVy1N9jfdxIPJEkdcn7brl7JbxPCuJjg+mirDCI2tVmQAgIOVYv2tKxyJKC7
	 O6FPXYxlazmmb/nyK16KHAk8FoXZB8BJJ/wJ0/O0fgio9vv5PfY5vnM6s0fukwpGuKx0yjJuiLq1
	 jU6u+vWbDLFZKXnnVUCFlzi8jBMWw/FLX2VGSXJwfyjfeokJE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: zhoumin <teczm@foxmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arjan van de Ven <arjan@linux.intel.com>,
	teczm@foxmail.com
Subject: [PATCH] async: Use ktime_us_delta() for debug timings
Date: Tue, 27 Oct 2026 20:01:12 +0800
X-OQ-MSGID: <20261027120112.349313-1-teczm@foxmail.com>
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

Replace microseconds_since() with ktime_us_delta() for accurate
microsecond timings.

Fixes: 22a9d645677f ("async: Asynchronous function calls to speed up kernel boot")
Signed-off-by: zhoumin <teczm@foxmail.com>
---
 kernel/async.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/async.c b/kernel/async.c
index 0e3a783dc991..e8862c39344b 100644
--- a/kernel/async.c
+++ b/kernel/async.c
@@ -80,12 +80,6 @@ static DECLARE_WAIT_QUEUE_HEAD(async_done);
 
 static atomic_t entry_count;
 
-static long long microseconds_since(ktime_t start)
-{
-	ktime_t now = ktime_get();
-	return ktime_to_ns(ktime_sub(now, start)) >> 10;
-}
-
 static async_cookie_t lowest_in_progress(struct async_domain *domain)
 {
 	struct async_entry *first = NULL;
@@ -130,7 +124,7 @@ static void async_run_entry_fn(struct work_struct *work)
 
 	pr_debug("initcall %lli_%pS returned after %lld usecs\n",
 		 (long long)entry->cookie, entry->func,
-		 microseconds_since(calltime));
+		 ktime_us_delta(ktime_get(), calltime));
 
 	/* 2) remove self from the pending queues */
 	spin_lock_irqsave(&async_lock, flags);
@@ -317,7 +311,7 @@ void async_synchronize_cookie_domain(async_cookie_t cookie, struct async_domain
 	wait_event(async_done, lowest_in_progress(domain) >= cookie);
 
 	pr_debug("async_continuing @ %i after %lli usec\n", task_pid_nr(current),
-		 microseconds_since(starttime));
+		 ktime_us_delta(ktime_get(), starttime));
 }
 EXPORT_SYMBOL_GPL(async_synchronize_cookie_domain);
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0


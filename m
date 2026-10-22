Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646276;
	b=INbuhqXa04UM3tHqt3YJoEaIWN3kVSow9yDQRElShJFMFd4rbNQbqpJQzuj/KZ46tred
	 oAQIm0ZGS674BA6xflzm3q3fcdtW4Kl1os1Ju3O+WTWMRRlWJab26H9TFQo7kLgK86VTc
	 wu9mq4R0NYqcYI2/sLcUIUGapEL2v6nX/f6zQv9fDvCPde7O68JNBuj06wMW5q0wjk6C7
	 bVw99KwQImWv6gTuoQQJGWxfz9jd58G51kthIj4G7ucNRXJy/0tgixbusZx6mX1pFeI3Z
	 vEJSr5JoJVEO9CbXM86U8uzpK2hdtycGxVigfbNcPm/xTKOrWae2tXkuKQz4oTVvDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
	b=dyf8Rh7TKdIM03Zb5WylRRuSygLiUx2hVoMZfBPomWzRXH/GVXFWZQQwnm0ClJOtkuZ/
	 Q+eZwmXCaSm8J9QdtcAxhp4L7WaOHA8vNbjEdMJ+jbi/d26GRBdeW8JOK+S+EkYjZs5xE
	 hT7tzYgHyUZpsPb0E2yXZptKnhpkvvR3Hr7fhUE2vfH+RvXytjniC0DeeG2+glP2GkZhN
	 63m0fco2ho/eIc/CNkni09jB0SsRloeyHXLfpSMT785hFCXfCueX+pGXCzdVaiqOAHvOO
	 Wjwg+ilgpBUITlKxWH+QsNK+yI6A82B30bvot9uGq6BurKAH/wNrforv5FpcYZg8dHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrEznyt3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74960A2615
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF74960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrEznyt3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1612825e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646274; x=1793251074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=PrEznyt3V0Td5d9mPQAr6GTSP8KU/wwhLLQOftyeTLWqx9zUFisZ+lIkfVCM/A68nJ
         j9v1XOQuZeLHYD3KRntWHTA4EyohSUpujaqZKhQCzmD+PucpLXzrsFhAnvayYWoy/PRO
         /ShIPkXt6F+g/JfZNNmweaTq+DTNmB/MxjZUH57bA6hQY/ah4jJQsc4XNYgVKBjR5+Eo
         qxTiqhD+C+7fFnA06O4Oxlzp67o5bk9MP9UI0T6QZ+ZV2VvRlocC/sbwWDR14bCETXQd
         XnggQdCI0wcO6hAin7ygVQmG5i+DrLXDbGrHiruPWt0Pxs7jAcLonBHV0wLuMaVtmp4M
         v+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646274; x=1793251074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=IPtvYatzgdRseqVpMchZ44Vb0WMwwqhXxNJQUZJunBnBvcTUUiR/mzAlEtplL9GWey
         nJwx28+EnNZdsZ8m56pwTyJPdH2J2TKwOZfrcoI2OK4hfKcsLSANdxsq+gJJ+WRrHlY6
         SHwM+/03txpjrV+4hSTCd17AxIgxzQ4HLlNL3+zdYwv/2vWlmrIMTDixCvztQDSiiebd
         o7L3iY4LGn491YaluZ3wRyNU9KiwIDCHUCAiTzn6XcIbvLgTS+wDR6jKkWOAYXi6o6C/
         rz+2N27qmRCQLwL7sRvJMiw0vW9WIDmJLZO8O55epfL4USXTTpwg3sIj2oLwsUT+bla8
         pICw==
X-Forwarded-Encrypted: i=1; AKwUvByth3CBwNrIljczSVlaG6ctWcNNp7xFuq0rXCIi1/6XfljD4KAsIDtYEaecV/V/gMc3Zuv9hKQsiAYbXQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOZ1L5M9z2Sf9BjDFyHueLg0Y/Jm8Ooj58muMA2qnoBBMh5/J2
	2J41ZYhn5wlfnJ9KfYNFNq+aHwXOGFUqMeyxJntS0w2F3Y4OJM1jUbhX
X-Gm-Gg: AYBFou2GVbx+Xxu1dwtewuRjxlUGHcSazZUMgvU4EVKKUHQ7ccW2hSP4q9kJrdjLD8y
	rKxxf3Zq15afXTxPIOn331YRunFVrbLe/rSk39dHOKfAgT/HM/wqzJiNbOts5tNtx/qRyngaDDQ
	HrMN7AgipioRP1nYhYzx/lHVfafogjX6+17dA74h+aP8SuaAqKIyR6sZjM1rQmvxD9hUJW/V0to
	DuR5WDIujiGffHCq0GUt1F+shvaSUb8uJk1mL5yvs98fVZJH24zrAOMXtJcGdZGxNx/Q62CKOtq
	znE1JRDRSkifrGUB/ODMpD6S/nx17CjuE2g30CkSO5SELIUGQdB4p2xsdg2Avp6kJknX7t7Zfhg
	l1v7tD5bwOFmv4C07f4nYT7DusZjvVeGgNLOXLMWQJR2HBSA47tdZ1ToImOF5q6vxj22o6TE2tJ
	eJmPB2wOw/2o1O8z7kS8D4K5TVPFpGv5ZwWQCSrdyeuerwW4OuEDu6VjLZEMrtKDnAdvm3Oqm7H
	Zja9g1OsnSpk03nfVOFubA0fxNZA1hwC1rJIARMjuMK1xFYNIgcUWnRB0XMlWQp5RvSXKEqQ000
	RBihALrxbOiRZ2rEehC62N7gaXtwHw+HPfoJ7Q3vbbQi+1DfS4Rfa8aGNaezrUhkeFiT+atDaYd
	Qnrt3C09BCGDFna6NQXCNw9HSI1QWKboUIHWwg/aXLl3dguk+C9GdL1x5PCJc
X-Received: by 2002:a05:600c:1c09:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a1fdd2468bmr84667645e9.7.1792646274255;
        Wed, 21 Oct 2026 22:17:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 12/12] tracing: Pin recursion state for its complete lifetime
Date: Thu, 22 Oct 2026 07:16:54 +0200
Message-Id: <20261022051654.79224-13-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

trace_test_and_set_recursion() publishes the task recursion bit before it
disables preemption. Scheduler tracing can therefore run while acquisition
is in progress. Conversely, trace_clear_recursion() enables preemption
before clearing the bit, so a reschedule can observe stale recursion state
during release.

CONFIG_FTRACE_VALIDATE_RCU_IS_WATCHING also validates RCU state before the
outer preemption disable. rcu_is_watching() drops its internal preemption
reference before returning, and the warning path accesses
TRACE_RECORD_RECURSION_BIT outside the protected lifetime.

Disable preemption before validation and retain that reference until the
recursion bit is cleared. Balance both rejection paths. This keeps
validation and published recursion state inside one preemption-disabled
interval.

Keep the transition slot unchanged. It remains necessary for
interrupt-entry intervals whose context is not yet reflected in
preempt_count().

Use preempt_enable_notrace() because this inline API is also used by
modules. The no-reschedule variant is unavailable there.

Assisted-by: LLM
---
 include/linux/trace_recursion.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85a..fd14380751404 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -126,11 +126,16 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start)
 {
-	unsigned int val = READ_ONCE(current->trace_recursion);
+	unsigned int val;
 	int bit;
 
-	if (trace_warn_on_no_rcu(ip))
+	preempt_disable_notrace();
+	if (trace_warn_on_no_rcu(ip)) {
+		preempt_enable_notrace();
 		return -1;
+	}
+
+	val = READ_ONCE(current->trace_recursion);
 
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
@@ -145,6 +150,7 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
+			preempt_enable_notrace();
 			return -1;
 		}
 	}
@@ -153,8 +159,6 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
-	preempt_disable_notrace();
-
 	return bit;
 }
 
@@ -163,9 +167,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
  */
 static __always_inline void trace_clear_recursion(int bit)
 {
-	preempt_enable_notrace();
 	barrier();
 	trace_recursion_clear(bit);
+	preempt_enable_notrace();
 }
 
 /**
-- 
2.39.5 (Apple Git-154)


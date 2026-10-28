Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158306;
	b=mxTbUQ2EQTuJW2tqyEFSbBnzD7wgwhhHV8jSakEjX+O5+bITCTVF8PrMXB0da6qR3jPq
	 HOeyzeP0jzikqM6FOkCZQQpRbKcurQmQA9oVCPUfTLJg3EzeakaQaPYdFQxzr1eIkYX6Z
	 KRhunrVKaONJtG8qI2hGead+nBxORu49Gpuh/kefJMHKJShPR36K+x59Sbx64Rut45oU+
	 R/WDt4Emb30gLn0Ll566DjKrisDde+2mNvqTKjQM+0c3xZUhQMRVqdspi6YqzoE5bFDjc
	 qV0lsNp8lF0UL837vtNjyQ+cez7ue1od1Rc2Xp0ffW550bmtMc1Eas5qWi1s7WnBjsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
	b=tphI1sYV6/4NU9XzXftKIElQz/2FZhF/eNp92sGYr2yYKH0tC2/kYIrxOsp4+rYyRyQT
	 3FdupKzLj3YlitHGuvEHNyctW5fsT6iIE8jyH+I/IWJ4pLqH8VRu83JlL2QDPpAEBnHfR
	 iO11VGSRdQZAysV6zVN6F1NuStpzbhoy400jzMB3anX0T/OdYfDmJ6+2izoLviOFwgxsp
	 Q9L9O+NGz5ocNUoLvBcHl9XWoTJuV9YN5zw3wY0a+bjW6MxifNrHT+3MHhq92NdP7Cj2V
	 qoHZkYOSpIN1QGID8TdAvlev7/uZNBeiw9AC33QLNhMcS5cgmtG9eJiCtqxSle0c+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ism9fz3i;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F23606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F23606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ism9fz3i
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3967375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158304; x=1793763104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=ism9fz3iddL8+FiO9jcwvJueqXy51UdSpEHoZ+RaRyPHfAv6q7SnK61TCZBa9qIT6f
         L+fzMna4qndMiioKJV4ZVWatZmEhyXc2+EmhNQHW3l6vP/I7Wo9zSf0STFjilhh9tWCi
         eLLdlj19UpxqCfQ4ax6CfVTaHnOyFzN0xnAApBKB9pf/kWmKiAmODe2Kww12drjmPg9K
         4oruhUAJoSw/kKC6em2VdQKVmH1fStmxgJzGO6JIXxsXov3UIGgyk+k9iwdLIWCDmWwB
         c43UjWt5W8pH1LCgxlOHt/79KuWbGnpbd5vUpJlXlpwdBi7Wg8jk8P4xabHqYZWdm4NX
         n9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158304; x=1793763104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=zhr+qNt/TKgLd7JLq9gWG2mqkUFEfTnGsm7Qe6P360xsBmI5x0mPX0FNV0qkZSRk/N
         5dSVeObrNQg4xi58PQzxZlkf7k/0W8h9Ws2ARh7HHcrv96/z0vsdmZnnz94yUvPjz3pl
         ggCNlCAJYvkeOexWL6Jysl8kzf7L5REFmSqn8XtkvmbxwpbrXtnF6002XmgunFcWQL4h
         lELQs7THaN3Gc/3Cmqbxu21qe49pXS5aHU1YRmna9VMsQp7noEeIfrZqqD1LpH5TEW2J
         tPoo9Ucb04/lU/lpF4YssOWoO8Oa1FHEUEW1I5HxoogjbZFwCGxVucdef5B67zRG+GGx
         p6ow==
X-Forwarded-Encrypted: i=1; AKwUvBxg7sj37DPPdJiwKfSrnC1j3x/1+WND6XpYAnjZquVvRd33BP7bNiqSzMKRsCk0b4zBhVMgao5ExFqSM9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgygrbPWSzjzjjTjrKrYItYPqxGcM7CWuUzQ7RSoQgjxlgY/in
	wU/nwGXR0eeji3DKcquXXTj29njfecVLzJ4RjvRINPq4wSFSpUCVy8YR
X-Gm-Gg: AYBFou3KsdCcO4m0/W9nCcUWaQhieHURLIYmWOWtfW4lraqDXAeT29Wiv8jicP1p71U
	kaFLDHiUgHpsV3/Q3KvSEsUSUx1BPpiDQZQ7+X19dB3IeG6wWYaF17coG5wxBnPO25GMy2a8EcY
	3WQzmLM75sb8XuA/PLV6mjW4ElUMoJiTmC1/jYlz/pbNfOrszpZ6tul6HmNQqsva2Cko8KvUOcd
	gw3cz8XKsYyAIENkO5NK9fxVIy6tRGPsdOt/El1lHOvz+SX06cv10W8ncueUPERHbZvCnDxQ2gz
	W57pVMau9bKUvIm5Wnp8zRqTTsXW6raqRvevUGiuvCZxmmogORUB1Q7cs2k6F7X0mXXS9DxjZn1
	xuy1Ej4YmZFQGZAx9VBN7+bFYdxf7Q1ft4zSsZj/m2mVHuJAlkf+0pSa/O6Q/iJMM4B8/o4QJEi
	iT/+aWOTCEJfkpQBGwZrPTVwzWETuPKpWx45mt+y3M7btFDxvkioiUtdvISvPVR8V510Rfpwj5m
	wHtNafRrwCt8Xu19aonkX0HExX1+LKs3zXfo1usP+WhGrXBTB7wW4F39UKxyJSxyd9asQKBU8OF
	39smqcu8HMismXCm3BUjahwtK+ETCG0U37eIZL4nj74r2/tcRMMfNFEvHA9FOOrXBwhW1IDJBSO
	Expu2EtJFWbzzS4lpq5na6rzw/Gk5ZmX+aMdJ3zvh6WsN/T3xf/deEWmvYNPbXFdJT9vdpxJdBK
	z8vsVev4DB5tpXWuyiCWFggnk6dBu6zqHD
X-Received: by 2002:a05:600c:6206:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a967e8c07cmr16606825e9.34.1793158303715;
        Tue, 27 Oct 2026 20:31:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
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
Subject: [RFC PATCH v2 01/13] arm64: Always inline raw preempt count updates
Date: Wed, 28 Oct 2026 04:31:15 +0100
Message-Id: <20261028033127.82193-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

From: Hongyan Xia <hongyan.xia@transsion.com>

Clang can outline the raw preempt count helpers from noinstr callers into
ordinary instrumentable text. Force the add and subtract operations inline
so entry code performs the count update in its own noinstr section.

This is the preempt-count hunk from Hongyan Xia's pending Kprobe noinstr
RFC. Keep it as a separate prerequisite so the early-hardirq work neither
hides nor claims that fix.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
-- 
2.39.5 (Apple Git-154)

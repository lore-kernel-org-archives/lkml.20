Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815686;
	b=DockKrDAfW5nemtLCrmcwMfRHi7MXEQWeZHQuBMkWI83fU9cdmx/fIQSO9dtDavoMjZw
	 Gj73g0ew3PHAJ6tWKq6RvbusAK25vzRMpUeq7IDii4Emd2cDXaaruNwSl8o8iFeLI7XKH
	 Ae+sgJ8qGlyx8ptYKtEdmJJsIFwpcpa+WzFsiXm817Yu+IWMkZ/RepL0YI3A5BYGwYysF
	 0fpXUrg6E7xdK7DKnb7icVpTloC6WwxfGrD/6iYoiOjBW5szSBDGH237zi0Hb9w/E4a5A
	 oqbdpWNSDHFDv1T8YGsq/CFtUuQVsIwvPHHw98VU17165eeEvr0poOEWFAF3UL2Un/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=;
	b=syAg8yqbo5Hgb8QdwBX8OB+dfGL7XxtHEWyB35mBjorWokNclVWEx+NpmSYF7PlZ5ChB
	 zIJvMS2nTf6ZaYpo8e25bL+v7U1BBv+pEkBnCJRg0NOCNBHNhtGsd08gFjx1ba5t305NK
	 A0M4O7EI/5VdkeWe1rJR6FEAfuf07mnzx1DloL81WN0bvrGLqyGi3vdvFKL0HilwrwhYp
	 O975kqmaaZFo+/Cb/sS5veyz7L6WT0vmhvZ11wd2ZcndpERln5PcPCE75WoYrB2YtGvrb
	 XnnuRCj0J75XYNAnfqkcc5oi0YisIGnhmGvgnx6exN69myOHxqadZkJmvhZSd9iHBJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgj9aZ31;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D7606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8D7606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgj9aZ31
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso9996935e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815685; x=1795420485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=;
        b=Zgj9aZ31u8m3FzsGEhEs7KO15dsARdwE1Gkc6+g5hd460kl94T88hNK4FMOkxBUB3J
         V3pRBbkdWaNZvU5EzTndqpK2kgdqj5O85mjsYGd/zFwWD8aR0YRNFy129Yrd0meN3TW0
         Rbfr1YpuiRjEYmfQ1oRxsg7YTZ1R1j2L7lE50MB6uGa3eu/CrhnVHTq/FPeUqKg/lbwJ
         1/Pkmh3CjCqDun2aCVECmyaPf3HgLsKGiUR1WlKFSzyDA2FnHDrCafkka+rQVBjXtDK2
         NOsqxyKdCIP0JQvz4xJhzI1wOfEBPZg0LozZuokQ/+GHuLGsXRdcBpV3g3WgDpOtShX0
         wO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815685; x=1795420485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=;
        b=RfhVAorkY6cfg7CfHDWGq7LMNKtK12q/amksXXkQl4WxjVp42UBylxqCVJ1uOd2h/Q
         iVDSjH2t+mYg3XunrmKu7O7qQ55Xebk1l6L3fV5CFuH2HM2WL7e7paMvAGK/1weyTJ58
         SYRmankG5lGF4g8aEMg5jXF8+mcvWkEdn7FTOBkCNv5WeiR5xjztku8FZ+ErnRSqEbU7
         loNm8GxdfAoz1ztUS5EOTGXHDyqylkcEW6bfGlkYdfJqeqCV2rYobng6IlPA1/kqBlLC
         WMU7pE/dwSRLssmHSwUua/zTRYfy2gCCo5MjFTpzQWkaMJEYpuQlPHx/9qv96cEJIcLV
         fVsA==
X-Forwarded-Encrypted: i=1; AL+hErHlMV9qOG2YH3DrlV+/Oojop9gr6AVfKVpCABcYUkWMdYKUDiZSUWbwrtX0NQ8Z+TQo79TBu6MPU142KbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mG0RHySfqJLFBdkOFx46RFbS/gYTvDy1ZJg5xGBfoe5laWRd2
	1OvIR9vBDRyjUYrAtib4/O+O24ZtJmzrulxlxrzO8q7SIVKUNAesCnzT
X-Gm-Gg: AYBFou3Eppu/BxL6fKKB7E2SlJ2xZOIRORJiXUf+XstztT9K62xQKJrHIao6C+zUOR0
	ZJcQdNF8jutUOpaqI6oeKGbp+Zi7kkMpl4dcBEXZDSKDfvWIiiKr9nQgo/yLtL6ViwhnXE0TRFD
	ldlntiJlbzLpE6s8SGEMNZILFHKIxUAWlYGxANxza0oDEz4jocHzYjTj+oKJQbpu2ivBageRhOE
	EK/mvezvSiuu5bI/pJmk4KIvkXeRtBrq/iVagEJvbbt0PqNkneyV3k79t6rMwh5bCBqHFaqSY+0
	68BT3mDOgNt9thb4H5vBPGIaBpRHxT64X8TONxPFZOFu1r1GQrjrCvbl9+E59AFhpN/+qa+opfR
	9jgLpThMxJvtuYli/ST+vtuXghU/gzpe2uhLpwcfo0LLiP3PFYV3emJGIxGM5fucoMp25wdObvL
	dIENyXq1iS8o8r3bxzeiQm9XajRhC3J1GnfVerNqwLj8piGRwSbwnT7vdg0/pMijLYNn3F8pduF
	gGRcbIjNCglkCziIdq8hAolwpv6/iJYh+5scykic7awCE4XnHxy0zQTd0JLiywcDjxhI6SE66R7
	Fmc80mcACY5cZ6XqOfNwWmuve/mLX9fJLiaHnJgfDoMsYK3mgPoNKif4Lp8j6RC68qEkf8/sOHV
	4XDoOWJTUko29s69eIl/cN8qmr95s1CLyySI92WM3vtlYhQg3xK8YWclzt+ljb9jfysy1fGUiRh
	n/M5rnzQ==
X-Received: by 2002:a05:600c:4e88:b0:4bb:7033:c936 with SMTP id 5b1f17b1804b1-4bb7033cd72mr46814345e9.24.1794815684668;
        Sun, 15 Nov 2026 23:54:44 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:44 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: Always inline preempt count and reschedule checks
Date: Mon, 16 Nov 2026 08:54:23 +0100
Message-Id: <80d8bdd8995a4b31a44e65bb9347b41c5be5226c.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
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

The preempt count and reschedule checks are plain inline functions,
which permits out-of-line copies in instrumentable text. The checked
notrace helpers added by the following patch use preempt_count(), while
preempt_enable_notrace() uses should_resched() with
CONFIG_DEBUG_PREEMPT and __preempt_count_dec_and_test() without it.

Force all three operations inline so noinstr callers keep them in their
own section.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..805f7b33baf09 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
@@ -75,13 +75,13 @@ static inline int __preempt_count_sub_return(int val)
 	return pc;
 }
 
-static inline bool should_resched(int preempt_offset)
+static __always_inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	return unlikely(pc == preempt_offset);
 }
 
-static inline bool __preempt_count_dec_and_test(void)
+static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
 	 * We must load the combined 'preempt_count' after decrementing

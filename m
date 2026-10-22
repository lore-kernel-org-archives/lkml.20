Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646247;
	b=bQLpr6y1GLb0BjQu74zXa+Q8WeHb1Ahxt7PbhARjyw5wuQHG1wGZNYBz9DrtDfdj99AA
	 KBpIe2LQqXl8LVpeoGrx/ub7eWuIdFDFQcEZf4Pce7dUQiObjY3qS2RZwCls6RJb+EqhA
	 n+aHFj0FDhK8vHvcPm6Hyk76ieEoqjJD3a/2KnDoPs05y5Kgl24oPX4EjnzW4+azOOzvO
	 AxMrIF5xh7ceFQxL93SQ8Ud6AyndHAN9gZkzl9MwYFb20Gb1uGbaHcAtVMol6pPqCUpb/
	 FDJrrkA/Btuh5G5NFSCcmwnclVPqPk6VYejlxC8tJbEfNIm0e+4ekjiEnKo/DUEXDJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
	b=gXOBjLnwsEXlfT8f1WBYoGWu09SgFx2ZBlG8dNEtaShQTt/ekEAfqApMzxZAPBOi55xn
	 o371QmEAfjQlFpm+4eiIVt3tPVhNGLVQ4Y16fsVBM9/1K0eMR3cbBRupd/h1x1VkDX7Dr
	 ZgMs5DWbv14lWPcq6h5KTSLD2tKGsuYjC0/AjuX0+Lp2HK6eEjEUl426cLevxtgCGDE5z
	 AzrPd+0psVSGKGB719pSvCBkDui/q87B5C74pr8NwtSE+YSQtYapi2X3XJOxVEE++caxA
	 JQ3VMWLnmsqOWR9NJkvRjSL3CJ9gVP6a51z3zxwcB9wa4XkO4M8HC9s1aHf4WLRtGBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqkWBcSc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73960A260F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F73960A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqkWBcSc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso1088105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646245; x=1793251045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=LqkWBcScPpks/4WfMW3Pd7NIY0qc2VVqJZxuI23Sxdqcvct8QTowqDeNQwpvDAMz0h
         eQGDp45mamYyDt+QdYyimZG0l+6wjwZWocX64RLTbkrALUJIkvv4bLa21W/k5rJW4qTo
         2lDbVMzpLf+gRcvw7Iw6NkhDUaquxhX6dcjJrUdX6e3XYWdqqjF+PAW77EUj3qzZBowx
         +U7vr3uSOjkNS2k2URv6C64Zy2UzfOqLLwDah8oseX5M/rKrTZRV4rsaIBV65/8gol64
         D44ejnTi7pe7aYQkkfL+P3W+dP1ECSUum0vK8dbQHOSHPku7HP9/RGGWpbMTq4ETL2EE
         LKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646245; x=1793251045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=k0HO9EQD33/8IW8nbLrn46eeci9A1BEOlW9tkeJiha2D9rHGLR9yuN+m0JhgS/hNt6
         2+X66SybbnQ/mDphLNq3Wxthl739Fd/y3Oi0QguP6auWvsHtJykv/w+HqOi0pEsca+81
         S00ZFD3/6Ivt1kqpkHc5nHZ0sSG7pHmwS/NoATETp/46cbJ1ESDNULZ1cp+v/u9LYPUb
         Jlkq+3fLNPi7dHHZRvWkxPWmmMS3idJ5pFS5QNfPYHmEWdds9EI92NxEmqLvdg4vLBaY
         UF1I/ObScfQx7oXLHmIh7CqBx7u5jJLcc8j7P+zRml/5/rkzb5qZ/MI7DEU82WBIX4Di
         3xoA==
X-Forwarded-Encrypted: i=1; AKwUvBzYzfpS3Eb5X5pm6z46Bggo5zg4fZ/k0mU/tnKWW6W/qSlffj+fXnPjKQai94Uedat26oedrPXO55cAtjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+R5pYg/A/NrZ3G+6rR6wArJy0BgjWLQmJ5K1B2/jC8VNNGfNz
	S3RA+z7LWs4H8NgoqJol5yhbbu5r+7uIJvLDOgpFqv/rXO1PNS05IYuh
X-Gm-Gg: AYBFou2ctY+N45qUaV10ywJZsCjYxh4uKVBm93ihwFFT3Hw0ex5USsYN+foRaM3PrBk
	pUVRwN+/PtsjRcmpNfAk2teL8Z+5OkLJrGaP+5vygQMRoBBEPaoxtefZrhFs38Vh41UB9VLnT/O
	9KMAumltsfly30Ar1a/tu/UlEArDNUhsz5SXS6SQ7KcJ/PMeLs44j3hACBgXePreUpHDHj12MpR
	3s+FlFIftaBqU5+JrCtjLybImuMzoThlSz8OIXb4F7yff7FbnpQMX/h8iPNqXB1sXeQBAsI0OPG
	F7XCr5af9hK+9U209lckDANdIgeZbKgfx7Pc1LdkUQb44VxHfzXnT8InimOI/ldSBwjB1BOhSRS
	fDzrCVwkWcHY/dO9wZVDoWcWIx+LIO6vH7sgAbEdm3694DN8ntSMQoibdyCkuYijAHs+mXHnLYf
	PQueMP7XPIcCxrFuGkNEqDfgAZPznkDf09tvKCN8kHZxl79NLuyuDspr8F1lbo/1mdzYTKwbNV7
	YwaqFNy4swvFMEwOuIqpzfEDfLb0KSj4+f+ZZXDwVyIKz9odmHPLhJEIu2hq2nN1yysvfFI1NmM
	BWQhShiRMaCwVPaJR6GzlU1twEW/dklsBNUoV85C6LOO1cDTioMoscU2fRmsBDYnSg3z167X3Hd
	YObuRm0z8yaf8ZAXcGdkr/B6uTi/0bvEfOo5/8LrfFDGtcaulFzWs+whCGQA=
X-Received: by 2002:a05:600c:4f50:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1fdb079ebmr98097255e9.10.1792646245241;
        Wed, 21 Oct 2026 22:17:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:24 -0700 (PDT)
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
Subject: [RFC PATCH 04/12] entry: Skip inactive IRQ-return reschedule calls
Date: Thu, 22 Oct 2026 07:16:46 +0200
Message-Id: <20261022051654.79224-5-kmehltretter@gmail.com>
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

irqentry_exit_to_kernel_mode_preempt() calls the dynamic reschedule helper
when preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 3ee80e926a17a..24c2b9fdff4f4 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -487,7 +487,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0758F093
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886521; cv=none; b=ak2HHPlcL1QkA7Qr6LI0TpzR2g3hkACHVeRFy0yx148qL1cQ8sTKjlWeUxAfsAkOTs7qnH6pmvUnIZmRnNNLHR3o9Uw5dyw1qXVdB3Tjfvx48LCz6h4SnYakwpWRHPqNlEHh85NPjZdupGg46bzW0Qlr/Uz3x+JUntUV1EW3TmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886521; c=relaxed/simple;
	bh=D7dJVybwPKSlApecBF+pMS/ZKTr29P6+H87h9M038Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxBp62isHcZTavXrYpifAU4QW2hvJZpyPPVeDrUvr8pnQqEyAQjvjqIhuT1K/vLXbB1QtBgKaiy5n9hkfcSfkZStZMxlLph7n0ia07S13fRdRLX7zfF9P2BAm7k2n7XmnumTTGBqdd1Pkq7bPz3D+8/sNdzVh1jvNBvoLkeR8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tyk/ogiH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tyk/ogiH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso145435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886517; x=1789491317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4I7/tk4AzeXA19kVEngNjvzyfvBO6TVzR+9+9eypgrU=;
        b=Tyk/ogiHJOa7N4cFUkShyTwLu6OIUuRujP8KI1hMdyjTIzEmwjANVm9SVh5uj6Fcjt
         HDc4/AQIWgx4lAa/vDomNvsyc5/n77BJu51tprkt+pEYF48+4Q18s+NAQBUVaTrzKfiI
         Ppty6uzNGfdY/4n19EfvZHrUD45bMnqiKDdcJFkgb4j/YOCS2LQ7FqYbC+5msAhLTJhv
         pLJJZeY8Ac7VT9edIE0j4f+PjEm4FdPhGDaOCqleDjPoEMrdvzJWnvOzbwlKjS3RzeQf
         ihI2Kk5guyrsWOUuS9KgSb2IyMdl6AumbSGBHAHvvY1y2+U5CFR4lUScqnaebeHpismM
         2HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886517; x=1789491317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I7/tk4AzeXA19kVEngNjvzyfvBO6TVzR+9+9eypgrU=;
        b=E9eEyP/agHAUVdggMxWoHGTs69af7eiqws1QiXKzSHAM523b0GhXDEAiOtyHQ/g4eT
         L+4F9MRMT2/xXUZfww707WpF2bVjAREyD7MP2EI+65aN6hKGXcfMbQiEyqL4w+07qBmY
         +Ep8yDK41sTZxCRzzs37/p6CleU0rZL5gt+nBcADjo18AN2KzCt7+4mSHrZtYptjjnFd
         OSm6EHNxQJJx0uCgz4Rxzk2zSC1L2+v01g4Agz7hmIm02xdjjuJGilCFwD8UwaoQIeT6
         qsgQvB+s1/55xWPeyAIKNhwaEEqWVPgfHOKiBrCagwYDiKpI2gy+JStvN+/x2o24LDSz
         dorQ==
X-Forwarded-Encrypted: i=1; AKwUvBytA0Sb2NiXKaTPshP0gwW2vAAzsNXOQjz8TxWPboS61K3x94nX+CWA+CYsRdH9rW7DiZUFi0VDiK8SUOA=@vger.kernel.org
X-Gm-Message-State: AFuF++mTHLQLO6HMUsgc6CRPvniRtE1e1YGHKaVg5u0sqWbyXbhJeoVw
	Jvn73O1jFKMOM6Ftl6yuoF7XCAbzRU4A2pF5qs/JYrC6gbYuPyMVJ8j7A8tRQzdRPQ==
X-Gm-Gg: AYBFou34b/Xus9qGQq/mgL+I4GobEx3nhyMWA/TndRxLH/H9xXAzDV8IwAJKOCLV6hz
	dGJAQg4OF+ahmC9fbkZOJkRlaPk6IW4UvdBidarrYgtg1Sbc8nv4GajmVDCxW/tymP5pX29Lv/g
	AX1ltsRfibrjPO7rzgHMm8PzsXRYnsw4mjz4CmRGXF5ld924dqBFmfFY0ci8EKkQwGTeK/umOpK
	FeNQI37T8dJ/U9n8nF1dkHy/HM5P7L1+WIZivOIs4NMcbJcSGv27BYbuNnyfrIbhGeM9GHkOso3
	kQIyJw7cqA5YPnVpiLVFZmAkv/mAKk0Vc+9vZeAKz19Vw0EBA+K4C7yClBAlXbp4RIIeYzDj/eK
	kTdcvPyaUu2tL0olU43wDdWgjPCY8VgfA9PWrUfsjfCCXO8Q+8fpAeb1SGPYbQmm8Mx95JE4lZp
	uGJAfK5yarU3Rp7s/aP01qddzfamAbAPofur2dWSWSWy4+OQg/3YTkXedIA5MT/HBlYwiYgVg3Q
	v8inhC6Cta9rqYJhBCPVFaGrrFF+W5+m7onIYwGN8jCFRiC
X-Received: by 2002:a05:600c:35d0:b0:499:fa56:f542 with SMTP id 5b1f17b1804b1-49d01d85e40mr4018175e9.8.1788886516560;
        Tue, 08 Sep 2026 09:55:16 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm504671695e9.4.2026.09.08.09.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:15 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:49 +0200
Subject: [PATCH RFC v3 09/12] kcov: record return address on function entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-9-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=4458;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=D7dJVybwPKSlApecBF+pMS/ZKTr29P6+H87h9M038Z0=;
 b=blRTwufZNn3PfEU4TTbSRB/U9sQkxGpHTJbhKcJ7EX8g+GufzihLPqn2ue1NeTqRQ7qpfVzNg
 1CypQf5tHhwAz9R/7Rz71PqldPRjeK/IEXvpu5jzzedr5uZCGzZvQgo
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

It is helpful to know which code location a function was called from for:

 - attributing calls to source locations in the callee
 - attributing calls to inlined functions

For this purpose, make function entry records bigger, and record the caller
instruction address in them.

Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/kcov.c     | 26 ++++++++++++++++++--------
 lib/Kconfig.debug |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 83e05aa61728..88aedaf41a9e 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -202,7 +202,8 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, unsigned long record)
+static __always_inline notrace
+void kcov_add_pc_record(struct task_struct *t, unsigned long record, bool hasext, unsigned long ext)
 {
 	unsigned long *area;
 	unsigned long pos;
@@ -213,7 +214,7 @@ static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, un
 	area = t->kcov_area;
 	/* The first 64-bit word is the number of subsequent PCs. */
 	pos = READ_ONCE(area[0]) + 1;
-	if (likely(pos < t->kcov_size)) {
+	if (likely(pos + (hasext?1:0) < t->kcov_size)) {
 		/* Previously we write pc before updating pos. However, some
 		 * early interrupt code could bypass check_kcov_context() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
@@ -221,9 +222,11 @@ static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, un
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
 		 * Update pos before writing pc to avoid such interleaving.
 		 */
-		WRITE_ONCE(area[0], pos);
+		WRITE_ONCE(area[0], pos + (hasext?1:0));
 		barrier();
 		area[pos] = record;
+		if (hasext)
+			area[pos+1] = ext;
 	}
 }
 
@@ -244,7 +247,7 @@ void notrace __sanitizer_cov_trace_pc(void)
 	 * This relies on userspace not caring about the rest of the top byte
 	 * for KCOV_RECORDFLAG_TYPE_NORMAL records.
 	 */
-	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_));
+	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_), false, 0);
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
@@ -254,6 +257,7 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 	struct task_struct *cur = current;
 	unsigned long record = canonicalize_ip(_RET_IP_);
 	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
+	bool ext_format;
 
 	/*
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
@@ -265,9 +269,15 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 		cur->kcov->suppressed_stack_delta++;
 		return;
 	}
-	if ((kcov_mode & KCOV_EXT_FORMAT) != 0)
+	ext_format = (kcov_mode & KCOV_EXT_FORMAT) != 0;
+	if (ext_format)
 		record = (record & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_ENTRY;
-	kcov_add_pc_record(cur, record);
+	/*
+	 * __builtin_return_address(1) is safe because this function is only
+	 * called from C functions, which are compiled with frame pointers
+	 * enabled
+	 */
+	kcov_add_pc_record(cur, record, ext_format, (unsigned long)__builtin_return_address(1));
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
@@ -293,7 +303,7 @@ void notrace __sanitizer_cov_trace_pc_exit(void)
 		return;
 	}
 	record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
-	kcov_add_pc_record(cur, record);
+	kcov_add_pc_record(cur, record, false, 0);
 }
 #endif
 
@@ -441,7 +451,7 @@ void kcov_finish_switch(struct task_struct *cur)
 	record = KCOV_RECORDFLAG_TYPE_EESUM |
 		(((u16)(s16)kcov->suppressed_stack_mindelta)<<16) |
 		(((u16)(s16)kcov->suppressed_stack_delta)<<16);
-	kcov_add_pc_record(cur, record);
+	kcov_add_pc_record(cur, record, false, 0);
 }
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f763f0504f62..55c786a373b5 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2200,6 +2200,8 @@ config KCOV_EXT_RECORDS
 	depends on KCOV
 	depends on 64BIT
 	depends on $(cc-option,-fsanitize-coverage=trace-pc-entry-exit)
+	select ARCH_WANT_FRAME_POINTERS
+	select FRAME_POINTER
 	help
 	  Extended KCOV records allow distinguishing between multiple types of
 	  records: Normal edge coverage, function entry, and function exit.

-- 
2.55.0.979.g7e5102b832-goog


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4BD58F068
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886507; cv=none; b=cC5ErZE7MwGnU4KlKfGVLWJZogzz1C/qBH8qM3mLAFXgBPhsImWN9hcH8HKYu+UUhrm4+HJU6gc4+zW6R30jWgl/7C/u26OmqWWHzXxgvFB80XGVkLTTXzST2GQxa9lBHjA5kuFPV8DCSSTg0dZjYDMA6xEflehDggyhW9OJjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886507; c=relaxed/simple;
	bh=zMSdv79W/28vOlNus87Hr0NP1H4bhJbv+hYzEQlIBho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=to0ao2YsCtmeIzZ9qqPr++85ejiutlA5e8w6olNmXzEjk6k7SD+9DbcbedrTOc2kk8P2naCKAy9CmqziqmfohYG+/NDhtctMAYaCVkb6YkcA0RtN72TD5OgMPqOxw8QmjlPkSTKkZDqr7Jnn0DdW/juEsM+olbIA6mStTrtSzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5L5LCUT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5L5LCUT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140755e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886503; x=1789491303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RnG64ZBEYmtca9ZKg3SGvzKLOcbOD+eKnvKZpxSN+E=;
        b=h5L5LCUTJ8+sgQIq8Z+Hs7sTN/aCB2n3BtV7MaOjP0TcXCveZY/T4wQ/fX9j3svQkl
         e4HVnr2xw3lDkpEjuiffo4rwiFdi1efL/7eyGC5o3K9PRefwK1DEiLiPB3zfHfUhTQvK
         G92WqWee9eRuZBdoXgotmiDrAjzBhuU/XcpjtbwvAOpu8jkoeUc7Xqls47kbUk4ZEtNn
         OmhpxTBk2lwB8XEeli96Xo0Htel2ubZSweKNZcIrpPmkQjMQ0SJcb1TLY5MSdRRYqz0/
         6zq91D7/TlkDFibQEqw7peggqBZ24WRwJZb2rJOyseogTVRhlkQgaeJNchtLJ6AtrsiO
         5YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886503; x=1789491303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RnG64ZBEYmtca9ZKg3SGvzKLOcbOD+eKnvKZpxSN+E=;
        b=cIcTPOXWiIECoZvTy0bS2wzsQGyvSOXK4y7JwA8iGQ4FqE+dNQD8mmrYpBT7oua4G4
         x/SieBdoPHEDKKzeEGJRv+HjSrNap+RZHpA1D9Zs/YEKzmSu0JueRIXISsPa+jnk+Iw4
         ecNVcIqz82FzaHV041N7i3CfnjdXWHYxHnB7Lhe5YhOc3xtJwy7PubfSJ2wGoeFaW0l6
         kSVwpkOmCY/+Mw2Udn5ODvJQV/XemdKp/0ysQUR+nox/54Hsj4VghxZm434eM0cC6FUA
         jVsyYZ+gc4bMuO8lnBCkpMjTH8DcZwU/xRVRm1XfhSxnSbY4hqvI+5ui92OEtZeX5Lmv
         3Z9w==
X-Forwarded-Encrypted: i=1; AKwUvBwOMBQLr2FZmUAsiMtsX3Ym1LmjYEVywLwaAeh2VkRwx357uaMGVvv9fBKaSKTIgdEi2gBZyExIWdABJUg=@vger.kernel.org
X-Gm-Message-State: AFuF++nZqgVMp5z1+ra3SAnVx+ejD1dPeei96W2V4TwXtXxxV9sFqQSc
	wVbQ5+ucIsVNQogaAiIQ6blgSWPtKmLvX/eshVmekZjk1jJ2WSKNyDKFWl4qR0499A==
X-Gm-Gg: AYBFou2CWFv09Tr25ZuneVo8Hem9wQeObD6U2Rd2fPcj7XIBuAha799laVgqBZNn76L
	NKED48LgeefaYfAEx51WKOc11IxpaC9UZWOJSoWlfNPdwbnFbuIMKZMx+wgIPmP2Eq8mlYoInml
	rMNoQn7BNX/dw9WPXv3k9b+9+fPpAQOqGkY4VHUQFOyvgCEr4wxpSR6ZhBiIvItlcujADrzQp1w
	0aPUb1pQ3UZVWDM36C48l9V43WFbZ2DEE4V3ourvOuPk9nkisE2n996100QZ0bNelozpo80oUJe
	vmqbPCVt51IO7fIeq6qJTVYGIhCncEd3xMmXEs8LWUFnD9mkGIYb6v9XROTHxOG5ylq9WoKKukI
	PFYhtY9JBE7VfrP8pLVSXsbgwAc4re2wpb7YF+j8Lo61syFuPzdi/BTwy9svxNATs6Jg03uwzBo
	+Id9aqWJu/GsRGMYKZSS6nXyM0vAgwcjMiUjy/IjKHxAhpwbOACKuY77jzSsNTvMpgUd0ISOvON
	30i28/GAuCk3eA6XBZfJIzQQ9f6Y2Mz5fU3MX6VP7mYWutw
X-Received: by 2002:a05:600d:8498:20b0:49b:c90:e1ee with SMTP id 5b1f17b1804b1-49d1f6edc70mr25955e9.11.1788886502918;
        Tue, 08 Sep 2026 09:55:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm42560497f8f.12.2026.09.08.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:02 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:42 +0200
Subject: [PATCH RFC v3 02/12] kcov: refactor mode check out of
 check_kcov_mode()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-2-dcbc11593e88@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=4314;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=zMSdv79W/28vOlNus87Hr0NP1H4bhJbv+hYzEQlIBho=;
 b=dc+rBp1W+qTZPJAb2xVJwbP8NlsZyRFXM4Sx2H+OrYfUbG/leu3BWxB4V4UE2C9jlKusRh70p
 pgZDfOg+3/aBNHPOcsYwX4To6jVbLUPym3MCTzTQ3ybFpAbQtTc89Ns
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The following patch will need to check t->kcov_mode in different ways at
different check_kcov_mode() call sites. In preparation for that, move the
mode check up the call hierarchy.

Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/kcov.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 5d9686c8b3ec..26baccaaefa9 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -167,10 +167,8 @@ static __always_inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
+static notrace bool check_kcov_context(struct task_struct *t)
 {
-	unsigned int mode;
-
 	/*
 	 * We are interested in code coverage as a function of a syscall inputs,
 	 * so we ignore code executed in interrupts, unless we are in a remote
@@ -178,7 +176,6 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 */
 	if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
 		return false;
-	mode = READ_ONCE(t->kcov_mode);
 	/*
 	 * There is some code that runs in interrupts but for which
 	 * in_interrupt() returns false (e.g. preempt_schedule_irq()).
@@ -187,7 +184,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 * kcov_start().
 	 */
 	barrier();
-	return mode == needed_mode;
+	return true;
 }
 
 static notrace unsigned long canonicalize_ip(unsigned long ip)
@@ -198,14 +195,12 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static __always_inline void notrace kcov_add_pc_record(unsigned long record)
+static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, unsigned long record)
 {
-	struct task_struct *t;
 	unsigned long *area;
 	unsigned long pos;
 
-	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
+	if (!check_kcov_context(t))
 		return;
 
 	area = t->kcov_area;
@@ -213,7 +208,7 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
 	pos = READ_ONCE(area[0]) + 1;
 	if (likely(pos < t->kcov_size)) {
 		/* Previously we write pc before updating pos. However, some
-		 * early interrupt code could bypass check_kcov_mode() check
+		 * early interrupt code could bypass check_kcov_context() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
 		 * raised between writing pc and updating pos, the pc could be
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
@@ -231,20 +226,28 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
  */
 void notrace __sanitizer_cov_trace_pc(void)
 {
-	kcov_add_pc_record(canonicalize_ip(_RET_IP_));
+	struct task_struct *cur = current;
+
+	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
 #ifdef CONFIG_KCOV_EXT_RECORDS
 void notrace __sanitizer_cov_trace_pc_entry(void)
 {
+	struct task_struct *cur = current;
 	unsigned long record = canonicalize_ip(_RET_IP_);
+	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
 
 	/*
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	kcov_add_pc_record(record);
+	if (kcov_mode != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, record);
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
@@ -259,7 +262,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	u64 count, start_index, end_pos, max_pos;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
+	if (READ_ONCE(t->kcov_mode) != KCOV_MODE_TRACE_CMP || !check_kcov_context(t))
 		return;
 
 	ip = canonicalize_ip(ip);
@@ -379,7 +382,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	t->kcov_size = size;
 	t->kcov_area = area;
 	t->kcov_sequence = sequence;
-	/* See comment in check_kcov_mode(). */
+	/* See comment in check_kcov_context(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
 }

-- 
2.55.0.979.g7e5102b832-goog


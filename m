Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991C486BA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502590; cv=none; b=JinBEpgIk1SOm26tK4cSj9BWJDLa/zyjNjJzGu0h+BclQqW2pc18Qtg6Aqa0Kp+pMg3xB9591y0gf6jQlzYKXCa3Q+0vSiH+oGqO5AAhgIiaXvMtKWqqrOiPR+yU62/tmwLqD5eE7V9OQSeQV0Y/QF8+H14RDPyWPaRwfH8fV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502590; c=relaxed/simple;
	bh=M/rQ4561R6UGKHsMQcfnGPKUwVjb9tqVoXZCGSnYpGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN1JoZ/mteYS0AkHSEZY1d0w5bNgycPw5dHFweMLQ/ycSPFTz+LAo/A8tHoihEn2s3vK8g5pTy42VzGdfSng4Hp483Wfd2Xz7B6m1vEnixz30NanvCLv42s4kjrCjATJVty+Zat0ODYydb9vSh9pMHvFQaUmZGLxScC+jffPg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4bNCNlE; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4bNCNlE"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93c5b7f5bfaso478683485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791502588; x=1792107388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5p2nTO5pz9p/mFq6enSm35xmN3QB4rNCp8nZZUu4Is=;
        b=A4bNCNlE2cQ8mo8jkpfdFWeILTEGV69vADUlry59sokN4N5E7/BVzrWWjPS+BZwXtj
         Rja0UnlC55PWxLIReHMXljNQsJumU+4fshNL2+GKkpqq5PATYGAkiG9T/SDlxnNeLYJ7
         ewOLMy4tUZYi3p6FT5fm0XoN/Dq4pBunzTw80q5RuIWdjdEtiOzs7wOeiPICK28yY5Iy
         d283p3I2r1aAAU9xorYtn9UQCZ+xOt+/6FolmrgiP0yVs76i4yoVNsJfm/089kqGTR5e
         TO1UNH+ht9sstmfqS2UYByJH/+8IVhdl5EwROXbrt3dVPuUJ+dQfPJ2c5DlZiVRYtI9b
         mS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791502588; x=1792107388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5p2nTO5pz9p/mFq6enSm35xmN3QB4rNCp8nZZUu4Is=;
        b=VCI+9SwKla7p8qASDG2Qho+Z/HN9fSo1woCCsispupN2zr6qKktvSIxrY3090dwOYp
         DQQ8yMPkiokQa1HCBMz+f9Dt/4iiBmupjZx8EimZXCgtBm0diazV6+BLQLs4jmnv3uSy
         fLjLsM05TTdV3t1Y1ekivpahcJRr0y6cLfh8HXdLKarNeNi0O/+zIGwR3VvWYeJKwOO7
         VhKXUdqbOPIKJt0E1I58HYlTyXIq9y9TptCMu1boWXloraXfpY1ivqkXDnyH0ppDyWvY
         U5h2YAPhMbjVA46KSxxGJ3qqNdTSOPYp5t6FkNff54tQ67Yo4GTnBjExM0eJ++CW3pks
         LCzA==
X-Forwarded-Encrypted: i=1; AKwUvBwwJvdsXQzejvrLJP70IfI9VDo0md5pYyyJ1+gUsk1yebMkyP1180dW2/BsuFJMKqbz+fWI/LBrRErjy3s=@vger.kernel.org
X-Gm-Message-State: AFuF++ng7bmdDaSwkX2M+Vi/ydBSZoHYiY0EiKGnf0K2BEhmZSR0Afgj
	cL3+LojYZUVus9szdGl0afOgOmP+jXElOmnitQbwaHoUSGy/XVPj6o3V
X-Gm-Gg: AYBFou2cdDpS5Dp1Y0T4tTpEBGnB+ezq8WQaNz5JkpBs9+oZwstQJH5U7/DOMtU2B/w
	ioK1c58Pe8KgfN1i+RJ5zufIu8vGlqLvnNa7T5G7vJ1IyjHomFVWMQdsdXYkXPHdAEY83zGZrfW
	uULbNJcZA/rBby2QAUv9x5aaibPwXNp2ekH46/x9novR/93amuUmmOaJcMPzVMvb4xC3LhYuVUF
	tpDz43+xPpY+qcUqc/VbrdIHMHZqZBOq1wnUhw2tAd1nIj+qm2bc846vKH9giF2Fojca4FhqekN
	RGjwpGhhqhJsX9Jn4EHmBnZ07vhIE5jwYsFgBTB9+RGBg5MEXwCPCo3/+f5tf0CondaZDPFEe0Y
	q82u2m5ktWm3O24Jw0yReOSCmmwfWKnBOd7NF+3NrIp78Om5QgeIF7luhXeba0C12+kIAxK7PBM
	Lr4moi8FnhkmXvpYvlmGaYVBt6cmp47ZGYoPj0Rrc70EapieumNe9Gpa8I8MZEDFMGXb3DPttKx
	SXuYqzL3BJtFHtXhubOEdaSgQqNSYMg82Z1WAOUw9FzTpBLY8KSGjx446WvODyLc9ReSAkbqp/m
	m1aRsjES
X-Received: by 2002:a05:620a:1786:b0:93e:5cad:643f with SMTP id af79cd13be357-93ebdc7013dmr16445485a.29.1791502588033;
        Thu, 08 Oct 2026 16:36:28 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm51693885a.12.2026.10.08.16.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:36:25 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yunwei356@gmail.com,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: cover bpf_loop() state pruning regression
Date: Thu,  8 Oct 2026 19:36:23 -0400
Message-ID: <20261008233623.4011127-2-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008233623.4011127-1-dwindsor@gmail.com>
References: <20261008233623.4011127-1-dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise 18 independent conditional stores to dead callback stack slots,
reproducing the verifier state explosion fixed by the preceding commit.

Signed-off-by: David Windsor <dwindsor@gmail.com>

diff --git a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
index 75dd922e4e9f87ebc947ee6e621a789cad10431e..c1c3099a6a20391c8b36b39eedd9cc6ce893d996 100644
--- a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
+++ b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
@@ -783,4 +783,62 @@ __naked void check_add_const_regsafe_off(void)
 	: __clobber_common);
 }
 
+#define DEAD_STACK_SLOT(off) \
+	"call %[bpf_get_prandom_u32];" \
+	"if r0 == 0 goto 1f;" \
+	"*(u64 *)(r10 - " #off ") = 1;" /* dead stack store */ \
+	"goto 2f;" \
+	"1: *(u64 *)(r10 - " #off ") = 2;" /* dead stack store */ \
+	"2:;"
+
+__used __naked
+static void dead_stack_cb(void)
+{
+	asm volatile (
+		DEAD_STACK_SLOT(8)
+		DEAD_STACK_SLOT(16)
+		DEAD_STACK_SLOT(24)
+		DEAD_STACK_SLOT(32)
+		DEAD_STACK_SLOT(40)
+		DEAD_STACK_SLOT(48)
+		DEAD_STACK_SLOT(56)
+		DEAD_STACK_SLOT(64)
+		DEAD_STACK_SLOT(72)
+		DEAD_STACK_SLOT(80)
+		DEAD_STACK_SLOT(88)
+		DEAD_STACK_SLOT(96)
+		DEAD_STACK_SLOT(104)
+		DEAD_STACK_SLOT(112)
+		DEAD_STACK_SLOT(120)
+		DEAD_STACK_SLOT(128)
+		DEAD_STACK_SLOT(136)
+		DEAD_STACK_SLOT(144)
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm(bpf_get_prandom_u32)
+		: __clobber_all
+	);
+}
+
+#undef DEAD_STACK_SLOT
+
+SEC("?raw_tp")
+__success __flag(BPF_F_TEST_STATE_FREQ) __log_level(4)
+__naked void callback_dead_stack(void)
+{
+	asm volatile (
+		"r1 = 100;"
+		"r2 = dead_stack_cb ll;"
+		"r3 = 0;"
+		"r4 = 0;"
+		"call %[bpf_loop];" /* trigger state pruning */
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm(bpf_loop)
+		: __clobber_all
+	);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762843;
	b=I2+XW8HM1Xqj9jxcqnMD/wPrxpbZUm+JiuW2B9c/sbDRTD0tjYZ7SuNNRDkY0HICRxVy
	 8m+65N5qH89LchqUusueZfaeQVr4m4G/dG2LoefJJ2leV3JKZDKo8ymgHrcTTB6pH6sBX
	 3p00rCjbOuvU6pmm4+rNV+Wdx8A+Lap+PGS6Ouqr0aq4nHRhLWlqy2iuF1GX+6xhGcIDH
	 ZcwvTyWwHKdafF9ZdbuJTcjrQou0PQjQF+5PTtqlF/lylMGPxgw0qkQpvzGWi0DjQIeoI
	 CnoQre1BpTShKtELTIBOnC6XFvcUbxxdkcmevIJm8qe+3OmGAwTnZU5UrN1JOYVSEMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BFr+2EFgu1Nhb0O0fEPP4E9HWvVTMR4rapiR13PNnbM=;
	b=Pu5eMTu04RCY103PAwPlblr3EUS+B/DYCOV5sD1w9faamTJpuVN/oveB7FiCVnU8qo9g
	 vUOQySoQkE3Vk+mMg+497M8qRpGn1WYmjlnjX4Pad0Kh82TiklKX+ZPvUQ8/zwLd8IjVb
	 Ud8qFXQo2OjQFOheoxsjGhZ6VR9nCm6J4pxHiYWcmByERGbfLeHEktElmmlix3Itn7eOP
	 9PnnJXMA7TMN+dMlFAs8MbtznjZT6x7NFk017VNYX7t5RjpbxiHD7vgZSBh4TNkiZiIL7
	 70peAExJMhDEqaB59t0DKAlmFHnCiT0CfG+SADyGgOc6KJ/mwBwcuTyUDxe7SmWspsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPkM8k9+;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4C606D80F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C4C606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPkM8k9+
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso111850eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793762842; x=1794367642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFr+2EFgu1Nhb0O0fEPP4E9HWvVTMR4rapiR13PNnbM=;
        b=TPkM8k9+c67hAid6Zd+6QpWcr2wBU43iV09DyDAJjer2cCS1BBUg8u4DYr3EIiihVq
         LyltlVq3FNxn69cYkcbTZfbl2IXcxwzmOEzr/6ld4+daTSaC7e6U5KDBpQUZmBhVWhV2
         YantVUmta5PgKluUMCOVjJHrvIJZbXvmBvFa+HatSLo+NoQ41G/jDUB6TaYfcL95C/J2
         YOp97EfwGUn9J6N0ikEstVZ4eJoJERg8RwJ/zu0Ftkfy9hQU5Jj6U1EJ4zitujOFAgzM
         lbGKIMOxgc5tGW8hSVSJo1oEjioTOohBb0/wCeDDw6aA78Ddu1OsWd4KTOlws8miYld1
         DShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793762842; x=1794367642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFr+2EFgu1Nhb0O0fEPP4E9HWvVTMR4rapiR13PNnbM=;
        b=aAhcQksfj2aEFaWF68ea9VcNYtYM5nXOjpwUx1AFW/NQZLHBJWhIkuPKFLLa4YtRwb
         qgJ+7emwJi7ZlDSgfzWgHnT8XKcBbyWKTU60xR9PnV4k6U1uH1riII1yLCxu+J1RuOMb
         nCcB8YRjPD9WXHyvV/MhYWgFdXhT3r0EfdmnPIcrhiWBplSEcwC4+ejrzkQHylVH4i9n
         mmB8x4i7xpN2OdXtSTEP7edqlwnM/uJ5Qrw9JFJZcSa5/B9YMikx2W99VnSNpQdlG5WM
         E5M9aLkIormcPKq2rbr8aLMHgaGEDgj8UOPeDNC6Qt/vWUliLcZ6TzIZzx9DDJq82jMd
         s89A==
X-Forwarded-Encrypted: i=1; AKwUvBwdkvHJ/SW5WE65f4ENmPVcmRy7HMFTW8DZ1TndzMjEEYSAaOyJfz9tKyrURHu9tNVsI6YlvHSgHV/8TwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NjuzUKHyR/IJID/OVMEw+2CfFRfH4dh0K00no4j3Aaopuw4n+
	7Ztrhp46nztOmPIyM79bmowvLbEHrlnzEO7Ou9JQJsRUAsLei09Ydu9X
X-Gm-Gg: AYBFou1Y5splrstYpzDIjQPSWRR6jX9VqPn+66Eydi2t11q08vJaZTPaNtyjicc2iIX
	zETGwqfdfnvLjdw+tg5Pq1VPlLC4x24geVJENIbSNWS0zsAUKtSCCTtjxmHO+fm0J6GL3GQoUBQ
	hU+OBDMUtHayYwqsOG8JiGxp+9a2MG/yRp1QiFWM5Gigz1qeTfDMHD0GlOGpq02xJwEcjqlWqcL
	HXyI7Icxuc7BOwx7bKWwFVPLOmFfGzHU7y0kLU7qvgoSxsHQXvFbrXxzJu8Q6QRFWM0lk8oTKah
	ukScfaKyuhl5B4XRfHeLuzG2b75damZIZdGJoyzpaP/+xxh9PJ/Fw4A3iaZHmR0ISvgDp6NCpPS
	x8kKVbCXzX4KovKkZ8IMQGbeHIKAi6hXtFrYqUmfGHE5Z4qzSuiUaufMPq4lbJPV4e+DgwBkW2p
	GK9Ff2nHmBQXXY9/csF4ZKj/FrvexwPmAa4w/zqik9QR4/tapipDmu2H/9n2Qy+Ksfeavf2v9Uq
	E6lrtCRZs622jhaCzopFpc13fvut4W8f/bptjd8WthqgsP5M6vp8StWBqAhG8ZcvQGsO5hKLbqN
	oSt24SieSn62+HDiMcxKVncR9ULqyeRnrPfeZqbwsybxv7vUdXCKGTu1dFP8sLgyIgYJmoyyotU
	0QmOvHm5ZQhD2j141Epduw7V8aIS3plFqQHH/IQ==
X-Received: by 2002:a05:701b:2806:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1ac5d2c5b1cmr22007721c88.33.1793762841634;
        Tue, 03 Nov 2026 19:27:21 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm3574613c88.6.2026.11.03.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:27:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next] bpf: Use 64-bit writes when inlining bpf_loop
Date: Wed,  4 Nov 2026 03:27:00 +0000
Message-ID: <20261104032700.55296-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The error path in inline_bpf_loop() writes -E2BIG with BPF_MOV32_IMM(),
zero-extending it to 0x00000000fffffff9 instead of the 64-bit negative
value returned by the helper. A caller keeping the result in a long
therefore misses the error when testing ret < 0.

Use BPF_MOV64_IMM() for the error return and loop-counter initialization.
Neither write needs truncation, and this avoids the extra zero extensions
required by the s390 and RISC-V JITs.

Keep the helper result in a long before checking it in the existing
bpf_loop test, so its over-limit case catches the wrong upper bits.
Drop the now redundant architecture-specific expectations from
patch_list_insert_in_front().

Fixes: 1ade23711971 ("bpf: Inline calls to bpf_loop when callback is known")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DMM0E6AA3KB6.28SYB9X6ZYIHL@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/bpf/fixups.c                            |  4 ++--
 tools/testing/selftests/bpf/progs/bpf_loop.c   |  8 +++++---
 .../selftests/bpf/progs/verifier_patch_list.c  | 18 ------------------
 3 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 6b719a28be68..321624a4b2b3 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2783,7 +2783,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	 * expected number of iterations is too big.
 	 */
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JLE, BPF_REG_1, BPF_MAX_LOOPS, 2);
-	insn_buf[cnt++] = BPF_MOV32_IMM(BPF_REG_0, -E2BIG);
+	insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -E2BIG);
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JA, 0, 0, 16);
 	/* spill R6, R7, R8 to use these as loop vars */
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_6, r6_offset);
@@ -2791,7 +2791,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_8, r8_offset);
 	/* initialize loop vars */
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_max, BPF_REG_1);
-	insn_buf[cnt++] = BPF_MOV32_IMM(reg_loop_cnt, 0);
+	insn_buf[cnt++] = BPF_MOV64_IMM(reg_loop_cnt, 0);
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_ctx, BPF_REG_3);
 	/* loop header,
 	 * if reg_loop_cnt >= reg_loop_max skip the loop body
diff --git a/tools/testing/selftests/bpf/progs/bpf_loop.c b/tools/testing/selftests/bpf/progs/bpf_loop.c
index 1d194455b109..7a8ae1110c0a 100644
--- a/tools/testing/selftests/bpf/progs/bpf_loop.c
+++ b/tools/testing/selftests/bpf/progs/bpf_loop.c
@@ -66,14 +66,16 @@ SEC("fentry/" SYS_PREFIX "sys_nanosleep")
 int test_prog(void *ctx)
 {
 	struct callback_ctx data = {};
+	long ret;
 
 	if (bpf_get_current_pid_tgid() >> 32 != pid)
 		return 0;
 
-	nr_loops_returned = bpf_loop(nr_loops, callback, &data, 0);
+	ret = bpf_loop(nr_loops, callback, &data, 0);
+	nr_loops_returned = ret;
 
-	if (nr_loops_returned < 0)
-		err = nr_loops_returned;
+	if (ret < 0)
+		err = ret;
 	else
 		g_output = data.output;
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index a9ad1dc56c3a..581b75b7b5c5 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -298,23 +298,6 @@ __arch_arm64
 __arch_riscv64
 __arch_loongarch
 __success
-/* The verifier adds two zero extensions for these JITs. */
-#if defined(__TARGET_ARCH_s390) || defined(__TARGET_ARCH_riscv)
-__xlated("25: call pc+7")
-__xlated("...")
-__xlated("32: exit")
-__xlated("33: r0 = ")
-__xlated("35: r0 = &(void __percpu *)(r0)")
-__xlated("36: r0 = *(u64 *)(r0 +0)")
-__xlated("37: if r0 != 0x0 goto pc+2")
-__xlated("38: r0 = 1")
-__xlated("39: exit")
-__xlated("40: r1 += -1")
-__xlated("...")
-__xlated("51: if r1 != 0x0 goto pc-12")
-__xlated("52: r0 = 0")
-__xlated("53: exit")
-#else
 __xlated("23: call pc+7")
 __xlated("...")
 __xlated("30: exit")
@@ -329,7 +312,6 @@ __xlated("...")
 __xlated("49: if r1 != 0x0 goto pc-12")
 __xlated("50: r0 = 0")
 __xlated("51: exit")
-#endif
 __naked void patch_list_insert_in_front(void)
 {
 	asm volatile (

base-commit: 8fb43ffc3327d12d57d3fbe6f4820b5a522de0d1
-- 
2.43.0


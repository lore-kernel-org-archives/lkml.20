Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C883AD528
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161858; cv=none; b=Vokh4gRysJxzw+E71cwvkj78ZGLLQRzLWvJu6fm9tcroMnceMYT+9fYapwwQqySSqJfa+HCUDa3d90xsUOtNBj994ZsNnpvjqMnjCFtJVAxzazmITqunaI4FiiXwlRtKtFNb01NstfG0ohzddIGaV3PpI0/1stMJsk+ehZnIg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161858; c=relaxed/simple;
	bh=HQ98az85ol9ykgd6Ibgq6G67fhmP9KbNYrzWQtRpRM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajafr63J6UfUsh0jvHoFlx+jcyuI/HOWicfqEIUt243jL7H82dqsF4Kowj/3MmCpnfPsFrueyZ8XXLfv6DvGvtoP9XlihgWPvcRndto4/Jl0uyTcHZ/xdA2DsTOHQoW3bczxMaWmTukPIATUYXyUXj/81SYoXSBlkmUEk3ooDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=XKCE4nVm; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="XKCE4nVm"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so689019e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790161853; x=1790766653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7qFG7exmvG6u25BqZtpI99huEdrJeNvIdqZ6NzVIJU=;
        b=XKCE4nVmiKICZmNOveLCVJmZc6nlyHmRjN7J4rqsm1VbCmf5NwRLyCsgeodayTI0TO
         0oRHwLzlmcNPFVmqNZYjivW1Ga12WArEE7kSbhnwndlNtrrthY0Fyvh0eKhr7mxxgpB/
         2baQi0cXgg+7gMAIwWDDO/CoysF8B4nKEXMi0Dt1b3DOhLLvUWI2ht/AuyJLlLW5z7Jt
         XKPFYl2+BfcbdYZ0+u8x2qh3ECz0j9jHPHxklEbpHUIb/7ig9Etri8Su49Cq0oZ55Iah
         ylRFcRDp70o3J+VEzxuMPg1WyuKb8iydxmwu7WCJUZR2RwKtGqXIkevXdThNqV4yqvtZ
         Mm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161853; x=1790766653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7qFG7exmvG6u25BqZtpI99huEdrJeNvIdqZ6NzVIJU=;
        b=nZnp2ic84NIQ0H4H3QMh4PSPMKz0orYX2v37bmlapSBhQz+PSKhqHb3bo4X2eqarYg
         FpiL0DP9BalCvhIt87fyAR1rvcYpr/hECV5zyBarvqvd6ZY/r2G81B7JcQTmPvayNvAD
         EjlFKs7fJtObKCC++22ekqKI1kc7BwD8/DNAY0SAsenzo//so71GllG952iA9nSDbgmx
         ZWBxdrL7wNWhIMpMX4y79ShwUm4FBA6rXWKTx4NMpC/7SH8HDdosqCoo9O6eW1hKFtif
         sjByfxNTG3pMekukr42NeYyVu9+2De3YsC1fLe46RVcLMOdINlRHoO4A/Yde8KNPr4kc
         TMIg==
X-Forwarded-Encrypted: i=1; AKwUvBwTXBd7fnmxZxrtXCMsJwd6kq0HcbjFRTccYrCeYcuOydRZLxk4GD1J+GmFzJWi58Yu+rzfOwvGS/sLSE4=@vger.kernel.org
X-Gm-Message-State: AFuF++nBcgg22aVBJySTB9Rs+kPBJJSijgXsfWJIUluVSWuO/7jBLZpJ
	PY0u3G0eJOkzwNfaTVho3J0Mp9h5oNWu1NJ4g60aY9TeDwz2sCYnYpb5G5e0S2IaVBo=
X-Gm-Gg: AYBFou2ti7KVTzCQJmuF4u/QY6tW5IHcbsKsjGuTRotLIMxzDFgliG+GN9x0V8tSFMc
	X6HByqpEI2tnCoVofhvQOfG7L+cBiYLrDsHG9e1L0k9/WM/9JUwWsVve+FtXVMEk6Ry3E0E0pbW
	fpEoTMs+k0D8f5lwqbErol9uj+wZUX4RYpdvDY/vOR+j6MvxLC2gALM1o4KV72TsMsW/UolYWbI
	lTQQbGN442FQdMM2enSgZdyANxd/9o6sUigKBfqXwY6xdAulH1dYW7dcu5i3ovGQrCXTrmNv59S
	06a9LSMdT0TjwILPUR3N12iWkfKfsePyTB7GNpsVMytfAAoGhh0xTcy+ory38TIOQYtPcQR0T+S
	KwJ0a2v8XrJc/g1HOyGIFtKTr2ANoVpy7nuAeYQX6YgeNHZe0tDg1GxlSbhrh2x4JGHQUJnak2Q
	VppzG1JrsNa9r1A6ZXyJETUQxlVVMlURhUw+z14tDDCnDHR+m3MN5WgjMqXZSrJU/G2t4iu91VK
	eTXwmKVbhH7GxD4yfs7djt7cp0Xg9o5WwsOMTonpNM=
X-Received: by 2002:a05:6512:1389:b0:5b8:c1e3:ec96 with SMTP id 2adb3069b0e04-5b8d89c293dmr844693e87.51.1790161853213;
        Wed, 23 Sep 2026 04:10:53 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8589783sm507873e87.51.2026.09.23.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:10:52 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf 1/2] bpf, mips: Fix immediate JMP JEQ/JNE on MIPS32
Date: Wed, 23 Sep 2026 12:51:57 +0200
Message-ID: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An addu instruction was emitted instead of addiu, causing the immediate
value 1 to be interpreted as register $at. This made the comparison
result invalid when the immediate operand was negative. Note that $at
is mapped to BPF_REG_AX, which is used for constant blinding.

Fix the instruction to use the immediate form.

Found with test_bpf on MIPS32r1 emulated by QEMU.

Fixes: eb63cfcd2ee8 ("mips, bpf: Add eBPF JIT for 32-bit MIPS")
Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 40a878b672f5..15a2a153dc87 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -1111,7 +1111,7 @@ static void emit_jmp_i64(struct jit_context *ctx,
 			emit(ctx, xor, tmp, lo(dst), tmp);
 		}
 		if (imm < 0) { /* Compare sign extension */
-			emit(ctx, addu, MIPS_R_T9, hi(dst), 1);
+			emit(ctx, addiu, MIPS_R_T9, hi(dst), 1);
 			emit(ctx, or, tmp, tmp, MIPS_R_T9);
 		} else {       /* Compare zero extension */
 			emit(ctx, or, tmp, tmp, hi(dst));
-- 
2.43.0


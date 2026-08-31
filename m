Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF538E106
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187757; cv=none; b=gf6kfH+O0/VjfrfGHX5fyxkcN4tAfuWSXqQhb0nvFtzIgR3te5zMteRjepQFSbhDcsJGucOi67i1zBXkS0ldAG0VZnn3rqn625Y6PlUKdTWYCv/+w1tXajBeQGHAzGeYS7oJ3NLmZscgAlQ8BkAeTTnaTQtGdaU2cQJKELjYigw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187757; c=relaxed/simple;
	bh=C1lF3gn4PlZOId9Mf6TvQ4ziZitw+Q+94byOj9Hfl3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HTca9xPCojv7Szhys4UOmvqEuQVz/hKhna+2qGFhnuObRVtMbcijWH9OQz3T1ZDCw0YgSt+/rKNN9R2CQbNfD3hLlhyznNIvZ5ttIfH9yaoUML5wSFdidt7tZlktoVGQGrEHwyok2qjdv2QyOg5RGIeLPeX3TEW+7AptOdFZIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esmn0ee6; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esmn0ee6"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cc64570deso39852986d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187754; x=1788792554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nJTLcyWSPxl+4itx4My99BV7MYdBXZSTbutUq6o3MY=;
        b=esmn0ee6jE4jeP3BhWAXneHr2xpxHRfo/8XookL5WXxsAHlV4v9Kd5ttBWxTyDAJcv
         +XEMCloi54v4ESlxShzQkw6MsT4Pu78NO+hbbmDcvMa8iBj/xJqV9pHAH+tweuRp/0dL
         NwmbdYZcljdlf3NPr5GYUxuM5Esjc2F6ya5S77c2LPLhHCoG+AVzJqRCGC0mfa+/xcZW
         MKqJQWcjWz7lV7KAZ06KL634ptEBnCAzWC4qYFgBv2Jd56c3JSFClfDNHU/xdaWgLP/z
         Uhy1p+UV7qIv9Jx2K0kUqLDh0d6QQvVGs2w7vYXL1YoaPnL5gy9+P3ZZ051Y0/FO7+VP
         mZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187754; x=1788792554;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6nJTLcyWSPxl+4itx4My99BV7MYdBXZSTbutUq6o3MY=;
        b=NSsw7r8yVZxPWBSvSsQvlgfuSHLTefTIV5nwSNbGJUIx8KEB1B2typnh7FT+XGZOQK
         UhmjFsmmTBhbRTJjCIBUrOPjwKxlMZzTOTPKJn13hnfjgoq/AoqR7I26MqnMYMR8EXx6
         PqqLGNR/LrCpSKRmQ+msLVmQ5ZsQk+PjDH5WphsRxXXxnjWlfbgWGLWEYWm59HuSY8IU
         VBY3Lbb+KloN9LhadorZHyNlsu35GXW68GAH8hVODPNrEMFvZBmcr29jF58nIsMsa1Fm
         eXbuMC/1mX1FO9YxaQ8qcRIqWcv49vou1dKaP7ikD8oUT9Dqwpaw2OWVoCkDLFezyQ27
         Nn/A==
X-Gm-Message-State: AFuF++n2kFflzoc0VuuPUpzvRNbJ5dbTPp5DeWrrHPxtUlCETkLPRXQu
	oDipvTR85NcA+taiUsXU5wqXlifGrhXqEXgwLIC4qNLOci1AW220b0ay
X-Gm-Gg: AR+sD11osNm2Ahf3+SFTW3SZWl3IbF9xFcn3evFZ7YYQBg334AfUX221hiV4I/B7ecZ
	7NAI52FONiFmXG7I00j9/huAOLkIW1p5fEwW1qyfmdArT+vc2iCJVq4CXcRrOaWFItXzU0wl2ct
	Y8WIpO9kjSWXxU1eK6vvIoRlZq8j7aiQCyXVWg1Gg7Glaxa0TkiXD8LwUpqwwikCZGclWzSgeVj
	UfeMld9G3i5H1LX9+QWFvH8uU0Ba580IGT5mRiSvVbrrTSl8IPgjgtfQgWwHvQ7l+oEj/e/MM9K
	xKV6HoO6iQ82Jy7w3seyIr7cQ8YFsMef4pK3Gy2D4TvKCkbn50ioG9/QI46aUhpSiEAnTbwpioX
	F6xEiGRPJY5bKSn9R7F2aXoh7wJtPf7vc6ZB/OcFREm/jH2OHnaLkM2gXsRe5dp8/JmkU4VSAlO
	JNP/FeRGYF2fba++Zx88fPo5WSqQ+El6enFFoTsF3SKoCvs74VwRwQU2zpyqJTJ4ewsp8GKZr/m
	f1FAqez6jB8Mxz7pA3P5FfntO9w9bUau5WC2R1t4DfYGo5JuSia/C7Wvmc1LSSu25548+E0Q28R
	NI2WQ2k29hVvo5sR8QbCFS1IDTItK3oIbZLTIbaTTcM=
X-Received: by 2002:a05:6214:763:b0:8ee:d9b8:8538 with SMTP id 6a1803df08f44-90e871991c8mr103911176d6.9.1788187749782;
        Mon, 31 Aug 2026 07:49:09 -0700 (PDT)
Received: from coder-so-so-first-ws-0.coder-so-so-first-ws.remote-dev.svc.cluster.local (ec2-54-163-97-9.compute-1.amazonaws.com. [54.163.97.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5ad4sm85798426d6.23.2026.08.31.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:49:09 -0700 (PDT)
From: Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
Date: Mon, 31 Aug 2026 14:48:44 +0000
Subject: [PATCH] x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-x86-cfi-fineibt-func-hash-v1-1-6ffc0af5c4ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEyUlWoC/3WNwQrCMBBEf6Xs2aVJlFD8FfGQrBuzKklJWi2U/
 rttPXt8M8ObGSoX4QrnZobCb6mS0wr60ABFl+6MclsZjDJWdUeN/oRTZ5GCYJDE4gcMYyKMrkZ
 kbVWwzKwMwaroCweZdv3l+uM6+gfTsDm3hXeV0ReXKG7Rq28pf3J5cmn36u8XLMsXEIxBzb0AA
 AA=
X-Change-ID: 20260831-b4-x86-cfi-fineibt-func-hash-e160f6eee02c
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, stable@vger.kernel.org, 
 Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1788187748; l=5030;
 i=soheil.kdev@gmail.com; h=from:subject:message-id;
 bh=C1lF3gn4PlZOId9Mf6TvQ4ziZitw+Q+94byOj9Hfl3w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgYX+H9SUmlJjsvfFMerxTO2vrcLc7N
 L+14FQr0ICkN0QAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPlJwjp8J6gHLBPVLFJ842ln5d71SmS0Zk+tBT9s1eo/JWFavr2JqDcxe9+XE6ev7/v9OCcTVPY
 GRPMnQ4BMcAU=
X-Developer-Key: i=soheil.kdev@gmail.com; a=openssh;
 fpr=SHA256:qCjbY5l1s4KsiNmUm70DTccyboi5PK8d/VuDVN0FDz4

The switch of the FineIBT preamble from "subl $hash, %r10d" to the
shorter "subl $hash, %eax" moved the hash immediate from offset 7 to
offset 5 of the preamble. fineibt_preamble_hash was updated to match,
but the open-coded offset in cfi_get_func_hash() was missed and it
still reads the hash at offset 7.

cfi_get_func_hash() is used by the BPF JIT to give a struct_ops
trampoline the CFI hash of the stub function it stands in for. With
FineIBT the trampoline now gets the upper half of the real hash
followed by the first two bytes of the next instruction, so the first
indirect call from the kernel into a struct_ops program,
tcp_init_congestion_control() calling ->init() of a BPF congestion
control for example, fails the FineIBT check and the kernel dies with
a CFI failure.

Move the FineIBT preamble template and its offset defines above
cfi_get_func_hash() and use fineibt_preamble_hash there, so every
reader of the preamble shares one definition of its layout. The
CFI_FINEIBT arm is only built with CONFIG_FINEIBT, the only
configuration in which cfi_mode can take that value.
cfi_get_func_arity() does not need the same treatment: the __bhi_args
call whose displacement it reads still ends at the function address.

Fixes: 85a2d4a890dc ("x86,ibt: Use UDB instead of 0xEA")
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: stable@vger.kernel.org # 6.18+
Assisted-by: LLM
Signed-off-by: Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
---
 arch/x86/kernel/alternative.c | 72 +++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 91b1cdd16569..1b22062cabfe 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1198,6 +1198,41 @@ static bool cfi_debug __ro_after_init;
 bool cfi_bhi __ro_after_init = false;
 #endif
 
+#ifdef CONFIG_FINEIBT
+/*
+ * <fineibt_preamble_start>:
+ *  0:   f3 0f 1e fa             endbr64
+ *  4:   2d 78 56 34 12          sub    $0x12345678, %eax
+ *  9:   2e 0f 85 03 00 00 00    jne,pn 13 <fineibt_preamble_start+0x13>
+ * 10:   0f 1f 40 d6             nopl   -0x2a(%rax)
+ *
+ * Note that the JNE target is the 0xD6 byte inside the NOPL, this decodes as
+ * UDB on x86_64 and raises #UD.
+ */
+asm(	".pushsection .rodata				\n"
+	"fineibt_preamble_start:			\n"
+	"	endbr64					\n"
+	"	subl	$0x12345678, %eax		\n"
+	"fineibt_preamble_bhi:				\n"
+	"	cs jne.d32 fineibt_preamble_start+0x13	\n"
+	"#fineibt_func:					\n"
+	"	nopl	-42(%rax)			\n"
+	"fineibt_preamble_end:				\n"
+	".popsection\n"
+);
+
+extern u8 fineibt_preamble_start[];
+extern u8 fineibt_preamble_bhi[];
+extern u8 fineibt_preamble_end[];
+
+#define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_start)
+#define fineibt_preamble_bhi  (fineibt_preamble_bhi - fineibt_preamble_start)
+#define fineibt_preamble_ud   0x13
+#define fineibt_preamble_hash 5
+
+#define fineibt_prefix_size (fineibt_preamble_size - ENDBR_INSN_SIZE)
+#endif /* CONFIG_FINEIBT */
+
 #ifdef CONFIG_CFI
 u32 cfi_get_func_hash(void *func)
 {
@@ -1205,9 +1240,11 @@ u32 cfi_get_func_hash(void *func)
 
 	func -= cfi_get_offset();
 	switch (cfi_mode) {
+#ifdef CONFIG_FINEIBT
 	case CFI_FINEIBT:
-		func += 7;
+		func += fineibt_preamble_hash;
 		break;
+#endif
 	case CFI_KCFI:
 		func += 1;
 		break;
@@ -1363,39 +1400,6 @@ early_param("cfi", cfi_parse_cmdline);
  * anyway.
  */
 
-/*
- * <fineibt_preamble_start>:
- *  0:   f3 0f 1e fa             endbr64
- *  4:   2d 78 56 34 12          sub    $0x12345678, %eax
- *  9:   2e 0f 85 03 00 00 00    jne,pn 13 <fineibt_preamble_start+0x13>
- * 10:   0f 1f 40 d6             nopl   -0x2a(%rax)
- *
- * Note that the JNE target is the 0xD6 byte inside the NOPL, this decodes as
- * UDB on x86_64 and raises #UD.
- */
-asm(	".pushsection .rodata				\n"
-	"fineibt_preamble_start:			\n"
-	"	endbr64					\n"
-	"	subl	$0x12345678, %eax		\n"
-	"fineibt_preamble_bhi:				\n"
-	"	cs jne.d32 fineibt_preamble_start+0x13	\n"
-	"#fineibt_func:					\n"
-	"	nopl	-42(%rax)			\n"
-	"fineibt_preamble_end:				\n"
-	".popsection\n"
-);
-
-extern u8 fineibt_preamble_start[];
-extern u8 fineibt_preamble_bhi[];
-extern u8 fineibt_preamble_end[];
-
-#define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_start)
-#define fineibt_preamble_bhi  (fineibt_preamble_bhi - fineibt_preamble_start)
-#define fineibt_preamble_ud   0x13
-#define fineibt_preamble_hash 5
-
-#define fineibt_prefix_size (fineibt_preamble_size - ENDBR_INSN_SIZE)
-
 /*
  * <fineibt_caller_start>:
  *  0:   b8 78 56 34 12          mov    $0x12345678, %eax

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260831-b4-x86-cfi-fineibt-func-hash-e160f6eee02c

Best regards,
--  
Soheil Hassas Yeganeh <soheil.kdev@gmail.com>


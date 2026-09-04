Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6947124B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519089; cv=none; b=MCAAOgnQpc711jY0aEmVLfXzvt9+IA54cVZr1lD2qRTPMwEwEMM1MoVyDOiC7bym3DS0j4P66FBmMy5cEgnsTZAUsn+X6BF+tN9CGt2u2chdNRdnA5TLdnCl1iJSuAb/RyRm5kkrMYMlpH2WkDgErcB1kHuTJii/l7q2+Ba6JOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519089; c=relaxed/simple;
	bh=Au5BlMpDT7UR8xIBrnPtFxLvgo6/ZUZ9aGDbTS7sPlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln391u28l3rWRFY6leVX9IZ7oCda8Q7p87P6m+w7gBj3kgMwSWY2bqxOuwIQZvupFgQIlUpQX1lxNMDSsmIpmZ/i7wnSNA5+6a0gobqF2+g96b4uyCXHbCwirUJU5uGTVqV0OKR9jrNMD+VZ67jUTVHzLLzne/6/0mtQ2B3UcYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXj7YTfX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXj7YTfX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1001393a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519087; x=1789123887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuuBzDkJl0gt1NGjn9NDS17DR+cp5By7A5gegfW0BAA=;
        b=LXj7YTfXWRrpuQQkQfcNw58H1uh4txcuDqakjGVRDVrRFEbtcX4eaj5YT6NhyHIG76
         KGfAXdPIrekw+fBlpnCKqspOvXqShlME3WiW87iymcvq2jCSOuxJi+uWXF2UKEAMaUG2
         z7bLZv7lNpL6X1jCY4o8CxDKEY/BpcCAuJjDv2FHCIzZLn+mFxMTeC2C7mUWW366FnBQ
         7VQYV7ARxbjzjoHt2s77mY8OlFchWVJqhf973r2/HhF9Ctp2I/gjBrTrYiDR0X8fUatC
         7blKA26El5GCQSSZ2KT+AhOei967GlNh/20bxvSarlHx6L36ThFSEDXlT4xobDXcbdt2
         jMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519087; x=1789123887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuuBzDkJl0gt1NGjn9NDS17DR+cp5By7A5gegfW0BAA=;
        b=XRL0YFoqICUl1yTUEzHdVAJpP5AZKGjDRK6VNZ1obIcautOsJ2KzuQxiSEEGAU5+lL
         /h3H473N5oLkNt+XrVki93R6IBVFF9MtQD+2aGoFR8qPQUkDz0Tz52lo5aOqCPLzE94q
         M8O6j+igyENJ2/g2UTcvExvreaOa0PYJH2lW3PB3zOqanH8rK0gA8x3b6DtE/I0I8l+b
         cih4K3PXnRbou+7fdfR8FiDR2Lqhncr2TE5v9nq87xZHN/89C243GcwxRPWuXqMqReyp
         iFgBrd3kvepnYfOpQog4pJckFG9OpCjI+vAxEURuzz7lEHSRDHMhcHo5QFMVqTroNfSd
         Bpow==
X-Gm-Message-State: AFuF++nNZlbepT/LEutsqJAIfFqThfsSNwJ5X4e+157DXWB+UZyzKX4n
	6FCfxO7K1tEXly4262ZqjC0xU9ANMag4FwFRU7084MBSDCozQKPOAqGQgLt28neG
X-Gm-Gg: AYBFou0uC466waH1Z7+cCAh/8UFNML7r61oPHpaCetjZ3kPzXOp5rFu2Q1jwgJnkIxC
	Yc146hI2TEPAxbHlIaXirBQRqGotRDYsBsL7bkzi1KdrV730QKsklNENEBecomszc8Aur1cSZ26
	2m20rWoTTHjnDVB+k7jl5FhAJpDfoN2h4fOBwlPDuJgbDk4Fc1NNgKBbyF8o88uOnbdOeGyT4FH
	pFsly5Nyh+16vxN2a4vH4ehFu1jWe5cIkceZb+D8kasiFN+755MrAqsqIi6j/P2tZHSmzABglSf
	xyen8Wy5myKY7xVF2D0gxMiE00f392xKT8dpN8ttQ1b1L3A1G4Nh60x7U8gAR6oN6Lf3Ev/j9N1
	2JFlFjyvMRuHuH5MZuZEfc4PcRGjNew+oAxdsKNt7c+5XU9LxMCOcn9O0RknSAm9ZAG2OkFRjig
	RawcSOITZ0cz4T0MJoLghLXJpycGT6xTqgsXNNFMCOCC2WMd6/PNmG3paffxScvOv1rk9pi7PHm
	UMr/oQIsLpM58w=
X-Received: by 2002:a17:90a:d00e:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39b262409e5mr8455819a91.25.1788519087227;
        Fri, 04 Sep 2026 03:51:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:26 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: fix typos in comments
Date: Fri,  4 Sep 2026 16:21:08 +0530
Message-ID: <20260904105114.29474-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/include/asm/stage2_pgtable.h | 2 +-
 arch/arm64/include/uapi/asm/ptrace.h    | 4 ++--
 arch/arm64/kernel/cpufeature.c          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/stage2_pgtable.h b/arch/arm64/include/asm/stage2_pgtable.h
index 23d27623e478..cf57da90b5d1 100644
--- a/arch/arm64/include/asm/stage2_pgtable.h
+++ b/arch/arm64/include/asm/stage2_pgtable.h
@@ -17,7 +17,7 @@
  *
  * This implies, the total number of page table levels required for
  * IPA_SHIFT at stage2 expected by the hardware can be calculated using
- * the same logic used for the (non-collapsable) stage1 page tables but for
+ * the same logic used for the (non-collapsible) stage1 page tables but for
  * (IPA_SHIFT - 4).
  */
 #define stage2_pgtable_levels(ipa)	ARM64_HW_PGTABLE_LEVELS((ipa) - 4)
diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 15649a253a57..0c8c6a126c3b 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -113,7 +113,7 @@ struct user_hwdebug_state {
 
 struct user_sve_header {
 	__u32 size; /* total meaningful regset content in bytes */
-	__u32 max_size; /* maxmium possible size for this thread */
+	__u32 max_size; /* maximum possible size for this thread */
 	__u16 vl; /* current vector length */
 	__u16 max_vl; /* maximum possible vector length */
 	__u16 flags;
@@ -272,7 +272,7 @@ struct user_pac_generic_keys {
 
 struct user_za_header {
 	__u32 size; /* total meaningful regset content in bytes */
-	__u32 max_size; /* maxmium possible size for this thread */
+	__u32 max_size; /* maximum possible size for this thread */
 	__u16 vl; /* current vector length */
 	__u16 max_vl; /* maximum possible vector length */
 	__u16 flags;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8..fd52941b5f07 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -888,7 +888,7 @@ static int search_cmp_ftr_reg(const void *id, const void *regp)
  * entry.
  *
  * returns - Upon success,  matching ftr_reg entry for id.
- *         - NULL on failure. It is upto the caller to decide
+ *         - NULL on failure. It is up to the caller to decide
  *	     the impact of a failure.
  */
 static struct arm64_ftr_reg *get_arm64_ftr_reg_nowarn(u32 sys_id)
@@ -3682,7 +3682,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			/*
 			 * We have to issue cpu_enable() irrespective of
 			 * whether the CPU has it or not, as it is enabeld
-			 * system wide. It is upto the call back to take
+			 * system wide. It is up to the call back to take
 			 * appropriate action on this CPU.
 			 */
 			if (caps->cpu_enable)
-- 
2.48.1


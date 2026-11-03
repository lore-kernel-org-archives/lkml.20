Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738265;
	b=OrW/Qm8T2zVbcNmn5/SUDs0nTFxKvtjnpC/0eA0FI6cNtXAO5bRtgGLJP9wuf6JYGuK9
	 VWKlNtckFcjEIIzS71MskpZJ9JLPrnXYtNridsj+wP0mQsQbWAizlg7STkLdN6up63xyO
	 sPIo7S76XqdwE+TYE3Nh1+m/NFlnBRpgeTN6HF3RdKNAW1vMNP/IVwk6AmRXypMBcuDyI
	 wZsb61SO3atywohDc7fo6+B/Lgff7y1mCOP5IGYLxV1FIi/pq6+mzAmlj/qZtjITnNp+u
	 1SXQdaoeJ6pJE5e2W1tpHm+nJMAun7zh7rLEZiuUWRlpeuDHrygv6qhnB1lKFRHyvlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
	b=3PRl+tRZ5alNlhAV1LcWmMlOCSA1RKaI+XbbVvbFNUewezUg6qlsOUwk7Dongk9wjUPD
	 I17ssnfm6+S7ux1rVh9nEnhkNsYGv6koVdc1nzufusp8uhqEro0DsAdzTB5UGUFtRbKf5
	 O5/vTl6lfWGiEpgTZ37M0PSdJpHIpftO4rHe19mSHTsxa6kzuyECj+QkrSCGexmGlGbuy
	 JzyA7LJps+sG3dfprDwyWOzgxVuvMndxAdaWjvKlOmfbzs8QmgHHTAYgV5CWMEaGjG/xN
	 Rs+E0ipD3TEGBCUImk81FR72O8W0Bu7EtZAkrKscW8ETz0S5QT7fGEq3lzVdWUIK1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2H3uHIE;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478CE606D812
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478CE606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2H3uHIE
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b2d149693fso138687b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738264; x=1794343064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=b2H3uHIE6MH5SCNXmTqyQmQw9x60pFn5rWYqpuCa2D5eetD8N0iFCXIIZY1kJC4omS
         e2rJlxWBymAFAnIQDoDpq39Y0ZbORYn9SnCIuDKOv/Vosa+P8gSV2GH7hVvH1wDmI+vD
         8ifAyXQ5QtO8+yvJE9ldJjvqy4u97CQFrOmzv7w5jtArrOFVfyxAuwJJa/08JAof9hqJ
         cbG2DtIqnVF5VAOAczYP0fDP9Fdgv0xFpisISqWEWmVMZHf7mGKAjBzVe4hIDfL9Zoeq
         +hgyHpWG+hWW9QQiEuc1fpsYSJ7/CB+dj94AbOayvC22CyFsccCyWTcvG6D2YoynBEGu
         MP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738264; x=1794343064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=bKTXsSFrn5BIOP91X2TCVGEzBbp3v6la64yULzXEpBHaVaQtsVjP0gB5OUvA5SVsGX
         6hcqJ14VzrDBKRUXr65PeOmhPmTmKqO3T8VrJOelEAWPe1ZMol8NgURCYsomu5FKQKbt
         Xb18h+fIYPmaIu7R0/F8w5xoVs+Xp0GqBPQW0U1xuvPdmFtjUlrK06bnwGUG5Mk8m7PW
         +x8eWTmeIbWeBgm5+EmfvTW65k9NkpiSEyNGBgH9eEuKFTK8YC6urQHD8Vm18Fy1uTDO
         zJRCbNvlwqRPCZ0Gtm8lHKqogw4L9ZJt9Q/WXYGmsbkYDEpAZIGEdraIr0+g2y2sJ6gc
         bzsw==
X-Forwarded-Encrypted: i=1; AKwUvBxW1+BwqqLaeCmsabax3ruzFCbnxvKXCpjtZARuHzKoNMS3M54+6pjrZqLejcZD3oDpddlcIxU62gKzcHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NxuNWAE105XOMcEpDrlr103mprbvRmCl84t5RGdYjNPwWP/KL
	+zJ57cIGckKougoxZMCJXV/TSpDaksoeJyBhrEuPPpAJEL/BjINPiXTE
X-Gm-Gg: AYBFou0zguO5o9HT95b4PAnBZ8qrlYA22Cp7lQforYPms7yaHuNwKTD+UjLbTiuyjmt
	bWgnsmPHAq2aNfYMcN6sVahLNuPEmQ9GDvLgRSpD3RgNL9gucEfNVezzweo3kl0zkCsPzbV/fp7
	I3bSF0XaoP3JSzrfREIRsqawEiOarNiEEMGZqT9A6LOd95niJEVEAtta5AYpMnCpzE4Ccm+J96t
	SldN6qwilfd3ro5l5AdCK8BjF1lE1DBZZPr0rk241w0399Tfug2rnKMyCz1fiU6s3nJTRQVuiQt
	RLotLavLWiClrpVoih26vrgkg2tZ2MrZ+gDxvHsDdBGEl+6ZGHfCTTUSBwFlRwprxsgjJXW1Inc
	UemenOIEbnod0gO3W0qmWoH2vGKM/TCjQ6zHJ2c9xSU/aj3vscAHmrj7kvSOCJido8g8Pl80JFT
	nkfHMMJKP05cFlw7JAB1Bqa88xruHp2+/+WQ8x/W15noJeGDD5HWLjV0XmQS8cqPY9fCzs0qouZ
	TCWm1GXzsKlTTUtebX0Xx6Tdg3VmZnLRj192xLNTkA9QlTaJLBErjOL1Ud7TbvdHfvDF/qRbKJ0
	CIqkecuZVRvRctBMqYJwTdj5J6cwI5cdCHp+/RAeq11EvP+fErQCVROW2xtyXUnhCNOqrlGPzhP
	r+SOcDyS47A==
X-Received: by 2002:a05:690c:60c1:b0:8a8:9149:e4da with SMTP id 00721157ae682-8b2b67fe3aemr79052567b3.108.1793738264234;
        Tue, 03 Nov 2026 12:37:44 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bd1672sm4541337b3.43.2026.11.03.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:37 -0500
Subject: [PATCH v5 04/11] alpha/perf: do not report user registers from the
 entry code
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-alpha-profileme-v5-4-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3878; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=LiN+Yv+pum+ZIoYCbCmWoIHtlAzTvYQXPQL0PlKXs7o=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufHZGzuv7D1wpD8wuLhnzfXzv/yZze9U/tj9weH6g
 uzWY6ZPOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaUD+G/04lnSYKDt
 uapLXuFxrMdDi4YnIX376kg+9P7f7L3CK5RomRoW+Gi3d8WoBETHjHvZz2IwuDYv9WVIpvyjVws
 +ZZnfaNFQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf_get_regs_user() returns task_pt_regs() whenever a sample of a user
task lands in the kernel. But exception entry runs with interrupts
enabled, so the sample can land before the entry code has saved the user
registers. Only the part PALcode pushed is valid then. An interrupt
taken on the first instruction of entUna, say, pushes its own frame on
top of PALcode's, which overlaps the rest of the user frame, so r7 and r8
read as the interrupt's r23 and r24.

Report no user registers while the interrupted PC is in the entry code.
Such a sample also gets no user stack dump. The range is all of the entry
code from entInt to the end of the save in entSys, so it also drops the
registers of samples that land after they were saved there.

An interrupt that nests on one taken in the entry code still reads the
incomplete frame, as its own PC has left the entry code.

Fixes: 9280e99d87dd ("alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 12 ++++++++++++
 arch/alpha/kernel/entry.S       |  9 +++++++++
 arch/alpha/kernel/perf_regs.c   | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6..1400ba3e7d43 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -14,6 +14,18 @@
 #define task_pt_regs(task) \
   ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
 
+/*
+ * Whether pc is in entry code that may not have completed the frame at
+ * task_pt_regs(). See entry.S.
+ */
+static inline bool in_entry_save_code(unsigned long pc)
+{
+	extern char __entry_save_start[], __entry_save_end[];
+
+	return pc >= (unsigned long)__entry_save_start &&
+	       pc < (unsigned long)__entry_save_end;
+}
+
 #define current_pt_regs() \
   ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
 
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3c..b8d7804e5aa3 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -186,8 +186,14 @@
 
 /*
  * Non-syscall kernel entry points.
+ *
+ * Between __entry_save_start and __entry_save_end the frame at task_pt_regs()
+ * may not be complete. perf uses these to avoid reading it.
  */
 
+	.globl	__entry_save_start
+__entry_save_start:
+
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
@@ -479,9 +485,12 @@ entSys:
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
+	/* PAL_callsys does not save these, unlike the other entries. */
 	stq	$16, SP_OFF+24($sp)
 	stq	$17, SP_OFF+32($sp)
 	stq	$18, SP_OFF+40($sp)
+	.globl	__entry_save_end
+__entry_save_end:
 
 	mov	$0, $1
 	lda	$16, 7
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e831ba0..894683851b30 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -59,6 +59,19 @@ u64 perf_reg_abi(struct task_struct *task)
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs)
 {
+	/*
+	 * Exception entry runs with interrupts enabled, so a sample can land
+	 * before the entry code has saved the user registers. PALcode has
+	 * pushed only its part of the frame, and the rest may hold an
+	 * interrupt's frame. An interrupt that nests on top of one taken here
+	 * is not caught, as its PC has left the entry code.
+	 */
+	if (in_entry_save_code(regs->pc)) {
+		regs_user->regs = NULL;
+		regs_user->abi = PERF_SAMPLE_REGS_ABI_NONE;
+		return;
+	}
+
 	regs_user->regs = task_pt_regs(current);
 	regs_user->abi = perf_reg_abi(current);
 }

-- 
2.55.0


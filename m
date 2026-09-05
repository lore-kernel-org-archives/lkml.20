Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CD3BCD13
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636614; cv=none; b=L7RtOdFSOhwkWHgh4Py7IpIEriDAq5ddbuLwGZVTrHLfewqWjpMN1/XyYLIVHXLrhfs49fSjb69cGcM11ejKegs2MwRiKIvZdPiC/QLkdcHrfbXbpRH3iXoGmTTSeTMRn+J1KuSKER1gbCl4y1IJwEzC0+Mu2sdpvPmtWFYWIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636614; c=relaxed/simple;
	bh=MZK3QK2j5JUtPqxqzEPthxsogVOYlIL8h+3CiJ37erU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGcdkh1BogjK+OGqmdztZrWJBLt9Y2DHPW1pRdzsFq9lCuZE6o+WwSIgp0DytboW600m836DxFP5D6l69Fum/ATRYVPQSSi98b8j81imvBIQ6xWsLpM/h+wmXD7fpY313Q8Qa6HIy2Ne9gh9dOsclR7ycoV6ge/ao92bTRsEXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHEcaqKy; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHEcaqKy"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-866e57f63a3so24682787b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636612; x=1789241412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CclPpvJafyHODPlkrBmq/rpYZnB66QkkB/IorS7mXH4=;
        b=MHEcaqKyWqLer9aHxCs+TU10SDbRmmEhPApM8zoCHqt58il4hd+bLvKbl9LGw+ZdCE
         rzeVEyFfL5aJdN971qjlQAw/yO8QLSL5TfooX/G3WWba7EfmxF5TcjQ5PSD6xG+L4VLy
         CXmMLu0TuyZEmVBWaCz+7qic4n8IGdxyqm5tSpDLxYZQcnilIdLu/4BteQLkpYMNrPq2
         i0czKgUuRee57S9vlHiXF2/zorkepe7yaHRUvQFnPVpMcUgIkWH56ZsG2lfbnlFLlN4W
         qUP9oBAFYFXRRJDaFGSA3QhkGrWOUPC70LznAjZbiMD1vQ3jPfdIr6ypWpnJTkuRoonv
         wUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636612; x=1789241412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CclPpvJafyHODPlkrBmq/rpYZnB66QkkB/IorS7mXH4=;
        b=dWkRI27fQvDxXpNleEK0Tx6FKou0tIKB7jj2MzKJLNiuY2Pl9qUhZ5jtowffpGAOs6
         DPTDPNT260LtGhYpofpBHGk/FcVm7NfQ+lO1kkTMPqeoYeXhdfm8dK1C4/ZdcqOYXAm2
         Kb9wLXfCq+kKCe/66hP1w0Xlcuh71vO8RYW2WD6cHRxm2SHbrrdVv/7DfngsG+AVqRp1
         tbld/REWPk235/GfncArxEfroWzUWgntuTNgJTUTt5MFyVRlmQgZ+cQLDgthH4ImfMJO
         91Dcs3+8cHJbPo3WUE/zW35CKVjDpi0XiRKu5+vVLVv80gSUT1e1yVThHatI37FsgISE
         WJ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdoV+O5S35331YiMtgIvYqi35BsChLi51GSsjfg02ZLC1Y5d6MzBjt3oz+k+gFHJEkav18NbXD398T9js=@vger.kernel.org
X-Gm-Message-State: AFuF++l+YpcmncCNOhMUuJjHWPstiN2B9DXglZCFSlilwQDHbfbOxdyN
	+O+c92Tg8HWXs+1w8+AO8rsTFjFqmNoSZVkmZE4WAbUrDYeUFOpcoT6z
X-Gm-Gg: AYBFou286bL4P4DheYJnNn120rv59gyBIR/FoSHiwc/R1fHsrly5TXVqV9DafgaD+GS
	tc+EpaoNT9jNdUWF92rZOpEzce9OH5+EaYMQnNc8wTfbPMpd3yvViFuDlxFdLSoBbHPLWK33H2i
	wTFW9vKC8a4gLjZfPfw5aMWfS0BTBAhRKQ3t8mdvSqiCeOWQOvLnetxEb1uqxqs6cVY/zVlu3tc
	Z9Bd4iSllAljL41piVEDDBJqh4AeEwsKOh5zDU9JJciMqLfiKbHHeCv3DZ6Qkk9ljKvlkONRkCa
	4vf1hbh1lh20WILNAF2rJMgPo2UmmvmxhZOX80yMe+7h0zZJ033qyUu/9ZbOjaWfibTj2iHioHL
	P7uIyDjPHsba/hPRuGeCYwR795cN7fUnr7D5j3A8VMc6TMfqBbtnwMq4sfokOBXanOtsbAzMiYQ
	2pYo2KLJEHKuF3e+t74AX84x+qH4eqHuX3eAaTwkK21hbumX6Fu4bxZN1d9mkg
X-Received: by 2002:a05:690c:e3e8:b0:81e:9826:942c with SMTP id 00721157ae682-8711c7488c4mr59517817b3.0.1788636611935;
        Sat, 05 Sep 2026 12:30:11 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439c54e4sm43587167b3.6.2026.09.05.12.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:10 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:42 -0400
Subject: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5469; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=MZK3QK2j5JUtPqxqzEPthxsogVOYlIL8h+3CiJ37erU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E4p5Nmhx6GzdT53t4DkxT0pgp0TWiL/GJmHL19Qf
 +Fi3Iacjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmwgJGhgm5u82uvX
 E5nnRBz+i470OxDvvFv9rt1onv2bhnnQSrnSnDX8FPi4y+corY9a4xl45L7H8v89blnsXbv3WZx
 9puudYyMwMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Implement the perf register sampling interface for Alpha. This enables
perf to capture register state and user stack dumps with samples,
supporting --call-graph dwarf.

The perf_regs enum exposes the registers available in pt_regs: r0-r8,
r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
in switch_stack, not pt_regs, so they are not included.

A switch statement maps perf register indices to pt_regs fields since
Alpha's pt_regs layout is non-contiguous (unlike architectures where
direct array indexing works).

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                      |  2 +
 arch/alpha/include/asm/perf_regs.h      |  7 +++
 arch/alpha/include/uapi/asm/perf_regs.h | 34 +++++++++++++
 arch/alpha/kernel/Makefile              |  1 +
 arch/alpha/kernel/perf_regs.c           | 86 +++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index e5611766b6d6..96b38d320eb8 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -33,6 +33,8 @@ config ALPHA
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select GENERIC_IRQ_PROBE
diff --git a/arch/alpha/include/asm/perf_regs.h b/arch/alpha/include/asm/perf_regs.h
new file mode 100644
index 000000000000..6045da1a2a4f
--- /dev/null
+++ b/arch/alpha/include/asm/perf_regs.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_PERF_REGS_H
+#define _ASM_ALPHA_PERF_REGS_H
+
+#include <uapi/asm/perf_regs.h>
+
+#endif /* _ASM_ALPHA_PERF_REGS_H */
diff --git a/arch/alpha/include/uapi/asm/perf_regs.h b/arch/alpha/include/uapi/asm/perf_regs.h
new file mode 100644
index 000000000000..afeb6a1584cd
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_regs.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
+#define _UAPI_ASM_ALPHA_PERF_REGS_H
+
+enum perf_event_alpha_regs {
+	PERF_REG_ALPHA_R0,
+	PERF_REG_ALPHA_R1,
+	PERF_REG_ALPHA_R2,
+	PERF_REG_ALPHA_R3,
+	PERF_REG_ALPHA_R4,
+	PERF_REG_ALPHA_R5,
+	PERF_REG_ALPHA_R6,
+	PERF_REG_ALPHA_R7,
+	PERF_REG_ALPHA_R8,
+	PERF_REG_ALPHA_R16,
+	PERF_REG_ALPHA_R17,
+	PERF_REG_ALPHA_R18,
+	PERF_REG_ALPHA_R19,
+	PERF_REG_ALPHA_R20,
+	PERF_REG_ALPHA_R21,
+	PERF_REG_ALPHA_R22,
+	PERF_REG_ALPHA_R23,
+	PERF_REG_ALPHA_R24,
+	PERF_REG_ALPHA_R25,
+	PERF_REG_ALPHA_R26,
+	PERF_REG_ALPHA_R27,
+	PERF_REG_ALPHA_R28,
+	PERF_REG_ALPHA_GP,
+	PERF_REG_ALPHA_PC,
+	PERF_REG_ALPHA_PS,
+	PERF_REG_ALPHA_MAX,
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..0c04b89676ed 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PCI)	+= pci.o pci_iommu.o pci-sysfs.o
 obj-$(CONFIG_SRM_ENV)	+= srm_env.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
+obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 obj-$(CONFIG_AUDIT)	+= audit.o
 
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
new file mode 100644
index 000000000000..e15081ac95e0
--- /dev/null
+++ b/arch/alpha/kernel/perf_regs.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/perf_event.h>
+#include <asm/perf_regs.h>
+#include <asm/ptrace.h>
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	switch (idx) {
+	case PERF_REG_ALPHA_R0:
+		return regs->r0;
+	case PERF_REG_ALPHA_R1:
+		return regs->r1;
+	case PERF_REG_ALPHA_R2:
+		return regs->r2;
+	case PERF_REG_ALPHA_R3:
+		return regs->r3;
+	case PERF_REG_ALPHA_R4:
+		return regs->r4;
+	case PERF_REG_ALPHA_R5:
+		return regs->r5;
+	case PERF_REG_ALPHA_R6:
+		return regs->r6;
+	case PERF_REG_ALPHA_R7:
+		return regs->r7;
+	case PERF_REG_ALPHA_R8:
+		return regs->r8;
+	case PERF_REG_ALPHA_R16:
+		return regs->r16;
+	case PERF_REG_ALPHA_R17:
+		return regs->r17;
+	case PERF_REG_ALPHA_R18:
+		return regs->r18;
+	case PERF_REG_ALPHA_R19:
+		return regs->r19;
+	case PERF_REG_ALPHA_R20:
+		return regs->r20;
+	case PERF_REG_ALPHA_R21:
+		return regs->r21;
+	case PERF_REG_ALPHA_R22:
+		return regs->r22;
+	case PERF_REG_ALPHA_R23:
+		return regs->r23;
+	case PERF_REG_ALPHA_R24:
+		return regs->r24;
+	case PERF_REG_ALPHA_R25:
+		return regs->r25;
+	case PERF_REG_ALPHA_R26:
+		return regs->r26;
+	case PERF_REG_ALPHA_R27:
+		return regs->r27;
+	case PERF_REG_ALPHA_R28:
+		return regs->r28;
+	case PERF_REG_ALPHA_GP:
+		return regs->gp;
+	case PERF_REG_ALPHA_PC:
+		return regs->pc;
+	case PERF_REG_ALPHA_PS:
+		return regs->ps;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+#define REG_RESERVED (~((1ULL << PERF_REG_ALPHA_MAX) - 1))
+
+int perf_reg_validate(u64 mask)
+{
+	if (!mask || mask & REG_RESERVED)
+		return -EINVAL;
+
+	return 0;
+}
+
+u64 perf_reg_abi(struct task_struct *task)
+{
+	return PERF_SAMPLE_REGS_ABI_64;
+}
+
+void perf_get_regs_user(struct perf_regs *regs_user,
+			struct pt_regs *regs)
+{
+	regs_user->regs = task_pt_regs(current);
+	regs_user->abi = perf_reg_abi(current);
+}

-- 
2.54.0


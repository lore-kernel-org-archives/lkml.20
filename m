Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01557457E6E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244993; cv=none; b=ReDOH3V3xmnvBushebfvkqHrkyt54zTr96OrZtL3VssDSPVRytvE244gpt/0U5r4E9fZhFG0bbaqeb2lf29Wd5+RdsY6VFfGiK9jCMXHikF3XBP5epavv1aTv06Ss1uBQiNKEJU301p6gZzxZGVOKQ+2i+hZSPLq4fCz/VfV1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244993; c=relaxed/simple;
	bh=MiE+4ItnXmHUBKhLrUz3zntIZyWtLRntpAxtOY0u6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gZLgWrocNkOPXIfrLgRb+IoEQnCJMETsw7EXu/oLbgtSkPS80HVcgxpEgNNYdP10PqRs15ySTzo04eZTdgSXbWyGFJDlPKdApDWHRqu99Wn/3VIrkw2+pwapch65z7KMYxzTRn1OEDsYUnIdzHjS5KO5EcRJ6CAhrRsahLQNPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=g9DSzDqs; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g9DSzDqs"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so1648659c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790244979; x=1790849779; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=g9DSzDqs8LuN4AeYdsx4K6TuX9oqHEq/5mGCol5OmHfpvvB/Z+YqSHP1/5ZWdeRQu6
         LBGKRLG1aqpGKVEbw8mzJ88IkmLVih4LqVGyffPKdO0Yc9oW4aBQilS051gTuWwki36D
         /7Gbq+fpXNW0PXiIR9pw1ZzTAdpGdmetqMO++m9CXuXIjcldqc6JFrcAZ12gZ+gYU/vv
         UZSWcvUlSuhROTmptcAf6g51snHEhuSmOTj3AmGbdlt1aC+SMwg4/Ibw+DIVxzVcr3zz
         o7+IxAf0D9ldllmkktLMbfncuhkTghJ5QT5aw49Le7pk6EYPtKI35yLj8WQWj7NJORar
         txvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244979; x=1790849779;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=tmRZq+mKrMCb2zepxj3lAikWcTnQ/DclgvAfbgzdby2683S+DngkmOLWKJRlSgXuqn
         MOOxJlGf6z3jGQxSdXsx/fCC17qO3HbT3JN0y/ChMgDUsLQssHzptsu34diwm9SA1zFa
         aEJk2U/64+kPQV9bQWlK3xyWVW59GowKcaYjxieVS/1xg7a08LQA2sO/Kmhwon/yVmId
         MjQuizh/0d13LzgdnmhtSVmu2nOx6HPkVUm0qMCAwd0+wCC1ChvkHmbT/LXJFODee6wg
         ZVVhT1PFnypUuiqL/U+Se3CDwNxmfQVFwaca4bdfiOLF5YAM690iO/D7J/CpWzCdhg6D
         HPAQ==
X-Forwarded-Encrypted: i=1; AKwUvByWYIbc9pjhCo/IJlSPZF7/kSY+hd4cQOr9BHQa54VEU29VLZqlf7eHn7wNHnevylzYbE0Cprxs+MclXVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n3t7lBLWQN8i8SF8kNSDToNfK+HA0dNyfWUDRrQBBcky69FQFL
	xcwVFUCQ7T3Y2a4dU7gRP4IxM8LVDUmPD/d3DdeAFaMXLMcwfVt9BsvNP/z08eeKlIU=
X-Gm-Gg: AYBFou1S5PeTFCdO1FvR1np3He51je0giZpopwXNVe0PpvMK8DnCsn12XNZLgq9T6qV
	WJdWpP9NYOlJuhAnCZx0O10s2OjsHP6JMBFTvyQ6TX6VLYa5nCky1Z9WXl6R3nk3FH7Ilu4mAhU
	J5YiNlHX2FMjVwLXYSxbCwwV5hPykbTDqZk5EdgHOmwEqpDp3Llc7wXD+NpFZz5y5deoaIzqh+b
	81IGz3g5cLvp7Ccm76WuDikNZnjLjS1OTsEp3ANMkMgcGrvJ1qQ4kJJivEIo3Po3NH+C1A+Fd9P
	+N58qj+JoVShKN4M0HeCACE/7zp/gJR2ulWbg/f35fjbXFaH2/iHjU/0hhgT4cwpj5Bhr6vxCc8
	21QKDuaI725OAetPJyknFz8oqhBRi0O2woHjh76wHlmjBjuIagyVfkGVpGMMLZaMw2mi804xX70
	J9MmJweyMu/foYsGen0HYGWaWoGIymQXL/qGI0XOE+2RoGYY1oF/k/G+5UUWNZBOL8uWS8oUldv
	9ZXIgD3tX1c/GV82qQ=
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr1782888eec.16.1790244978791;
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e975223fcsm12254595eec.31.2026.09.24.03.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 03:16:13 -0700
Subject: [PATCH v2] RISC-V: Clear HSTATUS.HU on CPU initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
X-B4-Tracking: v=1; b=H4sIAGz4tGoC/22NywrCMBBFf6XM2kgTHw2u/A8pkqZTM4JNySRBK
 f13m7p1eeDcc2dgDIQMl2qGgJmY/LiC2lVgnRkfKKhfGVStzrWWjXAcTUx8d0kYabQ2qrFNJ2E
 dTAEHem+xW/tjTt0TbSyFYjji6MNne8uyeH/DWQoplLang+2H7ljrK9NAGffWv6BdluULdtg/e
 rcAAAA=
X-Change-ID: 20260817-hstatus_hu-a1a88a27c7b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790244977; l=3822;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=MiE+4ItnXmHUBKhLrUz3zntIZyWtLRntpAxtOY0u6BY=;
 b=lJsDgeDAFpzkUZgwbf6xofjnxNK0j5K+KDvcLG59+7QXUPCuV2SrHNbl6effhqne9YSnrJDPl
 DbbQVpzEO2jBsZbYKau8bP8WWRoX/urfT4BpbtZmYrJ8aUni4lV7kqg
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

The RISC-V privileged specification does not mandate HSTATUS reset
values, leaving the HU bit potentially set after hardware reset.
When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
U-mode to access guest memory, which may cause unintended behavior
if not explicitly controlled.

Clear HSTATUS.HU during CPU initialization to ensure hypervisor
instructions are only available in HS-mode, preventing unexpected
guest memory access from U-mode code.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
Changes in v2:
- Clear the hstatus.hu in the arch core setup instead of kvm core setup
(sashiko)
- Link to v1: https://patch.msgid.link/20260817-hstatus_hu-v1-1-28c53cdfb408@sifive.com
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
 arch/riscv/kernel/setup.c           |  2 ++
 arch/riscv/kernel/smpboot.c         |  2 ++
 arch/riscv/kernel/suspend.c         |  2 ++
 5 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..5efa72823475 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -40,6 +40,8 @@ extern u32 thead_vlenb_of;
 
 void __init riscv_user_isa_enable(void);
 
+void riscv_clear_hypervisor_csr(void);
+
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
 	.property = #_name,								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..80767a016602 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1183,6 +1183,18 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
+void riscv_clear_hypervisor_csr(void)
+{
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_h))
+		return;
+
+	/*
+	 * Clear HSTATUS.HU to restrict hypervisor instructions to HS-mode.
+	 * This prevents user-mode from executing HLV/HSV instructions.
+	 */
+	csr_clear(CSR_HSTATUS, HSTATUS_HU);
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 52d1d2b8f338..bf42efd848f6 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -364,6 +364,8 @@ void __init setup_arch(char **cmdline_p)
 
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
 		static_branch_disable(&efficient_ffs_key);
+
+	riscv_clear_hypervisor_csr();
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f6ef57930b50..a9de2dae804c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -244,6 +244,8 @@ asmlinkage __visible void smp_callin(void)
 
 	numa_add_cpu(curr_cpuid);
 
+	riscv_clear_hypervisor_csr();
+
 	pr_debug("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
 		cpuid_to_hartid_map(curr_cpuid));
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 3efbf7874f3b..db220966f782 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -43,6 +43,8 @@ void suspend_save_csrs(struct suspend_context *context)
 
 void suspend_restore_csrs(struct suspend_context *context)
 {
+	riscv_clear_hypervisor_csr();
+
 	csr_write(CSR_SCRATCH, 0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260817-hstatus_hu-a1a88a27c7b1


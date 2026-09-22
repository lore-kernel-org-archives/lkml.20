Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9654936E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085456; cv=none; b=m568CpfXIHV6LbqRSjhsB/049EkcxMbNSZxPyCU0c4ZH24XraBbwCqQb9EyFUne8x68o9dz/nCtoPXGamFIzTf1Zxz+QsjW1VR1CJ54fu9JeRaQO2/1o6fXzdHb9k//tOeYbuBXR2QeC43ig6yhmSyZnK0+cg/Y3kx5GFSYyyo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085456; c=relaxed/simple;
	bh=dBd5pQTE0YssP3IPEN+CCM6gF1e6BXlpUjLXZ7Zh5PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNM8mXYqhrfGF9xZ70s7be5GWDw4SHnWzKfWCEzVwNufFp4Bcs38pgE+8o4atnSsnXatHLi6LCSdqaXc9m86yet2Xpu61pjGvoLgpGqoycIDBrMRkA8gWT0cMg26i6Ar4e268UJlN6XkAHhf1LLuX06XpMtoiEkSHczv6DkkItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FSv8QNtb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FSv8QNtb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48586861639so435211f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790085452; x=1790690252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZZpnp9Ii94lfQediVbtRB1HCrD5s3KchpIbsJ2tbsA=;
        b=FSv8QNtbyWM9XK2JkkiCUJt2L1laTHAqFaLDUDjL3fdaCCl2qC1bLKtKVAng4PP4HG
         ttpfP+8Zlg2OnNGIzv0sigCBjWAOQh7GKtczrJxgIrAjicpk3xX1PJjTlCbz3roPxToW
         mmomdGqkeHXbJq+BD0H2ZF7Au/gQAfXR1nDMeuMfOD877xycSg7rnlXIKLhVeEnqj26V
         BrXjLcycof64y1HxIGtL9j8HTy7M/pddyr/slET2X9tfNLqRoaxUN02UtImsdrEmEilF
         IF/mezcIldDHx2C+4OjgVyn7lUU3rP79ViNZ6L/JNR8MSqLSs+4nZSu3uUfsGWZZX4S9
         Zb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085452; x=1790690252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZZpnp9Ii94lfQediVbtRB1HCrD5s3KchpIbsJ2tbsA=;
        b=jPdZOmTPZK192X8phE9PmAY4fDeX3pr0/9OAQu88t5T+hmHirlvJmm4M/tkVqv9CXo
         mUrYd/w/WIOj8Xu35StumyKHqaLksgCzIGMmziB4Atf7TwRqSkqjFwgk+QghGicDCuxh
         W+E+ENQfp5WAwWNzWoZGhfM5LR59gq2BwJvuCjLGHW+cHjamSTNIAap/4tte6aRJkdL6
         A/Sipros9r8Zq1YgdgZckKbxZsmQCA7himkJhdPP7AougHGpRafRi+91VpI0VSPumdQP
         nnYHGzNUHI5bbyhph73GFUj4xwVNlZOPDjniHFS/6tj7QKT9/nz0YLFXX621fGhaUlQg
         rzYw==
X-Forwarded-Encrypted: i=1; AKwUvByUUWqzm16XYDQdLjQAUY4B+JbkC8ZH2BLLHEaGEtiqCB5Vhzm3K+3jBehNtVJI9h3hfOUAnpmgGjVB1pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+pC2FlrsahmNgoA5qPlxw3UQs9N11f8+4ow13Wr7+JLVONSnr
	xsXzZqIzDp77EM0TRx3rl8DOXpvtZE5rcuJIgYEyC++HC/MpmYMiqndXm3cgnVKpsT0=
X-Gm-Gg: AYBFou2wL2HIAYZY7jqXahsvRt7hyvGophU+BiJVarUeLmPkxdos3h7TjzBTYaedNbC
	TT0+UX/LObbA9DdcD4EykRe6+8UmNOjXKHlMn9gr95dFt/2oR4wiq5FTFUkAQtuXiTo8vl4cAym
	PtkpD3h0JsUR1FrFVf4OR+relRliehsoDfddIJfZ4+J6W1yRg64WhSH0+XQuSl8sxQgj4UdaQjM
	Zt1mVzCKyQZhDhz/R2y0o/8U55WPOqqgZ+gjFRgV9xniAT5aR0GpmMex20BgPN5Nvws/8AVX/SM
	YBceUuYM2EfkWrao5Wsz2OgAwC8Hk6dCLFxR1XVIrKl7Nu4/3ZJ7iG4FP/sQmG296t0i5RIrzpy
	bu8/JbUfHYqeRdYgxTQZx7Vzhqa6b3F7kOLzD7wS78HUcKsUlaiJB0UCqoYucOlTfDGui9uf0/d
	fPAVIRGHKc0DD2QsQgi2X6y6aTcalaEDiH97dzyYb82KoUmlBieZuhGe3D6vAiiLjhwwp3zA==
X-Received: by 2002:a05:6000:4303:b0:487:9bb:a875 with SMTP id ffacd0b85a97d-48860f7eb5bmr4640032f8f.3.1790085452552;
        Tue, 22 Sep 2026 06:57:32 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774543sm5865322f8f.11.2026.09.22.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:57:32 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Date: Tue, 22 Sep 2026 16:01:09 +0200
Message-ID: <20260922140109.12780-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
CPUs, and the IPI handler eventually calls the firmware to shut down
each CPU. Since the IPI is never acknowledged via EOI, the interrupt
remains in an active state when the CPU goes idle.

In a virtualized environment, if the hypervisor does not reset the
interrupt state, this causes the crashkernel (with cmdline option
maxcpus > 1) to be unable to synchronize between the boot CPU and
secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
for the CPUs to respond. This has been observed with the Hyper-V
implementation.

Both the Linux kernel and the Hyper-V firmware appear to violate the
PSCI specification:

- The PSCI spec states that the OS kernel must migrate any interrupt away
from the CPU that is about to be shut down via CPU_OFF, which by extension
implies that no active interrupts are allowed. The kernel does not
currently do this in the kdump crash path.

- The PSCI spec also states that the PSCI firmware must reset the CPU
registers to their default values when turning on a CPU via the CPU_ON
command.

Fixing this on the kernel side has the advantage of being
hypervisor-agnostic.

Signal EOI at the end of the crash handler to prevent the subsequent
crashkernel from hanging.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a117..cc7f3261fe537 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
 }
 #endif
 
+static void ipi_eoi(int ipinr)
+{
+	unsigned int cpu = smp_processor_id();
+	struct irq_desc *desc;
+	struct irq_chip *chip;
+	struct irq_data *d;
+
+	if (ipinr >= MAX_IPI)
+		return;
+
+	desc = get_ipi_desc(cpu, ipinr);
+
+	if (desc) {
+		chip = irq_desc_get_chip(desc);
+		d = irq_desc_get_irq_data(desc);
+
+		if (chip && chip->irq_eoi)
+			chip->irq_eoi(d);
+	}
+}
+
 /*
  * Main handler for inter-processor interrupts
  */
@@ -1009,6 +1030,7 @@ static void do_handle_IPI(int ipinr)
 
 	case IPI_CPU_STOP:
 	case IPI_CPU_STOP_NMI:
+		ipi_eoi(ipinr);
 		arm64_nmi_cpu_stop(get_irq_regs(), true);
 		break;
 
-- 
2.35.3


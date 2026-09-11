Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC59279DAF;
	Fri, 11 Sep 2026 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097284; cv=none; b=b8tKV4hPQE677rem6r8eAzCFfTbVW8UnAeKqiF23KUDBghWQw8Zpj5OYAolNl+8Pxb5e2VQNDCVtxSCYWL+hjSC2h/SDhTclwfaokdNHGL0GkhRj1da5hF14psT4ZTG6iLGfMeYTboPHv2BUHWzNK5mpxdebgbMNIPk5Mu16QhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097284; c=relaxed/simple;
	bh=ZgRwqnL1xEwJuNVxRcqcBty/gZdRtWBY1J1AAsTl1lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGKIfcfRv4pfiH5RhyQgJzp88f+O35R+8/QIf8Bc+s4oqDgerRmWINa1CGML///MnmbZs/wEkKTJJ5Q50fFFCXsz0zQBghQV/lj194xiR29EunlLvHHKjZqBgQTKqwjGb9xpWkExCrDkJvlal7I8d6OTxy2I4y1tFV3p45wiKiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diTt3vef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diTt3vef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A851F00893;
	Fri, 11 Sep 2026 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097282;
	bh=kHltKlWHwYJPqeo4oBbRoLIdif+urCXRiNwOSKd5An4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=diTt3vefE5Y8zWY47uFIQxTU2hQBr2sF/iqHtAGKrBVVFEUtLHETXpi1WwOXVSCR+
	 E9VaMDuQTW7ieFUX2+gKCTEq1JAzw4Ina8g8bPpsKn9KDHKZfD6pg6Jk6s73x8gizZ
	 SRs1ZYWvjakJNzcEXjsgqyNTAcnedgLRx+HLnrEATbXAYxYNaFUWUrs0FhNfBGs0Xe
	 13sAf/H7jpkz5plvYeaTQkW6mq2jK/9EXO76YpYY/PmTIjo6VGQivXeEr3lY8bCQh/
	 pUWOsD/J0/F+ZakHS+aJbgJyMdJfZ5N/CcIDU/q6cx6aKOHnjpejAR2TivekRF2Woo
	 u3jW1KO2xNQpg==
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:09 +0000
Subject: [PATCH v2 1/6] riscv: smp: Move enum ipi_message_type to asm/smp.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-1-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9
Gitweb:        https://git.kernel.org/tip/1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:45
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

riscv: smp: Move enum ipi_message_type to asm/smp.h

The IPI message type enumeration (and therefore IPI_MAX) is currently
private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
the exact number of IPIs that the architecture requires, so move the
enum into the public header.

This is a pure code movement with no functional change.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-2-guoren@kernel.org
---
 arch/riscv/include/asm/smp.h | 12 ++++++++++++
 arch/riscv/kernel/smp.c      | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0ecc67641b09..bed39fff1f8a 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -15,6 +15,18 @@
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_CPU_BACKTRACE,
+	IPI_KGDB_ROUNDUP,
+	IPI_MAX
+};
+
 #ifdef CONFIG_SMP
 
 #include <linux/jump_label.h>
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..8930b62b15e7 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -28,18 +28,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_CPU_BACKTRACE,
-	IPI_KGDB_ROUNDUP,
-	IPI_MAX
-};
-
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",

-- 
2.43.0


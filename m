Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A54A263C;
	Fri,  4 Sep 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529222; cv=none; b=XKszICQCwkpbbRiWZMoLDryYzDOXDiG/Jtfe1GufZnGxUmLaKnO+k5pF9k1y0BeJqSsU+nAjdKW7Bknf2oypY8iAdxvx5E7ho6/pL7+aCytUQ+PL8/c3vp3rQaM9Qslfh/HzgmzAClGvhqrxTfvPAKSwbbwR7uF+W9TOrQQ/NEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529222; c=relaxed/simple;
	bh=Ay6TqUWL00uP5DZV7Spr0KfWR2hmj70PXD5H1zQhLZk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CpYvWiiC4Ln3TdSJ+D0i+JgWqX7xr0atAvv4bY+sHABHe7DprnC32w4J2ahq5IcXZA5KHQNjqSItN7Qx+m1A0F3eA1bq/rB7q9vbYTMgQ7TSALlmy13/fzawHek+28qQc3jz18eHrOahPNw9xxu+KSjG6BTqZcXcgsAtX8VOewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j49juInI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MGHAAHTh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j49juInI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MGHAAHTh"
Date: Fri, 04 Sep 2026 13:40:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529218;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlvxqrw6X5XKrc6ZXlLiAN3gUHl+qzzWa+3PGNXQ+Zo=;
	b=j49juInI9dTFd21bfXXLAd1YAKhk+/yxxBDhHyFpPYC0eMES3TE7xHLM+6gOxP4aSdkmOH
	6QyAQlPup7CiU/acuNkD4lBvpZQrkOYy3Uk6d5xPVNko/MS7gy9KG6Jr7kaTER4vl1BvDc
	Hj56PzxqD/ELzZtS0HQdggFKBn+FChqqJ32wUYPIdvgQxo57ebAYhYGhCBe8nBi9mZe+Gt
	Slx+ovLz7j7TfKAwDhnH8KFMaNpFns0ktgCcw8cIhcHq49Zo4X8pK8F0ajjD3aLvAQAyfv
	ugo13pMux1GvYWNoLL0ejMWwnC7KKR127gSfMI8ng34mO8A61cGN14jygkQO5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529218;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlvxqrw6X5XKrc6ZXlLiAN3gUHl+qzzWa+3PGNXQ+Zo=;
	b=MGHAAHThQPaM0NYZbxNTWZdUix91dRzP242FZTa0wAAGxqCvPWu4HRUcuYVEa6DdRUI/C6
	ElpOCw66CSz7fJDQ==
From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] riscv: smp: Move enum ipi_message_type to asm/smp.h
Cc: "GUO Ren (XuanTie)" <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Anup Patel <anup@brainfault.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816070049.2097442-2-guoren@kernel.org>
References: <20260816070049.2097442-2-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921729.3717435.10139793201347724794.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9
Gitweb:        https://git.kernel.org/tip/1ae91dc397eb1dbc0f4fc6b96f2481cbc02=
fe0f9
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:45=20
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
index 0ecc676..bed39ff 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -15,6 +15,18 @@
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
=20
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
=20
 #include <linux/jump_label.h>
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c..8930b62 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -28,18 +28,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
=20
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
 static const char * const ipi_names[] =3D {
 	[IPI_RESCHEDULE]	=3D "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		=3D "Function call interrupts",

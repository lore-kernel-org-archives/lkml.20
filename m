Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE153370EC;
	Mon,  7 Sep 2026 19:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810364; cv=none; b=mDuf726qGtIX51kCmamDIugoCWHtjjI4ICdp2gxZN4i3WdceKqHwPO10RT5SXTekx4Mloc2UBcBiwTpbA/8HwT8Gjz6Zv+kHQHwTRzqBfTbU4TYmDM+q+nFNI81MqdqsxhUSKm4UNyE/MZSJ2dhU3oQrBya0FEFweJZT2H+/Kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810364; c=relaxed/simple;
	bh=SlEgYIFYSdVt0FOlDAgMwpS/laTh9KXd8ai5BJQy9Pg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WPv4g928R1IpPmESReACgsTOlh4oRiYNT+NrVP9jeklhd802x/m4xSoIqS940Fthnj69NR2x2IiTAyK2Eq63brDbATKRqeSwn10uhWFNR1q2pP9WApJp2KkB/kM3mvSLusDaiWUPteUc6qk2Ekf6H/UzmFVY7V+VIIk36455PUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iXEUka9M; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B5BBSJcF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iXEUka9M";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B5BBSJcF"
Date: Mon, 07 Sep 2026 19:45:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810360;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTSPBec1NHbA8zI8xCzWqfgsgM2KjdJEdOIavNWsUhE=;
	b=iXEUka9MEu2Q9DWRk2Tjei/xXBfhi9UC6xsydf+PBoUSve5HDcFNqDIeF+1IGoo/7vyO5h
	tTqK37IJe5DZT5S7VBzdZ7JSSXtfYA5N4jqGUX3+MfBcmJgvK7CPBf7pOUcdB/Sr7A9K5k
	bmKa7UkDxw2rN8F9M8JBgn7rFTXkVDWyYnHpxKiVWvKTxymBYvoAglshObOrlNUBLq2OTx
	A2oS0P7fUlJhvQaJsXe++SVR2R679gAVA7DXvp1VLJFuoouyjmc4ngtNvkkPLSh+uG6ue7
	wkzXdJk7A2cnTBHFvVFWjLFb+E5taU3d1e9QMt9Tv30uEPRcFryL3cocInxe0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810360;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTSPBec1NHbA8zI8xCzWqfgsgM2KjdJEdOIavNWsUhE=;
	b=B5BBSJcFLk/04GlNqsbwKiIEFf1HqxcecfPjhdP2F99O+PFifmRKhtKqilIh7ZcVlziSn5
	cYv57aDsS6RhKZAw==
From: "tip-bot2 for Sascha Bischoff" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/urgent] irqchip/gic-v5: Preserve ICC_CR0_EL1 state
Cc: Sashiko <sashiko-bot@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907164945.714545-1-sascha.bischoff@arm.com>
References: <20260907164945.714545-1-sascha.bischoff@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881035797.623050.13025964098611096189.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/urgent branch of tip:

Commit-ID:     1017911fcc03584b6854b1b8f0aafeb25f5a8d25
Gitweb:        https://git.kernel.org/tip/1017911fcc03584b6854b1b8f0aafeb25f5=
a8d25
Author:        Sascha Bischoff <Sascha.Bischoff@arm.com>
AuthorDate:    Mon, 07 Sep 2026 16:49:50=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:44:17 +02:00

irqchip/gic-v5: Preserve ICC_CR0_EL1 state

In addition to EN, ICC_CR0_EL1 contains other fields, such as LINK and
LINK_IDLE. The driver only needs to modify EN, and must preserve the
values of all other fields when enabling or disabling the CPU
interface.

Define the missing LINK and LINK_IDLE fields, and use read-modify-write
accesses to update EN without affecting the rest of ICC_CR0_EL1.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260907164945.714545-1-sascha.bischoff@arm.com
Closes: https://lore.kernel.org/r/20260807121703.D4B7A1F00A3A@smtp.kernel.org
---
 arch/arm64/tools/sysreg      | 4 +++-
 drivers/irqchip/irq-gic-v5.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065..e2d37ee 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3761,7 +3761,9 @@ Sysreg	ICC_CR0_EL1	3	1	12	0	1
 Res0	63:39
 Field	38	PID
 Field	37:32	IPPT
-Res0	31:1
+Res0	31:3
+Field	2	LINK_IDLE
+Field	1	LINK
 Field	0	EN
 EndSysreg
=20
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423..5f2551c 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -974,7 +974,8 @@ static void gicv5_cpu_disable_interrupts(void)
 {
 	u64 cr0;
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 0);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 &=3D ~ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 	isb();
 }
@@ -991,7 +992,8 @@ static void gicv5_cpu_enable_interrupts(void)
 	pcr =3D FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
 	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 1);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 |=3D ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 }
=20

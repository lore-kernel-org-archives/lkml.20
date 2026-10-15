Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A75172CF;
	Thu, 15 Oct 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059774; cv=none; b=DW2QvCNIhC3E0lXVjCed0drCKs2cVMCDFXqrJyRAGgb6s2HPg7XrOhTO976SySM/g63ClkvG+hWGYvlozQlUyHK/FFnKrfStMiE5HMNpHTyyImvWpJ02HH0UZdZkstz4HkofuMDBRyVXtRN4b2w3ojXZflpvng2nNWZ9MZXEutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059774; c=relaxed/simple;
	bh=zAwISNiUQ/YnqIXMcdMJUSQyOUKIW+99ln7jlBtrPfk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TIajGRm6nLJGw02wMV58wXyfs1OINhIFRY9+4UO59Gi10UayDqI30xb2v5ymIe9geMxbMgKiQQyTzXvSHB9tCy89PLyLvgGVx/PZoey+suFOpf04fvY+ZWEtanxC51WA+SEtDUZRM6K6NGZFC3bk206XBLnid5mcQhECJ8xPC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PCg9fIgR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KKPSYQNr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PCg9fIgR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KKPSYQNr"
Date: Thu, 15 Oct 2026 10:22:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059770;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItWoxLVhZIXQutkgpDF8IDlsIB1DsGrBxcXSQPkT/N8=;
	b=PCg9fIgRvDKkL7QC11hJKOlzd2pasNsmXL0NPv646H8U8fnm8uln0iojWuDaBXnVE8fWao
	f5+Fv+VXLnSxVlOUytvqdzvoQUdlBAMvCmjzXpjRlqwThWOijEIf/yTAiWcJ4ciBm/WTqc
	88Xj1cDuj45WyqHgVry5m66dBvc8POev6V6bVNn92yQo8+rlRNYII81f91cuiH670WakNv
	F8a/keFP/zZTYecwf5XXE5ogVa4LEF1iGy9WMlb7tLyUNuF9WQJgV2bjYB7ZjHYa4BRngw
	bt+nzzwE8rSv018jptcSJLHtLGxsTnm8yqIfAhq8HyHT9P0nGJyfT9bnVhaT8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059770;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItWoxLVhZIXQutkgpDF8IDlsIB1DsGrBxcXSQPkT/N8=;
	b=KKPSYQNrD8Y5kE0tyYAtWGtOf7QHYvAPzdE7qpB7/zT0Md2j8E4c0rzDyBFVHi27tqYxvJ
	bIIJNOM/CSbnr8Cg==
From: "tip-bot2 for Prajwal N" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/riscv-imsic: Expose the fwnode via the
 global config
Cc: Prajwal N <prajwal.n@oss.qualcomm.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
References: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205976916.2666988.4450889858749653531.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     ff6f8cd2919badd242593a86191e8fbba9a18a97
Gitweb:        https://git.kernel.org/tip/ff6f8cd2919badd242593a86191e8fbba9a=
18a97
Author:        Prajwal N <prajwal.n@oss.qualcomm.com>
AuthorDate:    Fri, 02 Oct 2026 17:34:17 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:16:59 +02:00

irqchip/riscv-imsic: Expose the fwnode via the global config

The fwnode describes a global property of the IMSIC interrupt
controller that is equally relevant to external consumers of
imsic_global_config as it is to the imsic_priv itself.

Keeping it in imsic_priv forces the external drivers to access
the private structure rather than using the already exported
imsic_get_global_config() interface.

Moving the fwnode into imsic_global_config makes the public
API self-contained and eliminates the need for callers to
access imsic_priv internals directly.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261002120417.2708979-1-prajwal.n@oss.qualcom=
m.com
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.h    |  3 ---
 include/linux/irqchip/riscv-imsic.h        |  3 +++
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-ri=
scv-imsic-early.c
index 823f5f2..06726a0 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -75,7 +75,7 @@ static int __init imsic_ipi_domain_init(void)
 	riscv_ipi_set_virq_range(virq, IPI_MAX);
=20
 	/* Announce that IMSIC is providing IPIs */
-	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_=
IPI_ID);
+	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->global.fwnode,=
 IMSIC_IPI_ID);
=20
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq=
-riscv-imsic-platform.c
index 643c8e4..95ff76e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -313,40 +313,40 @@ int imsic_irqdomain_init(void)
 	};
 	struct imsic_global_config *global;
=20
-	if (!imsic || !imsic->fwnode) {
+	if (!imsic || !imsic->global.fwnode) {
 		pr_err("early driver not probed\n");
 		return -ENODEV;
 	}
=20
 	if (imsic->base_domain) {
-		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
+		pr_err("%pfwP: irq domain already created\n", imsic->global.fwnode);
 		return -ENODEV;
 	}
=20
 	/* Create Base IRQ domain */
-	info.fwnode =3D imsic->fwnode,
+	info.fwnode =3D imsic->global.fwnode,
 	imsic->base_domain =3D msi_create_parent_irq_domain(&info, &imsic_msi_paren=
t_ops);
 	if (!imsic->base_domain) {
-		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
+		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->global.fwnode=
);
 		return -ENOMEM;
 	}
=20
 	global =3D &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
-		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
+		imsic->global.fwnode, global->hart_index_bits, global->guest_index_bits);
 	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
-		imsic->fwnode, global->group_index_bits, global->group_index_shift);
+		imsic->global.fwnode, global->group_index_bits, global->group_index_shift);
 	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
-		imsic->fwnode, global->nr_ids, &global->base_addr);
+		imsic->global.fwnode, global->nr_ids, &global->base_addr);
 	pr_info("%pfwP: total %d interrupts available\n",
-		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
+		imsic->global.fwnode, num_possible_cpus() * (global->nr_ids - 1));
=20
 	return 0;
 }
=20
 static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	if (imsic && imsic->fwnode !=3D fwnode) {
+	if (imsic && imsic->global.fwnode !=3D fwnode) {
 		pr_err("%pfwP: fwnode mismatch\n", fwnode);
 		return -ENODEV;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-ri=
scv-imsic-state.c
index 960c71d..0162037 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -822,9 +822,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode=
, void *opaque)
 	imsic =3D kzalloc_obj(*imsic);
 	if (!imsic)
 		return -ENOMEM;
-	imsic->fwnode =3D fwnode;
 	global =3D &imsic->global;
=20
+	global->fwnode =3D fwnode;
 	global->local =3D alloc_percpu(typeof(*global->local));
 	if (!global->local) {
 		rc =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-ri=
scv-imsic-state.h
index 878cc19..189829b 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -43,9 +43,6 @@ struct imsic_local_priv {
 };
=20
 struct imsic_priv {
-	/* Device details */
-	struct fwnode_handle			*fwnode;
-
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
=20
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/risc=
v-imsic.h
index 61af3a5..b7be1aa 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -46,6 +46,9 @@ struct imsic_local_config {
 };
=20
 struct imsic_global_config {
+	/* Device details */
+	struct fwnode_handle                    *fwnode;
+
 	/*
 	 * MSI Target Address Scheme
 	 *

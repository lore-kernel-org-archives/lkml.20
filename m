Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00051DE03;
	Thu, 15 Oct 2026 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058454; cv=none; b=m1GiBoGmzAQClVtw/voxqmSqctgmYAhoLVys2wEPvP76JZHS/1cVVjvOcjYEHxtJlBzGoDJTL+B1y84mpDEOtlNLb/DVjIhjd77cNAk2t3sviqZJF5nICEarZN33TGZyuVwrmQSBwcgPDWTEdAYL5SgmiBUGP0g48o12gRcH/EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058454; c=relaxed/simple;
	bh=i+sXd04+YzVqhpZ3Qh3046VpSWpNEri2VpEIPoeOQWY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hgo4rExWTnFQYZ/BKnrtuH8RnKGHvLpiW3+oAGq90FtBE9DCHTXju2jIKcjVpc3tGaO/rmMXXuAYRZgDOFOLsfJNz7PstUiO94ERuABuS4uP5YeUt0p6gWc/ErKYOr7TdiqljA+3hH/f2mCn5gjXnUtN0UitODrptwGjGclxRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M4OUMM/8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OXfFW31M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M4OUMM/8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OXfFW31M"
Date: Thu, 15 Oct 2026 10:00:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yplxBwvqkJREo+5APsctcBB9gKsokvBljRzdGfFqR94=;
	b=M4OUMM/8Qv2idVAJldW5MFjWV0zXKBr4bdXY4LAh5LPwjJNW3bbIpLSVmbcaz8zZF3ET7k
	+tJ238tJsbw5fG0IYuT3XWgk0VJyQyINXC42OtaDkugnkNuK4YlOM3bSronWA/RDBrUnRP
	E52NWcReoeSPliaZslismdEUa1LQfNXh9lFrPGioCNAHj3QsYGGmZ+tAEvIFNtoHUdVGzK
	H0Zvcl39Nzj9jpWLCLk6DZuv3Os8ogEbshKYllpVKpJXfkaq6TtyrAhMMc/EYTYU+Hwj2H
	zJsKqZWK4o/N3Wat6IZdQss8xzegGs2ZURgFRLXIx0jTCEWMiHANLfDkZnN+nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yplxBwvqkJREo+5APsctcBB9gKsokvBljRzdGfFqR94=;
	b=OXfFW31M8wKHcF7kxqttWY49CbnlXAmVc6EKINAPKnyZRi0Ler/3JgPUZBi/K7A4rsat/O
	GhkH+fFltCveDICw==
From: "tip-bot2 for Fuad Tabba" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3: Don't register a redistributor
 that was never counted
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925085000.753400-4-fuad.tabba@linux.dev>
References: <20260925085000.753400-4-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205843951.2666988.16001037954693924817.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     6a21693b97ee5cb0a21d04bfd051a05dde5aa783
Gitweb:        https://git.kernel.org/tip/6a21693b97ee5cb0a21d04bfd051a05dde5=
aa783
Author:        Fuad Tabba <fuad.tabba@linux.dev>
AuthorDate:    Fri, 25 Sep 2026 09:50:00 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:55:41 +02:00

irqchip/gic-v3: Don't register a redistributor that was never counted

gic_acpi_match_gicc() counts only the enabled GICCs with a non-zero
gicr_base_address, and that count sizes redist_regs[], but
gic_acpi_parse_madt_gicc() registers every enabled one. On a MADT with
no GICR entries, an enabled GICC with a zero GICR base therefore makes
gic_acpi_register_redist() write a struct redist_region past the end of
the array.

Commit fa2dabe57220e ("irqchip/gic-v3: Don't return errors from
gic_acpi_match_gicc()") removed the check that kept the two consistent.
Its message says such entries are still caught by gic_populate_rdist(),
but that runs from gic_cpu_init(), after the write.

Skip the entry instead, and mark the CPU's redistributor broken as the
online-capable path does, so that gic_check_rdist() rejects the CPU.
gic_starting_cpu() runs past cpuhp's last failure point, so without the
mark the CPU would come online with its redistributor and CPU interface
unconfigured. With an ITS, its_cpu_init() would then dereference a NULL
rd_base.

Fixes: fa2dabe57220e ("irqchip/gic-v3: Don't return errors from gic_acpi_matc=
h_gicc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260925085000.753400-4-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 9231688..32a8ea4 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2344,6 +2344,17 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *=
header,
 		return 0;
 	}
=20
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		int cpu =3D get_cpu_for_acpi_id(gicc->uid);
+
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address, CPU =
kept offline\n",
+			gicc->uid);
+		if (cpu >=3D 0)
+			cpumask_set_cpu(cpu, &broken_rdists);
+		return 0;
+	}
+
 	redist_base =3D ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;

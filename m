Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFC2518136;
	Thu, 15 Oct 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058111; cv=none; b=Csl9z36OUA+uvD9bMuwQ2PQOPRBp6/O3g1OXQvQWWXT+XFFPPb3JFT9pWNAMe8X4NZM3DdYXOeTuRKxw3ND7hp/ujSN3mZGWaJRCdGEKFuasif7axYzmvxX1YjTMAFAQl2hBhdvUc+MtP87i7x4QCUh5TdCx3yN2Yuf6v7C3Wjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058111; c=relaxed/simple;
	bh=PPro8ssINAu9AQ3ITnnS9ZPIgwxUAEgnwgZ5Zw2IYB0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=W3qf246BD4C29cuVDB8lLSI84Z0m8+j+22TpASU4GX4OtYjxb1zM7F6v7p9AlkpGwKz/5TjCF5HAJVFNZrAy+9uIcJFTLon6gt3af3odvra5lwRQsfreWAdUZ85olj7gs9Eu2YeFN3guy+rTO6n5TkKh4Ci89rmQYqqNzkwE9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2uY3pg1x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zfxshd4O; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2uY3pg1x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zfxshd4O"
Date: Thu, 15 Oct 2026 09:55:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058102;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCAeDypVlG/PT2zTGhoT4CStonKHdRv9mrvLt2cwXSU=;
	b=2uY3pg1xtapH86yum2C6gHrwZlgywVbqNcDVCb/NJxrKHC3HbKiHYEpgnCQb4lH1BIgtac
	el9ehQT3n3JIZFeLFKUboLxXZS//hODKNJliMt5TK8ozyEE1z1z3T3KFDQRIFlJJOQW6IT
	fkEQo55TRtU279u4wHT3zfIWnrMtJjjZe9V8/uLBYCW5Hqosz4o8a4uE59I/khZpML8UWA
	yDOw6KiDDFhLf3rSJa1VjFGjgbOc5W9PBnqjVGK6xQc+KA3pWG2whYgnWZ3kmEF+y4npq6
	e6YtrGId78hgZhHc0SeeXfjMBu4wPOtC2iSs47MJWaasLxLV20tTcW1hgXjqZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058102;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCAeDypVlG/PT2zTGhoT4CStonKHdRv9mrvLt2cwXSU=;
	b=Zfxshd4OgHsnDpCgA7TPFVu2UKNSLbrT4HNFLlQ1x6OSZfJ8VJkpIprGLS/SzbfwK2NUvu
	hjFSODlHQICZwGBQ==
From: "tip-bot2 for Fuad Tabba" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3: Release the partition node in
 gic_irq_get_fwspec_info()
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908142632.2795308-2-fuad.tabba@linux.dev>
References: <20260908142632.2795308-2-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205810132.2666988.7640033049577056361.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0773b76611e9c596c825076d422d372697da9940
Gitweb:        https://git.kernel.org/tip/0773b76611e9c596c825076d422d372697d=
a9940
Author:        Fuad Tabba <fuad.tabba@linux.dev>
AuthorDate:    Tue, 08 Sep 2026 15:26:30 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/gic-v3: Release the partition node in gic_irq_get_fwspec_info()

gic_irq_get_fwspec_info() never puts the node it takes from
of_find_node_by_phandle(), so every lookup from a four-cell PPI or EPPI
specifier naming a partition leaks one.

The node is only used for the comparison against gic_data.parts[], and
the mask returned points into gic_data, so it can go out of scope with
the lookup.

Fixes: 68905ea65ceff ("irqchip/gic-v3: Add FW info retrieval support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260908142632.2795308-2-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 19a15c2..9231688 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1728,8 +1728,6 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *f=
wspec, struct irq_fwspec_
=20
 	/* If the specifier provides an affinity, use it */
 	if (fwspec->param_count =3D=3D 4 && fwspec->param[3]) {
-		struct fwnode_handle *fw;
-
 		switch (fwspec->param[0]) {
 		case 1:			/* PPI */
 		case 3:			/* EPPI */
@@ -1738,7 +1736,10 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *=
fwspec, struct irq_fwspec_
 			return 0;
 		}
=20
-		fw =3D of_fwnode_handle(of_find_node_by_phandle(fwspec->param[3]));
+		struct device_node *np __free(device_node) =3D
+			of_find_node_by_phandle(fwspec->param[3]);
+		struct fwnode_handle *fw =3D of_fwnode_handle(np);
+
 		if (!fw)
 			return -ENOENT;
=20

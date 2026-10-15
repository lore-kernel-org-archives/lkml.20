Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02855172C5;
	Thu, 15 Oct 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058113; cv=none; b=n8hOf02pD1C9lt8dq1TtD14a17tcR5YJUNkk3L7D8Z4YDfp+TFWgl0U2VzokrtDFc99q0n3jITUT3dUzIpi+MOVHQKwUt57KvPVPoi8qxJTegG462xEXs/b7lsUiU9l0EnymLDy4Zv9fubQGosZAUPX9/ZQJELK+E5ZoMgwmqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058113; c=relaxed/simple;
	bh=jj1ZcZmmWMjM8dCl7A5H95YPhBJN9ae4BwGAqQMPNpY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SvWzh/ZUSlstUKGV9iwCy4BHpQlXrj45GocsPinaG2HGpLHWo7lHoNV+p+ymiHe4u5UWUX1pRgGkoQmrf8NRx98G3+UFM9JBwibW/QPF9T2828s4qhir3YvTYtpl5EWTi0sICgptP2r2YKEXioSA52ToOMECuES24k/gPcrjETY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IPUFptWS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GXRWnw/z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IPUFptWS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GXRWnw/z"
Date: Thu, 15 Oct 2026 09:54:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058100;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAjQY453n3KM7GT1+V7iJLoPeAUB/mpcfhmBtHrrqFE=;
	b=IPUFptWS6bXEKSm+6lBH6da5SGjZtFe5/DNCQhNzG+sbPl9/BUAAEGPUSxD/K/O+M9fmEN
	oBhqg1LXQrdfmYpSiMlMosGnV+4lMxLgV2ENkg7na3OP7eqt7ffbWgE3/CtRSV/B2oZJ//
	8ZdJG9CiKacnFl5moL81QaRIyVEVX9EmfW8SNBGlr4JBG2mBQQcBQVMOEUds8tElMCNWG1
	MkGXkhH9AIOG22V6fu448KAUFqVJF0qUpiQrod+vuDX/dsvRMEYepnc/jPZBZg+Iuw3jq1
	KNAw3UZGEFnAvbX0chQQnATI+py8UeuR6vlkyRlLjohZ86CqxkNQO8Ggh7x8FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058100;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAjQY453n3KM7GT1+V7iJLoPeAUB/mpcfhmBtHrrqFE=;
	b=GXRWnw/zWgYcwH9FQ30At7L4ogSk3Q9D8E2Zt0tJUzspskkvA+Q+di7Pw/qcqGuVJaA8QY
	zGgam1Pc1kz3S6CQ==
From: "tip-bot2 for Fuad Tabba" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3-its: Clear vpt_page after freeing
 the pending table
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908142632.2795308-4-fuad.tabba@linux.dev>
References: <20260908142632.2795308-4-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205809837.2666988.9118266505755565424.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0d604b1e4617d18dbb5573290ba447d7369251d1
Gitweb:        https://git.kernel.org/tip/0d604b1e4617d18dbb5573290ba447d7369=
251d1
Author:        Fuad Tabba <fuad.tabba@linux.dev>
AuthorDate:    Tue, 08 Sep 2026 15:26:32 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/gic-v3-its: Clear vpt_page after freeing the pending table

its_vpe_teardown() frees vpt_page without clearing it, so its
vpt_page =3D=3D NULL guard only holds the first time it runs on a vPE.
struct its_vpe outlives a failed KVM_DEV_ARM_VGIC_CTRL_INIT, so a retry
that fails again frees the pending table and the vPE ID a second time.

Fixes: 325ff3e78c64c ("irqchip/gic-v3-its: Prevent leak in its_vpe_irq_domain=
_alloc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260908142632.2795308-4-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 4f6d4aa..872d342 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4600,6 +4600,7 @@ static void its_vpe_teardown(struct its_vpe *vpe)
 	its_vpe_db_proxy_unmap(vpe);
 	its_vpe_id_free(vpe->vpe_id);
 	its_free_pending_table(vpe->vpt_page);
+	vpe->vpt_page =3D NULL;
 }
=20
 static void its_vpe_irq_domain_free(struct irq_domain *domain,

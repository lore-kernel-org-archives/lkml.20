Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2350B42F;
	Thu, 15 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058092; cv=none; b=OhIDslMhzDYAFvkPSW5kUk6128eNAB/kiq9oKMIijwa7bIc8ziuF4WKFtkdAsxRITwlFtHgEJTgLWZiIWeO6nrxtsas5fV8oSR1EMUu8HmuUNFjOaSaNjOzyaMfA0abIXvPDfYzUy5cXcH3K8HsK1YB++WYltqXh4tXYQZZs7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058092; c=relaxed/simple;
	bh=XIWfeBNbb5OZlKDo53fkgEABBDT/VgVTqvYShxZ3ySk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=i/OqLy6TDdSXwYacs/JMaguUfwtibvxPc2Bsw3v0Sn1t+sSWLLex5sUht0/mCip+3E8nhKRHl+LhOAz38bhk+teyFXYmvZz8uAOOYwnBHKjZvy4Sxc+O6SHyQqfq7FY8L8FYYo0gn6PhwOPiQptXok+wIwfzWHOdC7mP0IeDNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I39IfSoP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7qR4DmUn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I39IfSoP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7qR4DmUn"
Date: Thu, 15 Oct 2026 09:54:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058089;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTEugNyEmUhy8oq2Q1q9JaRQgUTV37P4QcmvrLxk3Zc=;
	b=I39IfSoPyUD0VHly6WKvlnwGBfezJ6swyaIhmxmsG3V1pFjM8hJk+c/D57gHZislDJnxbx
	b5k+Wz018KPfRVw25pelaf1OQYnFadxOFYfvOsGs4P4rdaWqHwQlh3mgLe9+a/NEXhBEgP
	uTQ/r8cxwowoAtsaxRjPhVPJGyThY3Yr7XoBIVV2Od+dHAIglV2ad5nlCVP+b1tAIDH2oV
	mGqkUSeWrXgNT9B407UmQmw+Do7UsCUYCjEvMVD2vcncM2ywZh07ffB3e1Sh2+8n4co6dB
	K4NgPKwiF77/l6gzKx0FzxCIvWLhx8oEsO8t3CbTUlkVkUaWkNKz2Nrhkexo1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058089;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTEugNyEmUhy8oq2Q1q9JaRQgUTV37P4QcmvrLxk3Zc=;
	b=7qR4DmUnA8QKKYqUkzuwr0PM/d7Yf9WQ/aq3eOvnoPnhZed+sqWizpeojafaMfGGyKY+xd
	RLYRyalyM3a51pCg==
From: "tip-bot2 for Pengpeng Hou" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/sifive-plic: Avoid signed shift in
 interrupt enable mask
Cc: Pengpeng Hou <hppiscas@163.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
References: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205808757.2666988.6656456554670191586.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0f214e5bbee59d5952d3c061fd65ed9a1e175981
Gitweb:        https://git.kernel.org/tip/0f214e5bbee59d5952d3c061fd65ed9a1e1=
75981
Author:        Pengpeng Hou <hppiscas@163.com>
AuthorDate:    Sun, 20 Sep 2026 21:06:53 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/sifive-plic: Avoid signed shift in interrupt enable mask

__plic_toggle() builds a 32-bit interrupt enable mask using a signed
integer literal. A valid interrupt selecting bit 31 evaluates 1 << 31,
which shifts a signed int into its sign bit.

Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
The resulting mask remains representable in u32 on both RV32 and RV64.

The issue was found by our static-analysis tool.

Fixes: 8237f8bc4f6e ("irqchip: add a SiFive PLIC driver")
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: gpt 5
Link: https://patch.msgid.link/caplitmus-rv.v2.plic.87a8fc444de44e109889ba287=
03c76f3@163.com
---
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-p=
lic.c
index 70a7478..4156493 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,7 +108,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned=
 int type);
 static void __plic_toggle(struct plic_handler *handler, int hwirq, int enabl=
e)
 {
 	u32 __iomem *base =3D handler->enable_base;
-	u32 hwirq_mask =3D 1 << (hwirq % 32);
+	u32 hwirq_mask =3D BIT(hwirq % 32);
 	int group =3D hwirq / 32;
 	u32 value;
=20

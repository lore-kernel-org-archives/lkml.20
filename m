Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE05226BB;
	Thu, 15 Oct 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067555; cv=none; b=rp/nbchUUBji1Yn5djLN4qOT6y4uG8PCTDqh7EO/DSxsi19RxeIicfjTVmYbm2+1AFDoFsW4kgcrnEZvSLzVuFqWqKhrWmb1yd9a1jkkRUcoSlPJJLLVysRfFSxA7Sg39SvebaC/Mxp6zfsE2dm49xI097zdykBsOp6d3N+Co6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067555; c=relaxed/simple;
	bh=HLjmgylYNnMxv9sltXg8PYm/4/K6tajpiTn8LHoPTDM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Y18csTSClzU8yjWNK+yvYltqLfttPymo0M/eQx0WCGP1Hs0SJhDbfkygw9zTzjyqULRPmcc0wJEEQrWuGBnHjLNc+jKBrWJButvP6L6Zub448pJ8OgDLAKn8LZrvr4FiULAhn6u1w6Acv+jF9P4CN2r6sH2n1dOLYAwFhqYRau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OdQCbgAn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aJBnDqvT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OdQCbgAn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aJBnDqvT"
Date: Thu, 15 Oct 2026 12:32:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067552;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrWQtk9gm8+0Xzr2wG4Rmlc1nAK7jhhSHOf6Y+26lhQ=;
	b=OdQCbgAn1xf7UclCaCv/cUppDxhh7Y4zzj9FkhFR4gmKSMCwnWyYhb1CZwAIuRJr/vlqL5
	cgjh+PgHKmlG18NzBNtLEOyNslDpIR/onrbGSqExz3jJ+8UtKLxR19bj1kUMMiJX9y/i++
	7oIOSj/0rSLXv/eFJ/qIM6ipR+u/rxBQDhCH0+u2UFFc0+W5629rSt6qz2wcsiOOnXbbkA
	R66yss3sr03P3g+rUbKKQNEG/8KkuUgjihVaU9D889+QGELkAaq0TuIkvFiaTW7GBe4B5k
	a+syMtVNY8yNmAlpwRMNv9SsInA6hW0Umu3eGcceQXjyJQ4QzAcmgVZmYE5u9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067552;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrWQtk9gm8+0Xzr2wG4Rmlc1nAK7jhhSHOf6Y+26lhQ=;
	b=aJBnDqvTxxUFvhRIIQU4mYm9QHf09lod+RH8YtqcjCIcCfgNY6+y4Ac31ZXvBBAN/ntkG4
	Cf7eWBd8625V/SBg==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Use %pe to print init error
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-3-farbere@amazon.com>
References: <20261011050449.41903-3-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206755051.2666988.17798244656466425260.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     e86459748d3119e18faee281408f5452865bfea4
Gitweb:        https://git.kernel.org/tip/e86459748d3119e18faee281408f5452865=
bfea4
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:41=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip/al-fic: Use %pe to print init error

al_fic_init_dt() logs PTR_ERR(fic) with %lu when al_fic_wire_init()
fails. PTR_ERR() returns a signed long, so printing it with an
unsigned format specifier turns a negative error code into a large
positive value, making it harder to read.

Pass fic to %pe directly instead of unwrapping it with PTR_ERR()
first. %pe accepts the ERR_PTR-encoded pointer itself and prints a
symbolic error name (e.g. -EINVAL) when one is known, falling back
to the plain decimal value otherwise.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-3-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index adcdc05..a513d0d 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -243,7 +243,7 @@ static int __init al_fic_init_dt(struct device_node *node=
, struct device_node *p
 	fic =3D al_fic_wire_init(node, base, node->name, parent_irq);
=20
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n", node->name, PTR_ERR(fic));
+		pr_err("%s: fail to initialize irqchip (%pe)\n", node->name, fic);
 		ret =3D PTR_ERR(fic);
 		goto err_irq_dispose;
 	}

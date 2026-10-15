Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7151A72C;
	Thu, 15 Oct 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058777; cv=none; b=ClKQGvi45x3ZuYtaa48J+UzQmUPh8Rgs/SJcAMjTEI4VT2IYoR9lE2DPzdeXl5+iQF1PALpDQ3CpAO78QoqIyeAeuOn1dg8WxQsaCmjnyXQw1VHWOgLk1xxr8DD4Ffi57IhbrN5ZYx1KCzNSp5i3/j3bNwuHAhpbGUuHpoPn3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058777; c=relaxed/simple;
	bh=iIW0WXTcyJ2XwQgQsEMkcrSOTiYQP0UWPZkVSOm5e9U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=M04hsfj9Nrk3mR/YKVyRuaPJKWw6TWvivMbirTL6RKlrlXTqt/pQ1A6VLj90fXZ4bKJAM8yL6Wt7E8cOKtAO69R/1hq1kyDUfrCgiXgm6SHlxUiPXCWDypfWblvUokx9UY+E/DP9pal0PCaS+aY9zQLSCaehxDVMwUuMbZLlbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KiAZ15tY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=muT4TEFY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KiAZ15tY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="muT4TEFY"
Date: Thu, 15 Oct 2026 10:06:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058774;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO1WOuxfjx+/2w5cnh7JAcf+ip0BWv2Il+mUrF70LfM=;
	b=KiAZ15tYUotAmAuhimcJFI4XuohdG2XL63o5j6C9tBnFQImuxHRdr4Uj5KRf4BKHr/okJX
	F2Sz/XA6KGzDLatoP+BS8gAMT1h/fLdue51GJBSHDKPJc1/7Hby3256mAxSxpDCc4fg3OT
	4HBrIktkhZGYnE5xUv3C7v9ZEPJxnraKffRZvuDU9Wc9m3zO2uBD3Xn6eSV6IzQKIq0ZKu
	j4t8uHYzAjSH1HDr/qcNFWn1cB5suiZ+FS/+w8/6Udg4VCH8wOdF/mZCnU8SwJoeMMAHA3
	TlvB0ux/OsIAaZMhYqJE+NcDUAIdwUDsgUB/zAUSg1KfD9KXn+v6hHTsYTQszA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058774;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO1WOuxfjx+/2w5cnh7JAcf+ip0BWv2Il+mUrF70LfM=;
	b=muT4TEFYIA3qoNde5Qwbm0UmfrM1jaMvvciV2ibFPsh39WZkWGt9voKy/XJewE7Ll/VT/e
	WwB7rBEocsxnYzAw==
From: "tip-bot2 for Vladimir Murzin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3: Ensure change to DS is visible
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260930161123.46368-1-vladimir.murzin@arm.com>
References: <20260930161123.46368-1-vladimir.murzin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205877221.2666988.6823427304608483749.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     254772534e40060abe5321093400947e03b13d54
Gitweb:        https://git.kernel.org/tip/254772534e40060abe5321093400947e03b=
13d54
Author:        Vladimir Murzin <vladimir.murzin@arm.com>
AuthorDate:    Wed, 30 Sep 2026 17:11:23 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:02:17 +02:00

irqchip/gic-v3: Ensure change to DS is visible

Sashiko reported missing GIC synchronization when the
FLAGS_WORKAROUND_INSECURE path modifies DS. Specifically, an immediate
read of the DS state after the write might not observe the effect of
that write, which can lead to misreporting the DS state.

Updates to the DS bit are tracked by RWP, so poll it after the write
before proceeding to read back the DS state.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260930161123.46368-1-vladimir.murzin@arm.com
---
 drivers/irqchip/irq-gic-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index b9a99f9..9487364 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -164,6 +164,7 @@ static inline bool gic_dist_security_disabled(void)
=20
 static bool cpus_have_security_disabled __ro_after_init;
 static bool cpus_have_group0 __ro_after_init;
+static void gic_dist_wait_for_rwp(void);
=20
 static void __init gic_prio_init(void)
 {
@@ -179,6 +180,7 @@ static void __init gic_prio_init(void)
 			val =3D readl_relaxed(gic_data.dist_base + GICD_CTLR);
 			val |=3D GICD_CTLR_DS;
 			writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
+			gic_dist_wait_for_rwp();
=20
 			ds =3D gic_dist_security_disabled();
 			if (ds)

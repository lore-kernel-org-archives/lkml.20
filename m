Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174586;
	b=gBMZb4hwz56PR34XELykniA2sPcjelIyjee7z5I+XhQfYojJF2OwU7g2PPbBQV3iQZfz
	 fN47kIe9X9CXU/L+ohXTJ2QNyITpYtVg9FsPHGxB1GJMVRmI7Vry/wC89gnyBFdRUyEGY
	 Jj6JBh5heX+RH7sslTe3eIYQg9VvpliHPA1ipkyYJG2D7U967N0u2aWFIcYfTsadM241+
	 6QKL8ho5UdHjFdJYG0rFnU3gjIAkLEqqQMRL0jcq86AzWti5QuSf+DbR+CmrI+HWlf0bb
	 m2leyPLTSfNLygCVcFq3Fw83t3u+NfH1BUo6LXadnWnjih+DLllSS/fvzOetMyW84VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174586;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=yNM8MMX4EwR/xvir8JTuxVDdsKXGEHA78sJHhjPmsHA=;
	b=lxJEnJ/kdYyUGIUzJO8td85dwMwrwS8ZPS566D+cwj9O/cV272vGb+NSXX68mBPlCv+m
	 z0SWfbJFx7mH/CvxC+fzclxyQ3OUWb5csXRp1Oe3U08JU2WLL2aZw9yJw9x80c7fcOpHi
	 G46XWji/mdFZweey7/5rgBU9nihVwzVL2NuvIeVCovOoW5sqREjMB0z8VYa0AK3QSENjQ
	 JhBOszbHJB3ttVKcfSSzIf1XS0/PSaV0XZXSRnsa+EURSPHYq4NZ6a2BHdvwMSpKOBKFM
	 8ZTwZ2XyzCO66zZGTlOaGsngrq6LKUHVHgcKvDPRVzmevGoTELbevzfL/oHrFno+oOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Q7f68oF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="yuXB1/Z4";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C1606D801;
	Sun,  8 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305C1606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Q7f68oF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yuXB1/Z4
Date: Sun, 08 Nov 2026 21:49:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174584;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNM8MMX4EwR/xvir8JTuxVDdsKXGEHA78sJHhjPmsHA=;
	b=3Q7f68oFuhOA1JhHC6j9rzyCmJLWBWbE32fmJlV1O/Uj5moCXS8Pjld2KjNou/fOknVXNd
	RGSvmtV17xw3LNpiuar1tggyvVzppPvciBKszMi1J53NFZm6JOd0n/vZPnVov4EFiXnx0d
	yLRxNUF2XoOr861FSc7Edv7bjI138AOHpiD1XS2K/o8Njep14JRQ52rhUZuK1wDfnvsty+
	JWwGy0bFjgFoNUjekC/F7jA+Ms1Vgi7GiqWvi/PeapoxRZuphOYRp4w6sqgO6TB8v58Bcq
	xy8uxUvOS4FbdIpOlO/WolgAAkF2mgPLP4zW94al0zPRYfAwQiW4Tg8FPYjPpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174584;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNM8MMX4EwR/xvir8JTuxVDdsKXGEHA78sJHhjPmsHA=;
	b=yuXB1/Z4zmCTtqBxSTyzEkERYlchhGDuKFvY4CimMLwk4eaeMAN6BSYhN8CBHEgnZIfpib
	XpqU/dJOsadVYUCg==
From: "tip-bot2 for Peng Fan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] genirq/chip: Add guard_chained_irq() cleanup helper
Cc: Peng Fan <peng.fan@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-guard_chain_irq-v1-1-cdbf490510e5@nxp.com>
References: <20261013-guard_chain_irq-v1-1-cdbf490510e5@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417458323.2093942.14330197609841896598.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     6cf0d999a18e799965cf2cf4a0157e257c805946
Gitweb:        https://git.kernel.org/tip/6cf0d999a18e799965cf2cf4a0157e257c8=
05946
Author:        Peng Fan <peng.fan@nxp.com>
AuthorDate:    Tue, 13 Oct 2026 10:08:45 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00

genirq/chip: Add guard_chained_irq() cleanup helper

Chained interrupt handlers bracket their work with a
chained_irq_enter() / chained_irq_exit() pair. Because the exit call
has to be repeated on every return path of the handler, it is easy to
forget one when a new early-return is added, leaving the parent chip
masked or un-EOIed.

Provide a scope-based cleanup helper built on the DEFINE_CLASS()
infrastructure:

  guard_chained_irq(chip, desc);

invokes chained_irq_enter() immediately and arranges for the matching
chained_irq_exit() to run automatically when the enclosing function
(or compound statement) scope ends, no matter which return path is
taken. This removes the need to spell out the exit call by hand.

The chained_irq_enter() call and the context struct are built directly
in the DEFINE_CLASS() constructor expression, so no separate helper
function is required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261013-guard_chain_irq-v1-1-cdbf490510e5@nxp=
.com
---
 include/linux/irqchip/chained_irq.h | 36 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+)

diff --git a/include/linux/irqchip/chained_irq.h b/include/linux/irqchip/chai=
ned_irq.h
index dd8b3c4..6a1a8e8 100644
--- a/include/linux/irqchip/chained_irq.h
+++ b/include/linux/irqchip/chained_irq.h
@@ -7,6 +7,7 @@
 #ifndef __IRQCHIP_CHAINED_IRQ_H
 #define __IRQCHIP_CHAINED_IRQ_H
=20
+#include <linux/cleanup.h>
 #include <linux/irq.h>
=20
 /*
@@ -38,4 +39,39 @@ static inline void chained_irq_exit(struct irq_chip *chip,
 		chip->irq_unmask(&desc->irq_data);
 }
=20
+/*
+ * Scope-based variant of the chained_irq_enter()/chained_irq_exit() pair.
+ *
+ * guard_chained_irq() invokes chained_irq_enter() immediately and arranges
+ * for the matching chained_irq_exit() to run automatically when the
+ * enclosing function (or compound statement) scope ends, no matter which
+ * return path is taken. This removes the need to spell out chained_irq_exit=
()
+ * on every exit path of a chained handler.
+ *
+ * Usage:
+ *
+ *	static void foo_irq_handler(struct irq_desc *desc)
+ *	{
+ *		struct irq_chip *chip =3D irq_desc_get_chip(desc);
+ *
+ *		guard_chained_irq(chip, desc);
+ *		... handle the interrupt, return freely ...
+ *	}
+ */
+
+/* Internal context for guard_chained_irq(); not for driver use. */
+struct __chained_irq_guard_ctx {
+	struct irq_chip *chip;
+	struct irq_desc *desc;
+};
+
+DEFINE_CLASS(chained_irq, struct __chained_irq_guard_ctx,
+	     chained_irq_exit(_T.chip, _T.desc),
+	     ({ struct __chained_irq_guard_ctx _T =3D { .chip =3D chip, .desc =3D d=
esc };
+		chained_irq_enter(_T.chip, _T.desc); _T; }),
+	     struct irq_chip *chip, struct irq_desc *desc)
+
+#define guard_chained_irq(chip, desc) \
+	guard(chained_irq)(chip, desc)
+
 #endif /* __IRQCHIP_CHAINED_IRQ_H */

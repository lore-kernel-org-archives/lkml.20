Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216177;
	b=aB63I53ofitn9PwzhPVmQ4DGUFbX3L2LN8CINjw6q2iHSkYyz6a2sruag/LFt6HJmTNS
	 H1OTbaWm7trB1+M7cYtZbRErtQEPt11Yv38Xk0QcK6TIwJcn4RqM3N7c7uZIe13FNeRNa
	 7GdtA/EiH4nQGcjKCs41KDHXoR1A86noDAvS9Rhi7Cv5i/ze+1V+q+Jcayhk+/mgxrlo4
	 5kerhZWUjomwc6wfXC1Jvn/kTU4KH7mhFn71xz2xGvjDzzWW/x2Baskk7NpEJLj0VjX/C
	 3yUrye5F+WiJSt4xDUcY+QQmwcezCQb/inN6VD0yQP1Lzow6JkXIsF09doaNisW7MbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216177;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Z6STfKhv2gmULxFtZbUX0x2YijHJAwKd6BapsOfeku4=;
	b=I+lQJr1VQFdJT+US0YSsFA+pWbuHNDJhsJ1jiOW48FGE1n4nHlTwBQu1LdhrSbjndUoB
	 X55C9hosKkk/2GmauuZwOKEd0Y14YXKc3lvNzOUrIxfXofMfOX0rzpBuU0OCIxuuc8GC2
	 rzhiUh8PVyumM9ZZtSY1JErVNHov4f8PzS1cXZSy9FQsykV1yS982DobK0ckMuIUOhHw7
	 hWNsrT71wVQS6d23JHqS1TSF2ZaDCSxIfjz6Dqbkk80P0NyrQx5dOo2aw1bG42DX+0chR
	 +1c+b9p+NgHGmJPvZ4ZOva3VpHWm7+1roNW0KuZRjj/zuTZwoEoOsMagLNkJJ2bUFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t9MzxyDa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFf9Z584;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D2C606D822;
	Mon,  9 Nov 2026 09:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D2C606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t9MzxyDa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFf9Z584
Date: Mon, 09 Nov 2026 09:22:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216175;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6STfKhv2gmULxFtZbUX0x2YijHJAwKd6BapsOfeku4=;
	b=t9MzxyDa7wEAXG5QjEC7F1Y1WYR9bAHG2Fo9uo9ZZqEH4+mB7OQDiaanW1Db3dRpbeY14t
	LtwWF8WGUqhtSvptF/W8gPB9G9h502mEwyty1WetXoncObUESSO0oXXCDsLuwVi4sGLOS0
	KwjAQa4kUpdGTe4Lyv0go7Mej57qkJD5hHy4gFW2zDgJ1gDr8OJ/6yjnBk0zH70uCiTCVC
	gX/lyq6W752ZMDF40Id7zXd1RpllNiuy+Ie1SIoyks9nf4HEXB+jLvcFus9rr16Ogqfl57
	MJPzFvwniLd0b0Ef17lKQaiCEb/COFy9sYAZzIAuurHmTG3yZiE+NE/6AaLsjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216175;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6STfKhv2gmULxFtZbUX0x2YijHJAwKd6BapsOfeku4=;
	b=jFf9Z584kjb13Z5/q0i3wNygJS3FklUbwN7jmh2HAcIGTPzoTt+boq01K5s+zIF47BWxm+
	Ppzt2rfPuMWBPWCA==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/alpine-msi: Use SPDX-License-Identifier
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024193620.39999-2-farbere@amazon.com>
References: <20261024193620.39999-2-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421617403.2093942.5443487208645642292.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     8b95bdbad8b11cb9ba24423bbd996510adc5be10
Gitweb:        https://git.kernel.org/tip/8b95bdbad8b11cb9ba24423bbd996510adc=
5be10
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sat, 24 Oct 2026 19:36:16=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:18 +01:00

irqchip/alpine-msi: Use SPDX-License-Identifier

Replace the free-form GPL v2 license boilerplate with the equivalent
SPDX-License-Identifier tag, as preferred for new and updated files.
No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261024193620.39999-2-farbere@amazon.com
---
 drivers/irqchip/irq-alpine-msi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index 6764d64..0d97abb 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Annapurna Labs MSIX support services
  *
  * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Rights Reserv=
ed.
  *
  * Antoine Tenart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

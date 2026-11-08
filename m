Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156220;
	b=fizTqCFFMZODSr08K69q9MBpJevJI8CEiSXuR8HkdIF1erS/dP7ey3fbfioNAUKT4XMI
	 wGkvZEXcNOxLI4163XVbFPI4idvgcVlA+gWbjyZVryIP7C9oMh3jLcrdvhy/tL5OpB8xH
	 GuIjpbepQYpC9n7rcas8d96q9zl+KA+EuIop0nMhcM8Cc5wg9ZCyoLC1ik2BTvrAKChGY
	 mHJWKAMLJxVD9w3ykIHroG1xfFZHJgxviIscCNuURcWes42zH+3cDdBWX4JP+9Y44ceAW
	 9/aJ3JjAIFD+yxA1EVXtQ9NGT1sXZ8OZRgI6ol5xNDKLDM6HtZaSJcC8GgzNCRgeAyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156220;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vKkC/OEkA9sDgstgEFHwOMBFVKMgZguhy8YjY/HXXu0=;
	b=HATJs+tefX6X3KGWTcn9I9F99ER0l0E9pXfq1GO+08R/gM0l7gVd9g83OBWyQf3FO4QV
	 OYBo0KaqU14KMmbK55h82vZnqJqj/WFM8z0VDHFZzrDxUM1Ya+pB4waM9NfYP3vjcbkt3
	 aw++vKwByp2V2ElsPZgq1n+ouiCM90PHtWLifLS9ufCDL9FbLAX9PyreK16OwHUaw3wDQ
	 uetWaLV9RO21TviU2TaZ5owf6vfFFq3jqmK8V3srCEimH4+JznyFBr5lUjmLL9llPngkd
	 t7LCRzFM9WUShNkJT8OK8QLPBKJmnQqSFUin7UaoD9BRTpTtLfHJVDff+PS2lL/QdKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ILCZVMaK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n+EjmSYn;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB8606A320;
	Sun,  8 Nov 2026 16:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ILCZVMaK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n+EjmSYn
Date: Sun, 08 Nov 2026 16:43:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794156218;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKkC/OEkA9sDgstgEFHwOMBFVKMgZguhy8YjY/HXXu0=;
	b=ILCZVMaKxUS0jc7d1TTFLY/jWEFrTaBWGqFRt1FxU4knY1V8fnDIrqeVxe+W3YEH+CvfVY
	rhukl6yqizH25AGYT9RnarHG4Uivrwy4l3jTJqsfHjkIM6fmoK4knu3N2RERRHFjlH34uU
	2sfw6XCq3wXRGG0tSecCiHli5UsWTGj6C9cRZXmXXYx97PULSwl4Jrl1yaNhHEO4qTP4t4
	80j1y3jlIexTLK5N7ESrohBPHmywEQsk95Vwze/dmCpGf3/ceN9xc//ri1y4xQUlC9kKfw
	9GM7EViXTNp9cDJtC9hm1aOrzJITA+CU8ZAA01twULdss/g08uPjaghy5Zp3Xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794156218;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKkC/OEkA9sDgstgEFHwOMBFVKMgZguhy8YjY/HXXu0=;
	b=n+EjmSYn4+vz2e8ZqRcVHR7lqwQRV2+d0HDu4mAvr7kgWH+7pAneh+jTXy1R4fFRU2sOf3
	MGLOyrqn5saaOgCQ==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/core] genirq/spurious: Recognize handled IRQs with threaded wakeups
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20261026074003.2805797-2-thnkslprpt@gmail.com>
References: <20261026074003.2805797-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179415621717.2093942.6255946198218650140.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     6c62ec6029c1480262b9691d8792ff0aa04adba5
Gitweb:        https://git.kernel.org/tip/6c62ec6029c1480262b9691d8792ff0aa04=
adba5
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Mon, 26 Oct 2026 09:40:04 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 17:39:43 +01:00

genirq/spurious: Recognize handled IRQs with threaded wakeups

try_one_irq() compares the result of handle_irq_event() with IRQ_HANDLED.
For shared IRQs, one handler may return IRQ_HANDLED while another
returns IRQ_WAKE_THREAD. The combined result fails the equality check,
so misrouted IRQ recovery does not credit an interrupt that was handled.

Check the IRQ_HANDLED bit instead. Leave IRQ_WAKE_THREAD-only results
unchanged.

Fixes: 3a43e05f4d06 ("irq: Handle spurios irq detection for threaded irqs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261026074003.2805797-2-thnkslprpt@gmail.com
---
 kernel/irq/spurious.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index 73280cc..48d3ef3 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -68,7 +68,7 @@ static bool try_one_irq(struct irq_desc *desc, bool force)
 	/* Mark it poll in progress */
 	desc->istate |=3D IRQS_POLL_INPROGRESS;
 	do {
-		if (handle_irq_event(desc) =3D=3D IRQ_HANDLED)
+		if (handle_irq_event(desc) & IRQ_HANDLED)
 			ret =3D true;
 		/* Make sure that there is still a valid action */
 		action =3D desc->action;

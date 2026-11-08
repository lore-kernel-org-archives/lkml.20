Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174584;
	b=BCnUGZzUhiHP0IYloL5Dt1EUgJqX95HRL8s3puO/LI9SQe5YLBfFOvIp3b/CsfqR/YRI
	 tP1brboJJFQjxecdl8lHKrIVWXSj+pSPdfVms0l5OaKJK0wfUlvy9qfXZqSgKPIr0VEXB
	 DbXRGGx/5uIvE3WZMMLbgNSpdtmvyoVxrS8OuYz2jtc7tzD37edfOvtHjMZC4v6ZU0ljx
	 iMtNBk2Bz7T/uLqFfn2YMLQhEA5RGoIT7arV19OtECwC+dmt1D+0J2ijh/p1KrVbIYY+1
	 rqC6tgFFSiil4yl28kSDIwcrjRXkROLlTeUIsDsXyFfQuHYPDsk2Wkqy5tilT77BvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174584;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=OqvzTyZPXyzSB1ICTeehLx70j4vNN9GemJRAdZX9HYo=;
	b=YkWxarsQfwke5n7+QKt/xfZE8PBvrs33ALFsdqAyIOPwo5GOmyrpoJIlyqb6iyB7rd1U
	 6R+euYiM2yME+tT+olRHbyLsCFdw5wKTKIwOUGFf4fwdMS5MJ5ynbBmQjQg2ORiv6+2lH
	 dATObkVBart8kzUDS2sgFZCwqBL03ixDA0nC/gucXjp9mFXaoM1Ocspmu8KbEa/ZlYbhe
	 rCp7MAVu1oCyl1cRNzvlz9BBAjEg1UO+aCTTaFF+mFMqJQiwN9yWJ6sWYKeMKu1lJzYIh
	 dhHHeyM1RAKGA2iFM7TSxoygR4M/AGDh7u+bfgbXv6CDNDmfoEQsqeggpqG0TXsTS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nSGxH0Ld;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w0pG3U+B;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F6606A33F;
	Sun,  8 Nov 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nSGxH0Ld;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w0pG3U+B
Date: Sun, 08 Nov 2026 21:49:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174580;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqvzTyZPXyzSB1ICTeehLx70j4vNN9GemJRAdZX9HYo=;
	b=nSGxH0LdT3metJ7Vqu1CfHAZhEzV7sNXbTNKS30d9Tvlpxmn7yAj3wi65iP29PXjVDuHUD
	p4eDsspzR6l/3uyZyXMJ8Zus4fewBzE3XokV6Ak0d0T8MsJdK6smJg1NItGS1kc7zOEm6Y
	31dZpI0XzB7c6muei2oEXV7s4t7pItOPvBn0JIGvCwPldAToAw+lzLgnAEnFUz4v6ZsLYY
	IuwkFbhDVJe8JD4CaQIt8qMQByhK3nJ00LJoMzt7iBhnUS3F1veJi5zYo+zGObTcSmCAcg
	KMH9/mg/0xJ24Q0Bu9dhn32G55fiyPeNWiphsn0WzI9qL3mLg/Xh/cqwyxqDJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174580;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqvzTyZPXyzSB1ICTeehLx70j4vNN9GemJRAdZX9HYo=;
	b=w0pG3U+B8pb3RrCCz60+6pQpYxKSazpWPE96O13JGEoiSWb0Byfh6uSbNWfyUrnKWTlK64
	dWcuxp0k6nKljvBw==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-4-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457856.2093942.2052902008742745714.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     d2803ccf1334b8efbbeef704cc8b6b2a62d42d76
Gitweb:        https://git.kernel.org/tip/d2803ccf1334b8efbbeef704cc8b6b2a62d=
42d76
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:51 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00

irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-4-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 766756e..b9ea1e8 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -272,14 +272,13 @@ out:
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
-	int i;
=20
-	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
+	for (int i =3D 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
=20
-		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
-						 NULL, NULL);
+		irq_set_chained_handler_and_data(irqsteer_data->irq[i], NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
=20
 	irq_domain_remove(irqsteer_data->domain);

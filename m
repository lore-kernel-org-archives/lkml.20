Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215170;
	b=gYvhH5g7Zflbozrzhd10vsCzdmOSpxUEAQcTs4qpKf58vxK8I6RXinE8ORuYEghc8Xz/
	 9oKvLyzc6r2ROqBRi/wC+9RJXOqI+nLbeI+1n2P3nPE1VaxGOqgi0Aha744uGk8xD0NX2
	 kaCo/slUAB0M+zkBZSlAbGMil1aKkth4SYbssJuclJ8lyHBrnfnlPYJyCbg7cHe21ybU/
	 edN9IwZoAPVJaPDw4onHoUqmPFSyOyoKJYzxw1+/E3P2noNJNhxblAMZh8Irs7EKJoTB+
	 anN5dlzAQO1Djmdmwv2Wni2ejk3g/rGxYp54LSwGP7vy9N9wSkIWjirvEToOJK7RJQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215170;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=QdE9VKHadU4KuSsBJN586hraHFnuUlVn9JGVVGR3Saw=;
	b=j3XPw4O5zopXwh08ViHT04ZppmmI4u3pT6wQvd2ylSB7ApKXqrtUK96FqlbL2V7ktJik
	 RWvFyockFm8Bgrs6KSjtY2ENsmI14xjV/jdmvHSK1xwDXDo7RpsbF0XK6pS1o4IuoX+En
	 M9WVJcvSJOpVdE+afRlp77PGgTAPsdc+pyyT9HHl9yaXoe7hRFm67dekfCp8uf75Gi5D8
	 9JLP5RBaCS3vo/nZEPrjarjPUP7UeMK4/PQmg7BIvwAGlA4pQ2J4+2jIFHqVVKFtsCD/I
	 VExSqXlJFwrIXDF/iMUXSjo61cVn/SKt7ljahDY05d4ZVJh22hN5Jgq+5EuG9UOYChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oZOp+CTr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NlgbLrBy;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FAF606A32A;
	Mon,  9 Nov 2026 09:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FAF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oZOp+CTr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NlgbLrBy
Date: Mon, 09 Nov 2026 09:06:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215168;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdE9VKHadU4KuSsBJN586hraHFnuUlVn9JGVVGR3Saw=;
	b=oZOp+CTr5SRC35/tWcMH77gLjrtriS9AzCp+HToqZmhZcsZ8qkpK/s3trEG73xRXjLLppj
	QxfF5zoI7ajX0SNAUvOVYloalvURbhLhyOEhSSgDXla4FLyyxZQucxlpPQ/GdRM3K7jmTt
	PtsFlx6SnSZUihAyeX+dFieoLO4hYE1nTuxYLpMuvopBDo8HCSgLIlg0JxigegEiC9f4/0
	N7EIrs8ALRhZ8w6t9lUfiloXI5dTTX12idxuIOLqIH7bYAwugpZZYO/USdkjjmY4K/N0El
	Br26SW9cxmWYQ+UjDxLFwsiitrEuyXv8AZk7ybmFZSvKSVkOCwue7vE7ICN9Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215168;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdE9VKHadU4KuSsBJN586hraHFnuUlVn9JGVVGR3Saw=;
	b=NlgbLrByMY5qKizr6RrgmcwUfWVqqVm7WS6niRqFM8drcW9mj92n00KwqUCXGVfqDYSwNk
	hFfGZIphr1lFzaCA==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Dispose of child IRQ
 mappings in remove()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421516643.2093942.2245800377438345093.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     d25b6b2dd79fdc0600a93905d3455c613859c43f
Gitweb:        https://git.kernel.org/tip/d25b6b2dd79fdc0600a93905d3455c61385=
9c43f
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:56 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:08 +01:00

irqchip/imx-irqsteer: Dispose of child IRQ mappings in remove()

Once the driver can be unloaded, the IRQ domain mappings handed out to
downstream consumers must be released on remove(), otherwise:

 - a parent interrupt racing with the teardown can run the chained
   handler while irqsteer_data is freed (no synchronize_irq());
 - downstream irq_descs keep dangling chip pointers into the unloaded
   module.

Dispose of every child hwirq mapping in remove(). irq_dispose_mapping()
calls irq_domain_disassociate(), which runs synchronize_irq() and frees
the descriptor, closing both races.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-9-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 9e8e660..ac26c9a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -292,6 +292,9 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
=20
+	for (unsigned int hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
+
 	irq_domain_remove(irqsteer_data->domain);
=20
 	if (ret >=3D 0)

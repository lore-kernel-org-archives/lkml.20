Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215167;
	b=MWJdtZKEXQlEvumWagNVofFGOqLvwTB9KgIFPVtH6uuT1kgO77ucyC1nV1vWJDybI8GJ
	 A2WkK8hfvjhZR3F6e0M3wYTGg6AqULcP22OohYpwyoTZ03YVTqJGMDnowuuXSkPZ1Itql
	 MCEv38IraoHOUbRUN+drJG0+lX6qVHWEb0Is0j1xNPHHQ80qUTn14vtT49NJ4miIdrSH7
	 X9Tlb6itLtp6/Lcm67ODV3fCbYp/tJBjkCR+trnU//v5BY0H0qGquO+ZM9M59EkoxF3CD
	 a65EN58/KTU/YbUQW7jTlbnHaF+RmoTqiKjGS/TNHO4EOIYzRMkKLqN/TRzXFmOUEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215167;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=yJ347e7OZ9U5IJTnYATRCLylvlhWQvFHxWFrhjX43gQ=;
	b=Hww3Fsd1lfgkpHUXQcNf2TEBFVbgUgviBa2WO7GG0ThmTdL4t24aUCFNcmRcq777q7is
	 5yvIBL7iJJ87kCDmnr5qdY5jR4cZUklvgpkkCzw4T7NEPQzUNDs+ToINKGm1lWk2NPzbn
	 6Z123vzTr39DQJmUKfcxd839JFqApDzlwd7wpc9AorBMg0zlAsiXKa93v4rNL4rzXhaQX
	 6ur0mV96VIWZmyTvfKqCJ6YsOhohRk8C5QIw0YJSd6jA6RB7/PpFk8XuNxbXO5429Z98J
	 7ZlcruoQiJDbdSv5WcwLBaZlZnTAetF5xD37ymh3YCZsjDipZAuxZYq3nlwqBL/Qz9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cJrtzzNF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x+ZrofFv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDEF606A31C;
	Mon,  9 Nov 2026 09:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cJrtzzNF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x+ZrofFv
Date: Mon, 09 Nov 2026 09:06:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ347e7OZ9U5IJTnYATRCLylvlhWQvFHxWFrhjX43gQ=;
	b=cJrtzzNFabmvf5eVYEvNoU/w7uSCwdfPQ9Jb/5Of3kJ7OHMm8kYzhe1Aog37H0mvzUkvhZ
	cX6gIAT8c81qALixOE2KwK37Xlan6L8qOHIyd8s9oi4UXYqPzAJ7Ztag9Y59WAWUDDx5ok
	5wYmwYNifdMW4YWTk/rTWYpUC4L4GlcqKR7XMOVSX2FeHr/p91zRxOUAoYtlqZwrwTGAZM
	0Vfvv2n1Jhrl60RiCk42XutEEa8SUQymfkUsVmGJCXNUO1WVrGw4mPcChrwWzks2drScjB
	ueCMo49AuhoWtvCALLMoMP4FqKjIK+N+IVkNIoeqGwB/pJnXN3mU4fokwOmrGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ347e7OZ9U5IJTnYATRCLylvlhWQvFHxWFrhjX43gQ=;
	b=x+ZrofFv/RQ0v53O/yIVAdI9bSvffekAqGUlfeT8+86fzlncJWRAwz9wjRYl7mW3mzb+Qs
	KAExjgHIShj46SCg==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421516293.2093942.12839909335813611313.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     782293846e3b6a2b431057a2bc47263db6162333
Gitweb:        https://git.kernel.org/tip/782293846e3b6a2b431057a2bc47263db61=
62333
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:58 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:08 +01:00

irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

Replace irq_domain_create_linear() with the new
devm_irq_domain_create_linear() helper, so the IRQ domain is released
automatically on unbind and remove() no longer has to call
irq_domain_remove(). No functional change.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-11-Zhipeng.wang_1@oss.nx=
p.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index ac26c9a..e5a579c 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -248,8 +248,9 @@ static int imx_irqsteer_probe(struct platform_device *pde=
v)
 	if (ret)
 		return ret;
=20
-	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg=
_num * 32,
-						&imx_irqsteer_domain_ops, data);
+	data->domain =3D devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev=
->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -295,8 +296,6 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
 	for (unsigned int hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
=20
-	irq_domain_remove(irqsteer_data->domain);
-
 	if (ret >=3D 0)
 		pm_runtime_put_noidle(&pdev->dev);
 }

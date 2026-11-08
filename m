Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174582;
	b=Hdrw2C2EpGWx39Fl4SnULr++qDOfptPyC1Rwsk8C7HCO0kxG4efYxDaOnjNmOBB0/FRO
	 cF0ULAaEHtIpBM/ncr/SX1GHkl9gWCnS2iNFSWFMVeTeCtaWkMESnRDbSTswQgM4ScIn5
	 IY8XbtMDclbqQUAXyaGEV+c6nnJRQjedvamUC4a6vLTmT49OrMn+9ZuQxtrSXReRdRHOT
	 ejmxabVgliz2JfbUxI6vVFA6lKsZF0NvKPzo7DQ7lzswW4mGGzhi0Jue7vPE4OnSpe1z7
	 3v65pz9OM10cHwOd8EhOVg/BLjOZrYtf03c4Qsg+mwg+TbWGukGoizfX5KVovmYmx9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174582;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=tUAv7JN7en/U+lrJ/s9HjMUlJtaJD6Xx2DVWbeuFjhk=;
	b=cpsJ9T+T85exGfPSG1SqNGq5+wtDqc3nx13HKWr+XxcBTE+LIMHX2mFLFqUJGkUlS/Bh
	 ZNiw/IdNM5WLgnIvfn93f0qUoVQQ0/JH+7pF7/Ffiz3qetPS2rYPbGGuLdBpqOj9nN0sw
	 cxa9dQdZr3VzN8bOnnAW8IFryaLxAVMMFIViw6ZbXi+Ann4l0ukFRvbX1dhJbdWi9JIhD
	 cUwbFdaU+DiI9UDP40HED7RFbAR9ttWth3PXnnHNTzv0K9ohg/B4fPdDKiYF7NqMyAxex
	 dmNSSn1rlBngXEh5DswuIwcjdRC9LqoNbt/JzR03QkJxdkxcq4Daa3af7x2+pZHaNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FvOSqhql;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="AZ6t/8+D";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29561606D80D;
	Sun,  8 Nov 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29561606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FvOSqhql;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AZ6t/8+D
Date: Sun, 08 Nov 2026 21:49:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174578;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUAv7JN7en/U+lrJ/s9HjMUlJtaJD6Xx2DVWbeuFjhk=;
	b=FvOSqhql6i+7TBSfO3BH15bNWtsd+1jtxPILWT/eaSpwr2jhDww/HmkcNLB3AQIPQJj2em
	ZU5gUXpdQ99kOhll5z/V+wYbCbTQa90nN33CEy5kMe95L0c2/OCDnhUzwolrb+frayYK9g
	IUmPkJO5Uvo7vWOHxaMiFfeGfAxeM44jhm7Ety+fshWII5W9MSX6K2dqbvIOAYXHemXVYT
	2OgNieFR3+i8mRymx2qViUoHfPE6EgGxO+NVq/1KjWyfavs7U6LFYN20d+2XsL1CEvE7RQ
	7rqacUHF+QDSUEg/D79WH7CKC09iGpu/EwvR+iQ20deBrTCalLNdnbpO0WTf3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174578;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUAv7JN7en/U+lrJ/s9HjMUlJtaJD6Xx2DVWbeuFjhk=;
	b=AZ6t/8+DE/UVv7Q9K49529gHCnOlJ9+5+vzl/KsvytaQUYyq+SdHdXEIIqbxsGuGweGV9q
	DnobPSnze01/UeAQ==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Cc: Fabio Estevam <festevam@nabladev.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457707.2093942.7891342208189600663.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     95cb660c28dcecf55b18dd185f5bbd3c185d5acb
Gitweb:        https://git.kernel.org/tip/95cb660c28dcecf55b18dd185f5bbd3c185=
d5acb
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:52 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00

irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()

imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
imx_irqsteer_remove() never disables it. Runtime PM therefore stays
enabled after the device is unbound, and rebinding it triggers:

  Unbalanced pm_runtime_enable!

Use devm_pm_runtime_set_active_enabled() so the driver core marks the
device active (matching the enabled clock) and disables runtime PM again
on unbind, keeping the enable balanced across unbind/rebind.

This becomes reachable once the driver can be unbound and reloaded, but
the imbalance already exists today on unbind, so fix it separately with
a Fixes tag for stable.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Suggested-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20261104073759.386777-5-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index b9ea1e8..9bf739a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,12 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
=20
+	platform_set_drvdata(pdev, data);
+
+	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto out;
+
 	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg=
_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -258,11 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 						 data);
 	}
=20
-	platform_set_drvdata(pdev, data);
-
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
@@ -283,7 +284,8 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
=20
 	irq_domain_remove(irqsteer_data->domain);
=20
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
=20
 #ifdef CONFIG_PM

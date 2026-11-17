Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888816;
	b=nJ5OOAERu3D64t03QIEk3LEhnxiGHE8/SMNaszZKd3b7Zm1px8ctnEOuD3Ryd0adhYou
	 T9WaavHQVHdDmYJXIb6tch3utB+0HTNO9RrTvukUkt7p1aH7JsN+4z8JbQM0f+dV2Ib6l
	 m8eOTKSqz9jJNGdV3zKzo92qt9gBzPptlM55ALbNQEZGqyNipLIPMXRGEQoOqsaUVIlzY
	 NsJ0k1WGlKNGJl3yw2fejXsLZOk/pas2oY+mz21eoJHfF82F94/liMTU8zA08L8OS+g39
	 YA9qi4PzKyLc6xt8QJ7TiS+7RW9Ax6dN0KlYlY6QFoPNZydPter7D3VmK+jDcGww2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888816;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=D2NcTC6IhhXI+R5MoMuSGa9Fx9HFLbnNfCZJcZcVW44=;
	b=hIuF/1vtjWfMsCvlUMyMI6qmIHBya8okdVv6N3zShWhUE/i6sWp1E4IMz6+rr50+7oFv
	 lVQ20NSZWoUA158uYnB+8+dnV1raSAuJx0x/Sx35hvXPczJ49fJbwZr2uJd1IV/2GZHIK
	 O9sTw1wkFAIUWdCxivmqzwZp5+SdFrX12bTbbbxgNfKtQ0q8rTAfWrBAarthF7mCX2dWi
	 +8dWkOH+hdE0DJWFHfCcDNawaPOj7p02X9/hFmWgePFYPai4eK2yxotziWZT6qJjh0886
	 dmjd2pNf2b4nlAClEQGGEa2HPaLAhzfVoPifcdboJMz9M47UuvfYH/rcP8/VMy82X8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Lq2WP/3C";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lq2WP/3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=D2NcTC6IhhXI+R5MoMuSGa9Fx9HFLbnNfCZJcZcVW44=;
	b=Lq2WP/3Cwjt/TVO9PaffWjoUsCMnSPXBrq/NhcNfkOd7TJBkn5NFYAMUDRGZY7
	PwCvDWyF0SxzD0rJhAf9ug1yA0gAmsrlDz75hFVGUR+zYPl0GUVSAfQOjctlyypd
	soJ+r7zX2/Bp8mtieTOea073XT96hfEQiJat90jldqWwE=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3HxVZ1PtqHveJIA--.26682S4;
	Tue, 17 Nov 2026 12:13:17 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] misc: hi6421v600-irq: dispose the IRQ domain on remove and
 probe failure
Date: Tue, 17 Nov 2026 12:13:16 +0800
Message-ID: <20261117121316.528922-1-shxzhaosr@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:_____wD3HxVZ1PtqHveJIA--.26682S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDCr43ur4rZw1UAFyUtrb_yoW5JF45pF
	WrWFWrCrW8Ja42qrW3Jw1UZFn8Jw4xXay29ry3Kwn3A3W5ZrWvqa93KFyYyFW3uFy0qay3
	ArW8Ja97CFZ8XFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j45lbUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7h3lJGr71F1grAAA3m

hi6421v600_irq_probe() creates a non-managed IRQ domain with
irq_domain_create_simple() and populates it with irq_create_mapping(),
but the driver has no .remove callback, so unbinding leaks the domain
and its mappings.

The same leak happens when irq_create_mapping() or
devm_request_threaded_irq() fails, because driver remove does not run
after a failed probe.

Share one disposal helper between a new remove callback and the probe
error path.  The remaining resources are devm managed and are freed
automatically.

Fixes: bb3b6552a5b0 ("staging: hikey9xx: split hi6421v600 irq into a separate driver")
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 drivers/misc/hi6421v600-irq.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 7d2eb7e..e44141d 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -211,6 +211,17 @@ static void hi6421v600_irq_init(struct hi6421v600_irq *priv)
 	}
 }
 
+static void hi6421v600_irq_dispose_domain(struct hi6421v600_irq *priv)
+{
+	int i;
+
+	for (i = 0; i < PMIC_IRQ_LIST_MAX; i++) {
+		if (priv->irqs[i])
+			irq_dispose_mapping(priv->irqs[i]);
+	}
+	irq_domain_remove(priv->domain);
+}
+
 static int hi6421v600_irq_probe(struct platform_device *pdev)
 {
 	struct device *pmic_dev = pdev->dev.parent;
@@ -264,7 +275,8 @@ static int hi6421v600_irq_probe(struct platform_device *pdev)
 		virq = irq_create_mapping(priv->domain, i);
 		if (!virq) {
 			dev_err(dev, "Failed to map H/W IRQ\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_dispose;
 		}
 		priv->irqs[i] = virq;
 	}
@@ -275,9 +287,18 @@ static int hi6421v600_irq_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
 					"pmic", priv);
 	if (ret < 0)
-		return ret;
+		goto err_dispose;
 
 	return 0;
+
+err_dispose:
+	hi6421v600_irq_dispose_domain(priv);
+	return ret;
+}
+
+static void hi6421v600_irq_remove(struct platform_device *pdev)
+{
+	hi6421v600_irq_dispose_domain(platform_get_drvdata(pdev));
 }
 
 static const struct platform_device_id hi6421v600_irq_table[] = {
@@ -292,6 +313,7 @@ static struct platform_driver hi6421v600_irq_driver = {
 		.name = "hi6421v600-irq",
 	},
 	.probe	= hi6421v600_irq_probe,
+	.remove	= hi6421v600_irq_remove,
 };
 module_platform_driver(hi6421v600_irq_driver);
 


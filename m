Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899672;
	b=lrnDfe16rqtmDiAzXIqKWRWNnO8n5jJ0atX3c3iGf8dn+pLzyMWPXxKS3yrBqa8dSEPs
	 lye77lNgO7QBj8HE6G3PyjM1LeRDGI+7x9Kxd0LGFc9BheAwz2vNAMSRnxIPTOGOWmTMc
	 qIhaCiEE80f43zfGyJO2vPLTil0QBMO3kttKEuQkeKMM0LjvuTbLSi03GG5xlzWBC21AI
	 bOuMGmmcspe9qlHbb4L/2hRGwK85I1DASn6bKQK7N0rh4oS8VtnUvCNEI5kbpOKFtIoXV
	 qIJGZvFqmG9vD2sQcxFOeNgU/aqXGdxJx9HCoovD+eabxbV6pwXtH9F9A1X4oDBS4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899672;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=M/WdrMEavsqH0hS/EUDB3nkK/xjCmst2SoRbgl+9Ebc=;
	b=diYVOA9ZTKdYnYzWS43tcU7Hj64Wf3kHronnNeo5VL4cYQRHcy8SUv3oJ9XO9P6lf70o
	 LCH+ywamO/EwWrGnt/1rB0lZxy8LSVJkXI2EfuvXX7WvvXDWQn5+00uWPn11BqE3UqysK
	 5+ggGPncjdrf4/ogbeR00H1RBiG5Tgh36rgBark99jU6Au4q/SnmavnUJOoB6L5pu4s1H
	 QT9AGtZDqTzvhgLOp4yVBoP8542BhdY6mhsmHFH7DGZLLSamiFTY6urCElFIhqIaCsJBZ
	 IwprOgGUPtO6Frh97RBRPZp8MJmMFx65RHVzvFYvPZfHDpZgVpaKP1FfI0jwYBzfNcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CfRKj918;
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CfRKj918
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zwbhnDtt3vpTEzSOmj+MMGszUoWlFbw/XBu9eV7HxV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899669; v=1; x=1795504469;
 b=CfRKj918Dz9PvQ0E8PYSnikHSmKszbQ3SAZ1UnYFSk3DczxTn14ZalGZ8QTp/VXhz5xrkszm
 PKZEzXd59g5WEILHVb8rXCP1oa4/hD4XDQFuDjSVd9iDjttJUl/oxktjBYEVrNuqLkzp1907Bmc
 Dy7anJSVtIQjCm1hwBCFtmGs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4256e9d7da406d0d;
	Tue, 17 Nov 2026 07:14:29 +0000
X-Mizu-Trace-ID: 4256e9d7da406d0d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:06 +0800
Subject: [PATCH 2/8] irqchip/imx-intmux: Dispose IRQ mappings on remove
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-2-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The driver removes its IRQ domains without disposing the mappings
created for their 32 input lines, and it never releases the parent
IRQ mappings obtained with irq_of_parse_and_map(). Removing a domain
while mappings are still present leaves those descriptors pointing at
a freed domain, and the parent mappings leak on every unbind.

Unchain each output interrupt, dispose the child mappings and the
parent mapping, and only then remove the domain.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index a9eda7646e2f..644282228f1a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -312,8 +312,11 @@ static void imx_intmux_remove(struct platform_device *pdev)
 			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
-
+		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
+							     hwirq));
 		irq_domain_remove(data->irqchip_data[i].domain);
+		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 
 	pm_runtime_disable(&pdev->dev);

-- 
2.56.0


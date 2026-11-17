Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899690;
	b=xnNIi5f22+rw5QUxJ4fFvLFcXJydJh5abCHvf2RmEPU11N7eKpD86BhCVpMX60sdqeUG
	 4OEJXGzV6PGF1V08WZFXL88/o9ImsRPRkspuk8pIsBEqlcenN+z5pOMTHym0fWtqRKgsu
	 4HLqnHUM+LqWHISslzWwK/s+n2ecIraiEnIborpeFOLWE+yhz1Pww4T+CpvswH0sPNbjQ
	 NzkxKAkmhxVWfuVza0wn9MqK99jfLkA/NEakSty9QyW/L5UdhM96Y0kPr4rj0ujZqMi0w
	 45J3NJYzHGSgd5BwQvc30UbLJWEDT6i1sjNPegn1wVmpzAf0bc7fDhldODwCakHVYYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=vIeF9vrR2DgyA1S6iCBievDYCjb9lO6NZyShcWqBnb8=;
	b=ovMXEEhFlJGqzdLYH/VvzI86qLko4So4B00Wycnn90aqla9v6op5GlM2y14q3dNfIbfK
	 /YU1E9uf7pFn01QiSCyuyIxL5cClw7CPWapBpTiBbfGOMszj4BPljuzMZEyO/v7W0OJ/E
	 RE96BEjzYmMQnAk/4w8OQ16qW0Xe4pwSqoo5jmRdcECEpJWM+wZpUfKmYzu8slerd61Ve
	 U17XWY+d+Zk8V0ge63NnzWTBwubSA9/spnb2OOqRU/B9QGKjOsoJfr/TSa3C47wApu1FO
	 kyJPxkFMMATSmU7/HlX79EhmtHdOie8ztKqG8duaUMDw9MZlmHj+6SpiQAdKLhgtdpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fzWKQmAo;
	arc=none smtp.remote-ip=91.218.175.161
Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FDD606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FDD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fzWKQmAo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H8cqCHYI9Gmfe1/SCs9KFv5NYlTFBza+OEuLdfK12EQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899687; v=1; x=1795504487;
 b=fzWKQmAoJFh/AMJTMqk0ygTTQTLXH8EXUYcD+jdX8vDL3VeOpjlvbxWTRXjK9wsv0NnmhMR2
 qwls7A00L1wirVr1Iw9AkXud60Wrk67payq7oQdjE39jPzq3jCnMcdmEnseiJnItPKaIiTdA1fn
 CbpPG+0LHheLSgbGChxozfSg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99571a1b9b522972;
	Tue, 17 Nov 2026 07:14:47 +0000
X-Mizu-Trace-ID: 99571a1b9b522972
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:08 +0800
Subject: [PATCH 4/8] irqchip/imx-intmux: Don't WARN on malformed interrupt
 specifiers
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
Message-Id: <20261117-imx-intmux-v1-4-189e7e0ad98d@nxp.com>
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

The xlate callback validates the interrupt specifier cells, but uses
WARN_ON() for checks that can be triggered by user-supplied device tree
data. A malformed specifier is an expected, recoverable error, so the
WARN only floods the log.

Return -EINVAL without the splat.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index c7b6b475bfb9..31fd895f477b 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -144,10 +144,10 @@ static int imx_intmux_irq_xlate(struct irq_domain *d, struct device_node *node,
 	 * the 1st cell: hw interrupt number
 	 * the 2nd cell: channel index
 	 */
-	if (WARN_ON(intsize != 2))
+	if (intsize != 2)
 		return -EINVAL;
 
-	if (WARN_ON(intspec[1] >= data->channum))
+	if (intspec[1] >= data->channum)
 		return -EINVAL;
 
 	*out_hwirq = intspec[0];

-- 
2.56.0


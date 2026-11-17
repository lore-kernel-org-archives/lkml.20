Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899695;
	b=xml94OImgdB1FM2OByNaOKUvhcLquCc1HjDj6uuxyXeeoezGnME5ZZx5AB6WOqKD1F78
	 OlCW85bTLjo6vdj3WhH0Arz9T6SXrCCdR9vOiSh6a+1SDYefZ6EKvo8Bayf5gsWbeJ05l
	 Sh8Fz9z+/zrzgXsQaQpUmI22I46OiLTwppCzDeZOxo/V3i+czPzsYrhd+E+M0mj9LOMa9
	 meNrisaL8oq2gb43chIXfWWgzS3btLlVTmQu6r5WvFAuh1D75DGlSdD4CTjlsM7/Go3cl
	 yml7Ro2VW2T4OujiUohce3zUoTRg2YnffYAbEi5CdMBTN1e1je8c7t5tU46rcXksVlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899695;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=7i5qcP5sxivInnRUrN+Klf/63NaDFtusfexk9BVAIbk=;
	b=QbD5upiP1YYM293DEeKrozVQ1l9uLzoS6KNRXTa+Iyi1VCCB0s3rmMhef4XdhM/V4V6p
	 142ZwCyGvZNWSmLrajdAYJ0KQWLQ76WdzgjsJJLfivdWQpE/yPDciIfmYgK5OZshsWsmH
	 0tnPC61k/IYV9emekdIr3qQeYwceUqglbDuOyTKz+LsJYe5dFrp+rg3V2pcDVmSXN5mnu
	 IsBAQHdIhgPOyoEhTNWs2/O7Cqg2vQOATx2qPzo7DjCG0vnmiaxEIujZLsBWtQb5aLdll
	 indUMj5Og12UshADA6C9DLCFC/z+IW54an+mOWJJ2xcsNiLXRfHFDEhrJOu9uEiYjzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JmX8pIhr;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B425E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JmX8pIhr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=grnlVM8NPzNbFsIqKfom85HvWWMDds8Zcuvnsl0twCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899692; v=1; x=1795504492;
 b=JmX8pIhrwPheQ+nQ+Tes13ezhkwtqRBYWSivI5fv4q7gwA1VhkzZQSBm9uXr4TUs+GDuuf2G
 6M/dlwnqszO7QXpQqVjtB/8N/qk1XgBFwjDZRlEXNcnf/auCSPRoR+B1mApN+i651Jaz9lkmbXj
 bHI5mRziYCTFGPLqtDpJwraw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a95767629e953e9f;
	Tue, 17 Nov 2026 07:14:52 +0000
X-Mizu-Trace-ID: a95767629e953e9f
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:09 +0800
Subject: [PATCH 5/8] irqchip/imx-intmux: Mark input interrupts as
 level-triggered
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
Message-Id: <20261117-imx-intmux-v1-5-189e7e0ad98d@nxp.com>
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

The child interrupts are handled by handle_level_irq() and xlate()
advertises IRQ_TYPE_LEVEL_HIGH, but the descriptors are not marked
IRQ_LEVEL. Apart from the inconsistency, the flag feeds IRQD_LEVEL,
which makes check_irq_resend() skip replaying level interrupts.

Set IRQ_LEVEL in the map callback.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 31fd895f477b..ebfff621e5a9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -124,6 +124,7 @@ static int imx_intmux_irq_map(struct irq_domain *h, unsigned int irq,
 {
 	struct intmux_irqchip_data *data = h->host_data;
 
+	irq_set_status_flags(irq, IRQ_LEVEL);
 	irq_set_chip_data(irq, data);
 	irq_set_chip_and_handler(irq, &imx_intmux_irq_chip, handle_level_irq);
 

-- 
2.56.0


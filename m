Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899681;
	b=dePyo8h1i3KkNZDoQIy/8v74Fg8vBn3BY0V8AhUvMb5Rj+tu6aPE6vAcnuvdLvvwQ7m5
	 0I3FVd02xkYtlPRFmaZW51vaxjkZXjXm1puFNe9JkR11l/b73lCLKsoXMXPCS6wFHAqrx
	 Z7D81s7tlK4b1LfyRHdMOE3LwGvyz7EvrXLy4iy6hdnn3RSVWrT/VWy+b0bL7+pN/8efF
	 ByhXvJhvICrk2KqwxUNPlC08NEDyAOvitvNWwaGlIqIwYEj+ZOoJn1Gu9fxQ37SAYafGb
	 a7Ge0T7iDAZMyXkfJ+q3mit5vzxm5q6JXilYd/udchXkQZk1LooPxxDOMZ3yKraysaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899681;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=/uMuPe5mgi1Eu4yEWFJYCwVsaSE/AArChxvbCEr7Peg=;
	b=ye5COWxoTSoP45V62MBX6HGZGbIrAhCnJ1ynQ4JcEyWqcOE2suZC8JrlXaJyUzwtGoRY
	 WnRAkkZSp1WO+f6ZvMQ6/Ore/sKF1Ec+pC34q0HHUOuz3mRmgttm1zBHgxgV4L5iElarp
	 cgEBwFW/HTPxqmUJdhmAMwFNWa0oF3Aercrtmvas8PoXqvPGqTRHQsnsxik2ZKYh/RjQy
	 vJwPbeLo9z2SvCrLnD/DK1+imFKB1KtYbB1B4tzR/JOk3kwv+b7FSVnNh4gS1ODIys2ik
	 vufeUy+HyTnpEDRK5XdXu+ZFt1b8M/CTWxLCozzKg0zS4FaadYWVdpyeONgdL+V4qYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RH5qvwVa;
	arc=none smtp.remote-ip=95.215.58.71
Received: from mta1.migadu.com (out-71.mta1.migadu.com [95.215.58.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RH5qvwVa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IR9VcHeYSsHfv5ifLvABSgrY6uC1+UTctHpRZU8BkOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899678; v=1; x=1795504478;
 b=RH5qvwVa96F/+auHiHXI1EJA1N/dFmngsMV3MqYOX3sqouaIrnXCI+ZMJGzg/ULlCQhgOBFQ
 SPKQKDmOHFckjHysxuEC7o39+TnGJBNmsOV2NSEBPfVXQ/TGRWxTV8eTPwYQg/WrpgyvJegeIm1
 DHTrvH6WaYuAzT6EwLQ7J+rQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e5d159210048f24;
	Tue, 17 Nov 2026 07:14:38 +0000
X-Mizu-Trace-ID: 0e5d159210048f24
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:07 +0800
Subject: [PATCH 3/8] irqchip/imx-intmux: Handle platform_irq_count() errors
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
Message-Id: <20261117-imx-intmux-v1-3-189e7e0ad98d@nxp.com>
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

platform_irq_count() returns a negative errno on failure, but the driver
only special-cased -EPROBE_DEFER. For any other negative value probe
continued with a negative channel count and passed it to
devm_kzalloc_flex(), which is broken.

Propagate every negative return value and also reject a zero channel
count, which would otherwise register a controller without any channels.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 644282228f1a..c7b6b475bfb9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -207,11 +207,11 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	int i, ret;
 
 	channum = platform_irq_count(pdev);
-	if (channum == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (channum > CHAN_MAX_NUM) {
-		dev_err(&pdev->dev, "supports up to %d multiplex channels\n",
-			CHAN_MAX_NUM);
+	if (channum < 0)
+		return channum;
+	if (!channum || channum > CHAN_MAX_NUM) {
+		dev_err(&pdev->dev, "invalid number of channels: %d\n",
+			channum);
 		return -EINVAL;
 	}
 

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960481;
	b=1p2zEe/WR8OATMCRw6WEXY7R6Jr9dpFM57jA/X1u4nKnzx/r8uX3xWMIAT7jwdNw232F
	 XetwFR2m+9HCl9lKK4PClQWLghHzUdtUjrKEZ/M9rWzjFumEXLpuCQfBtlinG8pM/Ojs7
	 wAG0HZobP8FHa162xC2ltJF7w65CgwBAjLPdKcrWiJbf4ScUHCpLHukqnw2p6mRRvYUdO
	 /nFV46ntjSb4U9YoOnuFFgFzqjb5MtAMNDCvGNuDdkDSSJ6xt7zBpPAcYLwnyZMsb0jYN
	 q5CL3jX282R0vKxXjaVHmE4f1ovRwyQReZt1NofE7N1D5b8AIao7c4/23XwKRcW8kBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960481;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=gJc6Vw+f+t179NkK673wH0DPl0vWcqe86Z5EpJ6b2Pg=;
	b=CeZaMqCsT/QoGe+w9Psxv8hSxwpq/iFNwEF8qJ36Gx3tQNBECW4fwqKxhtHBYjphtRMk
	 JK5/uyTplORYJjH8W2CUBfQs7GNHg67HOZ6lqv2CbADQTC1PREXVIE6s7DFB79p5H5KW8
	 kPl3wOgI1hpA9r1yvFYIICbQFhgftePMvJYEtvv0K4jugMZYIbBc4QnabUNqGPtd5v1jI
	 wpkdrwlRaPgU62LCooWb7ifnGz6ZEIQyfmjiQJGxQ/Eb3WTpenF64zy2D6vl1/Tp0qC4o
	 LpAhTqqu0VNCGmVd0AISTl9ABl1gfjx44OhL6UaMD6jWOk1EdbJydFrUUV7drNBYpBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=H4gaF3kq;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35381606A326;
	Fri,  6 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35381606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=H4gaF3kq
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AL6f81868854
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:21:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AL6f81868854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960470;
	bh=gJc6Vw+f+t179NkK673wH0DPl0vWcqe86Z5EpJ6b2Pg=;
	h=From:To:Cc:Subject:Date;
	b=H4gaF3kqEW31uWchGw9J23gcpiLOH9aisl4OpFNaa48GupXaE21ApN4y4llIUU3YO
	 2hU31zTGvikSXV01/u5dv1sFeSDZQgdOLK06Y7LSX5Ovzorn/rOunt2D8ov4gBZ33i
	 tHbLls+gUAq32350bm0y8xzRNDbqK8zHhEULtyL4=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Fri,  6 Nov 2026 11:21:05 +0100
Message-ID: <20261106102105.47244-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The CEC core calls .adap_log_addr() before .adap_enable(), so the first
register access can happen while the controller is still in power-off
mode (CEC_GEN_CNTL clock field 0). The probe only pulses the reset bit,
leaves the clock field at zero, and does so only after the adapter has
been registered, when the core may already be using it.

On S4 an access to the powered-off controller never completes: it
stalls the AO bus and hard-hangs the SoC. This triggers on every HDMI
unplug, because that invalidates the physical address and makes the
core rewrite the logical address.

Reset the controller and leave its clock running before the adapter is
registered, as .adap_enable() would.

Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controller driver")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Changes in v2:
- Set up the controller before cec_notifier_cec_adap_register() and
  cec_register_adapter(), not after: once registered, the core may call
  .adap_log_addr() straight away (reported by the Sashiko AI review).
- Link to v1: https://lore.kernel.org/r/20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 drivers/media/cec/platform/meson/ao-cec.c | 26 +++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 2df0d3743077..4c03c829fe86 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -660,6 +660,28 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	device_reset_optional(&pdev->dev);
 
+	/*
+	 * Setup Hardware, before the adapter is registered: from then on the
+	 * CEC core may call .adap_log_addr() at any time.
+	 *
+	 * Leave the controller with its gated clock running. The CEC core
+	 * calls .adap_log_addr() before it ever calls .adap_enable(), so the
+	 * first register access happens while the block would otherwise still
+	 * be in power-off mode (CEC_GEN_CNTL clk field == 0). On Amlogic S4
+	 * that access never completes: it stalls the AO bus and hard-hangs the
+	 * SoC - every CPU stops, IRQs included - which happens on every HDMI
+	 * hot-unplug, because that is what invalidates the CEC physical
+	 * address.
+	 */
+	writel_relaxed(CEC_GEN_CNTL_RESET |
+		       FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
+				  CEC_GEN_CNTL_CLK_ENABLE),
+		       ao_cec->base + CEC_GEN_CNTL_REG);
+	fsleep(100);
+	writel_relaxed(FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
+				  CEC_GEN_CNTL_CLK_ENABLE),
+		       ao_cec->base + CEC_GEN_CNTL_REG);
+
 	ao_cec->pdev = pdev;
 	platform_set_drvdata(pdev, ao_cec);
 
@@ -674,10 +696,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
-	/* Setup Hardware */
-	writel_relaxed(CEC_GEN_CNTL_RESET,
-		       ao_cec->base + CEC_GEN_CNTL_REG);
-
 	return 0;
 
 out_probe_notify:

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


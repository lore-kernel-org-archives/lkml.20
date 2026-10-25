Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956065;
	b=1pnyhT8xLsIY4UjjKy5JyOirWGdfzpxvxRIR5BbFtRc9fhXSdvF3RSmu2bSFcvw9FjzI
	 Vd23jFhx5wCSma4DhYCtyJNMdvEOLvFsJSih2Ta8/q1UJBexAlW1OGMwv2jhwIAekEQC3
	 sn4yWUEFvsbh4kHARRnXUYyS1hjSYWYia0IiBhBnBn6kF0UBgJuwziIwlPEzB5lCDghhq
	 9SB+5havp+r81A1Sz/7Nw7zS+TkyptlC1xM+uxn1IrcmEQLF/MXAG8U2afE9a5J4EiwUq
	 5qLhnRM5Q+usnxTOUFJX7nJXoOT3BeP5w2uwZROHYsvHSys2bHYepL5Mz4t+v972Wcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956065;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=75Y6P3mxr5SFh4Kr/TaY5+EyHwuhs2vmH3vTMgy6sd0=;
	b=rC49XdqBnVgQJO3BzB6OiOFvo4V7ncjEvq7lugsRsESvDMIH5HHLKrgdN5sLH/DH0tEW
	 4+ESgtoBy9NsdYM0JZb1wecCntW703WZTqr0H+iJsrKb7DbaDIMEAfsSJnvzu0chtOl/O
	 ABKLoFc9b3LhQd6aZcM0b/fyaTC49tiT3QrNM4VE5+1Z0gHMpwlzJd1xNSjOFVf8RAFBv
	 v2HBFqXTcDzmvvW5vHCk3WM+fD0JQfRcVaBhpUz+1WutxUqN//ow9J99OXRMx2sC2ydA7
	 PFJDYXVXIVQnSg0ms6sIoDGLaseCYNDjVLI4A/WVisFsOhWVwKOMb8I3VxzsACvJj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=fmtS+6Dn;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2766606A31B;
	Sun, 25 Oct 2026 19:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2766606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=fmtS+6Dn
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJKmsL515844
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:20:52 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJKmsL515844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956052;
	bh=75Y6P3mxr5SFh4Kr/TaY5+EyHwuhs2vmH3vTMgy6sd0=;
	h=From:To:Cc:Subject:Date;
	b=fmtS+6DnQnxdLoC9LXUAPC6Bg1qkXx+UyFJenZYDVVjWZqIywInzr3jKJbpf14NGo
	 106vHdwuGOgQYVjgW54nW/xlh9wJkVzGgJ5W1QszLR18EsmU1L9zuA3nllLcP3hRpb
	 LwbvOLIJZZ+8OuYd6AWZYminhro6O6XsMaLbnt/E=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Sun, 25 Oct 2026 20:20:46 +0100
Message-ID: <20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at>
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
mode (CEC_GEN_CNTL clock field 0). The probe only pulses the reset bit
and leaves the clock field at zero.

On S4 an access to the powered-off controller never completes: it
stalls the AO bus and hard-hangs the SoC. This triggers on every HDMI
unplug, because that invalidates the physical address and makes the
core rewrite the logical address.

Leave the controller with its clock running after the reset at probe,
as .adap_enable() would.

Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controller driver")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
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

 drivers/media/cec/platform/meson/ao-cec.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 2df0d3743077..dd4d91d7b927 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -674,8 +674,25 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
-	/* Setup Hardware */
-	writel_relaxed(CEC_GEN_CNTL_RESET,
+	/*
+	 * Setup Hardware.
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
 		       ao_cec->base + CEC_GEN_CNTL_REG);
 
 	return 0;

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


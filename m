Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775973;
	b=I/ZTqtb2x7J6GThkKLeEdDhsgZM5xdY6WnG4cPNfzvjbQOpRS9SHyQ9YylO0OC1am5QP
	 8Y9p5cw9NXzXRLtWd/qKEXJViE2ULrbZENzY4NbIW8hoWWP5nRPGubqDgl8SAwa16snwA
	 itr5+1vgX/JMse/VHxGxJfafMKX21uKB8Lt3hufRFm9ABl4+JAaeHEEeGEiatYN/ts/oU
	 Bmtfoaqqu/eLjOfoKQs+9lzrWEUKybi1XOE1bGSrsfjksOrTRGJIGeBxTXkHkjnx0nRnt
	 Qc/e8tSrdTy9iyaWquf4cumxLdv6q5BWZoB5P9UphqHtZQJwNmCXsFzwWWa85MuE3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775973;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WokjOK4qUKpaWUewt5ne3nHyD3RlNEsjQzStQ+c1XNE=;
	b=wGojMCKWlFG9ZB4dpNIYThaqPPzS4DX0S8KPZUEjU9dl7HkNGciSGAwtviQeV0PKO1N4
	 2BF0mAPlS0rZFZIRhnB6mkMQbfJCAjIy0jHJtrgqj+lr3Qo7C5zIzB0x0jkcnayP0w43p
	 pt6rQzIXsdie3hzTFtE5mIua6CGF9pJLOTLkFghrwGiobq1iRmj3pX4FyvG1RVNpwi0V5
	 c1d81wCd32/V3jmgvSDw6YfSWlP8QxYHBy3BzBnwOsXQMXhmWldKOtJmP4sxOZnRpmvri
	 uFDDIoFHChFjif2czKuCrO6Q6RqtRhkr31zDU7ne3eg8s/fyGzhqi+yhZRlBg5YF3sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pYeOesUx;
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACE606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CACE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pYeOesUx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sN6eycwIKu/qE35PSu5sRh3YS6d8qIr8WXShRM/F29s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775971; v=1; x=1794380771;
 b=pYeOesUxINa+DqUJ5BRP6CfaVMrX1z911PeLdD1Tsk5KqerFu01VHcj3YV9PuNJ9JUKM2LlW
 fumk5BbT1RjvNvx4GTQVRGVoWG8VXS/8xJZ+UYKDxJyJknE7DoS+tOnblJvrH9pa9X9OJ4TSDMH
 Ch7BAeB2ZSDqX/AtviAacNtesBysOlX65qLdq0DCWsBaZAC3RIFXzEDboPtzwh9Il9g3gpAO20M
 RMe4jL7NU1eQat9HQUqpYJsnqyfnakpTkMRotL614kcaGbLwuWnLd3J5itolfhBb23BAWVjZiw1
 wMStXQWpeH+7c0fXU2EVCMVx/EV1MME9kUeYnx19B1pFw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5fa99feb5128d1f;
	Wed, 04 Nov 2026 07:06:09 +0000
X-Mizu-Trace-ID: e5fa99feb5128d1f
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Val Packett <val@packett.cool>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/5] platform/surface: aggregator_registry: Add support for Surface Pro X
Date: Wed,  4 Nov 2026 04:04:36 -0300
Message-ID: <20261104070441.74127-6-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
References: <20261104070441.74127-1-val@packett.cool>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maximilian Luz <luzmaximilian@gmail.com>

Add SAM client device nodes for the Surface Pro X.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../surface/surface_aggregator_registry.c     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..bec0a87a2a95 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -51,6 +51,12 @@ static const struct software_node ssam_node_hub_base = {
 	.parent = &ssam_node_root,
 };
 
+/* Real-Time Clock. */
+static const struct software_node ssam_node_rtc = {
+	.name = "ssam:01:01:01:00:00",
+	.parent = &ssam_node_root,
+};
+
 /* AC adapter. */
 static const struct software_node ssam_node_bat_ac = {
 	.name = "ssam:01:02:01:01:01",
@@ -352,6 +358,22 @@ static const struct software_node *ssam_node_group_sp7[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro X */
+static const struct software_node *ssam_node_group_spx[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_rtc,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_kip_tablet_switch,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	NULL,
+};
+
 /* Devices for Surface Pro 8 */
 static const struct software_node *ssam_node_group_sp8[] = {
 	&ssam_node_root,
@@ -508,6 +530,10 @@ static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
 
 static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
+	/* Surface Pro X */
+	{ .compatible = "microsoft,cambria", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,carina", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,caspar", (void *)ssam_node_group_spx },
 	/* Surface Pro 9 5G (ARM/QCOM) */
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
-- 
2.56.0


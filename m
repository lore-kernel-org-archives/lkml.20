Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C904D7D55
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405244; cv=none; b=czDapGCd6ZURzGyQE48WqG7zrbSqI+wAaT8nwiT52bUWZPvqTp32YeFw+PxdPE2rvF03z2gmXZucxIaGkxq/sbK2BZb08dVzvERRRzZopQBmHmPWojgwuNm3P4Patqz89brNnPLZNoJHHq/2kxWMEsaMfxrj4oDoKpbqejFasCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405244; c=relaxed/simple;
	bh=9EMRcKreP4doQsnkOJ6fF7O/xO+9vD1EZaaP/H+owrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXUMd4BJoImdawrvOjMexfeEWUmD8la3Hkjsat5F+4CTVLbEk67APkppGAZGxWo079hWKOD+oJHtf8Rq7zQNPJdk+TssndWR5qGTJJD3REQ25NjgoNI2FVwkCNvTO4NdnG1JKTctljY+ca7HRDgDdVlp8HDxZYVbOUPuMxZCtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVAzV7EK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVAzV7EK"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15354aa70e8so646113c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405242; x=1793010042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=eVAzV7EKnGQllOWafEZxbc9MKRdne/yyOpx4oOIz1GPoOPym7eE4lC7NgwlkD0KaAa
         n6qp0gCjs94E47YXDYilmbD82VGgKZyAAJtL8Pi9kHB0AGGkOh2RFunVJbf6t37ckK35
         pKEQVqyHHajQn/UwVnexF2MBeaKdsjXI7/2EM+JULEMw/FlL7/pxJcUQO1GM/Hl+L5xE
         5qY08T/JPnZBzPn9i5Rkt4q8opSBONZPXpQAFKb+hmJPDnLSVye1zv6Vva2CNwghQuFv
         bBD80896eBaXjx3V4Fnu7Z76JxUpEWf9RfvgKp9dj6mQyOyWBVajRq+pI5WGTMFw1mm2
         RgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405242; x=1793010042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=twtqLhvhCher8ZeOsHtRQMyA5/ZeTAq6vvMcJk+3C/NskixeMh0aKUeNktlMsJkxOO
         Cyg/67N/BfYBXchb05slN7tRpNsXVr8lateNbuHQd43LhBVkNnWzckSF3utFF32eAJOx
         Dy6kd+EcMrXxSfz/ffD6MYDncMEK+55t+/g5CeUOUVfXfB57cHFrz0TqbuWIf2H5+Rob
         g7Wk4d1RYK40R9R6qKg25YxOzTEklun+WYERLiNwcAtCMBNNtvND9+uIAb4hSsSfkqeK
         ebgGm6LkMPP7v4/uk9RHfMTZaLrI/qDzh6WNoqLxffnLPhGAVLgkfUUrR8faV43ZpmTc
         Idkw==
X-Forwarded-Encrypted: i=1; AKwUvByXs6PWh17OSpF0WHsAoYePyIMNqPNwJuijukqEVBwTG1eUmZMtZLTJouLJi6DpUdt1PdLHrea+vvkVmXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvMQDuag/2fRZUJlbuu4kdc+pQNpdZtjwYw9GImi6G0nw/6hUZ
	5yvpQRlR8Ricc50s96c60vbD7UbJkDYLX2vpWcypEepLAccWA5pGczCa
X-Gm-Gg: AYBFou2yxY1cb+IOVJufVKrXkhNnswYaHLeGrJrgiwbSf90hX51HckfhPz1kWaxgI49
	0exinxL/Lijaxl07ofs5UOCz20EpE8ma7XrZyQb4yboYWcqpM8ihFyRtRYLwrQUDVCkGR31ne0n
	PNzrVGYaDqNVPTqqzN7sW/DtTdERg6ZxRfdihy4j2gDgjjtzY/gbKLGeh94qO+v87hfeZICxCrx
	gNfriHQBDU1NMJk57T/KEIcX8OVHRavzlFyvCYTsd/oWMNJHnq6/RqxFkJcVSSB9RyhHaAOOWnw
	7OjesUU6//7SCMGlkI/Dep18PKymfId2l+sDcgd25owCCymq4U6FLJpupvIWWGlVXBqg3CHKfLy
	+zL648xgmklKnxR+iTDDeKuCJEbk+EjL0ttWn1nGPCpyXUlZ4m406FvS5puSify4gQ9cnYlvfPa
	6cnJHMUlXAQ2wxCtf4c3qArtTBTFoyUcQBW+AiAGk6Bk3eewsPcPxE84Qyx4KoB68H5x3/tj8Nq
	BGSeuXtvYJ/tQ==
X-Received: by 2002:a05:701b:424d:10b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1850c9cf427mr12119481c88.3.1792405241814;
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:15 -0300
Subject: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2075;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=/IjtTShiJA+F9KmNWlJJNMy2lTKWTky2io3jmPVXXVA=;
 b=wT8coFssfadnbio6KHmF1yBAZdfjcW8j5Ftd+0jWUjv7dcyReSTM5NiEs8ga+Dm7iSM19YUzq
 JsnS98IOb0zBMI8LksAaaJsn7t3ABSIdTS+heHkDqYkDHVufmMApZIH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple bridges, such as a resistor ladder DAC, may include a
data-enable input that must be driven at a specific polarity.

Read the data-enable-active property from the input endpoint and fill
the bridge's input bus flags accordingly, so the upstream encoder drives
DE with the required polarity. The property is applied only if the
bridge doesn't provide its own timings struct.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..c5301295658a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -183,6 +183,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	bool de_present;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
+	of_node_put(ep);
+
+	if (de_present && !sbridge->bridge.timings) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
 

-- 
2.43.0


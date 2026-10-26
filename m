Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987365;
	b=Qtg5278U+1nCIEc0IG7laSmA1OoJjmGQ8G8zWl8Quw+27LJ3WXlY8pM+WZnny0Bt2H+E
	 PU8uIv0OP+49Fhh1+LHDCK6/fr73RBbYACDV8pz4BQa0L08J5wD7XE8QFWtq6fBwFevX8
	 Om96RuCDLA9l0ZNWwROF6OX6MMKXquFom4JzhvCg8BgcWj2zQV4aiJDh+IGLwNDKchp/H
	 pwssQKzRWuMNmZ4XG5jDKvIkLxGgzzaGnaeBiTAK9rO4oVTqwtZMul9BP+A1uYAx6p9C4
	 RFlWr8nJCzouhMAxdrrhuhY/2NpI8NOiYdPTrs2B+GjIYLccu7vDeZbFq7Y1KmDqblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
	b=lv97e2xMLpQyJUU6hD906lgrGE+RqXgi0GyRpn/aPF4AbOfbxC05eWtAUi+jraEnXaec
	 PzBNIDAPRCSGEZ/rr5A/uzbHVeWUBkauP5T13kVgLsK/7y/p2w/hRM9JIDhM3PdcyIh2y
	 FYQNHuE2+YZkfg61Kp1lynXHVFJrxNH7YniaviegJQ5Br0b6dho8yV2iKe7xI4JUZ06a4
	 dyx0rF/RS6fg2DzMGQtKsSTkW5iAZQ5PY2PWy6rEUE8vCP7hvcegInJa6zElrT/nUgqnT
	 j9Gnot+wMe/aT4Adw9UePiOLCWfZORD78kSTxZhkkv7M2GtP8AIgYN76qM/BKqiLVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ayyPxwWM;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CFA606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CFA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ayyPxwWM
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e985106c0cso21670195ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987365; x=1793592165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=ayyPxwWM/lb+H5VABRhht0PR6vZEeUivf9sh2Rgba0uC+hcvHTu/6mrShgE43B9ZT/
         kMs218fUY4beR83h7cZSyjRDyrIsJUF70dAmMY77n2GZ7zShdhLZofVUAk4UCxtWJFnO
         x0vswuv9993aAFPfzJM9bDcFhz8jw8VEIr3g32fettpVMclgL0mMHLxjWO0iv6YiGhmu
         RtvYkwSdBW0zd0sZeheju6ID8IAOSSf8yfkDe8DJCalQFyrQ39ydaP4S5yjQ7P/6aHa9
         nAVcmEqSej2jmssIaA28ZVHJTo47vL332VCVpSHKoNrOMFGVtzVQsfrrEGpE0x/yAu9P
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987365; x=1793592165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=cgktNGOL5Bo2ctoKAXF3X+Y1WEvETNju6ZIL3XM3PPFH1cRSIAu8qsaRN1ZBPaEiEd
         CGv3shDKSHFqGfktW+1/iuJw+02kaJu1PWiznz9Qz+KsD5pK+XrE8oED39WiDrNLbSl6
         /frL/fduWq+ygCfLQoGBdAmq/VTPrJIZAhj4lfqpN5XqG26W31AuCxt0S0LaK2yrqTnT
         PRLGYKp2Yc1ZdiR9fdqSzno5lB5dnlMH66EymS1rnZkcu3Bu4sDhES/0cV3iiaEFK2ZI
         YPK6IxU2u10NtpSZgJhzFvJe1QwwjNUfOlPwtcD3evIbfCBUgXQ6kXBTZ7s6JAbAnSrd
         ew6Q==
X-Forwarded-Encrypted: i=1; AKwUvBysYpenk1ho7z/GorTtNFBKAwafe8F1xZa1LoECyZGKDyj8PVxCTkCksfVMc4QNb4zMhJKWxh1599InDIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQNJErG1kvykeW5N8DvxD3dhslMGKQrYbjpblBP/u2qyb9OBdR
	W1JqHeBb5nAs8wfZG1c4QYFIm3LoK0/U90n2S2ZXJ4A0DKVNflUgdFzJ
X-Gm-Gg: AYBFou1A6SpeR2JhYv+xBZgzR9ZxcIfOBEHIZ3e9jsoVBmrO/vh4t+fNBDjo3HVnOWj
	e1kiZNiAIpk6drrq4bbgQgmsn8Y/aP1Nnl1y7NXfObIpSB3Hvc/CvtB/0NeLtW72d2j/6SsdFZB
	Y7hLWJ6+h+A0DYH2HQLv/VEmPK0lzcQcaogfeKbTdm+xIPZnTu9O6Y67+ww2TmqV3ULICHhYGqB
	z9gDnKGH/T7+fDQIrUmdyx9n8foHu3BoWbFjsRT6/Pg8QwZWCSu9xZ4Of3MwAX6e3MaJmogspP7
	dgJzqoezCo5Q2A606cE4dogDnmnEbpA4ncH7i9oDG8rzOBEWwJ0vNT3/xNQ+p6kX2J+v4fqnlIe
	tftrP8WRcueFReeKlnGC4BPgaJm5tg4i5jzHVrgVRXljrne8zpF/2sNjwLcENNipLVA3JN91gTE
	AuHVBzRt4FYBrFRz+iEzOUNDtoUP4hiBT+Dh818axjHDSjVR4Np3XA2oijbw+BgQN4ygeSdsdgw
	KS1MH67ieSirUqT9iNLoD5xMvSjWbMz4LYjZr7KtICISuv/aNExMvjfJP37P798Nv/O5bKVmck7
	7wnqEsvIbdwfgmHWzOY=
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr46730195ad.17.1792987364597;
        Sun, 25 Oct 2026 21:02:44 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b22416bsm10626705ad.72.2026.10.25.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:02:43 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	linusw@kernel.org,
	s.hauer@pengutronix.de,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	peng.fan@nxp.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
Date: Mon, 26 Oct 2026 12:02:30 +0800
Message-ID: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
of every pin into map[i].data.configs.configs, but the driver's own
pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
dt_free_map(); the duplicated configs are therefore never freed and leak
every time the DT node is parsed, e.g. on each (deferred) probe attempt.

Replace the custom dt_free_map with the core helper
pinctrl_utils_free_map(), which frees the configs of each
PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
signature matches pinctrl_ops.dt_free_map(), so the driver-specific
implementation can be dropped entirely.

Detected with kmemleak on an i.MX95 board (FRDM-IMX95).

Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..8cbd66950848 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -153,18 +153,12 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void pinctrl_scmi_imx_dt_free_map(struct pinctrl_dev *pctldev,
-					 struct pinctrl_map *map, unsigned int num_maps)
-{
-	kfree(map);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
-	.dt_free_map = pinctrl_scmi_imx_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
-- 
2.34.1


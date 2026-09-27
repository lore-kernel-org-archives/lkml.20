Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56D3A6B6F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494735; cv=none; b=nVeCMOPuxsnXBDpKcM83mfrttHXJpBGGvkScvhDBQQ0dWJ65EeskHuMGYUk1J9ysV46MBKae9JU8K/xSTYUG7HKAeuWxKCbgrMVJ4lQDBFwbwctbc5jBc0+grQrtsXeKVOumofjmoJuR0TUfL4TzI1hgic2VO6u/PsOFVO4l6lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494735; c=relaxed/simple;
	bh=wK+FHaUY/PX+o6hgqu89Q45UGl4NE8wsCY+lR2hzmFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYM4+U4kuYN/Y79Jq2w7UUDb1ZxW/zFrUmO6zfOwApOr9zwZoOPkOxC6MCskYVA7Eyqjsoy5G7H9azwEUcPmubsvGQd+No88n17Lta68VvIDPrGW39jf6grig1TYWQ0dPbZ9BOENkRD/mPtkJ/5jfjVe4N0f4TCvO4qIAEQMZ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN13eGZg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sN13eGZg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so11922815e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494732; x=1791099532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b0gf1HYtLKFke/fEYzMHCoVYjMKyNvdGkgCDilbmEA=;
        b=sN13eGZg00n7WPPtoB12C04mpUuLU6r697nhy4OxzyuvAWH7XlgXubYofgC8ciG8nN
         s7xu8N8t/zGRO7qtYg7c44ltb85aCU/gQ5MtWitesfdReiVS5GJeAp1mVm/fiu574ASX
         V9Ng++/wjvInKai55hNFXhOxqkmH9+BxrFZuR8zZW4UTHvVtXD/2Rrq1B6qi/iyJd49I
         dBHL6nH9P0yVihLK+XaKQumQub+8N5pO/FwDPlYWwgzW6P81PP91Pi4W322S9CCxB0D0
         4yy82A9KNSmhxytYoLgxG7bEdJtTIu+lOHz9d/Y+iTqX9ZGtXWAt04RbeEOxw1DxcrFZ
         fZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494732; x=1791099532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6b0gf1HYtLKFke/fEYzMHCoVYjMKyNvdGkgCDilbmEA=;
        b=LeQzwYXzNNV5/aWKEsW6Xe0dhY70KzQgQ3UjD6HSGPdkRFf0a1H6mBlclQMRi7Iiut
         WIK9SuJLkrpt1HbP9dirUvSEvtz+s33y6BWSsUX4LIozW5NESWkN95GeYFFfXuJUz5Dg
         1Fgy4EwtCICMuiU66Oa2/8jNoYM68zNjdhEenepO9UoLSA4XI+sd0spF5c/zBiHRgoZK
         ghk9v1HdtYGvs8clerzw+8X/mebzO7XgUSPc4/K4FXKOGdvwP6FgG7SzdANgY8eLdI1v
         4EGkNUXbVDe1Vc6d6VMSsMup5RBbD3MzWi9AVuvsciu8ADa40Y6nXk6pUQdBCM3fkmHC
         fCyw==
X-Forwarded-Encrypted: i=1; AKwUvBxuxmRDNn0XT6oQ5sLlSxPYUZl7O9E0JaT3An2BHpDUf0D38pU1gFxMsKXUyrprsJkhkj6k0S52qoQTG/8=@vger.kernel.org
X-Gm-Message-State: AFuF++l0dBoUtF6teom3yiM3rx2d7P+pxY3rnO90MtfNlYnsDWYUzi6L
	ww5vH5X/xCP6eOzOOaVzpwjvz3r7D51H59hApJmO5Im4dNGWYpfORfRz
X-Gm-Gg: AYBFou1gQR66N3Uz0nDKLCBFbalctJ5+oycJ1x3kK93ehOBuoLNUDEcn6zrs2S+vCmI
	URGVuXoSK4Zk5V68epMStNEYnNPxHRwSWumGDvUmSHtU7RhP8N/so/ALILnnlEpWEo9+eYEE3J8
	O2Hk9H0Zjgum0FsCsxAuo4JroAdQRk7uyPSdIerKbRZ7SIjZ3MtRJJcytCvwm7luGA/sAwVu/Uk
	z9mzX/I/RuKX4LaEIx4YIE24AkyYd8n0TRzgYTXCcoT+shhnvBKkh8zmXwv17o5IRdlrYQBXXKN
	vfNuIicH7CdMtx8mg0WkczjgZyQ/GCzJ4lvJca/44iK0eq4OH+P/RBwB1j0U+KxMi8TtN/rVuyK
	dxqxzByoGjMndHZX0TuxafL5vR3VvMY6IuLw8drNRBqOMDgltupGqgTjvAKTBNgix7ws7jPQ/Ei
	gul3rLyKU0X95bmUYFEiEsjIxMNdH3HhSINd7kIIQT4L8Z30vqdwpP9A8nYxz85GbvDe1wzaImQ
	1YE7peSghLCqIKRLbghHxJ3/22hJGnQ0GQpxm+1NGSaorAgqdc=
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr25725455e9.9.1790494731620;
        Sun, 27 Sep 2026 00:38:51 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm17210652f8f.16.2026.09.27.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:38:51 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 2/2] net: axienet: add a MODULE_ALIAS for platform instantiation
Date: Sun, 27 Sep 2026 10:38:43 +0300
Message-ID: <20260927073843.346910-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260927073843.346910-1-maimon.sagi@gmail.com>
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module is built as xilinx_emac.ko while the platform driver it
registers is named xilinx_axienet.  For a device tree instantiation that
mismatch does not matter, because the OF match table supplies the
modalias udev uses to load the module.

A device registered by name from another driver has no OF node and so no
OF modalias.  It advertises platform:xilinx_axienet, which matches
nothing, and the device is created but never bound.  ptp_ocp is going to
register the AXI Ethernet MAC of the ADVA TimeCard X2 this way, as a
child platform device described by a software node.

Add the corresponding MODULE_ALIAS so name-based instantiation can
autoload the driver, and give the name a define now that it is used in
more than one place.

Tested on the X2 with a local ptp_ocp change: with this patch the module
is loaded and binds when ptp_ocp registers the device; without it the
device stays unbound until xilinx_emac is loaded by hand.

Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index cfef8ad75909..ff1837103553 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -48,6 +48,7 @@
 #include "xilinx_axienet.h"
 
 /* Descriptors defines for Tx and Rx DMA */
+#define AXIENET_DRIVER_NAME		"xilinx_axienet"
 #define TX_BD_NUM_DEFAULT		128
 #define RX_BD_NUM_DEFAULT		1024
 #define TX_BD_NUM_MIN			(MAX_SKB_FRAGS + 1)
@@ -3223,7 +3224,7 @@ static struct platform_driver axienet_driver = {
 	.remove = axienet_remove,
 	.shutdown = axienet_shutdown,
 	.driver = {
-		 .name = "xilinx_axienet",
+		 .name = AXIENET_DRIVER_NAME,
 		 .pm = &axienet_pm_ops,
 		 .of_match_table = axienet_of_match,
 	},
@@ -3231,6 +3232,13 @@ static struct platform_driver axienet_driver = {
 
 module_platform_driver(axienet_driver);
 
+/* The module is named xilinx_emac, the platform driver xilinx_axienet.  A
+ * device registered by name rather than from firmware advertises a
+ * platform:xilinx_axienet modalias, which without this matches no module:
+ * udev cannot autoload the driver and the device stays unbound.
+ */
+MODULE_ALIAS("platform:" AXIENET_DRIVER_NAME);
+
 MODULE_DESCRIPTION("Xilinx Axi Ethernet driver");
 MODULE_AUTHOR("Xilinx");
 MODULE_LICENSE("GPL");
-- 
2.47.0


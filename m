Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398511;
	b=ftPDa4w5kJYGobwDHcy65icsTnQ5hHX4sCjrrbanATmbQWxyRXzIzVKEYLdC7SsNdd36
	 RLxNLzPyvPw0QkLLKnjGpBguIRcyg/0IF29B6QrykO+4jWAXc28nkZ7zoTM0RfSRrHHvM
	 qcK/mG3oCR3ebAN8SNJzninBY6RswSML9vqt3M5qiYBcJgMCkxmWyDa+ArtEGRE2C4PUC
	 fHxmK9zY3PxEFLZ8E+92qpF8zotuvuVuEmI4wMi8O8uODSybtu1v9DyBrA9oeZCvtODvd
	 BVYsF8cm+hWc0cbxB0OKYFAFAr5x3pc2p1l63B+wl6ID7Ta1DvTxzENv7QjsTL6rxww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398511;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=6b8J9+lg9Zzp/DTSIoBnJHHLAZUSncPbkHuA06jN30U=;
	b=B5CHGpexuwL6Sezz5rPyvUreu77l9F+YQUS7jh5a7JyegSqwqJ3Ej6B8HocNH94tAk7l
	 Z5LJ50KO00cmUfiMlBixqFZcqQxUFDGjkYYB0vtiR2QkW6/8PsVmv7nNpzoT9nh/JILY9
	 Kn3h2C4KfCpLZkUATIADIXAgJzNiEF6bIwFPUQqqhhUUTwRsJ1E4mR1MR2r3GV26Qf9sG
	 whoTjF2CCJ3wF5f0anpjHkJaIRAflhBedgTLhlmaAzPdWgwFrTwgte9bnRE7ZsqqDmYpE
	 VEQquq833VZQQ9E/DIWuIZAAglHNxJFBop04qOFceIP8r1aUnMJz5vazJIUmyo2jINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="zGU/13vq";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAC606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AAC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zGU/13vq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398511; x=1825934511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6Ci8KqCR4/fKEBbb/kiuWd/gp3h3w7zKEf1wHvnL20=;
  b=zGU/13vqQ5I+/rIC2yoB5H8QiCutVr9pGEOnFtdTOCNWM7OsiOr5jOd9
   H9HCI5e+QbsBSX/h5m6STca4J/EclwjPhBQZH4yUqac3UY+sdJJ6iKOcq
   t6PFbKeJ1dNDVVn0VREKAijzm0BnTtF+XPslFiRZxvXzS/MnKBGK2bbH5
   pQbacee2brink5TTqnr0GsqaHX8vjtIUyHSZ1krCeyMBsb2AXWhviRshB
   0W+Q/wyNW0fFXyArjpW7k5GQ53sEdsb4nNI6pGYCkiKd7cfIMe0VegQJR
   Ql7PVyx+hsDH2IjQF36/NBaxVU7Ppg9d3uXB6CL7FhtlNTiet2qRXsmAK
   Q==;
X-CSE-ConnectionGUID: GyyFCI85QbmZ8i9JheubPA==
X-CSE-MsgGUID: U4Q/youGQ8qHnUvIPLJG0g==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66592432"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:01:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 11 Nov 2026 05:01:49 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 05:01:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <srini@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 2/2] nvmem: core: don't defer for a missing cell once the layout is bound
Date: Wed, 11 Nov 2026 17:31:32 +0530
Message-ID: <6b8408e4052882b2d248db3c873242f879e897b0.1794391847.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391847.git.manikandan.m@microchip.com>
References: <cover.1794391847.git.manikandan.m@microchip.com>
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
Content-Type: text/plain

of_nvmem_cell_get() returns -EPROBE_DEFER whenever a requested cell is
not found and the nvmem device has a layout, assuming the layout has not
added its cells yet. A layout may add none, e.g. when the data the cell
describes is not programmed on the device. The layout is then bound but
the cell is never going to show up, and the consumer is deferred forever
instead of falling back.

Only defer while the layout device is not bound yet, and return -ENOENT
once it is, so that a consumer such as an Ethernet MAC can fall back to a
random address.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/nvmem/core.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index be3a05150085..f34a35a04e55 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1403,6 +1403,31 @@ static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
 	return 0;
 }
 
+/**
+ * nvmem_layout_pending() - Check whether a layout may still add cells
+ * @nvmem: nvmem device the layout belongs to
+ *
+ * A layout adds its cells from its probe. Once the layout device is bound,
+ * a cell that is still missing is never going to show up.
+ *
+ * Return: true if @nvmem has a layout that is not bound yet, false otherwise.
+ */
+static bool nvmem_layout_pending(struct nvmem_device *nvmem)
+{
+	struct device *dev;
+	bool bound;
+
+	if (!nvmem->layout)
+		return false;
+
+	dev = &nvmem->layout->dev;
+	device_lock(dev);
+	bound = device_is_bound(dev);
+	device_unlock(dev);
+
+	return !bound;
+}
+
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
@@ -1486,7 +1511,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	of_node_put(cell_np);
 	if (!cell_entry) {
 		nvmem_layout_module_put(nvmem);
-		ret = nvmem->layout ? -EPROBE_DEFER : -ENOENT;
+		ret = nvmem_layout_pending(nvmem) ? -EPROBE_DEFER : -ENOENT;
 		nvmem_device_put(nvmem);
 		return ERR_PTR(ret);
 	}
-- 
2.43.0


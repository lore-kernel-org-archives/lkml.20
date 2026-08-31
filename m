Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799D4A263C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200365; cv=none; b=AnRbqZ3qogeytPRdTUnmsMbKjD9ESWtpIPYvtjQaiTAmIEJKdbDYuGqhR2f7qQyjjmUjdXCaRu8zR4iBVHBKUeG3ncY9heYHO7AYwCKwKubZ1crqaZ4ZhqsAvYj88gS6eViO5hGWRuqEG3WzHWqMju/DZ8K3blxs268uge4TO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200365; c=relaxed/simple;
	bh=LO4/rrD/7/bVghxt3sL+m1l7ZUa/uTicC4lIzaefMGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjdbunXTq80NdkkEqaXSrhMSWkh/Zr5ZcAr86oUKdXcAOEVNluiV3CKUkJ8SRNodHNTYEkPZWVsOYkjSPoFh3XLkn1d0GVukeuMBRI1LxcAlXKeIcIL0xEGO+U+ByuoZiFOkYfCO8aPom89iU4zCQBOiDDPQoLAuKdIfehV6vYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxqjPiAt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxqjPiAt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48431648f33so128842f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200360; x=1788805160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pL0y7/95vb7zUgQ3J7eBZ/5EUBqoEavK9GlZ7VqRDKc=;
        b=IxqjPiAtGDdvCu0VqBZEqL85IxqRLfR7IP/QSzpYseW/LBs/XxSqA6CNDgF28f7vah
         XTfbb/Z8zTl1/R6VFFoD70w1rqPZPeJ6Jnm8LcPJLNtHDHEJjGbiipYO6KIHzrfqMIF3
         D2rCfCi+pp4BzbgvgFhNciIPsgcv6NNTde8cg/ud1F+gEMZnXC4nXOjMdaZLRKzphNBL
         509M91L5RqSWd5d1YwzffkH6xd33F3ytvXI4KbgIGyNI8j89bvZAsLbDrqzcEsSBj6W7
         33O/boKW7cNfZ4TxHmfOVGqThiS04X/GdAxDo4uwNCCjMuM7thkH7ixVJAfZh/w4KhUz
         zWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200360; x=1788805160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pL0y7/95vb7zUgQ3J7eBZ/5EUBqoEavK9GlZ7VqRDKc=;
        b=Zzmt2KYe8snvl7qSaE1Q5PY+/UDntANg/1E2LOOoMkpo8J5bdNFM6zFbG1zPy34k6y
         QL4VlT2gLgmFR5SHODP02sbqBvSMDHu4Z7NFeegYpIg992JYC01d0t2fE7WCC+gczaZO
         7orUlrcNtb+SQtDWqkSyBKRNtrMW4lRcp/8nKnb9ft5I0+zT+LUGZcoktTz3BVUZ0adX
         FAkc+AQJF0Cyeu68NNayFYkZSWONb0LMWHyXGtHT6k00LjV+1RtH9vrLKU7CLX4Ps2Be
         osAx37S5IMOcRBcn/vlsl6AGGn2/KgfLR+msUdQ1Yz9s5k4GUv63s3fgsatbU6TRVal0
         DWag==
X-Forwarded-Encrypted: i=1; AHgh+RrIvEjWiuD3o2UUmbJhRkgzCWNvpsJX/X95oN2VOQi7vAaKMzsG18V2H8XRhnEShrAMaEgTpw7FKnqqWzg=@vger.kernel.org
X-Gm-Message-State: AFuF++mowRf71KrQhvLqiGzilfdA9Bshu3mOBp7JdVb9ILbOjG3ACV+n
	sZECi+eBRrzjwleIYTKk79yp/AwUgPVFfGQWfidnjot04zH5palk26h1
X-Gm-Gg: AR+sD106j9oDgDqGOA4ggU6yhMcS060r241qTceEY+TRhDg6qLx/uOOk04xZqXRVwyY
	d3v0qbDGv0eOeG6tmxbaXTnjInQEU6NfjjOJSrBBaLYEmhyhNVvSHTb0cXjK5PJY2kseQmZLUQX
	3Uf6efCAMi3DtWd71vCNdFfYS60cj4WKcTz/IbNSHc+mxqHXPIyGhnpPgqCjWdhChtISN2sZo+4
	Sbsbq/MeJACMV1CTL0AvJQF3QIM6f6AZGglLML1psQArpdlbwf//zLQZ4WRx3XbcgoAXsAOT3J5
	jxNkYyYBdJ8aPFu0RuxqXbZJNVqp2S5FVZvvHdtIUWGnse30MhZDnfhZnyXdJxPLZJJQVJCS7d0
	R2C6GVZRymQVj0MUlWtqn0qzxZRDcJigTV2XqXBy8GuUGalxGMKvhxH5SBQdV0DrbccPYg15is1
	m3WIIvEsLFOcMo+OK5EImc/G86kfeGj6OoIRLONIRmwAUNOhGZwW2b5ljhyvG+Wb07Xf3fefuMI
	MyCGHzqZRgb
X-Received: by 2002:a05:600c:8519:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cdd402618mr3340315e9.2.1788200360336;
        Mon, 31 Aug 2026 11:19:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:19 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 6/6] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Mon, 31 Aug 2026 20:18:58 +0200
Message-ID: <20260831181858.325109-7-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 (INT33BE / OVTI5693) needs its MIPI clock lane gated while
idle for the IPU6 CSI-2 receiver to lock onto the link; otherwise the
sensor streams but capture times out and no frames arrive. The sensor
driver gates the clock lane when the endpoint requests a non-continuous
clock, so the bridge has to supply that property.

The same sensor works with a free-running clock on the IPU3, so add
IPU_BR_FL_CSI2_CLK_NONCONTINUOUS and set it only for the ov5693 on the
IPU6 variants where the gate is known to be needed: IPU6 (Tiger Lake,
tested on a Surface Pro 7+) and IPU6EP_ADLP (Alder Lake-P, tested on a
Surface Pro 9). Other IPU6 product IDs are left out until someone can
confirm them on hardware; the generic entries continue to apply there
and on the IPU3.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 13 +++++++++++++
 include/media/ipu-bridge.h           |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 38ad3e54e..7498531f2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -16,6 +16,7 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
+#include <media/ipu6-pci-table.h>
 #include <media/v4l2-fwnode.h>
 
 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
@@ -62,6 +63,10 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT0310", 1, 55692000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
+	IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", PCI_DEVICE_ID_INTEL_IPU6,
+				   CSI2_CLK_NONCONTINUOUS, 1, 419200000),
+	IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", PCI_DEVICE_ID_INTEL_IPU6EP_ADLP,
+				   CSI2_CLK_NONCONTINUOUS, 1, 419200000),
 	/* Onsemi MT9M114 */
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
@@ -98,6 +103,10 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI5693", PCI_DEVICE_ID_INTEL_IPU6,
+				   CSI2_CLK_NONCONTINUOUS, 1, 419200000),
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI5693", PCI_DEVICE_ID_INTEL_IPU6EP_ADLP,
+				   CSI2_CLK_NONCONTINUOUS, 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
@@ -526,6 +535,10 @@ static void ipu_bridge_create_fwnode_properties(
 						     cfg->link_freqs,
 						     cfg->nr_link_freqs);
 
+	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
+		sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
+			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
+
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
 					bridge->data_lanes, sensor->lanes);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index d12e51336..a5f8c5d4b 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -19,6 +19,8 @@
 
 /* Flags for struct ipu_sensor_config */
 #define IPU_BR_FL_NONE				0
+/* The sensor's CSI-2 transmitter needs a non-continuous clock */
+#define IPU_BR_FL_CSI2_CLK_NONCONTINUOUS	BIT(0)
 
 /*
  * Sensor config specific to a single IPU, identified by its PCI product ID,
@@ -83,6 +85,7 @@ enum ipu_sensor_ep_props {
 	IPU_SENSOR_EP_DATA_LANES,
 	IPU_SENSOR_EP_REMOTE_EP,
 	IPU_SENSOR_EP_LINK_FREQUENCIES,
+	IPU_SENSOR_EP_CLOCK_NONCONTINUOUS,
 	IPU_SENSOR_EP_NUM_OF,
 	IPU_SENSOR_EP_NUM_ENTRIES
 };
-- 
2.43.0


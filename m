Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272084A3F36
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359053; cv=none; b=KzsFHZz4trm++JzLyr52Xmw6xit6KeloVS0w/7AU6C8WbH2plyJd77h+DG/8DCkDLuYv6GKDAmeqSv1DZewoimkOtDCeNNNdSgmAyybp78Oa8rjuajVqPperg6XFItaxYb7jeQ4NZMuvKwOVM1H5KU8NjO2ZDkRQZl/VbTlGlRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359053; c=relaxed/simple;
	bh=zceS+87Q6gIX2OHEqKQK4Cdwa03R6ggqgHdcs+6vNww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQQ7JpKvnjCgnZ7X7LaWgdsh/h6dMYcsi+8qpKAcepozbzbbLS8qxBBlOmqdL/TF7NNfgve42jmhlZPzHK3/8uzybaatyEsOws8TEjS0gcTUH2Lo11nzhiG+Wvjv0thcmiP/YDa1uRtpxf+q5nGtfopQugEguQiAMBc3TBEyVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVsKdHZ2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVsKdHZ2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso11211155e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359050; x=1788963850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1snfACWgTZWHSW/RwX1o1WpObZwblmrobdH5d1agE/I=;
        b=NVsKdHZ2RV1yfPXmniFrHwnrMPxz7JTytolmWt6a5xgi6Zs9aTyeYBGj+RJ/13rqVz
         G343ZuKc1a6lbipJshubVo2Rra3BHa9O2231CfKw70d0uMeNA29SjBneAoMj3y7wGyUG
         zkuCU3M8gPOdwVNHRqaS/UOHWuIoEy5FM4bGXrHZ3Ehu+zA2VhqvawxN8GUdhqoF59df
         TfVvzVrCI4h2bfmh/OQdF1qHb3PTBVJMcaBLQip4Z0o2f1oD+VqSzzJlChYF+KcuJHBC
         P0t6vUf4xaRYAu76/pUHvkv3071f0wSUP0gG/2s4BghJfJ1P/w/Zqt1V2bazEKvk0ssO
         TjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359050; x=1788963850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1snfACWgTZWHSW/RwX1o1WpObZwblmrobdH5d1agE/I=;
        b=S0sZY3PvjyMl+fDbonYkBuG+7b7tgfaSufe4kXEWW2kanJCpmfziCYT0Z8aIJSVRyt
         R0rMqcoWdn6WBisXVz+s3c3CyezAgHeoBxpAgS/fhnliUpAA0VfZimAIJ7XvfCO0NFq+
         oMzKZKW1wcMSmGMkkQTM5+2Ou1Q2/aALCFNlfc3W+7vmzflLabBWRyGh9kFfQMt2BQxM
         3ZiSU1k/VfGBfFrW4vXKPpsFpPAYR+F1k/hb4QlnmlyyHPvbg2iLk2RvB3O0AnFm9lI6
         5ZEqpbXeRqKQmzbNGsyHcnmEBdnXeAo2zByn97h39oDJ0aqUHQW+cOEks+Tj2uG7UE1p
         7lQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+xhfBMzqi65d1EoIwImlzrE/pgjRCM3p3D7MKD/4QTDdBL3nl9DicI09Wa3iebzp0BSpnhYRs039+Joo=@vger.kernel.org
X-Gm-Message-State: AFuF++mhd75R0dHHOyRvCLSxu0Z/jImdH+Bl+jBg70w0i9GwliPfphrL
	vc/4Hmdl8zWzi30a3no5w5J7ejACwwkylYhdRKWJ17jIWve1nIaNkwq7Rrv/EQ==
X-Gm-Gg: AR+sD12KwSn9B8aCJflmcpTEz2P01Am9wPMKNlV2pzhrw/qNcyKL2ODK8S9/zJ8zUKH
	l9CW0rm2+QZyMwpvFWMLe3ZAzu7Rq7KjFAU7WapIoEbiDgRRh1sElzbni3Z+kDgp3TIz2gJgwrN
	uXjKF9SKHgZd0V3B28tDW7wDZ/jhxAGeAen2VVZ1P2Oi2xP74ffUyXTgl/n7qL72BvBFaYg3udj
	w6Nx38a/x7CcQfcX4idbOha7G2WETxVaNRSCppqshvjvL9pm/rXrpLlxt+HbjLWj4ZpODnlYE5Q
	15PqdzT7lhfFDhWN68hyKOoRfYaNU1cg+GSAbQyOoBAeRhEW8T/EZS1iqF6mNc4mebIojqn7vSG
	f2GmYzpD4zsMFP46SwVoBPJsNPE6q67RDEtREU9S0VEpwJowXw5ke68wltV2TpaXDw0uxqrCYDA
	t9ujtVbni3o8wOdG9awhtN9HrU4T64tDGYjiyLucR4HLIidj4112sHG/lXwgB3VDDiR75HoNWJC
	mj0t03QAC8ihU8fDjo00V9YY/f8h3xVc5GoCIgK7BF+uMxstZaDuYy39z4=
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr95435505e9.15.1788359050063;
        Wed, 02 Sep 2026 07:24:10 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:24:09 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Lucas Lis <lucaseze.lis@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 7/7] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Wed,  2 Sep 2026 16:23:21 +0200
Message-ID: <20260902142322.73523-8-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 (INT33BE / OVTI5693) needs its MIPI clock lane gated while
idle for the IPU6 CSI-2 receiver to lock onto the link, which the sensor
driver does when the endpoint requests a non-continuous clock.

The same sensor works with a free-running clock on the IPU3, so request
it only for the IPU6 variants where it has been confirmed on hardware:
Tiger Lake, Alder Lake-P and Alder Lake-N.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/pci/intel/ipu-bridge.c | 19 +++++++++++++++++++
 include/media/ipu-bridge.h           |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5efdcb9c8..12f1cccd8 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -16,6 +16,7 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
+#include <media/ipu6-pci-table.h>
 #include <media/v4l2-fwnode.h>
 
 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
@@ -49,6 +50,14 @@
  *
  * Please keep the list sorted by ACPI HID.
  */
+/* IPU6 variants whose CSI-2 receiver needs the ov5693 clock lane gated */
+static const u16 ipu6_ov5693_ncont_clk[] = {
+	PCI_DEVICE_ID_INTEL_IPU6,		/* Tiger Lake */
+	PCI_DEVICE_ID_INTEL_IPU6EP_ADLP,	/* Alder Lake-P */
+	PCI_DEVICE_ID_INTEL_IPU6EP_ADLN,	/* Alder Lake-N */
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
@@ -61,6 +70,9 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC0310 */
 	IPU_SENSOR_CONFIG("INT0310", 1, 55692000),
 	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", ipu6_ov5693_ncont_clk,
+				   IPU_BR_FL_CSI2_CLK_NONCONTINUOUS,
+				   1, 419200000),
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Onsemi MT9M114 */
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
@@ -97,6 +109,9 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI5693", ipu6_ov5693_ncont_clk,
+				   IPU_BR_FL_CSI2_CLK_NONCONTINUOUS,
+				   1, 419200000),
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
@@ -526,6 +541,10 @@ static void ipu_bridge_create_fwnode_properties(
 						     cfg->link_freqs,
 						     cfg->nr_link_freqs);
 
+	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
+		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
+			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
+
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
 					bridge->data_lanes, sensor->lanes);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index aca76ff71..eec8c4688 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -17,6 +17,10 @@
 #define IPU_SENSOR_ROTATION_NORMAL		0
 #define IPU_SENSOR_ROTATION_INVERTED		1
 
+/* Flags for struct ipu_sensor_config */
+/* The sensor's CSI-2 transmitter needs a non-continuous clock */
+#define IPU_BR_FL_CSI2_CLK_NONCONTINUOUS	BIT(0)
+
 /*
  * Sensor config specific to one or more IPUs, identified by their PCI product
  * IDs, with flags describing what the sensor needs there. Entries for one HID
@@ -80,6 +84,7 @@ enum ipu_bridge_ep_props {
 	IPU_BRIDGE_EP_DATA_LANES,
 	IPU_BRIDGE_EP_REMOTE_EP,
 	IPU_BRIDGE_EP_LINK_FREQUENCIES,
+	IPU_BRIDGE_EP_CLOCK_NONCONTINUOUS,
 	IPU_BRIDGE_EP_NUM_OF,
 	IPU_BRIDGE_EP_NUM_ENTRIES
 };
-- 
2.43.0


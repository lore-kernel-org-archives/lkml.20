Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677985;
	b=mBEAJMlL6ao7dM4TiKVQGKgqphGDQJHnTMWPZgC0FZX/Do5EWVlt6rhFt1Fq/2Trd6BF
	 qsfZXgkkrMVej9Gn2E906ErFnSidpksLVGzP0ySIKJFZ/tPIFTjMGiOg6X5rLq7+PPP8t
	 Czjmokeg9frQG7aOhziEjdZTIZVI51lyo36zBXTBgt3z5Kyv9nlcrgI36hNAVgI0PfBOp
	 U93tmNhUoIC2epgfa7nu7b7+dG1Z7K7VMGHQAiuVrj8ihonGXtsTfQVMXCapPn09xAvXP
	 88ALRyb/UdBtecP19Y2WRl9EaVM71z4ZDKLFBu55aCi1h6k8rmVNCRrIYCnvuxVhfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=;
	b=ArSrAa7a1bVMy/TN10Kxm0tNe3uoDtciSdMn3B7SEVnYro5x9DjacLxC8vFeH1uWck8B
	 DtoXxOlDCz2WQt+Fyh50ZzoIiwBSTBFH5T15NFTBar5GVo4Y5EoglrFPjE09DF132wYqR
	 6G36DSQpi+MyFUuaDb6lVbBAKOC9ybYe1sxZyrTv8q+DGc1UY1CgEDJFDIBaGGLMrB05Y
	 NXtgslaqmkhYkHrdeeBptdLWkvhmYWdWtaqOMecurXzzqznVqNb8ErWZeSb4aUWpraF1u
	 lUj5aNsPDxuCI3P4/j3+CJniQuedDz0o00mX7GFXkc1Hs+JEypWd6Mb3CPoV+NohPbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I73p09gQ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27304606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27304606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I73p09gQ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so4309319eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677984; x=1793282784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=;
        b=I73p09gQ/KJIuHA6CQVeOcWZU5MX4hhQyxC5umZbySnjBIbHOxucJkBoMaL5uH/JnD
         uugF2MYQWLR+kYmSjvfHBBMPvJgSTTpFyxsGQc88dOKTxpZf3eINmeEVODJhLWSkqNv8
         PTCLvp4Bg5Hsln9m38+/a4u3zyUMcVPFEe7f6L574dfDUY9Oh78vRkO0NCcvQdUZbbjA
         tTb+zORfip5y2Yd7VR5t5CSMo0Y77GX7ImGJ48KkcY6ExMR/Wz0NP8Z5WpVVRrhfS6/J
         kDYJKEq5+9XYtB7so9OV90V6c5AjXLVDblkl9+zXzkNSS2jTP5HxeI1a/yt6KtszH3mQ
         SV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677984; x=1793282784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=;
        b=YQAe7RusxMsIjm1JxXVbkUnLT8w8ByFEFGQXSF8khFZWtwDNurp6lsQNHzriJY+V2S
         nleqQd27QArPaagbK79rZL+eIILJxI1zCCMWWcHKe6D46lWacYFSea5h2N912UF0qtrO
         0JiDRai02LvI4129gNXfBJNzhbR5o7xzyoH+VlI35hFl70kcL2VlB3sX1zHxYEa0Cm5r
         +WR92vmQ9Ck7/BVL180LABcVX3kO4b2H0fkTDb0eUkj4aKBW1rjfJN7I9kDr8FhgRNKS
         xsd3zqKNfIo+N/mX8I3hz+y14L4DgzberJ+zZeYvrSsrOcIbwQcDP7RYS/YKUHhUPMr+
         bmqA==
X-Forwarded-Encrypted: i=1; AKwUvBydAdD5nI+CG4ESLzkC7luZk8IaBdiHkd/hJQ0FM2RV6gBxxWvL+s1DpYi+r9rtHL1MvhVxF8ZfSD8VDlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvmGO2FPraIDLhsf4uaA9ueyIT/7i7E9+toCxe4AHCO60zz1y/
	O+icgua/IwM9Aiz453prKQ/THf0udoL6lG5e8sS526vBiMNrEvwVeipA
X-Gm-Gg: AYBFou3tJBs1iFUPQs+eQSNgFT7AYe7fXHIYLb3mQrvNiOgZnp+lFryubqkNB6u70As
	+BhHInbc0twr3rD7bFvJk8EKXHECXwmpgYVdTC7+ZIi2dk74KweWLtz6lCsyR7daChGuRlCFqID
	zLZlEA67Aqb+XhjIsef2TR1A7cNG1WutoFkgC/TDX5AYhtpK5O3vybAW7gg+EoFY2I87cHH1mtg
	bpjGOqLvqBE95wSxxzm99tYiWDLAQTupVc1wEXIUaYogErUp7xPAIHhk73g6njTvkjxp2g2k4Bd
	dfj0vsQa4M2NNSSi638eb8mflnz1ktp+lhL+CFy8iqY6yDFurxDjMmseoFWVme8N2xP6jvQrkBk
	yTOtZLfgZFpJRD9xy97ank1fjupLtPzqtDe5dbr+/VGEtV5QIJ2vuDFj/3uVJeh2kNJmGvCI5oM
	ddgOD9ISZ7z1K0lM7hFO5ZNFkESEfv9fsMDjjujSdQmxsVw0zKieBO+XZV3emCtLTQZ5cVzka+K
	vnGVx7k0HG7KuPfhEwrVZFHOhGgdS6tLvfX5/0WJeVDhagFqa6+jzCtwQJevOB3NDCDxR8ORBhC
	sET4n77PUcvIzJkwTyepHyO3+46Rd08Nq5a4QglBYZ6ingHfknyjQ95QFXPUicc+o2XmoGKbJlV
	2QeXTBktqg/o=
X-Received: by 2002:a05:693c:810e:b0:367:941:c253 with SMTP id 5a478bee46e88-3674c93b096mr7616489eec.11.1792677983998;
        Thu, 22 Oct 2026 07:06:23 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ee5eesm14960559eec.8.2026.10.22.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:06:23 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Thu, 22 Oct 2026 19:36:13 +0530
Message-ID: <20261022140615.30710-1-kapoorarnav43@gmail.com>
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

ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
channel specs and lets ams_init_module() fill them for the AMS node and
each of its children, without telling it how much room is left.

For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
"channel@N" child after the 10 fixed PL channels. The binding allows
reg values 20..50, so a PL node can have up to 31 such children, i.e.
up to 41 PL channels, while only 31 are budgeted for it. Together with
the 13 PS and 7 AMS control channels, this writes past the end of the
buffer. Since the modules are filled in device tree order, the fixed
channel blocks copied after the PL node can overflow as well.

ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
far out of bounds.

Pass the remaining capacity down to ams_init_module() and
ams_get_ext_chan() and fail with -ENOSPC when a module does not fit,
instead of writing past the buffer. Also reject reg values below 20, as
the binding requires.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Fix the truncated subject line (Andy)
- Drop the paragraph about an earlier report, I could not find that
  thread again to reference it properly
- Pass the remaining capacity as unsigned int and drop the casts (Andy)
- Keep the ams_get_ext_chan() call on one line (Andy)
- Rebase on fixes-togreg
- Drop the bouncing @xilinx.com and @huawei.com addresses from Cc

v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have ZynqMP hardware.

 drivers/iio/adc/xilinx-ams.c | 54 ++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf5..7f0f7778d6aa 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -144,7 +144,14 @@
 #define AMS_PL_CSTS_ACCESS_MASK		BIT(1)
 
 #define AMS_PL_MAX_FIXED_CHANNEL	10
-#define AMS_PL_MAX_EXT_CHANNEL		20
+/*
+ * The external PL channels are addressed by their channel number. The
+ * binding allows the range from AMS_PL_EXT_CHANNEL_MIN to
+ * AMS_PL_EXT_CHANNEL_MAX. AMS_PL_EXT_CHANNEL_MIN maps onto the first
+ * ams_pl_channels[] entry, AMS_PL_EXT_CHANNEL_MAX onto the last one.
+ */
+#define AMS_PL_EXT_CHANNEL_MIN		20
+#define AMS_PL_EXT_CHANNEL_MAX		50
 
 #define AMS_INIT_POLL_TIME_US		200
 #define AMS_INIT_TIMEOUT_US		10000
@@ -1142,20 +1149,31 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
 };
 
 static int ams_get_ext_chan(struct fwnode_handle *chan_node,
-			    struct iio_chan_spec *channels, int num_channels)
+			    struct iio_chan_spec *channels, int num_channels,
+			    unsigned int max_channels)
 {
 	struct iio_chan_spec *chan;
-	struct fwnode_handle *child;
 	unsigned int reg, ext_chan;
 	int ret;
 
-	fwnode_for_each_child_node(chan_node, child) {
+	fwnode_for_each_child_node_scoped(chan_node, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
+		if (ret)
+			continue;
+
+		/*
+		 * Anything outside of the range of channel numbers allowed
+		 * by the binding is not a valid channel.
+		 */
+		if (reg < AMS_PL_EXT_CHANNEL_MIN ||
+		    reg > AMS_PL_EXT_CHANNEL_MAX)
 			continue;
 
+		if (num_channels >= max_channels)
+			return -ENOSPC;
+
 		chan = &channels[num_channels];
-		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
+		ext_chan = reg - AMS_PL_EXT_CHANNEL_MIN;
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
 
 		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
@@ -1183,7 +1201,8 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels,
+			   unsigned int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1210,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -ENOSPC;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1224,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -ENOSPC;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1213,9 +1238,14 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		/* Copy only first 10 fix channels */
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
-		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+		ret = ams_get_ext_chan(fwnode, channels, num_channels, max_channels);
+		if (ret < 0)
+			return ret;
+		num_channels = ret;
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
+		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
+			return -ENOSPC;
+
 		/* add AMS channels to iio device channels */
 		memcpy(channels, ams_ctrl_channels, sizeof(ams_ctrl_channels));
 		num_channels += ARRAY_SIZE(ams_ctrl_channels);
@@ -1245,7 +1275,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1283,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child,
+				      ams_channels + num_channels,
+				      ams_size - num_channels);
 		if (ret < 0)
 			return ret;
 

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0


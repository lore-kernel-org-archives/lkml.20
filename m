Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623245;
	b=B4D8FLsXi25aF7nM56CqVgc+z1Xf/xdUTXh/Hi8NJQYuZ1vYfJn5JlLujxCt7nH/EL9P
	 rDpqkKmA9V8qx5e69IgsE76s8Y5VlI15slqVnCG+Bkl2r4m4vEBWm1GGEb/hZIyRk4pSV
	 gpuzgoqE1EuXfIVkddU6P6Z7bWDVHpY5317EhIInDOAES/u4KS1oqaru916NjcNEC3j0n
	 KszuFh9yWcIHkSxjyiFBBTLjGNrVLiEttWuHJty8PaWGda9Qcjhl4S5b4P1PsZdBFXY61
	 6faovI6Jv36MEZ5t4SI5r1xBpggqpHnI6BkhD43VuoHKWnmny1nkn5CcfRlhZXtlSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=;
	b=sCVPx3E2+5+5RQsZYfcU5aRHDPfqGUk3gwzhZfisyQSYtT5He8za4z12cCPKiFjynC1o
	 MHxL5Vz3m2Uk2IVoWVehGXJnBg6oDDPtUn2qLAPIcOgwGEWuTqmK2pdMTY29cUFoLikFL
	 u+y8Vge6sOwAM0SiMXe4xeTkHq389r00aJbXZbNJhl9JhVIsUqB3lCG1Z6PWDVTZ4CLdx
	 mHAz4vPFrkuju4EWHwQh08fff+RU0ohCItfUfo46ih02Yr/exw3x2auldmDnwOQSDT+zY
	 XF0Vu2cHL3w6lvdCzOQlcpsnqWTjZmEYdHb0DYqOTb2u32kD7T6yS8/HFgFqn9mS3OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YvPKHfMT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YvPKHfMT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo1437606eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623244; x=1793228044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=;
        b=YvPKHfMTH8xkUFhhJ+uX4L4AW2Y6H/f2dIb6RgYs29EEX/7AiY2hZ192tuLRv2FwKZ
         4JOWRCBKRcJ3ilpIuZno2sMLiYqHd3Yr4Xy30VOJg7tQHo0zH/IRm3Z1gYKXiT+QBk0/
         /Cr/gO9gDYKQEjXpfsRkRtAV/ZJwVW5DSJ8KquWPkDmiRIWMkMzToPEPXJOY9Xsb9BOt
         XrvrKJtD+jxjsTMxb4MtUjczburSVjFbsvLJN32tQ8DJ3DPhkO3TBm11wbD0WWcicrwM
         6cz5IDC3A0aImPA3zNASlM1dSb/7xNJKGw0kXkTZ/f+wIJaY38M7Sm8y+wHap7J6Ahud
         q+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623244; x=1793228044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=;
        b=QI5SDYBNTO2QwhC0NZDrforOw3uIPcM7tDw4PkUveSSGr1Q2bKsGukYZEZaOGk4UcA
         WweyJjnOoUz0tOBvkPJgk/iOrhbvRure9B+LN3A5g4jz7ra3mt3jDpJaWbeuuFgNIZev
         g/UVfhQ659yLs3K1csirY+obqe/o1KQ1l1WFa+LmHNgiCOi/kVzG42F3xXvvxCUq9Fip
         /PXdUSIjfObLbZo2JURDNV5/vX9vIGWmU49U+GQlMJvWn3H9Rv8q/3Bgolc+EGemqyvX
         tzfNvDJ34MBs77ftSuHllMN0kss2tKV3ioIISHIq27VtroVnItZQ/HCAyQLIkHsL1RCl
         icMA==
X-Forwarded-Encrypted: i=1; AKwUvBxg8kOBmKk6f9M7DZHz3Y4lMe0HSnhuBO1xEsav8/gtqRD+pYpwZmyf4KekHgEE9hZThK0IlHOlFbHbIVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyOodgrHvpYk16dqr622h2LIRTyL1JGuP1HV38RMZvh6TmJZ6c
	TAnvo+qxc3Y8boHtJH8jZAsHx2od0TMeGLxK67Gd36leeCLRaXrszlRK
X-Gm-Gg: AYBFou0EfYo+239w2cQIwRbtjAF1RDjp6gOd7JksOgVtV7F488BiYS9spK40OUhqwU+
	Dw8fh1jHNM1+LX8xbpJwUdFMkcpyXOAaNXjI2GK7lq6dBZ01huG2cdJX9arQw9Ct7/JaR/gxz0y
	SMvre+9UWlQeQx8E4QfPjHzZbtV1/rWzDyjkZQF+/lbtjQOAKG6fg0mNNddV6tgtBpGQyyBvNNs
	YEj62CG65/MPl3w9RApk0cubIF8R7jL8OULoFZIsxV48Y8Zrn1jbZtRk5dZNmA/zNUFWr/GjODZ
	kP4/SgMpqaBnueKhgqgzmOVQbtPKYekEWgGtdHCe5tNSy8fzytsX99XMB066pHT5LEAbekkbu8I
	mXd0xPIXD1jJVNaEptmwShAiPheq7/FqAWFAwnI5Y9x1jbci+bcVQdiJXiFQVWaLSAVMjMo0tmj
	eqeig3kpkbYRZxZzfGoCZ3g9M+PWkMB+4Qrz7gU1JMDuek6YilPB9ziysiVMyl3rL+cTqY9cy1Q
	FUXlNhLL6wEGK+hcPzVpMX2W88+6Q2P2pXnXke6K1nmCbQExvOHKyRxP5P+sR5Nx3LsV8gFKw4R
	8gjsVr7Nk2Gw6VSgiFZ0gJL8fZwZVSR7EZwp4IRFYsROXdVIotUP4CnuNsyROodEFIQ0RrdiuLp
	LwJnpr1a8VeA=
X-Received: by 2002:a05:7300:d58a:b0:35b:9f06:e383 with SMTP id 5a478bee46e88-3674e450e8emr5262441eec.8.1792623244093;
        Wed, 21 Oct 2026 15:54:04 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm11999808eec.15.2026.10.21.15.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:03 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	"Conall O'Griofa" <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Manish Narani <manish.narani@xilinx.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	stable@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when
Date: Thu, 22 Oct 2026 04:23:34 +0530
Message-ID: <20261021225356.625288-1-kapoorarnav43@gmail.com>
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

This was previously reported by Weigang He, but the thread stalled
before the changes were picked up.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/xilinx-ams.c | 57 ++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf5..0077a88da52c 100644
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
+			    int max_channels)
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
@@ -1183,7 +1201,7 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels, int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1209,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -ENOSPC;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1223,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -ENOSPC;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1213,9 +1237,15 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		/* Copy only first 10 fix channels */
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
-		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+		ret = ams_get_ext_chan(fwnode, channels, num_channels,
+					max_channels);
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
@@ -1234,7 +1264,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	size_t ams_size;
 	int ret, ch_cnt = 0, i, rising_off, falling_off;
-	unsigned int num_channels = 0;
+	int num_channels = 0;
 
 	ams_size = ARRAY_SIZE(ams_ps_channels) + ARRAY_SIZE(ams_pl_channels) +
 		ARRAY_SIZE(ams_ctrl_channels);
@@ -1245,7 +1275,8 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels,
+				      (int)(ams_size - num_channels));
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1284,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child,
+				      ams_channels + num_channels,
+				      (int)(ams_size - num_channels));
 		if (ret < 0)
 			return ret;
 


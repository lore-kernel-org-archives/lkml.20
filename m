Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB998379998
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790402108; cv=none; b=jTLn24UIbdHel+rXutCF6vSdndRGkGWYIikb5ccUjnWa7cLCVIpd0eBkdBBbEQ/gZQHjl8CgHjdzDOZAdp7V5GKN7J82JsbkJoBPV79oeYAvFKMg0Ks9xIc1nyrRpthgRh1urMHPCh8DdlIUDkSQeExDNJ5r5CmMrY2GH2ylFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790402108; c=relaxed/simple;
	bh=3WHZje11yMZBZBXyTJlYcEDav1jBX7oSpKCSUN+cI5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1x2P+xefwOGbSibCRr73Rc0yUc5UL0JJq81Pm2SkahwYivS2ykq5hUWli5aWOdXLwuzadbDMhX7vpL4vh7ZcECJZI3r7Mu2K4MhcwnS+cZIVynYNur1cOwsyq9Ag/6JbwdHM9Wa1xqATidItI2IR17Qu+vodIMopFvnVSakOT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHfT+KiX; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHfT+KiX"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so752557b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790402104; x=1791006904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/jLk3hOfvplWvnh8rdzJHMk4Xuu5RA6BKKGh8ixgRc=;
        b=HHfT+KiX1nZdmG1IoZJN3DFiOb7T6TY5o3deob0OFyOLlqWgTObMGxLK0kClm64k7m
         lP0LK2LJkWPtLbGoKV/kiPF0UiyGdHSktqqrsMp+5IDDx7I51qkhK3CcljAj6BJpDAPX
         vH3dzoTW11H/hfCYnwhSwPnt3A/2pScycJOkbmC+MwyvM9Wqpn1+6aujfHWDeVRSwjPE
         AsuutkrKosgeh6v3l6PKik1pEj5UuzQOxmBFS4E6LOuAZWuyxiPkrqwble7uQb2PFL5l
         d8ctnnx2PhWJIRhDmhxsbEI/TknS9cuzL7AlLfzc7aIJul8IY9ukJmovZTeuHkqoD2N/
         bv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790402104; x=1791006904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/jLk3hOfvplWvnh8rdzJHMk4Xuu5RA6BKKGh8ixgRc=;
        b=M6I6ilpcL1ClI/lX2b2NRYA6if/V3IQk1BXL0rURjDRD90yt5yZb/enHEVP01Tty9A
         2ywIJDUOCxL4m68qm7E8o3yG3LZ7Hf7N7A3htUOu7k+2iB3Luv6gYfNC+ZO297gLZDCT
         6uZZXDZaJVynKGMJYppo/G0vlY2dZrRTROJVssre4cpzTYQnYRalCv8vF/Fs5B2JxzYb
         +MEZFX+BPtAjcpeSX8FrVOBlRwJgB/nxEmrdwpeSPCr9oQtrFn/SYxVqlnaDbia4hqOk
         trORMTmzP/t5xqDyqVbXo8E4UOHulSBMB7ENsjLxhfrAWCegXQoeTxMO1DUubJhos44N
         nGDg==
X-Forwarded-Encrypted: i=1; AKwUvBwSnEAZCTVyrGT6rB4WOcRXSdgiJ3s7vS5W9KO9Cte++mnZkSc0VrJK/A9qmRp06pRSu9EGw8m06nnBoyc=@vger.kernel.org
X-Gm-Message-State: AFuF++mwLQXfjEi0uC9Y98TIz+WLxc33h6InnsxkCjxZ4QfrVbS/VxWU
	svl2D2MBTbkySAJKULeeVYpjhrsLGb+GyNaimCaiwq+ON099gcjMfufG
X-Gm-Gg: AYBFou22sVTkXi+BmqQ24L8zG0kKewUavPaFdLCEXbsW3cXSxF/JXfelvtJxaGXt5KH
	gLWP91iKK0/OSlfOJ89bCY7BRcotC1j86o67Sx/Fn1qcvN0CpYkrbOOQE/XaGT96cmXsxmelu5+
	jJ1lY5OjFLR3DiWcT4osZ+Z5W1i0Hf3GNmaMHTjQ1W5NJ48Tt+9NJLebDYuvd94FvIKy+4jQZ/F
	k6D4Ksb8iJtGjnFt9LPDsHWwJjPvvbF1rVG1/KO5Wiu0JkQ2+YhyqGa1glOHZwhtuTz9P5B5IfY
	IDjt36N2dw85vPWOQJctPGtMdcZXCRMgNifWrR1Lmpp2xETGVBGE90KEehIJ6/cLa4s8FuzS6TZ
	0G2Ml1NhtyQmzkaYVeMOcXhY/EVAEJFPcXs80l4HxfzS85C7B1kSv/j2J2Xh6t3lZLHM1bVjyk4
	5U+6jMsg2ZnFJeLcQ6n3Y5pkCX9TBWlfEGJSWlWhevzAYCIF8yhDr5UlOPoupM3hAN0Pyz0o4JW
	4YigGFIaW3sTsqUA/2fJWvwfy0wmM/vNzwQbqE2SCrwd9g2Qas2dfBFHlwvikIEu7kVHKq/Kpg4
	W+4dX4DzayoXmftKNy4lf8qScdBd4Y8QbxzdICGC5JONEKvP
X-Received: by 2002:a05:6a00:a203:b0:878:3538:8f7e with SMTP id d2e1a72fcca58-87e9f82210amr5561877b3a.44.1790402104209;
        Fri, 25 Sep 2026 22:55:04 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm1964103b3a.33.2026.09.25.22.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:55:03 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Sat, 26 Sep 2026 15:54:56 +1000
Message-ID: <20260926055456.3289189-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
ams_get_ext_chan() and fail with -EINVAL when a module does not fit,
instead of writing past the buffer. Also reject reg values below 20, as
the binding requires.

Found by static analysis tool CodeQL.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 allmodconfig, W=1). Not tested on
    hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/iio/adc/xilinx-ams.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf50..373a9e799ee63 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -1142,7 +1142,8 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
 };
 
 static int ams_get_ext_chan(struct fwnode_handle *chan_node,
-			    struct iio_chan_spec *channels, int num_channels)
+			    struct iio_chan_spec *channels, int num_channels,
+			    int max_channels)
 {
 	struct iio_chan_spec *chan;
 	struct fwnode_handle *child;
@@ -1151,9 +1152,15 @@ static int ams_get_ext_chan(struct fwnode_handle *chan_node,
 
 	fwnode_for_each_child_node(chan_node, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
+		if (ret || reg < 30 - AMS_PL_MAX_FIXED_CHANNEL ||
+		    reg > AMS_PL_MAX_EXT_CHANNEL + 30)
 			continue;
 
+		if (num_channels >= max_channels) {
+			fwnode_handle_put(child);
+			return -EINVAL;
+		}
+
 		chan = &channels[num_channels];
 		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
@@ -1183,7 +1190,7 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels, int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1198,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -EINVAL;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1212,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -EINVAL;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1214,8 +1227,11 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
 		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+						num_channels, max_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
+		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
+			return -EINVAL;
+
 		/* add AMS channels to iio device channels */
 		memcpy(channels, ams_ctrl_channels, sizeof(ams_ctrl_channels));
 		num_channels += ARRAY_SIZE(ams_ctrl_channels);
@@ -1245,7 +1261,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1269,8 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child, ams_channels + num_channels,
+				      ams_size - num_channels);
 		if (ret < 0)
 			return ret;
 

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0


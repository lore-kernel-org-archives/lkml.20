Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792781823;
	b=AlylnPN/M3pDPbUBwdA+JSGKTFYiu65vpN3yPo9kXKeeinnfcT8Ixw7cukxwVc5R9MGc
	 DvVtMfgnQJq0An2Co1S/33OVjgSg7Cbeoml3KdD9UQ7/QRoxIYLO/59jc6FXDyuLsDUkV
	 u8SuU44iUMhJfRGVfGaLb3bDKMPhzHU+H7UbvLU7j2CvyxsOe2o1ob6xVEfFK23tHKXmf
	 lEi3F8tzQlmHTKZM/gKdMtgDukmy/hNN3Ktuh5hBCYqhGJI1/pQdUa7ZMpya0yUcKyRO1
	 P+3CNuIuZhpnV+TfWr5GmSzG7V/yl6+F2yUXnyVbJnqYIiTldUdaaWNv7v+xIkcq+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=;
	b=gracGpGGiDX/TZqo9YMNFAj/fRn9hDQLZdThVPemJt0Jjq0n42k/RNOrtqfnfWCOnDA5
	 zcnfSHroLslrXfUtwNCyEg36bkQRxJ6W7nFPHlDx6UVh60+banwuVKS10NZ7aB/y4XJNZ
	 v/uKKnRcfgWnRlvGFAQkVIlcfuRCv3BZJMK0wzQslFr265yfbBsbqzed0Rrk8+UyHvpQn
	 A3bh7lqpvfOawcyXUva/SPBcDTUSOCAuL1VrDn7XQ4P+Xwg2Qjd4UxGs3j3av5fCCQfgr
	 lE5AqhsAnfN2y4hBCG3xrgKk4vyGAFtSDLI9rJm+yF1psXdua7L6GFK1PNl3PGiu3vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h1a2HoFB;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCB8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h1a2HoFB
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1923570c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792781822; x=1793386622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=;
        b=h1a2HoFBhB90ULo62DPYUdFx0VbproVRlBQpsPUL/4hrs9G6K58Lh2Ifvb2Ge52K9T
         1hIz7rTRHCkklodOUST+fRNVWggtny6YDXlL9u5/CcQIokKPAMl+HqOJhTmyIBQpt6MF
         GP6ny49KGymaaFif6ND1MJM87WE0zs5xhaygHZo1fPb8sJjwgGPKXe0j0yUCAO9nPmvD
         /R+PjUElHFFwInh+Mmcm5iMzDqJB6YXE+a4opx45aAWU5NlsudUk0iCZ+fouI3fETe7f
         eTGdW08XFZ+/UJU1OL6nd+zEOwSXpGvJoqV/5SFZw98Ih29FX5EbGMXswA106nKd6/BY
         HpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792781822; x=1793386622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=;
        b=AhgepP+mC2ntQChpJ3ZwWJJXE7SymSRAnnQ80dy2aMgoIcv/H7SzN8iIEh89nkgdLt
         C7WudJ3qjq71JQlLKCHY4Rxwd+ICor76XgjmVH/Ubd4+3qpbPjC/NvdaLiAvE+l1Aq4B
         /z5/onw4YCMQTOdrRwRwznT9mryahI1EkdiFeFDL1Kn/OrkPCTA60nkQhDNvXnSA1Ghj
         DC5GNNi7dtL4jnajSfppuICnQ6aFSTE4PLx0lFh78AgseX8h+ERT/8Hb3c4RSFroamHB
         Yc6jHV4looEOwtF8rgCHhjZgpTwsv2Nuw3JM4nr+LGlykOHzWfGoMG6mHLmZzvOWaOnB
         dqpw==
X-Forwarded-Encrypted: i=1; AKwUvBz1H6EKMjAijE9cD6RbBuGiih5XnoTCowlF1JFr+FqfxWH06Sbw/TbfPdiDPd8iqYNk00/rNt2T8p0rX7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvA+WsZvLFnJkZPtOVaXopAGsSdI/h5meFvdpf06aJiRMvZFtD
	iOe56SHpDpNr9MxnkfOKDj7ryhZxnJEoMLmaDqSMUqg0y+4CNV/PC12Q
X-Gm-Gg: AYBFou1wLfIwVH3ezz9f1vpiCr4o8iLhX49rJ6cstCiXdMk40m63k7BVFrknw+srmnX
	DK24tuyyQRquFLfR3q381saINNDg5Gb5iYoBY8bwPvbHumIEpYdDd/pcm0XqNnQz1U7ppJMCptm
	JVNjALaDscHCIO504u2SsygnEFYb3cOgaGt72FBiFEKMtULbFt1KqjTOigSoKfbi1W0quLxINcJ
	BPMqIAhXWXjWF8TCLkm/EyPSvg80v9YKXsHzY7ScWEJMUuv6g7PjnGtuzKbeZA0+f6e5tyFFaie
	8niMfhWsqDxo8QTLdteln6rvlbIk2eYElM2rvT+c8Lei/XzStA8QBEpHL77+Sa8rZw5qyOAw5AM
	eJSy3IIyeNe8H1/yeB4oj6pQ2TBpPBHymxlGMZ9o74+beNYhlTisAsW334r7VWjwh3bu3B8qAQ+
	kONBb2XvgHQexlxfqjOhgzP4SchAVWh/5mjobqIe2avEFeGTsh3dkCOYJCVnSCJC7ziYGY/mGT5
	In0LOfiIuAYLdXLwMlVCBv3fPeJquDGIMT6+d3j/kjXcwplusSClb6eRDr/U4XKoP2cdIbApU0z
	nkyP64Q48KhkRqS3gm1NF2R/7PJxohs0n+Cuov9C2JeuX+Ako/DuTSpAX8Ba89+WIUIzH5W1rAw
	rZaOQRTKY678=
X-Received: by 2002:a05:701b:4587:b0:195:238:b632 with SMTP id a92af1059eb24-195c72d8a3bmr3336033c88.38.1792781821511;
        Fri, 23 Oct 2026 11:57:01 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm308388c88.21.2026.10.23.11.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:57:00 -0700 (PDT)
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
Date: Sat, 24 Oct 2026 00:26:48 +0530
Message-ID: <20261023185652.195025-1-kapoorarnav43@gmail.com>
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


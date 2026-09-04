Received: from outbound.st.icloud.com (st-2004j-snip4-11.eps.apple.com [57.103.78.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045D8481650
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529541; cv=none; b=YJrINN69XdEJOe8WfMQiHfy2d1SBj6ahb1AYY4hjcrrVLqznsyqygmjaOSvKyH4eZYcfpUqcpdJX1mBW2AF5lOsuySbiD0Q5TjxelImFwXpGWaogRqvKrJFfKmVgsjDZ6JeefVEvr87rq2xDI179JfDVubfxqXuizyhkG3Pivus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529541; c=relaxed/simple;
	bh=l2BcgrnR4trAMrLF00/7bQbtJDHRq05zFROr9Lb6Qqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaP6Iwb7r+0kE9Mmmu/iX54UYghpkrPSeF0kSMQGRoETYHU5wdWBEKIZdb4NJxQm/pvOqgCjwbHrVV+5bHS2TVOWj4/aVdPz3hFlaLq7pfcEebbRttzCGLw3xTS2aYGoGSsupkhBFDSe3LIBcs4q1xfsy24L3b8xs/ZsfMJBXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=YrIQ1YWN; arc=none smtp.client-ip=57.103.78.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="YrIQ1YWN"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-9 (Postfix) with ESMTPS id 0D463180040E;
	Fri, 04 Sep 2026 13:45:33 +0000 (UTC)
X-ICL-RepId: 01a06caa-e39e-7ca8-935b-a277ecf51f3f
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBKHVwPXxxBDUwdXAFaEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDlUXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQABIB1wEXwdCDVYGVAJeC0gUSR4dXg5AAlw4QwRZBFxBFx5BUxcfSwBcRVAYRB9dHWYcXABWAlw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1788529536; x=1791121536; bh=ulFeF7Yf0kLNH7l0sGo34JSosacDywEjcilC8tQk6eI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YrIQ1YWNV1Ge4KEPAl9NJfBmP/dDUjpEMAtK0f83x716DosYSJD9LPkpBO6rSJJJkTy+vIc4gG56P/7y0jm6O+ZjNJhXddlytVVvaNUKsidEllBEpmU4TAiCH3EututEjupukxLrEJrtlQPn2z0V+b5C9TnTdQvEoE1eamPKW+MrRXKqab2U6+iUGqyeSuuFV2y5MACDVl3NqzUnzjGTp2Vo+a5f8HX02xjdTT91vMqseKQbekKA5iOyhZtuQTHAgZi+hXaICZn6YTRHyZi8jbuO/2CQDcCSnK27sWURDNTyqmmFKot/vUudHAN+dIiDeULlz3mmjd/Wt9DDlV4NNw==
mail-alias-created-date: 1575045973000
Received: from 2a01cb0a80256b8bfbb9c8b6ea0a448d.ipv6.abo.wanadoo.fr (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-9 (Postfix) with ESMTPSA id CCA1918012B8;
	Fri, 04 Sep 2026 13:45:31 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Pierre Pinon <pierre@pinon1.fr>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov08x40: Implement the selection API
Date: Fri,  4 Sep 2026 15:45:23 +0200
Message-ID: <20260904134524.595598-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNCBTYWx0ZWRfXwxA3FsQ/J3tF
 gFlBeP/jTThhAesJEwJbTIIWLGNiyaXjzQpAmp+RkqfWbJ3KoDSuJ+dH+4EaaB9XTizGEjHU65P
 19wU+k+nSrE9/OL7vLRgDUWYP81uGINO3o7aHL4PqXSlL33tuGrUvj3PaRc7d7g8exrunuWQf4S
 2xxCr3kq/BcftaQhsKgnk4l4JwHlhRYmNq79JRUAmwt0mLcK7A2fPlJUd+imvJROtmA4wgD0fMm
 V/QYIqN+xVK6kyH5v+XoM6Zfak9594f1llqzMYmsqQucK4KaNzc5Kdr5A15rC2UHscIsVWsT45P
 bBV5ZuBOdEIb38ZURXEzpS06sxc4KUbeU2rltSjz3gJfZ3JLX8hGqe568M+nZs=
X-Authority-Info-Out: v=2.4 cv=aqW/yCZV c=1 sm=1 tr=0 ts=6a9acb7e
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yJXyil-0ACudoi44DJgA:9
X-Proofpoint-ORIG-GUID: LaQG4DQX-O1EV0I4oaTYjM53cuN5-5X1
X-Proofpoint-GUID: LaQG4DQX-O1EV0I4oaTYjM53cuN5-5X1
X-JNJ: AAAAAAAB0zvTdTDvlqBDMJbU+eM4V3OCmUHWt2ReLgzx37i+ghj9sq+ZaOMVklBB60leBwdpy9bya/Vdb2RrSZ38uRDUz9+KrI3SRNFk5JyyLk2rmxrJGmIUQmvgYggloTvf95+LvylymV/pCO9Tk78iJi+wzu59eqKZLUz1HuvU+IAqa+E6+0qDR9UuckXK6eqHZte/AXTwS/Yh5VUnxeJ5Rw1nu7hfHRke+v28AWN2m0Bhobmy4a/6MAiMNqfubWvZGQStHRKZlUR3efXyHBtoxlEpYy8i1OYCwa5XSnWMWi5TylWmd5Kx6CeppLhXuHEx+i97gWk3oqaIGu+gzTEJdLiSWG4fdop6y9AcLV7mbXxLEGgj0+BpJtdNhXmG2OXZBSpxA/+OHqMeIhvoKfP9CaPM9/msNqZD8qqfSmc7Jipu/loA6vhRTQGaVLyo4d8jizsWs0t7swTqSny5WXBzRB3J45w9dmxbdrnDtHPZc+GPkPUIP3u0GuC7V4xR/+1jXuTYXTh0KPP4wXC+BBgRPRvgBkxo3LO/EEjYvjjeH2cC8cj3iZgYgHnF6YxRTBOIH4bgN/VD3xCQFZ4UyI/paaYheH+p5PpXLq5oh9Q04Hr+vlF/JrO827rguxO4VTu1+NV4aYTGKO0kxTZb71fUcpMH/zhTiWHHCcjf75WCPYAwJCcb5Gx9V+iZcc5x4I4qCO9B2hzUizvbA+vQhVMqNP0mgRsl7XJqcaSWBErTpQ4cSTiPjTjVq3+t0zcp62w7lSb8o/zhxQsnSl55q06yD7262cpAKpNfacayICNoL8BjjvGiURAM5PC+dktn5ZCUKfwCl3flzRkOlso7mcanytP4n9cIE00azg7ZSHJiqoWEOcrHaaRlT6FmYatFx4h+yG1l4HrKocruo7c1NnmEJqq8y2ci2ReVwCYap0Z8pBMNsfSrgLtGBFS46N8wjyddR3cMTeR6fJB75Q1ES+p7Bvq+vv2
 vghWI5yKvaZyZwo2dKSxt+v3IQwsCZnGR/sYIKZlZe1mmQEE06RvbSbiMOOGg1QzNvZZvvVJ0culB5quoCs9y6B8SLrEyniuwv0ViwLV1v/2p5AZ91IIFC7YgqhlYzSnKkYhwbo9sWBWhnHnMc/K9T/oWESJv35QqnJ7aCZAIfFqoBen0ENHbdkRdBLWsR7IQmcQXmUU4fs/BpqVtu4SQgWwG9XMJP+f8adVlxXMPtePR+cLOBavOFIc5f4EQOjzK2zuAevjnoC59ACaECT83uIC/W3Kgg5//MzHM+C2SR2vM33vBGk2P/NqA946vzZ3E/w==

ov08x40 implements none of the selection targets: its pad ops carry only
enum_mbus_code, get_fmt, set_fmt and enum_frame_size, and ov08x40_open()
states "No crop or compose" outright.

libcamera requires V4L2_SEL_TGT_CROP_BOUNDS, V4L2_SEL_TGT_CROP_DEFAULT
and V4L2_SEL_TGT_CROP from a sensor driver
(Documentation/sensor_driver_requirements in the libcamera sources), and
warns that support is scheduled to become mandatory. Without them it
falls back to "crop == active area" for every mode:

  'ov08x40 18-0036': Failed to retrieve the sensor crop rectangle
  'ov08x40 18-0036': The sensor kernel driver needs to be fixed

The practical consequence is worse than a warning. Because the crop
rectangle is what distinguishes a binned mode (full-array crop, reduced
output) from a cropped one (reduced crop, 1:1 output), libcamera cannot
tell that 1928x1208 and 1928x1088 are 2x2 binned views of the whole
array. It therefore never selects them, and satisfies small requests by
centre-cropping the full resolution mode instead. On an IPU7 platform
using the CPU software ISP, that path is unusable: the debayer window
desyncs from the real line stride and every non-native resolution
produces a uniformly saturated image.

The mode register lists program only the low bytes of the vertical
window (0x3803, 0x3807) and the output size (0x3808-0x380b). The
horizontal window (0x3800/0x3801, 0x3804/0x3805) and the high bytes of
the vertical window (0x3802, 0x3806) are never written and keep their
power-on values, so they cannot be derived from the driver source. They
were read back over I2C from the sensor on a Dell Pro 14 Premium PA14260
and are identical in every mode:

  0x3800/0x3801 = 0x0000     x_start = 0
  0x3804/0x3805 = 0x0f1f     x_end   = 3871
  0x3802        = 0x00       y_start high byte
  0x3806        = 0x09       y_end high byte

Combining those with the per-mode low bytes gives:

  mode         crop (left, top, w, h)   output       binning
  3856x2416    (0,   0, 3872, 2432)     3856x2416    1:1
  3856x2176    (0, 112, 3872, 2208)     3856x2176    1:1
  1928x1208    (0,   0, 3872, 2432)     1928x1208    2x2
  1928x1088    (0, 120, 3872, 2192)     1928x1088    2x2

The margins are consistent throughout: 16 columns and 16 or 32 rows for
the 1:1 modes, and exactly 8 columns and 8 rows once the binned modes
are scaled down, which supports the reading of the high bytes above.

Report the full readable array as 3872x2432 for V4L2_SEL_TGT_CROP_BOUNDS
and V4L2_SEL_TGT_NATIVE_SIZE, and the largest mode's crop for
V4L2_SEL_TGT_CROP_DEFAULT.

Two caveats, since I have no datasheet for this sensor. First, only the
3856x2176 and 1928x1088 modes could be exercised on this hardware --
libcamera never selects the other three -- so their register values were
read directly and the remaining rows are derived from the same measured
high bytes. Second, this sensor's largest mode reads the whole array, so
CROP_DEFAULT (the active area) and CROP_BOUNDS (the readable area) come
out equal; if OmniVision or Intel can confirm the true active area
differs, CROP_DEFAULT should be narrowed accordingly.

Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
---
 drivers/media/i2c/ov08x40.c | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4763..3de06e19803c 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -17,6 +17,15 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV08X40_REG_VALUE_08BIT		1
+
+/*
+ * Full readable pixel array. The X window registers (0x3800/0x3801,
+ * 0x3804/0x3805) and the high bytes of the Y window (0x3802, 0x3806) are never
+ * programmed by the mode register lists, so they keep their power-on values;
+ * these were read back from the sensor as 0x0000-0x0f1f and 0x00/0x09.
+ */
+#define OV08X40_NATIVE_WIDTH		3872U
+#define OV08X40_NATIVE_HEIGHT		2432U
 #define OV08X40_REG_VALUE_16BIT		2
 #define OV08X40_REG_VALUE_24BIT		3
 
@@ -151,6 +160,9 @@ struct ov08x40_mode {
 	/* Exposure calculation */
 	u16 exposure_margin;
 	u16 exposure_shift;
+
+	/* Analogue crop rectangle, in native pixel array coordinates */
+	struct v4l2_rect crop;
 };
 
 static const struct ov08x40_reg ov08x40_global_regs[] = {
@@ -1232,6 +1244,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3856x2416_regs),
 			.regs = mode_3856x2416_regs,
 		},
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 3872,
+			.height = 2432,
+		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
@@ -1247,6 +1265,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3856x2176_regs_800mbps),
 			.regs = mode_3856x2176_regs_800mbps,
 		},
+		.crop = {
+			.left = 0,
+			.top = 112,
+			.width = 3872,
+			.height = 2208,
+		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
@@ -1263,6 +1287,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1928x1208_regs),
 			.regs = mode_1928x1208_regs,
 		},
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 3872,
+			.height = 2432,
+		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_BIN_MAX_MARGIN,
@@ -1278,6 +1308,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3856x2176_regs_1500mbps),
 			.regs = mode_3856x2176_regs_1500mbps,
 		},
+		.crop = {
+			.left = 0,
+			.top = 112,
+			.width = 3872,
+			.height = 2208,
+		},
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
@@ -1293,6 +1329,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
 			.regs = mode_1928x1088_regs_1500mbps,
 		},
+		.crop = {
+			.left = 0,
+			.top = 120,
+			.width = 3872,
+			.height = 2192,
+		},
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
@@ -2055,10 +2097,38 @@ static const struct v4l2_subdev_video_ops ov08x40_video_ops = {
 	.s_stream = ov08x40_set_stream,
 };
 
+static int ov08x40_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&ov08x->mutex);
+		sel->r = ov08x->cur_mode->crop;
+		mutex_unlock(&ov08x->mutex);
+		return 0;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = OV08X40_NATIVE_WIDTH;
+		sel->r.height = OV08X40_NATIVE_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = supported_modes[0].crop;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov08x40_pad_ops = {
 	.enum_mbus_code = ov08x40_enum_mbus_code,
 	.get_fmt = ov08x40_get_pad_format,
 	.set_fmt = ov08x40_set_pad_format,
+	.get_selection = ov08x40_get_selection,
 	.enum_frame_size = ov08x40_enum_frame_size,
 };
 

base-commit: 26cf1fa3d28a98a0cb08ae1929c71f681e5d2dcc
-- 
2.55.0


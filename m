Received: from outbound.ms.icloud.com (ms-2004h-snip4-4.eps.apple.com [57.103.74.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEB47127F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934582; cv=none; b=HSfASC5XZoY6s8gZRQmPoL57tMFKqyvTnYTlIbQZkLjJiPbujgqE373faZWZegnhSz3lzSGYdeAI7cXO7Q9IK8w6ZXapQtE15tqRR2CM1lUVJv7gPbYw/geZrYdeGejE2+gWBnlQeenJBSOGbSqGHvwaJHphMQyOU4jkJ4JN78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934582; c=relaxed/simple;
	bh=Z4DGypsjGRe2NX77iE2DcjvhUodppVYdEuTOf+BILg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECw5j113AHClhIrQxDb15jFbBvc7HqDsAsU8osWGo9KmIV8Lrs8fjEGH+aCByYELWP0KZflZct2DVCeIoFhRs+NrENKVuCNK1uQpppBad9kXRa3Rvyx3U5RsPLggUO5ixKqYH8eIK2y7kUuiHiO3Fsp5tldcH5NJDnDDmji8t8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=kKrWsOqU; arc=none smtp.client-ip=57.103.74.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="kKrWsOqU"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-4 (Postfix) with ESMTPS id 4175B18001BA;
	Fri, 02 Oct 2026 09:49:30 +0000 (UTC)
X-ICL-RepId: 01a0fc04-d4a8-701f-925f-36e5446a0b91
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBKHVwPXxxBDUgdXwRZEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDlQXA1ccVkVcGEMJXQVXHB0AREVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQQlIAV0OXwtBClYBVQBZAF0IVUMEUhlAFXkIWgNYBQNeXwoNTUMSQhUEG0YeQwRfL10XXgxeBQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1790934573; x=1793526573; bh=2NoRxWcsszTzrFvdkXa8Ga+nEaBZTT0YNHj2aZ8ZKYo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kKrWsOqUEmMagH/uaammt5zaghZyA++DS4w+utV9lsezRCAzHKSzPcaCzZ8Qh06TfdBfzxKQcTwkaE+y6gpkjny41e2qLa4Q7ty8gko+Q5Z52ddzsH2IJxVwFVfL360kRVGQOvhDv7yViBmP1zuycBZKkzFnASB8aJcW3NIaggZqxPyCrsaJlYf6Z8lI4iqwUFlOrYymPhNwzBwpnX7RUc+6Y/+Xpp4ZZeQpXBaAcOTM/EFJOuH9gmET98MGjEP9xqcKa9c1CX4CoDDsfAXq2LjCz36uPkkC9sei4yu1i1Uypn1bnxkPKsOToC/VvM3GNwMRWJwL0sSFQ2EVs9rFAQ==
mail-alias-created-date: 1575045973000
Received: from toolbx (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-4 (Postfix) with ESMTPSA id 4997B18000A7;
	Fri, 02 Oct 2026 09:49:26 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: okerixx@gmail.com
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	pierre@pinon1.fr,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Fri,  2 Oct 2026 11:49:13 +0200
Message-ID: <20261002094913.28722-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178939442771.2622.14821982022354625878@gmail.com>
References: <178939442771.2622.14821982022354625878@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 513iTgkx0qLtJGc374laVqu3WJq40inw
X-Authority-Info-Out: v=2.4 cv=cpKWUl4i c=1 sm=1 tr=0 ts=6abf7e2b
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DSvjlNx152q2Ky1L3_0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX6EpYS4BdVzXt
 oSgqt5bQUDfCzuECJv66ktYPzW0Z+XuYJJWiXcRzsA/Ye7856ma11SZBoCfhUY3/VQQdMaOXUYP
 18V3qVxVTk0+ulNP2waFVf3xU6Es+/duiQ+T7Lst5c8lOBMKB92l7Ly5n+sArk7s4afkWakHRwX
 ERzGGE18o4bzQvAAHsMmV1bPNJyGeud5p+Tf15qucC8fRHgBMI46ClXOy4zEjNaEZlvXfdFqzsT
 UZvj7sGkdcq81ByhYEyYyVlVtPOuL3fM/AVFqCBY16V1dXlesv0F/3Ii9Suh3wBhbAWNL4vcPca
 VICDAj47pDqt7Ha60+eloMnF8cHfhU/c+HzUC1sAJ1o+ebXBReygbT/mHnfUrk=
X-Proofpoint-ORIG-GUID: 513iTgkx0qLtJGc374laVqu3WJq40inw
X-JNJ: AAAAAAABctdYjKj6r0gHFu78BCpF9oQ5lVkr+vK85XWbyy2gjbY6ZJtC+Fl8ve81YG0O7a
 LpNwKI4Gmm8sOIYTKs3E4VA6t69KG5byGpL8e2LWV3onpprU4r07e3edERc2eCb1Pq5tvI
 oL4COnP6EIyejIy5eoZ7YXdEnc3uC5dabqemeJIzlDSSGAjBgJFqWF+qw4eC5WXeh2M9rP
 m2fqtSKONdkzLFvllh4sshOixjY4/ef7sdSNgnqobFfoIvaafCWXJhI0iyORZpZXF4jFVl
 sQH6NQpVyfkWcGXoGRo1NUpmqWhoAL5qxLr8JZ9ZOw9VFW0Cqi61CV6nvAGX6JPYUhWTQM
 roQqhXRmrH0qT+0jqihObvKWJUwvNija2xizY9SqY6cJURx+WfFSgJrfUeGMBCfO+VFpKb
 U5R5JFxHTWFrTJ1xSiRI5uwJQjVoX+DPD1Q2qMpgeVUIKK1kZU5NEtR4WgNE+P2mI257fE
 P3QYscIKQ39il+WsB0huAaK6KucYW4pUhv5eFKpfIyA2dssCJznddpIh/3pnZQLh0cFA8w
 lot51aDsKGMuW2zHL8qnYBH/LQriocCnHlNIBP+Af6u8AIxSL6kOp8j5HlHArTwPPIS6WC
 /AB/Jrtx1BGU3QzMm3ISq+WIlC6jxRpbkh9TFHEUD6lwiA7SgbrdkfQekqp08fF3heccUO
 UtWDHZjJhRBatTEhTSGr4V0nPwSirW73RDH3XqpRQRs4vr56w/K3xPTzDOxtkZsoaPZYtl
 7uQyhjzVHs41+toZIg2kdc5zoQfCY9ghW6FKdS8y5UO8nORPLAUpRaTtoxaS4wtkYZh2uN
 9buU38peBkJyf0qRWHi/JXzYb2eSeUaWXS1iUUkXb6f4l+e/KxZEe0i4pcGc5JTjcUOBYy
 rg9wKM02Yw7Cugltu2nZu2OsT1wKUs+KZ2vKxWCUN5VXUVE5Qcc/QS3Fb2dUipMVX8TzpN
 R12Wtlky9pFcrhL6PmoKGuMV/9ERY3fK7vonyCBacYaB0ppSWlzn7nZ7+B0ysZtY/HkXhH
 KLyDc3Xcl94xzeBM7uSsDSDAHR3CpTecBCNQ9yJJnubBxBjtfzXPCn2PNesZnvInOox4UL
 Wwc45EYdw7z3U319xxHlQx2Peddkc9vLnU4LI6BjtYSo4iEbqtSHTn2dPe2izFnrp984aT
 wfTM41pkLlMLT5mVU13NflRt7dAyvPbOQwPCkT9+l9jMmUbhRayeQz68cDMepwsAO7MefA
 zQ9hw+iC5/i2/tXa/Z5JvPS/nA+F2XzDSnbJjSg1xXSzklgVkztv2e3RY9V0PXYQ3RtnT/
 01Zg==

Report the crop of each mode, derived from the window registers in
ov08x40_global_regs and the mode lists, so that libcamera can tell the
2x2 binned modes apart from cropped ones and select them.

Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
---
Hi Oleg,

Thanks a lot for the review, and for checking the rectangles on the
Yoga Slim 7x. You were right about ov08x40_global_regs, I had missed
those writes. v2 looks up the mode matching the TRY format as you
suggested.

While reworking that path I noticed a pre-existing issue on 2-lane
setups such as yours: ov08x40_open() initialises the TRY format to
supported_modes[0] (3856x2416), which is a 4-lane only mode, and probe
likewise sets cur_mode to it regardless of mipi_lanes. On a 2-lane
sensor the TRY format is therefore 3856x2416 right after open, while
the closest 2-lane mode, and so the TRY crop, is 3856x2176. I left it
out of this patch to keep it focused; I can send a separate fix that
picks the default mode according to mipi_lanes, if that sounds right
to you.

Changes in v2:
- Rebase onto media/next, which adds the client_info argument to
  .get_selection
- Reword the commit message: the X window and Y window high bytes are
  programmed in ov08x40_global_regs, not left at power-on values (Oleg)
- Return the TRY mode's crop for V4L2_SUBDEV_FORMAT_TRY (Oleg)
- Move the OV08X40_NATIVE_* defines out of the OV08X40_REG_VALUE_* group

 drivers/media/i2c/ov08x40.c | 85 +++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 6de0c17e6..d202e3d5a 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -38,6 +38,14 @@
 #define OV08X40_REG_CHIP_ID		0x300a
 #define OV08X40_CHIP_ID			0x560858
 
+/*
+ * Full readable pixel array, as programmed by the X window (0x3800-0x3801,
+ * 0x3804-0x3805) and Y window high byte (0x3802, 0x3806) registers in
+ * ov08x40_global_regs.
+ */
+#define OV08X40_NATIVE_WIDTH		3872U
+#define OV08X40_NATIVE_HEIGHT		2432U
+
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
 #define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in normal mode */
@@ -151,6 +159,9 @@ struct ov08x40_mode {
 	/* Exposure calculation */
 	u16 exposure_margin;
 	u16 exposure_shift;
+
+	/* Analogue crop rectangle, in native pixel array coordinates */
+	struct v4l2_rect crop;
 };
 
 static const struct ov08x40_reg ov08x40_global_regs[] = {
@@ -1232,6 +1243,12 @@ static const struct ov08x40_mode supported_modes[] = {
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
@@ -1247,6 +1264,12 @@ static const struct ov08x40_mode supported_modes[] = {
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
@@ -1263,6 +1286,12 @@ static const struct ov08x40_mode supported_modes[] = {
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
@@ -1278,6 +1307,12 @@ static const struct ov08x40_mode supported_modes[] = {
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
@@ -1293,6 +1328,12 @@ static const struct ov08x40_mode supported_modes[] = {
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
@@ -2056,10 +2097,54 @@ static const struct v4l2_subdev_video_ops ov08x40_video_ops = {
 	.s_stream = ov08x40_set_stream,
 };
 
+static int ov08x40_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+	const struct v4l2_mbus_framefmt *framefmt;
+	const struct ov08x40_mode *mode;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&ov08x->mutex);
+		if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+			framefmt = v4l2_subdev_state_get_format(sd_state,
+								sel->pad);
+			mode = v4l2_find_nearest_size_conditional(supported_modes,
+								  ARRAY_SIZE(supported_modes),
+								  width, height,
+								  framefmt->width,
+								  framefmt->height,
+								  filter_by_mipi_lanes,
+								  ov08x);
+		} else {
+			mode = ov08x->cur_mode;
+		}
+		sel->r = mode->crop;
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
 
-- 
2.55.0


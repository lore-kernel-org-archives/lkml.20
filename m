Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD92BE639;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=M31yky0BMZj1BfraGzFtWasq2h9RsVYcl7UDYpboH7Z4tWt9Kw2lcium+Wp9MjrA5QNpOxefF8lBpjhazA2IijV/FJOdpb/F9UotVy+8h14WtkldtSpdDEcXDkLU4j4G9WAEC/gxDBUR3jfSLaVCLu/Hc1VG+giiKYLFXU9XkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=aj1z0/G6jXLgEETHdXNHBJTQCPBkbQ/UaIkoWkrS7OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7CBYQmQ5sNN+Irlwk4Vl50BgQISC5hV0f9QC9MNrD+Js7UcQaUiZVQU+BXFXMVtKia6q9CeJS8umRsA1nQaB0QiqK4JkQ35/zwR/Cz6/C/WdoC3dAFCVIjZxt6A7GHn3PF/KFUNuBYeU7L30itI/TRqHsga7W95YTvaDxvzLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM96EECV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM96EECV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A366C32786;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=aj1z0/G6jXLgEETHdXNHBJTQCPBkbQ/UaIkoWkrS7OY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HM96EECVr3C19+P1fQR3ul+C3XJy/ZQ6kwpZiFSIYiPOXMH2BiV/4v52zIU/MlGqY
	 m2tO7alSOG/mLFvoWZaUKF1FS0mShFl7B/e7qJ1Y/IA3YzaOR/uYFiHvtwXfAcAd1Q
	 cmtcTBAPO2ViwpO93Dlq9FSegE5/ei8I5pS1todr0GBiew2m9ZoMleeAkUloANzm8Q
	 m1vFabZRdiykjwfTTpNPCc+oDtSnd1QdLZiO64QqoMLLGeYjoeR8PaJ9EG3b3SxtQO
	 Ve1ZbhWNSuYZhjw9KfI5JjoxQV2jGSDJgfsnsqJG9Jnqiy4LNKIkNiQfcQdlnb5a6L
	 lI9WSHiaEqXkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A33BC982DA;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:28 +0800
Subject: [PATCH 13/21] media: i2c: it6625: decode detected timings via
 typed register structs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-13-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=3215;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=5lnagqXC/VlYNEww2tkf1miEftUj9bs+qaABWCI/ZBM=;
 b=js8dL98lj0eF87rsg4Ox0NbHv+OH1DnkMHuBlo5SQ5dpCVei1YBzBKorMGvoIJIT/S+96ltfd
 gblkX3Ic9UlC9psDnfVxfTlBNuTKW+aZquOpK0WNQ2/HjmUMVNYcOlO
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_get_detected_timings() manually assembled each 16-bit field from
raw byte-buffer offsets with a shift-and-add sequence. Define two local
structs of __be16 fields matching the contiguous REG_H_ACTIVE_1..
REG_V_ACTIVE_0 and REG_H_FP_1..REG_V_BP_0 register layouts, read
directly into them, and decode each field with be16_to_cpu(). Guard
each struct's size with static_assert() against the expected register
range width.

Every member is 2 bytes wide and naturally aligned, so the struct is
laid out with no padding -- this is safe because the struct is the I2C
read target itself, not a cast over a pre-existing raw buffer.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 60c79a2277941621c7aa83189244b706a5505d66..90b87dbf54fcfc7ad2a1245d4594beee24a193ca 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -769,10 +769,22 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 				       struct v4l2_dv_timings *timings)
 {
 	struct v4l2_bt_timings *bt = &timings->bt;
+	struct {
+		__be16 h_active;
+		__be16 v_active;
+	} active;
+	struct {
+		__be16 hfrontporch;
+		__be16 hsync;
+		__be16 hbackporch;
+		__be16 vfrontporch;
+		__be16 vsync;
+		__be16 vbackporch;
+	} porch;
 	int val;
-	unsigned int width, height;
-	u8 buffer[4];
-	u8 buffer2[12];
+
+	static_assert(sizeof(active) == 4);
+	static_assert(sizeof(porch) == 12);
 
 	if (no_signal(it6625)) {
 		dev_err(it6625->dev, "no signal detected");
@@ -792,24 +804,21 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 	bt->interlaced = val & B_INTERLACE ?
 			 V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
 
-	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, buffer, 4) < 0)
+	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, (u8 *)&active, sizeof(active)) < 0)
 		return -EIO;
 
-	width = ((buffer[0] & 0xff) << 8) + buffer[1];
-	height = ((buffer[2] & 0xff) << 8) + buffer[3];
-
-	bt->width = width;
-	bt->height = height;
+	bt->width = be16_to_cpu(active.h_active);
+	bt->height = be16_to_cpu(active.v_active);
 
-	if (it6625_read_bytes(it6625, REG_H_FP_1, buffer2, 12) < 0)
+	if (it6625_read_bytes(it6625, REG_H_FP_1, (u8 *)&porch, sizeof(porch)) < 0)
 		return -EIO;
 
-	bt->hfrontporch = ((buffer2[0] & 0xff) << 8) + buffer2[1];
-	bt->hsync = ((buffer2[2] & 0xff) << 8) + buffer2[3];
-	bt->hbackporch = ((buffer2[4] & 0xff) << 8) + buffer2[5];
-	bt->vfrontporch = ((buffer2[6] & 0xff) << 8) + buffer2[7];
-	bt->vsync = ((buffer2[8] & 0xff) << 8) + buffer2[9];
-	bt->vbackporch = ((buffer2[10] & 0xff) << 8) + buffer2[11];
+	bt->hfrontporch = be16_to_cpu(porch.hfrontporch);
+	bt->hsync = be16_to_cpu(porch.hsync);
+	bt->hbackporch = be16_to_cpu(porch.hbackporch);
+	bt->vfrontporch = be16_to_cpu(porch.vfrontporch);
+	bt->vsync = be16_to_cpu(porch.vsync);
+	bt->vbackporch = be16_to_cpu(porch.vbackporch);
 
 	bt->pixelclock = it6625_get_pclk(it6625);
 	if (bt->interlaced == V4L2_DV_INTERLACED) {

-- 
2.34.1



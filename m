Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1FF409624;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=hmztTfiQ0w7iWOPuq+Hw9H/yflHs6MW0ikjDEa7UsfOzI/KEvLu33gsb6weONOEdhpzcN3BrBenskaWvi17kVa6YV358qRBue7LcY1glThsQW/ZS9o+n/SU4RvKGtsMD9B/pN89M8INLM7FBijCjiXDYfbDV/WVfqsRRmrXSY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=BIpNp6HDze73YcJnFBeNpdXme/d3zet0jce6upW5HKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oc/89errTaeGZkEIqT5mnOjfLp5Q7JMnghApIvnI+ZIy3BPYPgVrk9rSOcX47XCmmZ3PYAEFmWTF5/9Pl0Dr47A1DQTKN7BhogZPt1dQrKmF/vZZYUiMlFvflCnJNJVmOZFgzEV4WzTlODA3yRcXBS2Mj/NQF8R8VWBOiF/4UdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNaVGjhH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNaVGjhH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3BF1C4AF14;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=BIpNp6HDze73YcJnFBeNpdXme/d3zet0jce6upW5HKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lNaVGjhHJBbrUb/KrGnUSMiTXPcojVBUy/h8B7kswe53zB9PyxMA/Be+HuQ0MDu01
	 VQsjJzVcSYxBUVZ66yeoAhStGthINjeQZ2cPDJR8YDO8nNBnSxPqX239Y6wZr4J4sj
	 Au7RwHOYi2hyKVj7DF5iCPRedvK2nQ3I8c+m6qE0t+z128+s1u5WXJFTtklvn+3R9q
	 arpKjEtMp22jo61cOQY5CqYeXq75JGh1gHtLxJ0AbsJ+dsTX/NmEbz5BWBs5ub1NNh
	 BsNzTnAYqc8c5C+ct0CrcH3xNzeFMltvLjssSejpRRqjN87kO0kokQUyTPF/s5LxR2
	 U7D1aiKfFAebw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93144CA5FBE;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:31 +0800
Subject: [PATCH v2 13/21] media: i2c: it6625: decode detected timings via
 typed register structs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-13-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=3738;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=Uzr9QZMp3XmUfUWG5ocFDWtRwwDwuGi09aTo3qivrQg=;
 b=v/2lUIbyrSOPnXLvCZcVhA9UU1oMcSxNdN2f6XQYW0BjsfQ0ahghjNbLDuQ7Gnfj0PVYiON05
 2F1nzqjzAmsDpX8UY8lcYROMIPkcotlScfY8HRcQAib/9U0jgsuinQD
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_get_detected_timings() manually assembled each 16-bit field from
raw byte-buffer offsets with a shift-and-add sequence. Define two named
structs of __be16 fields matching the contiguous REG_H_ACTIVE_1..
REG_V_ACTIVE_0 and REG_H_FP_1..REG_V_BP_0 register layouts at file
scope, immediately above the function that uses them -- this driver
accesses many such register areas, so keep the layout struct separate
from its one caller instead of declaring it locally. Read directly into
them, and decode each field with be16_to_cpu(). Guard each struct's
size with static_assert() against the expected register range width.

Every member is 2 bytes wide and naturally aligned, so the struct is
laid out with no padding -- this is safe because the struct is the I2C
read target itself, not a cast over a pre-existing raw buffer.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 48 ++++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index f77eb3ed63f7695cf9da277b46d9bab4a526e065..7582c12c268e1878f15c0f3c6030aacf8e78a5a4 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -765,14 +765,33 @@ static void it6625_hpd_delayed_work(struct work_struct *work)
 	it6625_update_config(it6625);
 }
 
+/* REG_H_ACTIVE_1..REG_V_ACTIVE_0 */
+struct it6625_active_size_regs {
+	__be16 h_active;
+	__be16 v_active;
+};
+
+static_assert(sizeof(struct it6625_active_size_regs) == 4);
+
+/* REG_H_FP_1..REG_V_BP_0 */
+struct it6625_porch_regs {
+	__be16 hfrontporch;
+	__be16 hsync;
+	__be16 hbackporch;
+	__be16 vfrontporch;
+	__be16 vsync;
+	__be16 vbackporch;
+};
+
+static_assert(sizeof(struct it6625_porch_regs) == 12);
+
 static int it6625_get_detected_timings(struct it6625 *it6625,
 				       struct v4l2_dv_timings *timings)
 {
 	struct v4l2_bt_timings *bt = &timings->bt;
+	struct it6625_active_size_regs active;
+	struct it6625_porch_regs porch;
 	int val;
-	unsigned int width, height;
-	u8 buffer[4];
-	u8 buffer2[12];
 
 	if (no_signal(it6625)) {
 		dev_err(it6625->dev, "no signal detected");
@@ -792,24 +811,21 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
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



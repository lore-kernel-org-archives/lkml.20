Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AA414430;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=lgz5O+adIZ3xpsRONj7Z1y4/6fmzvlKAuVuDHMj4x+0jYIlGB+RrThmZVWhx8Rh/ApLDINlBCR8SrYd0JRX5oR8cP6yIn3PVzFb5grgWjoYY1f4c9olxhQQ+dP5/WA1dpKTYnarMzMbO43O8VPNc8OvBPoYalFPJyJc59nu2G3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=m6qELubanLorsTzWVpOyBC5jcauS6V3b9AFc/10FRME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYCdH1Kar5PBCYIUiZK0iMDr6hj4XBs13AeeextLVO1qYaldUNJrbT3xx0xnIXJZ862oCMctKx0hjT3XJSr1aAxzlfrF5LbFr7gzCe+qcxwWKwR7UAeVoao8kd3BVl0xvzJvhv5brt1mWQGsWrs+kK4aJ3LJ8PR50lDq24d/TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNDlx9qS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNDlx9qS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D10C4AF1C;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750571;
	bh=m6qELubanLorsTzWVpOyBC5jcauS6V3b9AFc/10FRME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kNDlx9qSJ8aSwYLDFuZ6P/hmd3XQjAvXE6NXA+S37MNAnRavNxIEo7PtmcQU0oLuX
	 YnUsc5TTX69JMkXwCv+xLE95ety1AuZJewKbXlCe7ZhH6vdx0IyGCx3BVy2pfuy6wp
	 ysKR+tJlrk/CbU9JVYTC04ziR+HSkZHjJzB7pb/4NEXGUEg784k/zW7+gcW14BW1yY
	 ruzFRrZ2/A1X9V0Vj9U4gd+6THl2/ejZMT1Lm9gHZynfXGsz/IYfEdUm/RAe1RO9pe
	 R/JcBnQvKwcYrhJHmtzYd5kANqBjFNwgXnjal5hGfqCKhDH09gig9+/xaUbNqCXO7K
	 z7MPSXkhz3law==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCDCA5FC1;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:36 +0800
Subject: [PATCH v2 18/21] media: i2c: it6625: finish reverse fir-tree
 declaration order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-18-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=3134;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=VVJow6ihDBcVcPgijqF3PC6ig0LrnS9yPsOv+nmfbt0=;
 b=Za4iTAjTpvZbHUiT5JDM5ok8oMgqAZCWsQK9bYs/AStaKr6EnM7a3IQUCqFGHm6MB4DnHljK0
 rOBOffb6NnDCVB5sWiPnYFuTc0hPpJrvwnwYE04LR/38qniBuxlgzKr
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Reorder the remaining declarations that don't follow reverse fir-tree
order (struct/pointer types before plain scalars): the five register
accessor helpers it6625_read_byte()/write_byte()/set_bits()/
read_bytes()/write_bytes(), where a plain int was declared ahead of
the struct device *dev pointer, and it6625_set_fmt()/it6625_s_edid(),
where an initialized wider-type local was declared after a plain int.
Swept the rest of the file for the same pattern; no other functions
need it.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 01200acb6bda5cdd759caf70642fcd910284a8b8..bc01e87490eeb478b33bf82f77652d6a2c5610cb 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -433,9 +433,9 @@ static int it6625_regmap_i2c_init(struct i2c_client *client,
 
 static int it6625_read_byte(struct it6625 *it6625, u8 reg)
 {
+	struct device *dev = it6625->dev;
 	unsigned int val;
 	int err;
-	struct device *dev = it6625->dev;
 
 	err = regmap_read(it6625->it6625_regmap, reg, &val);
 	if (err < 0) {
@@ -448,8 +448,8 @@ static int it6625_read_byte(struct it6625 *it6625, u8 reg)
 
 static int it6625_write_byte(struct it6625 *it6625, u8 reg, u8 val)
 {
-	int err;
 	struct device *dev = it6625->dev;
+	int err;
 
 	err = regmap_write(it6625->it6625_regmap, reg, val);
 	if (err < 0) {
@@ -462,8 +462,8 @@ static int it6625_write_byte(struct it6625 *it6625, u8 reg, u8 val)
 
 static int it6625_set_bits(struct it6625 *it6625, u8 reg, u8 mask, u8 val)
 {
-	int err;
 	struct device *dev = it6625->dev;
+	int err;
 
 	err = regmap_update_bits(it6625->it6625_regmap, reg, mask, val);
 	if (err < 0) {
@@ -476,8 +476,8 @@ static int it6625_set_bits(struct it6625 *it6625, u8 reg, u8 mask, u8 val)
 
 static int it6625_read_bytes(struct it6625 *it6625, u8 reg, u8 *buf, int len)
 {
-	int err;
 	struct device *dev = it6625->dev;
+	int err;
 
 	err = regmap_bulk_read(it6625->it6625_regmap, reg, buf, len);
 	if (err < 0) {
@@ -490,8 +490,8 @@ static int it6625_read_bytes(struct it6625 *it6625, u8 reg, u8 *buf, int len)
 
 static int it6625_write_bytes(struct it6625 *it6625, u8 reg, u8 *buf, int len)
 {
-	int err;
 	struct device *dev = it6625->dev;
+	int err;
 
 	err = regmap_bulk_write(it6625->it6625_regmap, reg, buf, len);
 	if (err < 0) {
@@ -1648,8 +1648,8 @@ static int it6625_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
-	int ret;
 	u32 mbus_fmt_code = format->format.code;
+	int ret;
 
 	ret = it6625_get_fmt(sd, sd_state, format);
 	format->format.code = mbus_fmt_code;
@@ -1729,8 +1729,8 @@ static int it6625_s_edid(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_edid *edid)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
-	int err;
 	u16 parent_pa = CEC_PHYS_ADDR_INVALID;
+	int err;
 
 	if (edid->pad != 0) {
 		v4l2_err(sd, "invalid pad %d", edid->pad);

-- 
2.34.1



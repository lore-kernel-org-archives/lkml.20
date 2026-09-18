Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30D4C10C9;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721843; cv=none; b=gr1w4MErSpZVUnzF0Gv1V/BLhi/K9fZi8cILZHBEzfePUT5iS7EPCFjxPzX1B7MNVFQRobfzIv2cvWzKCNk9juVe9BWGLV2zgvF/6oNR41nn6jGNPPGxCFHw/2xAc/gypqC7JAwMB7FivkGton3UrcTB1V0ecHOouNabvJzpIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721843; c=relaxed/simple;
	bh=Bc0LLD11JjIidOjB2jemSYaJf2kMPqvLY86w+5ZVT50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtRy+8DUzfMZS8PkiXTVHaXyV5Lk6gTaXpmIqWNEt6amnWq3qhcp973UvfLDZDoeReOvwR6DGC6S2zB48NXE97/VcsMWgrJqZsY08zdVgSX0/QhMFxxVZ7nLRbD7f9eqz9kXJnw4MiLbjla+QSTBlDAvowZ42yaR8HYVdyfSaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uR0y6I8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uR0y6I8b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8ADEC4AF0F;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721841;
	bh=Bc0LLD11JjIidOjB2jemSYaJf2kMPqvLY86w+5ZVT50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uR0y6I8b900YbJKcaeARnjUKZPr8yUB+1QNK2qYh9AW4WgwxK2ZyfJ6lY2aRSB3vr
	 wh6F3V2OGmrHhU1n+tres5jmKdX2xloXocLrzu09b+I373is1OR1sNkBlzAmTq1jqe
	 SXNP9yOiQ8lPRR1Zt+bo457g3Sx6gAtdncz9BB74ecKV3EvFXmKenI2WpgWjhOrKNS
	 gZ8uoGIDWtLSYeOaUCfo4PXoFLRY2s8HqKP90IE2eii5XWUI3Qs/xHOBC4oHaZUaMJ
	 JtsjImDyO3qzmtZwrXQxa/SWKGPZqxSXOg/7mUdS3A0SDjPUxHc2KTIgbpJaMIiAbN
	 iaaX63rYVCZTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62E2C982DD;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:33 +0800
Subject: [PATCH 18/21] media: i2c: it6625: finish reverse fir-tree
 declaration order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-18-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=3134;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=h51JBSr7kq0MZnjjXG3L1mkawFYUPIXiUhBmbLr0E/o=;
 b=podvbG+0wVxXUVGMYWykB2mzzVWPLeh+WDGdKSww5lxBXsDfNiYc6xmlGX4Hyd/hTKGaRqAOb
 XM0MALxYUO6Apr/qjsoEs8sS6DuCsszfsbiV2HcQBRSzoNZ3BLFHq8y
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
index 5fa8441f073691425c64fbd2b4e537129a43a2b7..40cd413e0ed49c118421ce3dec77bb2df08cf042 100644
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
@@ -1624,8 +1624,8 @@ static int it6625_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
-	int ret;
 	u32 mbus_fmt_code = format->format.code;
+	int ret;
 
 	ret = it6625_get_fmt(sd, sd_state, format);
 	format->format.code = mbus_fmt_code;
@@ -1705,8 +1705,8 @@ static int it6625_s_edid(struct v4l2_subdev *sd,
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



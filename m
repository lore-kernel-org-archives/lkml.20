Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B4403135;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=uMAOIQRvn50Vp+zvi+3E+luF1moaFxh1OV/QMI4Pu4LPMdwVBm3S2vYJnOWfckZEYhxvUOo7Lxhl76M8MQB+rmMY4b9nyg7hIit/nvmwXrLHttb5xznE0B9E82H8pEaBGM78VBC6DxB8WOlvBxLQM3QahCw2Qvs8Sbg87tNMIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=TWatsb3kz0z7BnGaaPPrhTcmuHGXiQGWMLpkSmqT2Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H49lkqasoyWPz9tieV9VAsm3tMGgRMKj5mO6LEhFa71TyNc0TX67uu3S4D+S0O0u209OsCXCHZlYPmM/L27WxMhmNukIs4uOIt3RxX/SRSo3W0p1jPFKcle+iVRcoapQiIkFEZfv8cjOBFm5dPycLcKhfBhJmGxMAPghCrEQqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBrGY8Fk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBrGY8Fk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 328B3C4AF67;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=TWatsb3kz0z7BnGaaPPrhTcmuHGXiQGWMLpkSmqT2Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fBrGY8Fk6fwlw4sBqy4vzCa53cbh2u20xYV1Fh5HultEFIF9q83BwEI2gvq8OFnt+
	 qno/7K7pXxMDY8bkEyp8T2ZANuL9n22mnd8/rgMfqHJp0ln6AwDyOlajWB7eQCXHSh
	 ck9n2BAy+0gIptN8g3ODvUBHb47t5FeCo4kyC3JqjPr5EQiseKhySrY0s+yf6aezXp
	 eYiMBUtnuIlOkx2Zf3QSD5VUtEqksdXgXa/R9zKp0rdaqDblK4CaTGUHbnMLbaKx0R
	 LgcVHPsCSPQceKf9CD3I1qYvBJvu2kPh5ONanS5Z6W3x3bJNK3QPt7oD2ICZukWzoZ
	 fiXX2dClyXqNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AD6CA5FBB;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:24 +0800
Subject: [PATCH v2 06/21] media: i2c: it6625: use unsigned int loop indices
 in table lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-6-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1788;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=Itu8nqafqSgZFUOiiGQ7HvAR9weeiTDf2BIBCspj7RM=;
 b=2IJPYSHeAcAs7xNCzpdoDiOQoVcBKxr7SkLWs68196lCZ+Z4LeRSwkE77oxwGbDqRILDOFD0L
 ACDCLY4IO/xACSo1Mfovb3FA0vaOeTxkNiJrh+CupeG0/PgPgVp2iAM
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_csi_format_idx(), it6625_csi_mbus_code_idx(), and
it6625_regdump_print() iterate with a plain-signed loop index against
an unsigned bound. Declare the index as unsigned int directly in the
for() statement instead.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b747c08e092c7b35994cb36bb5bf7b99495282cb..9382a64706919d380e8318c3139b42a4a7b2fd55 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -375,9 +375,7 @@ static const struct it6625_format_info {
 
 static inline int it6625_csi_format_idx(u8 csi_format)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(it6625_formats); i++) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(it6625_formats); i++) {
 		if (it6625_formats[i].csi_format == csi_format)
 			return i;
 	}
@@ -387,9 +385,7 @@ static inline int it6625_csi_format_idx(u8 csi_format)
 
 static inline int it6625_csi_mbus_code_idx(u32 mbus_fmt_code)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(it6625_formats); i++) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(it6625_formats); i++) {
 		if (it6625_formats[i].mbus_fmt_code == mbus_fmt_code)
 			return i;
 	}
@@ -1895,11 +1891,9 @@ static int it6625_v4l2_init_controls(struct v4l2_subdev *sd)
 
 static void it6625_regdump_print(struct seq_file *s, const u8 *reg_buf)
 {
-	int i;
-
 	seq_puts(s, "     0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F\n");
 
-	for (i = 0; i < 256; i++) {
+	for (unsigned int i = 0; i < 256; i++) {
 		if (i % 16 == 0)
 			seq_printf(s, "[%02X] ", i & 0xF0);
 		seq_printf(s, "0x%02X ", reg_buf[i]);

-- 
2.34.1



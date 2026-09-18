Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2774BE432;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=CJtTvhnG/K8fwh5Amprjsh+0f/5NDpceiHbubEU0GaYhhYNrKuuhl4GLSS3ugQ67vWGoHAM45t9U9EBwF+bOHDiPhLDMnQVg5O1xmIsDg22/zArHO4bFDFR+/KTYyNwETnbmHWjoaiAd6nDxhmMwuYMyMgQIezs4NY6EeQ31OE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=gbsjVA9MG1EIAcCdtoq5wj2ddn+k8mHdKgTO1+iB8do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOcndE2cI/39QOyRhpymidScNsweFxWSN7rWtmJS4yEsIwpnwQ/s6FuRuds06wkqLI7pmg3eeKwuOY+TCPn65USc5JJmibGKbDAt/RPK+VzIgG7+DjBtRCsKQKh3s7ikTRidyyCemnLogWnwBujwdh7h0UDij+Wh4dWx/l1G/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv9fqwP0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv9fqwP0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3F50C2BD01;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=gbsjVA9MG1EIAcCdtoq5wj2ddn+k8mHdKgTO1+iB8do=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mv9fqwP0LZ/qKS5Ksi/PW6FV+OTHLKjLbdOyOikhSeMEkCzs0Tt0aFNFv60Lt846Y
	 NKhOt56THnM32o7k8aqR0A0iNk2caU3+RItS51KO7jQqM94lqZfydjAi83ULiR2KF0
	 NWr+vWyASUSGdqNKMRvifSnQzWw9MFnrzwIVqkzQDZUju8aj/CUv5/FfEMJLFyY3Xs
	 qsguRAZWnZO4SeWuqAUJu4BnI4uwIShb41AQUhLB+xxilRoLara3pSt5C6yTitNZKd
	 G63PXvA8x5zgmUESG+TL4xtQBJz5cDkfRRbWPADhPMwOy/qJI6pBiKDTg1LFy2r6j9
	 Iv3SYx+Qv3qcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19CCC982D7;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:21 +0800
Subject: [PATCH 06/21] media: i2c: it6625: use unsigned int loop indices in
 table lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-6-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1788;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=5Ctpnc+LLcR3m3GriRx3vFNF83f7OL4HJpZpnaEfXgE=;
 b=Bf3iH9gI31vUxKhbt9d5/ViXQWrtvJGccq+I5WKsqNl+vOvtGdr0McRq9Wgs0HCsKqqJ7tfkx
 cUfShiyMpY2CI6wzGZ8ZdtFmGp+8g+O/uiNhWqFcG4MfT9FupUEHBE1
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
index 97780c3d2d8fd3567ef18b3d2fc46b4e1f0758d7..9077f66187c647f85e41e571ff0d52e5e2ffdfdf 100644
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
@@ -1878,11 +1874,9 @@ static int it6625_v4l2_init_controls(struct v4l2_subdev *sd)
 
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



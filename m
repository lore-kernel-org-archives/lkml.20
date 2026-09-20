Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF843E5A32;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=H7911N97PLdw8pUpVILj10PEBTgvlDIYEQgeJqqAQccIg1iFpY6/i0ctq9x4l2anGOzep7xZ3XhGSC0Qa+lMW6NvGEt1uU/C0eVnWPL7W2i4wlG+BvRlGFCQIGPltIPvBir+UtJzf6QnnnN2L+gLfsRUU8EVrLeUQoshtH9IaZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=eTxnJigNpnWXtmI4MZBvwR7lM1CHRz4uuZ4G5XSJRls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzhwJ9cpID3P0RvfiGt7a9TYbJrYJotGsA3j82XlJ0Xsw82gsFNprR0ufkqWj8SRlVlJPkR5udyJ2+Y4Fm+wYRW7L0HNjXqN5pDhzaQSIUh7hDXvQb7EAG7WCcsXne8Sd2yG1Jt1NwKSMIT3zd+036v4tDKPUSviSaat4GviXYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpuk5y9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpuk5y9F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33A05C2BD01;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=eTxnJigNpnWXtmI4MZBvwR7lM1CHRz4uuZ4G5XSJRls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lpuk5y9Fz9W6Jmc2eeeHBeQys96jvJxxxHlvlUQIARzQ4yO8JDpvl3b+T4EdmY5Z2
	 5XjQ8KfrH8sKriABn6wKSvcYCyRxy1KmGgWOK62H07XOqpSTSw7YNMNDugMxTJahk2
	 jV1i2V4X/mhaIi8ZdQNl0SnjupChV4apStM48VFyqGJgXauG0cy1Ifmahjg8137IxO
	 L3OJYTqxl79A1Vqd+Cy3TSzqF/EClznW7xuv5q9VBrGaVkmheGYkUpXG0iNIRCECSK
	 xTWXKTL1mX4CNrda+XbqSLQQulyCA84MN/fAAJ974fiz/jBNyJQht9ZKjKwKNUmMu5
	 hmRFpR741gwpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9ECC982E6;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:06 +0800
Subject: [PATCH v2 04/12] soc: amlogic: clk-measure: Align compatible
 entries with DT bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-4-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=3018;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=N4Mx9eqZjQKXjqKlyxwgJVxp+RMgOs2WzYEHRChMU3s=;
 b=FBt+mP4nvxZ0zj8/a5vbJEOhDz5lKQllZx7AGXo7yCzqBj581hQtEUz7qg0JWGGnNbFSiX2fM
 Gm5afsxZ3uMBNGhpG6T8CfvAThO+lMlQ5ri7SycBoCxzkeEii2Ffm8z
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Reorder the meson_msr_match_table entries to match the order of the
compatible strings in the DT binding.

Move the newly added clk_msr_a1_data entry accordingly, while keeping
the existing SoC-specific data order unchanged.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 0d4ba2555d17..d58c8d9629ea 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -1279,6 +1279,12 @@ static const struct msr_reg_offset msr_reg_offset_v2 = {
 	.duty_val = 0x18,
 };
 
+static const struct meson_msr_data clk_msr_a1_data = {
+	.msr_table = (void *)clk_msr_a1,
+	.msr_count = ARRAY_SIZE(clk_msr_a1),
+	.reg = &msr_reg_offset_v2,
+};
+
 static const struct meson_msr_data clk_msr_c3_data = {
 	.msr_table = (void *)clk_msr_c3,
 	.msr_count = ARRAY_SIZE(clk_msr_c3),
@@ -1291,12 +1297,6 @@ static const struct meson_msr_data clk_msr_s4_data = {
 	.reg = &msr_reg_offset_v2,
 };
 
-static const struct meson_msr_data clk_msr_a1_data = {
-	.msr_table = (void *)clk_msr_a1,
-	.msr_count = ARRAY_SIZE(clk_msr_a1),
-	.reg = &msr_reg_offset_v2,
-};
-
 static const struct meson_msr_data clk_msr_t7_data = {
 	.msr_table = (void *)clk_msr_t7,
 	.msr_count = ARRAY_SIZE(clk_msr_t7),
@@ -1305,16 +1305,12 @@ static const struct meson_msr_data clk_msr_t7_data = {
 
 static const struct of_device_id meson_msr_match_table[] = {
 	{
-		.compatible = "amlogic,meson-gx-clk-measure",
-		.data = &clk_msr_gx_data,
-	},
-	{
-		.compatible = "amlogic,meson8-clk-measure",
-		.data = &clk_msr_m8_data,
+		.compatible = "amlogic,a1-clk-measure",
+		.data = &clk_msr_a1_data,
 	},
 	{
-		.compatible = "amlogic,meson8b-clk-measure",
-		.data = &clk_msr_m8_data,
+		.compatible = "amlogic,c3-clk-measure",
+		.data = &clk_msr_c3_data,
 	},
 	{
 		.compatible = "amlogic,meson-axg-clk-measure",
@@ -1324,21 +1320,25 @@ static const struct of_device_id meson_msr_match_table[] = {
 		.compatible = "amlogic,meson-g12a-clk-measure",
 		.data = &clk_msr_g12a_data,
 	},
+	{
+		.compatible = "amlogic,meson-gx-clk-measure",
+		.data = &clk_msr_gx_data,
+	},
 	{
 		.compatible = "amlogic,meson-sm1-clk-measure",
 		.data = &clk_msr_sm1_data,
 	},
 	{
-		.compatible = "amlogic,c3-clk-measure",
-		.data = &clk_msr_c3_data,
+		.compatible = "amlogic,meson8-clk-measure",
+		.data = &clk_msr_m8_data,
 	},
 	{
-		.compatible = "amlogic,s4-clk-measure",
-		.data = &clk_msr_s4_data,
+		.compatible = "amlogic,meson8b-clk-measure",
+		.data = &clk_msr_m8_data,
 	},
 	{
-		.compatible = "amlogic,a1-clk-measure",
-		.data = &clk_msr_a1_data,
+		.compatible = "amlogic,s4-clk-measure",
+		.data = &clk_msr_s4_data,
 	},
 	{
 		.compatible = "amlogic,t7-clk-measure",

-- 
2.42.0



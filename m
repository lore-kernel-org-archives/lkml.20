Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986650;
	b=1sMGz9Q35GnkEMlXhSl7fxDYKe6rd+AWA54qwBcwhaq54rMECFIC7Mg8QtwNuT5YQUoh
	 3APvOgt07ljjh8cKERM8/mI7hXUOZkRbNyYTM0NJp+5c6rJyN6WHLyFmX36klY9jl3YQW
	 NtHzsvZA5+A9CrVBP3s+Ylu4g92xJtRbA5QqScBs24KUPjEB2sy3AUHhsCkH5IHdymWqt
	 4Jl1FK38Wpu/gESLvFYNkyyllfX6fpjuovXuagVJA3IMK6TWCBzK1xco1ypXcQ57kIiLW
	 XIsBeSawenC0I1MuXd9lc1sICN5KnNtJZjYdMXQ69NjYyJ2QiyxHQ01OBExiZrcn5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eAg0//R+JFKzc4+1DiFBzmpR4/bk8838/6mb0ZYXxg4=;
	b=fpbpYBSg/SmPw5XeEFupptGuGuvpZ/dD1jpltfFrWUUi7hYh38knmvz0IcYsP9L4kRR6
	 Jeu5bJXueE6tk4W5zzlgQd3kXZDg/50HdWR2cFluLWLjoDzYrSOu3cJYEkV3VpvPhPPfm
	 Nxu6EVbUWKe0NPnLFVoNFlhfbrXHNMomxLxH0gGYo3NwubCHI/1sUVZQjTi5I48p4iEtt
	 1zoe8KBMr351Lb7DYJhG52G9b5CpoFAUqm7XbVb89ATsUdQRrL/oPUzsvBJq8amBic/mT
	 VSCOP3EKJQifPQ556mBP3ElQjuEZMYq7o9SQKupGRRGOHUkMhIFa7eFk5ZmkRqLYuyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X25zNZLk;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E5606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80E5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X25zNZLk
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-745497ac8fcso1071217137.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986649; x=1793591449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAg0//R+JFKzc4+1DiFBzmpR4/bk8838/6mb0ZYXxg4=;
        b=X25zNZLkzkO0D9wxAEoarApoKEn9Q4lyYtObhLzBGoJmUWHyEOiCAIA2obuIMfCIQN
         7OLcs4z8nB8p9McHl/ab0OndQ4mlRLrkwWFOQvvg4aa3jEBP3nfzvVBlT/oQts7/h0Xz
         7q+VIf5WiMtctE+KEz8RxXIEcjgyogsw8LIAYv7g5skigTzW4jI42yStq5l4KeOEB5Q8
         oLM3quj/POKKOzmMggl2ImmV4xTPliBY7vDpIKjBSRQMRjNt/RlENxYaF4u4Dp1ax4q5
         oih5S6yIEC1mDjof6DZOqt6KbhxI8+yIH6PF7rC/nNMv02io+RNqTk7/A91y6j/zQZmT
         6OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986649; x=1793591449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAg0//R+JFKzc4+1DiFBzmpR4/bk8838/6mb0ZYXxg4=;
        b=mZ7AI3Om8X6vygKgd+l3BIkpUlb1mXMyTYmMFixTbWsHJMX6oShjv4bL+Vd9thwhBs
         /sLIucuiy9AZlBAUNzeAymOOcnXrh94ZzIWyM7B9E1oEFq6CxM5mmXKw6nYsjqMrLy52
         MJyvzUN8pQI/tB+Bvb0YszprYl2vDyYZoXHiec4pLyl8SoZzpCBpgk2G9c5sESCzNqvq
         5JrHMJRYX/zV9OGImLRANmmrV1Dd9bMgs5synWhv6HcKf99qgL0vP5X95gnwORa7jrLM
         eRXakKYnRTrWGTu3FgoelUsuPwSjXg0+GGtgaunlxuKLX70sVxJbCwThqD0GWDOzQRjl
         Uifw==
X-Forwarded-Encrypted: i=1; AKwUvBxTqVSTm7kSh6iMzqcl+6FkZfxRQt233xA972ksi57MAeCdecyEVmEOghUZuJj1n3Czh46vKHfC7mk94fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp9b7f3fA6JECh4fh1IZE40+8MIoHEYokt/WU6frXIqQ3MaN4d
	qECqFzKHYv/LPX6DezkXmUMfqfjC4tiFqlIPg1WNgZzHzARGPH3+0sv1
X-Gm-Gg: AYBFou237u699we/XZz0213oCuPEkLuCuZQRvmYQwNN9cTYHGkwx7S9ZElYAITOfYeC
	CGgvaVbm8Lwxj/erhyn7mHJ1cWKxhAAJnta+EIeIHI2gduiPAO4bVQ35910gAuxfLXdsf5SmgL8
	X3ahyr+Xm4JAfidgLVCwwfxgeMUrxxiYz2x2Rv0IAy7Uh+HyN9iWnW9yZvCDYgXvz/2IG+tFD5M
	OwmkahKh4y+HAx1guNsBY6G40Bputq1nQA+8gWAwUh6gN9GNnunWmM6tgErTh7HhMEcaU59RUiY
	dlKnMRiXwR6AnMS6xf6iUKRKSZNuo83Yz0vAkVXe+fH9rJlgqnYPIiaS5y3o19j7guPFouUB9+s
	OODvVEUhTCRbs75uZnHAuV4VY5rs54O5y8hcPLp/z1cLXIYavLInZlFHhYoLcpmXr++QNOKMmaq
	Yh05naxCPJcpMbPo73+KHB3O2J6iuDmgzsNYnyfvzH542NWYSciNBewsYERcRfmnUHW7KmxyT/d
	q2D8r2DYEh69RcfhJk8Fco3jnyrEXoFfmiUX8ZJA/DvO6+idk7UH2aCs2EmE4jVTbq/PAd3rwrk
	OSw6rbvHRaA2pAyXbiIz
X-Received: by 2002:a05:6102:50a6:b0:7cc:23e7:e743 with SMTP id ada2fe7eead31-7ce5ccc0438mr1404867137.15.1792986649075;
        Sun, 25 Oct 2026 20:50:49 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:48 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v4 3/5] media: ov02c10: Split the PLL registers off the mode tables
Date: Mon, 26 Oct 2026 00:50:13 -0300
Message-ID: <20261026035015.110903-4-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

Both per-lane tables end with the same "plls" block, which sets 0x0303,
0x0305 and 0x0316 to 0x05, 0x90 and 0x90, overriding the 0x06 and 0xe0
that the common mode table writes to 0x0303 and 0x0305.

These PLL settings determine the link frequency and the pixel rate, not
the lane count. Move the block into a table of its own, and tie it to
the link frequency through a new link_freq_configs[] array, indexed like
link_freq_menu_items[]. Write the table right after the common table,
so it still overrides 0x0303 and 0x0305, and before the per-lane table,
so 0x3016 is still written after it.

This prepares for link frequencies obtained from other external clock
rates than 19.2 MHz.

No functional change intended: the same values are written to the same
registers, and the common table is left unchanged. Only the per-lane
registers other than 0x3016 are now written after the PLL registers
instead of before them.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v4:
    - Tie the PLL table to the link frequency, through a link_freq_configs[]
      array indexed like link_freq_menu_items[], instead of naming it after
      the 19.2 MHz external clock (Sakari).
    - Leave the common table alone, including its 0x0303 = 0x06 and
      0x0305 = 0xe0 writes, and only move the "plls" block of the per-lane
      tables, so every register write is kept (Sakari).
    
    Changes in v3:
    - New patch, as asked by Sakari.

 drivers/media/i2c/ov02c10.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index e24cd8705..62ea20dc5 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -303,10 +303,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
 	{0x394e, 0x0b},
 	{0x4800, 0x24},
 	{0x5000, 0xf5},
-	/* plls */
-	{0x0303, 0x05},
-	{0x0305, 0x90},
-	{0x0316, 0x90},
 	{0x3016, 0x12},
 };
 
@@ -330,11 +326,14 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
 	{0x4d0d, 0x00},
 	{0x5000, 0xfd},
 	{0x481f, 0x30},
-	/* plls */
+	{0x3016, 0x32},
+};
+
+/* 400 MHz link frequency from a 19.2 MHz external clock */
+static const struct reg_sequence sensor_pll_400mhz_setting[] = {
 	{0x0303, 0x05},
 	{0x0305, 0x90},
 	{0x0316, 0x90},
-	{0x3016, 0x32},
 };
 
 static const char * const ov02c10_test_pattern_menu[] = {
@@ -349,6 +348,20 @@ static const s64 link_freq_menu_items[] = {
 	OV02C10_LINK_FREQ_400MHZ,
 };
 
+struct ov02c10_link_freq_config {
+	/* PLL register settings, which set the link frequency */
+	const struct reg_sequence *pll_settings;
+	int pll_settings_length;
+};
+
+/* Indexed like link_freq_menu_items[] */
+static const struct ov02c10_link_freq_config link_freq_configs[] = {
+	{
+		.pll_settings = sensor_pll_400mhz_setting,
+		.pll_settings_length = ARRAY_SIZE(sensor_pll_400mhz_setting),
+	},
+};
+
 static const struct ov02c10_mode supported_modes[] = {
 	{
 		.width = 1928,
@@ -594,6 +607,8 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 {
 	const struct ov02c10_mode *mode = &supported_modes[0];
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	const struct ov02c10_link_freq_config *link_freq_config =
+		&link_freq_configs[ov02c10->link_freq_index];
 	const struct reg_sequence *reg_sequence;
 	int ret, sequence_length;
 
@@ -610,6 +625,14 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 		goto out;
 	}
 
+	ret = regmap_multi_reg_write(ov02c10->regmap,
+				     link_freq_config->pll_settings,
+				     link_freq_config->pll_settings_length);
+	if (ret) {
+		dev_err(ov02c10->dev, "failed to write PLL settings\n");
+		goto out;
+	}
+
 	reg_sequence = mode->lane_settings[ov02c10->mipi_lanes - 1];
 	sequence_length = mode->lane_settings_length[ov02c10->mipi_lanes - 1];
 	ret = regmap_multi_reg_write(ov02c10->regmap,
-- 
2.56.0


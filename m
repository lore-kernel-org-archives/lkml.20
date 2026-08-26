Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5C45A2AE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766558; cv=none; b=br5fKQK5QPR4M+DIq7qVN9ytHObHCgq1dXdc7vNtN7qIqYUgJWq6TWdTjrOd1fjdbyeSMgabuxZRfQio+x6ruf2OWbBvfXeEJsXJ2tLc9De3I7+3Sj/jAYVWKWTfC9Dp+Y1GuRlGppBcUZ7wox6yeWVZWTnM5oywI/1j7Aq9my0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766558; c=relaxed/simple;
	bh=bQ7fThdWeOoWGuWfsVMmTYFDay4551B6DGlUY7vTHrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU58JccrcucROwbTcBjMR9dQvOAJJM8Eddrw37+7MdqFpbigiA335FqNvjyzEjGTKyCuIc8+zmtxbdVQUnjBByntnNZoiWeX0od0zuf/mkHaFFHbOAWFcKG9FdOSuFnbgT6b3/qVnxxD+jpi9SFaoFi4Dmj0LY4UVehDpcrkwtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RloIwekt; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RloIwekt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1671ec8692so181658366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766543; x=1788371343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tYJ5KaLpfQx62wkTVDpvEmEjM+VL8f8SScga+Yd39Y=;
        b=RloIwektBJL2qiBJikMRlcB/ebYpZpYMjr/L7nNmkMQN7ZmvKKH5yUFyzidJsWUjLY
         uYjgGFYYhX2eYAasVRUejRsf38LyIv2DuChfVe4QyNZOF8VA++NwQ+rnebjWdXaUiPca
         SfqfdW1Ce9qTHKODARDczwNO9tnkeQubeUZGTddTcTGJ+Ui3jYQLpw1fS7LNR55OBLR5
         NAB8O/875uqiqTMDocPVgVJc/RcJ5bAPWabUrba1P79VgA0utDyyKkLJ717Wu5eTxqRZ
         BmhGrR682b8+A7Cr6Vq6VbDrwxiATjwSUqoPZIryXM069o4Oh+dDnqYvRbMKZm96+srs
         R+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766543; x=1788371343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tYJ5KaLpfQx62wkTVDpvEmEjM+VL8f8SScga+Yd39Y=;
        b=lmJY2euoROg/p/6Drgu2Wln4x3rjz1FE/rwvzEb7qHQPcFKqb4CXTV3e26SAHzLCa0
         YKDx0QODGVI2YMtLZRgpfNxmJ8bO9lLZGJLwU4K9wkClE7tjXlwirGeNiOEJdPtEfA9z
         23FpMlDVcc5EHYM98if6DNOxt280TLIu1En7PtisxN9nq3lkYB/6SlRFciDrEF8xPwDA
         iv17gzv3buSy6cUPNyQ+DJCX2UWJrnd/nI1j3EVcaDrKabE0H+aD+CytT/Xc5jhy7vKQ
         8dKY8QAaY18vb4dunq41i5FMxfwH1DQoou2c+vszL4TtGsKefc+W2efT/Qb8YVmy9/fu
         r5Pw==
X-Forwarded-Encrypted: i=1; AHgh+RorA/gYrToRXEK/WhNSu7hFkrH7KUW0qwHLswAkA5NVThtkGVgQWFE8movLTNWEwG5UBsSMAWqzjzeel0M=@vger.kernel.org
X-Gm-Message-State: AFuF++kgFafVCxMx4kpNQlub90fwt5ZuZTzdhB7nG1D3iwGqQGQDW7uV
	FJs9RoeDcc0DJRNKHvI2mI6iDB74v5EGi/gkAQg0tC0xZdnKftdqOkq7
X-Gm-Gg: AR+sD10K80VbZ2M304WIpqhVJrFufyg+pfHIuWj3oKhetYp2a1N5vLSEX2gbCCD4r+K
	9M8POISo4jiSulAZyH+pvovtB4gV76jea0vCsX/mUhe6o82VlYDhtTZ3aUxL1w20RVzwQceQssC
	1ahJe43/0lu2YLuD3evVfhxZ+anf4vls2CWuPhduPMf7cRWH7ZR9QeLJmFwBC09NR/tIiL9o8yF
	Vuc2LVtm8KCpPJ4jxAFKaFIwmtnied6QOTbXbrmi4pUWRV+bB03LAMmetdQC9OLQv4uNmea2r1E
	BQ0vOS/3T4CfsHBj+5OGW8h4MOSKKx4eb5J4Qp7Om2CTwLFi6P7EFOVv9XVpDNqbq4fjWVsKyqG
	8F57h506S6+qGwwMwaGPW6VZKNasBeb9IDQ1u0a0P6HSkFy4/3mfkHLcPKbrr7iFCnHmzDtZpJG
	7h9nDZ3CIRu3WXXylcuJk/QDOiXIcJWFnagAxWGVn6GT5npq6X9zjrNqJwv0VVDihISd+fyep2N
	dj17A4v03lXSQ==
X-Received: by 2002:a17:906:9f86:b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c250c485f66mr1016315266b.6.1787766542674;
        Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 05/13] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Wed, 26 Aug 2026 18:48:39 +0100
Message-ID: <20260826174854.199139-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the MIPI DSI controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The D-PHY global timing table of RZ/G3L SoC different
compared to the other SoCs. Introduce a dedicated D-PHY global timing
table rzg3l_mipi_dsi_global_timings and wire it up via a new
rzg3l_mipi_dsi_info hw_info variant for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved set duty cycle to DU encoder.
v1->v2:
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 7df5f4a4161b..88ec0612d529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -226,6 +226,107 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+static const struct rzg2l_mipi_dsi_timings rzg3l_mipi_dsi_global_timings[] = {
+	{
+		.hsfreq_max = 100000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 18,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 22,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 150000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 16,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 15,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 250000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 13,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 58,
+		.tclk_trail = 8,
+		.ths_zero = 16,
+		.ths_trail = 10,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 400000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 12,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 58,
+		.tclk_trail = 7,
+		.ths_zero = 16,
+		.ths_trail = 9,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 600000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1000000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1500000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 4,
+		.ths_zero = 16,
+		.ths_trail = 5,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+};
+
 /**
  * struct rzv2h_mipi_dsi_timings - Timing parameter table structure
  *
@@ -1580,7 +1681,23 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.activation_dly = 1000,
 };
 
+static const struct rzg2l_mipi_dsi_hw_info rzg3l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg3l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg3l_mipi_dsi_global_timings),
+	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CMN_MASTER_EN | DSIDPHYCTRL0_EN_BGR,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.activation_dly = 100,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP,
+	.pwrrdy = true,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-mipi-dsi", .data = &rzg3l_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0


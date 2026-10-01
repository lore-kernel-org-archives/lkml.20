Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E34BF94F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847651; cv=none; b=KTT+FhucPQIYrGYxbPDeUh6GPNSTOT55Om8kbCNjmXcjiWkrRv1r6SIeKU3H9AUHMquYqDgtg+ElytWWIust4E/jiw7a1ULrnDLUrnM8TUhC84Z6fWZ7PgPTnbma9gLGuk0HCm8clYpwym8iUmOYLBZeFlluM2xveWO3a3j9QGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847651; c=relaxed/simple;
	bh=xrtZNTI442sn4UYlmsAhqNFzv3+O/q3n5I8T+Nlb/QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfcB3NjYKDarkg3jaRoSZHCtBynBVm09e6OH0T0jwf0uNfjDrvrwWVilmrDww79ALiIY0RNSMu4QqpiGXdH2YMfc1oCYUDKQEcM3dcLWftn+4KQ8Td9tzqC8r0daqgM8Px0wPA16Upn96u/nun505a1EjIyDCYEzubcuVaWvzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd0uH3W9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd0uH3W9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso17846565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847647; x=1791452447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4W5NZM4ccedNa6iDSrM95gMMfTflIrpPojWIgsdmsU=;
        b=Gd0uH3W9frtpGg17B1lMCp21aBT9B/P+j4jPx7ha4UKG7MwNWuzMgEP8jx7MSmjunL
         YjUrCLVdJXLwKVUXBfmfI2fo6RWPb6BxzSJcAPHcobhZhCuu0Drhg7BjG43NE3AAU/2V
         UylHpSWttl2nL6+ifIkimjeiDLAPGoMUNd7QHFZA6Vykwto9DGK4TWSC9nVg6aap6NSF
         rVIjHJ67UUWSzYaJ7HvUFi1oIDrt+3wuwubNO77l3W8IQudZaOsVaJnhErOFrZ21G/hM
         3RESt/b9yH6W9K85a1GvXnHqpaZadnZ381os+kq7DfliTk1XVfGvPcVt81ekI9OvNPyj
         8x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847647; x=1791452447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4W5NZM4ccedNa6iDSrM95gMMfTflIrpPojWIgsdmsU=;
        b=t289ShtSlkgJtIOS5tnfu/O/bBwrWbCgm/nROkjY+JRVE0zgmkVduo3N7K0AyPDS59
         EiRUHmKYIcop+5GSXmDjeHnQzcmF22XGhGS3Kyyv8PRCEuHtLfGX8AkOUg128FPXXaYp
         yDnY4+RVo28I4t/u+uqHH0mf9tRagmH+Dt5nWRpI0vu8CU3t8haKegHIUrHy4B8SuBeQ
         QM9jaWFD5x7rDmP1zw5tYVJHjxWGZmnfKk6Cvwi7BCz/jSFTRSc7OZcPM0odAbiRQo9u
         q6Sal31+jl0rT4GbFk8b9y4gXCGQAMsgtHRyPZ7pnzEOnpuzs23/BQTb4A+Yo/6cRb4Q
         gEYg==
X-Forwarded-Encrypted: i=1; AKwUvBxGf5rDODr34Lm7oOajogFeIm8uta91pTCUHZJNq0Wzs+5J6fkC0S5Iahmw4pvTslD+DBC7jsro+632STg=@vger.kernel.org
X-Gm-Message-State: AFuF++no4E+SnbE5c7fUmfDggm4mMzk0WLVq7wuu3P0HSAjYuLzDs87O
	BtFXpWGcu4+afak2KZ82QseZVb2M6w1swyWWlXuiLhKYZPa6VbPvpEnd
X-Gm-Gg: AYBFou3yrpSzFipbstkbcuyf7KXAm/gXewzTld/GLAq8qYna63gNNaBl76YhPyzMgnD
	de9Z01VEdrtmQBnjjA4QAOpL+JG2QB0btriUyDXQUzJCB8NL/XHAbUnd+ViBgF4HUI3kwdKW4jR
	tRQtbsS3M0AALKpSi5ER/k0DmEgdtkZpGjU7QmRfa+VJw5b7AcIKoL1SJoZOdwfTfYVIhsE6C6M
	6fWDkO4nHWwNnSwRrQF5Q5AQkMgCfRCHKhMZjg+5l6NNJbdETTmG2sT7RgsH6RZP0k3zUyduccd
	AYQ9hp5hx+W8I2E6ck99nLHspHQkMAEVYhAbyeVljlgQ/Ag/7WSlastkuuxC4T4DSG3BTz3WIf3
	Wr1sxQZFfI1PEBcs5p9EVNMhQXOoCrzp2X1qcWosDYKY0lyH2nmLk1eEPWTX87q+SnsRNXny46m
	lzYqUMBWcchTuX9+aDw8ew6mXpYRMBSfDFgFm2daFx6mUTFdZaTKyTwc/g2rS9/rgZYucuAJCcx
	DX7x9LJtbsgFis=
X-Received: by 2002:a05:600c:c490:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-4a01afeab70mr67040295e9.22.1790847647365;
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 3/9] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Thu,  1 Oct 2026 10:40:18 +0100
Message-ID: <20261001094041.135697-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move rzg2l_mipi_dsi_global_timings and its array size out of the hardcoded
ARRAY_SIZE reference in rzg2l_mipi_dsi_dphy_init() and into the struct
rzg2l_mipi_dsi_hw_info. This allows future hardware variants to supply
their own timing tables rather than sharing a single global array, making
the driver more extensible without code duplication.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * Dropped .dsi_global_timings from rzv2h_mipi_dsi_info as it uses
   different path.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..d67e1230b70c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -54,6 +54,8 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
+	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	u32 dphyctrl0_init_val;
@@ -488,8 +490,8 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 
 	/* All DSI global operation timings are set with recommended setting */
-	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
-		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
+	for (i = 0; i < dsi->info->num_dsi_global_timings; ++i) {
+		dphy_timings = &dsi->info->dsi_global_timings[i];
 		if (hsfreq <= dphy_timings->hsfreq_max)
 			break;
 	}
@@ -1530,6 +1532,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.link_reg_offset = 0x10000,
 	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
-- 
2.43.0


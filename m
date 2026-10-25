Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938417;
	b=LNko3pIUUnr/Z7EIB2TWcH0N6rCbvjbTiDajXOuJ/EmMCtSFcYhxS8Z4oGUBwh9JfUrl
	 6UXTj5Wko9slWtyiIG6f3/S2c7QMaapBjcoAm7o8+JkRttD21YI96ZCJ8dKWcmbM3hAkU
	 7a7vPp/xvdgp12sKcaqpNU29CcQZGFg5UI1HxLJxquVsWdBO3T28adI6n/Wlh9YMAJ4zM
	 yPB9nrj24j/IqAp5Pv5gLB6eetBKw/Z0Y3fe36PC670eXkt7c9fghjmOWPzw6Ac6PRz8M
	 GrbGau0pkczTnWiwJ6lEJxVHnCrXZX61sGyD8t2sjxuseTJu/5txE76YzHBnBmaIrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JCokAAgAWjsPtUD0NKsGFk/Sx5sgBs2gnUzEQm6U42Q=;
	b=P0erWB6cw0h4ko2BSFobktX1KmQB9cdYhFGUa9b1sg6k5kyKQ77Hu8TI0+ThYltro2MW
	 4ZIDi1YDf24gqaa6r3kXHAgG4T//Sci+sLsDvxlHdZAFCmEBwm0mPDmVoWJfOy6TLuu60
	 W6G+XHOIG1LJdUc9lBJKDz5Vq47swMKDnTJtm1p7nHEKAVtt/KiFIrjHUmfIE0/if56jo
	 9GCDazYZUe0Llhr8TbD8Nc8iX6e9E/dfCbpuGcv1dSbqLD41MLxHtrIqw1GDT2DPt6svX
	 zKmJ89eWRG98qZReROrntctAj7BUtU5f6hmpKcyAdf+9keLv3GDRtFzuuikEBlRt1Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfWg5EE4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F234606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F234606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfWg5EE4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso470698a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938416; x=1793543216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCokAAgAWjsPtUD0NKsGFk/Sx5sgBs2gnUzEQm6U42Q=;
        b=UfWg5EE4Y+uJ+ADFMti9zuw+8048vgdbpULDn17ZbyXFsOi1taUOW0ZGPyPI+YbJc3
         CPunRt+Y+Fznv64lZFh/dWwW6eHwifpHusRWVgUqG7dDUqKB9B3SkmdEOwQndCg8VoTb
         9z8mMgTzOMG4h6mW8Dvo21JMEG+/f4Mvh7c9JU5oIcmazvVBuJ3GQOC71KO3JWuzX5vr
         1W4RsJLDbZWyWSKbW+uRl3oeJAy3UMhL9Ojtw/98oeC//NJWMd56a/ORpSZs/mbrwIxB
         /DNA2hKFXqUj/pQV8lo3l635dNNosTKaTX2rtU5htc9iTjsZRX5I4YnYAe5haRhPsxwQ
         ItYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938416; x=1793543216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCokAAgAWjsPtUD0NKsGFk/Sx5sgBs2gnUzEQm6U42Q=;
        b=xAXn1ivcXOUOo3cLjLTpsolB36NRTyXRkkgETq3DA4NPt22Wc7cjtopRNweERjGC4F
         Xs8Y/1wLxFvVtrLErqm4mfe7k5piwq7V4JVMWguygq8HYEI3NQ72oREc3KxjnF0h7zIb
         muzs8zWc8fB/VH1J+69Jod/PX6VGJAXs3omxyBm7AhJNloqHCOP9qZIYfoAAd28AudBx
         X3amMJS504NE9Eme3OQ6wsT8r0cjPmKhgCoKAkeHgKpJzcIJS/b0KP53RUQNLNlYxcgf
         qNIfYX+inh5hqAA/YCq1EXCql8QGYFp+Hn/c1vSnyQbpuMX/xUVGCnkbON7R19LBbsVU
         J3Og==
X-Forwarded-Encrypted: i=1; AKwUvBxje770KI8yAcwBME5MnjMJFhixm5DlL7C9KNeFJcC3XH07Po3Jd9Wc1PWSR+t2FOZIHiF/ZGU6sCuE5rM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMB5O5ndCrz2dt9ohB9RKgWlJW954klXxKOdxTsaWSxSoeqwbx
	qdnpA7u7V6UvUcPKhdavdfeN82UCLKWyqVIlbHHcrGl44Mn5FQ+TyqB7
X-Gm-Gg: AYBFou0w5QxQzGxe3AwVaBh9vCGiTbre/bWm80Wt0cD2mN+G+1TNRfDOphBpawLtFV7
	5fKOC65EBpm7UWwqlyehAo0tPFv9B4pSa8GcE3L5HXyJ3TvT7yX18104gd6ZYtwmjW7R/RDC6rb
	I6f0JqiNc2/TCzlCIhlWii/FhFf19fkFVioFTUIO0F2crZPmFY1qI9T3P0zShivj5Pxirekk2LN
	axat/CkA6o23ygaPdiNl9h2avjRXpVjFkkNgATPTAkqNML6pEr7jfTLEsr0UwknrjKrSr6bYu81
	lTtEk1kVEEFRbe8JRuFkYNNMuPLY5aNLxYWctljZQ2RuXt8DcYF16G595i7XLAr80NWzRQdwF/F
	4JEL3uVmB7BtLw8X3lqDbpLvm4hiXutJU/Mf8vBqdBBU5A9IT1OQpoeVrbu/TZhjW2d81RvFdxv
	+1nl2I06XML99pNWiJRdyeI7U6I270JPmcHBX7Wxa+BCp2lrRxg9pgKsarCHZPV18fbZebdb30w
	prCcg6Dp9t4WYAHYHl6qEjUcoUoqLf7M6a6JnRhmDR0PDlypqhFagTHQO4A2rm8oFyMmM76P8SN
	jeOvhQU5N8WoxeXh6Hk3dO8D9JbeV1GHs3SzlE2WI/4x12cJOdFFo1b5XNj9Lzc+Fw3aHfI=
X-Received: by 2002:a17:90a:d2c7:b0:3ac:9706:7735 with SMTP id 98e67ed59e1d1-3ade9b2d476mr3991234a91.5.1792938415936;
        Sun, 25 Oct 2026 07:26:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0977asm5068848a91.13.2026.10.25.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:26:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when lanes run faster
Date: Sun, 25 Oct 2026 15:26:39 +0100
Message-ID: <20261025142639.3454322-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
rate to calculate lbcc") counts HSA, HBP and HLINE from the pixel clock,
which is only right when the lanes run at the pixel bandwidth (pixel
clock * bpp / lanes). Commit 93e82bb4de01 ("drm/bridge: synopsys:
dw-mipi-dsi: Fix hcomponent lbcc for burst mode") went back to the lane
rate for burst mode, where the lanes are faster on purpose.

The Rockchip glue runs the lanes faster in every mode: it adds 25% to
the pixel bandwidth, or uses the rate the panel asks for. In non-burst
video mode the line programmed in lane byte clocks is then shorter than
the DPI line. On the GPD XD (RK3288, ILI9881C panel, 4 lanes at
752 Mbps, 59.5 MHz pixel clock, htotal 747) HLINE was 561 lane byte
clocks (6.0 us) for a 12.55 us line: the DPI payload FIFO overflows
(dpi_pld_wr_err in DSI_INT_ST1) and the panel shows garbage as soon as
a client page-flips.

Use the lane rate when it is clearly above the pixel bandwidth (more
than 1/8), and keep the pixel clock formula when both match, as on
i.MX93, Meson and STM in non-burst mode, where lane_mbps is the pixel
bandwidth rounded up to the next MHz. On the GPD XD this gives HLINE
1181, HSA 21 and HBP 7, and the picture is stable.

Fixes: ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes for reviewers (not for the changelog):
- The 1/8 threshold separates glues that report the pixel bandwidth
  rounded up to the next MHz (i.MX93, Meson; STM in non-burst mode) from
  Rockchip, which adds 25% in every mode. If a per-glue flag is
  preferred instead of a threshold, I can rework it that way.
- Testing: built with W=1 for arm (multi_v7) and arm64 (defconfig),
  DRM_DW_MIPI_DSI=y and =m, no warnings. Tested live on the GPD XD
  (RK3288, ILI9881C, non-burst with sync pulses), 6.18.54 with this
  exact change applied: HLINE 1181, HSA 21, HBP 7 read back from the
  DSI host, no dpi_pld_wr_err in DSI_INT_ST1 while the UI page-flips,
  and a clean picture in the UI and in games (before the change: garbage
  as soon as a client page-flips).
  Not tested on i.MX93, Meson or STM hardware; for them the computation
  is unchanged unless the lane rate is more than 1/8 above the pixel
  bandwidth.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the GPD XD display and then to prepare the fix
  for upstream. It located the cause from the DSI host registers, went
  through the history of the lbcc computation (ac87d23694f4,
  93e82bb4de01) and the lane rates of the other dw-mipi-dsi glues, and
  drafted the code change and the changelog. I reviewed and understand
  both, and tested the patch on the GPD XD as described above.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 22d1b8cbe1..b026b602ab 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -781,19 +781,28 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 					   u32 hcomponent)
 {
 	u32 frac, lbcc, minimum_lbcc;
+	u64 pixel_kbps;
 	int bpp;
 
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0) {
+		dev_err(dsi->dev, "failed to get bpp\n");
+		return 0;
+	}
+
+	/*
+	 * Use the lane rate when it is above the pixel bandwidth (burst, or
+	 * glues adding margin in all modes); the 1/8 slack ignores lane_mbps
+	 * being rounded up to the next MHz. Otherwise the pixel clock is more
+	 * precise.
+	 */
+	pixel_kbps = div_u64((u64)mode->clock * bpp, dsi->lanes);
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ||
+	    (u64)dsi->lane_mbps * MSEC_PER_SEC > pixel_kbps + pixel_kbps / 8) {
 		/* lbcc based on lane_mbps */
 		lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
 	} else {
 		/* lbcc based on pixel clock rate */
-		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-		if (bpp < 0) {
-			dev_err(dsi->dev, "failed to get bpp\n");
-			return 0;
-		}
-
 		lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
 	}
 

base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.43.0


Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60A46EC61
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766556; cv=none; b=WjP6Lu3WLsLguzfoxfRzBGQq44J8Ux4/1K60qHC4EYFF1jXBqKct0MMDGlNjyhCJlW3X343VFmQeno1lSALs+chrJoDx1MIIk1grSQ+/OtPnAT4N5k3wu6J8CTE8MGrpHPFu4U47LcR5bGRwGpUqpcuj0mhvkixU9vayoM4LV2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766556; c=relaxed/simple;
	bh=1x7y3a5AUOrcn5z5HBEAF5L92PCFAuoRpuOs3YWC738=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PO54OPgfsadM7R3uYYpwynDhxkYFRY9oGd4jbUDyOW0/VNFIMugX6eRdxz0rgXyfDftsPoflcR9YddIEdCAPGTQjTJ/35kQae1msgqO9UI3//pArKmMh6OynRImsnyILeSoYkMN+kT+YUW/JY1Jq2+GxQG8GIbv32DXxSRgB5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th8va5Tt; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th8va5Tt"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c247f6687dcso165582566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766540; x=1788371340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YMeD7dLZisixXOJMrSKSkr6GLMkfgvOUyr+kt9XhqQ=;
        b=Th8va5Tt9tGgoeWxjzTjKguQ0kv7N5UIp7a7C+VQK6dRYv/RJ9OPNK2dEIO+FhUDF1
         ni+S6VbL5qwYEGSMhgVPRH22qM5E7cmiTi03Z+ChV9aBKK8K+/KsNFfSyOEKCUrAzIvC
         cR1dlwndEIFuLI24esSJLKY0K2S4g8u+gTCSyGY5CfVxEIptwkZA83QpAvxO8P756eEK
         XTHXfDSmrV+U/Il4vJiigLd3C9tJBquCuJ2AukTgBg5Z/Dlsw8s4sWhgZ2aCr2UgpPfR
         NaPtcPBDT8vTjRUGTvARw0SGywqL6tQYove77+FXCqZudfs5Fz+KT4wHEpEVfJdGzCIw
         7ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766540; x=1788371340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YMeD7dLZisixXOJMrSKSkr6GLMkfgvOUyr+kt9XhqQ=;
        b=BWGxsbrSrZ8C6aNnxth317nFx0fgoecCU3CXPTbEjdmmZWjjFsc5g8+Zil8CXXxmNe
         yNAwqmpak/ulnbermh3IlWzqg/EdpxhU0vq1Fs29/beuHug56RHeV+mGwHd53VeM4Igj
         Km0jlGo18hLIQmMU3XC240O/AiEAKu63xCORh8lpB5ty0AoHRqLXi9gGlIZ/wRxKU0DK
         jQ93h/16O8oP0YUWnu9RuyhRy/MsWxgE85+fkV5lv0qniSiPskEHIeDedT10nktU7mbe
         5c7AIxs0jDSE1XVwG+zOZSmDvGcAe8oT1IbnqYThtbOAYjhcYYoHt3UbnoLaIUpm7qP2
         gBtg==
X-Forwarded-Encrypted: i=1; AHgh+RpM16qZc6daIKq4swLcTq3V2KrQltBCecx0icA+zyN8bh3kn0uRcXgF0QN+UFISPrgQxIZkRILyaWPPNTM=@vger.kernel.org
X-Gm-Message-State: AFuF++lvsGR9ZvcV7U8IMNeIFhzgSRzPvtu9WYQxiBDyfhzDkbdDBpUf
	vI0pWwrzUXdijMwMzZcutO8rCBleGpmCWiZnDZGlyNLlvFZxpo1i4tNr
X-Gm-Gg: AR+sD12KdIB8nZIJWNIkTlRhy+RfOqyUuD2EpNayxj4JvHM9f5YG7fpD6vRPwtkdECf
	xzu9pVqFBqsEHYpTKUm/vf98d5Nryh5+g9xZpUs1ybri/Yz/PgUlY7TuqMRV8SZc2YsvxeYppgm
	19e2a5G0IgO0429sKK7ypNcljZ3IzVxOVLFQh7SEaszW37qdgYJWtMzyTplgXrkCOWxU/4Oz4zD
	73mPN3m9V0N4+hS4smp/Hfj3VX46itemO4Z+12bybz0uEebrz9EuPk/WwGMoEUGIKSDtQu3oTEc
	5Jc/NfrNxF5GS2xrDxMghpqD/XchDdD+RGwZbdZHFP//VxBCFfG5vPtCjcQrf5oWfb8dd8X7/GO
	nG0W5C9sZQPdLisd5hqmswxnyHygel6nGJoIGiGlDxAoTFs5AqKVFxVxe7lVlFuM41DbcihXeiu
	+UNYeDoWf7NAUOEew/v/32Ewx4QFbixdQdjaZfvMItlGpH4qI+wDbTZHByRKXmCrvg0gw9EXnhN
	GDZ/E9QN1//ZA==
X-Received: by 2002:a17:907:c22:b0:c21:4393:c41a with SMTP id a640c23a62f3a-c250c312bbbmr1016918466b.11.1787766539831;
        Wed, 26 Aug 2026 10:48:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:48:59 -0700 (PDT)
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
Subject: [PATCH v3 02/13] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Wed, 26 Aug 2026 18:48:36 +0100
Message-ID: <20260826174854.199139-3-biju.das.jz@bp.renesas.com>
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

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2128fd16ebc9..1538eeece2b5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -59,6 +59,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u16 activation_dly;
 	u8 features;
 };
 
@@ -806,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		fsleep(1000);
+		fsleep(dsi->info->activation_dly);
 	}
 
 	return 0;
@@ -1534,6 +1535,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.activation_dly = 1000,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0


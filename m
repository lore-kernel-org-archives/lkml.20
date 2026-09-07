Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F4479877
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780520; cv=none; b=m99BgVn/JtYOcOmMur+T9Qg/CTS4HP3xxHpBmQEeX0dQ7AJ9mwbYTsyFfZz32wb3OB1G9Uh2kjz9wcuMZNK+QwXIDQilIWHh6JHX7mCmmpXBB6sMwZji6CfJN0iw+6kJgR4tdh8K8IsY37ksWGfSMbD8YZHHRlZXCXMz3BhP6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780520; c=relaxed/simple;
	bh=ghKBuVKjv8XfNhFOzxwGtXKqZd5n7UMCAy87A0RUjWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4HLAMk6fLzn8tkNeN95K+j0f283jB99hcvtHVHCLI9bx2WlDe7WHCvVYHgUMphK7waCBtlwuJD3dYop/hHxkpvnRwE5DbPdNaR3qd3PiTcr1JAnCWOJNHZehJgMhYGQOV0ay+03gqLkNhbNJ+S3N7MvVfph6gjrh8QtWlSq5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L9AoVcDj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L9AoVcDj"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA118153F;
	Mon,  7 Sep 2026 13:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780415;
	bh=ghKBuVKjv8XfNhFOzxwGtXKqZd5n7UMCAy87A0RUjWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L9AoVcDjkm+guO+3YqLswhaTsFtQ6gR/vnG/9DuWIwFoxorA2nuNQkOzS25V1h4kP
	 0IIxPBm7HCV9ne4ic6vnHelsMDhk1Zkq5OO5WuWO06oq64ghSqc43F/lXviGXejvst
	 WTkg1FnOpRCsAG7hQuRhWZrXKCBYD4f2XpoNxc+4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:02 +0300
Subject: [PATCH v4 07/13] drm/bridge: tc358762: Update comment about the
 number of lanes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-7-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ghKBuVKjv8XfNhFOzxwGtXKqZd5n7UMCAy87A0RUjWk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/Trwjm9PJw2in8vzivJeTm6tFMRM4bm0q0I
 LQ9vNvXUfeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0wAKCRD6PaqMvJYe
 9WXZEACiS69bcpXIRCNv3oebq2YokwcoR+16a5zuWgy0TnkLCY+JTb77tZnO50uHV6rk3EKvs2Y
 QMD49zdiJUJlmzTm7RHX60yD2FcxRG7/QskX+ot4UAXCE9ONxoJ1TmC+TpCz0OOQAzYGXdYlcX8
 pt6mLOTY+IPcburEgkCSHcz3/3E0Xd+BTnJf4srEQcjt9NgTeVcVP+xHf0MT5ODYXSdmIRaBWhK
 6Qspmu1AYT37kNT+dfwTyYO6+s4PrvZC3JDC1LhpbZoBDKSiDh9Jng/rVaxnxMc2eK4VYI+t3Q2
 SYIWs0LzGcjCLe5uiXajT5JOJW80aayecFgvJZ+9RWB0Uf3HQlaNNAudz6e8JHoSw6707QvLAWP
 1xJHsFCecA+5ak6uaYvhsIRiUCPjmXuiOIj+zesSyZ5wMTiQd3zdvxXcsxm4SGPwEh7aDhVQoJv
 kFUlURWTc3xKDtqPKPpRuoV3Ctu/FmIcrLDv//WunkI+C+1PRH4sEe78z+50vryJmHdUrOdqIWm
 8p/6xDff+z9DMZkGDd1By9MFwKEznnxL8l/iCWeaAgdisJ3YLHlbDL/EQUtzFDvDIuQb5SCZXFY
 2E5e3+ijcsNQkX/gSC4v7uwVvIYJTIka4S3QhJcg9B2HnLJLl+YKVWRfB/B2waQSr7jJJzVk/sV
 e75wEhQSSN/rQ+A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Update comment about the number of lanes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7654d4039a9d..34f2bfd9977c 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -305,7 +305,14 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->dev = dev;
 	ctx->pre_enabled = false;
 
-	/* TODO: Find out how to get dual-lane mode working */
+	/*
+	 * When using DSI clk for pixel clock (only mode supported in the driver),
+	 * the pclk is derived directly from the DSI byteclk via simple divider,
+	 * which is either 2 or 3.
+	 * The required divider can be calculated with bitspp / 8 / nlanes. Thus,
+	 * for RGB888, only nlanes = 1 works as nlanes = 2 would require divider
+	 * of 1.5.
+	 */
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |

-- 
2.43.0


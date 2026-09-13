Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022123ABBF;
	Sun, 13 Sep 2026 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277861; cv=none; b=TuUkzJhzGa2L07B0iCAToDgHcEdvNzDuSTjfbGk/pmzHqEU2jahaN8rvYfctxkR0xEo/3iBEGYlcBSOu4R/Iv8n0P5H/oyWJmaF6hg4po8691a71MnOz+0IPcFxqLwelVnmuYYP/+uiyxd8z6IyyzHPBzoYtuWeyZmmfld7iRF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277861; c=relaxed/simple;
	bh=U1lVp8kaQloX/LWpP4jy3QS2BFcDs+VgKv84PLhO+vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pb0pASo06HkutYaECPABv6i8iWPjd78eutDgsyKnp1x4ETHcYAKNe40mA4TFqIcIy68FY0wGthkRIN6/79C0caEPMiRFfHzpnbK3wGKMMAAdtOd9YTweHVH/e49SRqXa4dZuq6dsBHYRNGInf3NCwPsZD7Od4TlvAp5jwps3MqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=iCmu0pjM; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="iCmu0pjM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b3p0QEWuHBXAXgvSKtH/feowvJNCBzLhkqHHOOl3Ieg=; b=iCmu0pjMcg9maWbQHefYgjMwii
	9Wd/abzMg/hIxdJ/zvaTu43Pxk12sho1rXLdOsobiWyCwP1izfUMMnl/e0mWTDtP4jXdu53RyXN+T
	FZbNd06KTdnySvFNXA2NEj4eL+bjfD3A+u0JFTG9BV5T9QSlxC4OvTgBnvDPbhBuABRo=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cuF-0000000Dxg1-1rP9;
	Sun, 13 Sep 2026 08:37:36 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:36 +0300
Subject: [PATCH 4/9] drm/panel: novatek-nt36672a: Set driver name to
 novatek for consistency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-4-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
In-Reply-To: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

Since this driver should represent not only devices manufactured by
Tianma Micro-electronics, but also from other companies, it makes more
sense to name it according to what driver file name already is: novatek.

This does not change neither module file name nor Kconfig symbol, only
driver identification in dmesg. This makes it possible to e.g. grep
dmesg for "novatek" and get messages from both nt36672a-based panel and
Novatek touchscreen.

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 464d9ce47d87d..73bec4f47ec60 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -479,16 +479,16 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&pinfo->base);
 }
 
-static const struct of_device_id tianma_fhd_video_of_match[] = {
+static const struct of_device_id panel_nt36672a_match[] = {
 	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
+MODULE_DEVICE_TABLE(of, panel_nt36672a_match);
 
 static struct mipi_dsi_driver nt36672a_panel_driver = {
 	.driver = {
-		.name = "panel-tianma-nt36672a",
-		.of_match_table = tianma_fhd_video_of_match,
+		.name = "panel-novatek-nt36672a",
+		.of_match_table = panel_nt36672a_match,
 	},
 	.probe = nt36672a_panel_probe,
 	.remove = nt36672a_panel_remove,

-- 
2.55.0


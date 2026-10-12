Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F148FF9E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815426; cv=none; b=H+wkiW4ZfktvTk8lY4m/mJn0+JHYvgAqFmLbjUJDzAvcnQraodBivQX5iPyol410tEqTlCChiTMUIUZazgTYwWi1tfLOY93qTad2VcYMiZHcWDaPJks2MbGWWKB7D3jZ4rm8QtMwEHOZJZqsi59ws+ySWVglWvqFqMinOuFagoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815426; c=relaxed/simple;
	bh=oOlAKObgTBfIvmDjUZmrM/V03cx5P3HhBx0GHezmA/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH7kt3kb3cbiPPyA9aEc+kCwcbAL9UV9wzFB2k7HIhqtr2K/L4IkvNqI+r1vsNVUSsC7x/Fj5e/f1rQHhvLtyJ1Fd0rH1NajgyjqyCHJp0aZaLEbRGcS9YvQsM3p11NBfIWvd6Ty0YkFlO2/A7fc+3YquKV0iJv5b8J0umimn8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vgHWBa4b; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vgHWBa4b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6C0811A113B;
	Mon, 12 Oct 2026 14:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D4F5601A6;
	Mon, 12 Oct 2026 14:30:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D0EA11D70508;
	Mon, 12 Oct 2026 16:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VskafZl3EMS3eyL37u/JduD2RMDkb+58+PAofJgKdgw=;
	b=vgHWBa4bLQM5FiPr3TUKfHGNQmGCbDiDpK27WlVC3ZVYr7MuDzdiQpW6DT30s7peAQC7hh
	DVL25/Y46UaNq0Roa9N9Yz8b7rltdd/tm8sUAcnw7dBQgwzLGwc61Fey7Fo2SWQkEtz03m
	uaqLfMitD6if6TCsGSZkLuUp9XzUF2BWf+lsPFqCCivonlhMlo3FJm+e52jlgGTUmOAn84
	0iHTGwsVcLRezN/R+nAnoEHsLQOlCbKC8lQUSotgraiIKFuTmKDyc0RZ9Nh6iXt2kq2XBX
	KZthhgk6i6Rpj20DW6lKf1c/yB340pBC3bPFhECPFL7HfJ7in8rZcJ0xmlzKfg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 12 Oct 2026 16:29:52 +0200
Subject: [PATCH 2/3] drm/panel: stop mentioning deprecated
 devm_drm_of_get_bridge() in docs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-drm-bridge-every-panel-cleanups-v1-2-0fd272f486b6@bootlin.com>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The kernel-doc for drm_of_find_panel_or_bridge() still mentions
devm_drm_of_get_bridge() which is deprecated. Update to mention the
currently recommended API.

Link: https://lore.kernel.org/all/c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn/
Suggested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..8f35654c4650 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -1039,8 +1039,7 @@ EXPORT_SYMBOL(of_drm_find_panel);
  * return either the associated struct drm_panel or drm_bridge device.
  *
  * This function is deprecated and should not be used in new drivers. Use
- * of_drm_get_bridge_by_endpoint() instead when not looking for a panel, or
- * devm_drm_of_get_bridge() otherwise.
+ * of_drm_get_bridge_by_endpoint() instead.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */

-- 
2.56.0


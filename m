Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664670;
	b=txJVBf4aY8yRfS+FPsdxgnZCN/lAtjeR8JR6ANclP6LAPrZN2zQCpa7nauiDtit2u0B7
	 5Ci/+3CmTybOv6bkXgs8D5Rif9//7Dey+15YdL9h1UU1I3zilTPzxOW3rWVXu7TuXboRA
	 azgozf2RUGZl23sJeaEK1zagfMIU4eLjHaK/XtWkj35e4aa8LrKUZfTK+ki4JSS8s953v
	 PMR2mpjFt9Qx+ixSgifezvecsBBAr0j5+2Qjltxv5xxJXhA7dKv1fynEh8XmNkaQobvkr
	 iRY5xSZ4BZsS5sZ6ii4h7BhUHnkhDyI50Uh7KgFov/3uVqAnJn1z6+vQlh5HuTn8q8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I1BkrDs+HovYsgHM3nZ2gQpbCc0PGvvE+im9VACCnKE=;
	b=lcz2lFjkboYXMsKx7AlLZCPXXDSggNqFvQXfKzShDEebOVEVNLOlDE+kmBKK2MtsV5bk
	 mqBZCFMNk37QF3+Z8mM+u2vgURxgw8jcrjRPuADws3OtGHBPm4/YWggS30CB25bKuNMXR
	 4YCbc4rH6FfDMTx5eQGiulxX9JlHJ9gMrGSJ6vnjPHYF9hIOcVBy0A38JMYB+ElNZ2WC5
	 eH/Nwc/HV7CkYJr7iHtt1n2X78wQuKmJcyH0fa8wkggqFGqLTrjimulNueU3UWU1M7gOe
	 L2UxV3hhvDPoeFpfTm4aWnnyxhD/miIdmRK+BmL9T9rHxAQq18hC4CYmve5bmCCY6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ODZBRGN2;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A1606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153A1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ODZBRGN2
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so5268386a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664668; x=1795269468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1BkrDs+HovYsgHM3nZ2gQpbCc0PGvvE+im9VACCnKE=;
        b=ODZBRGN2FprQzu3c4Fa/CalY7wA9KYLODUXU9OLsokrB0totNBG30WAaZILVCl9O8u
         Y6F8Lb39oIFv2dFHavPGjvuS2vLXraqWa2g+LMlzd6OiKLlQNZDpnpQ0Nwig2fWEstlI
         NZZPZkzOZhVNL/s+of2QF6JSeJ0EoWwILb+7QCM2H4OOu24NX5+0zLXoJUf57uPOQO0M
         Aj0CklSgL7oi2dysnTYJfMnCpRXBBQG3E+w3uRFpOC2CvTkIYVVw23w3MnqlrbX1lFto
         IsLRmvi4belyZGwclDEuEkBQqVth/Y5JrnE2QeoI9f1KZcrBnVpRuvT1kicYVbabfcaU
         tdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664668; x=1795269468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1BkrDs+HovYsgHM3nZ2gQpbCc0PGvvE+im9VACCnKE=;
        b=22NlMH2cNyCdsh4K2gEwZkqgHczPP+2xL29r+/PfJz0u7qqxv3c1MIpNUuWFPCn4xo
         V8fCA8kWQs/We8EI6NoA/m8pRXsj2qp7ob6My/UasWmXcGNtbgc3G+sOdw7P67DVkd+w
         ydHIEYpjW95qfOji91/1rpbORJMrbaHxYE4KFVSbIHo6PJqaTfRZCpOf8m6FjIEPVA9m
         WpgoQufztsigPhdknnxu0TZKmomTvvSdF3diR0s2NGR3rwObniL6t438zAu+qmFK6ZVb
         /dEky4AP97yLtYRrn2qgelyqjTLcqx08IjHRBy11E5MTLaWiIQLqoiELXBGOUthsToxX
         zm2A==
X-Forwarded-Encrypted: i=1; AL+hErFFmpiSl+tJZuydBxfmOKbysszmFUGMcYIPVG2YgxjfyeZk4v2b9pyiR6xidchLvZs7kE6lIKabqN0il6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AYDHIdxH9NzDseSB/2aXYmV/fms//4LbGWfYX03uKPppti+Jk
	WcrnNFcylNFyNuKfEgulvp+9ucUP3ulk7Hnvbo0uo8UtdR5z86zQ/t5H
X-Gm-Gg: AYBFou1ctKQ3Njcqp5vfZgZ+eltnb8aGItpW/jP4DDz9XPjmJIPMugk/t8tx3q+gqvj
	4S4nN08feL4YnjUyUinyH/90SnCMrQzzxBljgVthFG9cBNsIDaZIQnbJWi32ifesbfF2h8YZnAy
	Ro+KNqSjoSrKQDTKHzT9EauI8emNwokHqrBeCX9KfCI/oij97ncliUiE9xYdlXeVmftMB6erUQf
	fW81IXQCeFezqSYnaOvGZeIi8SmaSI4EcjIHBO9wZiPjHzuX+QWRXdf6NUkMbQDU7RM//nOjf9l
	N56UFlm0wAuLcdpI2Olx7PgmmQNd12D4r0nc7umCcjMo9ExYNnF28D4wejQl98m3uQi/LUkA4Du
	kWMDxC8/j7NF88ATFixXxXHBTN9nVrbWwmUEngOjgwB6fIsAdSbg0lnPTwfFn0JSzWu1qPE0TLI
	Afvic/iXAQxHE6lTzZqa9LlRVeSYXgEmldUpZJPv3jHgAby/KTIZLkMFWD2C1ct9maFYro64gV/
	i/85SySS0b+5uwDmRRK+2MU34Ie+p6mHP413T4BKTWx0L2g3a2keuoB0MM1M6Q9NfVMkcMuUhL1
	fsZQ4SFquNZUBHL/EvxACdn3HZCnpsVll/LtxL7UX4W/8DRulzHVmcVy9MEnf+RAx7d9JCQu3tO
	gZV7yrhrruw==
X-Received: by 2002:a05:6402:5412:b0:6b7:d189:6041 with SMTP id 4fb4d7f45d1cf-6b7d18963c2mr3488558a12.2.1794664668038;
        Sat, 14 Nov 2026 05:57:48 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm2231929a12.24.2026.11.14.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:57:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/panel: panel-lg-ld070wx3: Add support for get_orientation() op
Date: Sat, 14 Nov 2026 15:57:17 +0200
Message-ID: <20261114135717.142047-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Implement the get_orientation() operation using a standard helper. The
Nvidia Tegra Note 7, which uses this panel, has it mounted with a
180-degree rotation, making this change essential for the device correct
work.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
index 0280addb6500d..eed1dc1e1bc31 100644
--- a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
+++ b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
@@ -11,6 +11,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
@@ -24,6 +25,7 @@ struct lg_ld070wx3 {
 	struct mipi_dsi_device *dsi;
 
 	struct regulator_bulk_data *supplies;
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct lg_ld070wx3 *to_lg_ld070wx3(struct drm_panel *panel)
@@ -110,10 +112,18 @@ static int lg_ld070wx3_get_modes(struct drm_panel *panel,
 	return drm_connector_helper_get_modes_fixed(connector, &lg_ld070wx3_mode);
 }
 
+static enum drm_panel_orientation lg_ld070wx3_get_orientation(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+
+	return priv->orientation;
+}
+
 static const struct drm_panel_funcs lg_ld070wx3_panel_funcs = {
 	.prepare = lg_ld070wx3_prepare,
 	.unprepare = lg_ld070wx3_unprepare,
 	.get_modes = lg_ld070wx3_get_modes,
+	.get_orientation = lg_ld070wx3_get_orientation,
 };
 
 static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
@@ -133,6 +143,10 @@ static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get supplies\n");
 
+	ret = drm_of_get_panel_orientation(dev->of_node, &priv->orientation);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get orientation\n");
+
 	priv->dsi = dsi;
 	mipi_dsi_set_drvdata(dsi, priv);
 
-- 
2.53.0


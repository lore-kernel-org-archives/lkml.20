Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949978;
	b=MABPsehk1umlZ69BT/cDN02xaPxexDpbZogFcEFnEBFqW/vJYJXrWIo3SsoIZ0lw/aiE
	 7KTQwN3og/ngBwO3w4X4QZZt6xXvpmzqmxQGle1gzdvBh7BxAcuwb9eR58aXFw34DFFHO
	 n6H6bbX96sh+iNsEgitG16ks70obUY1S7jnPBLFkb2+Mk9hUSeib6tJmG0VpYSWbzdEt0
	 Fa8GZhtaM0+K89mZgrttt35M2QH/mm3gUn8PVccfzwmxnQXtwwEhiZ+qhFXtPeGrYx4Z/
	 w5BYRi67F3a+Ljylv7CAx/6wi0erQbVywvrWwa8xRdtLiRgsIWPXLE/uEy4GdUYvffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
	b=ai7gJzR/KQ60A31wz2H5JddOaRUYCzMb/diFphbEjUMpPBSAUGzyBGUATx6W2T0kXCuO
	 80cdTAlQ3/RfjPgdHMJl4Lq2E96YKOa9A8NKqnkGXJvV8+l8KFqnDGffacdq4OX/AE6lT
	 HkgyzfA35slX2hcqB6PHIqypZhm+rZr+BrH5rp8hbnHfZLaX5dhv8SmLieRE+VFY3cSS4
	 ZWQjzHu8fySgmc3QTVED+0m8ROAzpF3OK53+6tI90UFBxeZzWzR/b1z29rAbdddL6fCiu
	 0f9SKISC8bBdqRafD6XflowYZSkdwrlF/wMrt9IubKNGIUX7KCm/yBr2dxy9j8BqHMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwmut9Ga;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377F606D810
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F377F606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wwmut9Ga
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e940d5d2beso965015ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949977; x=1794554777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
        b=wwmut9GadiMoOHRx7X68DKO9jBcSnJlN8hSTjT1gvaC3YKyBqjxQ1+HIlYK8iClGdq
         uNt7JD+2lb9SgHWGTDAknbBJiECFgPslB5jKhcTuLdpt4hAgVYt2d+6GPju4aoMa1Ei+
         UxjzpbVQuiVbQnxgXzq1QfPrFUPuqela95zoubJ8VG/75Td75zu4QuOFMasRzZpo9+hw
         GwE6tvGtA2ihngoOWUnjQyM9DwJKpEPqDLZufafQHg23bGx/ihAeAVtRReREhJs0LDBx
         6mj0jPsmyyvcfxAw/Hsr2vewdetw3tauHnDLcFmzy9BPkXdWl/lFOkNU5izuLN0LaBk4
         cxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949977; x=1794554777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uX2ZGs6EwvXrx7z1KhmYJO6G0yNzijk1f5Wl5IdM9HI=;
        b=VwVvLkpu2LvaRksBgNLg/7OmciUVWeTE4bq2oQf/51/iqx7BWkhNnhdVtS26NL1+YZ
         arF85hKh7R+QiDFWaWsIDrR31JjCSPTYzn11miAJEP3zJQJ2Qa5WQfBGRuOCmug+j7yb
         DwS2nGiU7F2JMUlz6om78ywtJKhSBXC7EE1jj5arLf0HgacDuBA61lBqbciAA4fkL7XX
         X2YuhAqfOC1nhCtq+QeYHvRtc9FeasatrT8Q2g1LGL2MaGS4Lg4BJP1yE22O5xBY+TF9
         xh4CJ3hU5kQb2WWaMEibs3xcJjedRVVnnZsruE/IoQrIz/GxW23Ig9amx8wOFuu3cYbb
         tikg==
X-Forwarded-Encrypted: i=1; AL+hErFDpGwgpqMHBAWIVFbiFHoDw+4RHViZZURxGtLt+R2NqenW6SMdCavegaFipHVqFfEhpn+w5QdHbiJhc9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bh2seB5loXdMFl6HkZPRZRgYpWF2AnCaTGA0qYyqcR2KnKIYT
	6jsPpO+UKxlVVNUyGMe6LnF2ai3S1TiA+2g2uaE2ppQbyrbeDn+2XWdx
X-Gm-Gg: AYBFou3dxXgoROMPTQshKdWDYGfxJv9eCC470lfUJPrHxZ1utMH3BDm8dJfgXpWJNH9
	4wlyPi2bkCuCdZLNNxaqPs/qHOh5/2cioloEzo640xqR9uSlhB30I+ptfHzb+6Zus9YbP49bN5M
	jfkmX8mBhI5ZmVZ5GO0maE0AJMn9v8GpHEV7nxzT+/45ewBM1whIC3xYvHcAtEymuMtlHPi+cGs
	F+EAqFhrht99pQTJGUYuOgsM8/JKiwVNK+uyN7b4ijrgyxrmEwkfNTnH8ITosNhE042OO3ocj6K
	y1C9v84rrP0rqiX9soebPB074O87F4/0wYXZwEIQZBlLDsSdgNENGtFkFPvQSFwZOwhAT+RPfJ0
	Z7Yfo94MEYPfmSTjpZRiONvQw5I0izdEA8lB54Du82XsBNJ4luFK8L+ddi/f1UT2wi8Cuthcl1y
	dkCxz/oP7ZhIp9MjhT6aTYVjSIQlRohTMp/k3XexvsNxn4lWql2moPWeilw1sqSAQsc6OC0gRH6
	awTNS5J+PgdjpjiDCeBty/VV3XjDPme1uyNvJdHNHNWDLyba8u1KOWKDGJeBpvN4YEoCI7o4aDI
	kvaUMSONvGxjkSKAwvCl5blLm0vDkFzfWFWynM4ETqMd6OcM+yby
X-Received: by 2002:a17:903:22c2:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2ed409890b5mr21876185ad.21.1793949977227;
        Thu, 05 Nov 2026 23:26:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:16 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dmaengine: pl08x: Use the channel count from the device tree
Date: Fri,  6 Nov 2026 15:25:59 +0800
Message-ID: <20261106072602.77560-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106072602.77560-1-mmyangfl@gmail.com>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
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

The Hi3798MV100 DMAC is a plain PL080 except for the channel count: 4
instead of 8. The part ID does not say, and the driver takes the count
from the matched vendor_data entry. The entry is shared between
instances; the adjustment lands in a private copy. dma-common.yaml
already defines dma-channels for a controller node. Honor it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 9f5e4f5fb877..27c61a7f2082 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -282,7 +282,7 @@ struct pl08x_driver_data {
 	bool has_slave;
 	void __iomem *base;
 	struct amba_device *adev;
-	const struct vendor_data *vd;
+	struct vendor_data *vd;
 	struct pl08x_platform_data *pd;
 	struct pl08x_phy_chan *phy_chans;
 	struct dma_pool *pool;
@@ -2698,6 +2698,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device_node *np = adev->dev.of_node;
 	struct reset_control *rst;
 	u32 tsfr_size;
+	u32 channels;
 	int ret = 0;
 	int i;
 
@@ -2719,7 +2720,6 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* Assign useful pointers to the driver state */
 	pl08x->adev = adev;
-	pl08x->vd = vd;
 
 	pl08x->base = ioremap(adev->res.start, resource_size(&adev->res));
 	if (!pl08x->base) {
@@ -2727,6 +2727,17 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/*
+	 * vd points into the shared id table; give the instance its own
+	 * copy before anything below starts adjusting it.
+	 */
+	pl08x->vd = devm_kmemdup(&adev->dev, vd, sizeof(*vd), GFP_KERNEL);
+	if (!pl08x->vd) {
+		ret = -ENOMEM;
+		goto out_no_platdata;
+	}
+	vd = pl08x->vd;
+
 	/* Release the reset before reading registers */
 	rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
 	if (IS_ERR(rst)) {
@@ -2756,6 +2767,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		vd->dualmaster = !!(val & BIT(9));
 	}
 
+	/* Read the channel number from the node if specified */
+	if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
+		if (channels > vd->channels)
+			dev_warn(&adev->dev,
+				 "using %u channels, instead of %u from the node\n",
+				 vd->channels, channels);
+		else
+			vd->channels = channels;
+	}
+
 	/* Initialize memcpy engine */
 	dma_cap_set(DMA_MEMCPY, pl08x->memcpy.cap_mask);
 	pl08x->memcpy.dev = &adev->dev;
-- 
2.53.0


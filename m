Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D3311968
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486686; cv=none; b=KnvCsrow30wniHmx+VHKLDJbcipxMIQMq9GXWCMyc9SM+YHdcabVDS5LxJ9Jzgzk0OSclEsRua3jn4fOyutW+CZnX5F5ojkSItyTUYjKAFrUCgfSsLl+ymiG9qpu04eCEHYFvWlSvzuG7c6pqZ/Sfzhf5Uk+37SrUEbclY50Kcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486686; c=relaxed/simple;
	bh=1ZFbhgLc7iYsjM9ihQg+DqoV4/OZ/W8f9SOi8aG36Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WSFVjPR6BDK824baZIH3nlkqXMffhzjD5T50GzWSoml7bolr1A8Ps/PDg6QM8J709mz9S6I/19CLINSbvLdBxIKvfUrePDkPchNbslxk/trJg77sv+85WA3jQ6GfgJ2FSsAA3GY2xyhHIgZJhEwtbO9LdJspo9YhAF/Bvm9MnRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ephg0Tut; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ephg0Tut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=si
	s/+DaxI4itjWYTHAoL7wDYbkKPw8C5NmpJsIhRf68=; b=Ephg0TuthCeEzf9OuE
	j0dBa0T8SUgUvacN6HLQfo7fCKrM6esp50I6uqvI5NdeZKA1jdDQVsvkxuRcDR5t
	6FL9iVJsxS0w0YRYjDAmo5IlAzj8uK3tF5wNW3OXouYAffGaa0qenfrjPW8DbNJn
	MevMwnizK2rMxRXUYYLrDDfH4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3l+rKI5pqcI4tAg--.20344S2;
	Fri, 04 Sep 2026 09:50:04 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: inki.dae@samsung.com,
	jagan@amarulasolutions.com,
	m.szyprowski@samsung.com
Cc: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH v2] drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach
Date: Fri,  4 Sep 2026 09:49:58 +0800
Message-Id: <20260904014958.1572918-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3l+rKI5pqcI4tAg--.20344S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFy7Gr48AF45CFW3Aw13Arb_yoW8AFyUpa
	1Ygay5Cr98WryI9F4xXF48AF1fA3Zxtr4rGrn2gw4akr4DJFy0vrykK343Z3s7CryxAFs0
	vF4UJr4fCF4rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjuWLUUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3Qw962qaI8ySpAAA3u

From: Li Youhong <liyouhong@kylinos.cn>

When the Exynos DSI driver was generalized into samsung-dsim, the TE
GPIO acquisition was switched from gpiod_get_optional() to
devm_gpiod_get_optional() while keeping the matching gpiod_put() calls.
That combination is wrong for a managed descriptor.

However, dropping the puts and keeping the managed get is also wrong:
samsung_dsim_register_te_irq() runs from the DSI host attach callback,
and host detach/reattach can happen without destroying the device that
owns the managed action. A second attach would then request the GPIO
again without having released it.

Switch back to a non-managed gpiod_get_optional() and keep the explicit
gpiod_put() on the request_irq() error path and in
samsung_dsim_unregister_te_irq().

Fixes: e7447128ca4a ("drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge")
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
v2:
- Prefer non-devm gpiod_get_optional() and keep gpiod_put(), because TE
  GPIO is acquired in host attach and must be released on host detach

 drivers/gpu/drm/bridge/samsung-dsim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1862,7 +1862,8 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 	int te_gpio_irq;
 	int ret;
 
-	dsi->te_gpio = devm_gpiod_get_optional(dev, "te", GPIOD_IN);
+	/* Released on host detach; do not use the managed get. */
+	dsi->te_gpio = gpiod_get_optional(dev, "te", GPIOD_IN);
 	if (!dsi->te_gpio)
 		return 0;
 	else if (IS_ERR(dsi->te_gpio))
-- 
2.25.1


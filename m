Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C34A3871;
	Thu,  3 Sep 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437440; cv=none; b=JMV8THBs8N7JOkYndw6nPsuoUzClGL8d/G5tx4JgeQ0OAdaPYv6mlkCQA79KOvi0lCQ4AdB9nCyysh6F542IIYO508Gyw9jQ+9eQtN6ZqYcf/8DdKHMKWWDPMiVorSkRoqA0oZQbBLLx7taF2x2HostPtgte2XavNSgPgxr8hsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437440; c=relaxed/simple;
	bh=MyFzBf3tjtdNgV/vWPpfQ99bdCRM8Kj6IUXp9pYogAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyQBOx75kwwdQrau9+H4gYbBuolGwfhgpjOdXC2BaB1iH16CoZA461xh7Z4xeU/qUWYPGNZ9GPipqSoPo/bc4gE3EHq4c0xsqHdDCoKcH8ykYCGctBQ7VOb0CNnRAjrmFiZyhiVKcgtbr/BcA1MxBAtu5V14e2Tv+M7T40nktwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EZkkM3wB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EZkkM3wB"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B81CC4C2D;
	Thu,  3 Sep 2026 14:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437336;
	bh=MyFzBf3tjtdNgV/vWPpfQ99bdCRM8Kj6IUXp9pYogAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EZkkM3wBBkD9CRGcmAbtJk3iGceghnxi051K2QlCwqDiwTCxfN26JAtEO6cOabwlv
	 dir7vSC/ZGPU0pSsyK+SDUPfr6FqaTIFCHGicNNVqvASmnhWGNgiYnM2ve5szruWdj
	 gPgyKw8CeG304BgWgfwQ/EaW/mVjvXvQ1KXMkLoM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 03 Sep 2026 15:09:59 +0300
Subject: [PATCH 09/10] drm/tidss: Drop WARN_ON() from tidss_runtime_put()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-tidss-pre-beagley-v1-9-93928baa8b12@ideasonboard.com>
References: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
In-Reply-To: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=MyFzBf3tjtdNgV/vWPpfQ99bdCRM8Kj6IUXp9pYogAY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqmWOpVyaa2zgD6W512xRZVHqDdcPqc9R+5PFvW
 PPz0lJ0lzOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCapljqQAKCRD6PaqMvJYe
 9aY7EACx/+vvDDUtn3IoXJJFNivHmmQZb3aCgDu/KZRwp1BTrPV1vRKZqVDV59dCW3MkxUUoc1y
 4HHSq8JK+E/qs8RgkpkBpxROh88Es83CQBHHXbornDUMwcu7ekGGkzy8Rj+nBGqI2Uib3qU9Dn5
 UFMgHL4qkLqIl5goqagU8epmckldHfY8HwjOewN5D/YodCM4zqYAmjscBy5OQ5jPu+aUREWNPFc
 5ITwr/Os2zwZo+huwaXMR9e+Hd0sx2oN+VNPFkUvPlWSSU/Mpsa8XO6HwU8dCzd3xiJMg2up9LK
 V+rTZBWCxPaeZYbP3DIoHx9zt3smntSdw3JH0BNVOh2R0XxBMo5pS2vbsQ2LmsdeHGACQEXEns5
 ejB6+0jqt3eCaz9OlrX+HVUWpkME7tFKxwVWMGVMoU6QlNV6zL0S5MEAswoLuRjwWEYLoWKmMZR
 gWpIpoWCNP6up5+ahsoXN2q2nsFe4s+O3YixzyY7xF53shvswoowH7Jjd9I8oTG4+zvNbbN52r7
 SL0SEj29WQQxIZ9ajKJV8BQLAdsdzl+Z3QT29uLqkvXJn4HF/ECQCj5GLOzQYVKqfwE8tyt2Ml4
 jFWcQqOt/7Wl9B2hnqpKPJScdwHWzZLAvqpaDIzcA4Pin7YPBw43kfQ93s3/OtRqMQcJDPEzMmB
 Z2qlbH02qgjIwkA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

At the moment tidss driver has a WARN_ON(r < 0) for the
pm_runtime_put_autosuspend() return value, to catch unexpected
situations, and at the moment we never hit that warn. However, with the
upcoming change in tidss_oldi.c to change the OLDI to an auxiliary
device, we will get a child-parent relationship between tidss and OLDI.

The OLDI aux devices are children of the DSS device, so when an OLDI is
active, the DSS's child_count is non-zero, and
pm_runtime_put_autosuspend() on the DSS device returns -EBUSY. Which
then triggers the WARN_ON().

To avoid that, drop the WARN_ON. The -EBUSY is not an error, and it's a
normal situation with parent-child devices. Also, with a quick grep, it
looks like almost no driver in the kernel checks
pm_runtime_put_autosuspend()'s return value.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 5cb3e746aeb3..44b0b009c29a 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -40,10 +40,7 @@ int tidss_runtime_get(struct tidss_device *tidss)
 
 void tidss_runtime_put(struct tidss_device *tidss)
 {
-	int r;
-
-	r = pm_runtime_put_autosuspend(tidss->dev);
-	WARN_ON(r < 0);
+	pm_runtime_put_autosuspend(tidss->dev);
 }
 
 static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)

-- 
2.43.0


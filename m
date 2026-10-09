Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE34D956A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549290; cv=pass; b=gWqZUty+jIOGdh+apkwZTimJD+cFNupxOBfCA4R9CzvIY8FZCDL1PwgLXqN8jHnNsgtITACn60BmssXNbnRfvPQCbumJnQX/WXmu8YdopJf8qNJu3xzjy7LBNEqYw0uA0XFW8jLzS2KLwAWGgtB3Q/0Pbtdhxdi+cOqIMCkAxEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549290; c=relaxed/simple;
	bh=lnZA3WBfFFBXieQiXa+jWZXXOpFpf8LSvl0zyNsSIDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBoIAAKiVED0ZbZQdV5nihvrX+GF9V+rtE3CUgwQkCdylQ9RhRXrlXlV/9qnApyvexJz2JerxiK+9r/VIpQUsfGsgQ8CVCs9OTmq6LssF4H7rGKbBYxv7Y6ySSjh+5TEP8lcCNfcsZYDzwlvG/ydiHvSl87y7NZeIE7rKQAj1g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Mo4TXVS7; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Mo4TXVS7"
ARC-Seal: i=1; a=rsa-sha256; t=1791549263; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dt6bfDNGXEI9qeS2w2X4aUNrNj4HhDdUCMtZmW+r7XzDzhJGKlsJ1unL9PGRX0b1qEyziYdQujqDxprLrzEtPc7zkvmk8OW9b4KBJVxCXoCG9Jtq7Qd0iCgzU17NH4GfA3eFUfZxgzq5DPXMFBFGztqI5nIsG9y/Yv0tgiRjwVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549263; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cz7nlaO9ug15k4wyc2p1bB4V9NQP7yWcZzYPbXi+vXY=; 
	b=FCU3vddsO/iUP8T7ExeX4ufzrToNAImLAMf+18791Ttu8WCYmkaeUVVe0+Xh3HDlBNzaaNkyy3siE4F+Sn3a2qIw7SzK+3HAm5eZib2nMW4TK/4AAFui9fObr1WuwqTEJCRpDtXrqwVWBxp6aCUxwXi8NNd1Pa6dFrzVYRTnqRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549263;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cz7nlaO9ug15k4wyc2p1bB4V9NQP7yWcZzYPbXi+vXY=;
	b=Mo4TXVS7KU9AYU3wEL2b0msxNCwOK0f2ku1jvnchtdNILAMlHFKCWKctW3tplUvx
	HzgrcUCcS5ZzxH1rztvjJbipC4Z38USXEG50xnR7fPc7JNG92FATC0bUidyZxYWUo65
	5k9c89JOiMhJDDSvJ6qdFVE41xMshoXX8lxLrHmA=
Received: by smtp.zohomail.com with SMTPS id 1791549261164883.385078668964;
	Fri, 9 Oct 2026 05:34:21 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:33:51 +0100
Subject: [PATCH v14 04/15] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-4-cb743b3b973b@collabora.com>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
In-Reply-To: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=lnZA3WBfFFBXieQiXa+jWZXXOpFpf8LSvl0zyNsSIDw=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8ubhTtFR3Y0PZnwDS/GGwVpsniWgYXWhUpN
 Nk3wNgZyO+JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLgAKCRAOJn5M7lND
 PYN0DACI3zjhdJQSW5smPXZsC849wm9gxqHFhOoD/xHK/CezCdngAv1jEewbmWcxqXkfU4Q7heb
 oJs0FreBft2pvyafR1BlNBXoGrauH6GFCtByTim5/9PQlFldRI/KD+oTrgQeqYvukttpGAgJNVl
 UKj+eHqkZw7dWrGnmJXhP9elwoELEup9xUpPJ46aBLhW2iJeDcGxkbP33BdWxKR9t3O7/Kud51J
 ORfM1S1OJOqb4GBHimrNRfZW4w52SP45ZEEGZHs1Fzg4JBtNYOC0ziWq7MTrxyR9I2w342lG6mH
 tzt0dht0xRNWtPqRrrM0bV41kphN4r4BQd1bSTFp2IsRY4Hrpx3eh1Az1x29kXEdQHg3ohnRmAn
 u/vnXEzhRHIweyWYl7ijpQpE+OduisWJOXfk39aBkFres30cOQ5+niEdOJkKwQkt2XxAehS78Zd
 ky/3+ul35wLb9+U5Ud5A8xKIy1+l303G1mY9OditIKTuJ+kuijPMPdyD/MgqLRDonOCGQ=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The clk_* API can deal with NULL clock objects, so we can do away with NULL
checks in client code.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 5bf528f41278..b3a53504bd01 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -510,11 +510,9 @@ static int panfrost_device_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	ret = pm_runtime_force_resume(dev);
@@ -524,7 +522,7 @@ static int panfrost_device_resume(struct device *dev)
 	return 0;
 
 err_resume:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
@@ -545,9 +543,7 @@ static int panfrost_device_suspend(struct device *dev)
 		return ret;
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 	}
 

-- 
2.55.0


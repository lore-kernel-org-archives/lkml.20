Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449929;
	b=azLVQdS/Wm5KX2PpK+Pl/3T+GShkYjzRMew1zEsFSxLgZC7dyg8pT7k9PCsMSihgfAJr
	 C5coggEhk6AKr8v3fZe3PT1ZE3UoKOKMUbVKAa/gAZncoxT7Vi8fjAUdpCatcXVpwRFaW
	 4mMPXhW8Vf1K3s817iKwN0BIfdanjUWXOYsn1NyqT6yFk+Xo/uhoXRtqq3VjBEcIK3eTq
	 paPmCLR8PXzNmtb4RfV/cPLJAnijnwg0TH1gKAcRljwm8z1pGDVCqdNjFoPtuTvV9H+ez
	 wKzNGfrfb8KgKFMhcoLe4ryS7ZitDlHofAFWFSy6zdw58q+N2rGfMs+tg+PXZrkcaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449929;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1I6r72DKG1tNPTFMYPE7Sd4ws+Iy6Pto2CWYIy0wK/g=;
	b=TFapZTZCG8tow69NcOwZenpSeRz9BEa9ZeK257MOseUROPmdqRHQ4jVQZATOMAb7uvpy
	 aSWmRXeXj+jxSJxCCSEGa+jYW4MmeT8cIaFf69rduntjw5wraVXs43ArJq/S+ZnQ8pmgd
	 bPieuBqeynjBfN0dkvaxQ2fRv3X5wFaKjovzIYChIDawa5Mtt6tinD73dxoJFwaXdvYlU
	 IMTzQ6eCSCL4VBu6uWFoIakAg5KzeE4nMCas5KBdfC2WYM1t2EKvv2KBCRy7ABGt5291+
	 wKTEFotJ/bBwTTVCzxN7J51EYB9wB9NH5lh8jea7/fxajXmrWbItFW7WGy6Qnr2dg6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o4mQ5O2Q;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F796606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F796606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o4mQ5O2Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=o4mQ5O2Qt5r/fgequC22C8WWMuTu+QVhIR89yry5u493aQDaH9j/OsatobXvvR91dMK3CK0WQ7ovs
	 Sm70e2SXhF5WKXqSktwUC+Fl18QgPN6Hqi+hh0tarpwYgAAY0WLWpqrOw3E9EToCy7wUMTilFdgRbP
	 rCt76HQCqd07MZcc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af52207dcf-b8347;
	Thu, 12 Nov 2026 10:18:47 +0800 (CST)
X-RM-TRANSID:2ee16af52207dcf-b8347
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af52205c88-ef083;
	Thu, 12 Nov 2026 10:18:46 +0800 (CST)
X-RM-TRANSID:2ee26af52205c88-ef083
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] iommu/rockchip: Fix device reference leak in rk_iommu_of_xlate()
Date: Thu, 12 Nov 2026 10:18:45 +0800
Message-ID: <20261112021845.1867-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

rk_iommu_of_xlate() takes a reference on the IOMMU platform device
with of_find_device_by_node(), but when the subsequent per-device
data allocation fails the reference is only dropped on the success
path, so the error path leaks it on every client device whose DT
translation hits the allocation failure.  The platform device is
also dereferenced without a NULL check.

Check the platform device and release the reference on the
allocation failure path.

Fixes: f48dcda8f6a4 ("iommu/rockchip: Allocate per-device data sensibly")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/iommu/rockchip-iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 21af2f621..793cbdd6d 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1185,10 +1185,14 @@ static int rk_iommu_of_xlate(struct device *dev,
 	struct rk_iommudata *data;
 
 	iommu_dev = of_find_device_by_node(args->np);
+	if (!iommu_dev)
+		return -ENODEV;
 
 	data = devm_kzalloc(&iommu_dev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	if (!data) {
+		platform_device_put(iommu_dev);
 		return -ENOMEM;
+	}
 
 	data->iommu = platform_get_drvdata(iommu_dev);
 	dev_iommu_priv_set(dev, data);
-- 
2.50.1.windows.1




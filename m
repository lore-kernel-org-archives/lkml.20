Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72942A14D;
	Thu, 17 Sep 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633576; cv=none; b=t5QL2D3P63aJuCiuAHQ1xMAP/0hcBpJ97iH2DZTUDUdj8cDRN3U7sQj3UK03wHJnhID9DQgS2SDVZHlJNYhnDWgOqcIEfVS9tRI5Jz2eXawlkRK7lyCgPvOOTdTXvl/lAcUx+MKP5+Q8Y9V4oFSZVHLNTqvl4483YpCxOrhbbC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633576; c=relaxed/simple;
	bh=Xiy1CMZcScJOjJMm6KuN9S/S57ILP1RjqYToK9VmGTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQUba6u9y0OMoyDf3qDZKTNDpVMvgm/dUgwzG+n+qvzWSiezA0KjkixGZdufWAi8CPWtXUbT40emfO3Rr9bCeywM6IG6KTKQVBoTIFa43RH/GXXrzxpkk0yPVIwRdYZ929dFJ7hFUIaYmU7s2fxXBfR7ucVZOb0qWn6MRSJo1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OFRFSD4G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OFRFSD4G"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0526A145C;
	Thu, 17 Sep 2026 10:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633432;
	bh=Xiy1CMZcScJOjJMm6KuN9S/S57ILP1RjqYToK9VmGTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OFRFSD4GTgAykqpO9WniQqkBXOBAWrTr5XXGF6fuOl4cahRKG/AN50xk8bghNzp5w
	 otg2i/rjdO8i1+k+rjJINzsC13s34xUAp3iuqukqioR4IClUadtyWosswzYecL38ae
	 0dpqTbEHqtWdTFz6QSPH2/Q/Mtxj4o5YH3qDLfao=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:12 +0530
Subject: [PATCH v5 06/10] platform/raspberrypi: vchiq: Add helpers for
 vchiq driver data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-6-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Xiy1CMZcScJOjJMm6KuN9S/S57ILP1RjqYToK9VmGTM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PT8q9tP2H7GWM7tGlpqKkxybWJ8CVhh0bYu
 QMrjuuNlpqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaquj0wAKCRBD3pH5JJpx
 RQMnD/93BJ/v6mmxPLxYiOP8KxdMVQ+jP6rFSlwk/sjLjKqGnt9DbX2y+7jIU6bjjuKtC3lmcVM
 Ate+0/5Qzmt/+EKhvtM7x5xhB2aKmm9Z4KC4IamURkLXZbvLVFmfuVlLKfh+mnWBSP8kR0+sEFj
 fSoDAr+n3TF1lZDrdsuSQXAnCGB1vvQ2jVEJqJEwVDb9MoP1+/BM+gv9wbgQPcF9oype5t/WX84
 jOkgb9uIdBM5Cu1hOlGjUQs4Ob5wvmIh66JuFi1csBKkH6VuwBJn2Q17Rk8zVgFLYwcacfgVDUE
 R04Dp6Beua/Wt3FK2Q5cwARAWwCtyJ+Zv4PWk7uvlSw991kHXYtKMqbt5P67jLZvEOIZ5D3Ee1g
 qlOgovzad6VrwR8qIshvid0oCt4FGymEQaR6b0b3f4i7ApgBz254/185FpiJNdkg33OmhVy4Ad4
 ADyhuCKLynaj+ktC7LMEQVJoZ68nfhfi90m5nJcb/LL5+GMTQiPjwUucZfHzOI4udZH3irIb2os
 9hEJr/plWURbIvws2k22UqO51E3TpJJtAMmMlJ8ElW472uJF98+v4J9DPbZMisykbIFar9ugivq
 cSkcvRDvsDqXp7VLRBYVdzG5HaiCf7xLz4PyZ61Gv/h1rVCsIynHzMzRi8sEgIaVnXQ1VqWHP+U
 3od4hBiEPUrvVcA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index e52291a3b247..513a144bfbe9 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.55.0


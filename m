Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662524F30EA;
	Wed, 16 Sep 2026 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569338; cv=none; b=i1x21vi7VMke6xKjz+APB7XikHZxwqkXJiEPhYjbA8SyPx9MXZ6kDlsqDXvfz5k4WBmaXVh+Pq2KszUiTqM9UDLRDfRryLZPe6ULhOy0D9lWsGM85fpS9nh+Y6gffRvMCviS+CK3PmIqYaJuOv70KmOx0VgBgVvQM8ceMde5upA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569338; c=relaxed/simple;
	bh=Xiy1CMZcScJOjJMm6KuN9S/S57ILP1RjqYToK9VmGTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIBHF0FAQXkSDPSjoFPWG5uo6XmPrRPm/pwvqclLrei39zWAbFUUJvKVETK+8bHGxq8fCz5gYcUKlW619iZpmhhW4Ohlg4C5k3rPuPy6MI8szvMY48eE6nwm907Zq+xrpR1QCZrVedE3vSpt2dmh4SwOaToaLjVKQFVIYK1snWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a4/PH+Tk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a4/PH+Tk"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D0E4558;
	Wed, 16 Sep 2026 16:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569231;
	bh=Xiy1CMZcScJOjJMm6KuN9S/S57ILP1RjqYToK9VmGTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a4/PH+TkOWRoEq51XagslVr7BGs/8NcoVZWk8v4BsAXvJBaPcqT2pE3Ma/LtPtZOS
	 tNZKZMq5YrIG4epc9TwSohk+r8OhEcGwyvFnX9HLcbzFb7v+2likgIECL4oFhJXd8F
	 21AMAPkdJzQaQvMeI1euUnHC/72ZGtoXLfNgxT8o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:03 +0530
Subject: [PATCH v4 06/10] platform/raspberrypi: vchiq: Add helpers for
 vchiq driver data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-6-f668c2017b74@ideasonboard.com>
References: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
In-Reply-To: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkL2nDBQYIgQZEMjwHJTOABVuyIDj1tZiGee
 EivyconD9iJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpCwAKCRBD3pH5JJpx
 RW4nD/0d6jWs45wpBMZ7V9xmWZpQ8ayU7iMedadpiv5pfNaIdKPKjPv+0UXrQf2n/YDRIKrt8ub
 AsXJAX499uSMFANgOkQqiEhR+5eRHMYNsJT+Mb8hvPvkEsd51pdKie/Qs5DoPuQ2qYFYuZfzlx1
 eOA4K0IJeVHltHv6nYbHLp6Nk+xxqWrNMRhjyh2S2VjpRLQkcnzi5cAAc/9TAylFyfUnY7gT/3m
 /n4b9f20dGQ8va5O6NNl7rwAJU/78ezLqG4hmx8oq1zL5YzFzkqMOLU27jZzwltXIy1tla2gMs4
 US2zXPf5vP/76MCeqgA1EnkekflIoKoNdOfPXtuPaTzoYqgdGG7dZXlNIysPrMHRAgDg/mAwBNR
 bSZUrs9sB2JfPSHqw6u39l1KPG8JXS47iTzVUVapYepi42R4o9VeB0yFyckt1l0KxnzRRO1bGAx
 r/50hROlk/AzDC1xE10WkNlFOIBcHxGkMDb8u+swmAI6e2E2LVaP0SjKeqL7XUS60XWp2UlGGus
 ZgWCp1dfnuLE5dPCP/AgLSnKdukCQXkbi7WCzpxIe8Qf9Y3/RJ/9VWF2ANVh0NLG7Ikc112YsL0
 IJEMbUL1jq3zB8bCYwlnRDZtAVlV5yaYWwM2gCmJyi/uvySYw62YQY+Zzq7mqZMik/aZGKxXMR9
 i1Wla3sOd8jsfPw==
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


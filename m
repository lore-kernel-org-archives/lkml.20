Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C213DC85B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392653; cv=none; b=UafKdQ53GURjDoo/zbR5YFaaWIIv3ltwveDMw4ScVNWqtK+bf7Jc7usPLiqwPFXonY8/kQkkdVHozzw9iKR5ADHGE/jHVstBkYKPGSPbJypxbW8Y6PIe/Z8scbjsh55mv5PB7JCp8bg7Yoiv3Zfy4ktl1RmMkxoWFC9AYuxOyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392653; c=relaxed/simple;
	bh=IE9uzs2DfEHR/K6U5+EleAkKoKjLhWPifcX2XlK3Wh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QY2K2nP5ZVFZtlpd4GSdjRVlDqthqB8dRMqe71q7YEBXz1rgxwpzpMJRThkII7Od6PjMQUb3JgYWFW33m2dTI0o5oJH6vCrER2TPwRPijsgLuP2m86ZQ0au6WiFPNWyfUB+kSLYnPjzxHnUWlL9OR8z0NTqbp3V19QxbeZ5QMIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFWuLy/q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFWuLy/q"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so12866865ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392651; x=1789997451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJaElS3MZVd4zd/Sev0Vi87r/VeJDnrTVpf4OPQWFKo=;
        b=IFWuLy/qEDvgw/Hkb53foLb2aki69NHhPf/sYVe8ybe5uNx1ifXSvSxX8Egr1d+3H0
         m9QLhO8fz2BT9uTjboHbia4N0XJgHrjCU0E5NoedA8naEw+zPvEH7NacltPJb2eHgtYY
         rnzfg1d75y1/PLP1mddD6xKqkayQCr5ixlkoTXOJMa94e9+rfukwoTwEm+21x28rBKWB
         pyyi2197cikfqnXRRz+zN3MDDdK6ujxVxJXZGd/F8ZS1wfH8PfwQBPPYv6gXGNyNY0ga
         KbYsd+AQBz6xNHIs9oT2gBK4zWrnWpouF8OOwfDpW8C6xqsN1b34Dto995LY+POB+pEI
         Od9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392651; x=1789997451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJaElS3MZVd4zd/Sev0Vi87r/VeJDnrTVpf4OPQWFKo=;
        b=JW6MU5KdCCIVkUamtpHiT1y33OuZYKqgdX99rxH2kcau3tZ/xwvryMzxJUKuvEDflh
         v6qpurCI4JbK8d+nWSlPO3DDbHvteXQuWbecjgP1Y2DtumlMK0jxTL63FX2u6m8VklEb
         kMCRTzTK43MZFLKb1bfqRuY6xY3eOtVlomSVCrO2qa9Yh5Fc+LVhQdkMX/BVD+5S/B1a
         QXgnhrLsA07jFeoIVY8FM0/vLIwZGbp+YDxU29Iw0V5ssL9z1YClDZZeEUUBwCg+qEsp
         fmkWPlhB5afbsOg8Q5vvOR6G7amvW716ni9+JSsDZnc3fzJ4WfK6JUPCT7+fRR1lhYcf
         qtPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfsA9kpEut1J6im08nDJE63tynhZNMuL1u9Lrij2muKJteqV9warw9XwKUHek5GpT4+XLZxjiq0KvikU0=@vger.kernel.org
X-Gm-Message-State: AFuF++kLNJaJVdd0eEVGkEv5cHMwbOlE4u6gGOIMoIumciq54qsgv5Rj
	hjGxgxZbJ/67/NZlnoPcpyTZzL1QIoSNBwyM8MZo18190znGvm41eNpy
X-Gm-Gg: AYBFou2xWxql3aVhgSUY32vyyxxoXTylwqu7oL7gznoggIBVZ7GrJs8hppsJl+yksvh
	DPYnNUoEaHOUMWkaMcBAq3CbLk2yeOJEB5J062R4srnwb3h+wStc+PIoGCCV2hjhQrPTQuAHR8r
	zb8KtjP52q1LhvvRNlPWDB1wIaYjNyNHvbZNFKDq0IhF/wDgx7bjgGqPN6vg32Uid7nyrP7VIch
	6iWQYWbmlkTNCvroITQGEEVnt00nwOIzxBZDqkcDfHfSWpxfxHMgXSDNhX8M+tz0j5jr6aWyQOB
	IU47rSuYqRW22LfsV6zwgqTTLdcXkvBX6tHoDktT+uDCcAzC3L1uKGTi9WBCSNBT3D4rO7TxTyH
	en8UDzLN937dU5zhsE7ng1bwkRn0RWiU03B+iukav30KShdDVEmo1P1M7rbofZPFZBOzID8yZyi
	a11ELHn3Q3Gydhvr/EP2d8kkESv9YzmG46PrhNv+xHuoxjjX88Z6n3GQ==
X-Received: by 2002:a17:902:f70e:b0:2dd:752e:6d69 with SMTP id d9443c01a7336-2dd752e6effmr6027245ad.4.1789392650893;
        Mon, 14 Sep 2026 06:30:50 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd428ede1dsm39850535ad.13.2026.09.14.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:30:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iommu/sprd: disable clock on remove
Date: Mon, 14 Sep 2026 21:30:39 +0800
Message-ID: <20260914133039.1732900-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sprd_iommu_probe() enables the optional IOMMU gate clock through
sprd_iommu_clk_enable(), which obtains the clock with
devm_clk_get_optional() and explicitly calls clk_prepare_enable().

The probe error path correctly balances this operation with
sprd_iommu_clk_disable(), but the normal remove path does not disable
the clock. devm_clk_get_optional() only manages the clock reference and
does not balance the explicit clk_prepare_enable() performed by the
driver.

As a result, successfully probing and subsequently removing the driver
leaves the clock prepare and enable counts unbalanced.

Disable the clock after unregistering the IOMMU device, once teardown
that may require access to the IOMMU registers has completed.

This issue was found by manual code inspection.

Fixes: b23e4fc4e3fa ("iommu: add Unisoc IOMMU basic driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/iommu/sprd-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index c1a34445d244..65a970ad4c9f 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -524,6 +524,7 @@ static void sprd_iommu_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 	iommu_device_sysfs_remove(&sdev->iommu);
 	iommu_device_unregister(&sdev->iommu);
+	sprd_iommu_clk_disable(sdev);
 }
 
 static struct platform_driver sprd_iommu_driver = {
-- 
2.43.0


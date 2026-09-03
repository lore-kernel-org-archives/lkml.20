Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B73A16AC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451088; cv=none; b=YLHmcCO2EyYOFw3ALnq7kbwQOQMqLwmIo5Eqw+vpQhbNY20w1yjFpmOi6Nyoy1ejoOADiw0sw9NwdOtiy9nPkCfrC3/tcFBpqdiGZK35Of8dSZdOkiECK3ppw2C6oEfGy6dQHStn6qSUCNIli6UsHMC5XhLZ303RZZ0W9SpQ0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451088; c=relaxed/simple;
	bh=M0ssDVSzbqa8xtXV0sIe0Flh6ZlUA5Hy8S+0BKYzM+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/1JOVMCSq1HsB9swwDFahv5ZD8/ZjWV5Hd4eK+isnkZCdrDbyZRp8Y5Q0mfam1kuk+2p4Aj8OJPgQ3LyB2r41Zb5Uen8kn4ZzgQaLXsRLfGVeVPFlfPMVksdJThV9oluEhIMeCsxt958h19vk+G9zkqcjnIZLHMndLxveEs+B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlCCgUb9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlCCgUb9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485852d03a4so60485f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451085; x=1789055885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6tKOR5KZSNLaAYuQSBE34bjWw9CzqlGHsE0UPAcN9E=;
        b=BlCCgUb9rf6fyTK7bdryRei0MAAYRo4VlvAOfpyGmPxtZQHLgVz/5e87/rwve3BcHp
         Aser5B8Occemu+bS96c/t6AEujKRTljoD1tsKabBIEtDUM4BFen6WJ2b95OiS8n28Wld
         ibwScjokI2xX9QLP5hNSeANno6FMSB3OUdnyNVeIO6O2xPBKnL9UkK1DuAm/BrTFd+sO
         zW54aZUkQKhcHYI226CxTSBeNuywRGMGVuPtnAbui08BiKJThdG7Z1pASQbx/diuZ4qu
         tRm64rJJi8fwcPzfFtj2sPKYCn2loCRBRrulCmfS8k9e/4Vp4OQ9jFFexpQG7sbnvar8
         86Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451085; x=1789055885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6tKOR5KZSNLaAYuQSBE34bjWw9CzqlGHsE0UPAcN9E=;
        b=gwZQGvXX6wI05uFr5UGMfHDXvrLwM+C/V7Z+XhoQ92aEujkhJGNrUEH6jqfgepcCrS
         QXUEfZJG2Cuzz/LDnxWg7uaXqkw2ph8pAHXMWrcQ5RTCsubAY80lcx7gPb0ILW8umkEE
         TPx9SMyfqkaUbtH99IR3aJN2pGfqEv1AIiEgfZSIhQsukHxa2ryOTeDU0Q208jHJtWYc
         GtDaALCbeGYWwq88Ule1ej6mmOD3Oz11f5DJbJySIfLCtRR96pIVBSHNXPKPBbHBL+Pm
         QSJacNd1hL09PK6h5pHy9o5R4oSrGIj8+276ldh3cw8bX8fnuM4Dq0m935mm1CPOuyo0
         VXWw==
X-Gm-Message-State: AFuF++mmSRSyxhAFnFJKq0VZgY9Ewd2XJlg21UVdhrZy6VSOMKZeBn0u
	yzC3PWsF9oh2h5dpn8as5nXz5bH2C2YGemkEnocDSww4sKlF2dP2UDlI
X-Gm-Gg: AYBFou2WD19wPplyswWs5CVo4xo2zac2kRh2TxXXdBVaGh2PSZjMynZ9pweUZycNPPO
	lbXNwkjWkwqN6+Tt4YlePSHHlmADRvSdiJrPaE5yzUK8vuiIQdaHi7K4BUBzyHw2/kr5U2FGiVM
	cytl6hqet9jdDuIN8sgXrjB2itLvFtgs6Q0kRMJ5jeRxg5S0qRK0Ke+3ele8Hb4yCwsY6Z5NhJ5
	MLEFQXqEfCLYnBiwWePVvO5ERH0ylrpAkic8P1MwWV1VNlqd0X/nq9KQBJ0x6tNbidZLHHJmCx4
	CCkFinfCc/5TAx95xLREcKSemCl11Yg4/D4lVqKfNG8BVFingDr82IFwxDq/LJAzytQSi4xY3h+
	UQOfL0zw8wzZZhTFZzNP4WvLFFoJ8bSuSSR28r5nw0VxEw1M8NpgvND5aQejIr4g7AtKtAKRKzk
	vs2hmHKRevMPxiPV5ziBuU3NwnyHrwaDSxyFG2qEjRm3lD2CMlmTescnq6IhlwrIvuRc5dXUVOi
	chIWg==
X-Received: by 2002:a05:600c:6749:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cf5be1647mr19593155e9.12.1788451084371;
        Thu, 03 Sep 2026 08:58:04 -0700 (PDT)
Received: from localhost.localdomain ([82.215.83.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e736a6sm14388587f8f.5.2026.09.03.08.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:58:03 -0700 (PDT)
From: Andrey Erokhin <language.lawyer@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm: Register the full minor range
Date: Thu,  3 Sep 2026 20:57:43 +0500
Message-ID: <20260903155745.3027211-1-language.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 071d583e01c8 ("drm: Expand max DRM device number to full MINORBITS")
expanded DRM minor allocation to the full range provided by MINORBITS.
However, drm_core_init() still uses register_chrdev(),
which registers only minors 0 through 255.

Consequently, character-device lookup for a DRM minor greater than 255
fails with -ENXIO before drm_stub_open() can handle the open.

Register and unregister the full minor range explicitly.

Fixes: 071d583e01c8 ("drm: Expand max DRM device number to full MINORBITS")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Erokhin <language.lawyer@gmail.com>
---
 drivers/gpu/drm/drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c808958a2188..25819c88c627 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1250,7 +1250,7 @@ static void drm_core_exit(void)
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
 	accel_core_exit();
-	unregister_chrdev(DRM_MAJOR, "drm");
+	__unregister_chrdev(DRM_MAJOR, 0, MINORMASK + 1, "drm");
 	drm_debugfs_remove_root();
 	drm_sysfs_destroy();
 	WARN_ON(!xa_empty(&drm_minors_xa));
@@ -1273,7 +1273,7 @@ static int __init drm_core_init(void)
 	drm_debugfs_init_root();
 	drm_debugfs_bridge_params();
 
-	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
+	ret = __register_chrdev(DRM_MAJOR, 0, MINORMASK + 1, "drm", &drm_stub_fops);
 	if (ret < 0)
 		goto error;
 
-- 
2.55.0


Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FF3A1688
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028086; cv=none; b=Cbfj3J2H/Q0Ru/Ae7ObaFHesd24ZFO/8kB2SrbxznumaSv8zB6esoHXpLb8vZLkjbqxrZPkpBJRAMTMlvFtxHLzu9T7+ehY4rOmePQdeYQLOP6DUrhZRBmdmj+e5QEQWpu+4CWm93lb5S1jHh2rbATTJE9jOx9tWNaTI4iXPQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028086; c=relaxed/simple;
	bh=IHTDjO5WIqUK7V7fitFO28OjUL+8J51v2bNHeHUdOhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGYEz2KJNaXYIqZDvFSA15Dckh2CfvoM9q7VCaM1arpv6OYXchgcEv7TdL5QZ7RI1HCwDyi1YPlmHpfYR52dx3fBGvSlHfV6X+hspvHB2SlhGyRwgvC/yCq459hQvD4+5PlEPkJ5tH1ZpZ2SetJ2693m85/GKAuTPQbBFfyMO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBpZ/UAc; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBpZ/UAc"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb7c0d89acso210760e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028081; x=1791632881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWokyEz4Bt3D9UY753kLyTpGkMOXSDWvaQDmsEwpG6k=;
        b=cBpZ/UAccwzWtX04gkyU3PXru3xw+u86VO/FMKs317WFyVTqqR0pBb5/NGIGgkUwgi
         8bj1DSPwVE5chqEdrY+t7Rdmy1QkSvW/Wbz0ND1e8fA5jUVFPcdsXBlzGdYGvvpsldE/
         sREBcIBTm2MJbH+WzsZQFHXc54dg+gGrmBFEhynl0+G2u6mjTM2dvoGrPFar1SIu/wXJ
         xceaVH8cGx8HgwVeggUjpPQX0Xy2J3j8pQbtdAufM/S9tn5dVgHx7PY6rhU69ZKkl1Z0
         Cr8PHpBZrkoVzeO0BKPuk9UN6u7CIZxVjFpCQJcWAiOUAF6IXqilTj+0/OGcGy/CiPBu
         mMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028081; x=1791632881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWokyEz4Bt3D9UY753kLyTpGkMOXSDWvaQDmsEwpG6k=;
        b=e/iopZE8lUnrTF0XKT9/lAl0iGjhn+pi2yrFmWE1we+u5Cm+N80onq/5G1kvpq7k95
         sf9htKFq4ON99r1IhxfiUVPSVYld+TxDU+LJDPBp/blTa7wYTktvUeuMtHVl7/DcYR8O
         YYree5VKbjMHwgB+rlXaqT8uNsg5bObDc8WvV8bB7ol0zXP7mDX/+wx01Bh9MnJLTjGM
         GuPihOkxbzviDe1jpHJADK3K1RPa16lrUulWDD2gbsB1UQxuJpI1II8k4gqTzza7fqgR
         c6FFnvh9htnzu1iQMPxVzSL+ErYndBvI2vaXEW4G5SF7YPILA0Eg0WAYPzQ4fi1A2Rxj
         0OyA==
X-Forwarded-Encrypted: i=1; AKwUvByc0cWuzCJKr0QqT/eegX+I7wMe7nRqatsSv1uDrwefkF31gGXiP9ieUfwyVsFZIBV5IoqWLvC85o8ZMTU=@vger.kernel.org
X-Gm-Message-State: AFuF++kx6JmlJPpV98ny39uKNlckIO10Pu3AOlvETV2QopU65e042UQ4
	KKFoFX6+GeuiQmI9M1qtlkZu9QVa4eY1WO1af2L9BRsp3sxD0SCfFDGZ
X-Gm-Gg: AYBFou2Hkl1HWKEnUAy24o2wZtVtsX20m1XaZNW7h/H1Z2nHVJCb6E3xPQ4uHzxbRhh
	781+KDxGywWj5gHqKazBo9miFFER3oIghvKjv6SZfMOW3RuYqmgpeSVjKM70hodkf2SOfTpVvdx
	Bgg5TRCrfIUj6kG/5ZXCJA854f48MkUA17Z4ZdfwJzrNqNKf4hYNW2IdrkUNRSNHSDxLP8gEV+x
	9697aQZeq1LclhARDhhKUUTlPylrZEY0dPn2B4fcjIfF6Aw0RI0+jzT27HvVLMfNI/fllSwVrBK
	4Fz5ELp+FWiMX16tV4SdHWajWXiyXMf61oVf4X6B7VLdv2JIcu14liOIxaweH/0JnwzSF7MrQ28
	aqBtjYKM0bc/pX5KKPY3d+LPRt6k7Gp9wddH4CoC0YH/KP3mFOFOtsKC0wUXh1Cy5taSsIqTKy+
	mj06GEOuxEBKNAF1HpoU7dp+iurtFn/gLfkN78PxaeSMLG/iR4mOu5OtVXd65BLeV7pWYgvNPWE
	OQDIgDK8sZX39VSD5I9CyXcQg==
X-Received: by 2002:a05:6512:838e:b0:5ba:37c1:645c with SMTP id 2adb3069b0e04-5bb9bc36e12mr1578982e87.40.1791028080716;
        Sat, 03 Oct 2026 04:48:00 -0700 (PDT)
Received: from TimPc ([31.40.208.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f212sm1493296e87.56.2026.10.03.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:48:00 -0700 (PDT)
From: Tymofiy Zakharchuk <timgooffical@gmail.com>
X-Google-Original-From: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
Subject: [PATCH] staging: sm750fb: fix resource leaks on probe error
Date: Sat,  3 Oct 2026 14:47:58 +0300
Message-ID: <20261003114758.1427-1-timofey.zakharchuk.research@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
the framebuffer structures are released. The write-combining MTRR,
the MMIO and VRAM mappings, and PCI region 1 remain allocated.

Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
release_fb error exit path to prevent leaking resources.

Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..456b3da86 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 
 release_fb:
 	sm750fb_framebuffer_release(sm750_dev);
+	arch_phys_wc_del(sm750_dev->mtrr.vram);
+	iounmap(sm750_dev->vmem);
+	iounmap(sm750_dev->mmio);
+	pci_release_region(pdev, 1);
 	return err;
 }
 
-- 
2.53.0.windows.1


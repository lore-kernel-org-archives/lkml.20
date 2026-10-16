Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE030E0F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135520; cv=none; b=ILMHiU3JLDJPjpDmqXTAStmz23RD7ZHdFyU2EqBwT4UMV8F3sgqLiEaL/X0/W/0w79h8dclwfbthtljL71tNoYbJTXIz08rfgkNo2njuJjHIFF6nthFYik0gPUe1Z616LFEjW26H9mASL9EoUGhzakU8scfTZi+GkI1v3QCVLls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135520; c=relaxed/simple;
	bh=V+gqkneyMbnTJWfQKrVZzngzKiTmgzZaUwEDLk2IM7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChvBgPW0KhkDKtWaiO7/3LSg5a0pxHdd9J/5OaW2su+5h5tBnR38aTdz6nA4wJYzlTzQhJ1JsvrxlA0RJ5pFvxtbt/XlsdeaognqVEH1IEqV7BgyAc2bi3N4/1hZ/Y53t9WWNgAoqw49p7UkqBIa0LeSsS5QKc58GLWM8pZ3cbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1GYmajC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1GYmajC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e946155442so21931435ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135517; x=1792740317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeTOkyvsFAq6IDsBYCsxTY31J5PpJnBjyNYspX0Us+A=;
        b=V1GYmajCSrW7g2S1en4WKaACVX0qAFz286Jk3jcFiQS9J2tCQ/nKOcIpQOA0GR8dv+
         IGmabyhyUI45wNbnx6cX3FCXxX4gd1Hh+Yqk7zAzmUOIcJUOcGkF+hEKqKUQ2kPOdQcP
         EqdLVt24Zhjw1LQqvTI7ikvb2x3+Fq0XNXIsu7wJ03Fm/V/xqOvf8flGHDIjiORrKd5C
         PLIkT5SGQabUEFpO8ycd0MbvVCFwvuiM7uU15Xsk8OgoPdqFDrTfo91wwttROPFFAKbW
         dJk7aVQTb3o57Tel7iXCLqvtk/EcbAkc48w4w3KPTRevgPrMncEtRNbYyaxcgHMJc8Vj
         CF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135517; x=1792740317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeTOkyvsFAq6IDsBYCsxTY31J5PpJnBjyNYspX0Us+A=;
        b=fqTVCWVUN/RgOQWZ+2o0FBjH3JVpdTUqsMSk1nhKm/PjII6gYju6KHjb3quqAYrP6N
         CA4vNgxLyEyaySnSq6KXPPTHlYys+w4LordcC4efnOAwOCpeFUl8H+hRWVnoRbr3yfdj
         78HJLtwRN2iFVPAJPf0w+P/yDUvK3/ipHtb74HzZFubLvNloX4oHH9+EpYJU0M4pVxLs
         Y4MySeB2da+evcW/NDvkX8ySafhSLIsCv4ciThe2Ab9GffGE+aqkGj2D0xoFVCuagKd0
         /Ubdc0F/3fSjqu7cM8b2mWc2fkZa4u2La+23Xbbx9WhsaE+gdxUaFHi0kZ3d1hqi2YyB
         QOUA==
X-Forwarded-Encrypted: i=1; AKwUvBxzgwEuxVYhlMK7+sEatMS1Q57OYAopN7ulpAOKyc9vNbCkjCwdntS7EWS1qZ4x3Hq5SoRetgmfAwQGRio=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkzIJpSZ/GbuVU5ZYmhyd9fo+7X2rlhitYrzxTvPidBgMCUbqu
	Wh0IUwFZT1tfaTKeLlqM8MFTce1iQ7+rh7RAQm+FyB/IbziAPXmBjck+
X-Gm-Gg: AYBFou3R/eWPZ9cmVNh88BJUnRmNCCQecjfnvv+5HlJlacRQLVVUSqFdM1u3xMpafFR
	1k/LCp6UjX7CeNfwT6F0ptDUuP5edzLUZKP36LLtOcdfbaNfsnTrWFgPhqArQSFkJLRnA7xf4pc
	ySNDOsJiu2q4yomS45riZDl1+m819T3IqDfgePr3e9vk2OCN2lvfs+dlhN+2lPktMHcbb6BCAJe
	GoidkUdbRb4Ry8E9cc8fJrDMeII+qTt+dJGR2n5aGrgJ6S21HXlMENUaSPKMpeXkmSpljGPXryo
	doIWggscTNN9RxGNdSRV7Uuu2ALzEW8TUKyNbjLtT6ZuwknGSEntFvjbR8rxqZwmB3WaMJ2Ygcw
	NL2SVrWD17LuYf1XzKgojYah+7gkdFHbC6/s3NLfCO55sE6kyKr+QJ1GUzhrrPICa3h27K7eFlj
	NdZLlwPkyP30IscJNq/lIInAL9lSrBn0Pyv6o+qmW0CMC2Sy7jE9doB6fOZStRGilx
X-Received: by 2002:a17:903:2a85:b0:2e8:b5b2:a9f9 with SMTP id d9443c01a7336-2e8b5b2ad3amr145465665ad.37.1792135517104;
        Fri, 16 Oct 2026 00:25:17 -0700 (PDT)
Received: from oslab.. ([140.120.15.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878bf6sm5941625ad.57.2026.10.16.00.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:16 -0700 (PDT)
From: Wei-Shuo Chen <tavhadia@gmail.com>
To: mst@redhat.com
Cc: jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Shuo Chen <tavhadia@gmail.com>
Subject: [PATCH] virtio: use consistent virtqueue terminology
Date: Fri, 16 Oct 2026 15:23:18 +0800
Message-ID: <20261016072318.24015-1-tavhadia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use virtqueue consistently in the notify function comments
across the MMIO and PCI transports.

Assisted-by: LLM

Signed-off-by: Wei-Shuo Chen <tavhadia@gmail.com>
---
 drivers/virtio/virtio_mmio.c       | 2 +-
 drivers/virtio/virtio_pci_common.c | 2 +-
 drivers/virtio/virtio_pci_common.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index faae58e3401a..e2ec0ec01d67 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -270,7 +270,7 @@ static void vm_reset(struct virtio_device *vdev)
 
 /* Transport interface */
 
-/* the notify function used when creating a virt queue */
+/* the notify function used when creating a virtqueue */
 static bool vm_notify(struct virtqueue *vq)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index b90c174450b2..60d9b73d74b9 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -47,7 +47,7 @@ void vp_synchronize_vectors(struct virtio_device *vdev)
 		synchronize_irq(pci_irq_vector(vp_dev->pci_dev, i));
 }
 
-/* the notify function used when creating a virt queue */
+/* the notify function used when creating a virtqueue */
 bool vp_notify(struct virtqueue *vq)
 {
 	/* we write the queue's selector into the notification register to
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 8cd01de27baf..18b6dbdfd1e5 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -127,7 +127,7 @@ static struct virtio_pci_device *to_vp_device(struct virtio_device *vdev)
 
 /* wait for pending irq handlers */
 void vp_synchronize_vectors(struct virtio_device *vdev);
-/* the notify function used when creating a virt queue */
+/* the notify function used when creating a virtqueue */
 bool vp_notify(struct virtqueue *vq);
 /* the config->del_vqs() implementation */
 void vp_del_vqs(struct virtio_device *vdev);
-- 
2.43.0


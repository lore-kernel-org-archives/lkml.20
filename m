Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4A4BF947
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783976; cv=none; b=f8Tz8smzzVKI6YVghruQyuHd0Ir6EvjKjj351xvJMuYahHDkFkAFlc+IZGIqazIaCLGicpUw2yFzDToNWcAQFwgQi7F4M+2OQGaQw10f3yfUBofJu0veKrf7x+Orp+yDsdFPUo5+pN45p6w1SWt2Qz7nBzfco/IC+OAZRtC+1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783976; c=relaxed/simple;
	bh=50nZY6PQAtGtgZSOnvkvfuQNWS2RvqbnnzACfieinj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYcnFXMkHOyh8w/sPmIhAiScBRgJ6ejCPl6sXcPIA6G/4688uJwI3xHpTPAxNXzRzT6lP+C2MgxhvpNROuK6F2mrWAQxVTmkmix1vBGM8fIEkGNwBD4um0fEjtPGoQR84C7kDPoczJ7HeXorX/z/EDerWv96uc1IWcU3E2kJSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLadcE3h; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLadcE3h"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so65386071cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783967; x=1791388767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzkcCjYLhlXtlTgNVSY8HEZ8Fih4l8n9pVSwPxokMKk=;
        b=bLadcE3hxhBWK/QHj9th9v1cSK8atTqnplWo4tzGax3FpR9PLMvl1GQoCcN1EJuKJ2
         B56oqXtiaWK2vOHfET7vAQ7bGjh1bO/LkquRx98qxEo0detwgXHJ8Or90JQoLtskthWD
         iGAEvLOBOepP3tt5rkHc7hf2intlSMUTMfLUm6+ADj13MzQOD/C+94Z4Lx3nVBSWSwe+
         jOvfG3dI4mxsDAfxCOGOmBKPth1gSKOSa3l2GINOECQLdZpl9BtyPJ7T6nK94zva5bUL
         Cup0XTmuuR6B0ViKqt45D6eURqMdAZv6m17pKNYnz7RmwSXCJWPPtKLE4/QcPbD1Wqxj
         uXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783967; x=1791388767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkcCjYLhlXtlTgNVSY8HEZ8Fih4l8n9pVSwPxokMKk=;
        b=2UNbHcamHUHIEDkrdKxuiSj1IQWpevH0Rz+zBCr/yqEDdTn1m0R5KiUVqGCoMIz5pm
         /gUuDPTPSpbJv2SkIjt/Vo4EXHkB/Mlx9GR/Kmmmy81vl3phpGk1OaaGIl73NEN6J8d6
         is53gPGIqjNVDBE4fklaf/tGVtQJJNZOxIGrAgec2TKYckHyUCFt2sxATAvUXSqL914K
         uVO8V2ozs6wkHMpJs+ZRIJiUnFAhiAah0iS25awFVeQEtzNj9q+v2x9qiMBTPQRq4CwT
         sivfSvbm5jpUWBljk3Z2ACaSymRRMspjlCyTNWgVWTggSXePSBlmJhO8FMTUgFq7Go9d
         Xjyg==
X-Forwarded-Encrypted: i=1; AKwUvBwuxCvnlngSVx3ffSDoAM3387Voh9mkHYuyIxLbyIMEQSy2bY0SzlD8zz4mQOXHxIB/K4+ztW9tZVuBQLA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldK3hliJc9FnnIsa/qeCLIbUGC69K62LUE+L6FkNmtAcwY3dMI
	bGkEE/7SYlmrNSR/Y3UnSzs4bhj6o6WWs8CHZtY4Y6WLZR1EZ5EVR1GS
X-Gm-Gg: AYBFou3eW2us/kmZa5adHKJRU9cEW56uA+3zMRSuobGe7J1G8MCLRnBK2NBwm/GEm8L
	GwW4XfFIK78ILOMRVVuR/ZmJInInKi/QjLYVxxB9L9i3RkYKGXxsV5vXSMeIgSHMhePUGjiEkum
	bh8nb4iWJxJLZ1kFblvfWFonxmvz4JEZMebYwAs/1/b/ApQp1NC6fnfBngNQBcRUFP9LSfLXo9A
	7dgzQEdSZV8cbimts1uaCQtdcUrPavtujUary4OPcC3YL2DsSTM8qvkUP8ZADeQq7leTNecH2fF
	uPNyaGLjAdDpoiJd05wuw/zsqpf12ObkqCUtiM1pDnkYBl4J1IrZopEtbhq5XeTlfdAxrBemUoQ
	+Hl3snBjXbNfzVm8eUamIoTkfBQ0HkiEFd1+KN/SXCrrVUeG+QW9WP+GaPpNK/PuTJfugpTD0Rk
	QIW2JhBfP4mG4qktWg8ifWjByoEJSmEY9Fk0v4cd4Z9Cc2dp3hSFJob/CrCa02nmMGSEH9jDsD7
	nJQ7Acopy1gtKQHAmzONw==
X-Received: by 2002:a05:622a:985:b0:530:b2e4:4e30 with SMTP id d75a77b69052e-53374d801bcmr35448021cf.61.1790783966849;
        Wed, 30 Sep 2026 08:59:26 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5338253300fsm2866831cf.27.2026.09.30.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:59:26 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Zhu Lingshan <lingshan.zhu@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH RFC v1] vdpa/ifcvf: Time out and report device reset failure
Date: Wed, 30 Sep 2026 11:59:01 -0400
Message-ID: <20260930155920.1684465-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifcvf_reset() writes 0 to device_status and polls it without a bound,
and ifcvf_vdpa_reset() always returns 0. A device that does not finish
the reset, or one that was surprise-removed and reads back 0xff, keeps
the caller in the reset path forever.

Bound the poll with readx_poll_timeout() and return -ETIMEDOUT from
.reset, so that callers such as VHOST_VDPA_SET_STATUS(0) see the failure
instead of hanging. Stop right away with -ENODEV once the device reads
back all ones and is no longer present, as there is nothing left to
wait for.

Fixes: 386a26208524 ("vDPA/ifcvf: synchronize irqs in the reset routine")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
RFC for two reasons:
- The spec gives no bound for a reset; 10 seconds follows octeon_ep's
  OCTEP_HW_TIMEOUT.
- vhost_vdpa_release() ignores a reset failure and still tears the
  mappings down, so on close a timeout turns a hang into teardown while
  the device may still be active. That needs a separate fix in
  vhost-vdpa.

Compile-tested only (x86_64 defconfig + IFCVF, W=1).

 drivers/vdpa/ifcvf/ifcvf_base.c | 24 +++++++++++++++++++++---
 drivers/vdpa/ifcvf/ifcvf_base.h |  3 ++-
 drivers/vdpa/ifcvf/ifcvf_main.c |  4 +---
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_base.c b/drivers/vdpa/ifcvf/ifcvf_base.c
index d5507b63b6cdb..8a6c8f8314d53 100644
--- a/drivers/vdpa/ifcvf/ifcvf_base.c
+++ b/drivers/vdpa/ifcvf/ifcvf_base.c
@@ -8,6 +8,8 @@
  *
  */
 
+#include <linux/iopoll.h>
+
 #include "ifcvf_base.h"
 
 u16 ifcvf_set_vq_vector(struct ifcvf_hw *hw, u16 qid, int vector)
@@ -201,11 +203,27 @@ void ifcvf_set_status(struct ifcvf_hw *hw, u8 status)
 	vp_iowrite8(status, &hw->common_cfg->device_status);
 }
 
-void ifcvf_reset(struct ifcvf_hw *hw)
+static bool ifcvf_reset_done(struct ifcvf_hw *hw, u8 status)
 {
+	/* A surprise-removed device reads back all ones and never resets */
+	return !status || (status == 0xff && !pci_device_is_present(hw->pdev));
+}
+
+int ifcvf_reset(struct ifcvf_hw *hw)
+{
+	u8 status;
+	int ret;
+
 	ifcvf_set_status(hw, 0);
-	while (ifcvf_get_status(hw))
-		msleep(1);
+	ret = readx_poll_timeout(ifcvf_get_status, hw, status,
+				 ifcvf_reset_done(hw, status),
+				 1000, IFCVF_RESET_TIMEOUT_US);
+	if (ret) {
+		IFCVF_ERR(hw->pdev, "timed out waiting for device reset\n");
+		return ret;
+	}
+
+	return status ? -ENODEV : 0;
 }
 
 u64 ifcvf_get_hw_features(struct ifcvf_hw *hw)
diff --git a/drivers/vdpa/ifcvf/ifcvf_base.h b/drivers/vdpa/ifcvf/ifcvf_base.h
index aa36de361c10e..57d00b881582b 100644
--- a/drivers/vdpa/ifcvf/ifcvf_base.h
+++ b/drivers/vdpa/ifcvf/ifcvf_base.h
@@ -29,6 +29,7 @@
 
 #define IFCVF_LM_BAR			4
 #define IFCVF_MIN_VQ_SIZE		64
+#define IFCVF_RESET_TIMEOUT_US		(10 * USEC_PER_SEC)
 
 #define IFCVF_ERR(pdev, fmt, ...)	dev_err(&pdev->dev, fmt, ##__VA_ARGS__)
 #define IFCVF_DBG(pdev, fmt, ...)	dev_dbg(&pdev->dev, fmt, ##__VA_ARGS__)
@@ -112,7 +113,7 @@ void ifcvf_write_dev_config(struct ifcvf_hw *hw, u64 offset,
 			    const void *src, int length);
 u8 ifcvf_get_status(struct ifcvf_hw *hw);
 void ifcvf_set_status(struct ifcvf_hw *hw, u8 status);
-void ifcvf_reset(struct ifcvf_hw *hw);
+int ifcvf_reset(struct ifcvf_hw *hw);
 u64 ifcvf_get_dev_features(struct ifcvf_hw *hw);
 u64 ifcvf_get_hw_features(struct ifcvf_hw *hw);
 int ifcvf_verify_min_features(struct ifcvf_hw *hw, u64 features);
diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 2af1cec958848..6c569f01bec91 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -444,9 +444,7 @@ static int ifcvf_vdpa_reset(struct vdpa_device *vdpa_dev)
 	if (status & VIRTIO_CONFIG_S_DRIVER_OK)
 		ifcvf_free_irq(vf);
 
-	ifcvf_reset(vf);
-
-	return 0;
+	return ifcvf_reset(vf);
 }
 
 static u16 ifcvf_vdpa_get_vq_num_max(struct vdpa_device *vdpa_dev)

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.43.0


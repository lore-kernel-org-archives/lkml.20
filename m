Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2694C8FE5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159965; cv=none; b=aE09wetqsUJ+mPl5CyJqEYDbGMw03HSq3RvNiPJVYyorEDh/xeZi3ztWnk+wQ/DJhck/MWt5MRe/Q5mz3IAHPQn6rCo4Qc9G/ghRRlO0gxYBGkqLM7YPgoC3zXTwbRRBXFrowD6eGZnhtUnXMRFwFxhnVk5Ky/ZlwGESlIkhB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159965; c=relaxed/simple;
	bh=P6FOblvKbXFENbU5mA1ijIZGEvT80WExO/2hxTZ2HUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwcrR6CNRg3PuJrlTLiwRfxxj0hL8f/L+PpzAP5cll/rOqV7SVsz1lYkwYrhPSZTDFIusSQRcNcgXLEL7CfoSzyJ++OG8CWKg1/MPQwdvN/LsGGyA8ZHEGMeemf44fqdnlh9G42es924n/ccXStfEIs/Jfl4MbvFZjKLnpxcrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix/XpUSt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix/XpUSt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1706790f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792159960; x=1792764760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbBEogAxyh7+JN+OT4vw992dVZCSlpxBHlQNCIp2JxQ=;
        b=Ix/XpUStFb/tX4/mXOEzUuvi1wDxM6w4w++fjIrNUNzPilmquwqoDM+31vAuGPUoEv
         LTBM7UGT9uHHBBPLG5nABggGN43MOkYLibSxSUEbIqOPEObw7pTcLR7zL6beXtgn7uy8
         J2D/VRfVE4n7RzOr9kFXG1NiC8ANVNoTvRMg70FjdqvM9BKg92hA1dm/HQbWGs96lKg+
         xMET9TFMbinFMQJ4PG/S198ZLPibneOJ2oUVlH0mKnNi98fnOS+LjPP3OoF/PcJWE/KN
         n2Fwe6ZCMK7oWcV9PU+0YOjBTaJIPg+DKBdPaRLN4F2RkTcU2fjgKT/HsXJGhUB/Cd/v
         vAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159960; x=1792764760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbBEogAxyh7+JN+OT4vw992dVZCSlpxBHlQNCIp2JxQ=;
        b=CakKVwfwjB44VARTFmS1oduo3D8l7lmYNArlWddzzDRJWKw9v5VA54M82r5jv96Bhs
         J5bTKrqG1ObT8c2E/tM1/FQ1q0lbxlDlW/kKjFTxN/og2/xVt7I0aouNEtMLmeMQSDNZ
         J+KKE5sbyzMjIAKJ72L4zaDCBVmGIh2C9SuklABTHkAA2sxIDz9KIAdLuLqepRmlqQdG
         2+DJ/uHUJ5bYAKzRVwqrMwxvs2Tpn/Nnvz1k9Hh0U4BORNE3NYBCYF00JJMFmrGiYy2c
         56+W0oTQzVdiuhRro59Z9vxu01VWXzNYbthb5hwdVyfAMxsOeWsj21SIxjI7z5P+GktJ
         KwlA==
X-Forwarded-Encrypted: i=1; AKwUvBwcnn5HCnYlvewTKcius133o5bCWdli+DRY7FL4Am4eA3y+uFg/aoHPoHYclfYxg43xxkd40htNUokhZ3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2K/Xa5x3MwaIaLIdsC2M0GAU8qsD7J28XX7OfDLpSY2okGRyC
	0x8FzKQjO5O7ngQSnrRLgE/4Vs2tFoiih6sOET66Cz8W9P1Yzf6l+/fM
X-Gm-Gg: AYBFou2NiRYT8iyWpandHStC34cFoJYzsPLsdQp27b3OSkM/WMsliY9EQwwJiTxrvmd
	gIrJCJJZ8rLaF25gEwxuv6Fr8W/rxPlF5W621g12FySjsCpsteRUczTkCvhsuSz45M8ywcBuClQ
	c7BWsDxIkD78Y8i18FngHR4oAhD8iLFlQqvDBgiDTsXsmgMZ9h6Zfo9x8WbuFreT4qxMqzTfoMH
	dMWBycmkSw4Bwb6QsZTMxKWkhTjFHXg/Q+b54CD2Zup2+yrEUonfrLmZHdBXlHaMDb9TO/QXUmc
	lnVrGGRbeE4eBeD6a3dTDeu9GPinMa1N0kSoldTefNK6n8a8vb/ltdGf+/Kcf8pLrKBxVpz6Iqa
	Z8eDF4eL9Y4JPgv37UaAiqyPWwSc6BlWPULiuXxALK3LtxbqPOt8fPYDx+umf8qgdKq5xMkLXdm
	ob5gb8HF663X6gspMJLDoJx6G3TwyGmzuFkJ/1+JDhZSv8QscyUBWdxpfYFbM0HaP0zi+sisoed
	HJkmJzDkkN06NsFviuaC08mjI1Ay2X30Um8ZJxY2Bs0+42kagPOH458
X-Received: by 2002:a05:600d:82c8:b0:4a1:cedc:ab51 with SMTP id 5b1f17b1804b1-4a1cedcac09mr44301305e9.35.1792159959775;
        Fri, 16 Oct 2026 07:12:39 -0700 (PDT)
Received: from B87454BG30364.tailfa1f09.ts.net (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfdeb18f8sm4771136f8f.20.2026.10.16.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:39 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
X-Google-Original-From: Erwan Velu <e.velu@criteo.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH] nvme: honor the volatile write cache enable state
Date: Fri, 16 Oct 2026 16:12:08 +0200
Message-ID: <20261016141208.2641974-1-e.velu@criteo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A controller with a volatile write cache present (NVME_CTRL_VWC_PRESENT)
but disabled (Volatile Write Cache Enable cleared) is exposed in
write-back mode, as the driver never reads the Volatile Write Cache
feature. The block layer then issues flushes and FUA writes for
nothing, hurting performance.

On a Kioxia CD6-V (KCD6XVUL3T20, HPE firmware GPK8), compliant with
NVMe 1.4.0 and reporting VWC 0x5 with WCE cleared, 4k random writes with
an fsync after each write (fio, 30s) give, before (write back) and after
(write through) this patch:

  job                   | cache   |   IOPS | fsync avg | flushes |  gain
  ----------------------+---------+--------+-----------+---------+------
  psync buffered, QD1   | back    |   3885 |   247.6us |  116552 |
                        | through |  48325 |    15.7us |       0 | x12.4
  ----------------------+---------+--------+-----------+---------+------
  io_uring direct, QD1  | back    |   3886 |   238.2us |  116593 |
                        | through |  41924 |     5.7us |       0 | x10.8
  ----------------------+---------+--------+-----------+---------+------
  io_uring direct, QD32 | back    |   5088 |  6173.5us |  117793 |
                        | through | 140196 |   107.0us |       0 | x27.6

From NVMe 1.4c (sections 5.21.1.6 and 6.8) up to the NVMe Base
Specification 2.4 (sections 5.2.30.1.4 and 7.2), a Flush command has no
effect if the volatile write cache is not enabled. The NVMe Base
Specification 2.3 and 2.4 (sections 5.2.26.1.4 and 5.2.30.1.4) also
state that user data written to a namespace shall be persistent if the
volatile write cache is disabled.

Make the driver honor the Volatile Write Cache Enable bit:

- Read the feature in nvme_query_vwc_status() when the controller is
  identified. The cache is assumed to be enabled unless the controller
  explicitly reports it disabled, so a failure keeps the current
  behavior.

- Add the nvme_ctrl_vwc_enabled() helper so that the volatile write
  cache state is evaluated in a single place, combining both bits,
  instead of testing NVME_CTRL_VWC_PRESENT on its own as is done today.

  The chosen logic is the following:

    NVME_CTRL_VWC_PRESENT | NVME_FEAT_VWC_ENABLE | Write cache
    ----------------------+----------------------+--------------
              0           |     absent/0/1       | write-through
              1           |        absent        | write-back
              1           |          0           | write-through
              1           |          1           | write-back

  This is safe by default: a present volatile write cache is considered
  enabled, and the namespaces are exposed in write-back mode, until the
  controller reports the WCE bit cleared.

- Refresh the state and rescan the namespaces in nvme_passthru_end()
  after a successful Set Features for this feature, so that a change
  made from userspace (e.g. "nvme set-feature -f 6 --value 1 /dev/nvme0")
  is applied to the namespaces:

  - if the volatile write cache is now enabled, wait for the rescan to
    complete, so that the namespaces are back in write-back mode and
    flushes and FUA writes are issued again before the command returns;
  - if the volatile write cache is now disabled, do not wait, as
    flushes sent in the meantime have no effect.

The performance issue is not specific to the drive tested here: any
controller that reports a volatile write cache with WCE cleared is
affected, whatever its vendor or product.

Assisted-by: Claude Opus 5.5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/nvme/host/core.c | 41 +++++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h | 10 ++++++++++
 include/linux/nvme.h     |  1 +
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 531f9bb14bab..5b03bf06b57c 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1278,6 +1278,30 @@ u32 nvme_passthru_start(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u8 opcode)
 }
 EXPORT_SYMBOL_NS_GPL(nvme_passthru_start, "NVME_TARGET_PASSTHRU");
 
+static void nvme_query_vwc_status(struct nvme_ctrl *ctrl)
+{
+	u32 result;
+	int ret;
+
+	/* Assume the volatile write cache is enabled until proven otherwise */
+	ctrl->vwc_status |= NVME_FEAT_VWC_ENABLE;
+
+	if (!(ctrl->vwc & NVME_CTRL_VWC_PRESENT))
+		return;
+
+	ret = nvme_get_features(ctrl, NVME_FEAT_VOLATILE_WC, 0, NULL, 0,
+			&result);
+	if (ret) {
+		dev_warn(ctrl->device,
+			"failed to get volatile write cache status (%d)\n",
+			ret);
+		return;
+	}
+
+	if (!(result & NVME_FEAT_VWC_ENABLE))
+		ctrl->vwc_status &= ~NVME_FEAT_VWC_ENABLE;
+}
+
 u32 nvme_passthru_end(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u32 effects,
 		       struct nvme_command *cmd, int status)
 {
@@ -1313,6 +1337,20 @@ u32 nvme_passthru_end(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u32 effects,
 			if (!status)
 				nvme_update_keep_alive(ctrl, cmd);
 			break;
+		case NVME_FEAT_VOLATILE_WC:
+			/*
+			 * Refresh the volatile write cache state and revalidate
+			 * the namespaces so that flushes and FUA writes are
+			 * issued if the cache was enabled. In that case, wait
+			 * for the revalidation to complete before returning.
+			 */
+			if (!status) {
+				nvme_query_vwc_status(ctrl);
+				nvme_queue_scan(ctrl);
+				if (nvme_ctrl_vwc_enabled(ctrl))
+					flush_work(&ctrl->scan_work);
+			}
+			break;
 		default:
 			break;
 		}
@@ -2478,7 +2516,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 				 "not enabling zoned mode");
 	}
 
-	if ((ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT) && !info->no_vwc)
+	if (nvme_ctrl_vwc_enabled(ns->ctrl) && !info->no_vwc)
 		lim.features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
 	else
 		lim.features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
@@ -3679,6 +3717,7 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 
 	atomic_set(&ctrl->abort_limit, id->acl + 1);
 	ctrl->vwc = id->vwc;
+	nvme_query_vwc_status(ctrl);
 	if (id->mdts)
 		max_hw_sectors = nvme_mps_to_sectors(ctrl, id->mdts);
 	else
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index a8ef62b8e34b..b993ebd457c5 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -399,6 +399,7 @@ struct nvme_ctrl {
 	u32 max_namespaces;
 	atomic_t abort_limit;
 	u8 vwc;
+	u32 vwc_status;
 	u32 vs;
 	u32 sgls;
 	u16 kas;
@@ -1274,6 +1275,15 @@ static inline void nvme_start_request(struct request *rq)
 	blk_mq_start_request(rq);
 }
 
+/*
+ * The volatile write cache status depends on both its presence and its state.
+ */
+static inline bool nvme_ctrl_vwc_enabled(struct nvme_ctrl *ctrl)
+{
+	return (ctrl->vwc & NVME_CTRL_VWC_PRESENT) &&
+		(ctrl->vwc_status & NVME_FEAT_VWC_ENABLE);
+}
+
 static inline bool nvme_ctrl_sgl_supported(struct nvme_ctrl *ctrl)
 {
 	return ctrl->sgls & (NVME_CTRL_SGLS_BYTE_ALIGNED |
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 91ce434a7e8d..c7a1fd29bda7 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -1402,6 +1402,7 @@ enum {
 	NVME_FEAT_WRITE_PROTECT	= 0x84,
 	NVME_FEAT_VENDOR_START	= 0xC0,
 	NVME_FEAT_VENDOR_END	= 0xFF,
+	NVME_FEAT_VWC_ENABLE	= 1 << 0,
 	NVME_LOG_SUPPORTED	= 0x00,
 	NVME_LOG_ERROR		= 0x01,
 	NVME_LOG_SMART		= 0x02,

base-commit: 2e8e30b3cf9f165e1a1d079331543cb7f2ad0e0c
-- 
2.53.0


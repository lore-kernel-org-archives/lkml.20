Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF53CF1F9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132484; cv=none; b=q8aMhFBqrNuwFqbQl4qWh3na4DOL3cF8+Fbn5rET9wDtL8gIktLbuKHw11nBDcS77wJuWZkgryOsvzaUWA/ac7x/NThGOxx16hoIvqtPFn9a+S5Jq5tVzjsDd0wbGyyEhR1yWXEnqvJ72ttQm7FI16NSvuc4AgGsEL18Qy+DZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132484; c=relaxed/simple;
	bh=NLKuPBNyIEy8eDLZwDmxqn8DoGNpm3vep+kMFjJBWqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuUqfV1Dawz/Vdk1QauIj9ZSSOsfayKadjE2Vn6Wj7QGRWknwG3pznwdEPvXZ/HJCnQVa4YQYN43A/G31QUOC2kCgxXsqMe/PdSNkVEQbdTNpGeRvg0juRRftOfn8K2K20eZ0XXnIhn736TGQ5T/hXjppwFv1EYV9Z2i9RdLZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=Qgqdp+8g; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="Qgqdp+8g"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso765951a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1791132482; x=1791737282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO6c655YlcffNU2PNOxSK+WlZvvM5uQY49LVUr45wK8=;
        b=Qgqdp+8glfiLKzT1C1Gqu3Jz3zDV/yadLAvZX+Qh3u1RnLwXep2X5xI0IZOK0fWMwr
         /8ct8IqxLErZPZd2a3e7eoc9xjsTNsW0y47GNLjIUqFMtDW6xMTp+zCLg9vHZAeDR3oS
         KPUtd7x4RqmBNb7Up2JPjz063Iv4Aof0FhBNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132482; x=1791737282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO6c655YlcffNU2PNOxSK+WlZvvM5uQY49LVUr45wK8=;
        b=QPYmQVcdAlnCH3GHVwdioBSQzjhosx2FiFRJu209JXmSAvfI/a1a14RhFzvBxs5snV
         xCRHNKp4i34379DRaTBJ/WQVf3GGCr2O2SRA9wH0NF2UFfNaFCpSwqhlp4EUjDDrgnle
         DFH6F8PAHBqbyCF3aJKM2vmvXVs0CO9ah4uzjpuE4PFL6m4I/bNRLxXZRzPUcAUQqA7I
         knkX/ugBaeFzODfj7OoLV7eYlVVXzQT7m6DCDQGbPgZwvHO6xD1X848p9ClqQHi8KzDk
         FYWgZns08yx9mL+4Wj8Akltd+2EzDyLrdDhJ2eXRzr9uxQ6U+IEItUV1DvZWx08cXmcn
         A96g==
X-Forwarded-Encrypted: i=1; AKwUvBzWakM/jA+dWYAGbxMX+7ueVB/BRhR6Xoi+8FkM31ulAomCfSsbp4s7lh+W4g3hbvOptS1FlaHOEdiKF94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCHWEXI4j5MFwdpO8HgAJJLspQLoD1ryYXGUgpt/lqfczZ9QCo
	zxbJID/waBK4igGEwLsZn4PQbZZhCJB7cRYxoCIJD0CpOzlGubcmR9QnSle2R7gm4j4=
X-Gm-Gg: AYBFou03xKMPHBzXWl3gVNVYD2yyIICYaDToCikR25zgY8EuXQq2NflDwH1dWH+Z6Rn
	kbNqjx1i7B64PEyLlJD6lAuaQ+hFrMUnZMG89sV9HLV775c2gyrn+cc80V1+nhS2Zol8FmOGbTt
	NAtwUK/SRW3qqpvSunkg5HUaQl+t4yA1GDbn5rdiynsmMHItcbYna31VpTCW2zABMGsDhrfuv3k
	t9xroT69fJl/BgbJpHyCSwmLzviD93UEHDFIMxatYK4v282ekUUc1KLcCyKgIk+beqsQRmWSfzH
	Ad7YglhZSrBvVu6VODU9dD9XZ56UxmqMuqV7dfRJ5a7wL/SxlbWeHS88+sH3yu/umS+LYOQ1tOh
	KCHzJ36Gtay3kU78yXnJPyrLOAg+SF+gbk6kF9idkwPpPopBSeTF5XCB4RBo9gXUFXPzScq0ZMK
	8/9Lj0vR7klaYSEhnyXYE6q0w0Qccx4QKQMtr/zrI5mkdXnWBS6J6rJJRCK8GfOu+IqK0ZcMwH
X-Received: by 2002:a17:90b:4b11:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a6cec9b3bamr7206297a91.39.1791132481955;
        Sun, 04 Oct 2026 09:48:01 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm6500454a91.2.2026.10.04.09.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:48:01 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v2 3/3] accel/rocket: Validate task regcmd address and count on submission
Date: Mon,  5 Oct 2026 01:47:27 +0900
Message-ID: <20261004164727.466164-4-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164727.466164-1-sidong.yang@furiosa.ai>
References: <20261004164727.466164-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regcmd fields in drm_rocket_task come from userspace and are
programmed into the PC unit without any validation.

Bits 31:4 of PC_BASE_ADDRESS hold the register command DMA address
and bit 0 selects slave mode, so a misaligned regcmd silently drops
its low bits, and an odd address flips the PC unit into slave mode.
Similarly, pc_data_amount is a 16-bit field holding
(regcmd_count + 1) / 2 - 1, so a larger regcmd_count is silently
truncated by the register encoding.

Reject unaligned regcmd addresses and out-of-range regcmd_count with
-EINVAL at submission time. Existing userspace is not affected: Mesa
places regcmd buffers at 64-byte aligned offsets, and its regcmd
counts stay far below the limit.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_job.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 428de5a7cb03..ce994748dd5d 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -7,6 +7,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/rocket_accel.h>
+#include <linux/align.h>
 #include <linux/interrupt.h>
 #include <linux/overflow.h>
 #include <linux/iommu.h>
@@ -21,6 +22,15 @@
 
 #define JOB_TIMEOUT_MS 500
 
+/*
+ * The PC unit fetches two 64-bit register commands per pc_data_amount unit,
+ * and the field holds (regcmd_count + 1) / 2 - 1.
+ */
+#define ROCKET_MAX_REGCMDS	((PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__MASK + 1) * 2U)
+
+/* Bits 3:0 of PC_BASE_ADDRESS hold the mode selection bit and reserved bits */
+#define ROCKET_REGCMD_ALIGN	16
+
 static struct rocket_job *
 to_rocket_job(struct drm_sched_job *sched_job)
 {
@@ -95,6 +105,20 @@ rocket_copy_tasks(struct drm_device *dev,
 			goto fail;
 		}
 
+		if (task.regcmd_count > ROCKET_MAX_REGCMDS) {
+			drm_dbg(dev, "regcmd_count field in drm_rocket_task should be <= %u.\n",
+				ROCKET_MAX_REGCMDS);
+			ret = -EINVAL;
+			goto fail;
+		}
+
+		if (!IS_ALIGNED(task.regcmd, ROCKET_REGCMD_ALIGN)) {
+			drm_dbg(dev, "regcmd field in drm_rocket_task should be aligned to %u bytes.\n",
+				ROCKET_REGCMD_ALIGN);
+			ret = -EINVAL;
+			goto fail;
+		}
+
 		rjob->tasks[i].regcmd = task.regcmd;
 		rjob->tasks[i].regcmd_count = task.regcmd_count;
 	}
-- 
2.53.0


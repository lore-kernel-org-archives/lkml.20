Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27C47124F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212586; cv=none; b=QOA9XeT2CT2TfEOs1Pqtxf8NlLmXMdGTiNjubujas07gMe8crg92wv2XByXb6KYqqyGkGUesxhgxaBLxTYwYVyaQb3MiZxo1NOnAeSpXkvnVCBgwhgWGB2jA3z7mJQFsN6WU5FN3tI6o0xwOS8CQ54ieP/t2h2/EKJsVa2ypHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212586; c=relaxed/simple;
	bh=04IioIo4FXEjyXFkideFX3t2R14xVaRdnpbk0q61OoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c5D9aab2vuMlcyUJrXWGxJTMYgZhdAfgkiG9Keik/p3QmovdH4G3YeoDPUhH4HqzKOTASTumHd45u0rzCEdt2Vl3QSAbAt5lJ95qwLx9FSY1X8T0WVQ22C+6FAoqmVV5X2IhImsruLL3mpHhWUkvVFnGnPlBCjZAwfGSA/YDegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=nsDwZtUf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="nsDwZtUf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dcff8f44f2so26409185ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1789212584; x=1789817384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w255+3K8FAv+3tRtSRmVnHCmz5J/V0IKovZZCjW8Bfc=;
        b=nsDwZtUfsU1Ew8WHB+vWkPIJBy7hJ4UyxYmyjGoY0j3MgbOqex7RkYeY/6nHVxN4Ke
         gxVt7FcmGekzU49jZsCM1eKMgcUj6vYnCYq1awXSXyQvPoGyTWA7wYwdcpn9gYwLm80H
         XozOpUMw+0h7HYhXWBfwNEl7g95N6qvIfWgnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789212584; x=1789817384;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w255+3K8FAv+3tRtSRmVnHCmz5J/V0IKovZZCjW8Bfc=;
        b=hMko/W//IHvVarrqkaekNQnZoXstu+qiTOnog5QbdKECKrBUXhoXQszWvUxKnmlDMM
         APtXLOJpMCpcVdwuBBmEmlSPiTxN5yNJArxRBBX2LojzmP7JucMkaAe2/o3rwBVWS+0w
         lRUsmeDVYNUm3IzZLx7xrW2YLJgN6IhWVRbK1ULOnAhmO5ZGWpnivKqgfHNasfIfjDez
         KT/L/OzhyYXxUbc8225qUT+3n0hXUv59ehSFvuwDFGcjEpTNzuzR4PdK3CeIbjwx8D72
         LECUuwGBsbZW1Ye6nbrplBTmWxPPpj8ILkLF+fjMyA3b+OB7FzTZbkAIAauHLaOV0eWp
         Kwsw==
X-Forwarded-Encrypted: i=1; AKwUvBzC4oJTiURQ0iXowmgO6p/EvVFN+b2SaMK2do+VH5rQQCGsxPeWfO/S9KfYQP+rNZ0RJcfeEltfm0jka8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mNQ9JglgntA6xQ5KJ2OXBIT2IKUONl99nliTBrB/hCBLJe2Kn3
	vmHGUtFDLCmDjuo1tFibW168lyzMyaA3s/AD6ZtitJWeZWYQlizeUyt9HmIYgleHxrM=
X-Gm-Gg: AYBFou1tBEjVo6MH/La/jDlzlDN4XvQG3KAIt+MjJkVMiE0YmfKTgcoc6cuMlebqtjK
	1doiNMs7xODNvYieOPNRKWWHjK/welr2r/bIR2uvIPbvTXjy3G/ffWHs/lCjWcGY9Ehf0Q+ecdg
	UBAuvjSPggCmxYMH88dfCDEeXzca1yfI/Pk5w2GlZA9sPNI+lAsBNjvJPBrphe+mqOFRzljE6zs
	VHlwPxnQL4/PlXC+3AHUBtQd3MXBu49WJZejjNNxVya7QflHdrbT3wn6HEITWh8M5rOGJvoKMhT
	/ln2CNbMv8RKTCnqBnJOpuW/o3EskxnJssSHPIwCJnV8BxAk0QBxnS5eQ4hMJNBNyIAu9smYW+r
	FNadAnXnCCzvFKTrv6mDvsNV4M6oJ6x3y0X3VGkG5e2Y1kmTfaJS7BXVDSzuPV/O0PjebebksTl
	DC17AknaGoU3eFQLVv7do/HZVoD2c4sp3MNIfsbC2PZb+4z7igF72OXRiFzS+HLRb2pTR4CKNMa
	w==
X-Received: by 2002:a17:903:198e:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2dd29ffa6b4mr164443135ad.0.1789212584566;
        Sat, 12 Sep 2026 04:29:44 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cec7ee5sm23666565ad.42.2026.09.12.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:29:44 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] accel/rocket: Validate task regcmd address and count on submission
Date: Sat, 12 Sep 2026 20:29:22 +0900
Message-ID: <178921240194.10.15893724064993644797.rocket-regcmd-resend@furiosa.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Resending unchanged since the July 11 submission.
Applies cleanly to drm-misc-next at
9d4c98219598e77ca7044c453ae6994519ac0a96.

Previous submission:
https://lore.kernel.org/dri-devel/20260711062137.36044-1-sidong.yang@furiosa.ai/

A review would be appreciated.

 drivers/accel/rocket/rocket_job.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index bb77b6bf0f23..9ebabf86fe97 100644
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

base-commit: a284476db2653ae893f46cbea408eb412db54eb0
-- 
2.42.0



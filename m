Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC4503BD3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328846; cv=none; b=l0qYM7lQgB85uWJiYU5HAmAcWBinMAmz51JD351bOGivU9K3pp8gyxxcNvgLWJCB+gkt5tV3Dt0yrNGPqvWVlq378/zqRCUqM9tvFSDQz2uTJtRV1DxFP6etLS8+OisOzyu4KqksNxJRphuVIP2E7/auYAqNoa9PSiZmHCFBpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328846; c=relaxed/simple;
	bh=IMKT3YbYLEQIaeZRPQ0W0c7b8FlnqPjbay1YpcxYqko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBQExNu4F6sBrOkEw/cQGn31zS2nlkIlxmG9xJOLeOv+bpQ6jWPHXRviXh8m7ARhqLJGZjFpiauN74dU9B0PYf0JNP4Dqo56ArCKR589cIM5vYGuJ/chOt9N87JKJBFWnpT9Iq9KhLyLL6mjIBXaGiwzy7i/qdTvjbu9KgH2r48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aSWEmxo2; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aSWEmxo2"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-31490970b97so2053053eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328823; x=1791933623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iTXW3RRmMd+aIED+k8R/Mf/E9JCnchJwCHuj4DeazA=;
        b=aSWEmxo20oPuJJVneo66x1d2edoe09jTY0IGUwqwCHj/Ugsyn7b551MRBXtTLnLQSP
         aY3aDRGdnJn0L7kpgSsY1+MyDnP0HwoxxIdijhU9jGfzo6j351YwwnF1AuLGjDPI0xCq
         ZI0iQ/ChA7lO5YTADSa3HaBG6leS2Fm38N9IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328823; x=1791933623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iTXW3RRmMd+aIED+k8R/Mf/E9JCnchJwCHuj4DeazA=;
        b=NLHsGDT0kUiFpSqijAaFl0yTcYoHe5WiWPRCgyBzRTR9AgSLU+EGcilW4kXVXgL5wR
         cLkpArZbWCN90TymP1Thkr2iq4WJjrjHtxeqolVho3mJ6t0ftmKbK73BkQ4pK8jQkpBm
         wt54+Q6h1kTRBEeyOW1Bt02cZGA7FROJvdTvs71rL4YIj7fYybkn7XqurkNY7CFSO+GD
         K0RmNog1rDAs3XIwbYiS2KdE8BxMihyDGPSPBGe+IEGBtswmtGoFnPlm3wrSWCyYKWOi
         qw07Gvrcwvaw+kyMhQeMxFZI1CIMV/On0F0iRY/1xL/5Rg4765G+yvuZMwXwLqSC1uPV
         UkTw==
X-Forwarded-Encrypted: i=1; AKwUvBz1ISS91iLxZGy5peTAe6PH6tk1aDusVHWezJfMw6zZ18407j4iNEI1NapPus24x5odup+lvPkyf7WNq30=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnQSpnNSzWBv2Cduo37AH3iR73j+bGR2tNbjVqRwOmvZFZFLoK
	HeHxys5Q3B80Od2ml2AOtE1FlANz7AAeOH9hJ4mID+9iTfP/Wo/bCu/YgkAz+u/gUmjXQc4tZkw
	JL4Jvow==
X-Gm-Gg: AYBFou2RQexzCF3w3dFmbIJ1cHARmxiWSuuSxWHaZ8sbmVsGgMsZStjlAICrLo8TSoP
	zx+IAowriaBqFPGSFaUYx9qy5wu0HB50YpvdQI4cs7OMD4A+X2sXIVsKVD+k8WE/R3MifYizTz8
	7xgCE9ybbQEE6TwGLlLaNwbUvhX9lEERHMwjoM8ZrcaExF2+4UmtHCIXxe2h37hfzZEMrUo2Cd9
	4WgrDMCRV1VIy2SDdpodwpdTSfA4QWRP7QxigJPk9s4JtDDVUSRFtGy4m5YDgly7Z8naN/K6RSs
	l7rBclwVprBfjfI6TsPvSFEMHUBwe5S7scwf+Ganv+kRx0v91MONY5aRXkoVAWx+bnNz4hgVMDV
	zrQ/DXKL5zlkzYRjMOm7PQBdUuknp1iAi7KmkNxq03Vcn9Jwxc15i5xYMhlRjOStz5fFHm6aAxS
	NYLsg5PO58RginSUF1wcqHNuWazuTNwAXcLFOdFfP1wecgrokw4j7HwyRWHRkrzayVnlrNHOt4i
	60GK3ADHXCIVKAG96Ixotb5Gn+kl1FiDZU87g==
X-Received: by 2002:a05:7301:3d0e:b0:351:3c34:9bfa with SMTP id 5a478bee46e88-3515deddeebmr346793eec.31.1791328822885;
        Tue, 06 Oct 2026 16:20:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515abb67e5sm1729507eec.4.2026.10.06.16.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:20:22 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 10/13] ASoC: intel: atom: Discard pm_runtime_put_autosuspend() return value
Date: Tue,  6 Oct 2026 16:13:38 -0700
Message-ID: <20261006161337.10.Ia8792ce5d04a55522d84afc8e71cc879721a5f49@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagating the pm_runtime_put_autosuspend() return value to callers is
not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Modify sst_pm_runtime_put() to discard the pm_runtime_put_autosuspend()
return value, change its return type to void, and update its callers in
sst_power_control() accordingly.

Note that in one error path for sst_power_control(), we would previously
overwrite one error code (from "FW download fail") with the return code
from pm_runtime_put_autosuspend(). This was probably an unexpected
behavior, which is now changed to propagate the sst_load_fw() error
code.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 sound/soc/intel/atom/sst/sst.h               | 2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c | 4 ++--
 sound/soc/intel/atom/sst/sst_pvt.c           | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index c43946c5ecee..518b2b53510d 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -497,7 +497,7 @@ int get_stream_id_mrfld(struct intel_sst_drv *sst_drv_ctx,
 u32 relocate_imr_addr_mrfld(u32 base_addr);
 void sst_add_to_dispatch_list_and_post(struct intel_sst_drv *sst,
 					struct ipc_post *msg);
-int sst_pm_runtime_put(struct intel_sst_drv *sst_drv);
+void sst_pm_runtime_put(struct intel_sst_drv *sst_drv);
 int sst_shim_write(void __iomem *addr, int offset, int value);
 u32 sst_shim_read(void __iomem *addr, int offset);
 u64 sst_reg_read64(void __iomem *addr, int offset);
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 2646c4632ca1..c99697b975d8 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -135,13 +135,13 @@ static int sst_power_control(struct device *dev, bool state)
 			if (ret) {
 				dev_err(dev, "FW download fail %d\n", ret);
 				sst_set_fw_state_locked(ctx, SST_RESET);
-				ret = sst_pm_runtime_put(ctx);
+				sst_pm_runtime_put(ctx);
 			}
 		}
 	} else {
 		usage_count = GET_USAGE_COUNT(dev);
 		dev_dbg(ctx->dev, "Disable: pm usage count: %d\n", usage_count);
-		return sst_pm_runtime_put(ctx);
+		sst_pm_runtime_put(ctx);
 	}
 	return ret;
 }
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 0b0cfd70efbc..913e232bf6ed 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -255,14 +255,9 @@ int sst_prepare_and_post_msg(struct intel_sst_drv *sst,
 	return ret;
 }
 
-int sst_pm_runtime_put(struct intel_sst_drv *sst_drv)
+void sst_pm_runtime_put(struct intel_sst_drv *sst_drv)
 {
-	int ret;
-
-	ret = pm_runtime_put_autosuspend(sst_drv->dev);
-	if (ret < 0)
-		return ret;
-	return 0;
+	pm_runtime_put_autosuspend(sst_drv->dev);
 }
 
 void sst_fill_header_mrfld(union ipc_header_mrfld *header,
-- 
2.56.0.360.g66cac248cb-goog


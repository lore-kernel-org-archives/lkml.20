Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.135.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866572;
	b=OUjf5VxwWJFiBUaSxJIkUOJ6Yi0ia8DOBEjnVizOJTDHJTeTuZzRtkgofjUF51Oa5l91
	 Z+PAAwPMvy9olC0B5u93gBD3uqV///ua3cn6bgQej7Js/RNo7t78OKPozkxyJZzbpAHVJ
	 dbFBOwrQceDGG1JAfhmmmyfEU84RfOs9UuWuIYTSobWg6Y3uf2RPRitEPpHq8PwE1el0l
	 o2IV15iCvip5j1VRPlj9mVkuUtlGSedoC4lNPBT1ZisZbslIx6/3nK5K2JDPv7v6BHq+r
	 YDcXF7V3Tp92eUpU8fO1cnCeqqiVKkuaFS9Yp4pFedFB5k8fQvxwGV77DnPsrbYSdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866572;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ANne3oQ9yRwjrrK3povzRK6vY+FXA04MFtOh+xV0MyM=;
	b=Kd5v9xajEDJKvvPVSYYgMXHCqXEyqHI6Y2R1CpaWb2e3YedSPtCaLC6ZvjTAyG/mvKy1
	 pNU17RUH/cT1aMBikj2Gqa0so62CPN/ltt4V/BQVGweNbPx8Mhb4v6exC2Eej85iWnHRK
	 P8ycxVGr7km9AdQA23EyHusbkka71DQ949JUph5KcfZMw8wMtfd/cXHEHyl3UVZvTf3Ta
	 16PGBW8YrD1jOYwHm+vUSmneeYlkm+tWHC9mWpLSkLYf9/bS4cpFkcsZ3OzG4TE45kTwA
	 qB/nfDDynxo9dLqb/NYLDy/LyJG3f/infZBhCeRY6xfKhIIFgjDLIUTeOdxoXn+gwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=j7b768T2;
	arc=none smtp.remote-ip=74.6.135.123
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CC606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=j7b768T2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793866570; bh=ANne3oQ9yRwjrrK3povzRK6vY+FXA04MFtOh+xV0MyM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=j7b768T26eOf/ABKGJn6piAYkwEKeAQCPJTXOhB2mH18eG3xLk8OeFDhBHg3EhD1lzBN9dtWRBBE8Gyn2IoAweaRWf6xl2rqzy015jYjpX4wBI/RURW3J+6HcYJVLMUxMfGkw9GfCwWIlXOvqeAjyDNuNcHlQ1fYcNtOOMFsYOaO3d4xrrYVdhUFDgErhHACIBp0GNEF20ng4d0zudkPy9nMO5R+hSkC5ifPWkhik/2Z0m/3Jwwe1Iwip6FHzNdiA9eoTSQKffmip3OzHUKeuB92w780EkirNNLLLCKRqgOaUWY6IbFe+b0appmlRufoiRIYZHoGCaa7Oc1jW5+A1Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793866570; bh=nu0YeT/UpV6Td/gqiGTBT8pGQ1cLZA8zmKTJwTCVYer=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=oYk8WOTZR5Cby3Pi7a06eOo+0f0NkCS/feM2Rz2/8nRCMeZ8B8F9IliGPkVWMIe5vmMIFDromxx/CPA6jz4sQo3s6qAx1/bkl2us1RUl1Urp9/CQrQH/06U4fU25csIOhsSojLdjqDGxUi/zg/AE6ppdiVkP/2U+C1ioICoQccXIwJ8LTDAY89/NcnvwxSokpnVUOxyC9EZbZSSo8jT5e8xewk9XTOjKpsEvM+MMzhmjs/4gzydePJ633m30njZwTykB9y2B5z5/eMWgT6Z+DwjZS1qx9VEfPeILBNk2UlfR5ks7DeWgrOmIQPWtft+aN/4QLL47LRywS7tw/eGLww==
X-YMail-OSG: IMvZnDMVM1m98Jpi6GZf59UYveuCH_D61lxbkPa0c8rxOWPpOeEXZXU.OhN.bdn
 tggm_z73ebwLYViiKSPJEPBBaAQkebUpepf654FvgUC3AgeiwhReqqIShro03qH96OR3sVD2UEUk
 RH8ps1czr7WMTatuvWOoZ5iWAwZj7ewXh9bF028nV4SyHzgo7h0PG2IeD4j3SAHdNwXLjWXDU8o8
 zyXFDoiFWx_YxfMb7xR78M7lM8tu8kckItah3RoyGp7zA.67NMWWY4TrG_eke3pl4DatTqjwLppC
 P0C6DD5U6gQirRehO8cZlp49_eMbCyfZ911wINM0HrwamRwKOeWl3fX0tdb9TDh64uV3JdgbBSoQ
 x9qXeNXIP6iRRAiVOZRG9eDa7BFHDZ7KEpbSdR5GPOBF9dnozvvsv59EALLuw4.AkLeN50IX4Pw0
 B0.22lopitE.ySkuPbZvczda3lMYf5FJwIRb5ZwQf2umJmVAkF5RqRUbcKta8qSSYH6bvAdNkWr4
 X4CvfDZ7FxJqWJGD4K.fXWT._TEUHugjfTpDWRbEdRt_AXwjpzYpdV3HruD05tCmvQIl75_9bjMT
 yqYH.3mWUxjcyor8axsFaHMwTLL9qhCGEdlAB.QdToEOQXH3rW.JCNKVvYR_SpkCaXiS2ab2VJsg
 0iuudEdvHg1M94gJjtwUlPuGu0_AZItCSm6coBKPR6uVGYo3mCXwPM67.9hEXKbs1aWZG5ttAjQR
 buWmwnEetAr.LNi7oBdI3W9bgz6QRnykCrg3Qk.NAS1Yu8TMixRLNGLAZEGWZnaMD3SIQfWsFITv
 SvbF8BsCt8QvRTVHaaSN.VSQqSghFYfseelje77DNst4SFCM6u9O78wA_QUfsIwa78_QI_wQTdLh
 o.So35pejdUfFTViqkD7lynbQIdVgIQgXziItoGMgRpk5njqY6s9ue7mW5RQBN52rGChK2JTz1C0
 MUeCYtY_86CQ_c0fku7DmiOs5BOYwhEH7DqiTiMcUsr5Vy11zbA0pWP58Mkp2MbSEhLrDluCLjLO
 ti2UCJpoWeYa.rkTTLu0lk4LWG5bs387KeMSyReDhEY0AxOonFdpu0BRVnbokxVrLkQkLXWZauRs
 S_0OSpqzg2q8cU05KtAY7.lqJy8Qp7q8OwtQMoC2edrPRxvzixhoI6OmW0uXWf2QLCmIUe2wlED_
 lWfvjCisvzCS7_L1pJ9wRcVH6RWck6jULb1XWIZpm5CQyUqRpuuKonz48cHTm9KPC0o2UlWIAjKD
 H5ACpMY1TZYtBAfItnT5UuiSEgy4.A..96Bg5gV7G9J55qdFXbYAZKoy0QPaC.6oY2MLhdyKkgMm
 5ZBOaC.D1AX6IgVWFHIVDMzcbntUx7Es4hK.T62Veslokk3r_Pt.2jffk2GwIMopEtevDcrUpkT4
 oxXIwbB1jbkzQgpw3Yext04zZRSovlhG3aiShfCosMBJrpSCBYx9PdZf_IH0.zIuPU1LTUv0Sh5J
 RwyPzmQBru3AnbXWtfDGXhNtgs9EUSLrL_e6a04kinD4me382A_6krIM_rt54n3UYeeauM3Q94Dx
 si1dEh9.maCSa3J7t4HxUYwHTPZsl1RSoXnV2rzLcSnEOSV7c8WIZiwSXaOpyjE23yKyvuQB4m.m
 5egpio2TsCoqTG5l6tNqoayWgqL_VnahKZK49PAk3SSbKAMedoxjlecbtqTx2XOrKEQ4mkWxWS4m
 5nzIbRNT1Dw2SM3inG9ZiWvxxgwcG.ijeGjzeuaveQ2G.8QUgzE3gMm2sr3MXK9MiOVHFEije3mK
 4L9.CqhayAZJw86Wt23AlRBxXtochzXyIYzbC4rJOFk79MdBPywheqDCY_qKcvPCyFz9MNWy33gM
 KZOxqfa0Ebe4tQ5sgTRHLkQc_ohYnbZ04xBQxL_SopoW45OIefENtGXroBlw1a00a7pf9K_Ta2OM
 js559gguVf.sHrpdPBTAlGpC0LgT7QzZLGnPIp7z7LDEfFS9X4YR92SSOfCBxJmdKqyOVq5FQ9GW
 o26BwFuNWgdIEQc0SeoHOavE2JMPOJc55tys9uzPeKwBEEn9xjiuM61lXEyl2x2AUrb7rS6pkMgF
 BvtaXeupJuiwQ4GlxvgZbp0FV_m1vwBBtEZAbAFxsCkKuZ0s6lUfRPzKhFO57SsnYPbttpyobB3p
 aKvyDx5KTi7GQyonrkxL3YcBZyhrA8LOT86K7cDsp1fYR5d9U.mtwImCraib5wdmjH64_ByMIScm
 6v0uUJEtKbEW2XGnj.EhrWQNU0_l9XSsrTUrRqNQ.S0qloYbeGhtKIU0l0dDIo1ZxnrY1GU99W0v
 iEd110yQGHS7uVm1jsyGLcJs0TRh656pIqtXAqq7N5fZQWelZEfacL2rU3UbC_UnUjY1uiS8._cS
 g1zeM1bWz66Jeygx8_9RNkg--
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: e6f65b28-fd81-483e-8822-4724472c6c6f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Thu, 5 Nov 2026 08:16:10 +0000
Received: by hermes--production-ir2-5dd9bf4598-bbdwl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID dcdd974f457abf0f44c6466242e2692e;
          Thu, 05 Nov 2026 08:16:08 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurian Iacob <laurian.iacob@yahoo.com>
Subject: [PATCH v2] media: staging/ipu7: use guard(mutex) in ipu7-buttress.c
Date: Thu,  5 Nov 2026 10:15:57 +0200
Message-ID: <20261105081558.6254-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>
References: <20261104222832.32471-1-laurian.iacob@yahoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scope-based guard(mutex) from linux/cleanup.h across
ipu7-buttress.c to simplify error handling, remove redundant goto
unlock labels, and ensure consistent mutex locking across all helper
functions.

Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>
---
Changes in v2:
- Restore the 'try:' label in ipu_buttress_ipc_send_msg() (Dan Carpenter)
- Remove leftover mutex_unlock() in ipu_buttress_ipc_send_msg() and dead
  'ret = 0' in ipu_buttress_authenticate() (Dan Carpenter)
- Convert remaining mutexes in ipu7-buttress.c to guard(mutex)

 drivers/staging/media/ipu7/ipu7-buttress.c | 75 +++++++++-------------
 1 file changed, 29 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index 40c6c8473357..e79bdb742210 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -6,6 +6,7 @@
 #include <asm/cpu_device_id.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -76,7 +77,7 @@ int ipu_buttress_ipc_reset(struct ipu7_device *isp,
 		return 0;
 	}
 
-	mutex_lock(&b->ipc_mutex);
+	guard(mutex)(&b->ipc_mutex);
 
 	/* Clear-by-1 CSR (all bits), corresponding internal states. */
 	val = readl(isp->base + ipc->csr_in);
@@ -155,7 +156,6 @@ int ipu_buttress_ipc_reset(struct ipu7_device *isp,
 					"RST_PHASE2 retry csr_in = %x\n", val);
 				break;
 			}
-			mutex_unlock(&b->ipc_mutex);
 			return 0;
 		case QUERY:
 			/*
@@ -173,7 +173,6 @@ int ipu_buttress_ipc_reset(struct ipu7_device *isp,
 		}
 	} while (retries--);
 
-	mutex_unlock(&b->ipc_mutex);
 	dev_err(dev, "Timed out while waiting for CSE\n");
 
 	return -ETIMEDOUT;
@@ -229,12 +228,12 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 	u32 val;
 	int ret;
 
-	mutex_lock(&b->ipc_mutex);
+	guard(mutex)(&b->ipc_mutex);
 
 	ret = ipu_buttress_ipc_validity_open(isp, ipc);
 	if (ret) {
 		dev_err(dev, "IPC validity open failed\n");
-		goto out;
+		return ret;
 	}
 
 	tx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_TX_TIMEOUT_MS);
@@ -296,7 +295,6 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 
 out:
 	ipu_buttress_ipc_validity_close(isp, ipc);
-	mutex_unlock(&b->ipc_mutex);
 
 	return ret;
 }
@@ -527,13 +525,13 @@ static int ipu7_buttress_powerup(struct device *dev,
 	if (!ctrl)
 		return 0;
 
-	mutex_lock(&isp->buttress.power_mutex);
+	guard(mutex)(&isp->buttress.power_mutex);
 
 	exp_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
 	if (ctrl->subsys_id == IPU_IS) {
 		ret = isys_d2d_power(dev, true);
 		if (ret)
-			goto out_power;
+			return ret;
 		isys_nde_control(dev, true);
 	}
 
@@ -560,7 +558,7 @@ static int ipu7_buttress_powerup(struct device *dev,
 	if (ret) {
 		dev_err(dev, "%s power up timeout with status: 0x%x\n",
 			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
-		goto out_power;
+		return ret;
 	}
 
 	dev_dbg(dev, "%s power up successfully. status: 0x%x\n",
@@ -571,10 +569,7 @@ static int ipu7_buttress_powerup(struct device *dev,
 	val &= ~ctrl->ovrd_clk;
 	writel(val, isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
 
-out_power:
-	mutex_unlock(&isp->buttress.power_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int ipu7_buttress_powerdown(struct device *dev,
@@ -587,7 +582,7 @@ static int ipu7_buttress_powerdown(struct device *dev,
 	if (!ctrl)
 		return 0;
 
-	mutex_lock(&isp->buttress.power_mutex);
+	guard(mutex)(&isp->buttress.power_mutex);
 
 	exp_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
 	val = 0x8U << ctrl->ratio_shift;
@@ -601,20 +596,18 @@ static int ipu7_buttress_powerdown(struct device *dev,
 	if (ret) {
 		dev_err(dev, "%s power down timeout with status: 0x%x\n",
 			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
-		goto out_power;
+		return ret;
 	}
 
 	dev_dbg(dev, "%s power down successfully. status: 0x%x\n",
 		ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
-out_power:
-	if (ctrl->subsys_id == IPU_IS && !ret) {
+
+	if (ctrl->subsys_id == IPU_IS) {
 		isys_d2d_power(dev, false);
 		isys_nde_control(dev, false);
 	}
 
-	mutex_unlock(&isp->buttress.power_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int ipu8_buttress_powerup(struct device *dev,
@@ -628,12 +621,12 @@ static int ipu8_buttress_powerup(struct device *dev,
 	if (!ctrl)
 		return 0;
 
-	mutex_lock(&isp->buttress.power_mutex);
+	guard(mutex)(&isp->buttress.power_mutex);
 	exp_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
 	if (ctrl->subsys_id == IPU_IS) {
 		ret = isys_d2d_power(dev, true);
 		if (ret)
-			goto out_power;
+			return ret;
 		isys_nde_control(dev, true);
 	}
 
@@ -658,15 +651,13 @@ static int ipu8_buttress_powerup(struct device *dev,
 	if (ret) {
 		dev_err(dev, "%s power up timeout with status: 0x%x\n",
 			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
-		goto out_power;
+		return ret;
 	}
 
 	dev_dbg(dev, "%s power up successfully. status: 0x%x\n",
 		ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
-out_power:
-	mutex_unlock(&isp->buttress.power_mutex);
 
-	return ret;
+	return 0;
 }
 
 static int ipu8_buttress_powerdown(struct device *dev,
@@ -679,7 +670,7 @@ static int ipu8_buttress_powerdown(struct device *dev,
 	if (!ctrl)
 		return 0;
 
-	mutex_lock(&isp->buttress.power_mutex);
+	guard(mutex)(&isp->buttress.power_mutex);
 	exp_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
 
 	if (ctrl->subsys_id == IPU_PS)
@@ -712,7 +703,6 @@ static int ipu8_buttress_powerdown(struct device *dev,
 		if (val & ctrl->own_clk_ack)
 			writel(0, isp->base + BUTTRESS_REG_PS_PLL_ENABLE);
 	}
-	mutex_unlock(&isp->buttress.power_mutex);
 
 	return ret;
 }
@@ -852,12 +842,10 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 		return 0;
 	}
 
-	mutex_lock(&b->auth_mutex);
+	guard(mutex)(&b->auth_mutex);
 
-	if (ipu_buttress_auth_done(isp)) {
-		ret = 0;
-		goto out_unlock;
-	}
+	if (ipu_buttress_auth_done(isp))
+		return 0;
 
 	/*
 	 * BUTTRESS_REG_FW_SOURCE_BASE needs to be set with FW CPD
@@ -879,7 +867,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				    BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
 	if (ret) {
 		dev_err(dev, "CSE boot_load failed\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
@@ -891,13 +879,12 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "CSE boot_load timeout\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	if ((data & mask) == fail) {
 		dev_err(dev, "CSE auth failed\n");
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	ret = readl_poll_timeout(isp->base + BOOTLOADER_STATUS_OFFSET,
@@ -905,7 +892,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "Unexpected magic number 0x%x\n", data);
-		goto out_unlock;
+		return ret;
 	}
 
 	/*
@@ -919,7 +906,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				    BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
 	if (ret) {
 		dev_err(dev, "CSE authenticate_run failed\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
@@ -929,21 +916,17 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "CSE authenticate timeout\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	if ((data & mask) == fail) {
 		dev_err(dev, "CSE boot_load failed\n");
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	dev_info(dev, "CSE authenticate_run done\n");
 
-out_unlock:
-	mutex_unlock(&b->auth_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int ipu_buttress_send_tsc_request(struct ipu7_device *isp)
-- 
2.43.0


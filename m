Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074473264E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223100; cv=none; b=G4CVMvAneP+fZnwQcnQT27kZcxE56ThwfOz+6gGvhFWUnM2kjZpHTFE6kbfAOWj3gtduhxKRgMlJ+mVO9I2EYrROjp641FuwzC/lMsa3amCjxe2zNoYFnNuOkI8iqpOCejbaTCUlpIQvOD/ajFqIpjX8VGDVRz/8gzQJ8iLAGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223100; c=relaxed/simple;
	bh=gPjNpDBNZpS4nNBac1YecZcI16rt+NY/MB+mg/m7tv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V72y59KqZkWg+ikfol6/a3pXR66kE3Az8N0ANky7V8E9n2gNk3AjuoAx34lBGRAdpmgYDEvEBIwan4JGbCie070It8lDPpsVcDfDGm2Dl6+Qq5+eT3T++PPBiprGAmD7Qw82HMxOrLyJQnyTp+yPbWt2H85wTAysOtbSDCwdNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI4YtpdT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI4YtpdT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3795073a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223098; x=1788827898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k30Rohc+2WDZFezLd1Hggkn12iWJGk2wvx7B05pG0n4=;
        b=WI4YtpdTHz9XTX8tGV40K2VLXO39pCGDqTGmk1snASWNCBsTySQeprbrorBpq3EGGC
         +VUFaaW9OfjQI0X9YpSAUT4E6BoDIaHfwy//kuUILLA4iLoFyWUbkBIHOLAiR62bHR+M
         hxv6SlHBFYF3YzCczPqz4L2UxXsF0Wie56LUGcV3MFNoLgVnjp/8AFbDg7amXVqzm8jo
         QyNcWjGvo8Z/u8SMiPxH77x023FC7bCBR5B+hlMYkZ8OR23dMbl1677c/4LzkmW/Ce6/
         3m0aGl4hM4xrG0TLPsp/PZ9wvyMvrKzW5eTQVoBlqFcB5nXphRFh1NwVFmzIsr0Er2ZJ
         WEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223098; x=1788827898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k30Rohc+2WDZFezLd1Hggkn12iWJGk2wvx7B05pG0n4=;
        b=cozsmGwYZItZ70OLvKuAbZP/gASkLtp58x9Tg9CQn/ohBK+wkYeRZGqrMMKaegEUJa
         35LFUQnViWAhS6vkwQ4884SfZPAlj5qmPt8DT50azvDT7tjlx+tmWw6v2Bj3yuBWeiVS
         h6WmPZtyBB+aZ4AQxO+3dTAQA6NK3ASDmcTwoBJyu8En8fV2Fwf5kzsXPnVbg3bcbMvu
         pr9iaZMxGaHitHNQ8co09a0G/BZcnWsQQvwqtltLgiqSjFoN9oJHjDZiYDTqLYdJDHcx
         Vlj/wVTyVxZiYopbcDLkvmMtigsQ7lV54u25j8udlv9Om/POwqdj5lTlALsdKV1r0Fvw
         hnrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhG3WXpBML2EhNFneTCiaylMQCMcCV/XS8+RLr5np4930MieTAWFum84qGbncosZWjTMdsV/KAUWSFkkM=@vger.kernel.org
X-Gm-Message-State: AFuF++nEk+gaNG0F3NQ6IylsAOJ/7UHQwavrEgAyLTz5YpJMZ8Zx3i1y
	40JPM+a53/53WaSYMk1FnM3L5RQET62y4cwrcRspMVLBYqLiNAaIODIH
X-Gm-Gg: AR+sD13E09UyTCppjD+DeEBrEuSuWP2Sct+lRKmgW4Eqg/H3Dn5wVQmPWkj06IOCIEn
	g9Qd3pBwLbw9nlWH9cbA8kzM6a7QH3cKdSSzCPmFV7vz2P08Zmeu6hbrGfmY8fXNy2v0wRHaJHQ
	svv9UyQZ5jfyPaVHmEd2cKWiCGNQdeigTCktC+JU5su473AyW/hTZ3Lf4aAGZ7QjUfmWn2qdt7Z
	/mlYBvJLefyELhH5HAh1c7gMYHgtLzhbFaIGl/niCPkJLeRahR2osrLeLNVQ68jMFtqHWtmHOhw
	1mVnqqCjXrmz3MSus06z5CJ46G1azyv8Aql+jIfTKVB1mvWFZzlKArk5HMYlbDHD8hb23iACfL4
	/Ved7uLPt7IcfSUK137nsLa4zASo5hxy5I6oMJ9523rihU2Jh5FDFKy0uEqLHK+klu2xPdd5Z9q
	0dIkPqnLWSmgFhXmpevnGaGk+uuVe/8btJqN0P8Dr/4gooRPhG5Ve35swLRfndhX5l3m8uYepF0
	gN0A51k6IPxfgQP+0MQhSlGsrbZgBJ66Y3VHGEMS1FJ5EZiZixmsiYoeo4y/Sp46WffOm9sw28S
	1yMh2tQu1yx1FsYZRoeh/caB+uk0tCwFDl4DPw==
X-Received: by 2002:a05:6a21:b8f:b0:3d1:54ef:e8e4 with SMTP id adf61e73a8af0-3d2688bd7cemr48699834637.17.1788223098169;
        Mon, 31 Aug 2026 17:38:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36aff95sm5000067a12.20.2026.08.31.17.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:38:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mmc: sdhci-pxav3: disable clock inversion for SD HS cards
Date: Mon, 31 Aug 2026 17:38:16 -0700
Message-ID: <20260901003816.48460-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDIO3 Configuration register branch of pxav3_set_uhs_signaling()
only clears the clock-inversion and feedback-clock bits for
MMC_TIMING_MMC_HS.  As a result, MMC_TIMING_SD_HS (ordinary SD High
Speed) falls through to the default case, which sets SDIO3_CONF_CLK_INV
and leaves the feedback clock cleared.

According to erratum FE-2946959, clock inversion is only needed for
slow frequencies when the card hold-time requirement is high and is not
required nor desirable for high-speed modes.  SD High Speed runs at 50
MHz, so the same timing argument that applies to MMC High Speed holds.
Treat MMC_TIMING_SD_HS the same as MMC_TIMING_MMC_HS and clear the
clock-inversion and feedback-clock bits for both.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/sdhci-pxav3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index db9dfa92cb57..9e6703e005e2 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -284,7 +284,8 @@ static void pxav3_set_uhs_signaling(struct sdhci_host *host, unsigned int uhs)
 		    uhs == MMC_TIMING_UHS_DDR50) {
 			reg_val &= ~SDIO3_CONF_CLK_INV;
 			reg_val |= SDIO3_CONF_SD_FB_CLK;
-		} else if (uhs == MMC_TIMING_MMC_HS) {
+		} else if (uhs == MMC_TIMING_MMC_HS ||
+			   uhs == MMC_TIMING_SD_HS) {
 			reg_val &= ~SDIO3_CONF_CLK_INV;
 			reg_val &= ~SDIO3_CONF_SD_FB_CLK;
 		} else {
-- 
2.55.0


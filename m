Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5B4A92EF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364421; cv=none; b=WpMwp1LqHnrfBhR20l/cGKfb1YKnvMOViKKt2m8EjgGFwXPEGNBKnlX5ApzcBoCw7AhAA0prDlmngUtHg+wowi11Zn4KedNDayfNKjCx5Gh++dEU/Uc/6GILHMhtFlNwD8f4zwwmc3AgTDYNGXyJk6kBT6QJT5mvnQDyf1SiZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364421; c=relaxed/simple;
	bh=1pAy6kKMkATvkj+AU3EcJaBus59hBYFwa7SSmE3+JAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ox9wJCwUB/pYy6x2zJzkUMDLU9A+xKLX31jBlNw4HOulFFO/gzxiYVT1whmWBTsfFAjd63A6KSq+eeEVL+hOa0f28XrcZCR3w4Qj22xjA6PfxUwDnYqEETuwem9wUvUd3QBMMu/aUVJEmziPSC2sMb+CjSNAqXzZfrMt0Chhv3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGsiW6le; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGsiW6le"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484415c8bf2so973532f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364418; x=1788969218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=pGsiW6leXoumEbeTiVMI2U26IhMelmxjJ8eDxm87KTxTEzk/1RgeeXNKIrBHG6xEyr
         SC4snEJORBPoPoyMomoLxpDHw/uOPXkOGdkr4ZjXcE0KRIpjqgT3P2CtJl3/Tn93DrhA
         t2kRg44ow/Fa44eZWjrEGCBhS5GgrItyPt5Ig8xE9shBTCaytczQw4E0LeEby+oYnsDD
         OBf98z5j5zONHgwPNqY6SW2s6cl7Ir22jjBhSrXVobZSu88d9ZHPmAc0kmscAAKpwuqx
         TFBjVVp0na+ot/JSkPTIgwQc0t+u6smwfDebUI3DrQZ4Y/I+KZs75UpCeIgky3uiI6/X
         jJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364418; x=1788969218;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=PbHqfljJwMDKSZud05Abik8AoauCbKbGv4ZH9FQKfDacMc2SSV4OA+h1FWXC3hqmd1
         FHHMm28roWSLNLY7iWq2+RIsLDaAUznmVYIdNpzKE4d4wDy30KWUminaVLrXfBhqHxLw
         Zx9oetFqScgc2XbPC0gjNrWqvG4Gem5BcjFCyQ09ZsmRWJnCr3mj1IL1D78U2EyblYsw
         kOUdQQL9Mze9GA/K34liUAJD7nloLAz8opi+fLY+d+Y4DyiqZ0XL2rqVSMVWjgyotmvW
         bgiNWo3Rn7pLvePY3thpt9Csa2BwbENgFknUteg0iAWrKU3vBU0Yd74xmmIlJbsyC43/
         7IuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2VXCjDXJmdZQ3hypwgn4f1lMr2qpjBLLuCTyA9Lteb/cPuy+BLDySXhJTBqtt/Zf8iJ3CVUmlXd5D/5A=@vger.kernel.org
X-Gm-Message-State: AFuF++nQP0wx9xVS4yMP95rShcgVsIM2RAv2VC+0cEji5iv9+GSFQ5Br
	/fgtfINNPp1/xgtiZKRTgvkzZ+w6lSd/GBlQsRCRxlwcJ09jE/75lDIC
X-Gm-Gg: AYBFou3wF2eIf6BtbV+LlcimtyBOwFZo+WQWnE36F8/0MwTF8ygXpxumFq/pUHbxqIh
	gvyGEeHfDhwchikYLTlS6+RNhb9CbqtGjmVgDWXCpbJU+t/qtyUN+CtUDGz+RSRQMR4pdXMtMP/
	UAfiCzzO+gAdVPwtS4cUfXlK080zCrooUdVTFRsP9CcT6/V9TlnrtK9zR2w4jtoQsyiW/aYiUR3
	Z458+w+AIB2r4bUoPuQL7kSIWLSBJosupYYG66Ar8c7UmrG5ZnkvoL6JHJc63DYyPepXqyUAli+
	Ha6X2w1jirNvvYmL3HR8hU3BXwmTXBXSvKClYAGZpL9L4fla5iRHZ3VsefyaSJKBmPlSsW0JPDg
	rTCMAI5UyAM6X50y2MGMMFFLgJNp453+MDcHCF8NfYDpAZhp8BD3cdFd598Az0Uy8V1yfAEZyZc
	wQ9AmPv7DwQbH2i7K/8yEdwl+gm3jPHbl4+Mn2FDv05X88AFbnlJfDh/fGKANFtfRS9RFbn67NG
	sKbcgmkeTCDhTMEQm/fANMn0UHKh8jC8Hj2rWcyqqAwcBsxA8zUZfGS/iQWO+bTfvQ97p3Eq09n
	jmSVur2+aSAvth0T1BktmE5f6mXGQ7mfL5I+WW4wMHevzT2XRq29eeFBEiqWaUB+lZq5QiKiHdw
	4YK1p2w==
X-Received: by 2002:a05:6000:610:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-48488dfaf77mr9549502f8f.8.1788364418023;
        Wed, 02 Sep 2026 08:53:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm6884364f8f.31.2026.09.02.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:53:37 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
Date: Wed,  2 Sep 2026 18:53:31 +0300
Message-ID: <20260902155332.171140-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The regmap member of struct imx8m_chip_data became unused in
commit a71b261c19a4 ("ASoC: SOF: imx8m: Use reset controller API to control the DSP"),
which converted the runstall handling to the reset controller API and
removed all accesses to it. The struct member was left behind.

imx8m_probe() only assigns dap and run_stall, and the imx8ulp path
stores its regmap directly in common->chip_pdata rather than in this
struct.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 7e9eab2e30347..c2b4d379a3a3a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -36,7 +36,6 @@
 
 struct imx8m_chip_data {
 	void __iomem *dap;
-	struct regmap *regmap;
 	struct reset_control *run_stall;
 };
 
-- 
2.53.0


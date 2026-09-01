Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0444A2A49
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289513; cv=none; b=k3nTn1XKhVzzrUrxq8RxGQL/OYyOim1Y6XGDrQquqI+7gG7ZJ4N5nL0x5/bvoYnym/HnphlIsbyBnvdwCG3a1hBt0PAvdUQrmKe6bLwVu/np9SbStqt/udJpCEM+YB7Yh/d/oNB6RsrSenGNZimRKpj4T2lMs2m9NvBmSZ537DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289513; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDbzSCePdDEsTWAh4Y9GgigvFNz8UbeGgED4UjL/5BEed3yZ7yYDRuAlGR0nGgLRyscYcRkAKLDwZvSYQdHuXSL3gy0spsIR8Q7zk4cfYNWPelLNrjok3TJXpM6Zbr2b4O9lZYEBawr1hEORhpqopnoPOUeVzwQHtUiTqeHDDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaeuSaF9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaeuSaF9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso1073685e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289505; x=1788894305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=XaeuSaF9xoCUPt3YZhF/YlQipiPTIPLiNEIkDFZrWtnotHduJtO63F3A/W2IlJjqG1
         FFBL1Iscu6QvqInpm6WcHRMrEdl5TsG1h94ZDoC4nS6TjiTAe3xyam1PMQWNKCDK4U1z
         OcvdbMEKo2Ppig1XEpKLqYot7OWUpyXcAstuuqEQslVNJ8Y2FoCGeiYF2ZkrB8EKzGIY
         0r6MZnq2lYK8sZ2W0elLTdYvezjmu+ZZ+FrDgyrEM7ltLBXQFlzv7FBSGHaCvAC2YNHB
         Q6NZ4piliQKWbIoY7yWPkBkRH06SfesDHBc2iOgwHcvfNz2EAgpoFMhfQpprkx3ef+vV
         Vuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289505; x=1788894305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=XOBj+I7pDUWx314Lw/EPqzd1ssNTM/fdeNA4F6/t5VkkeGhfRoYMQzP/yqJ9A35677
         6tt20RShuycypoqaXpI21bCiF2K1AvJXgEtmRD8B/lMnixJDfq30Gv+Z/Gnmx/UJJIWa
         8mJnPw+HxUI5Lo/PX+cYIpm5aMHr9NATqNQCM4UaUkO6hcoaFB52v7Ql9cKSREIMGI2t
         TFWX+sb2cwOJHxw7a3CASBD7cT6716xF5ouE44qjiq/AoQJwBWA0UIkCEyKNt6IEOmIP
         0Z82QzDik72RraaXdLR5Oey9QDWNaJqyoiptQVGfmB+Us8HdkA1MZNtTcUcBpsC+eSuH
         V2Sg==
X-Forwarded-Encrypted: i=1; AHgh+RqJ5x0b8swsaJqlJ8u5WsL2WULJuYrAX4gBOTiSNmJzmxw0WitciIgkQ3xC3HAIZSi3g4Mv6DWtXWJKCrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mrHxtshaGuNNaDMsso/7lBd0RJ+FR3i/Omj5joXNa3ZRSmVlDE
	TWL/sE/vNMbgXj3BvvHfy/gjibAYz+vF7Hq9YmVZHs6iZV3tEOGhXp+o
X-Gm-Gg: AR+sD10jYzPvA6lWg7VAFt3R4wSoyHtwGaLPyZgEihcamyHSBL4cZF2v7gzlN5uEwKG
	7Mc79heGIM9Zqx6VIKO5S5/wsrNOl/612dW6qD1CEnx2OZ5vftVu/34He4279pTMW13xjkjsFcC
	3ScXaEDXfxNAEXsEJMoaPUw91rQacoFGb04A/W8Xbsx6go5lCVKWUyzewWy9+jttlPrCmA3B2vT
	Z60fF46ouNdMLYZwqX3mPrX4R4KCTwyLBs6FdRROIGZBOU8HtT3jpIxfRiPq2yn5EwiW0oZn4Ad
	Sx5D1ZTs4OicBuGrX1ymoK4HUJUoErw+ux+9CMO6TLnI7y7OOZArnFrFpDy4Qyp6llBymGr2POr
	JZ/hD/7I8Oe9oKZiS9vUIA7WAjSX7RCgsz7S1C9ywVh7ChcIO3QSM38NTFfSKNXzt/eNBbE+J2m
	Cu8hNgGdYZNQCXVEd0W3dpKqbbLPSc9vA+PMC5PDXMPpPvbzFiZhBc2n7bB6MtstHBFvco3DZ9N
	wlfMTpsqLB9rwRfSJBiKUJ6ekjImlba+Wt/ubp0sQ==
X-Received: by 2002:a05:600c:3584:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cdada30e1mr187530855e9.2.1788289505444;
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/16] media: ov2740: release group hold after gain write errors
Date: Tue,  1 Sep 2026 21:04:34 +0200
Message-ID: <21c199748bf5b5b0c9eabfbe9bdd17ee665b39a7.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0


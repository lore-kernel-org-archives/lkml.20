Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE14D2EE6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647125; cv=none; b=hxsCOv5FUGhHNeOfQoR0y0TS7McatWqd0aQRZIlmq3Uc8Mn4C6/yIChevzMygAKIdxvsrnbMFSRuNUK9HDLFfYAMo92+tR22KpKm8HctauLso5tBnZhBoHx0MWDF3A5oRTICn3IcaI83lrzS4IXEA4takRpB0/7eqy+9jAnYDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647125; c=relaxed/simple;
	bh=fgZUHsjC2iQqVx1aidjdwZUHIcyExmr2eJm26WWTVec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmFlaLVDhxTbRpM3bqVn5tJsbZXBHhGWfmofkxjRWU5KjbANdKGF8U2XSYIlLze5vwc04PZBC6/6C+o13kl91c3XCLceQetEkLS4d+DT21fqBT9vF2pLkBbplWl/boRYbUc6yg1rTJiW/cjyd25MCafKzQqLQxxnZL7uNq7ovpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4JtS5Az; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4JtS5Az"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so598921a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647107; x=1790251907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3s7WaKRRlkRIaU7v5QcdZYP2vnYlxGT/Y2lUD7nlyq4=;
        b=g4JtS5AzYzBAAUYxUrgxf2xx95X2f+9qvHAekeOKqLx8QwYvqQGcvtuA6lXZnPoIqJ
         gdYpZxUaMTkt83FodoEMNrCzEDmm1+dlmZf1ii3DBL3UEc74CKrXqpkOqu84eH51Zbp6
         FF+snR0SKbAW33pf2olYU5DjunAqBkysDlO8N5zZ479EhqgqYPjPR7n4mHXx39DRo6yQ
         D4AHbga6HEmN0l07d8/jeitUF1mdXSDsJJGKV/hr0avGiS6MlYZmdDeEyvNxq83wNUTO
         6cHXZ1PlHPjpGcyrHT9g4uvQ7nEYE2Mwu9TF0sphjcrD2N0mRVX3EPKt7Dm3ABh97t6N
         SrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647107; x=1790251907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3s7WaKRRlkRIaU7v5QcdZYP2vnYlxGT/Y2lUD7nlyq4=;
        b=t1sXmT5DjFWri8D7PMreS8U0uo70dTPdezx73zdMoVGjB0piFNZStaT4fh9CbFZnHa
         CmSOauuGE6q/+bJ3pybYB7lWO8yRiFdMv8SEokDz1Gy/QssTgh/A/Ulc+PXLeTQlRWXP
         DthzB7BIsDOi5IS5mV8GLZ9fTGmZ6tbSeyj4UExIboZhmPLl8oqDxg3J0bFCXkGWE26f
         LFU9Iw1A69Np8DpAaWHB6feBvX0ewcm6ucZi0rHgplQ6mpDOaN3dRpBWAPIm+0n3BtMq
         VJdVGWZ5x+ghZ9SA29qH+wBvlNdcC05Ita/w+RRT3Ntlo6NJAULEWtq8SfT7xBKTYVIW
         jrsw==
X-Forwarded-Encrypted: i=1; AKwUvBwQO3VTPZU5UsV66LllaCTSLbABNfKQipLpn5JuFDUID572k9P8asxQzvAEEiXwPLkh9kP/lXjaZm/I1B8=@vger.kernel.org
X-Gm-Message-State: AFuF++m181szIEWruFAcZSgYoyqPc4z1k/3JqZlvUtlb7oHKSMheWLkv
	3Hxp/+9R1Kq8NWlx6GBNAQ0kb6rO5tE/H7r1fc7MvOQtQMhtlCX+Mcla
X-Gm-Gg: AYBFou3ExFn6w2aOB8bYceFSyaFd1aSfI1hOsqsHP7Z8S8iXDcqLurqAyTx+vjFqStG
	PonBh+Q984z3tAY0i2r+zDpZS2Kot8l7jZks6ssdekF3bXSIf6afBmxBwgAdWb9vqRL7ixdPbet
	WYVijxNAb/C+NRAC9XM48qnWvW7UiJ1COo7USgjF/Yk8VnZswATS4hk0CXuOgv4NKdwpX4gFDUo
	6Ie4edV+Wpu6Q9UGngkKOpIlZGzb1E1K6yzppASR7FbiJHc9Tvpn4xMAWQsO/JpyKwK92GozXOj
	Hp7gN3F/h3qZGwQS76tUEYgpApQNQhVw8QQsdGIQISeJtVfdiTG+rOn9eFW/AgiJbrR0T1xzVrb
	75vUKBhieOvZ71HhRliWl0Ihm20fV1YO7agU/XumnPN1n6OfiavK2x4lRK8slbICfrB5YbKMf3J
	G/yz3iJfKAQ3Z2kx5foYFHf9m0SKLWZJbl2rIGb/cK8Ak8ozshVF/CdLwz86WSXRsIgREOtrs0y
	P31vfFYwEojTBSaEXNgbgITI/EfUgnnWsljcnyLSqlECdC13+h185MktX4+ifyZHhxe56V77c3R
	xBnoIhTdNmiZpRg=
X-Received: by 2002:a17:90b:1f84:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39e1e45e49amr14658875a91.15.1789647106769;
        Thu, 17 Sep 2026 05:11:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3987cdeesm1219657a91.1.2026.09.17.05.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:11:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak on error
Date: Thu, 17 Sep 2026 19:11:36 +0700
Message-ID: <20260917121136.32527-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in fsl_asrc_m2m_comp_open() does not
call pm_runtime_put_noidle() to balance it, leaking a reference each
time resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4bc40f328f58..8bd2a144dbf9 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -320,7 +320,7 @@ static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
 	if (ret)
 		goto error_alloc_out_buf;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to power up asrc\n");
 		goto err_pm_runtime;
-- 
2.43.0


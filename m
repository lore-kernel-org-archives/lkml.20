Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FB47CC9C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240390; cv=none; b=a2bDEWvMfJ9NQI7xIi0LOr+JWKksasSy+lqzzkn96MMuOr+I1WEd/URN1IiCIN+OHFaDgK7ZFLAgwzkXWdbRdfqCKhQ/ja+O1s4T2+2kQqDBJF8+xfKYlwb88A/1dzxwiJjJtCpkCJhYcPS/1CN1brFCkpvLLnJszNp7Q2XqE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240390; c=relaxed/simple;
	bh=3EjLPMtvKg2GmNImlqYJqrTo1wBe3j2XE35A47khzrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyXkcZADeFj4eqL22taCJ3UXGl6iFE7UMDkrQnqUt7FydObf2+rgdcgJ91CRpOG1gy/MhnVNkpFwQfeITo+wjwhKHPVTN1MWHchmM6qdODX3D71Q6brbYYRPoUEp9/C4r6yuJlZNYKl5SFbXYZL5W0nhgsxzcj0QHgt5g+5L7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxUnVPSY; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxUnVPSY"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso839186a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240388; x=1789845188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=oxUnVPSYBtPggWEn+MOfo9FXtx4DX3lANkbForUWBr8rbfzzKFho2+GfJafWnmw4OL
         n3vHsJjXCFk3o4Q7FgAN83gZjSajGkp+GqDPoEcpb376qaFj9h/yV8raEBElqhKe5t/K
         ryVsIKWdnwyeIv8PB+AHTIdsfhAOWJmlKQVqaUq5fZk95m3ysHWXL/SmfmF0858VsKKq
         k+LhXNRLAIZI0+GtKMaENAeT/9rNZQs9GmE1A5ATzVN2TVDvUTShl750BD6Lsux4UvBT
         u7QcRLVe93kQpOGgHVjWbbQLoisJAk9k/y7okfNpbRMehmsUX3x3KEsmwGTLQQl0kPDP
         AZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240388; x=1789845188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=Bh2CshEo9HTtqhhQN6SicCy0tNp04BnchNa2AWo8GX9uP5o7sPieFiYjUrSTK/GecN
         8jU/tB+m/HeJggIN3hFQmEBZORVuRrOFr6KZr950lrqOeQSq9UWsJnssdisdnHOTmuTz
         ZqruCpZNx2K6cvQPH2rzyEBT6RhVR3cLcUmPC9lwlIxeMpE1liqS8vXTT9qbePQSWJsf
         t6rFGbKKHsY6QmdxmK7Syb5NAitzMh8eTBj1bzPJQxG0U5iRDy+F871Zt94FYWG6EdTM
         y17RHHhRqLphvGv5BF7y2YJbWv9YUs5z+fu3yw00DIoI2ytqvOcVm8jM8P+pzVlQhw27
         cAPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwycd0fwbpEs9hCwhz53sSElrkZrEx7GX9jOPgjeiixv8g0eBiuL55rNJicFRvXXKHbpM5BtL61BCzy6RE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2XmK7lBYEnCJcpEAy9zBFiT18OIq2aw0Us8OGiZP7xGMDjvHd
	bBGelgfmoPbFsHw2QZfnBhLfpTkfdeVRVoy2eE30rb4ajpLjHobkMKBs
X-Gm-Gg: AYBFou3vjrgwqD60KCA3Qaf5iwNHK4NfyTax5Fxw8Qtt1vv3+P3VaPtib10AW737XWo
	JIkBb6S9fRWarfZN1xvcAgVMUb8Fz4fxENKgSFkNF0d4uuTyGvb3nUAK39c7+6loIdFgGclNqcT
	zFECwbgzpg36jQJCmNW7Zxix8lYVDk3j4VGhn/hiqF/QI+LtXiMY1IMJ1EejvEq+KnnS/3ZvYky
	1wk++1N5+ykqdiWOktYmV/04kT2po2mCSuPA/oefB+BrIb3OMW4vjZI5gy4pWUWg9cIurIDhpGk
	lSX5m57urJ29SxEbqhXRtXeBcKekFcfTpOA+9+rd0wbXYWBEInfpOGANg8Ul3YqJHXQy2JTY0GW
	qhxOPzG5+u5dmVvHapYMS3be9JAXFHcV0vW4uZ5nq0U3A7R/nrZVzzHk4E1l6fZ2Loqi8Dh1STK
	VjOzmRwrGk9o72pO0LEOr/2WHFUD2CpB6ix2uzf0bhg6g93MrfXJGKBlvVl/gSdjMQZi0E
X-Received: by 2002:a05:6a20:d807:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3daed15f5b6mr20435411637.8.1789240388372;
        Sat, 12 Sep 2026 12:13:08 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:07 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:54 +0530
Message-ID: <20260912191156.185448-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
-- 
2.43.0


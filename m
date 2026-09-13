Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF1340281
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311584; cv=none; b=QflrmV3wCAckxTOPEh6OvNsLbq975PDVPpPs8e5j0lnH7TK8OkXoBWENncDoLiQqVZeVZTityLNF2CUhJyGIijvmuQScQ0KQvbbZ973yBTsZxxXuXGUkcYueIHQ5K520ZR4eQcxRtmSfzLEsc+ywwaDkFWyxOOLwnBBXYYSHb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311584; c=relaxed/simple;
	bh=ak4tshfNok3X2hRPXd4e8Yziszvu7kRWCnmlNF5Pb5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp7g0RuWUFiYbNgguqVa9vuVgrWJkyNlBH3qf2jD8XU9ZwyHN1niLvfYKvEamToBf7ubSjSLTabCNj6aLeDcsFFtH7WxAPPdXcdrUVrmFfGbBs/cElJhbatgK0EABFvcOtkUn+nE38rzOh5PDslCA0QZux5z+LZFFrcFGWuc/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9CvGy1c; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9CvGy1c"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1299431a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311578; x=1789916378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=e9CvGy1c+H+BeyV7ALbK9LsNAjPvaScD1wtUjj65xclOGPIqxi5MX1qvtMQLaULH5z
         IMbdyDHPNnubyE/OJ6Px4rT2YyyMe1IRwWyqraSqrEu/IZTacmBDlrv5h+FieCwOmVqi
         /jsMiw3V8Fhtfbg3aspPQlAD8ijYPWAK04loewTreBEexpenkLa7YOpUXH7M0qpvJVcD
         Po5U7/SptpOb5M8nvU1/tokwZ5KLm0Ucxutc5LjYdlpdfu1tAx4bbzxwthFqWiIBF4la
         NdkVYJXZHLoVB9IYzGTNM6F7ZxG9PKuP5wMnKjlaM3qO/9bO6ZvUvwzp4VwCdxvuCqHv
         gKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311578; x=1789916378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=qv4UTNNJR+RWSmIuTKi8Srla6ukiVW7a753s3q2PDolzp4LW8ItQH+Tr3/lkywl0f7
         RWLAPGZNrZ5ftt8dykiFjEbXZNiY5w9iisSXp1oq5QDQXGirV5zWo73GAKOmhmzZvGVo
         8Yg2wPmU7wiCg/54DHkKEVpg+lLBkYbS9Uaeb08YDzHCBIySLJPdvQsVP2BCPV/EYwko
         w3xtrUFHQs6c0f++DGDpPhOOW56k8ubC+x7ggsChdoKes+pXEuKIZRVtPTM896GxYEy2
         KyP22j60WOV23wUXhHB2EuDJL07shPQFQmmkO2DOXHofvyyEUn2AOD7Wktj43KqEbjZO
         BOYA==
X-Forwarded-Encrypted: i=1; AKwUvBxQTZSZLaigny4PHImMfaNOXD2KFBjzpVeRXO6CfxcbnNaOKIoKVbIn/Zd0sQD9vOpS5xQML6Eo332qHTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nWKgg8Henj9XKZQAHrTabn1xmAzzRfgWyVzaKQfumYwricIH/b
	gqprzetaQmMLZhNoZTYbyx8BaYI0SOefZNeKfROr9mZ3qnSSKWzq9fy4
X-Gm-Gg: AYBFou22g728ipZ0rpmtoilf3291xEX39LHBuur1JpMdkTDn2Nus3oP9HbRrqLAAFkF
	KJ8m96eYlpG4pLVGhswdjFzJh4eKddukDqdbffsJOPeH8gAoSwHdaLHH+cOQoE1FqQySPAw2csP
	bVfXDHcLeFJKyetMEBSDvLKxxleAUtscmWTrPiWjjA2SpuG64CBpXfRqOdaERL6SYpi8tw5B9Dq
	y/L6Mr7KgPGfSwAHSu4lPwglHwLjIZ33WPYHcqrKI8SQkd26FYKvjHYc77EeP6/lpvuTqF1j+DI
	rWv4M5Yy2bOVgj4t1oRKkObM7L/jlG+wrpMn0H1m2viJMFsBg6l2nqi9ruhc5GWrelax/pdBv5x
	4FXCP38QGl4+lT2Gdyocg6kVrvLQhhJMtIEMqwUae+jZSRcAV6inL4PyPfhpoKArUb+AMxcA4Wu
	MtRaSo3Ndlih+GdZuxSbUFFnFZmIHQc6lz2HZuqHV/ZHXfaSvxadM8/6J3M8eKTYli+vJICEfZf
	A==
X-Received: by 2002:a17:90b:2588:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39d9bd99cc7mr24628579a91.10.1789311577951;
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo clock correctly
Date: Sun, 13 Sep 2026 20:28:31 +0530
Message-ID: <20260913145905.9404-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The triminfo clock is obtained using devm_clk_get_optional_prepared(),
which returns NULL when the optional clock is not present.

Update the clock checks in exynos_tmu_initialize() to test for NULL
instead of using IS_ERR(), allowing TMU instances without a triminfo
clock to initialize correctly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 825dbdef0b9a..a64b11e6acdc 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,7 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
@@ -269,7 +269,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
-- 
2.55.0


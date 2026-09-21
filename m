Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242C338939
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961855; cv=none; b=r64yA35rt5JuznCTox3/8/zu1YfPkEi5vPqS3i1uYG7o8mXdO4+zun9LEDpY8KvZdUB7w5pq1A/H01K0U1kbnqInhlKJlDNlOipo+Z7Jw5PfsnWvSmkJwtumFp5lbzSpNxcSMCKCJbSQ9X9vOQ7dNCgGANQ7QmC5pt0eiNPSamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961855; c=relaxed/simple;
	bh=RcS/Z7aQh0jY4Fp12QLKegu31U4ADuLak7CwB6A2Qnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCYtnB7dM/U0ZBTVQfFMzKXgxQcgdp+Q6gCkfUMmncMeYsElX4K9d6MQUBpFSbg/NTFnJIRivu9bvWCXO2dpekAuyaLJSekCKRL9s7Ucds8ZF6Fam4Sl3eb3ZYY+yp9JspjHZmNwswTZ2AxQiogNA5LEatz2CPWLvYGSgN1SpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSTFwVwe; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSTFwVwe"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ed6d6eso24363305ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961853; x=1790566653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=kSTFwVweKRB+kMqp2+cInNij+Fd/DPIkUR2TqCFzfjT31SeAJHroWx9WV+6zZn8xFH
         9cTjN8k6Gs+9/dZWnt/A8NLswAJt+5q4Ht+V9K0hr/IVQ/qbmr95czh1RdR8TQ8mK21D
         pWajP5RgM8YepCtDw6NQgK1rLOBaKStXRdUdAYyAX69KzPjqfZW5cvgB6UbkWX0PcJJK
         KpXoboawh+I1egN0S8rG2ZNk8v+o5icaFeZ6e9iZ8rxH8zrjLlAIYzddURqPka47Acu3
         aDI1a/YoHUIXHFpUR7nEEmVJna5Vep3LD7DCoIQ7Eq7VjF5VBh1F6ls/5DhRVKADFMdV
         ocog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961853; x=1790566653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=ovWepi8jlzrMoS8qXBZRRnJze4W2qHSftnKJNxzKmlF97rOuNfTF+Dbug6WdZJQhsG
         cO20VZBE5SmYaBEwpSbmXCo86RWq7NttRayyiRY1mzYilejR7gVrlAciwdqiwwuuVe3m
         8X3oj0tDOJW9FL6d3NlNifObUlFwiJVaFHp4sgoHzcGNNOlNI+oQ/u8ztzOmzjdgS37a
         NCBhoVEqVVbkj3CSo8pXq6irg0oPMUOIOe2ApmqNTYe6Ru8/rWvCDigW/2Za1Lujq/gZ
         R2/u24EFCjAqVGpaArk7rkB4VqU3QRo2m94ToHvilOfC1JSIpQi3maReUVQJ2qVBkv3V
         4+cw==
X-Forwarded-Encrypted: i=1; AKwUvBwymzwLDruIxQZM649I17/8NTi1Hns75h4HCAISOKIpGPzr/vrNZz2d9cTCTt7yrs6XnhCKsm7MRojrQ1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lAkjJZ1t6n0UAK2ErFjJ1iLVcSgNQSzcGICXHLCC/P3/KNezae
	1iZy74dxMQ8l4jDTBy8pRNcL2fn8ZKFSlHTCM1Apv4u9eb5fP/Xjl3Nz
X-Gm-Gg: AYBFou0ERkp7uLm0OvA5Hu65zHqmWicbb3K8a+MuVNjS6eT/hBu0SdP1d1x55Ar947V
	xBW/2rkrPwKPHCZomdNdX88hRetpQ3HX++5MW8F69mgT7zi7Sp2Z+56Q7Wok1+gDEDhOU6iZqnG
	SD6nrggZALCxF/52J6K9GncUGDSGLkCf9URgNHwWC7rOMMjP9UEfDg/DKbsIccxgWE8LLDIRfAY
	95b6ECwrMKIvLJk5KNFysd2yAQzVWM3qKUoNQGkNvcz75Seqn/JjIIcI6uEe2+FNVdfk3+N7gnp
	rsR9mYf0jBD2STYZftwei3WRkXPUwJ9FsSECyZKGnnQLEGI07lSG/O5PUJY+5HyrubtXEoUUGIz
	ygjr3OIDdhifL1lz7D8kAAz0Dhop4f6pGxIWWV+BYag6N2sIZRTMqiYW9P8KmjKrtLzOoRtmJv5
	Uxfsl6p2xHpS+Ps57WcaZ56qQkGsypquy2MBQFDmBOaCijd4P4ZZfZrAw0f+CmXhF8ZnRh6EL3F
	NAlzTUeDxUQuR5EYBJAzdhcDioNfv66dQoN9kDbwziNapuwtvASDEBYUY6ZZ3Kte+/sqDsM31C2
	EYkRu4BkBvLwxQ==
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr84060475ad.56.1789961852965;
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:06 +0700
Message-ID: <20260921033708.14433-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pmdomain/imx/gpcv2.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index a829f8da5be7..6a54ee734514 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -317,11 +317,9 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	u32 reg_val, pgc;
 	int ret;
 
-	ret = pm_runtime_get_sync(domain->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(domain->dev);
+	ret = pm_runtime_resume_and_get(domain->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (!IS_ERR(domain->regulator)) {
 		ret = regulator_enable(domain->regulator);
@@ -1397,21 +1395,13 @@ static void imx_pgc_domain_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int imx_pgc_domain_suspend(struct device *dev)
 {
-	int ret;
-
 	/*
 	 * This may look strange, but is done so the generic PM_SLEEP code
 	 * can power down our domain and more importantly power it up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * power up/down the nested domains.
 	 */
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 static int imx_pgc_domain_resume(struct device *dev)
-- 
2.43.0


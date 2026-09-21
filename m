Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C65331EB5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961859; cv=none; b=HPFwObkFn9JeISLG/L6FG6rfB4My6Pkgbfvy+ehFg31zL6IGOSEASeBQKWXwRAYYunLWIOi7uuP7XfZDiEEIDeIZeR/idn0TyVsS4nbxIGez2uZhQ5LuzmlGnJ2IzvqzTzedb+r3Hz1AAWSlPCQt2odEiow4XogCd+n4bFEOQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961859; c=relaxed/simple;
	bh=AlzIW28Y5xD5eAX4CX9xsq0gjSAmNnpDF69Est26CwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umOL1Ko6Q+NBbcQG23CDsvw5bwYh1HDXbmHHViOj5tfPYcDij1/h0Wf5UszFnPxvVfzUHYMFw9zIU3/3ZXD7UgMnDH/srsSQ2B9xpsgoM+oAmp43h/0ie22PkkmeVXu75L4HyN3PHfdQ6N+7zrzEEeHgs9Tvk1vlQN9i0z9FPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVLBinbO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVLBinbO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so20705535ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961858; x=1790566658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=rVLBinbOibXyR9Bi+Mo6VHtZZYrkVw4KZ9hFaQUt6yW60lyp4WbW0ammASdMdKEV/+
         ZWW3twnjJ4jXzx4Kk4gWAj1kGPLdpmE4d5y1NJZRpS53/aT8QXSaHWQIM9lFxECN4FIE
         qbKNjYBxU/Ce6Q3iV+q3pA10PUJF836foIaXAT21r1btGRjYL4HV70Bw9AmWYrQzON2Z
         4N9px7Qf9oETk0ncrtLSRI+ZPaAj8kEbDWEhVFlRllI37RQ04gaWRg6pvj/BwObXEqFW
         89Z5uFLsAWyv1AO/6McH/vL6tjOiNV+2wAasV1EGARf8/hyavmJK0m0uhD3vC+5A8Zvj
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961858; x=1790566658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=duBxAU/QsvJs0SuQvGFDgJrpFHJrcERZGQcnYExIVYfpo3M443u1NEVvvhgNK2a/k7
         J2IDvMdCG0LgaAFAJj1VJpIcr+CSDykYoRRFaVSUlt7zsx+3TEObrx8N0+dud77qyFOX
         BQM2Eu5yfGmc1QWJtuS9J2RPHqcSgPIbIOzhPQ2m3SZnAFFCPKhIYKkCzjRF27QGcFof
         rOUYdZhS1oMy+nlxfWgFK2RYe1nDBxJZiAJpOBfJ7D1zqG5rwXwtJGgj+Ow1FlsYRLcd
         7NSHBE9p3MsqNeQWX7znNq/wvwlf5wncFQ/OX89YbB85nWfF2jx2jLe9hax4kdj4i5IE
         Dwmw==
X-Forwarded-Encrypted: i=1; AKwUvBxFxZVZ7LCbxnPS0O3PWFFgsOSzCtoMZhoKFJnJk+Mzs8qlWyb0p1ClRssqiTvGrZ+r3CQ0ok8QFjrQEkE=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Fb19EO8Dw5g0A0NoGcAJpxClnFXT3I4C4myxm9m4cLMIz0qN
	cTU6076lgUmB/vm8AdeQMSPiLheoxbN65Zv4BPpDxQruEPHhV31yApIl
X-Gm-Gg: AYBFou0qjmpW8Rq4MOaQvx3uubeoXRyK5phoXDnKHwFiKhFKllQPRlUbEL3OQbm0DHz
	Pw4qrnvVNtiTgZVlJJD6EdumLMbfUOq1aqVbqb5Gsk8Y4GD4BT1EqqRDFd82ei8JS6ygwlwIzUH
	IRWB+TRE3faigH41ZpRehYY1Zsqwjn0rC959/+UNZ034Mv1tcQVtY5rQdgHKiFyg7xU79bzrd7L
	Z7aqsJoE49WcPtKbVrg2uMjnSrco2O6g6r3tTmt+jXGXs7NBrlHudKBDUd41KHELCqxjMDhqkf9
	F7WZSXrOWJOJ2yE6AfWm3N2Hwq8cqgWWMIysPeJsghXRc0SLZ2WyHEhIDd2bogP2CtMiZ270Z/Z
	HWeV7xWLNvSNvLYrPddEKeFdBd3ZQanosuh9pTNLJuc9wSAHGrugeYnbc/disEIgq8412YD2lEw
	8sAb8cW0/xWiiKnJyc6vjlfcZvmui5aYuFeIJOqacE5SN6FQ+qNuKT3hRWeHRrhkZxVNPyUu+w9
	TbtGxie3yQgqdmb3Tqk4Z6YTDUX9M7Ovdv1JzjCLCvPPbjEDXe0oMP6i2W3fWPq5QFlhsWOYCwj
	gFR5bFXLM2KlFg==
X-Received: by 2002:a17:903:324f:b0:2dd:c053:9c6c with SMTP id d9443c01a7336-2ddc0539d9cmr89231915ad.34.1789961858000;
        Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:37 -0700 (PDT)
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
Subject: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:07 +0700
Message-ID: <20260921033708.14433-3-phucduc.bui@gmail.com>
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
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 479789009c7f..fe083b1e7251 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -99,9 +99,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 	int ret;
 
 	/* make sure bus domain is awake */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
 		dev_err(bc->dev, "failed to power up bus domain\n");
 		return ret;
 	}
@@ -382,20 +381,16 @@ static int imx8m_blk_ctrl_suspend(struct device *dev)
 	 * in the system suspend/resume paths due to the device parent/child
 	 * hierarchy.
 	 */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
-		ret = pm_runtime_get_sync(domain->power_dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(domain->power_dev);
+		ret = pm_runtime_resume_and_get(domain->power_dev);
+		if (ret < 0)
 			goto out_fail;
-		}
 	}
 
 	return 0;
-- 
2.43.0


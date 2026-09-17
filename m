Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089573346A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609147; cv=none; b=VV8ggXDBIJiRcovvJFZ9WEy/sII8czKJsQtQr5VifgfsS8NkEoyJ3Z7xLBhsvCsShaMtnlhInKJ1rAyHfqtKkQEufris9e8lrXKhCZkQ6AtgYM4t5pPq8ijveFvGdhcIEB5IY96OaYgjP2EDhTg9JoEdvspsIG+rPTYLojkQXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609147; c=relaxed/simple;
	bh=ukdzbCA5q3ejuCfAb3RiI9tSkoXwk8V6VN9RhuJ/6QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LoCVSlzJRRDyb3ZqgjHSPmxpGCzb+zZtaXN7nzfCO4dkTI4PT6i6kSl+OJzJNsGnfrivAtGKH4fS3XaHceHzJ2fH7q8Q9tw29eOzKFvFD2oFZhxO23jluBl9l7oT/YN0HtQW5J28PmJNCq+oUd/ZAoBC0421WyxIRctmk2e3phY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkYrLPWP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkYrLPWP"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2825335ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609145; x=1790213945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qovVZ6wRVw0ADAfNYTA6DPR5aJFTDZrs6MDoJDc1gU=;
        b=JkYrLPWPQYoZJxVG10JyY7+7SEOV7O6Ro+LQphs+V4G8kL54A1DHvUXlHOOueXXDSC
         Pk485krd+0wPFFBxoGb0tep8XI6R0oSI5+HpGA4M8x08B+cnqEatz13I3GO+TSlAi+1L
         uyYAlPpFnoQgbrRokSWxvYCYnJG77zgmI8R3Ou622D+xlnFq5fiTRymTIA6IQGEwubn4
         ZlfmkcoiwK/xUQF4dJRRiMxvk6j81c3fjEmn9zhHPwfi50jUHeMffwvlOPaQxBd4mBoB
         kitB77xgr4AaOEIM4/xl4Veb22jH3n43273r8Ibmsfr4JUjL6T0SIXhjO0jjVJLkAEeE
         oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609145; x=1790213945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qovVZ6wRVw0ADAfNYTA6DPR5aJFTDZrs6MDoJDc1gU=;
        b=luS2vhuipTqwG1i/ePyP1oJD6vSl2Y8XmMWJ7VeN9Mk1/03DOayUBHN//Cnk4ui07Y
         7mN+6P4YBnyxafFpelgUZi5x3Gk1mHkD9VZcBeeeY2rXXkN0JE0GeWxJkOOiByetaw4F
         iFPW6mZbKkAF0vuZ2yqOzDgMT0EPFCWWVjdNL41qxOzIzikNqlacAAcRUMe72TvXtO9Q
         N/+mkiW+WuZQuUIuHJkNtAj7eb3Nef054RtFVkFEFTcDbIcvpZkoHHD0iupDP+zrvmb6
         Tr/jvf4ovV176UdjFsT5uRZZcVyUgaEbP8TF7NnZXhQ+9voRvBs17t+3ME9/12gh6Ii6
         8ygA==
X-Gm-Message-State: AFuF++mYS4Yh5uDQkjp00sucj/QuomvTgeWpgtckrcHhJ0qpWtP03l0L
	OUM1T9g2hyqT/+s8gtng1i0xWrBQw4HU2EAL67Jm4xGkDQ24E9HB+vw=
X-Gm-Gg: AYBFou0smlJfoVOGskVG7heryULknH9Pz/A8GhG6AfjWC0i45/MwaDSDdQOBNEWLD9v
	gxfljEh8oSxHkXLbGgwnvmAG0FH9mKsuW5Aty5YRO4LreIF/+iwDt119+DPg/OloZ/oc6dIHf1p
	Zc9Hgtu4nh2N5HqYx4thRpbQO5hF8IxABXNFeb+NTRBeFcOg2nIvIRp4JQ/T8WQSpBViUksxxRo
	S4je3XWUoTQyiBdGtztJ5JXsB5qqaBSLfvImJxEioDNPO0IuRc+CPjlHvKi6H0Ro1E2iTUrxB0n
	6b+all9RQDuUovyhKgBMzZIa61/roHwPYsA8rlX5Qol319PEAH85ccsxElnSjUaNmgE6SxXXZ67
	z8dRQgaLo+0GLcnGhoirz629tRYzKADDiAGjcEpVNJBux/rSyj112G2c1PQyXRPydzxZTaw5caE
	7OLhe/3VdYvJkKm7ooymCJvgess60HlOD/W3ePnLlwj4L6kDrSGRtLY1IrJY/iMZ+KvGXsgRgek
	eIOdyYEfWHv
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10282352a91.20.1789609145193;
        Wed, 16 Sep 2026 18:39:05 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1039253a91.14.2026.09.16.18.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:39:04 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: radu@rendec.net
Cc: linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 17 Sep 2026 08:38:35 +0700
Message-ID: <20260917013835.223139-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This allows dropping the __maybe_unused annotations from the PM callbacks,
also reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
v2:
- Address the commit message following reviewer's feedback

v1: https://lore.kernel.org/all/20260821043928.123543-1-triet.hoang.dev@gmail.com/
---
 drivers/irqchip/irq-st.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
index de71bb350d57..fef0521831aa 100644
--- a/drivers/irqchip/irq-st.c
+++ b/drivers/irqchip/irq-st.c
@@ -157,7 +157,7 @@ static int st_irq_syscfg_probe(struct platform_device *pdev)
 	return st_irq_syscfg_enable(pdev);
 }
 
-static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
+static int st_irq_syscfg_resume(struct device *dev)
 {
 	struct st_irq_syscfg *ddata = dev_get_drvdata(dev);
 
@@ -165,12 +165,12 @@ static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
 				  ST_A9_IRQ_MASK, ddata->config);
 }
 
-static SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resume);
 
 static struct platform_driver st_irq_syscfg_driver = {
 	.driver = {
 		.name = "st_irq_syscfg",
-		.pm = &st_irq_syscfg_pm_ops,
+		.pm = pm_sleep_ptr(&st_irq_syscfg_pm_ops),
 		.of_match_table = st_irq_syscfg_match,
 	},
 	.probe = st_irq_syscfg_probe,
-- 
2.53.0


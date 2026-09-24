Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28881390981
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259932; cv=none; b=cpQEfJykbMNBUkoHbDytSGtTg684iFXKud23nsrNmoxXlYWtTD7XeSNjBhH1WIgydeVON5uKLXYSvbJtfERIOSpWwQdONxFAlbMAZWH5rLwUe2YgmSIR/iCaNYFIKIDbPfhe/S5DqNfO9Bt7YJpb480zFnr6PgJ97xjQr6CBZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259932; c=relaxed/simple;
	bh=PCceAyxaZLKgL8goEMDQOo0fDMqrsGEIZWywwLaroIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs413TvNdqRzSs5Ct1WxY5EtXBxgfGJcNFQAdV+HRCHigkIoH3SEYqo/9QfOcJgSS5BJskYMR3Mh8uYunNLpGPA/fYdOmSrBvWRVsjwNZw9RS17VKRyHtduiV2TLnSp/0OrH45/dRRiH3FmUfg8q7aWHOUoH6Lei/k6Mw06JR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUaJOYo0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUaJOYo0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso584921a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790259930; x=1790864730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaWkFoUOQ+u9WS91tjqMuEOPGp9Db2ThXslkCbREcik=;
        b=iUaJOYo047OfnqEbDRf/l0Vc+QXRDOu6pdcz7FU6JL9utiqm4seLDMg+ftiJt8tShO
         azCo2kEEykKInL8/677EBvQFEdMyjmM9jdTI+U40gdOdhoxwzCns98K1LOOG68Tl4K/c
         C/YPGzk75w+vf1gcgBUIwPYLa4wETVhXgVYKnYj075UsYAgxg+1oVc7llgndUyQ4OD0I
         wjDILbkwQkJrjVVZfpq5ER/wAQp9neyhrBt57P/KP1/H0En6uLY8a/N33pq5mRtmh2zN
         7Dm/bgj+8zOZAluO3jBCF/5nEet/FOA/pMXG6xujb9ZiC+k53cbGRPJU3fE4m99FNagj
         Qb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259930; x=1790864730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaWkFoUOQ+u9WS91tjqMuEOPGp9Db2ThXslkCbREcik=;
        b=bAHyzfUVVUx+qaU7UfleF3FB8BTptG2oxYv151gZZZmbRKm+H/Ej+DirtrcHXo3f8r
         im3qQGqkfwedlNz+ytHi/dvpqG1x+NRLfr0uiiudovZnj5o2DN+cXOwaV7aODMPcTV31
         3PPQLYFlEfeHQGE6xCmagLhzIougWe3kbii+/XrhJgwN5pc4OEJBtvdUWU4JZ4UrocWC
         FulS6ULhB4poRmfNPZtunM7FmeEcJ/Vt2TI0qQnpA41EccsIJ6iPaDkMN3jQi9y+fi0O
         zd0jbbs17rg/PAIWC5FwifN1mzGj3qNHJoRsXCUZdzJIPj+nBDPty6fbFBQqzd5SdbtI
         DTbg==
X-Forwarded-Encrypted: i=1; AKwUvBxeztTESK1HEB7KMnDgGXKvVCrWJ3BLbaR9UYc7LoxGHOMuAdgBBsCrnZrheLeRlWjhTSEIT5DqBti3hQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nZkxhLbyn6OKYtL3pot+lDJmj9LflMp9B6cmEpsBORsd+xU70i
	bXEHuTpfuXInrdnnv9H8Ke/poNi7zomufqXWw0sv/1W2kCWeiVZCnwqa
X-Gm-Gg: AYBFou0OVRq4eRHTGiWd0HEuIx67FqZPAnYHQTbC2+zrGKHKD/fak6C4oGGySu0ph8b
	DHLCj1hrcTy/l7ZTwbdV2ayoA11RcSOYuR/0lL45KyqJaGy/qSpJdueHmN0s8ifuo+FVdhNhQ28
	rpQEK/L3ysOKJFezXb/x4TWi6qqheUC1G2XB6S5u9R+xU656rlFFriBtlbNIyO6iNPrR1OHwx5t
	isCcYRTNtOdxulJdty+R4xO++sdPzIxGvTUj5G5QGcQ/LkuUmF4AG+2DG1rd2aF81Io1mnWPwoU
	oN5lkSxFcKl9kYT77kYEAlKzTbWToCqeTd4Q68YN2DQqDlINMduAopyXNm/xNbsq5jLRxqCxYBV
	Lxd3ol68tsO21PpwX+oa5RRzdno0OPigXNhSioFUifNT3es1KNRYX/yQe24vviOFbuk4qjWQlwD
	+RQFPEKIjPfEOgkqk8M2lQcFKgBFrrf7+gH52vXfRVRpfXyelLXu5ZOQ==
X-Received: by 2002:a05:6a00:1c8a:b0:87c:f3e5:ebda with SMTP id d2e1a72fcca58-87e99e3efcemr1451856b3a.0.1790259930408;
        Thu, 24 Sep 2026 07:25:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm3157310b3a.6.2026.09.24.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:25:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] pmdomain: imx: gpc: remove all initialized power domains
Date: Thu, 24 Sep 2026 22:25:20 +0800
Message-ID: <20260924142520.1594149-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_gpc_old_dt_init() initializes all power domains described by
of_id_data->num_domains, while imx_gpc_remove() only removes the PU and
ARM domains.

Use the match data to remove all initialized power domains in reverse
order. Release the PU clocks after the PU domain is removed.

This issue was found by manual code inspection.

Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regression")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Check the result of device_get_match_data() before using it.
  - Use an unsigned num_domains variable and a decrementing while loop,
    as suggested by Andy Shevchenko.

 drivers/pmdomain/imx/gpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a22..d83fb37e2297 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -502,7 +502,9 @@ static int imx_gpc_probe(struct platform_device *pdev)
 
 static void imx_gpc_remove(struct platform_device *pdev)
 {
+	const struct imx_gpc_dt_data *of_id_data;
 	struct device_node *pgc_node;
+	unsigned int num_domains;
 	int ret;
 
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
@@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *pdev)
 	if (!pgc_node) {
 		of_genpd_del_provider(pdev->dev.of_node);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove PU power domain (%pe)\n",
-				ERR_PTR(ret));
+		of_id_data = device_get_match_data(&pdev->dev);
+		if (!of_id_data)
 			return;
-		}
-		imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove ARM power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
-		}
+		num_domains = of_id_data->num_domains;
+		while (num_domains--) {
+			ret = pm_genpd_remove(&imx_gpc_domains[num_domains].base);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to remove %s power domain (%pe)\n",
+					imx_gpc_domains[num_domains].base.name,
+					ERR_PTR(ret));
+				return;
+			}
+
+		if (num_domains == GPC_PGC_DOMAIN_PU)
+			imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
 	}
 
 	of_node_put(pgc_node);
-- 
2.43.0


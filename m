Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66651D4606
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788011377; cv=none; b=UsAJS+0KBOY4Y4nZFZua0Wq2krhBLN9zHOxu6/atVVJPhLD6z1HMf9qK6Dluosj0qe9lhPcDd42j99T5jdmN6IpxjT1MFREB+6m/Ey0LmJMhsv8Nflv8jviPOfR3gB7FLoD+UwvK18r7870bQGf6cpfMF3e1n8VBHH7zJ/FRTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788011377; c=relaxed/simple;
	bh=NDGfLTb+qMTcoqzmQ6Q/Oa9teGcC2yTW1B+lZiiFVVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0ETP4Lyz2dZ5YDr8bOP5r8ghvoa5ZRsqMMrN+zSSZkZINNIlY3hgcqJx8U2FacC4xrPTf4WnSqL1JxzyEhemzevGtD4IuJraIwY7TiVqYINXoMVu1gIRIUpfzcOCpucqoBgcom5dtPqXTq3tIw/+jCGFcI5VaI9vVEuAW6Ui2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh8DuWkW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh8DuWkW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39675172593so1635208a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788011375; x=1788616175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3QtaABuS8qJhvVlLF8eFIQuUjWP6YhNYZcU2LoDrBc=;
        b=Qh8DuWkWfcEEYNpIK7Ci9ln9vJtmZpXkyL6FuWBuv2T3ynLAbWXsXbrodXBqj1psQW
         sRec49u9x0FuBdlj0gTLAYXVsSaLuTmPkXmjC7kCG6d+6kpkDWrz/Gifhr0harObpP/z
         G6EfNtVMLMyapvT7Edgpk8c7zQ/eHud17sJKYRf4pFOHha2q+hUGS6MGX55vHzAUxUN7
         pEv0/rdjSlUFsS7phza9AmS2AWPcpOkG3Tqpgk0N0MFuTSb8y5D25ciaOSDRl7LfgiPa
         kdu8RUvQgFq0YO2S6sbxqMf6/hnWRc182UxiRBG5E4KMl6o/niivoKucOrafUEllWfzx
         w4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788011375; x=1788616175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3QtaABuS8qJhvVlLF8eFIQuUjWP6YhNYZcU2LoDrBc=;
        b=Mqx9PcaOWZ7euyfqW+kDqbxzESisDsZ12QAMKfaZw/uA56xIz4yyWsBEOGtkFrrvrT
         rXSSlQR5dm7xmOP/SZNZrN1AzkIrOYpfgS4AmgDDGzG+Xws876PWk4Hcq3AXwlgxUTGr
         J6rQk+px98tboKc7Ri36muzXgb4uVc9whJYiGQsxslZQ4QxmB8EW9RewMnnEpljcZAiP
         6ODS2qWB/r+IRqGdIFwnwMBWYpq+9Hf2GdE6YZnSOUTX/ZY0Y4/OsyW9FlynAL+Cd0A+
         r+a7fyBZSvjFq2YmsaM+S/hzhVOLeErwnUnKFk24NhxqZm8qJmwcSrtxtgcUKDMRmj1w
         Ptqw==
X-Gm-Message-State: AFuF++nxtZZpMR/1d7NZRjtR/YYj7JJetrof2F8iOUhCBHQVcR7MRhiC
	gdFmdEc21ZHxZU/o6Mc9Gi7hi8FEEaFX78t3zu+XWSZBOdZa0VAtXij8
X-Gm-Gg: AYBFou1ZZVSMzHCwymdSkBd2L3uRnwRa5pcVx/hlzTwNBp0e/qpLzl19KrDe0IXp68b
	w4OkUi3ZWheoiu5+VQdepLTVRiyXtGHQ8ZlUJbam1BSvshCF4XeaRHMsaj31qbwFWFC9gI12Pj0
	pIzG4+6kqMV4hEmiu9zZbgdJ3iyFUwvMqufJNZFf8NlP1NMGWHcrj7OD/66yZLK6KpxTunpeB2C
	a/3EhQc4SUZsCrzrxgApIz5XuICz0NKvHsSNysXog85uNundJ5TxJMDlm607QuzuvXu7D5xbfXO
	KfGS/2Q4bNSDrsqA1mAS8owrzJ9LZz+3zY6sd7s4UeFjg3/topkYV4a2MTW2G+KJOdbVJCNqucg
	Obj2gLZVLJ8+oTbLAOliI5QYAJgT4YM2Q9Pd+PZgtegx7O4Lpz3v0YihRPDKOqjupG1GIkBKWB0
	Vfcr3+C5/cgpokXLP6xAXrImtfgfaCZMZ+RWEUsfvc1DFWDh8hq+2YupsJWIQq1XtxRzizsg==
X-Received: by 2002:a17:90b:5108:b0:398:9c00:29ea with SMTP id 98e67ed59e1d1-3989c003c23mr9792992a91.18.1788011375102;
        Sat, 29 Aug 2026 06:49:35 -0700 (PDT)
Received: from gmail.com ([58.84.62.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm15206886eec.23.2026.08.29.06.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:49:34 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: vireshk@kernel.org,
	nm@ti.com,
	sboyd@kernel.org,
	linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH] opp: Use %pe to print symbolic error name
Date: Sat, 29 Aug 2026 19:19:24 +0530
Message-ID: <20260829134925.8883-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_dbg(), dev_warn(), dev_err() or pr_err(). The %pe format specifier
prints a symbolic error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME
is enabled, otherwise it falls back gracefully and prints the raw integer
value. This makes error messages more readable without any functional
change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/opp/core.c | 24 ++++++++++++------------
 drivers/opp/of.c   |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index cd0e82dae776..1e3b80a1f88e 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -453,8 +453,8 @@ int dev_pm_opp_get_opp_count(struct device *dev)
 		_find_opp_table(dev);
 
 	if (IS_ERR(opp_table)) {
-		dev_dbg(dev, "%s: OPP table not found (%ld)\n",
-			__func__, PTR_ERR(opp_table));
+		dev_dbg(dev, "%s: OPP table not found (%pe)\n",
+			__func__, opp_table);
 		return PTR_ERR(opp_table);
 	}
 
@@ -611,8 +611,8 @@ _find_key(struct device *dev, unsigned long *key, int index, bool available,
 		_find_opp_table(dev);
 
 	if (IS_ERR(opp_table)) {
-		dev_err(dev, "%s: OPP table not found (%ld)\n", __func__,
-			PTR_ERR(opp_table));
+		dev_err(dev, "%s: OPP table not found (%pe)\n", __func__,
+			opp_table);
 		return ERR_CAST(opp_table);
 	}
 
@@ -722,8 +722,8 @@ struct dev_pm_opp *dev_pm_opp_find_key_exact(struct device *dev,
 	struct opp_table *opp_table __free(put_opp_table) = _find_opp_table(dev);
 
 	if (IS_ERR(opp_table)) {
-		dev_err(dev, "%s: OPP table not found (%ld)\n", __func__,
-			PTR_ERR(opp_table));
+		dev_err(dev, "%s: OPP table not found (%pe)\n", __func__,
+			opp_table);
 		return ERR_CAST(opp_table);
 	}
 
@@ -1036,8 +1036,8 @@ static int _set_opp_voltage(struct device *dev, struct regulator *reg,
 
 	/* Regulator not available for device */
 	if (IS_ERR(reg)) {
-		dev_dbg(dev, "%s: regulator not available: %ld\n", __func__,
-			PTR_ERR(reg));
+		dev_dbg(dev, "%s: regulator not available: %pe\n", __func__,
+			reg);
 		return 0;
 	}
 
@@ -1448,8 +1448,8 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
 		temp_freq = freq;
 		opp = _find_freq_ceil(opp_table, &temp_freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "%s: failed to find OPP for freq %lu (%ld)\n",
-				__func__, freq, PTR_ERR(opp));
+			dev_err(dev, "%s: failed to find OPP for freq %lu (%pe)\n",
+				__func__, freq, opp);
 			return PTR_ERR(opp);
 		}
 
@@ -2869,8 +2869,8 @@ static int _opp_set_availability(struct device *dev, unsigned long freq,
 	struct dev_pm_opp *opp __free(put_opp) = ERR_PTR(-ENODEV), *tmp_opp;
 
 	if (IS_ERR(opp_table)) {
-		dev_warn(dev, "%s: Device OPP not found (%ld)\n", __func__,
-			 PTR_ERR(opp_table));
+		dev_warn(dev, "%s: Device OPP not found (%pe)\n", __func__,
+			 opp_table);
 		return PTR_ERR(opp_table);
 	}
 
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index c02e20632fa6..d33265860553 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1345,8 +1345,8 @@ int of_get_required_opp_performance_state(struct device_node *np, int index)
 		_find_table_of_opp_np(required_np);
 
 	if (IS_ERR(opp_table)) {
-		pr_err("%s: Failed to find required OPP table %pOF: %ld\n",
-		       __func__, np, PTR_ERR(opp_table));
+		pr_err("%s: Failed to find required OPP table %pOF: %pe\n",
+		       __func__, np, opp_table);
 		return PTR_ERR(opp_table);
 	}
 
-- 
2.43.0


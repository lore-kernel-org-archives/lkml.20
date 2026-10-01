Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA431D5CFE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873537; cv=none; b=NHiZFeDiIqZyiHVAF8e4ZCfpvMQFO4MRfd5YffBq2OQpspcMwbaQNg6JLgx+16NxgSRxj3Fl4TiY2ZkLL0b0/a9vWnd2FJCpWGAEAXC8oS/QYTIvHVpoF5HP3l/lbAiwZoUAqXGbbzZQdrlsSdgaO3472GOJ8OeeQwq7O2hG9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873537; c=relaxed/simple;
	bh=bnqOd4Vosj6qTGxWqIJJjxL09W4L0ejCJMqbiEbYD8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRff6Tkj5ZASbVnGBBjwQLBxOO+QNjJ9wB0I/cC5+jM2zo7m9A47w+PCj24Y73tToUS0X82DBTZ7rPCyAFL9Ohjm8GG1aye0UFEwnow1/PFbz0Oh1pYP9x6yNC9BtinDbluyuCm2Y2mn1K9YOEZpQScx7xYByQu39RY+O0+lgrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlcBYEa/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlcBYEa/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so51393375e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873530; x=1791478330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=rlcBYEa/cBgSjdO0YSD9vKAzs4q5RlzCCCXTn9MKrehGtndo71ubOOhjSVnCOCUc3h
         Sakojlyy5Eesd7TEGIaZP3IKMfqwexopp0u5qQV3Qv+9H2aSznaQcY9A2IVcHRLAZqL+
         U0qcltlGma5LSwWq/NiOhhBK24GqEyspGAhWPg8t9hKsjrVjgXEyhHtzxyasg/ACSHXV
         pcsyI/CRVYRJbZHKZ+Pvp4Rw4/jMRr3LlEaw/kgUAFk0Jaw84CJhqImFwDBy1us8NU4N
         O6xc+1qtBCoq/qMR2kyoZURSeFsFafZQRWTFur1Dzd3nYrZzHww7NAZA5V4SzX30GeDq
         FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873530; x=1791478330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=a4wCm9QX92+DF+ymn/6osF1QgKUL6R01n684xMfIXcMGuqc77VEOZo7I2qUf8wGJ+3
         zAR6ceiDhdAZv+//7iD2hqMMDgBEuz7o6tKX8UcNq1OACUj9+q/CxUM/BCY4GTwLQKeT
         rFy55cdB9quuEZqtOyRufbyP3NnHdDl7tYL/elxdc5Q1iuxvS38cXWRmqdsGhFmjS5+I
         BqOlbQVMF29ohQZDAC+7ehvOy/9Gc/QgVUmi+m7otkaCv+NiJ89LmvjutzS618BwVMhb
         /MeGD8XiBKCaSpPeAyj/Q8vlJ3R/MUrEEehqzd8Cvg3i98XGw0LV8z6QjUl4VqOIeci7
         uaNA==
X-Forwarded-Encrypted: i=1; AKwUvBwBHRHq4R28davpHPqYVMCXRsfCaPuYHTFNFDqp6w9AVYFB/RfPc3Hefm/UyAbDATk4R1JWM/S/RmaJAUI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltOJeUYLXas/86qk7/G0UYlG68cS9bikkJtDpYarQv09SfOq2b
	Ri8oeIxIQgeqkVs92lIb+tdyBs80hpbZ5Bv8jC1sFwI7sLYQRAWYWKfw
X-Gm-Gg: AYBFou1wsbMoGSuTeyLFdcATiOQkO/ZPNFad/MXH90c6A9tJLvr4mV4yN79pySI2MnM
	RNGNc6JZZk7nnLQ9LhOzOs9pjTvfDd5i5IMEiQiVQOb5iB+iv2KbjEIa1aASdDidN0QNRk9vDZB
	QPR7ppwrI+CG2o5rcqlqPi2rjyu+s2p/e5p23RHn2s25EYITqNfKsa1v9niPtWUMg1JqSrCKNkG
	HBwhcBKD2grLDb5FbomTlacqVkNLP0iCKSzPCprfL8gKOWF+U9NG5eu7CLpZAFcDJyyzKTc3EWF
	UB/wTbcjtMnEDuM7OfL7BLlF0Lue7q7RwYNSy8/AvU+HyR66x/G/qk4/tdXX3e2M8HDj1Rff3N8
	YqndB3eC4vxV4CvLyd7queOKwvztY9fci7Z5xqbWeu9DqnC8YC9q3KgY21rN1pWw4nARwW7jrsP
	76FUxZXqZxUzA1UDowwbc9z71tCXqsp7248jYKbNACO5hxbMOFxhH7xqDvDR4ebQFIu/uUchAbz
	8VfQe+SuR5N50qwMntf+Sno7Uurwtgqnc5Qspj4DHpWvBxcs4aqjVrUOTgGqchGf/DPSu2n536t
	9fMu1pLu
X-Received: by 2002:a05:600c:4e48:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a02769cf5amr4592405e9.18.1790873529990;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 4/7] watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
Date: Thu,  1 Oct 2026 17:51:58 +0100
Message-ID: <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTDCR is located in the CPG region, outside the watchdog module, and is
accessible regardless of the watchdog's clocks and reset state.

Drop the unnecessary runtime PM handling from WDTDCR initialization and
access the register directly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 4beaac44d027..e8a40482d580 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -255,20 +255,12 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	int ret;
-
 	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->wdtdcr))
 		return PTR_ERR(priv->wdtdcr);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.55.0


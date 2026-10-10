Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22236F917
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621322; cv=none; b=S4YUvcHsvL2v/aLIBV122xevhoXMtz6S2hAPd8h90XD8LZtq47WfBg4rGIAuMzhdI+STwHMz6nbjzVv2wI6afpsXUIwlU4Ei0xaPt44t2P2aHKVpVdv9g61Omf6JlWO98JhfAq4M5CxoyasDym5GQwnj7qa/JUfgzvTBcxzK0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621322; c=relaxed/simple;
	bh=5mdUzxIr2uleWa+kpKhc7DCtFAC4LuwwFGfpuLa97ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFWzZ0lwzsFL7Enf4mpYtRTENFjEe9BGmdPli169Ayz2h/OK56FiiInQ2n9x4hPiRPnjOJVvIltmNXN9G8jrZDcKOy7KBcj/aIopPlW9/bu5fygJBU5GOdo962ikxpOCSuXSrO7+B4wGpzcL7R/nf2MRN5BOkAOwsYZErF7tsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3518cbe59b0so300853eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621320; x=1792226120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njAznGdYasKrT1/VCSuQJgMHPzKgYQg5CyE2w0aynkE=;
        b=tj5wogyw28nk7Gy6kmYo+OWAWK+8Ps7sPGNFvZIBrjG2NyX2aIiskb2Ohb/miVw2Wy
         7dpRy3VTLQuISNJIQUz0Kga2y1Vh9ee+gzxuJWjV2VRhX6Z53/b4S+hrP4UsJFFoF7Ts
         GdrQw+r7pd2oEwY804hek6SbVo3+GQL18zm8gWCYgZ9uofe/9SG2WmAl5O4NaM+ceTjs
         UaRPUWsE4J/6mxJvlDd0j955L9y7oW4tpFp/+P7mQ01W4wX3UJO7OepHplKpds693Q5v
         bTxEfKCD8lb8GXBm4Ge8RBnxKKv1101j2RyLecnI7MXiPDPZNosDHuE9qz/EYjItXMDi
         +lUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/jjofII5REI0+oNCVWSA2J0JNhwit7kw7tZda4+Hnert4zDvLEqHqd3JAscLGmRgeNk8uoZmxF6eWpbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaW1EaYhO84rxmFsaynOXnB3MJsI5MnhzCrrEZbAeaNAPS+c77
	hOOArx31qX2LyxdeabQ7LYicUz/ToBqyerYoSvkI8EB1IWTxGEcORepq
X-Gm-Gg: AYBFou0eDKr3fDKeBUqXkV6IVXz2NF5yUiDkMn1QCa/d64YzDsQWwFp/4No7T9KXrkn
	UrvXqO14c7GSD8PQ2XtPsjB4qgNcl/d3JpnJ+tUNOf2DWuKMe7TtrZ2gi/QmcvlEus3F/BTSSha
	9LfQfyNXXH29ZFvtSeNPaDgU4v9QeT9OZlZ2sVk5vmtpxf8xTQTnaFjB7qPWppeLYmnVY2GMGmk
	W8dhMZcma5IowbfQUsg19SHTMpsn0/Jy/O7cnKuE5vNoDH3SJ3uCJWB1RHo7Jx3aZbLDlgLasi3
	wHn5V44n79p/FCGnTcKhS9rcBDGOPpWOhiKtlpLInWT1yhMu97RETNPbYbX4H+EIVOo137NY6UL
	6nqRxMI47PhJeE4sgLrjaoRbjCBu4TBk0ghI1M7KlXLEG1RLUIEC8p/AQR8uMhMS4nG3Abw3Jeh
	mIeATN6NolQGXJ+mHBQPaJglOMVa85g4/owe2zcKGrX+XviprtDm47rsyoQ8rw
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3536c53930dmr6687600eec.13.1791621320473;
        Sat, 10 Oct 2026 01:35:20 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm12689858eec.4.2026.10.10.01.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:35:20 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: Mark Brown <broonie@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2 3/3] spi: s3c64xx: Use snprintf() instead of sprintf()
Date: Sat, 10 Oct 2026 14:05:04 +0530
Message-ID: <20261010083504.26261-4-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010083504.26261-1-code@aayushk.dev>
References: <20261010083504.26261-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Kumar <aayushkmx@gmail.com>

Use snprintf() instead of sprintf() to avoid potential buffer
overflows when formatting the clock name.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8d4120cf9..8195bf376 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1331,7 +1331,8 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sdd->clk),
 				     "Unable to acquire clock 'spi'\n");
 
-	sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
+	snprintf(clk_name, sizeof(clk_name), "spi_busclk%d",
+		 sci->src_clk_nr);
 	sdd->src_clk = devm_clk_get_enabled(&pdev->dev, clk_name);
 	if (IS_ERR(sdd->src_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sdd->src_clk),
-- 
2.56.0


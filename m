Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE5448D01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772340; cv=none; b=EtC2hD1Vo4eOZxRM7qUJGqHtC+6C3PQwroOdKB8aMaAIZ1qmZ/wsKHTVCkhqOLBmFjie2mQAD042EUV6dv6H8uYFmtrGiYVsxhG1ajohuYI+kMkX9q0llZJWpq2H/gB/pdzh/nEdwpLQTa7XTDmlibfpTUM7nES6JkeSLlustsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772340; c=relaxed/simple;
	bh=b9MDW48glDUZmeGUrBdJSpSkTxUVH32mO+7MhRF2Aw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFnQx6LdjMIqNFPfweqXguwKeiJjEN8cCGx3UTVOeNgJdCdJNrSkH/LNR79IgiS0hAj+6sEpTgloI3vUdvbCvsmZVfiui1ZynewZYtHmsQ8q6BFjdg/TWAPiMC1Dr/dWqV0q2TGfkltEkcRahehNnOeRW9uk3c42ZSSA0s/KW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfGMQbHN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfGMQbHN"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3374778a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772338; x=1789377138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYuqmLgbF0OITlLbpgtoj67Jrnu3QvKmdHZgYfzFPaw=;
        b=GfGMQbHN7k8KCy/38hGUDA+Yg9XQarxxl7HrkBDsIVt9VzgY4Nx4p5/Q1AMXxLIyHJ
         E3xqwR3zODyWFGnKqSNtd2b/0Q2DPdA4Gi7dwjt01q3ZJkDHY5CJP4/DsrwPo97AtTLy
         mEo23dkAxT+S2Zl37BkZsMvloXxUevsY984ap8QkqUMS6PpD/HOgZU/u4I7qaU0tdLGO
         rsyFT5c1jp8WCR47Oq/atWVWtdAPH/+qGIMLWyoACue17qdMS53JGS82mgGwvLW7JE/v
         0ARtYRKRb30m+DJMGxfzOol1sqUnpgRn/YfQifxUcvyLavFmkYMamNqK8zZ4zhijf5a9
         zQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772338; x=1789377138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYuqmLgbF0OITlLbpgtoj67Jrnu3QvKmdHZgYfzFPaw=;
        b=MgoOtsZhNNomDM40m7S8haHHhCT282ey1EE6RuEOHrRpXx07lheGxZHsRX7CSAtcIb
         phMzvtR/rxzVNJxfUmXRjSyvyBmQs/oz9IWX8Z7+1fPup03ScVs70AAip4dgxS550Ccs
         zNP79zFJSVNMxmJYNL9SB4FtQa/aHZMjN44x1kPcMoKe7JNYWovU/iYutcd7T+qOu4+H
         dbwdtd3SZM9X03NshMNcPMBQ9OAfgDLrbRUcjTgAU4gSLGDdR/VkFLK9NrR9chABySb8
         ffvou80TXspF/bXnrzLUIkNis1BXL69sv3P3/2LdfJiCGq1LcaMD8xpZNgYGP6jT4vG8
         /Xjg==
X-Gm-Message-State: AFuF++nUtHelaUWQCbiUzfEu7pSNHO2HzZOCbtp8bo89SMJGiqpk9S+s
	P68B5hCbb/d6ZkMb3jqqX/3RSbx6jjRsszCUIE5vL5IKq9SRjDBTELS8
X-Gm-Gg: AYBFou3TzV+y0d3QOIPYKI8Qwqv9ns8ENmxOaf6uaTkS3iFaMn5c4pwoGSnH8V0J0+V
	oz8Pe+c5R5IJMJBFEAZP76puPOpfDABXvDgUKY1N9KvFIB1cmaHDyPI38vWqBgnOdesKtsNg9Jp
	afK8WFoxC8GVYB3p5SY5Coxv+qXKHdmPU6z/CZZRRBTX4z8asYIMwhWC4+tvyubN7zdti0g5YuM
	eHojjuMHf8zOKtdNOIpZ8N+pGtGTozld7PqZpRcvF/H/skk+81H+jWA0n8sPRxBdETNkQickWk3
	MYIZ+S0ZWFX173I0GHcxIKkKYf3rMAxISEiNDy/z5TwrJCx87vr7ztB61EFb2YleICTFzPtkrOE
	qVwn9Pk/ccbyAIWqU2k2ptyZTDCnJ4mTcRz7QdzEtGQsYLBoibFVNvF8pMHOC1tpnqfU8YOMtbz
	p2rtlR2a39RzKuI2FMz8Un6qqFKJemZ5Mt5iKjjtCC8xtjlATtSc7vjP7Xg2TbQ+zdmzfmQ2r2G
	1QWJ5pwhtMxDw==
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr33136572a91.10.1788772338002;
        Mon, 07 Sep 2026 02:12:18 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22450316eec.11.2026.09.07.02.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:12:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] power: reset: keystone: fix missing space in error message
Date: Mon,  7 Sep 2026 14:42:12 +0530
Message-ID: <20260907091212.28352-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two string literals are concatenated, so the message prints
"has to contain atleast one entry".

v1 added the missing space but kept the string split across two lines.
Krzysztof Kozlowski pointed out the string should not be wrapped at all,
which also matches coding-style.rst: never break user-visible strings,
because that breaks the ability to grep for them.  Join it into one
line instead; the result exceeds 80 columns, which is expected for a
user-visible string.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/power/reset/keystone-reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/power/reset/keystone-reset.c b/drivers/power/reset/keystone-reset.c
index 3c44cd6cee0a..491ba490b8ea 100644
--- a/drivers/power/reset/keystone-reset.c
+++ b/drivers/power/reset/keystone-reset.c
@@ -112,8 +112,7 @@ static int rsctrl_probe(struct platform_device *pdev)
 	for (i = 0; i < WDT_MUX_NUMBER; i++) {
 		ret = of_property_read_u32_index(np, "ti,wdt-list", i, &val);
 		if (ret == -EOVERFLOW && !i) {
-			dev_err(dev, "ti,wdt-list property has to contain at"
-				"least one entry\n");
+			dev_err(dev, "ti,wdt-list property has to contain at least one entry\n");
 			return -EINVAL;
 		} else if (ret) {
 			break;

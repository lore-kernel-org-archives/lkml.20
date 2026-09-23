Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079E3B6C1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136535; cv=none; b=ARhlp5xsuNkhfhx5nwAfhXrk03/VVHWItjtfvbOEh++9ZZ+JW/o6coXqHCGcPvRQ00+oLo7N9FbhFYwacACz5HZfit2KDDF9JuiJQ5ruxzwlBXzChNYIsZfwEEGBRLf7JEcbCpw7N6pi3ZlG2AOx5mSEVi2xk77nyQwWu7c6JjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136535; c=relaxed/simple;
	bh=ztbtXJT8GDvreC8nZav70VVvbuRpS94hZVXtCzOGUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiaSzZf8848fJO1TlqlBWYbQpOfbM/9HIHQSu/JmZG872Z7kF6ysmNYgFAX2+0GI+WnCJPR4gXp8+nGDEdvP0obBw3gWkDFyoVkFXZsnu06RZVQng21vQ5+7UhPCwMQqjDGRZE2SB/xgRnQ1wLDotu9SIxIilTeQxnTInXBuRrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdYnT3XU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdYnT3XU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe459dso1887245ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136533; x=1790741333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=OdYnT3XUA2VNfnqg8kfrbgJYkbKquz6SlPqPUfRQv4Xl795WWsY8v6/m0FxeSsemBx
         4oQ5VMgQH+Ah9/bX2wgnhA9sMGRsuQt1DcC/eIvN0f/gDe022uMnWQcr9zAe86MSZPvV
         tkhIpk4XRmjv/2V13xXJFZyOfB8TVH6qM1znvGdmYNbJ8oo8ozc5A3t0vYBhILJbBHHA
         TZ8DxPLgozjuHvR63uba+tnAX1sYLjXbJNaBTzYJb1TGKC35XB39H0L6kvapZemSu688
         Y2yceXivquZeIpRHm+PYK7IEnDmqo3gRqkPQN+g6izs6TlWPz01E9mywIFodcDaTt8aQ
         Yx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136533; x=1790741333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=KSM7h9801APNQeyI7gFDAH182ABbqsFvF61jRZ85R6siO2QHPLlTJWEOQF00ypzjIZ
         1IV/9QAcMsK0QWpCPOBtEegihvWN8HDgQXzTZtQt5AIX81KaYp9bG+1XG6jO8QXIthFO
         ZUbb7h+q/mD8BBjzXF6QappDrBPheN8J+jnP6rwjdlCHjYP6sfRiS2fhI8qiZb/aaEzf
         spH250LdI14lAxpxilhBGq3FrIMFlPcPXOkJ2pXjKPt3lwjK2aidDxitk1d75ONGMZTQ
         QB9EhJckDv4/0+pzc3/aZ81pNy2j0vXetGcJKkdwDf6JV48wCfkDl6zkHwjdIsNK+AVi
         aG+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaosgeQutvIl2Hz02sqZE3m9WJImNQ2u478UyKHW879P50SlpVZgjEng3zp+jjzGcaB1KXv4+SPBLHIWI=@vger.kernel.org
X-Gm-Message-State: AFuF++meXwq+R7pZSSIrQcYuuNGwQzWv2lN1/RuwsG4BhGMOkyL7eC8v
	jKVPTstn5uSrbdtitz4kizFCTGTvkBfvUL5u/07OXob2vQQ0YzlgvB+N
X-Gm-Gg: AYBFou3yNf1YB+Vd2jnsRCIz7ApRi4l8KDQgbBULKM3htW7DYcqPPQhYRPwYXS3gOF8
	h8ZdHyU/y9CuIL+zgogH0NimkRE6tnGWjBvMvJ3T/1ukcKF1imTiWidv2t72fWp0uKeDU9OzaKC
	VNqvLbZS5aPyStXyp8ygEgS40LOVTTIr2zfQ0X4+1H1r17PrKDVc98phV6mCwsqg9E8ejglT9NZ
	/BB3XlJ58nsIH9H/2IKiA9Fz30rMdJ0c5DyXuL9YhF7g7E/dlv65QOLuGFYSuP93+Tj0dl5x00P
	+pueHXgeR7EKy/Puzu31kXqI5ytW9dS0cW4nopZPOBcWKpD5mLVRMQxeoFMfC0JsbEA3NBJWeIL
	Sq8dJjea58YglVQmBHRurXHCEIkz7xVN28Df/9djFMZreG9RgEHXlYNNK2nU8YgSefdPN++21PW
	8/3E3ZtCzIQh/fGRwG81B1sUSuKYeBCOKigErarZS6RyMLz981CDpTUsuZb3y5vq2OodRSwDdKC
	HUReg6JoJ6EvIHoQPzDg0jLwlBXK+Bx4SJvSjZ2l31daAxFGVwddTVWpvoLkPvHNAwhOttPDcDx
	Qy00X4SFbEndtdIUz2Mxn+v7
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr12917965ad.22.1790136532444;
        Tue, 22 Sep 2026 21:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c674sm3980515ad.81.2026.09.22.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:08:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] dmaengine: ti: edma: Fix missing pm_runtime cleanup on probe failure
Date: Wed, 23 Sep 2026 11:08:30 +0700
Message-ID: <20260923040831.10936-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923040831.10936-1-phucduc.bui@gmail.com>
References: <20260923040831.10936-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() errors were not checked, so on failure the usage
count leaked and pm_runtime_enable() was never undone, leaving
runtime PM in a half-initialized state after a failed probe.

Switch to pm_runtime_resume_and_get(), which cleans up the usage count
internally on error, and call pm_runtime_disable() to balance the earlier
pm_runtime_enable() on that path.

Fixes: 23f49fd2ea9b ("dmaengine: edma: Remove dynamic TPTC power management feature")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/ti/edma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 8be9e71dab76..5254ce7b8514 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2650,8 +2650,16 @@ static struct platform_driver edma_driver = {
 
 static int edma_tptc_probe(struct platform_device *pdev)
 {
+	int ret;
+
 	pm_runtime_enable(&pdev->dev);
-	return pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver edma_tptc_driver = {
-- 
2.43.0


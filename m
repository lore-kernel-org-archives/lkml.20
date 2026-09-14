Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3D3E0245
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392316; cv=none; b=OnYV1+R3QaffBbFaFXF/KN3EMiqt7fI4cLKRHjMr7upQ7i0G8sgfHFKPJpgRkXt237FSZSkawa01u5v/hDyuHb+d3frMKzsHZKKq9N9GKthCOrQwE0MtoQasb5RQ3b0JBOF97RvEiHfqswuCYlgULkLU3cyPyJgDggO756yIPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392316; c=relaxed/simple;
	bh=ieGOto/Lmqnuw6XZHi4NqzamoYlK1PHnKIFnRsx1XIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NFaowHvlwIno8JbL8s+lNPuUr+zxPYrnXrWsxPeXwOqtI/ebIBNpOt0TAiSXJcosm4te0ped9WEnv66bDhRmB3/rPN0E93dYJb3evN6L2h2fSYHsMTqTEyJbBXu4xUcAHMx41zzsbGjVljOEnZz1hGEKaVJsxM1Qw1yQdj4r+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNkjnJIO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNkjnJIO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2877198a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392314; x=1789997114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=JNkjnJIOv95RnFF7OQqjfRcWVxjkyBQLp1hJfZni/yHbA7/vwIh4dtqjfaQENxE5bD
         nzgDKGB5IxFdZTP9njwZZ2f4d9LArJklDUBu4WbZYsIHrG2qi8M9YWFxVkLYQrIy3EO7
         1E9OUi7aNR7/wyhXcLTtbFtnfMRJk3m3yejrjPbB/pqhAlyrVgXyvYz+lYn32zSjMghM
         pmlmxVo/+jNHcro2MJVHE78NCaeH4zomtWvCCZAAFNjcHcEY/9YHYs8nT5BJVkyP5GpI
         Hesc7WU0vj0Ol2wkWjUMEqFiWCKxBQptbjwORZlqq+e3UsXWnaNUh/Rft5FsSR2VBcuw
         rqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392314; x=1789997114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=l77sg7HGbp7MMisxgyt6yLfHQ+MK5j6zlY1Nj6K0WdslHBawdfig8Yc9iwluajJTGh
         r+MAFGdGeyYSMMqUNU9JWrPy2yxD9zVv4nycOIIiwb6ypQCOoBXmkBoV0+CxZzvFsqbq
         2Ta9P+KHOVTeAGVwBHvXH2KYCDZuqsGRwagDPbUljrFjYjpOJgaELNYh2QxQCqtRn+Z8
         skORgtobkYfo5oe2gEvvJSzrLJD90cRcWkA+eLKfCJG5im7mSN027DeRaNWYlm6jWuHe
         UivuGBPuBFFRFXggiV/e716I+x0pbOYNRdob7Nq1U7fJWP+E+fxrUpYmMwbR83gMK028
         KT/A==
X-Forwarded-Encrypted: i=1; AKwUvByG+5qC85cJQumvcqa6J3CU8z5QnaWeIMPuj8+oa6Fyw3cMq3cE9AIgZoqcjjcDtWc93vq0bZPT7QUNiA8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOZP7kk+hrMrT57xysRfboZI+qGD2hlQCUufBhCg/cHkn2h9eN
	vrZ/Ay9izEPN8STh6oJFCpBVOT42iyzOn0Sf9P/x8gYG2kIQ1vW5y/Xs
X-Gm-Gg: AYBFou3+KGmGYq9AKz7ULHjbyngwC/EnkdujWj2BmKEl2Gv10C7Gfy64dse4nBPpPk0
	Oun21h/4eN0uqOk+zwCJJrFzq4rvuMGY3n15DbAni8x8oXScXdZBnl1AY3T7glY2NzYywLcvdKr
	AeteHJo4eQAE5FRwD4Is0fb/faRj64p3bEBtUD0/5mLDa/QL//dN9RuoxJ6g2bHb6UrSxRRm/X+
	n3QBEu1oueiSeuvKEgFs9V8SO39BHEaqxna4l2ZqSsCLM6rrh9BYo0Ke2cr8yjKCL5GjKHUMeON
	bpTO4KwMtgnzc+kM20aNgwxXLSzLZc0xrJFoloA4Fh62XaOyZ0keiWXlmhdzVElC2/kU0L+ey3O
	8/zyUqbDwcI1xWXzkzn6TTc+KVI0bUavgMn33+xjBW1Maoh+tq40uKNnzcIG+4/qQgO3ZU2UI5W
	VFcBqYufQgtnqY29+syUko0Iq/8Bj3y+8qqvVYrPAh4rkZQNbKLMgpqh0T8UL6ADjAokw7WnqhF
	3HEbVAcELHqHtNJ
X-Received: by 2002:a17:90b:3b42:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39debfa6792mr5368605a91.9.1789392312963;
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm20872894a91.11.2026.09.14.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix clk enable-count underflow warning in remove()
Date: Mon, 14 Sep 2026 20:25:05 +0700
Message-Id: <20260914132505.2356970-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After probe, pdata->clk is left prepared but disabled -- every RTC
callback enables/disables it transiently around register access.
mxc_rtc_remove() calls clk_disable_unprepare(), which disables it
again and hits clk_core_disable()'s "already disabled" WARN().

Use plain clk_unprepare() instead, matching the probe-failure paths
which already do this correctly.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..93dcf18abde2 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,7 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(pdata->clk);
+	clk_unprepare(pdata->clk);
 }
 
 static const struct of_device_id mxc_ids[] = {
-- 
2.25.1


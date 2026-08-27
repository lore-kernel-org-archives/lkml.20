Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2DC43CE4F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824113; cv=none; b=LKIQe6X8exBYN6lrYPORTxTwN+uZo7deou9q3IQvXEOD90TEYGlOo7hbgzY9n0IPYcumTAKLM3aGei6HJ9EWulYzurViIVoT76wUCTA+nJ4FfNtLm5rPfxtaMXpChpZ3XwoSTqBq5Qo1V6qYm5e0H+r5SH/1K3ol2TsvSPNUtK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824113; c=relaxed/simple;
	bh=NscxapskYlED4TEjPx8+LckNB1aHKhulyJC8EsuSdVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVrMdt8ZLf/F1Nt79ANfRwz9GI+hSHq9OIxgmZ/5yXt+wtE0eC7OdGe52/aeLSwz3eG6+ic5fzliyIW8BI31Wofj1dgoEMB+zYBfOhfAZEl6KR8cDsAQNg+tztHU0VpZ59XuP8PluxB+sqZr/FGFM8YAwX8r102R8Qg9gqgb2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d313798bf8so9076235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824109; x=1788428909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Liq/EJtD6N0Gi+c1SrxKgExt6xAXf4g/P6QiYJZH9PQ=;
        b=LTPwFjRIjPKze5gTGt6W3jO982/ptlx1wUKS+NmLOsn+U8tI67E+qLYZYlpskNCkMN
         6awikT2zuFTYaUjiC1L+PYNr9sSQi33LD1pRpuQkE1dCzz06Y+X5AIsVlGDu2IcWRdd0
         cDdrkSS4XR85DrFlnYZj0HcW5id9gOTUyUXnj5pYF+tolw9nowjHSN4mJquNWSPiFROz
         N3BU2tsgbAS+bHOXQn7vq7GxlDmyhQ1peMsqMAhNj98KpnGJ2eWaqLjwWxSSe0tAxMJF
         CJrlMGbd6s2miKQTamMyQ1bgxeU8rewwPEXoruuzheE0ZMCSAP3i/3TUABHXTyOpn7mF
         1xhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1NaLUDjatxsqBZIpX4+Sg6i4rY00CLwyWujMb/73BlCkoxj0rzwBzbaaYnX9w1ozAgfpwQGpI2xu+xvE=@vger.kernel.org
X-Gm-Message-State: AFuF++kocVBB5/RAFMp35fz4ZhztWTqMzoU7rG7NFmAIn4nWqFuJ/7Ab
	XN9C/36dBThzlFy6AkHK6MjpWttufPY8TQMaIGNUZpS2+cOXEsYfcXXF
X-Gm-Gg: AR+sD10mpzP6E6xkJTSnlQ79Ko2s930UQFMS/tbvV8XX6kYQ9kccRgQf2lMx6nwko1a
	hoGBbsKOCvdT9oCFAa4YhfBq5Oc9gwMgMlzP4dlLWgHf9Im0aK7Onc/+MRV5fw5kDWCZJDSX4AS
	ey6JRZerFht7dNKjGfX9VbmPdZaZ5OQQCTelAeFxSiDk0xL8jGLDiUOfnlUnb1GwYzV4iEvhCDZ
	F9wXUFLKZwkmYybBeC8mFnxQxClaw0pOF+FhhJd7Tv4jEgTnvcanRtGLOEBbVHXmJG5S6z2Ba9I
	i2BLwy+uznLi68TxF2cnbKD8grOGocGkbu+NA62/rEKJJnLggaTUAcoP87mAdkeV+/ub/iOrCQR
	5mEzKaukxWg9U8/nQkhnKU7P0PEC9a4mv+zWTJEI/eK0IJCeOblEZaSLPLxktiuNAA1xmtD0FSk
	y1FXIJ1w7xTbh/NDHAyF5AjXCpWpxBp16/a26uzDp1vGXM1ySX77jYmEEFrsFr5ytkKHXmfsN5B
	jG5Yf4gBQ==
X-Received: by 2002:a17:903:3910:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d707a3ed87mr269236975ad.4.1787824108816;
        Thu, 27 Aug 2026 02:48:28 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704939c2dsm15256895ad.3.2026.08.27.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:48:28 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	christian.loehle@arm.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpuidle: menu: Do not return a disabled idle state
Date: Thu, 27 Aug 2026 17:48:19 +0800
Message-ID: <20260827094820.3900062-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When idle state 0 is disabled and the PM QoS latency constraint is
zero (latency_req == 0), the first branch of the || in the early-return
condition of menu_select() is taken immediately, so state 0 is returned
regardless of its disable flag.

Address this by making the !disable check a prerequisite for the entire
early-return condition, so that when state 0 is disabled the normal
state selection loop is used instead, which already skips disabled
states.

Fixes: 53812cdc9100 ("cpuidle: menu: Move the latency_req == 0 special case check")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpuidle/governors/menu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpuidle/governors/menu.c b/drivers/cpuidle/governors/menu.c
index 544a5d593007..eb529d73d4b7 100644
--- a/drivers/cpuidle/governors/menu.c
+++ b/drivers/cpuidle/governors/menu.c
@@ -284,10 +284,10 @@ static int menu_select(struct cpuidle_driver *drv, struct cpuidle_device *dev,
 		data->bucket = BUCKETS - 1;
 	}
 
-	if (latency_req == 0 ||
-	    ((data->next_timer_ns < drv->states[1].target_residency_ns ||
-	      latency_req < drv->states[1].exit_latency_ns) &&
-	     !dev->states_usage[0].disable)) {
+	if (!dev->states_usage[0].disable &&
+	    (latency_req == 0 ||
+	     data->next_timer_ns < drv->states[1].target_residency_ns ||
+	     latency_req < drv->states[1].exit_latency_ns)) {
 		/*
 		 * In this case state[0] will be used no matter what, so return
 		 * it right away and keep the tick running if state[0] is a
-- 
2.43.0


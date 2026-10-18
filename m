Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D034AA1EB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332976; cv=none; b=Ng7/fsOuGs0purWyJmMWzl85hWmrIceyNAElZdPopKS8rLvIWRRwHKZxWF82STILvH4e6LT62H2iSbgD2DtZLdCtHU7nAJOtT/PQi7V8bMjlnGOrRDoVJwrS/SjVN4bqVOWPGnK8QbIh3Ft13wW507W2aWJ9muMyPoZYCQsMJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332976; c=relaxed/simple;
	bh=+0efL/d5HgWmlvhtS1btQMAIp2DjfmYK7noKBvdE5hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbT8RcKGeqWcqi6BBJ0RN6G5IIPGTG5WOOplWbKt8ji7cSK4GKTJ9WJLyVxH+Q4E+hUb2QTWabagC7UPUrQWH0ywUSFA/HZtzoJhmVRj2elvC9/HMNV1f3b5eCyHR1VXQl7MvX4VAVkgVvDZHpm8YINGTHXi8X8R6ZGy3IPLSx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF7PVCq8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF7PVCq8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so2297245e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332969; x=1792937769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhsdJcCo+/WkuOVJZ+oJc7ZbMY9uosQoFaCm6vyl6e0=;
        b=mF7PVCq8FeU2wyXBVinlmqHKwiCRTQ2uSyT6VdxSW48Rj8D8tLwgQpC+weaw7nHXpf
         s9AxopAWhXWUfBr0a87YJqU/imKsFOZHbzPMJSArqZHKYQ9rW8VjTi5y0H0M5fvbvRHM
         P/Rvw8BymVEQPbUKWnwe8maRo47uwVZDAw2lABckCeho6b7PA9D6GsMMJNZsKH8u7dB4
         MMBFgd/d2QU4GFLNm80UkKfgz9r8FIrHl8vr6VTlDUZ3qs1prES/alyCFNs0j7ZlywhD
         9c7Y5rh6GubvNKpi96m9tMKpJm+n+dnKR6O07NsmSlsqFYAZaY7a26dj86YZ7p+/mEfq
         +5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332969; x=1792937769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhsdJcCo+/WkuOVJZ+oJc7ZbMY9uosQoFaCm6vyl6e0=;
        b=ZQN29X+3F8algXhjcuxbusL978gCIWa6DN+3XaH5VqVMcaYgB9tp+kL2BI02JXBUi6
         Inus+qyQkcq27suzCpD8FA23S0PZ+yWjd+M89S4PXtLjFyBmZR/wemTh5/ENG3u9Tp4J
         Spd2XKtORm2Gl2U7JvTu82J4yLLrIjjONIHrSncSku5c4LEn2DhsFHj6+SYAMxbvm3vF
         mxWJVgfIi1I+fF0LG8BGkBXlzbgdjyn+mTq08Ey9qmZhfKiFGhFAJzk5qXOpDf4aLWH+
         vOcgEFXofx9RPy7jxZ32r93w3RCczlkDv17NYEEbAw9dJNzA9zTJcu8JNfpEkZfDGqeD
         +Kqw==
X-Forwarded-Encrypted: i=1; AKwUvBxHbs/ZjN7OmGmmFPmZQCo/FVW92Kfna1klk7CvZmKzmWcKbIFDE6vbAY1IcX6i8QyI+UwK6+DDKyFERDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFJQd2hmd/YRH0nJhkwX+7rMM7g3nc9g6g4ip+6Yp14KHNbTT5
	GWqgsJuq5VDO8vJCWlhnzlifawvpr7HFaQBP/o6Nz770JnnVMVktLi/m
X-Gm-Gg: AYBFou1IRU3KnxtpwCcoQTvQTSdOMNOMZ++XZNqKK5zjqTY+7MjIF5bwCeuGu7qT+7B
	+ES1fe7866PFiL6KT18LXMJJqGiHddNHo2EqmGZFtsuVOsR8eagDYuF69xRE2LVhPrti78D1qZy
	W28zW4voQmthwFqq70kFTqo1Amkzx37DpEL6F8eF0PcGEta7wxFn/X7e/Y326ysxkhPgciuQ4rd
	6b8Xki8hj0NbF6tiznvUFh/qp7Zcb1l0en630X1mhE9/r3+icPNNeCxGdh55RB6YtcAy/sgu/1e
	hqYBkAWuhxZ+Suig9U+UHSomY9lLb3zwStpOncj/5U0seKUtwWbHL8VOtSZdM3mzMpJBRhDRqdU
	cwcqhwPfavxzZ65rDIVrPivIwW4AjEb6y4OlEs3Ovji9xyDJp+rclXrkVdRBtUl35Qrdf1wuLG+
	1dX1iU4vcn/31MwyoUwYwHAW/mu/EA3lXnwfgzUuvP6x3yhteTaV29O2w2F/BIh+8IFaBWSAmRd
	TcdP9JO4yUMHgm4gXaWD7EsPNk=
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr63893425e9.26.1792332969114;
        Sun, 18 Oct 2026 07:16:09 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm140555935e9.1.2026.10.18.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:16:08 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: outreachy@lists.linux.dev
Cc: Temitope obabi <obabitemitope765@gmail.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Remove redundant zero assignments
Date: Sun, 18 Oct 2026 17:15:18 +0300
Message-ID: <20261018141519.10165-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750_dev structure is allocated with devm_kzalloc() before
sm750fb_setup() is called, so the init_parm fields are already zero.
Remove the four assignments that set them to zero again.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..21744a5a63fb 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -833,10 +833,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->init_parm.chip_clock = 0;
-	sm750_dev->init_parm.mem_clock = 0;
-	sm750_dev->init_parm.master_clock = 0;
-	sm750_dev->init_parm.power_mode = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
-- 
2.53.0


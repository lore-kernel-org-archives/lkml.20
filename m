Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5A3A718C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853951; cv=none; b=FiZgU3okGZoBKVmqZCs+X0WAClLpieeYrWESSuye07MfHfkSiYuVYL3TWImhbfUbwtnwEbN0chFxv9j90dqe5ty4/51gF67d7yP1Rz3LBAQCPn6ZLBuWJRhROSqzAHqVlMagAmu0iCp24BZFrhT9s6TvsmQt79MYwoIdAJI2lIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853951; c=relaxed/simple;
	bh=wGlFJb4g/X7H2EXvZz46M1rJ0kQ9woq9/W/Vy6WBvVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbhMSthJ3M73vsGIDauAwfHwW3vxrbdaqPNOlqTg90SZvtl68RWcAG+Yjdk3KARoh58QYX5G5JlQMnJ11Ro/+tzxHjS1pBGclgkJVoB3lRGg+GJpcqVNRAAElURTDCNc1FUVjDAU3slkrsdu1sFcCMyGFT3asTn7AiVA6t3ptVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCfde/wu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCfde/wu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso26139255ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788853949; x=1789458749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quKfDvljNzEciB/HVPReMXhtrssQeCaSkFVE5hyLOpY=;
        b=OCfde/wukedCk3MkGO2kirzxihaZ/B+j0ATKK4GwgOz9DSWtgH2vJfBSWJoUi8DWu9
         Cs18eb/zxzTYPZk+aICDkifQCB7dqErWCxul7YlAtVJHIumrbhmziRwOmYzQxG5R8mrz
         xNXX6opcla2pMLvks2an5f5aXeyfXXDy1UsxqQktThH4TEWvcuASRWkaqqdeiUiL+L/Z
         Po0YYwXFJ0U5Oz63ClJcDF2tgrcPfUEYm9VKimfPJoAgI3sBHfs7cyj4cgaATIuY70WZ
         edugnO73sNuPyvVjjAoof2up8Uf/ze8lY6YBU+MEDvAh/Fcu8LGa9DISRY+xF8fyrChn
         oRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853949; x=1789458749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quKfDvljNzEciB/HVPReMXhtrssQeCaSkFVE5hyLOpY=;
        b=f7WxX/5HxhbtI+LDs4kbwSuGXjBpql6VvsLGkp4rweJ5kictH/qdV9fHbmh4Y1WF2z
         jPghxp94jikPVS/aVU1CWF03PCV3lEk2iFvh2u1T4s93IcAU8DwdbL+jTR6sFfwFt0nc
         XyyLcD2g1R85YSUslbmaHSK90ZobOFvMMvAyGAXRJwrw3sOsWWmCMYvkKwUXqe4hihUt
         6eSxyaPG3u8V80uHqmPiTSXBlqmPHGUy+CmYj56a8AfMqlMOnUbeTDaHD3bW7JM7hdQV
         cqGGyrGphC8I8NPycxJxhbZfnKOiurL3fBbDWsrK0imJ3UpMk9tU+tCrqzCXVx/8Ad+B
         VdAw==
X-Forwarded-Encrypted: i=1; AKwUvBxg2bXXVZSJzcdACHUUB2Q72mnXfPzVeIPUMy0Opvh8tB0kDekN909gekvVhsiMHWKqwJ3wEgfiuSFu5Bc=@vger.kernel.org
X-Gm-Message-State: AFuF++n8tXVjDoaiOVwSwZ8EuidElRciyTzW36+WEZxh1fMps+GDC4iP
	j/7gJKhGrR+/O3VFV/BfTx82XZCjgPkVc+ZhdhH6suD6JlepjJnF/iCK
X-Gm-Gg: AYBFou1e7YBvGeuG1RWCGMpl/v1ToaanRRo+4pZ30GbVEEZ+hgOBTf5L7nCEFOGOVtZ
	R9cToqh1dC2UlDZAgrfRJGwvBEy8+yB+42XgbRPOJ3QYV6tZ0l1Q8SqG7Wu8aBRiEutzCBXdswR
	iLjD8lACzOL4tXxQQV4x9+ue//SCIyyjrbMph26po5huPkDfm0SdnGI7+G4Lsfcfqogc4CE7oK6
	JOrth+u8bKXpWFP07aveHGzCxuk6CO4drPzvyfV8MMXDb6M944ACYMqIxjvlOt5ZycVovH8Nqdb
	E1hc40YsuCx3lsjxkNycDDcC1ggI0TQ76eSPHQV0oYC1OK+UzE8uA+4XI+AEvItOxilCJdjePk2
	rxhtYyLsrG7F6pQ3R7J0/aeAlk0NOnm4BldFsKhet0f5gab0UhCM/04QNWkN4t/f0QsmMKrr5fi
	3/N55y+qAYO8M/Wb3FqahSa7FinNhk+Ltr4OUi2NlhXPIKo5c8LrQ8ktQY4fRZinK07U1B/KTtO
	nA3jxcyhRed4IPlNg==
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr41364790a91.16.1788853949242;
        Tue, 08 Sep 2026 00:52:29 -0700 (PDT)
Received: from adminex-ThinkPad-E14-Gen-7.. ([106.51.226.221])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm37752419eec.2.2026.09.08.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:52:28 -0700 (PDT)
From: Mahantesh <mahantesh9789@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahantesh <mahantesh9789@gmail.com>
Subject: [PATCH] wifi: wl18xx: Fix typo in comment
Date: Tue,  8 Sep 2026 13:20:37 +0530
Message-ID: <20260908075037.15797-1-mahantesh9789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of "parameters" in a comment.

Signed-off-by: Mahantesh <mahantesh9789@gmail.com>
---
 drivers/net/wireless/ti/wl18xx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wl18xx/main.c b/drivers/net/wireless/ti/wl18xx/main.c
index d087d9c72f91..efb03f26de5a 100644
--- a/drivers/net/wireless/ti/wl18xx/main.c
+++ b/drivers/net/wireless/ti/wl18xx/main.c
@@ -38,7 +38,7 @@ static char *board_type_param = NULL;
 static bool checksum_param = false;
 static int num_rx_desc_param = -1;
 
-/* phy paramters */
+/* phy parameters */
 static int dc2dc_param = -1;
 static int n_antennas_2_param = -1;
 static int n_antennas_5_param = -1;
-- 
2.43.0


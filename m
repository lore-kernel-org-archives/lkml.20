Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A25481256
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523692; cv=none; b=LpDmbn5zkIhpByAaxpnUWcACJsVNFS80GgVrnztsfdF3J/9amXZGMuW6054nA+GkXx/+xu1ymjTM983ovUj+ccWHarUS56wizBXaQXrv0PAV5ZRBwtOhTy7pDMycV1CZcTYxYz8ZyyKdJ66TM2rDzIQLNT89FP8NjHUmvplb6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523692; c=relaxed/simple;
	bh=H87YHUf3RYa6g9vBuAIezANcUirgOpgK3crrqqzSSks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ba25JLdgYm1jEpFA8A8HLpZBg+3jzdvBWKS+48OrXxA+khkd4qkB91VO3N1caOmhtDyAMGfxcDHwim2bSSUqDQ4/KoGYbjvaLHn258x93fWKD+Y+OZ3nQ7ahLz6ipOBDd7PhcLFbat2Z4KOrt7Amda4eUPit4SGKVH7I6e0L2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVXRPO8a; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVXRPO8a"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca80d708489so696399a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523690; x=1789128490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjQ8Lb409O7UHAcKn0OfXW9LLiRk8/YRrnu0Yh5DBwE=;
        b=XVXRPO8aB9oTfNHpGULfx8SWgIRHsi5tOVBT72uD7ONz9uIXnEjo1kCO85S67tO9EQ
         BgMdoznV6XPtLorjm9BLCY1G4GPItKDERmB4FHwG3lW/HYipvQqouhhrKXMQQyr7ThlX
         NrS6s6wuXF5Q2ecxqvA0K5HJOUKB1qkdM4YAHym9Y9m5diViFFdUBIQ3Bjj3jtTSWBQM
         Iriw7KHYBreD79tDFKkeEjIF+SpJBgXgm3CN1XkNcxPBvB6Vcec2YIbzBtERNksqCyxJ
         NSDCcnfdtm7/Q9aBYEQ/9ivJGzgavZEfnQZN4Yi3zniJygrRfn8ng0/AlsFj9rQ4P0Wu
         G49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523690; x=1789128490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjQ8Lb409O7UHAcKn0OfXW9LLiRk8/YRrnu0Yh5DBwE=;
        b=TpeqWEFEKfR8w7EaNk8eZ8cRPloBBxf9yClAdYT2hMXGu41JWMRSvVpTq6K3tR+Idp
         sr6NGjQy3RYSKPJLUbNwd0DZKpuB7KQ7qH+tCAkvmLJop8S7pUv20CNuDojCxH4hdDmR
         vpSCya5tz76vkn+H4ymR4TibaCeOW1fsvpc7fzS3bDzuZmEctu0Sw+wscAObsUCVZJV5
         OBYSrSuMrC4Ah3FoBTWysYf9hpZpbXA+KWC9m28I+uliVbuBK+F8xRlPuSpFZidmH7NI
         dSUFNL50E8rju6g0bM5J1JNDq8BUryOMbBdPA4yO3a4sMsqHz+1tCIe2Ehn/3eIBNzXt
         UwVw==
X-Gm-Message-State: AFuF++kYWfdp2IZ5jjBQPD3qZgKpPCk5vZvrTLWl9Ohr4Wa4RsvGIjvx
	kg9EvLXdjxq+qnXlkbLhzCmD1XhHwlhQ4Irbv4W+50+S3xnsAvd4P+4l
X-Gm-Gg: AYBFou0PESwGqJnMW6P0SkF2qN2+J8dFruN/7xAOlJ3smT3lMo/ELOCda0vWVLiyKTK
	Ht6LByZWWLaV+ObUVWxo8c/rFHBXhtJZer6mS1owWDMlp45dkAI6mWl0bMUWOeoi4xF+6aduVau
	jJSsCjA6WJVuFMFqd7u9sxqu27ZP+cAdwOZz31DfwvksKTEHo4OzUXESIkDS5oHLqWY8izhMz22
	vk1vArGwhTTqHE6UzmdaumyK4mcsft55nOuFz4iaklsANyqHw4oToqcRWsRUPflfODOX0ctUF4J
	gbUhARJh2wU5251D5zwqJ4CmUKagU/EtW1rCHdQzgfMzLs1qYnx1GXo1d0WuSmi1cHWdj4Eh/MF
	WwEN4Vr8HcX7vYGaafQ3s9ou3KdoT91ijiAC8CQDn7eyPgFEIrogJFgu+bA3vE/Lh5lxV7yC0L0
	J2PKaHcjsW1Y9Ws2xA7RNpHeEWHPm+E8ePcBFXplNNB6GX32rrOyAGGye2uQDYOsZ2yhCkRx/JZ
	EJpVv3uF0ZBvxGv5KlFZJYYjI/8uiXYKqkgvA==
X-Received: by 2002:a17:90b:3bd0:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-39b08960b46mr13747993a91.31.1788523689792;
        Fri, 04 Sep 2026 05:08:09 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5831087eec.28.2026.09.04.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:08:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>
Cc: linux-kernel@vger.kernel.org,
	devel@lists.orangefs.org
Subject: [PATCH 2/2] orangefs: fix repeated word in log message
Date: Fri,  4 Sep 2026 17:37:58 +0530
Message-ID: <20260904120759.19755-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120759.19755-1-hemanth.selam@gmail.com>
References: <20260904120759.19755-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/orangefs/orangefs-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 9f94919a6bc6..d48cd251d1f2 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -940,7 +940,7 @@ int orangefs_debugfs_new_client_mask(void __user *arg)
 	client_debug_mask.mask1 = mask2_info.mask1_value;
 	client_debug_mask.mask2 = mask2_info.mask2_value;
 
-	pr_info("%s: client debug mask has been been received "
+	pr_info("%s: client debug mask has been received "
 		":%llx: :%llx:\n",
 		__func__,
 		(unsigned long long)client_debug_mask.mask1,
-- 
2.48.1


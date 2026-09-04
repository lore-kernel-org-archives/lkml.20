Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9933BF679
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518531; cv=none; b=HBPTngp1guba+MTB9gYJ8pkjWR3CStXFpmGONGNJ+vDkSyj92pZh7hWhzUMFLVXZXeOGEDZ5XgxZSYBo9DG15hfhzgnubJ9Q9Asfi47acsridr9QjjGgjFGX7AGiisUGRxMaSD8XArUdzdamF2Ni5lG3pPfMv0IFDyiRUCl7Hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518531; c=relaxed/simple;
	bh=Rt4wPYHaXj12lxhPfPZKif/o+A0GOC+v3ilWBQKVVJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJ52xdAfh+isYYTn1CNdqxAqhMX9REJfvPpoKMBtsUVQMaauHLwDCA/obS6yv2r2TPD55WyilaDYkQD5XQb+KUHZYHiFGE3upsVrw4buDSPqbaLr640YCS7CBZntsRCGuNAzb3SjWjpULAniYBXRz4RGJgrqi/PUP2wQJwV1P8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWL7fxOW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWL7fxOW"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so603583b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518528; x=1789123328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fRB5x3mruocrsGhKdMFkiHzud4T/cpAEHWEqQd9LX9M=;
        b=LWL7fxOWSr55yKrtnkQs0n6mOg5ZE89Krth0tWp50yNjgpMW6E9tBb4UhtfvIj6iBg
         ovsmYET+x8Lv9pTC4j1mh3McGwO4CWrF1b4f2/zcvW3bsMrWxdAI929uaduelV2CTaur
         TjW/H75J+KtK4ZIGpSvHIvjDKnFTKnwOIXYDeGO042UjLwygrwkS44vhdErYhTszhhOV
         TAL1HtRnJbenShazhBSjjekx8blE/e8iQq1ntK/Vg9MqD241UPT2BEgo5qDpwffrpL5x
         r8En/IQEvpgrowKk1TeioaMJ3onpA3VMCnwOo0Pa1q554u1NgTMMniu1dulQsYgT49iy
         v9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518528; x=1789123328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRB5x3mruocrsGhKdMFkiHzud4T/cpAEHWEqQd9LX9M=;
        b=HTmLX9tFBi9cPlqoqA9/5+3z8BL6CnYNEu6+s/Hn+aICKPoHaT4kW9QeHl5X+Nw15u
         sunnkRGx/RnpbtyyiYzfCDrJEQlDMcT19S0r8bzsnfMwIKLc2lIcS+3k06VwGuJU+a2l
         w+3EHnBjCZeYpBIvPTwPm2n1eE38I9WdiDCfmfi9dg3Bm4cyjazgAzHvbnFG5/mxOIym
         X8POEjNGMF3/UveO8uvrC3NAP8ugciv8sjzec02htjIIC3fW3kxO5No3PSijbx4q244M
         ff95J8ZSQXBE55fzJgHapZJLnxtpU7muXBSmBVonRsoEi8NkxRs46La3qI6I9V9dhgU5
         qT+g==
X-Gm-Message-State: AFuF++lf5V/Ibb8IMgLlVueX4zUfZIkXLzfcISuA5LCIUnn9nc2/gUjM
	2mHEbWQ3DF7cJqDZX7AGUbHbxiF1q6RgA2svLfsDmnN6Y1tspzdfHnpV
X-Gm-Gg: AYBFou2D7D8rr6vdD5aReKOUxDvCvzOMd9zBAA+S7MOGR5aVZQ6Ys8M6kxYR5G/8WFR
	nCguHdDnEA0lGirT+PK1wTJXobqnDhN3CSvIrylHFaUFKpiGRLEDfmRCQvMSCce9J9lkLQc/Ulm
	fZlnFWKBwUPqw89tzAxrDTrgmNWJOLHobnmVnMukpamtu4Vr3Ujw/e0zFCZhzVgfZ751tVX6gVM
	1VxODMEksrRYBnL6btwtg5uKdZ/wD3fvVo2mrpBBwE7IIsRNmNcw4wXnJp6FEGpg4TULg02b0vR
	+6yHfwobHP+qyBt7kqBG7S33siuEGCBMxhUZx7yF4oq7HOWb7ruU1BpphQY8bbRONwxYgvwbMOB
	vtLujNZiT6UoWYqdmvajFKfSFm31IRByu1xhbzwXf8vAOU/2WVCFoy/3a82Tx7I4Q80+laKk3XQ
	rxBJFdVWd6aTqtpw/NuqHzRq4hG+4DnXdCiAPtq8Rjz96TvLJG/EJH8n6B/sgL1mXZlIHP33Pg5
	VvNjGQNOOaJiqAus+teCZ11rQ==
X-Received: by 2002:a05:6a20:4321:b0:3d3:b02a:61a5 with SMTP id adf61e73a8af0-3da3a217599mr7290013637.28.1788518528223;
        Fri, 04 Sep 2026 03:42:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm6628278eec.1.2026.09.04.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:42:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c-atr: fix typo "accomodate" in comment
Date: Fri,  4 Sep 2026 16:12:02 +0530
Message-ID: <20260904104203.14539-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "accomodate" to "accommodate", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/i2c-atr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index b52a7b9ec536..3f4d5dca5394 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -24,7 +24,7 @@ struct i2c_atr;
  * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static mapping.
  *                    Mappings will only be added or removed as a result of
  *                    devices being added or removed from a child bus.
- *                    The ATR pool will have to be big enough to accomodate all
+ *                    The ATR pool will have to be big enough to accommodate all
  *                    devices expected to be added to the child buses.
  * @I2C_ATR_F_PASSTHROUGH: Allow unmapped incoming addresses to pass through
  */
-- 
2.48.1


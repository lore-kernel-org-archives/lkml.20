Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A2B371887
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208095; cv=none; b=aOIAAFawzFq5nVWuXgX67Dbx1TbUJFwsIqvfhe/FNEy7rK7Yityb1CHpTagDfEV+yEBzm21bd/y5zvVMnbmCoUzTF+Xly3jbxD9nQHeNDn8iL7kp8UesKyf3KiyrtFvg9yUYXqdTaSgaMPn6c2mr9yaYfBqM1dQVGOzrFT5jc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208095; c=relaxed/simple;
	bh=DlBzjocqn98MoPsYKMR/vU3lf6rR54F71062uPaDjqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eisNWExU+JqPCmQbmCNNZC4Ctpykl6tD5OVTfzeyf8/ekr+KMWdbI0bvCMVn70TQUKN8akBk8/C/h5ZGtFAuAV66/5aq3inlD3QoKqpWMmSOQGAa0EQj4RQecS8xYfRDvxVr3PDMOSvbcGKH/T/S3vUtALs+lC+SyUh5Hv49BNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noj5X8Hx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noj5X8Hx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso481090f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789208092; x=1789812892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5x40OxYDvxFMzPZcVcWtoNFOUFKVGLR5yHPdEAqjHg=;
        b=noj5X8HxI3lcC0jkvWrfMRiHVLoHA9y2tw2x20NsRbHkCOmLqU7wXpqilYvwxC1UpW
         B2HghjbUfrhWkUWclkbvNABO/mavj+3JjQlSB9zxzKoIyjW3Mz74R6Lx/AsZ5SM+TzG9
         nHxaU1qAfgBK67XwpRr7ldzuhw1j2tlnI9K5rRmuW0ICzta+x1+8TGlhNi9MQOXzKU9F
         7gEYJNoIeBEq42Lsq24PHB4lWAoCOxgm2UWtUt2rK684zGR/ZZI0OOPTBKeGogg4hSf+
         WoRYNYwFBd04ar3rmAY8taJE0+chvG7UQAdnMQ0+JlCHHzcnXYIpnzfjyhBL84ATj/Ue
         G2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208092; x=1789812892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5x40OxYDvxFMzPZcVcWtoNFOUFKVGLR5yHPdEAqjHg=;
        b=FCM9zEnbDOj1D8t3n5Ju8zBedpUz/C9r39apRVmZsJ+RkqrogXJTgC1qZKHxWXdufT
         JeCZMp+QhkahMQWfmPmZphqPBwNciqGi8UAnsydSImS8+cl076/0nbuGf89e4hCUimJK
         AdGrLbssTS2/L3p0MoD69YXRgmj6t/Ffmxw4d6pDVp2g3eLUj70PmxYKL2EY1j9zdyes
         6+7tfs0vS5YNAvYlmjKK5nSSHc0UKSDnPl2aFORBITIvR1iJbZGVmJwmpW97wVtHLQ4c
         n1l5W9qk27SuDhIfwMoEY8xiiE0IuiuAepk7aM2cAlpv9ZUD3jnHk4hUX4VFRCt3q0JV
         7UvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLosreUFfhUy1VO3Q0jFfh05HuW4JO5QgfpdcqkYSI5Gn01Qfrl3f3f+iCt880rrzMjwFCcoOMDPchkoY=@vger.kernel.org
X-Gm-Message-State: AFuF++n6mtXkp9H0ucNR86qiOhaa/n5FvqQs2MZHZ6gAktb3Bfh5Q+0R
	L8hmkgJz6nhUtc0rsmu1IHB/6phDSkT+bRHfRYgrJ84fnGy9CI2dEbhV
X-Gm-Gg: AYBFou0h3fK5pv/+fiv5QuKp0xQQymhVgcX70C1ZeNz5YJ2jnvm0Vz+5n1wwKv7ppZZ
	IakOwoksXWQekT91YemPBWgZAicxsgmpgptdfYcJKHM++UC2CBYSrAtfxeItr7tAlBZLarngfYX
	4nx5hyxHupoSXn/kfAeu4f0vEU/jHkI+CibSW0QDKqsJ/nd8E2VazipXOJW0ucnnVSSWuFDiOG7
	ecHRmdsHuS5bQTfSJDBNOnPTAy7uH0pokMqr76PzrVqr6w6EeqLXO7Wdouo5IYw53HaK54vGz8u
	MIejE5WUFxH9wN2gCtgTFQ/YLin0ZVvO7r6RQAIFkVnc1UuFJe0+X+wh8ybszlnjbTcA15uEUJ/
	XVEnAbyKQ4lqHOa2alXWEkPZyHNBnMHmlxOmE+VW4GMKe5VQ5KUrmGm0MrLiYtkGXk9HkFUZb/z
	nbEB3unQkMDb25o0EjFulCtFRl6Q1+5ICKLXu2gclEElYJ2vfgkjQhuoIjLrCcTIN/252tLOYsk
	zgRo+i690dH96864borGrGfGY3iUlIvo6j/6iGdnUyggNZ8WS2j6svbEg8vxfQAoRpeJNx8FOxa
	nDBfOO5xPxFFNca+3Yl07O0tC35vDQBZ2A2cnDoO4rXw76DPW1ogewgbMvPvyV4i8bZrNxm9oY2
	vMw==
X-Received: by 2002:adf:e310:0:b0:484:3310:c4fe with SMTP id ffacd0b85a97d-486eb3522afmr14079509f8f.25.1789208091656;
        Sat, 12 Sep 2026 03:14:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm12085997f8f.20.2026.09.12.03.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:14:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: Fix i2c_dev_get_master_data() reference in kernel-doc
Date: Sat, 12 Sep 2026 12:14:46 +0200
Message-Id: <20260912101446.86506-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c_dev_set_master_data() comment names the corresponding getter as
i2c_device_get_master_data(). The getter is i2c_dev_get_master_data().
Correct the reference.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/i3c/master.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f7ceec2b447738a6612b974de1696d45b261d1ad..b8222bddd46e36cb23787685a3eaa9832d00645a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -709,7 +709,7 @@ static inline void *i2c_dev_get_master_data(const struct i2c_dev_desc *dev)
  * @data: private data
  *
  * This functions allows a master controller to attach per-device private data
- * which can then be retrieved with i2c_device_get_master_data().
+ * which can then be retrieved with i2c_dev_get_master_data().
  */
 static inline void i2c_dev_set_master_data(struct i2c_dev_desc *dev,
 					   void *data)
-- 
2.39.5 (Apple Git-154)


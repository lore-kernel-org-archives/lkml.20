Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3534FECD7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651806; cv=none; b=OkJMRsJRETh3t0MCA86tOPlACAG0LAPEhUyHTaYOhVrvZhBeg+adbOpGKY/OeRkFxyPONDdZZDqKZJZhWpKvan+EHEYwZZ+bBvLgMVM9NQkGKrW9ncMDiNCuwIuletMvSlLm1gaucQCA9zV5DSmm93hlhOPYK4K1W+WKZQcMGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651806; c=relaxed/simple;
	bh=m2UU0/l7oXH4nDDm4aNiVdsK/0ORRSvCe00W37MZM54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvhxbpMbYekUUbqmtcDNizEfhxBPYDIIo+j+4F7ISAdOGWmxlEmTfpv9H4Qhy7rnQBClH8rVGpX2FltdClHfm4x4DpO1ZRhEzBb8oc1l/IcMqnbnhzAI/U3gI6XoRf2Z/kGj0Iq6AV0uYlYvVQGkhMMnqyFetoNWhEMsahHU6OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=EkGNaUPH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="EkGNaUPH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so4613995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789651798; x=1790256598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYqy4JvgQiRzCuvqvHp97HhL8V2ft2LLYeHwmXteui8=;
        b=EkGNaUPHk0gCOURnQPHeX9tSlGgDfIPzVjd/lnLCeRErwDbYKU4BQDoajk1jwvDy+j
         NBa0QpS7P47So6cifHV8RRnY4WadJVeszl2Nsf/8i3nDeQaYjMKCeYOKSx/hxBSomZEw
         rnXazoXlGfmpepFfToUV0s6lnvTCkFMMCgS0Sbq6F9WumcWYWyg2Ub8WXsFqfXytRoQi
         L3cvrslXCgqzO0zKviYkehDLwSeO/HZoMBgY3yFjoykyymVLXNJDb9/E4EBlJximhl5g
         sxZyax/5Kt5VChk4VBXhKrYXBnpzeSVI7OxWa+FFL8VhNit1cwxjtoO4pKQXtIZjNL5C
         X1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651798; x=1790256598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYqy4JvgQiRzCuvqvHp97HhL8V2ft2LLYeHwmXteui8=;
        b=yiaFdP4uX8lSxIFgV/cY7O8wJNMtKO3HU3vCLSLZF2wtgnxEtHeTqixNwxwoGKhTNp
         vmqs8JCs9TUBDCQ6jdKC2q3Y0nTwoqH72r636G7krB4EGYFuOw9X+g6f0JWqNg5fPLaj
         o9XuSyJDV/0lgJ/mz9LJRJNnwgNDCk+YPuO2tQN9LQ94N/8ukMsvDMpssoj9vE31ycMl
         fa2oZj7ZLuZHbdEy6BwzMe9BUKMr47iFMQk0TrNEvIqDK4pQoBvxO3XqNmzEIRvjuOxR
         GgFpmAEnuRJjEPIfwbH6VlhBlLKv+/5dqvVg6W9Q+mzWb7I9S9KaoMKMEMpEgDmI2t86
         +Ibw==
X-Forwarded-Encrypted: i=1; AKwUvBxU5OeMs9/W9oUrYyXig6gl2a6O+LkLj3bVjvkK8ZHo+dj3qxrMs5ffslE2KWdbjpzfpbNE3nraYWtfLJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nc9WuJNhGHvOA71bxDoILcYpFX7XJe0wW2ngyE6NcJ8EnLIQcQ
	dzmV1Lb6iuZT7l28SkadI1S4m6i97Z/2tUvwh4wiYQnZg3E4PsUYayOFywSsAAxRcQ==
X-Gm-Gg: AYBFou15U+tx9cmznhZgEi1dePRp7+h2jlOYSyrSZ0rOqFyEFrjQZOmFIpPHeg4EJmN
	1ykQSHWOFEiqT3Z/EQeuuzl+OOMy6emCXg/S8eCY1UKbpJha7IdBpsmiAvW+okTC25okahDlVYB
	tQ1dmHOmh/pP028ffSdi34kiKH435u81FzRofB0H8SXwyvfurd40q0EdsdWiebnMDFm4EWV7ocs
	Z1eIryPL/vOicUxiQnbHkjl5PrmeuA6izQzq5YlLavAhQqNtZAT2S4myjZ09/Prq0KXxJtY9xuG
	h7CVevmJh9aDcTgE0LvcaIK19GxmdrI8M5R5UcjG3pa0KZpNo0kkXfv/YwTbqbvrhqmrBdXrjPG
	evdyyy+AzGcWMHU9CUicPqea+t2TMuTBbEV0loMR5PFlONGAc+44qwYPYILM5QBGaXdZ/kxiBRd
	OVA9ddk3dxR+Dma68wMGN2PcmhrqpezY+DirQZdKkDz21bWVhuothX+VTCGnvMR4zN4uKBpOb1x
	23tVrQcKoMdspeUx0ipHI7WcsY=
X-Received: by 2002:a05:600d:644f:20b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-49fc199e215mr12253705e9.28.1789651798061;
        Thu, 17 Sep 2026 06:29:58 -0700 (PDT)
Received: from fighter ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm97548275e9.6.2026.09.17.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:29:57 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Evan Green <evgreen@chromium.org>,
	Sean Rhodes <sean@starlabs.systems>,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Xueqin Luo <luoxueqin@kylinos.cn>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
Subject: [PATCH v3 RESEND 3/4] PM: hibernate: permit encrypted snapshot device under lockdown
Date: Thu, 17 Sep 2026 14:29:49 +0100
Message-ID: <f237b56e8444ea7b477dbcf4aa6dafd2ff0c1dc7.1789651778.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789651778.git.sean@starlabs.systems>
References: <cover.1789651778.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdown disables hibernation because restoring attacker-controlled image
data can modify kernel memory. Permit opening the userspace snapshot
device under lockdown when encrypted hibernation support is built, but
require encryption to be enabled before image data can be read or written
and before restore or power-off ioctls can proceed.

Tested on StarFighter MTL with lockdown enabled: encrypted uswsusp
hibernate and restore used the snapshot device path.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 kernel/power/hibernate.c | 8 ++++++++
 kernel/power/power.h     | 1 +
 kernel/power/user.c      | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index a95cb447a13a..0b8626bdf81a 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -114,6 +114,14 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+bool hibernation_snapshot_dev_available(void)
+{
+	return nohibernate == 0 &&
+		(!security_locked_down(LOCKDOWN_HIBERNATION) ||
+		 IS_ENABLED(CONFIG_ENCRYPTED_HIBERNATION)) &&
+		!secretmem_active() && !cxl_mem_active();
+}
+
 /**
  * hibernation_set_ops - Set the global hibernate operations.
  * @ops: Hibernation operations to use in subsequent hibernation transitions.
diff --git a/kernel/power/power.h b/kernel/power/power.h
index 815c84c1e0dd..351b5f68bde3 100644
--- a/kernel/power/power.h
+++ b/kernel/power/power.h
@@ -168,6 +168,7 @@ extern int snapshot_image_loaded(struct snapshot_handle *handle);
 
 extern bool hibernate_acquire(void);
 extern void hibernate_release(void);
+bool hibernation_snapshot_dev_available(void);
 
 extern sector_t alloc_swapdev_block(int swap);
 bool swsusp_swap_range_allocated(int swap, loff_t pos, size_t count);
diff --git a/kernel/power/user.c b/kernel/power/user.c
index de41f590c98d..b8d3342f1548 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -184,7 +184,7 @@ static int snapshot_open(struct inode *inode, struct file *filp)
 	unsigned int sleep_flags;
 	int error;
 
-	if (!hibernation_available())
+	if (!hibernation_snapshot_dev_available())
 		return -EPERM;
 
 	sleep_flags = lock_system_sleep();

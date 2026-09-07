Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7931F996
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746712; cv=none; b=rAQEGcbKSBXbgrcB1bN7juV+9Revey63kYw2tuXKrG0+1+08w92IzcvEHZGEu5NE6ldoycXHpMlkf03HQvWMvJDwQZQZymXUtsytyPu7tvmQuxOzGtODBl6L/ZE93yXoeap42Ooao3tPXX118f8bBzhCWe0M0WWE+qxN5OjBwRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746712; c=relaxed/simple;
	bh=/3drJTkAoSyT9HMCopKOWwzCA4DDLk9nvpn/kWsBuo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EZxXwWIbGtJJW+mDTvK9PqQ2QET1NZD2jkuzNi7grjtgtwyj0g3yHgzoZIwGs9Yn8SBumRI0za2AqEuiOA33VaCI4d3XQTLx+AcuiyUhs30ZnHRSGifdl/V8OrMfoPvyJn7pmAgo3aeI786/Z4cLe5YhZCUV4N6Xqb7WodTzBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIOY0oST; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIOY0oST"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so22949535e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746708; x=1789351508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vLyGYK1rjMxKKIttwl0OglpXzNnjGoM3s6w9NqjDkM0=;
        b=pIOY0oSTJAOCwRFpMUWIE2fTuzioDnfELySWj5olnNd/lOSEaJiUZHWWviW8RNJIi1
         b2EA79AquwQT0J6s2v+5JFyUNGFi2k1nLa7260rb6yCnFyoJsDyMEpvyD8ScF6SXuJ7U
         V+7xYBzDB9ANqaJ14RiTLT3AWiS94vQpDP0vXAgqf7uk0AXzGj97xbijr9lMY3sP72hm
         EiOfOP976ofU0uG8WV3UovPUlWpoc9mf/3mpJMEZffjDOmcYV+WzQcwqn8uunRlgqTbB
         e8xveXw3DUQNtMuHf86RVe5m+bLW7okpi2wG3DsL8wLXFzhUVm9YGDCY726b/tdYU6BC
         IXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746708; x=1789351508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLyGYK1rjMxKKIttwl0OglpXzNnjGoM3s6w9NqjDkM0=;
        b=B31372NAOZff1loFvInA8uZUtHupA4vUShUxik5NXMaah+nnFE6/jGlR8BRPkC8v8S
         DlOjgMIUMojlfSEaIVaRHrrc95KmdthHY2CIrziDwmd5eTUgZG/4zD9eH4jsfHhyAHjL
         a5gJi9i0OGp3yZDbHdcuWHlVuAyiJKde5QLxSRHJM+0qPcmRSZybkTm1uuyi0q3VDCEs
         EeF3iOL/irlXa83nvPWc4Bb9k/ja/SbBKdv+s7AWMPzVP6yL6TBg+n66zfpuXziO6G0f
         04+OqRs5obTgURAYW2gajR8460jd6KmJKAyCAIuhpQjopriohFZGWrB5JXh4WkRvre8D
         bKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfZCKj5NzaHAH8wP+naHkq0kPvWjZ/N42/swgOVTx4MjKR3imVWz//+eTCzWsnwN4ChI+QauzfvDIMbVo=@vger.kernel.org
X-Gm-Message-State: AFuF++lhSMUpUIJW08kABYKcOwzWMYA37RpkE+AxuOYr3rLY/UyAv39a
	6jKXAq0mDFlvbIQUriEPlOm9bp5TuZjiRpEG+7WVL83GeSo07P8XIVDa
X-Gm-Gg: AYBFou0sW/J8KNGgq2X981FnRoXl4gszA+9xvLCO6WfrLQFJAmmuGfPXUsQTcS6ZrfF
	EkT//hy5Z9TUhMMSw0+piFotmKymx2tGpXmvy/K5Q2Q4cplMuByQoD9FyM7otqkrrrqb7Rlh8mC
	Utmhv+VlwQ3BNt0D0ckp08r1bJjPOOuE7iM4GBhazLlXQUugm9EMFsV5DocBh+anf4RzTbL1eip
	9P64lV8T2NErFbTxvMUUNjra0pFnDK6ddnT1KSCrnTmIkTGI7lw7dAk9M4pOMBDPBz06KFWPdCs
	9bP42BaXuuD5uny9tvmoEXsd90BvDV8kYuuEeXyzvcALMoWYuXbNENahb0WUTEKgqOtWh3r2Cb1
	lLqGZ0W+DIgsqZZagJ7jxhZsZWqCLBRQe+QcRUb5BPg/xsVwYUYdKdeP9cvKWbHtZfd/VVWV8Zy
	8xtmdOg/+ow9MmxvVMQlZ4jR+bnau3f3iQxKvJ80TOR1Hw/5/sEp4MD6GdY3DM6qmMGgzaEmSk2
	CrEOe116xD5I8goAyL6dBTTJY4mBZ6PFUVX3zClZoRrft1TwmJuNwQERhmGPfFURG0J5WHjdNdr
	utloYBRKG5gpC7ZkZEabvZM1bordgL1TiI1bpkjFyLiZX2fsHoRrcdqf+2TRoQ4uSTioITKvBYa
	7XLbuGDlOT64=
X-Received: by 2002:a05:600d:4449:20b0:49d:3a:e576 with SMTP id 5b1f17b1804b1-49d003ae639mr93352765e9.5.1788746707963;
        Sun, 06 Sep 2026 19:05:07 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-9daa-d59e-970b-f46c.310.pool.telefonica.de. [2a02:3100:b0c9:3601:9daa:d59e:970b:f46c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm152337165e9.5.2026.09.06.19.05.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 19:05:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] interconnect: Add kernel-doc for devm_of_icc_get(), icc_enable() and icc_disable()
Date: Mon,  7 Sep 2026 04:05:04 +0200
Message-Id: <20260907020504.24783-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/driver-api/interconnect.rst lists devm_of_icc_get(),
icc_enable() and icc_disable() in its kernel-doc directive for
drivers/interconnect/core.c, but none of the three functions has a
kernel-doc comment. The directive silently produces nothing for them, so
the consumer API section of the rendered documentation never shows
them.

Add kernel-doc comments in the style of the neighbouring functions.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/interconnect/core.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 4aa991a54101..6f854375201d 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -423,6 +423,17 @@ static void devm_icc_release(struct device *dev, void *res)
 	icc_put(*(struct icc_path **)res);
 }
 
+/**
+ * devm_of_icc_get() - get a path handle from a DT node based on name
+ * @dev: device pointer for the consumer device
+ * @name: interconnect path name
+ *
+ * This function is the resource managed version of of_icc_get(). The path
+ * is released with icc_put() automatically when @dev is unbound.
+ *
+ * Return: icc_path pointer on success or ERR_PTR() on error. NULL is returned
+ * when the API is disabled or the "interconnects" DT property is missing.
+ */
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 {
 	struct icc_path **ptr, *path;
@@ -786,12 +797,32 @@ static int __icc_enable(struct icc_path *path, bool enable)
 			  path->reqs[0].peak_bw);
 }
 
+/**
+ * icc_enable() - enable a path
+ * @path: reference to the path returned by icc_get()
+ *
+ * Mark all requests on the path as enabled and reapply the bandwidth that
+ * was last set with icc_set_bw(). A NULL @path is ignored.
+ *
+ * Return: 0 on success, or an appropriate error code otherwise.
+ */
 int icc_enable(struct icc_path *path)
 {
 	return __icc_enable(path, true);
 }
 EXPORT_SYMBOL_GPL(icc_enable);
 
+/**
+ * icc_disable() - disable a path
+ * @path: reference to the path returned by icc_get()
+ *
+ * Mark all requests on the path as disabled, so that they no longer count
+ * towards the aggregated bandwidth, and reapply the constraints. The
+ * requested bandwidth is kept and restored by icc_enable(). A NULL @path is
+ * ignored.
+ *
+ * Return: 0 on success, or an appropriate error code otherwise.
+ */
 int icc_disable(struct icc_path *path)
 {
 	return __icc_enable(path, false);
-- 
2.53.0


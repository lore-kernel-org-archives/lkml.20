Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527DA524AF6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575851; cv=none; b=cNSmItOURjpKfuLC29k85iEZFzI/uuf80btqqJyX/+MPc0dxIAON4HgV/slOHrFBCBm/3p/ZyNfvCOw7vfePoF8FjrRn1e5fo6lzhsZkkbH+ntevbGR2U9xtMvtnBK6dUxcETbPMByiGIawV5Zea5G8ptHf59txkeBOWkfMI9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575851; c=relaxed/simple;
	bh=jzhzRVq7BASQjDartlB8xIX0fc5cN6M65blwwfuQnJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkTZXyjD/VYfMEdj09+uEPAScKVzMeAd0pFFH5Vtj5x9Q8ThsG8HkXsZC+pyaZJt8/exQBcnFFUXLhsAsPxaa9EDi2bkucJfnpS2if9xdBnkczcBKw4wixjimed/2FVP+2/RTI9I0ZFoYubwlcINOh5rhaM1mOYkLdANyRmTA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brZDQyVC; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brZDQyVC"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so1192386e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575840; x=1790180640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nrA08QHaqyBffA+mNJN9lkq4Lm82slDbnwzoPxRENI=;
        b=brZDQyVCX9HT9BXl3Ey6lIj1blJbSue+wQbAO82Qk+v/lyqjzlnaSh4p/WzND5bZd/
         1Ntu3IMzW7YYptPzYlQY7LMJ5SlH0bP4j1kebbLVRKam4ulBAEV6dhOfw8IT0Xy1hIHr
         jMOTSTvZ02RbKToaSLwL8G4aZzRvVt55sVQA5N4dnLoPxTg7QpwHh4kEieiv6zk3ddod
         kISyCYhRn3PjJ9nNvZrruxtMcDNrjYgma5WFEJbpA51ZcIzN68+0q6ainN9r1LizXppy
         jIFcs1w0mE1PxPRnL8wIe8Lkc738Oq4qtchNhG74mkCYdNIVik6zTUqiHZZOnzkLeM+L
         dGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575840; x=1790180640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nrA08QHaqyBffA+mNJN9lkq4Lm82slDbnwzoPxRENI=;
        b=WNz7c2Sld+M6swWZFnBwB1YAOnaU6IbDcl20PpE7/r7F0EUmCsonozuzaHin50MjtM
         KARBx46ZKez238Kg5namCfg3XdvI1PMlzE/tgbPC0UpDVGXmTp+Kp9VoriMrEpztMQW8
         nWmFR0VDktJ4coIRlrYo0cy1lXvAPhfwqp1Hdji+wqsjYr5Iqrjizg22E5/QypT7AmPR
         XMZi+XAdBG351bFwaJsdCVPStKVh76RUui5mabJk3TOfvH9Gj+ZjUNzrbZNbGNvsxvns
         0yr5cytLKipY6uY4sOivP9pk6nFWqLPdqQ72WcMqxNrxK5lsa1YQTqIH7yfpjioz9dOy
         32zg==
X-Forwarded-Encrypted: i=1; AKwUvBycpI78/yu4Ukk3ExjQuRomk8vuLmFUX0Q/z6UX+pMSy45vbDda/SRn5EBqM1JenDCun4mwirNrifShGSA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDYASxd+PO00r8RotIQ/H/DqACIL/fjfnGBrbGWuMrPRT49xwO
	J6ENG977JR1cisejfPVpQv38R08nN9cbLWnO1Wx3mmfH8hyrjbLzfzVuo34qBIMg2LEs
X-Gm-Gg: AYBFou3/esPy280QP3Ew99XujJK+DiIB3RWiSkKwCukRYWbOYJmsrR7OKlme2eMG8vO
	03JBv4fd9FIjpTf9lE8ZqOvwMcq6OM+q7uoVJY0WDzcluCmOfqSUp/z8RBJp7HMradezT+6Nvjq
	nMPQN6JD4KNIazhhA8GTEVd8UxyM3MMw+awkLaGL03qwU5R9A8hnYEetxbv9UqaaWoA58/10kxc
	9Hk++qYk6m3/nebHwoBk/U6ouHyZMtOugjlZHO99ecfGeWoZcs56i5UpNSCcQXGdUeoPWgmPYpW
	qvP/L6c8UfZ1SslwsKlAylduRHihBcQ1QhqIlkQ0TW9EKaVQb3L7M2hEgxWTEM6ayhF8B74xO+t
	p23QIND4wYaSePBzkrwOexfwqefQ+DUwdQFf+KoIjSLPKr0EUgjF6NfH/SJ6WJXJfNfBZx7F5EF
	o9d9pRVbhBDGj8K+Yb4dskm+sSa9JZxnclSX6uNCaFcC0lxI5ZriQQWf0batDNOeHni5QL4+W6X
	lSrLqx4UBuoHGUjrJVHH4FD
X-Received: by 2002:a05:6512:3b0f:b0:5ad:55f6:1ec3 with SMTP id 2adb3069b0e04-5b8b661a3a5mr1984413e87.5.1789575840449;
        Wed, 16 Sep 2026 09:24:00 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:24:00 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:48 +0500
Subject: [PATCH v7 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-2-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=jzhzRVq7BASQjDartlB8xIX0fc5cN6M65blwwfuQnJM=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKYntMYpWKjAwufiOQpd0/qm3peZ7hV+MAQo
 EEvIft3A62JAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrCmAAKCRAT637qmaOf
 ojrqEACLCAsDQkObxcWyvAmnuMHXBmg+s01Me5+U4xeRh8mdKP7pocghJfxBxWSMUgBPm46ATYX
 k/B+P0bxicJFxL5uyxzyAU0o3CmpB8lovD02is2jHBlifXTKEW7qy9oP5nX2ZN/M4oINLHsuhCM
 W9DNJlWAsH6gAALEYilsmBUar5QvwFiE87aBv2UdgDhT1UtKKZ3TxBrKV3DfT3q4TXYOHxFjDmw
 xMUbF68qTzCC6A4XGGF23VzsUv/54HagN5HNcBBLQwf6F+aLKlOlkifcxOyhjY26Q202Wze6xoM
 kHLL/MrhF68MlymJQoA+7Y3hxn0eushaD883rlwSAccdqF2U0s3at0CX0GjGqNp4POWcz4cn8G5
 Dm2KfeElV6OsRT9TCCby0lne2TY4mgrzxFtUbPonxspwLp/cBApmVfkaET1FugUWHTS5FMTOn9h
 Y/0/M/31c3fcz1fLGMwKGpzyhOg9VqtFKAop2CcPfaBIOyZqq3jq8jQhmnUbIHs8SGJ08x4lNGt
 Bbz4IdVL98bxEh/avViaa2xwJhC27fXURmyAIrzZEnSyPPDjfTvF8NTM/hKCUZwMHgQTO7YMyUC
 TXqde8BUK5JUil5ffuPXKGhBZEbGqsA4GtKg7VAYNZkwEooeiPTYnXDdwrfC2q2o3ZLSvRbYIhV
 pqrdpOD28TM0BvA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

S_IRUGO macro is obsoleted and not recommended to use,
therefore replace it with plain octal values.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index b6958e99cf54d3c8eeca1ba38055a9389678f6c3..190de88d146aae9418566adf36a47d11afa90b2a 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -151,9 +151,9 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
+	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
 }

-- 
2.47.3


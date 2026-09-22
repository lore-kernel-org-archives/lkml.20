Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF444A5EA4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105960; cv=none; b=fRk3t2M/6f3LzuGEwWGMAyMdsqws3gMDVA0MG6CdeTbV9xZtwotpbhOmg4g2lL0jAgt2kM3/miSrZt0t83x60nbcDb4cmQA61zHMLZ/qKQi1CjWq3daIJQ2XCnguHe93c+UZcgtobQVFdiFscP4Bm4EN4vlykcYWhCcJHRW8hvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105960; c=relaxed/simple;
	bh=K4wKYbY7lU8zUdU+RI5QB9tTpmwS75+tA5THD4vU4oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrzB/9gO39KhsDRJBBS0E4w88jwUQxiBbCh8SMmjuXUpJdVxzZf7uwWP6SgJPLlBx9Ly491j1Y6dGUsPwH+KSQTmM0CzhJfZ64HOszWA7hC2KnPGiOrPrlNm2gEE+z17EKuwakuHuoXTqx1384Cf4R6lX4XPdFO1G1x4iMXr4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCJ4d+ks; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCJ4d+ks"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so1398655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790105957; x=1790710757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nL0RZ42dVFFkNwcOaBBBW2RIorolWqyGdNFfDoBAeZI=;
        b=SCJ4d+ksMF4vTPq+zMjIotBID7PsPO/J5xwvxjUjeVG0C92sPHyNFFhmD75HRYR7BD
         LN+rz5FZISR4+/5HzCoZPPZ0vpSpm3+xquCeDdWkrsPyHSHh9iVOo2fACtRKOy3+/r71
         rTmgOk7Pss8n+ulQgOYg79VH5oULUc+ywsqHE9fvGpZmgHbsl+PhJS/SPoJYEb2mS6IV
         1AIbWdq0mxIlth41dyV9O4XqI7lIWyp9w7WdZzrO5jHw32GfkAXANkxKRGji6gK18bzw
         U7++CwytXygz2Kfzz2qDmuCvWBLXuUgP97l3ifC71v/NgwPKOLAdCbgr8wnt9gRFDWmo
         U4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105957; x=1790710757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nL0RZ42dVFFkNwcOaBBBW2RIorolWqyGdNFfDoBAeZI=;
        b=UPl26v2UsNjUCszkUPv3N59pd5qeyNn9THbe42LfAzAXXF+o+rMmg0Mh3LmHey/uA7
         7y+W0m0lApkMrJfGnwkEFgMMFoRD30/5vo5tXFmGvXjZ4epcZZIwK0MzLEtRyFkuaPLA
         M9IvKJZXgs6xUBncMoTr2Vx56lc8nI1kux28yHp+5uySQEIPI7rb1Vb/VGAzvX8ucQDq
         nLiJgOEkc0txDMNsJ42Z2thgVdPYz9POgdHwJQ+9ifE6IWbAQvRG0lJMjZGtw5vVJKjj
         DDZlMzxJahBZ65w8Jov4kuM8MW2LNyRr5tS03Vw8w8Nxy+J4jjTGds+vbD6c6ncxyH+R
         C0qw==
X-Forwarded-Encrypted: i=1; AKwUvBze4wtB673kyWFdRBtc/gMmGh5Mjaw5EkjiZt/FoILvod5EgCqtdWB+PFVN4ifaSzHYj1DFHjXSQG8ukWM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMhQOwnYf4weWinm5MP8uuOpdb4nSSae6aydf4ht51G3uGVsKJ
	xREZwpfZl9LpaMcOz7yaZCLzH4HXulrpxaDMaOR4rebguioDWZXJiVo5
X-Gm-Gg: AYBFou0JSR/+4+fn0rDFC0qk+6L2R/+S9tkQ7F5NYaOz0hjY/N7ZLOqgR0ynnZXTIZB
	MPsDoqEbyrjlG50p7R0XyNgFWHo3FXflwow5R2Jjqr2ypTn6CPuAvHzJJu0jK7ITWdv5R2rKFhJ
	XsK9y4Jgg9+ZNyXUr/mQcg4wmPGS4NcnTMWf+3Zeb5qkzezHrLJTZj2GE+kAQHhHxlX6sdtt0Sk
	JvJJxniDqei0YUiBhMEqtwMFUaX5GBhURtHMSQsFck99MtpWWyQLhUjm0ptQmgfH/4yRkA6rIRM
	wQb5MYNCP2js/YpKeYO8f7xhJJoOIT15F8ZNQCMZmXD/rKhPAaW3IURtlxytTvaB1/JN9eybZyS
	T4xQ26eIvHhYRrw5EiK3zuKTVAQn/N7NjRoujWPz6yGhE+6AtI2FQC7ZfZhpYh22gZzmrzDWPAI
	p7jOhhF98RvHJFyN9vzb7HvIJ7WfnK6fibXyCdhNIUN8H8SrTmAD2915nvIclU1biCKYKtg6OIa
	sSPDMhPy1Pb5GBc834qPw==
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr2558085e9.4.1790105957383;
        Tue, 22 Sep 2026 12:39:17 -0700 (PDT)
Received: from localhost.localdomain ([149.7.5.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf157cdfsm2494235e9.0.2026.09.22.12.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:39:17 -0700 (PDT)
From: Vladan Kalaba <vladan.kalaba@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: vladan.kalaba@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix const pointer declaration in sm750.c
Date: Tue, 22 Sep 2026 21:36:53 +0200
Message-ID: <20260922193653.16086-1-vladan.kalaba@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix static const char * declaration for g_fbmode[] to static const
char * const as reported by checkpatch to cohere to Linux kernel
coding standards.

Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1ea3dd8b8f28..79d0221cdeae 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.53.0


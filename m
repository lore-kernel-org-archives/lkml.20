Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30247D935
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367890; cv=none; b=ayN9RW2Zdvw6I3rI2jqPdRNtmjZQzCgfNWjDNKrlTCJLB1ci5/NyItzmS0/2pJJGF339rCCFMAwuT+ccN8HxYiI/6vcXe9De3zGjj8oXNdAZS2732C1m6GejhnWTnNseHyVCfuuQCVmAa0mJNVneaFbqmD/pePwoFse/Z89jnaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367890; c=relaxed/simple;
	bh=4tpoZwvY+uwwBry29ZcBQE0jX740QQCVLmeeTWleFIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZcoYDQ8/362fdQCJEKGvYDOSv96CSieWaW3nA4l2dDYNJg0CE2AoGozLhOQKKpTqC+jv20PWj/Bfy/khtIc4c8E9XuRNGz4hmCBq1YuqS8m0VpbT3MY63CyFfANi0vX6iRDPv8TcBy7zK8wSbvCWCR6BEJ5aD5zpudRN9W1v2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0MpQMsD; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0MpQMsD"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15168a20b47so1041468c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791367879; x=1791972679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Y/2HgrGdfa3RjhvPeUuDU/lbciiQ3poM/eU576l20g=;
        b=q0MpQMsDw/AEOginptPIe9Cwyt3SSgud6X8cA7k0GvoLz5qtKAKX/q/7DLj2EDeM7+
         Mhv/cXhvWZ20zAsesLvLDf+QZdVcgegUFULdfhwKnpFzSvwtEqddMnEZRQIbb7rW6tH/
         mj5Zmja3RUEDiqeiBrAU4mhyxuex04Xj8d7aPNmFyx+YXFd5vp+9UjZEUCae4orDp3pG
         Ta51rnkhp33ulbDpBSjgG+RhbUlZA8Q1lL81dDWTExMThU1Kx8ihx+AxfblWwgXmFHyu
         RnHzbV1wIbMkH7etBBULVjBe2X+tkw0Ams/hTA22PYCtcojS41u2zATHlFGJwtxjjbLZ
         KLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367879; x=1791972679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Y/2HgrGdfa3RjhvPeUuDU/lbciiQ3poM/eU576l20g=;
        b=GOkJA7C6DPkfk3vVYSN2XXgisMbnV5tSdS9oanme1lyEKYBpvPMKnrtkaNpwlf8aAF
         yshGIpp/OuS0BBvnNX1fHOjgtCNHB8oZlEMJWHeI0KYk+jawM9xLeIA3jK2oiy3yNlLk
         FrLnIgfjJ2YIwYIpGbSj5NdB9T3AyCNkG75jJrUNjiWh542rRgZcre63Gd+a5ztK6elM
         xqdtgX419q+SXg0770nEsdzu6LUQUKDE8qDrOKMDvbmrMKKXaQXR6h9DeOlLQ26d5LIG
         B+XnJ8W/aVcXm9QfpiFBiK9OsAvnMbXKb0SkXplDFWO0cmw1uAB+dzPYHz+pd5+mEuEO
         zDrg==
X-Forwarded-Encrypted: i=1; AKwUvBwQxMywMOCpl1WK2B33Y7nmw6vUIGngtJNlovr+ZFZIYHdIyzl950mFm6luNXqj41G2vVDysiMi7YMSqiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kLcZZWLujYPLHxOaHgk3hqRlaaCzhu7z6n5WMVb20idB9dbOO5
	H4FgDJidJJu98rFGqXBlfBGHR1xIOIClYB9OfJ0jaD91FD2IuG65ZCQk
X-Gm-Gg: AYBFou0La7BCzJiSxHgJMoYxicjuMoAzSAmhCwGEFi1okBeAF+4Rp43hALZIAeqPzt9
	amvlguIsSGbZ447jhTMeGFpwALpKdpdFVMAFSCGQGBkRpGJ/fcyL+KLi5WCk5fLRBt2qQ43AFbl
	qQXXKaEvMjT8EHXP50aLWQlvXfXp+RXn+d7iIhgY+JL3mpfdiPf0mXvD2mAWXQTXvCKra4lUQm3
	rfBERKYfhoY5qwA52WRnK7vPnkC53Xw2/sIoPNoU3vPbhyLbY4dd0XvP6llxo/FN35RlNnfy/5O
	BwZFqAkLGWS8dyJ45wOiX1iCV/o7Z5oqKgQ1EChTeJNtM9IH9/8ak9Zdya6mJ69Z+y+SxmzAJB3
	sKUZekE9qipTTvIY3JP1uOjrGAT8V8TEIRuk7gnPfL7YY8+GnLau+zcgNVhohtmjf9rQEcb77RU
	KF85qDlyfFGIi+xXVcFWiA6T5BYc0AAGE/YR38/+u9VCCAb/twip3FRJ9m7KRyXQ==
X-Received: by 2002:a05:701b:2804:b0:144:f096:4dda with SMTP id a92af1059eb24-16208711b35mr1709824c88.43.1791367878644;
        Wed, 07 Oct 2026 03:11:18 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16352800ed6sm2606714c88.9.2026.10.07.03.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:11:18 -0700 (PDT)
From: pdsj2807@gmail.com
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Wed,  7 Oct 2026 15:40:59 +0530
Message-ID: <20261007101109.707077-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Make the g_fbmode array of pointers const since its entries are not
modified.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..a24b21f4936a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.43.0


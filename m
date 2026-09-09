Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEE3B42FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936470; cv=none; b=pLYdze54uh49Y43FbatI5GgsQqhG1gfLt5YQO2DIQTCfcsy30muuT8ECXG3a7VzWhpCDWeTCgznCKwVo9soMVgJMsIYT31xiD+aaetHaUZvbPiD1ABXYFut0DPsNdObx982FZDxdLlI2X3tsUzXif9EbsqY2MJS7U/zP/kEB1Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936470; c=relaxed/simple;
	bh=o8E3Y97/uq7/nE5aPAcgxU0XNcCxSrIZSYmd9j2OSmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XjwKjWSAx15Xwca5a45kCy1iOrPktSr2jXaaaDYWzj8Qd+wuwL161HqpidXBh9QA7V0plcJiAwG9cJKPtdn0XgBb+4R6aHwMmxs1FE29FWR1jQBW3LAly+liIKum4AQS+Hud44kfZzjkpgCaA/4Io2Qi1+WEVCftd9rcy5EvpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFSSmdnH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFSSmdnH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e067e908so4346132f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936462; x=1789541262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOCQAP6K7d2SeDC/l7CuDRVi41UuAMHdzhXPewwMtn8=;
        b=AFSSmdnH0UpLuRXjKo5pt/BrgFkLnAavG+8qLhQEMwimICRqkWiszP/TdB9up1v9Ma
         K0+Y7V1e/CivaW5OJN6FkhBSmD+7a0ojGTHX//KLnLOayU3g0Urkbzpksu8XCOWsDZot
         6BOffL1QqV3562xDjrGGeepc6lqVAb4XkbGzB/M26XFDAlqzi1mWX57hlpEmqwQmPG1j
         hYqjjE3oIQnCn18QrzPol2kqxry7KPg9eddz8mttnb8ihRHqVwbGytMfBu9f0nDVLIEk
         nVC3IhPGbOy3Smdyy6X2sB9nSu231I5PWaa9zKjTpIFdjPuh2t7kcMdKEQc+9FJ5uFug
         yXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936462; x=1789541262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOCQAP6K7d2SeDC/l7CuDRVi41UuAMHdzhXPewwMtn8=;
        b=ir9hPIcOxXSloeSihwhwkvEuxMTRVEqj9eGCMDBsb2mblB5NUe7SCgJI2BiYf3qtWw
         6JSlLi75K25orPgdPyJvKQcDlWXR1w9tSSmJ8qLlZDYGrwlAaBDHnpRag3LeE8jtX5wC
         y+sYmr6017gGsSBVeYTg7puyrjumpOqIcQjJiGlfUOBHiuQU2E8ySaqzQb51h7LYYGyB
         tdQGvIID0N1oO7PS9q59dRsz43rkxN5qutPblQEsv6rmb6KXwKN6S0SFoRAeRj2JMiFT
         go9I+NSV6baTz7MPQxkwoMhzAHFqiPK0z4kKHvr7Lf+fryZJLbWKvPVgclpgwSU4lDaO
         v/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI60Dr71IWws73ElfWb9xLVTNMGmKlBFpKklCl6ZmGHasSim7Sp/XEqNXukzTGY4rag/pVnYS2MhWNOmA=@vger.kernel.org
X-Gm-Message-State: AFuF++mRdqYEm6K0afvUZxPBNhE6PoPSnrYM0awFDIvKWmgWXdPCpvxa
	VBKJYcL6t4I+cMLuHFZpa1p4a85A4TNeGCcwVBWvLO76tzCzXsfjZYAX
X-Gm-Gg: AYBFou0I6Y4s7bX1k9GRpMMdBJuhfIHXBBiFCz1DbUkbbXMa4H6e4Jt/K/gZb75yxLW
	y0QXxSsjxJPMwCo0U5aMyAmodD/vU1W6v6UpBu8S9l++hj0iDaeXlWxk5oaBMlV6CNclOUBEMkb
	iowVfme5X4NK2d9yrhXlcoFQnmhYuaNk6eJOZueu0zaE1UlH+m55ybCuXimsB6IlnW/K3t1VNIY
	l4DsBVuE7soXO2NTBbxVHOmxyAZAVywYpA8YE/4PP18d4IcTrlefJXA0H/vABBfXkIHQ9NNlSdi
	5o5ugpuVNF3gvt8F2IsFd5oENGzSfHMu0YEtrYTaRi8Rq9+4BGmPy1f5rBe+Jks5IfoBmlS6j84
	QNE5nmlDT1pbNTQWt2PN0ud9sz+8aXxkKgNdOBLT5y3UVtEs1ysNccU8MXfsO6IadqWAsGVvGKi
	ca+ByshyhYWsQKvVJ9CJFYchO4hnvZsANdweGeS05ex6JHV5uOLrjiGaKuTiREl7X/+n/WM/fOl
	mdmkXyE/MvDwDlj35yVDxA3kqyjxkzrYwDVmOtd+Wwv08b+nVTJI6/UAqR5Cmb8e4YEygLH/R+w
	QtaF8enel93QUD+D94eJBxO5KP/vhYfzSzPd1LGP1dTYRJNF8Vzn
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr30855337f8f.29.1788936461723;
        Tue, 08 Sep 2026 23:47:41 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm42216264f8f.29.2026.09.08.23.47.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:47:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: Fix maintenance charge table kernel-doc
Date: Wed,  9 Sep 2026 08:46:23 +0200
Message-Id: <20260909064623.90737-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct power_supply_maintenance_charge_table contains
charge_safety_timer_minutes, but its kernel-doc describes
safety_timer_minutes. This leaves the real member undescribed and adds a
nonexistent member to the generated documentation.

Use the member's actual name.

Fixes: d72ce7d32478 ("power: supply: ab8500: Standardize maintenance charging")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/power_supply.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index e749d2189335..95d3bc42ea17 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -414,9 +414,9 @@ struct power_supply_vbat_ri_table {
  * @charge_voltage_max_uv: maintenance charging voltage that is usually a bit
  *   lower than the constant_charge_voltage_max_uv. We can apply this settings
  *   charge_current_max_ua until we get back up to this voltage.
- * @safety_timer_minutes: maintenance charging safety timer, with an expiry
- *   time in minutes. We will only use maintenance charging in this setting
- *   for a certain amount of time, then we will first move to the next
+ * @charge_safety_timer_minutes: maintenance charging safety timer, with an
+ *   expiry time in minutes. We will only use maintenance charging in this
+ *   setting for a certain amount of time, then we will first move to the next
  *   maintenance charge current and voltage pair in respective array and wait
  *   for the next safety timer timeout, or, if we reached the last maintencance
  *   charging setting, disable charging until we reach

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0

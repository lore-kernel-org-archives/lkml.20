Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F75126BE1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131745; cv=none; b=YA0XSZ5pt7IPqzNrz8b/4O8sCg59+Wl50fTUuDwxhAPyVtz4yVQj+8NkCg7IH80XoWXTd1JfO5K3RMUV4J+GOHMcn0TCHsP2l9MB2TYLGSVVVTp+vE3cQebzNrATAfAEwqmnXvnxNb0bo3sucdlnRcNYsW/I4VtnoSvrZBAJnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131745; c=relaxed/simple;
	bh=czbPeCBzVXWMJc4RLkEP8NduV6XF6uXVlb4FvrHUejo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxyEJVMlVRCRShgoaQ3Te6G0KA1PUpxWdq1V/49mA4mHedUp+J2o3tNe0wpbEWect7uvj9gxTnyuQX5/DdyYPNiOtrW8WuxBlLEx28TsFzb4wZYPwe3McWmeZ4fZIWqBp6/yStFVPbCIRS08ifUFYnEmcCUO1cmy+8A2kKh8v/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtOKQc/p; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtOKQc/p"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso324393f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790131737; x=1790736537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6o8ezEWeqeFRYdsyOq64ZoAW04MferxHaAQi5G8VTc=;
        b=rtOKQc/p6erewDl7yZG4FrTBNWa64+Ci2wYOtet/3pF4AtdkvO6xgfUgck1mC7THH1
         WCC5kp5tGDmla5K9bFWAIm+fDVBFHJfEXs4Z1w73DFZKLNTj8dzLjGIWNlnCKEp/FwuI
         n3rdeo5CToChH5XRV22airsh2WRSaRHkJz8WJBdxEKuh62qiLXUGZ36JohR/LDubml14
         vAyKix27BEg53zeGYacc6Y+L7vWKT9K423F8t/pyAaJtLukIGmLg0QDldFDKsc8n5WCM
         QyY1jDPlHovSRYttsjigJWLMe7UI9FzBVcU6I3GzXagDwcQp9zmeLlW0fRsVf3E3naPl
         ynMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131737; x=1790736537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6o8ezEWeqeFRYdsyOq64ZoAW04MferxHaAQi5G8VTc=;
        b=otpFLdnzU+WIvMhT+xnIoAAaHUl+9Uhjd+2DP6R7QEO1ovX8OgaXExsFqGr6bP8WR4
         yL6KUwhVwDiGQltWadaSbl2Y0E+/RoeIOYzqFq9Mj3Dh1adqRD7eBTSA9sDUtNz6ySIN
         oEK03VL3GMS/wlWaAk0t7E8END+CvsxvoUByCw/IYuDRC8lY2S8F7GYWkTGSs03ysD9g
         2G4erEna3nQlrRoXVgod0m2Jms8PiaiekjGtCCktG30DXqusrPwpWuG7ThG6CPkB9QFo
         jvOyOJLzUqi1P4gQObqENPg5E0u1RGlJHZR8vVpQpkBsAKzAgiSSMAWD+gmfM7c5MJVm
         zjhA==
X-Forwarded-Encrypted: i=1; AKwUvBwHQildMuIg+qVDLoQ1zguktA0hXKjJ9FveULOJ9xqxVkM50YK9Q1Qfwnboy9rJSXprzoinouvV41bviWU=@vger.kernel.org
X-Gm-Message-State: AFuF++lTVdhpL3X34Qhus2fG4cBnhvXxBcb4gT+BaubpkdfiVec6snku
	GkzZ4DE1cYs/dvUhcf8DMrpKl8wdrPwKtla72PkdzDf0wB55/QIirMYA
X-Gm-Gg: AYBFou1Rf5QfmQtpaFCFbx27Uy8qBYRLJPKUpnNm0sF900D71odS0n0T4nSTWIdi8ke
	aFm7LW972B/bywoRg+VgBuwNKuVVdme8WRCgvPmMrO6RLhI3AWhVL/1mmb8HsQLA54JD2hxswkj
	DjiMeKZHeqYbIFuDX9FmUejo5eB8mZDjzaMkmpztOOTzV/C+OO7AdDbeLJYoq0bBHmlPjM5mXyJ
	0BrNqd/ssNqpL9RpixY2MFENN3eUeGOS4YdRouqw12En/UlfJ2t8f1D8R7e6Z5lxnztpDKKWSpt
	l7w0PqfDBLIVVJVPF639K90NeRM5s4jSbAU87xQzYMEI0tNfWEng0wTnPbuC3lhs+2nltSQ1Vv7
	0QX0/s7pLwH3ebxBcqoMyiMHz2f4TfvUgjfSIZZWrTBA3buxzKG1Bam4WaQvcb0l10s9SP55eKw
	bFfOmhj9u69iIZF6VHFpvFGvSkfCgjcsheEUIsRkL6cOxeLOBXaDneOW6gM300hOyM
X-Received: by 2002:a05:6000:2087:b0:487:232c:a9fb with SMTP id ffacd0b85a97d-488670425bbmr2403373f8f.12.1790131737188;
        Tue, 22 Sep 2026 19:48:57 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm2860432f8f.30.2026.09.22.19.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:48:56 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] hwmon: pmbus: ibm-cffps: avoid format truncation warnings
Date: Wed, 23 Sep 2026 04:48:27 +0200
Message-ID: <20260923024827.56445-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 reports format truncation warnings when formatting
the firmware version values for debugfs.

The SMBus helpers return the byte and word values as int, so the
compiler cannot infer that the formatted values fit into the small
temporary buffers. Cast the values to u8 and u16 before formatting
them.

This avoids the -Wformat-truncation warnings while keeping the existing
output format unchanged.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index aad94bcb9ceb..2498c6f4778e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -166,7 +166,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 2], 3, "%02X", rc);
+				snprintf(&data[i * 2], 3, "%02X", (u8)rc);
 			}
 
 			rc = i * 2;
@@ -177,7 +177,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 4], 5, "%04X", rc);
+				snprintf(&data[i * 4], 5, "%04X", (u16)rc);
 			}
 
 			rc = i * 4;
-- 
2.55.0


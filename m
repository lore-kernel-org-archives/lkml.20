Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226316;
	b=QpSWoKpk8G8DGdQh5WPHy6+PApGec5IToluufQMs2WZwcuSBMqCZoiWdRh7Tvg+89l26
	 H2EpgPdSFIMnHThgKLcP7uo4TQWL4Mur2EYOFpg6vq9lGVFYepLDokwVRyMbIwKhYZcO+
	 mGhRv01r5PKuSrkYnVfDySPY8swrnqtTPgjcm7+G4QFCsSUulnONZNpkq4F1KPCQBAq54
	 F6nUKp2khpAH+AgvrbGLCGlPjRyvdHYKzjkf0/4BcBrD/a2CCAYHdFVY85pEJVsne7ns5
	 dJabirAxWtoJWQqrtTJxfPFALN2DkgRmjNfQDge97Zc82ls4pTFElWl1Dqfe+uykitw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
	b=gChbJ0xeZ2aVrk02cVfyElvbyEYnMgMR0WFL8NsAt2R4XQBHrivbExM0eUMoeK5chZl8
	 iH3y28EPc9HC/duwPzk4Y+l9F3fPBD/F/aRidIKPQr/OhxlisWXlp6fBzNSgRhJyWGvyG
	 9ABXCl9Gr3ZhM5hYKXAjArD7UELkwx5PqGJE/8q2xg3jIiH2vj7U3bv4OT133Vm3mJJl+
	 glDZnXNk/ceYwwxoywzWJoMM8hn4dDMkEF1jLNAgi0afRQf3uHgzKsb249Iv7aDpJ5bZY
	 NncVDFa9ddD047ltSwsIiq2CPSzFhGfQm4nMXqI+4Pu5U4KVxKvZ/qYh+YBULGG6cow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbR8YWVO;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F509606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F509606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbR8YWVO
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso439368c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794226315; x=1794831115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
        b=RbR8YWVOz+jr23GxOq782kbhyAEaDpRxtqVXfsCdQqajVBjiYCGIuNunab9XcHqNa9
         hpjj8tofVmUn7EGJmKlPlS5HCSUMjeG+ex+YIaPlvtRTo95MycqCwnfv78gEPLHLd84a
         UuyslXsJBwWYO8hKZpgi6iNmFZx6Kr7k8hEYIOjOFD9O2nyj9948zVTTMViN475b+i3t
         jwbm+yJKPUzDuL8FlZ03c676Z+S3VicHWIv+yZmx0+hb0kWc3TbwIwYGXfCVkoM6fk+N
         hNV8jeDkbWyUc1iR44AAaGsAYOzVMboResO2FuJy97Lt80Trq/eMIhpqmiD1mOXn5LSj
         ZPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226315; x=1794831115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
        b=LXSdGH/rVA8iDQ1WCcMFFgtXcj19zGqUsDDeP+MmVZs5h9ZC0Y3ThGfQsS0N+f6GVA
         kmSAMjEPn+SflkT1ShT3qlQyx4k5LSJSKY7s1+ffPdahlTaHIp9pBjVbRo5+dGzQfkk4
         Iv62ap9FZ2hp2KnAK841BwJM6Iv9ZDBtLJPo48vaE/TH1yOWjBlCmPal1FesbJ3utrv6
         nyUIjpta7eapzaNHFVC+Ulo5U1BjMuznn06uDkwwq1ssYnjNmypXvjGGZ+48Zgd3M9yv
         CFZlFUn21dpS/nClHBMvALijjGesFYnC3fgjNjZxtU+UW2sN9jCKITexFfP4k9OEtZnS
         /VWQ==
X-Forwarded-Encrypted: i=1; AL+hErFv2JJTtB8fHf3pe1h/4n66Y8xaV3sH+aFEOLVIJzFAyYGMVmUJDzF4ynyP/KR0GGBEzMqUnuzFtVvq46c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I4UP2zzV6Lxy81+XGg9SJmBLJ51CgzSJ5N9whf/7O6XHC178T
	SmdBv/sDT3V0rEdwUmG/wRAbGRdqhByvqF3GvCquonWEY5fgcsP+qihq
X-Gm-Gg: AYBFou2+otZoFh+EW7gCMnZUx2ly6Y5ueRUOjMAT3puHQFWA2B5PnPAASr56LObzC06
	yLUdBaLRjAbKpEswF0hnVBgld7SVJyK6TsDkan9aOToBO6u98TAO9NDslKpr1Ts2v/p4mpqzQqE
	cBGxMAus2YSfXzFqQAjR4Iz3I8b8TGdG9dVTaJfBojJ6MBQ/eRqjTpeo+4tbIJFf7FxOCf0Gqq5
	KHqeXz0GbOCXNRYnK8wpa3pDWxBsKbJhpc2QJhJEaVYsrJg5crswUVFAPYSb/286mOn4NBuuTqJ
	kOhSiTtTmKCYFOcgMZDXbQBwVguwu+vTocnT45atYmfXLuPYyjQeHC+dkOqMN6y1JZz2ikg9zV7
	MW/ZTs40c4gYoPs9YL9uRDpgaLqZo2ctP4Rsjjf5Zk/PEWolOFtqrxXwrb1HfFSYeGtTA0uBc4Q
	wupndlbq/K1vXfNepDsJrZC3ObmSf41wZGHyKs/pf/bk1M1z0CAUklGQ6btpFTgONElqwNnRDxn
	K2CVU2g5NJaiOXEzzEUgQvvOvisLmQkDM7uz0m6qKDI7mZjA0tp/JMwl8xhAQzEro+gNPWIcYyr
	ciiCIOJjT/bbQKX1ONB22SdjW29tWjwNDUkAftJe8ql1
X-Received: by 2002:a05:701b:260d:b0:181:8948:f022 with SMTP id a92af1059eb24-1b39fed1e46mr5037953c88.21.1794226315281;
        Mon, 09 Nov 2026 04:11:55 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.211])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm16188496c88.10.2026.11.09.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:11:54 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Juerg Haefliger <juergh@proton.me>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH] hwmon: (dme1737) Use str_yes_no() helper in dme1737_init_device()
Date: Mon,  9 Nov 2026 17:41:27 +0530
Message-Id: <20261109121127.10937-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded ternary string choices ("yes" / "no") with the
standard str_yes_no() helper from <linux/string_choices.h>.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 drivers/hwmon/dme1737.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index b1bd3682c5fb..c3bf5f4ef941 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
@@ -2316,13 +2317,13 @@ static int dme1737_init_device(struct device *dev)
 
 	dev_info(dev,
 		 "Optional features: pwm3=%s, pwm5=%s, pwm6=%s, fan3=%s, fan4=%s, fan5=%s, fan6=%s.\n",
-		 (data->has_features & HAS_PWM(2)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(4)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(5)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(2)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(3)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(4)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(5)) ? "yes" : "no");
+		 str_yes_no(data->has_features & HAS_PWM(2)),
+		 str_yes_no(data->has_features & HAS_PWM(4)),
+		 str_yes_no(data->has_features & HAS_PWM(5)),
+		 str_yes_no(data->has_features & HAS_FAN(2)),
+		 str_yes_no(data->has_features & HAS_FAN(3)),
+		 str_yes_no(data->has_features & HAS_FAN(4)),
+		 str_yes_no(data->has_features & HAS_FAN(5)));
 
 	reg = dme1737_read(data, DME1737_REG_TACH_PWM);
 	/* Inform if fan-to-pwm mapping differs from the default */
-- 
2.34.1


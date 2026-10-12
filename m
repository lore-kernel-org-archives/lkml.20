Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63204A4F0D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819947; cv=none; b=W+JxyvR8hosBx84/zSP4TnMzhGNo8GYmPp1H+Ht8SOcQYRMt+FHU4XaOcrwiDdg7eg7/SWbsJRZ/rOlDvm3QKKlUJL3OAVEi7u+V3dl7VrVDy3Lmz1PDQliSGH2rp1PSIJwFj8Gd3krCthzUBWeV5zcAWLX47xy37zmehc3OUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819947; c=relaxed/simple;
	bh=D7sxvwTQORDG9UZDgAwID33nx8Gdqdcm0JU1TwJ2tdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxQiwXTMtwrrmr+G2Onkt7UgeJUgbvVp4InnNndhSF7NKr2v+0n5FvkOOHHh4trA5ZgP3AEXGVsbSS1atiuzbvFgQoCD4GUVqBdOBDEHrq7lQsrbQT2lmkdTjPNI8KCIvK2+EvfLWb1AZZjAp7LqDXiG8gYx8rIzPdV8EI0WEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVgRYwC9; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVgRYwC9"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-141395927feso3630763c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819945; x=1792424745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsEajUbPO5LI3z3KVxIR8CEQ6sxYOQ2C/IR/YdstWrc=;
        b=YVgRYwC9103XLk9yRZV6b5Lb4S7tB/RgIdvD2AeQWxy8K4aapFiWm+qkWRAM9CTaA8
         9Rx89oe1m1XJvcEcPgRHYW0aswHCE13crTMc6KDzZfQb02SOCSumGF3j1WuFnWjaUqzN
         1kYnA2pdBxq7meyf77Ws3tjIEsqUSnCZZDy6RFRxnAomuf10X9fsjYcP4Yp946mOgdmD
         h4wSUacg1phET2RJm0zH9SWzh3N8jKqmAm3WaZriIRVd81TxjsEl5zBFqsKWLQyJFxuB
         I+2Iz2c/PyHotyk15s68CCnzwOul9ZWaSY9Rr6PVCgN0azl380yvtEv25TpqX039lyxt
         lVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819945; x=1792424745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsEajUbPO5LI3z3KVxIR8CEQ6sxYOQ2C/IR/YdstWrc=;
        b=Du8KGrpC6OHPXRJ6EACRMuHUpe2M2rgUutddQGVESLiLU5ZBcnlSG/nOWNAsCY5sKz
         9QB9vZWJPwwx66MiyaJCIzKG3smnZAWUdoPmcSokiLuXw5lMDB4kviVVU23EsWjnKCOV
         SnBrO1gIRmhQRggq36nPEPB6zCgIvC10d6tJzvYsyXQ3TfCQJulUAFn2BhxV21noG3RG
         j4xbMSiZATtzkQY+JOFE+SK5DGHVA8iFtCRKBvN9TykG1wGzqASb4XCscvsnF9VOO5mK
         5c5gkr8w05obODrCwGvvAYXzGG4vB6epzAHVVSHZyit1bLC7+3q1dP54OfB3T/T4rIOk
         Avgg==
X-Forwarded-Encrypted: i=1; AKwUvBwY9oybZwzK6KrCh3EbRMqo71PH2fnHo5jLBm7n9Po07y4CnGGNHnRddB9vRb8dYqBgmMwybCErOhvq0J8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjoyHur09kbaOQk/Nwr5vfWQjjZLf+jFthm80sDV3GbNBjEFzD
	VJDQIpw/BjmNr/sGjNkrW72SoOMpeMG94Y8XSrFR13g14aj7oi5Kc/Af
X-Gm-Gg: AYBFou3C4j9jsuueCk6r0gN7RTGdMxnGdcyekX71qU3c4OpBDZLS1R6acLTrvLUEcqP
	DaLCVkpaQqhVpyG8harAONfGaLZ9+bFomnizr3cG/DCa/b+gG2q2siKTiMytea/NO/yYPYgn4Vy
	CqgbypLFc/Fgt8LdidVSm5pyoH84fCzTqRdOY+GEP30OQcnVlEbF3orBXgA2fNGh7SGfQZhA00K
	LcwXGuyW8UU1LIIUoNh7QscS1nawMTisX59OsBL+1C36IsHJHwKb06B0y9DQAiJsfoeFYo/CPLX
	WZzyMBOJ6OYi/zqcLBpGlLSTn8zEkRJXex67OJH+tb7BdII7sywo/3u6HzK4hx7oKVLK/gh/f6W
	6Da4CDOh2cq7V9OVabrIJXL8j406D8m7XBtTm6BSmms0QBvOdrZtk1h/4hqO+41Vqv/j4uvy1et
	OmeJZ1YlfOdv7AFesalkLXV5Hjf4sdb/6v/daaHUQuw4xIY41kwfqIAw1PrDHjVZTooGDOaqiNk
	aS9NlKT/VRsaw+udVR/PAtALui6bDPH10NF35e7ahZvc8iOno1NE76fo/biz7kTfMfwZVUP
X-Received: by 2002:a05:7022:3a86:b0:151:2e62:fe8a with SMTP id a92af1059eb24-16a611bf1dbmr14334378c88.40.1791819944866;
        Mon, 12 Oct 2026 08:45:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm31316736c88.20.2026.10.12.08.45.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:45:44 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] HID: hid-msi: Use str_true_false() helper
Date: Mon, 12 Oct 2026 21:15:32 +0530
Message-ID: <20261012154537.42113-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open coded ternary in enabled_show() with the helper from
string_choices.h. Gives Same output, but with one less conditional.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/hid/hid-msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 3225d3bf6..4822b5d6d 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -28,6 +28,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -1586,7 +1587,7 @@ static ssize_t enabled_show(struct device *dev,
 			return -ENODEV;
 	}
 
-	return sysfs_emit(buf, "%s\n", drvdata->rgb_enabled ? "true" : "false");
+	return sysfs_emit(buf, "%s\n", str_true_false(drvdata->rgb_enabled));
 }
 static DEVICE_ATTR_RW(enabled);
 
-- 
2.46.0


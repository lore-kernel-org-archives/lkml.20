Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3DA3DA5DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668249; cv=none; b=PuM/axsr/ddgsO854c+jrQEproorf0An4Lsm3ALuD61XoSSBCt9m72qp0hO4+zW2mBieKm0nvNW2CA2RU8gTBvQqt6VR+D7Jw8Ebku7+tOzKUOGa7Cjw5NbBJ8qQmmm7OoFUFZLauq6CyvbJCEr8Mtgae8LG6eGbsee0YlpS7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668249; c=relaxed/simple;
	bh=5jk7arBCrVb9gyiNByAj8Ixk+2+PmKJPbPReCUIsRVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REnA8ARzGXrOLKetH3e4To36bUIz0Q7VqbnjeATFQ1eLE6kiZTqCw/s/bdMwvkjMAeOOzQaXghedudVWB0m7+hxRAIoBY/+pTOrpUsTcBgzUAtqA06fbmkzZh5bg8yw60EwXlhm4E78pKkqkLmVUuUvkmfwbayHoLzqPxRSGNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjeeclU5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjeeclU5"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so11318395ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668248; x=1790273048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=LjeeclU5UDnkO4dvHqIeMhoRgL0/bfOSN6n0nmOokLvsrkO0QiETOzRP8wsfYd/ukb
         dfXKDHFOnsFyZmzu/CtNLSt0hXi0A1/9lXVSgA7u2UVyDs30HZ4Ih7ZJH01YHrAwefu5
         J+xzRSpyHkrIqeZwc5Gm1yq7oOdKQxFWEWRCiVR5y/xs9HhvakOIuh4mtYt2POWDOn5V
         YzMbVP2jmkYHHfeoR0EY9hwz9BV6qIQVLC82NQZd2wu0UdT0ym2JPdvqpvNbbDZ2ph7c
         4DiaMBlXNxZxmyJND/iOJpYtWrVE+qZs3U4ipllQiDQQh3Dr21LSMyXOAQQ97meAF/w/
         uVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668248; x=1790273048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=w9WZOESRNfu00AXN0SM/etJUqpefsKgzBtEntJRgHXtTbAO0+jdakAfKM6ziag1iDI
         kkMp9mMLenZRjRpG44nIV8eYN3glT/Zy2TrGHUpUH5bw/RvKfCilXdQMSRmLew2YvOOO
         H6PSD2pMAggk+pxM4IWM9eU4qjpBjGLceLPkWRrhcitQm/3QeNqmI3XdTXl3ifZqhqox
         hx4eMFatoIKczf5G8OhAtamkhH2SK2r85F8zSv+wJlIP8t5pPy5bID7ySAHVWHLAoAtG
         IvXDE9D8NDcY0/QN4FMC7EZ/UHg2Kq4Rxk86BIXWsdP+OVBMRXPp/rCLVMBKQWe7PiI/
         ZZJg==
X-Forwarded-Encrypted: i=1; AKwUvBwwg+QoNFWpBKV25FkQFVPUZ47tYtbg6NK/aHf5Bl4W0OxKLmCAf7cUVpzhoztlPSonpvAJDhbbzmgo8Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++nUmtbN0kESNgLOwYSvSgxRWMkaGSqgk7QpGx9K2v1f8gSF43Mk
	vHbLWA8x1W0Mfna3vRB+erUDJ4gvwtoxiJ8eI2iVeZktxcdtmc7UUKmS
X-Gm-Gg: AYBFou0+GvshxdlCcHxU04caJSBC5Pk44ux/LJwS91uc0BK1jdtByekimj8njcjlUhq
	+i+HLDQofTlcwlBb9Ed0VMrkN95Vuy82SZ8cYzOkw+w8eJLYe2zdKX/EMh0w785MWmMmZ+d1Fu5
	7f554KJuT0pHwWESpkaoqNTWr7TARLUXktAQTMxr3hc+0HEs1qV6WE1yHY6LrGpBl0Hu8wPsLVC
	AoZipN4MnQitC6ER7aYdyqVIUIWHw+uC4qpoCQf5ZUiK5RQiMqA7GtTB2Tlr2NXsrYmV88aAJWw
	fFc8XObbEqB+XBbYWc5ef/UgCCgnp1Un9oT/FAg8mxxGXrmNSA6qiXvbr/9hX8MXgF5THwRwNMM
	FQaIQ+lt2csOLPdKTZfI2OsadrcZW6f2STuW/ksQ9slyWLBgkBqLbcuAWmgf1ckKg4EZjONlp64
	uxOY0SRYZaJtdUskyZ8K2v4i0A9Y2qzL1wOQXIto5KZQD5wdv3aPlaN5A9FHIfGUKJwvPR/d7vm
	XRnnDarUzxCy+CfcB9xiJlq18A8JZbo+VASts8xrSOQaWQvjzZr+6gExfJPEr0knfIWrQ==
X-Received: by 2002:a17:902:fd83:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2ddad748f03mr21198015ad.24.1789668247846;
        Thu, 17 Sep 2026 11:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:455:c3eb:633c:5d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eff35asm30446485ad.58.2026.09.17.11.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:04:06 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pinctrl: gemini: fix kernel-doc warnings
Date: Thu, 17 Sep 2026 23:33:25 +0530
Message-ID: <20260917180339.49882-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct gemini_pmx documents a virtbase member that does not exist and
leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.

Drop the stale entry and add the two missing ones. No functional change.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pinctrl/pinctrl-gemini.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index e9f619278..a029cab22 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -41,7 +41,7 @@ struct gemini_pin_conf {
 /**
  * struct gemini_pmx - state holder for the gemini pin controller
  * @dev: a pointer back to containing device
- * @virtbase: the offset to the controller in virtual memory
+ * @pctl: the pin controller device
  * @map: regmap to access registers
  * @is_3512: whether the SoC/package is the 3512 variant
  * @is_3516: whether the SoC/package is the 3516 variant
@@ -2031,6 +2031,7 @@ static const struct pinctrl_ops gemini_pctrl_ops = {
  * struct gemini_pmx_func - describes Gemini pinmux functions
  * @name: the name of this specific function
  * @groups: corresponding pin groups
+ * @num_groups: the number of pin groups
  */
 struct gemini_pmx_func {
 	const char *name;
-- 
2.46.0


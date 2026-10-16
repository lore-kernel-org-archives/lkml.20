Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754C342151
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131124; cv=none; b=NsFsa8XEXYgJDYWgUU0FladP4GFHrjpdtjiuxytPs6921pGkOPJtveHhq90/NDOcLEYpgAOazHdLJAU+9HEGX6C6Ya/8ryO58c+dlqQDBoLY7Ke4+HI6txmryj9pMaYjOBcLEQYYnEc3iA0GUyo2vtsOG5nFfmordq9UIz7K6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131124; c=relaxed/simple;
	bh=uFejgQmnOX+V3F3xwrMuswWF0V3FlwNOnKfSEq74M5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwSwXkni4gfC03KvCptyzieOpdULfeaH73Ata9zOVwHqXMOvBvtba7ejAWA2c8EdgmM7bZECJVtDbyjdwC/mgYY5UxqXNyqtSE7U8yKoHTND0wfXMqllb3gXO8SBimgIgFXKJ2ROnswK5NaV3eE3rpX8OOk3pbTakAeWA4IRIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVOSaAFl; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVOSaAFl"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16079d54c17so296419c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131121; x=1792735921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2D43pMYuOtH8TaaVXIiUhAZj+VN+PDy6tPFFqTVsR7g=;
        b=nVOSaAFlOy8Qo14Vb41SDIDY5DBys2+UvMB9WK5C6Q4JvA3PUjXnt9gianwq+lED8S
         ALOEef6+HY/ZRhyFYPLtMSQPnPehDmqKBWh7q6pVYzCYcdjUjUSZDlJczhqEXQXtmmPl
         JNFf6//IyTURFop+RRnprZbOoRoV/Ad/abdTHUMszVQ4XfhKWn3wHxYub8APFg9uhHcO
         MpaMI6+CdbvdG0iENitwxv7oGi0qi2oc0No4mxO3e1gJqPvuWa0HFRQZky47rHGeOfSo
         DLD7vsUCT96LFMhdUX/YzM+Hh4bcslZX/VfToI00yzlZ0m6V9DarIUYmELSOk40v2dM7
         HFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131121; x=1792735921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2D43pMYuOtH8TaaVXIiUhAZj+VN+PDy6tPFFqTVsR7g=;
        b=1ofHqWz4yT8SxHpKyZqjK93ESp6X6joeJykbQl12vJm8KaYQotEkxcy3szWaaXtNEz
         AVNug6U6iIyAT1EpWXu3v8qyDx0RcP4BHqoZO6X6ELT/pWYCyeFPxnFrqfUKamA7bmCd
         JxgbNFkI45839spkoM3aKmdO/Er/li1DBFVVF9C4lsMUsKhPlL6oM/X/Lx05dTXIKBMF
         JHZebuRdFSw77e0Bhz5SBj+SoamTwKlIXll0HRNIe+fAayRrycRxmsytEdEYG7n6BofB
         rRDVqfFj1Q3pWjf6iXxATETKl/yBKQRODgN8yiR4EZbjGrz4GYP7SN5FOtLkd+KDL4nG
         cAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5Xa3ilGOGWvgTX/QezUTzd1mc/3BlBGrhCi6Xb/RVI0eoRV5JbCnakOyC/ZDzp1MFC34JzVO/CyJ2SR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaQ7nPlLL5MDjIyRq5MB6QxKqo9z79oHZiqPX6QDsi22Lxy+gi
	7tRXfquyE51W9kQ5ubt7WEh9IOG/V6lSxeFQD0bsdKqeFy4Ip2Tn8EvX
X-Gm-Gg: AYBFou1W/qWcu+iz1vbqcrhYEqthH3fjLDtuFXziqSr0nmOXPxAWRzh9rJFF+uTg8OI
	sIb28aWOv/m7OkoQYywgfjVe3AMnBU12OmO452DOlD1Qx3LY+lDHRtuOprXhOSvwXjWA7pXW8Hx
	0FBAPDL0MaLTJizeFRs6B+VBNPsX7X2hmwlZOe1CyicY/FTFskMPgba28UOG43+8QL3nXUKfATI
	hMBas8HaqwQ2eUG/E95CQQe/avoFSNZUYn2/T+cy4SzE6+xesmoWKDV+xONQNjR+ajYBioXhqI1
	lkz6eSJlopvwVd6tAQ6Ce31dqCIgRCMc505dc0QbbWMgTsKre3JcAJ56G+C3xixaGLFyZ/WWhQQ
	NqJ/CRdB3l+8FHgD7n5SGKK8cb5V8hkZo2EtVO+d9UugPd5yM6IuZhbY+fjWQubpEFNfp2ufQjL
	/PObYrzbzfkJ8spJFE6ezDwPcOcLT4RzOYIyedQJDGyuLAS0O9DNd3gByaKucdz06NROW8Ckl3T
	MMeRi7y86RpJomlPxz7zq2c0QD38T4WboFRIFh8zjDlDc8=
X-Received: by 2002:a05:701b:2088:20b0:151:d6e5:596b with SMTP id a92af1059eb24-16a5c4fddd0mr29746246c88.9.1792131121193;
        Thu, 15 Oct 2026 23:12:01 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm3755480c88.13.2026.10.15.23.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:12:00 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] can: at91_can: don't discard the IRQ lookup error in probe
Date: Fri, 16 Oct 2026 14:11:37 +0800
Message-ID: <303815792800553c34842147941cab083823c212.1792118040.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

at91_can_probe() looks up the memory resource and the interrupt together
and collapses both failures into -ENODEV:

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	irq = platform_get_irq(pdev, 0);
	if (!res || irq <= 0) {
		err = -ENODEV;
		goto exit_put;
	}

The driver matches through an of_match_table, so of_irq_get() returns
-EPROBE_DEFER while the interrupt controller has not been probed. The
probe overwrites it and the driver core stops retrying, leaving the
device unbound even though the interrupt controller appears later.

The irq <= 0 test also covers a 0 return, which platform_get_irq() never
produces; it warns and returns -EINVAL instead.

Split the two lookups: the memory resource keeps -ENODEV, the interrupt
returns the lookup error unchanged, as the neighbouring CAN platform
drivers do, e.g. commit 057bd6168d98 ("can: cc770: don't discard the IRQ
lookup error in probe"). This also drops an IRQ lookup that cannot
succeed when the memory resource is missing.

A device tree without an interrupt now reports -ENXIO rather than
-ENODEV; the driver core treats both as a failed probe.

Build tested on x86_64.

Assisted-by: LLM
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 drivers/net/can/at91_can.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
index 58da323f14d7..3977de761636 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1069,12 +1069,17 @@ static int at91_can_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	irq = platform_get_irq(pdev, 0);
-	if (!res || irq <= 0) {
+	if (!res) {
 		err = -ENODEV;
 		goto exit_put;
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		err = irq;
+		goto exit_put;
+	}
+
 	if (!request_mem_region(res->start,
 				resource_size(res),
 				pdev->name)) {
-- 
2.43.0


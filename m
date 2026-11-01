Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793504038;
	b=qiNx3bCqLgHaYaj39xfKFEWZ3tEMRDyDZ8b6r41SOnSaVr/AlOSbp+XhnB1PSs/VD8Uc
	 Sfh1Tr24w6K/z0TKy1n7+yszN1v1n8usx9QXKXe/MRkPBbnBADmWCD5+EkEwKD2aR2e0z
	 wNeHnHx9N47Wq3keigkDCJpWHYyoCtQYFaK8Thu7R2mszbXunvLElMCm71eQdJz4OjrkW
	 R2FPu6c8vqvGkDT9TgbEKrLFl55+lqikvHJ/DWoRL/YifLBHmksXvN/nEOk09mzitcAdF
	 6h58//NQQ4yfdqVFjetCIyIm70gqDsp/BtERlQH+pab8kqUWKv64yZPKXdFKqUPvthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793504038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
	b=sIMCWc/Q+XNPBd1SkHKAU6FzeAPySHdzGWgxnyjyZmRSuLfe8eFNTjWkGPHtZNk0ckzC
	 wftRcFXEQR+w6Wd1eLYHVhnGw/60TqY4bjr+5/NviBEeeLfYWIu9NVZGzbyqVpsZd64gM
	 cmn6spw1yiFz0Vxhwhq4qYfyGHsyZE2xXmPKGINeqAU+wxspVI36Q1VvM9uT/8OkQDwgD
	 4Dl48NSbTkiboQHEG+z62QFXSRaGCDqzNx3QZwCPjjqyRnnh/yblllVuZEfjmQUqmy2gL
	 w0YsPPFbUluZQ4aRwWvVdn21yTMoPpRT9e8XHV3nOOlAjq98y2zOkNsbcClLvfJpYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQESkylB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CDC606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CDC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQESkylB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so2645535eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793504037; x=1794108837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
        b=SQESkylBMjK20XVQFW0H/wphPMhUgfgfgxrMne2n7F3px41nA6gQnmiBf4yj0yEaTj
         3wm5JBP5iNCqwrvgC6FMswh7RHB3dOjoa/r25kcFhEk7hxS16BFd0sK/g39it4EWOuNv
         MrGEiVVghp9q9oSWe+UMwwYDFRg4H8uwP+Hbl5Br5IW8paUI6CQtBA9XkVOfJBhyy4bD
         tIv1aF53e8oTJzpbOoqUYuvwax/5A/ieQsmzZp9N6yRXAPoQ0p1yaMpBZVwAI67MLrbi
         JzmPQmJPu3atgupnZfmX7oz64g0Tb5gqHRrFIfOIJZr7bNJgBgWiRsdrAkkJXfFUljW0
         tnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793504037; x=1794108837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
        b=oIKZvh7WASM133lUoIFBsdGow0Ml9k7G16rt0+lqId9NikkS8U9kiT1UlhomiLpmqj
         7VtgqeAZSD/YGzsLBgEuyfIPXaC1bm46Fbi6H7DpJmOmDHcLTuBnRvIBatXNPriXLbwk
         lX/jTvCu9JkYcPjYkwGmokZAwhfPGNwuNoeqTZnp57zytsm2fwyt1RLQp3WieNOwecQo
         gRQ3vLkhTtY6GMiZA+oAJN8vxF02U1Bi4rYaF9qu0IMtTCOqXIojS6yWL5HjPVXlSUiT
         5OPLQEjhqRFUbVjJB94bnv48E98ipnKUQXRIqmIHSa92wxZZdrTgNBuMxter93ivAooF
         SD2w==
X-Forwarded-Encrypted: i=1; AKwUvBwiHa/gHmdaexrr9plEPBrfhN+3nlVB9MID3ljjlnKldW2nMcPeqhTaf+Jc79JeTD/939USxhB8tzdt8To=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bkqdq+TK0z7V0vgOxI9b+Lg1bhjZVpHQnRxsLlOmVLuoK3mEg
	xuIRKRA9Kk6NK3YJ3NF5fzYkEzfd6Yxz1hroX9T7xpisfSrTNmUUbiUY
X-Gm-Gg: AYBFou1aYQuYJUtDJRaBPUS9RvHFyjbwO0cWFJxSkL6d/HEI/A2pzIGFOUTK6XG6veq
	Dst4fb/PawPi6c8WgRwaT/m2ma+PFQW/UM6T6pCJjyG7+bFlGBFHgCevdzPwHobuYRIan/QP8ZZ
	xiXjsbcv2hupdUwNYLAmds56aiQH8bw+hMcQvhWhWh4rhrat0HS4hHzdOXqtT/tuSOUSSixLPjg
	IP+cNk6tlsaZnOuLLpTAb4VxGzp876310BqwslAFmdMkYKj/pVMo38vV606cxVybUiXdFpqs5rH
	R1Y2rn52jopnXpMrpeAR/1T8AYY4q4CySxzRTQS7zrIy6g+aQqKJL6Dz7nRo3Jkwj6HSUAuWbg5
	tk34qu2Bn+dMUow29SFKVVG22MnyLqWik4zR5wS9Efh4jI6ZDmYL62jL8OB0LxDcfDl1z9g1bj3
	35UIQZePYpBun43An7RCkS/YqzHcBWg81bmfLARponayue6JICJFnZbzVdNNy9uhBvH5+3gpQnG
	TgLZGR5NhKzh+VVdXRL+YvtHmluixRRob1QvvuPqX4KWN9sUNJV7WzuvIvGuatkL0n2j73oMZuZ
	MNWkIfZGyGUwRzPVhH5UvJVg4FugSXick0cs0LTck23GiCJ4z+n7zQ==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr15242134eec.36.1793504037532;
        Sat, 31 Oct 2026 20:33:57 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([49.43.7.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm24731461eec.23.2026.10.31.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:33:57 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] leds: class-flash: use sysfs_emit() instead of sprintf()
Date: Sun,  1 Nov 2026 03:34:27 +0000
Message-ID: <20261101033427.442-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(flash_brightness_show, max_flash_brightness_show, flash_strobe_show,
flash_timeout_show, and max_flash_timeout_show) to conform to the
recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/leds/led-class-flash.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 181dfd49c6ad..a1bf70d6e47c 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -71,7 +71,7 @@ static ssize_t flash_brightness_show(struct device *dev,
 	/* no lock needed for this */
 	led_update_flash_brightness(fled_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->brightness.val);
+	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.val);
 }
 static DEVICE_ATTR_RW(flash_brightness);
 
@@ -81,7 +81,7 @@ static ssize_t max_flash_brightness_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->brightness.max);
+	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.max);
 }
 static DEVICE_ATTR_RO(max_flash_brightness);
 
@@ -129,7 +129,7 @@ static ssize_t flash_strobe_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%u\n", state);
+	return sysfs_emit(buf, "%u\n", state);
 }
 static DEVICE_ATTR_RW(flash_strobe);
 
@@ -168,7 +168,7 @@ static ssize_t flash_timeout_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->timeout.val);
+	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.val);
 }
 static DEVICE_ATTR_RW(flash_timeout);
 
@@ -178,7 +178,7 @@ static ssize_t max_flash_timeout_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->timeout.max);
+	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.max);
 }
 static DEVICE_ATTR_RO(max_flash_timeout);
 
-- 
2.56.0.windows.4


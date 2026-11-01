Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793495690;
	b=SmTxDGfleCKfd5l72Wlxo0Lx0/04Kg4cArXG41rmNbG3ptWc7aK3DijKPfHE+QYGlPSl
	 QPjyVYdW7xZzF3y67QtrDyYonepYBHaHFoEWKe9t36OYMX0UXX9nudff9WHg6cp439fhw
	 AFCgUSJg4SLWuhEZfGMiTGCWj6QrmVny4M3glSedulCvpHnC2OlU2YRpcXeYNdSzU8bSF
	 KH9oilaaXDDFrPclx+fkLzvbZQMpNwRoP2/aem7riy0qLOKu8qCqSVF4dOc/zvuDFha26
	 JBrP6o+xwN58FPIp1xiiriFht7sCAJS1WhUnIwhsRk8h4f7qjoC5LfNSWmDuEm4/19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793495690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wGXYQaxTBIJGlm9+hLcQgGKVY+JNn5AF36EC8fQCfG8=;
	b=Xhb3kdjA6q6qZ7UWZll1JT2q19o0VrC2gvsWzCurbMJOcXy/3r3AQvDpWIMTjh4jXEvk
	 3tTabnr9JTfRoXZKu2zqbTx8Sm7QhmdSzM6lEQTt4cmV/rIMZTR4SZVTikZW6m/e54on4
	 jbv/G82tzDE8O14m/23rZimjqtFMXsYSAn/wxSon+raCLhf3gTZB2md5d+U4S7nmDt5m9
	 KBKp6+C+nOi+VMr8vTo4nSvMZcWCpKsNJFGSzOUVG0VRpPn8v2EU33r5ZuRSgNidPT80U
	 R/1VQYHpp/kzhPVE6UnEkjxhGlqYSB5v/jodjTU5YDAtc9VxgZYDB/jpgXRwIMvCLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QKPpFN3Y;
	arc=none smtp.remote-ip=74.125.227.8
Received: from mail-vs2-f8.google.com (mail-vs2-f8.google.com [74.125.227.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1565606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1565606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QKPpFN3Y
Received: by mail-vs2-f8.google.com with SMTP id ada2fe7eead31-7bd9610c0e8so250249137.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793495688; x=1794100488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGXYQaxTBIJGlm9+hLcQgGKVY+JNn5AF36EC8fQCfG8=;
        b=QKPpFN3Y+AhEglAUz9IZ8qnqEpUE15Tm3mKculKM+LuNYTate02/Hz3MimTtDkSd4F
         bQMqUhVsx6YrKSzbD9yyybdjk+FETcusYv4xI4szV0yQbV4REVpLXILxY00EuA70+PwJ
         47Ivp2TwxkVeOnK9w7Tqti46/3+4EOHMj5CBVX7G3hErP8BnLBImewlfm3GnIh3u9PxL
         /BATcxnlxvW+F0LG9rpEWExF82XUuAHI/HMrIozGEz7LxKzBewzSAG4D/HUvV7OWxZCm
         501xz6/xstu/KyYYu22x7QjYE3Dzd/yHT1hQ1fORFYc5L5aVx86PRuqaPeC9GZmijjak
         gAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793495688; x=1794100488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGXYQaxTBIJGlm9+hLcQgGKVY+JNn5AF36EC8fQCfG8=;
        b=v7A15cFKEh4NGY+B273ih2LSjHQh/WSAMxYnRHgtuHV56LkpArQQizf/bjdewPbnTE
         0ZGv2BK6op9VW9CaiS4BVaMhjRFwNfuffd216rfgOZRV6urxjgDo4MMmQFUYDnP8yFSR
         hcfL3JE7+agwhgBQN/9FJj2MUJxEVwXCoWYlwQCJMEZrYYkUzjZUxBm4LuM6YNWqW30V
         8fdbJLRbzP2pQdIabOhQOH2TovMKRIo5lxgMzG5QJV+YjDYcyAKOO7ytEK6ayDo1n71J
         TpBSRQQz2IQ11y35hItdo9dn1+1d2pRZ0WxFuoE+EAeMUFlIW5mwd7FrrfiZLoHL59vz
         r24A==
X-Forwarded-Encrypted: i=1; AKwUvByX2Qmob9Ur8LWt9nKQB99YTKz5VvY0qqOy8AUCGaq+BmySQwDf7ZRW6R3O4SrUJVu5RKMHUwIWV1QrBJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIudvGjFRDd5oP1efI9dKSsg6XzmjsFgm2Rar2I6njx9Mwo9pyE
	s+Sfs9B5biJFyy5l2NZbBHoBRsdl7bgf66oyrtQ3YPEECyWZ1Yjq2XkU
X-Gm-Gg: AYBFou1p1O/PxzTkVA25nBaKlThuCDAncdYXrRkQ1uCHY3w5w8asxQFpma2NN8SfmSO
	enus7nB7knkJguyN5bhQlqNQJc+FQJkcWJEyje0iDF7+Ssf/i3uPWCe9Ujdj3xsV/lulrXOOJpy
	rr42+c5wJb4jrpLjV3mgGOEN4klL/aXQTYJR2Q0+PFu67QDXyRv8dVUaQIkti8xov3jt4Gs/02X
	h9Vj0YNSvNBcNOQhdRWbkrGjZnGYt5dCbXh9Ll6eXEH130I9NzQnO3gd5U/h6tO8HjQDZv3ltNU
	FcbvcV4vVZ30Gf9BWjkj6eZ99U3YeQrXFANwyEev8yW4JlcFokxL4ziOEbmzxLG/kkmimNck49d
	8C1X8NGniVE0di/JOWtRF46bFJHV+MzsxKyQSkxdG/1L6Cu1y8eYhGa5xKtWKtc0PJuTjCBaONq
	wz6cJq5YdMTB5GuntP1jPxUNLR+gGT6tAfa3mAhUniqiqQMGbqhkQZB0TlFwK+0DrtAXGDTlGNZ
	mqeBg0t6IgcNpgvFiaRuFs1dRQUut6VLrv4PBe6GdwKrjQMSGDqMmxe2Ct+BWTWbuUOSu/zBqdD
	xrQhOjSIdNem1Xlqr9Ov1cZ/C5RZRzAi60F3DHvP
X-Received: by 2002:a05:6102:50a5:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7d072c2b96amr1629507137.6.1793495688605;
        Sat, 31 Oct 2026 18:14:48 -0700 (PDT)
Received: from linuxmint.. ([2802:8010:9a2b:a201:7173:4fe:efa8:f823])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07738ebf2sm6893584137.1.2026.10.31.18.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:14:47 -0700 (PDT)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Subject: [PATCH] HID: wacom: replace sprintf calls with sysfs_emit calls in wacom_sys.c
Date: Sat, 31 Oct 2026 22:14:39 -0300
Message-ID: <20261101011439.261812-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace 'sprintf' calls with safer 'sysfs_emit' calls in wacom_sys.c, also
include the header '<linux/sysfs.h>'. No functional changes.

Signed-off-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
---
 drivers/hid/wacom_sys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 628372ab818a..bb51ea4b34f8 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -6,6 +6,7 @@
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
+#include <linux/sysfs.h>
 
 #define WAC_MSG_RETRIES		5
 #define WAC_CMD_RETRIES		10
@@ -1838,7 +1839,7 @@ static int __wacom_initialize_battery(struct wacom *wacom,
 	bat_desc->properties = wacom_battery_props;
 	bat_desc->num_properties = ARRAY_SIZE(wacom_battery_props);
 	bat_desc->get_property = wacom_battery_get_property;
-	sprintf(battery->bat_name, "wacom_battery_%ld", n);
+	sysfs_emit(battery->bat_name, "wacom_battery_%ld", n);
 	bat_desc->name = battery->bat_name;
 	bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	bat_desc->use_for_apm = 0;
@@ -1928,7 +1929,7 @@ static ssize_t wacom_show_remote_mode(struct kobject *kobj,
 	u8 mode;
 
 	mode = wacom->led.groups[index].select;
-	return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
+	return sysfs_emit(buf, "%d\n", mode < 3 ? mode : -1);
 }
 
 #define DEVICE_EKR_ATTR_GROUP(SET_ID)					\
-- 
2.43.0


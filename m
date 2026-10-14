Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F741A553
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954817; cv=none; b=mCLnqu4guVsjAFwS0Nsfsx2bOTD0C+Kmiea94B8zOVadvVKtb/TDXe8TULR3+i9GDEQakGZu+yCeof+ESfYATKfZqGCEfNa4MlqdNWGkVNUK0HVU4bZdtzVfOdG2p3nn8Avmq6ZewmzC+oFjfg14kQFAYYDWAU84E2hR/sv2eBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954817; c=relaxed/simple;
	bh=BsCd/p+92JCFyO49bm4mtw7Xu4yqQZxntzOQK2m+Elg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4B3pTDzcp76amtT97Zn55lCNp9LOVpOEmO8Tj9eSNxNxZL6UApYJvm8RcPRj0Ly9BQGHqrXpcC8p184G0249we0e1BS79JLj1OYnawjUXF1rPHHUvnM3nrFIuyINaG5KRVhetbah0MOyoupIeTDhM35hQ/6MoaRWmmSgR/xCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt1FMpDH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt1FMpDH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35d0be18c71so502209eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791954815; x=1792559615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgygfsQHTZI8G4sHlei5a+B9qQmQ+LvDiSWfdrEvdyA=;
        b=gt1FMpDH8k9MXQfp5Y/hGYUqikW5ojr8C6o6vYh447sYVqoKjolTnLRmzX0Ie0S4sT
         awww+0tiFvTcpuV+F39j9OPDKsXOF9rNY3J3CRasvYxI/ZIPR6v1+r2uQb6MPdPDeNMZ
         A3GmJdyFDDetdfF1GVKrhmvYhFrczwQeVBGT2NTv0e2esP4DZhQHYfaFbi85f2LPC/Dw
         n18gdQie4FBTqmu3PJsfBojQPSeZhqWjfrD3a+FcCO7AtKlG0cL3LrZmV8Ntp9DqvQcc
         NofHTkMijSSlz5rF8ZGES5Ojz1aP+MrvhqjNGCHqmwy6bWlH8Vf+kwcNTrcQgTIqihSd
         9yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954815; x=1792559615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgygfsQHTZI8G4sHlei5a+B9qQmQ+LvDiSWfdrEvdyA=;
        b=Do1Sk+pQgfaxROf3mphFOpu73wfoGWmWcikUzAZAIHwZSqBvtKtAXKGmUB8H7A1Vqf
         MLTG6umxUbwZ+TJCQTgUYQ9R2jIlp+LWuLFJ4r6ofT9yLbBMvbjuvkEpHQmwHmr6Yy9c
         G5E6FAgH5KIHNMBJzkeOwx3H0D0jkR6YI0VqFjfrVtBj+Nk47ee72xvqjW0GP/ko/mGp
         85TKFEMu4j46f8ri6MnKo+h0efO4xof5z5SeXZK63ucbAhbclszqU/ErUmGn0moSKaTF
         JFwKbgs5pKeCIiZPgfoB2AX7rrOOpjzUH0qovF7kP94DJrGWF2psUS/iKAg0f1svAcMn
         LN2g==
X-Forwarded-Encrypted: i=1; AKwUvBx0L1iq5FXL8jGrNdXF6qhJ6AuktOK+i4X+9mZSAzqmJcIGc42yaIUYLG5G9v6Yx16wwvVrL8Dumf6nCoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE8shWM9LYRXB1Hq72ESVIrJfN02G1zm9odBMfBwg1r/78LZ/h
	Z/p2/2V8Q1tU7uS6Rh8hkqioIKinfEMSRRwJhkilXVaK31b1P9nTpWFN
X-Gm-Gg: AYBFou33L+3FlL8599F8yHq2UuP9wCCOxIbU/34RceznTHzClTDvMHlFXgHxF9dmzLJ
	0tGfaWUadczISO6S0wu1PCPR+GNcWu283zwtzILE8ub3mt9oyxr4D7KMuXxtTY9yRWhUhqCltX1
	G06WDLATHwMrH4S99+PUfWXOBVFZpJbSdOO7Et74abMjksF0rKRnyK8Lny28pLf2u4ycf9HAWY8
	kub+a5GUHAgqEUxmt7hGue4WTakmyDPTdZfJCirR+ZV/aJmd60b/jmwpwlCvUMO1lQObgjMVK+M
	4CJtuUEKFtW01yw9RplIGy3Ecazu1Mt3pPxh38/LMrPZ/rpgiWlHokMbZKURBOsGxKtxL/mCKfV
	sMgyinntYIKuNu7zlgLAg7n8+ybETOHr06N5qaLzP8fHteg+ozEC4BQ1Udp2dFMNZxxL0F74zkX
	0ovZ8qhwTdgr6C5+l2V5ifsKE1w5/enPdkZ7vURqZL/qFPpexR7cJZfGzMDLRj+eHAEShlWZVvQ
	4zhTjka6TpVVQ1I52jeEkzUnEa4iiGXudWJJHUVpCVD5m196eKgUVnO3pJmJCU=
X-Received: by 2002:a05:7301:7d19:b0:353:7b3a:1c84 with SMTP id 5a478bee46e88-3537df7772fmr21604804eec.5.1791954814795;
        Tue, 13 Oct 2026 22:13:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm51629125eec.21.2026.10.13.22.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:13:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Rishi Gupta <gupt21@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	David Barksdale <dbarksdale@uplogix.com>,
	Andrej Shadura <andrew@shadura.me>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] HID: hidraw: Introduce hidraw_instance() helper
Date: Tue, 13 Oct 2026 22:13:22 -0700
Message-ID: <20261014051326.3784498-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
References: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers and subsystem helpers need to determine the minor number
of the hidraw node associated with an underlying HID device. Currently
they access internal driver data and cast the hidraw pointer directly,
requiring drivers to include the internal hidraw header.

Introduce hidraw_instance() to validate that the device was claimed by
hidraw and return its minor node number, or -ENODEV if hidraw is not
connected or hidraw support is disabled. Also use the new helper in
hid_connect().

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c |  2 +-
 drivers/hid/hidraw.c   | 15 +++++++++++++++
 include/linux/hidraw.h |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index ec44d99fd416..c430f2d0d779 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2346,7 +2346,7 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 				((struct hiddev *)hdev->hiddev)->minor);
 	if (hdev->claimed & HID_CLAIMED_HIDRAW)
 		len += sprintf(buf + len, "%shidraw%d", len ? "," : "",
-				((struct hidraw *)hdev->hidraw)->minor);
+				hidraw_instance(hdev));
 
 	type = "Device";
 	for (i = 0; i < hdev->maxcollection; i++) {
diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 9129fabed181..949e7546339f 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -665,6 +665,21 @@ void hidraw_disconnect(struct hid_device *hid)
 }
 EXPORT_SYMBOL_GPL(hidraw_disconnect);
 
+/**
+ * hidraw_instance - get hidraw instance minor number for a HID device
+ * @hdev: HID device
+ *
+ * Return: minor number of the hidraw node, or -ENODEV if not connected
+ */
+int hidraw_instance(const struct hid_device *hdev)
+{
+	if ((hdev->claimed & HID_CLAIMED_HIDRAW) && hdev->hidraw)
+		return ((struct hidraw *)hdev->hidraw)->minor;
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(hidraw_instance);
+
 int __init hidraw_init(void)
 {
 	int result;
diff --git a/include/linux/hidraw.h b/include/linux/hidraw.h
index 18fd30a288de..3021454ba513 100644
--- a/include/linux/hidraw.h
+++ b/include/linux/hidraw.h
@@ -5,6 +5,7 @@
 #ifndef _HIDRAW_H
 #define _HIDRAW_H
 
+#include <linux/errno.h>
 #include <uapi/linux/hidraw.h>
 
 
@@ -41,12 +42,14 @@ void hidraw_exit(void);
 int hidraw_report_event(struct hid_device *, u8 *, int);
 int hidraw_connect(struct hid_device *);
 void hidraw_disconnect(struct hid_device *);
+int hidraw_instance(const struct hid_device *hdev);
 #else
 static inline int hidraw_init(void) { return 0; }
 static inline void hidraw_exit(void) { }
 static inline int hidraw_report_event(struct hid_device *hid, u8 *data, int len) { return 0; }
 static inline int hidraw_connect(struct hid_device *hid) { return -1; }
 static inline void hidraw_disconnect(struct hid_device *hid) { }
+static inline int hidraw_instance(const struct hid_device *hdev) { return -ENODEV; }
 #endif
 
 #endif
-- 
2.56.0.385.gd3acb90ef8-goog

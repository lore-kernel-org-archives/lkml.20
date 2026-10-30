Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376282;
	b=oZmLa2pYIX2RBrRIw6KuunXiZT3EABjT7EAKth65Xf5K+gY7/O9I3n1Zr1I01GQDLcSa
	 YF0V0NiTKDWo1bs604rtuBmjNykz3kV2XTArHkOqBQO3wvWvrjKgmdOoxXSq2oLAYhT7M
	 gT9BpwXWYavjer3tquLx4iHj5TntwaG7ro8FqowSfLwr8J/GVCcGvmi3pIKVqe9Mwrt0w
	 qyzkpqtAAMQFOvgESdoYkzWymAnzi7K2yYLIgGQ//EAjsj8zKUSCiYnG99wTVteQoG67o
	 zGqpmKInY/p+16mBnCA87ROhQ/O3MK5mIOr7v97XGeKpKJRzVS4TcKOZoMekXq0wEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YrMhf9sYvw1O8UTtnQh0bfur3Nsf4aQfxFaN/MKoTvo=;
	b=aAXxh7pC8AuUBjCZCkeaCP9DLso8CyJ6vJ1NYigauROTuaEEIbQ9TV1cYN5A82VRI5Km
	 //kezqOGuYF8on5p9akOqicQ4Lg3sy6836hOL1P1Kzm8gJ4W7ihazVGMVwA97IBsSmAFZ
	 02nMsWpJKHDi76mso9wV8j+76ttUf1HGlTFBECq3V2qnkIwVtZlfUS1d12HbD9557kFJ0
	 uf6CoMg8ECp+QzQkKt9+YmjCDNlSTrgUVCF0A+56nx17za84T1Q7Hlre1W47R306WBr4z
	 w5OIWZaaETATjLCg9oZxXfUVko2JqD2cuFUSddy7K3DouhLRyW4n7pFLGIoW1qtvM0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xkb01PP3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C06606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xkb01PP3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso9440105e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793376280; x=1793981080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrMhf9sYvw1O8UTtnQh0bfur3Nsf4aQfxFaN/MKoTvo=;
        b=Xkb01PP3BZXnm08FFX0xPn5IW6hJMkvH3iq7ojaW9hiFMN1RKXbZ29dTIG6LyP6K6u
         GG48yiPfhXcZXmKtlOXMzyRs+5Od2/b7CfB3jRU4Q6fz/SUFDW2Gd8QzgowBLFa9mc2n
         qhYAr7JU2n8udy5QS0T3gQ84beZjPDgI5JXwr9kpAz+hoWdQ84gnpY8xa7QDKjm5Eh/t
         SJC7zYF+pirDKTRrCpzyL7jvcpuk9ELTpAbO1wVqA8U/HTIfo1I7WZ02DPA8gtawHAdD
         OsM3XS4w8MH3dseGAXp0dMMZ+5WAB14+pb1Umto6wtNJM+W3wSwyRLihsAOr4cSU5oHg
         L6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376280; x=1793981080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrMhf9sYvw1O8UTtnQh0bfur3Nsf4aQfxFaN/MKoTvo=;
        b=IXxFZvPoG9WqXI2Qdi6OYcg3nfg52X5PO3eIMZDYBS6jVI5ORN4LheJrxadCWfFdcT
         iB4bd1xA42ddelSQeG87y4p7g8PAJMYwb1N2gLMYqUDYbFOE9L46P9Cigv5cuR1aMct1
         AwCu/DjZpfydPPvYlw1dHFXUMF8xYEsaCUaPVsF3QQHh6vrZZHwXkbytrxGVI4+rrYw4
         dVft9xy5iFcaWJ6AtNNg2LcdSkRN2x6XK3c57f12q9XQISOJIHgAzYNTK+gMEfz5vpVX
         3ClitgaphLW8LMqWMM+//riPmjH+PtqqiUSf69sLJ1rqc4r6+FCmGv/iJy3ipeXH1dVv
         icCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQB9q8//x8gV5NAbByb4gbI/wsto0k2Bc7m37d3SzqWWZof9uh6pNcg5CuderFwzk4gPIovic1RPF7Zxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzyR++m+sVc6hRIRZDsIB+XaFUnI94rQmemgguYPb++doaXZSw
	U3HKYwrdPBbOpXPa9/42HsvcM+USsN50MhWAqFLxZgZvib5vuPSpsyXXAkocP4TQ
X-Gm-Gg: AYBFou0yHpkh/RS7m1yi/PDdTdUmv1o2V2z9uVI6DhcmU4e3Y4olVRRrsVHuivpfbnq
	2JdwjjBYUEB2IZr80eXNM9cuzBn4O5gyuVb0toQrCAf0VOvUP7lUQjqPb0cqIzrVULCz/bd7nwR
	2NYu/hQYF44JngXKs1bJLT/88UK/lKdnSOeMdIieKtEnoamMEy6yaeBJpaQ7kvKGG+1X+ijjL3e
	919QOnkDeAIdlENe//Wni8fIKLnzsB2cNy8wBKCfowd11KeA1/5j13PsfT92b98vNJBjlQ8o+x6
	oxP47ZAGVn2GjhSJBLveCwZwiVkkvze0DFqQUf4/tejpHiR6DnouWGAGyJp7Kidmnl/FVSu8kVh
	KJ7KwWj7N3xdEzbMPo0rCfC8th+KsfsDZz8DEYLrnHvm1DTUt1mWu03uP/SeHhbbGoZVruealx+
	82ilQ3s/YhUFSS83HVh+1Z8BmRK9M3w4Yi5aoz9uiUp3Gfm02Mo9foUo6EOiftFIIgUxrA6ayqe
	FPG0wEnDjVrFiUtzOoxdypgcWLB+0DFYsNTtl52eVP9PyBzA9k9AFfrxqqeuwGWe51kLVCmg3Ly
	sbP4l6bbbKrZhXyuXpKnQwEaBCdh2t2sXPcC
X-Received: by 2002:a05:600c:46d1:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ac17b2c8a7mr59295205e9.25.1793376280342;
        Fri, 30 Oct 2026 09:04:40 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:199b:9e97:7f91:63a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm4069688f8f.35.2026.10.30.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:04:40 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] gnss: serial: power down active receiver on deregistration
Date: Fri, 30 Oct 2026 18:00:45 +0200
Message-ID: <20261030160044.2496071-2-thnkslprpt@gmail.com>
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

When a GNSS device is removed with an open descriptor,
gnss_deregister_device() calls gnss_serial_close(), which releases its
runtime-PM reference asynchronously. gnss_serial_deregister() then
disables runtime PM and can cancel the pending suspend, leaving the
receiver supply enabled when the regulator handle is released.

Power off the receiver after disabling runtime PM if it is still active.
Leave an already-suspended receiver alone to avoid disabling its supply
twice.

Fixes: 37768b054f20 ("gnss: add generic serial driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gnss/serial.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gnss/serial.c b/drivers/gnss/serial.c
index 0e43bf6294f87..e1fb3dcc5f391 100644
--- a/drivers/gnss/serial.c
+++ b/drivers/gnss/serial.c
@@ -203,10 +203,12 @@ void gnss_serial_deregister(struct gnss_serial *gserial)
 
 	gnss_deregister_device(gserial->gdev);
 
-	if (IS_ENABLED(CONFIG_PM))
+	if (IS_ENABLED(CONFIG_PM)) {
 		pm_runtime_disable(&serdev->dev);
-	else
-		gnss_serial_set_power(gserial, GNSS_SERIAL_OFF);
+		if (pm_runtime_status_suspended(&serdev->dev))
+			return;
+	}
+	gnss_serial_set_power(gserial, GNSS_SERIAL_OFF);
 }
 EXPORT_SYMBOL_GPL(gnss_serial_deregister);
 

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0


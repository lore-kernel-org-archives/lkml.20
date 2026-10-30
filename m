Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381505;
	b=M0qYaU63+JfBT8LYN9AuocMlSec+liUFppgLjO7UJxV5s2N8SBUOXeuJl/Xjcgdsrhwo
	 HD0BCogeBH7vJRSBahAvKynmylyHLsMWrxOQEQC08bvWaJNuFxuVwqi9cYXNnykoR+MaK
	 FkqST5h/bqoqJFEChyiS4A1nU+uCzr95hSjgl01vUKJOzMOu4sFlCKQbCAZlSyP0CQkoD
	 rP1JYMFVl2j1gnDyG2kKq3OAUkpIvWpyjftlbdSdvwNkQ4wtjVS7vURilE7sVeMkBR1lz
	 n8MaRFGrc1GWiBaPjrbdNbQobuwqcKYgbND0wGfjvWtQmHAxtN50RCJD0VjO9yLl7oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ubTkJ5xNAMqXDr5I2OlO8eBXHLgCkPpSg0BGTZDzc6c=;
	b=Xcab5UFRElpUt8US3TX1gD+23ivBEnFbZrbIpmdBcnkYY0FE6E9CqXo6A7cfiKw/xpCk
	 eqURMKlSkIA5n3RZ9AWwoIk+THDlrcWrkZekb8Y5qw9mLrrkASv239aa/T//teBsqQE72
	 VG9sRHxjMNlLGCwt80k1HvIVA0FZYEeVy6Zc0gKK2pqF0NPyZTWaTgWyiZceSQ4Oo9F7Y
	 zpujQ4ECOpeJOWHMlUn5FDGR+GtnXRnX1eeT5WUS+pVN7HcYeU7k7safqP7RYvuG/P5S/
	 Oyl7D9Hg/OEwDcw/bVPBbUB6BNRu2cANrzKffV/pj3b6ePqCfD6s8hswyV3QIzWtscw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPC9cOpq;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPC9cOpq
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so296617c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381504; x=1793986304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubTkJ5xNAMqXDr5I2OlO8eBXHLgCkPpSg0BGTZDzc6c=;
        b=SPC9cOpq7Lah9VzIYCwPiKKmaHbVd7dWuCkvAhK7n19QzKJHfJxtPDO03GRncp+Amg
         l//qlsmSEm39OFAOJal8xPJmJtvBMIGFpdIMXpA9xqecukK0VbtV7GXgIl+LW0iCKiNN
         mPJWFwzYGelfpLYX6Vb5SwPIy4Fz6rc/gDwzG4TEmVFM0ZwVVBMs/M1vFSQ7xa3nz8nU
         qDUnY8i0Iz5eTxpzOxIRefJkEc95PiPYQknXcTDdowJPvNSrUyim10/Lur3qHT8OMNjv
         HWZeFU/zulWZnp+Xn1pp3bLzAvmIKq+pAcwUjM6ss/l/wblMvVZ+zOEdkJZLPQ7PScc2
         jHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381504; x=1793986304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubTkJ5xNAMqXDr5I2OlO8eBXHLgCkPpSg0BGTZDzc6c=;
        b=seVoGyxb3l8sbcBIyl7RrhpDZptKLmTU/MRzpt302Ch/XtWmkCafuYsafM+g5KX3gM
         BucoMLvb1ZxeoLBhCONe78wdF1gwL42A9egx0kaHJ6oXNz6FDpYUrAaZtSTWtBDDy9+Y
         VqzlNy9KqLBV77xMQ+F9woUrHUwkGbkAQerv961YxxnuXv6Kc82FJcA9Jik/uqeKSVIm
         m8BnWlg/dlTMh2j74p9jqsY1Btt92E0SWOQiZxNffKO09tj3RiWeewns1FBvL5DrPQOl
         wE800WhvtFUh8z+et7dGMk2eyLA6w/ErXMTQ9AgWafFvcTRKf504GWdC0bfqD8bxt8MX
         ks5w==
X-Forwarded-Encrypted: i=1; AKwUvBxr+AZAGCae2pPlaHgQnvL2XX8Z2o9ZrPy4woSDxbzGgAQizJl4KOWpIEj10WdokbHvgqvkP9XtiFFzDHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8qizjOqALu9hKHnRXYEnwBh2XDGb4ngvWdOOeSNkq4mptVmEA
	Y8ENTb6sddrwzDm+AkWdt7C54y8mS1/l+35fheHZUBf6bbUHAO9vsabmfDneWA6MzVY=
X-Gm-Gg: AYBFou3pPWByIai6JXH2dUVO/Dt0K1CMUNXR+lSnfcVzXBtbAaL6fRiouFf6Fotzkrq
	SH4D0P0qWlNxwIa0LijbKDgTF99d0w+LL24d1V/ZE9GsNAvr7tYh1S3B6bOOKbuiwvleE5BQPNJ
	H/vsLPBQ8xgkO1mV59qX+NlQ4p6VkMltWSCaUs4jTf2hBAdvv+dIy0M7ZKPXKi+BFWScXkop1tf
	CUeNrwRRrZ5f+iY94OGFTZMiURUJjOwLViYEymjMHof7cOco00JvzkAFM5e0M/Ifdu4RmvZdeMN
	NxRxiJA7n1u4w8iyamlMVVrZiBaX5ZYUGLoPHMl3o3+BkRoTnujTpgnRpKlJH6Cud09WQ56xnSl
	oy73gM/xJaZKN2a+LhsZGWqm5VVFxKTH9bMm5Z+YVF+eLaEYiZgig8FLx4TN+UL5PukSsMDHlbo
	42xxJrOuQknQWiPrs8u1Bcx8L80EVaidgOlQcsY5msfFwp/EtswMU36/uM1qQK8TqzgqY4Cdfj7
	Tm2wx3lgBvol2ABRM2gmvaBKRORn1CMi/eoDbs5VForT4L1QbhMf56M241RgLOiI22NrniI51qq
	HBuZjF58tTr8a9bjzQYSNDocq7yMjQTDvWCG0jVmd76/JyFw6bE=
X-Received: by 2002:a05:701b:428a:20b0:17b:fed6:7449 with SMTP id a92af1059eb24-1ac5da7725fmr4282799c88.47.1793381503588;
        Fri, 30 Oct 2026 10:31:43 -0700 (PDT)
Received: from 1ndr4th.debian ([45.112.151.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm7844437c88.8.2026.10.30.10.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:31:42 -0700 (PDT)
From: Devarjya Purkayastha <unseentactician27062006@gmail.com>
To: linux-input@vger.kernel.org
Cc: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Devarjya Purkayastha <unseentactician27062006@gmail.com>,
	Indrath <indrathftw@gmail.com>
Subject: [PATCH] HID: wacom: Prevent NULL dereference in wireless work
Date: Fri, 30 Oct 2026 23:01:08 +0530
Message-ID: <20261030173108.45408-1-unseentactician27062006@gmail.com>
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

wacom_wireless_work() assumes that the active USB configuration has
three interfaces and unconditionally accesses interface[1] and
interface[2].

A malformed configuration with fewer interfaces can therefore cause a
NULL pointer dereference in the wireless workqueue. Return early unless
the configuration has at least three interfaces.

Reported-by: Indrath <indrathftw@gmail.com>
Signed-off-by: Devarjya Purkayastha <unseentactician27062006@gmail.com>
---
 drivers/hid/wacom_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 628372ab818a..dcf2811a5c48 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2619,7 +2619,7 @@ static void wacom_wireless_work(struct work_struct *work)
 
 	wacom_destroy_battery(wacom);
 
-	if (!usbdev)
+	if (!usbdev || usbdev->config->desc.bNumInterfaces < 3)
 		return;
 
 	/* Stylus interface */
-- 
2.53.0


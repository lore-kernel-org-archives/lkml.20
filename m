Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223702;
	b=vowOyrQJo5C4zzucuktrB15wCEjwVi9H8KSaaUCmYrnw4SGjT11HiC+acA52C7w+O4ij
	 yWZP4AAdGy1Sb+v04e0y2Ysl5YMsboHw/OoA+/kyfC9fkHjBpvWqbCFmomkhTSSbyMWCN
	 j4IAY5ypoZY3dGT0mROE2E8hmDWh+v2eOzJGf40JB5S06TpVKeNx1+8tc6GL9gX6M71oF
	 4PPClRLbC16rgWQRtUyapOqMKnxbeXBikemcqbf2z7uQNFfy7X9elb3Tvzqsj6NPdV8Y5
	 BOd3iqJV+UwSHh+3+NmjD0opfa3x9rn8wV5OAfHZj9xGFK4jCLydDB3d+8GCmQ2c1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=vJt9Zs++3CIsxa31Uc83wqlGjxi+OPKamW3/Vd5hqVQ=;
	b=po6SMaGKdT7TBwN1b6myWp1lSnsXQsQ6pSYcnADsD9JH8ML/P4Kz+k8xqKIzBbODK0qm
	 UKmvHYmR/ttmwYvM9XYFlqCqmU7xI9OT6N96sFcFnA7TNgZQaXSNa+5fDuIXoVY0wzY/M
	 +2IDKmEpB780bT9rhsM8qlf4dTPqmq/BNshxuqdfEWdAYohlgt1si50j9+2Fi5fMZBgyO
	 wYVSpNq8jcLE2JJxHFUkY9UQMzI8UT/J+0iRLUn+5ORHiDsYwAH6T9WfTi7DucM78AjR/
	 ECf5T6D9gR94kFVkZFCfkuylz0gLyuvORnFqrWyMIUdJxcd8PnaV7P+nAzpm/qP0MwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvhH9O6W;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34DB606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34DB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvhH9O6W
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfd5771ccso5336981fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223700; x=1794828500; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vJt9Zs++3CIsxa31Uc83wqlGjxi+OPKamW3/Vd5hqVQ=;
        b=cvhH9O6W5Zb6EK4yiSboc1ulF5Mq0KyzynrSJupT38KF2OGAuZwCspGWv6ePQHVHZp
         XjH/4qbeN7lv7uXnYqHCs72jGEMH4OtW/m26dT6mz6i03kY+aO6iKyJ65geYo3HPTv5S
         S87/8eU2slkjSnUQDYVVpmdDG2UnI2nLIkwcndB9zS8Fw+5xF0ptFNhi3W9CZDaW3MgB
         pUH43FxhOAanGAMMtIewpteiCp93JqV7Vt3en/tlfK/tK6it98Pq0lYgWriXHiIRXxdg
         rSnqITXI869l7XnCmy4bOZVFymNYiHHTuk21da/xJ4QvJWdKFUCu26t7UXR0EFcqrGFp
         ODhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223700; x=1794828500;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJt9Zs++3CIsxa31Uc83wqlGjxi+OPKamW3/Vd5hqVQ=;
        b=vfsa9G7Iex5T+ts6WwlrmEd47z1lbg/FrWNXjlgttoC2c3dG++wteI7x5j/5pKvqqH
         HIUphomf88hCsGhBwUgmfIshG6xFD9+9VHP+Pc5rBKGwn4tJe1ZNRx4HXZI/nFCe8QLB
         g5MtVjZMDZuYmb6yoB5TwF07rzaLjpQRhzaUVB7gE4ThNCzwqs5gXnf14DaOxH+SypUQ
         nmx02Qxb98oriDYWCiNVwuvEqgQ7lTmHB+3Yn1pPkWXOpxpL09us7wPPNdNWFz6GSteM
         R7noNsD1j8LQ/JsROEhCuUNKg7f7xuoAhHDARJYEVsgUa7QbSWuhF4qyhtvImrsuWNoa
         Y1eA==
X-Forwarded-Encrypted: i=1; AL+hErH48yYK5WudA7Eog4bJ3/S32DHOJ70wNZglDYwG8gnOWDJun8cIp/ru/LVvOFT+JcydUGIxunlQ+ey6sqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mb6+5usi+XsZeehHnoNcMeCOMuJ0FjRZ2vtngbgDiz+/vpdts
	9DQ1Q0eqpKPJNC60DP7fTuax1qQ3YsnjDzYW7N37JQGI+WxLZkWyyu946HkU+Q==
X-Gm-Gg: AYBFou3lfDqGYKa1QG9nimPKtBE7WgRrilJdWKPKRSnCN5CQFdb5G4r2IVL+YALxT5m
	72ch+rbtWc1XsMhZ1DgxsEw8+ewG4Xfn35GR3AE1Lni2f8pziCwn+cHAZur0ky57utf+ayiVcvK
	Z3+UsBv+7F8VuT3etTvJCghInE505pugvkUkBa1ULJNvYUR9DXfwynSdAF/jj85NZPCDi1qICfI
	W6cIsd5ndwT0Z8E+diLJlgAL28e6kUwzCppDKGhQwrVZftPGw/XppAZj0Q0h/EGLfN0LZU0seZI
	VYH4sQo2H/TDfIpiIqa9GxdPsSzq7hqZhXcLcoExfozHFkK5kJuz71uairVGERBPGlEPV27S8RB
	wDz5qnZu7/Od1s6nvG+f6NaIweCPdPsF+uxo3rPWPuKYkE/AcSs318pegepoC3mD/WWL8xVpwGr
	nEcVlfw0RXO3nkdWg4Xss1ijBpKAMdiJ1F8+7+8eJCgVeh7m+Q5k4DbBmQ+Ke9r6slJntZXecHZ
	sE05lr9lBW8FLxpaNMGVRDzCgHCWIyg+kj/dQ2qh6tdIc+FXubgGDOOWsggd62RhsQlpNU/yip6
	FNfDTHZPJKsaCdkVP2s4sLCWQTYwvZeH1Krl6CYcZ/Dzw7toXF/R4dTj
X-Received: by 2002:a05:6512:234f:b0:5c0:da4:7806 with SMTP id 2adb3069b0e04-5c14bff2f1cmr1076625e87.11.1794223699768;
        Mon, 09 Nov 2026 03:28:19 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b81ad1fsm803057e87.61.2026.11.09.03.28.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:19 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 2/8] char: xillybus: Safer access of unaligned pointers
Date: Mon,  9 Nov 2026 12:27:54 +0100
Message-Id: <20261109112800.48663-3-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Use get_unaligned_le16() rather than dereferencing unaligned pointers
directly for portability.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260805093436.59740-1-eli.billauer%40gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 56afb0a577af..4c53d808737a 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <asm/byteorder.h>
+#include <linux/unaligned.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/sched.h>
@@ -1960,8 +1961,8 @@ static int setup_channels(struct xillyusb_dev *xdev,
 	new_channels = chan;
 
 	for (i = 0; i < num_channels; i++, chan++) {
-		unsigned int in_desc = le16_to_cpu(*chandesc++);
-		unsigned int out_desc = le16_to_cpu(*chandesc++);
+		unsigned int in_desc = get_unaligned_le16(chandesc++);
+		unsigned int out_desc = get_unaligned_le16(chandesc++);
 
 		chan->xdev = xdev;
 		mutex_init(&chan->in_mutex);
@@ -2108,7 +2109,7 @@ static int xillyusb_discovery(struct usb_interface *interface)
 
 	/* Phase II: Set up the streams as defined in IDT */
 
-	num_channels = le16_to_cpu(*((__le16 *)(idt + 1)));
+	num_channels = get_unaligned_le16(idt + 1);
 	names_offset = 3 + num_channels * 4;
 	idt_len -= 4; /* Exclude CRC */
 
-- 
2.17.1


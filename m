Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698578;
	b=vt04H41rg0RemURJ5WkXNccCNQLZEHDUkne7YiYYUpu/XyZEh3cVVjPirndcXAcyFVCl
	 16TJlr/RpdKgsqPJahTlttIzx347hcQpUbNJ/MmR8/SyyLELItFmXMIPT8+Gv6MhI8KcX
	 yjC0J+n6tDnAdIx75Gr1MlRrp0qaBq7dS+LXeZXyEb35ptulR9CJs9BsGZlHllU3w0Mjg
	 bPWyjRSlw03W1duQ8EPjqSQzw2+ncZm7IlTE1CEQc6FMwVPcxKztTc04Ywu3Sw+P9SLVI
	 657yrEWZ3aYQh5Cy8URsw87p+6x1jf5Ep8It2zDKwuEd42ySg7/FJL9m4e1mLl7flXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
	b=qLK/ZAtXvkMMN/PXDf9vYzdKMlIXJu4kT35VelE2BUALTH8fjjQu217NgmoG8SkZ0cdo
	 6C4sOpJHM1ySFSL4CetHEqzwsT4R9JKBC38Dy9Jenp48MSPygyhA7bUA8SXIAkgajg9PP
	 AdjG40NL96jCIp/MUjjsndAWMUHH5Oijtv7/lA2bSNZBxhxuOQDzzC1XYwDAN1I+K7xQC
	 ZB14PaoJj+p2tRL59T5vbqlkGBPyBGhjP+uVJf2vutmVFPKBqtufWKpL/cw9NaEdg7kla
	 NqmKkSBWY7C6S4JTDdC3PB1tcAI2yPqw7sYy6l9sFrNvrdoCL/+8IwGRiIR+9naJ9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vxdu6+V0;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A797A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vxdu6+V0
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so728056a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698577; x=1793303377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=Vxdu6+V0vA+fYQQXhQwaqACCGwbPcpTPmutsisVoDUELNZD/LIwcGgGUfTJPW09cBf
         R9pAsA08sopxxSegk7pl6yGfEg5f5yR3a8AvAcgEo1EfeEUXmkgufrSkN/bUEdToZeBh
         PRSVq3p4Q8QuMX8kqizWyK/CPlrt6M8/x2/ZU2a5KuGBPaAh6DNkNMsFfqKrQoP/ZN41
         7Y9dXlld3x20OmdF/NzZ0Bemk0LKuPq5lG0Rf3SrHtPJ3JhTHaT7/jHB7g8TkYLG3HCj
         +dI3XMv5j40fd1sBKMAqojsqG+iWl+bMQBoVaut32oHmUQcPbED6gjKCxSzjgbeIM2jX
         ANEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698577; x=1793303377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=QmKO18WGSj3rqPrtJ1OHskjO20pw1szXMlj2dK0EAj0rua0iOZVa33bhk1Tv9FF1N3
         bB9JRzig7fjFOWhjgR9konDYCfuV30eSH2gfgS/sd2HznYyMZyp3XKQQr0mzoLIe7IWC
         VE3pGTjsJYRxm3aOavuRJ4Txl3s0hd9fXW/0jLidA8fcEXEbru1JNZXzp3P0ENFgO4rB
         y54Tu5UGyihRdhM4aSvPkGUcpfTHXLtbLezrMl9jLn7NND2MfDiQZvuy1BUpVx5Uguyo
         ImtEunC65LPGmesz9/oGiIvQ/hxj4l7jWAIiPBerTkCV6672r1o0pSqW6nTKJPcrK+WO
         JItw==
X-Forwarded-Encrypted: i=1; AKwUvBwyYz2CEDwjc7sIbpn7vPmilOlaEqck46ITfFeTUUD1DGaelPZEp114x0xf2lwKmXjaztG5N/rRAdvvBlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4V4+aDl6u9pWvLiY4wm1cm1vKzU4bpz56vTxGvyNdIrigw0as
	kUX+aP9DpQeflbCFPmgj52264HK7v1rrFdS0SYXNrFfZX+PXEsmhswD3cE8MsXX8
X-Gm-Gg: AYBFou2S3+lUncWgc7FjP/PzR8TrYWV1sC0yYHom9+JtuUOqX0/8wGA/FTfuWgyTJb8
	7G1qjPYgyExKmWophatFQshxxxrj7sKiv7/YJgha5dOFcWzhFEF1du1Np+KG/+QYreihmyGQk2R
	jMl6ERRqP0BkKJEQmC9K+I6LqplsgrDGZ008+WKm10uAVQv6qp0sCuuZS4bwpGwsD0COJT4Y1LH
	OQCl6IKQhMhhZYkGb24XkafQBWNRC2bjFhKx7GDgeWXHfKGDy9l4MlPNvwx6RLiVlXiONQ8Y2L1
	1j922B8jLuYX6OHHf9j5DAP4sRpxqv/+Qlb/QL30hNhUuhQ9QTx7/WzeXAP+v1em9OO/t3H3umd
	cvc4F7mn1Z3Ie5cEIiSEikSZAjJ/6jMr88kKGelrScWLds6cKNxEVNiP74rrzIswNa2EXlDfCP/
	Qad9B+TnsVuaB2u15twCUGiBR5ai/xPKANOMkReKjsb+8+4l1yM0feya2Mt1QjT6CtcCQrX5OZL
	bNYDakriZt9QfwyKEliJ4fZS1Zv9/bzLN/gdwELWCUABpq2Bff52Vo/sxxFzfGqWIhhve1aRD82
	9SaWIreBWHgzBh9EWAFWyxxE9xcB8iwF
X-Received: by 2002:a17:90b:510f:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ada6c5450bmr1793240a91.8.1792698577022;
        Thu, 22 Oct 2026 12:49:37 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:36 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 3/3] media: em28xx: fix refcount underflow in em28xx_free_v4l2()
Date: Fri, 23 Oct 2026 02:49:00 +0700
Message-ID: <20261022194901.14302-3-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194901.14302-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
 <20261022194901.14302-1-neganhat@gmail.com>
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

em28xx_free_v4l2() is registered as the v4l2_dev release callback, invoked
when v4l2_dev's reference count drops to zero.

Calling v4l2_device_unregister() from inside this callback causes an extra
call to v4l2_device_put() on a zero reference count, triggering a refcount_t
underflow (0 -> -1) and a kernel BUG in lib/refcount.c.

Fix this by removing v4l2_device_unregister() from em28xx_free_v4l2() and
calling it in em28xx_v4l2_fini() during teardown instead.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index d653341ffd16..45b62655ca3b 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2332,7 +2332,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 	struct em28xx *dev = v4l2->dev;
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(v4l2_dev);
 	dev->v4l2 = NULL;
 	kfree(v4l2);
 	kref_put(&dev->ref, em28xx_free_device);
@@ -2462,7 +2461,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	 * The em28xx_free_v4l2() release callback will be invoked once all
 	 * userspace file handles to the video device nodes are closed.
 	 */
-	v4l2_device_put(&v4l2->v4l2_dev);
+	v4l2_device_unregister(&v4l2->v4l2_dev);
 
 	return 0;
 }
-- 
2.55.0


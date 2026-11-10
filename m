Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285019;
	b=qZHqB0O81eb0Qyaq+/9WN0J0XO395SeaII+zvmZJ8GGBfJJsfWjS5InrhfIOnlWf7GIp
	 oEL81XlCCSjNDEy+hnjnNIGIIHidhmi6Xt0in3ebt691l8IF52a6f+j1Cv8L5NHj03pW4
	 mUHbvPRg724zUlyDQus5VHQhJicm4DKWx5bVc+coEy8j3tYKSQJngJxeQ3nLr/KoGd1iw
	 ALPyuQE/q38Frb4MOCyueGgSh1U2ZB6cFoW78xSTZSJh82DYtmyQjriw0yUXtJyokZ6fE
	 Z+ZSvicK4g0uXD6CzRuWifW3U2vvXBpKf8kJpcAqgAyL5x5wMjbF0KssqIoMeKUIfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WsSLHGnK7HTgTyexFfYUW9M44U5fpvmPCQ/caosU9hE=;
	b=nCL5lBT+E4FkVdnOpeah5ZoV61ZqHjsnA91+9F/lizon5tTiHCNdbm4noKiUUlAiPyMG
	 r0AuWJQhkzn62FYloCBRxPNnC46EJdONx9PWk5ON40n/2Z8G3rcVek7HnQmjYcM2jWfzB
	 W65sBwBNEzuwmbY78YITNZQXpakd+zPzGVMIyKGgfRZUtQIRUGzvh0OX3bBKezsI6u5e+
	 uyFw6mPyfIOir6p95QwrOhzgoBteSgVt5ueKkeN112zQ4sl9uYvrDLRtDoBZgHOxvPTiN
	 UFoCtBFl+fBfDhHzProaJWb3sORz4ZAsMh3RUaWXnEnWwa14e5Vrj6SZ+QL1UAbIyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5+fZx9c;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF8606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFF8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5+fZx9c
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f2b8cf037so143531785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285013; x=1794889813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WsSLHGnK7HTgTyexFfYUW9M44U5fpvmPCQ/caosU9hE=;
        b=W5+fZx9cVh5JpgpRFqmhQ3HMG14XtDuE9pttcjkhvhpyLGfdTvvjVe9ADn40mNYN5M
         /X1XSBiKzsql9aat5AR+ALWaLb1dCSPz18Z4MPID0OP7uYSM0U9/18sYyJQuL8n01Hmq
         dOGAOtS0jOYDMd0OTCbolo2maKz1q+XEeFdWu5H7Fgi8XFHsxK+8xSjQc8TQ9rgzpdAU
         06L5ZczAJi+gfWAS+vaahQXdUzxXzO+YWRAg0DPK8PSD8t/Klclr3/qNjLXf45idqFpW
         4VGNIVn0K4YGF0YIKzGTp/Y0IQ69vwUvpKL7xelN+NdBkZ8OO8Rs/PO/ODxWfsFsZ6jY
         XixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285013; x=1794889813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsSLHGnK7HTgTyexFfYUW9M44U5fpvmPCQ/caosU9hE=;
        b=Gz5CMGpyOqhoT9T23Pw5bMRzZ/pSTKXlqXGC1CUioL7K+dxQnHyl9jMFnwglbTLNYy
         MfZPBCrtZ0CU7ls8JROoK/7dkiU3G/IWie6mWQfAFha1UEZ6ifUpwja7o7jY2++T3jkA
         Ly8CxMmUqJTodeONVKUvXf3mLCfb5VomEmz53AFF8ry9//eFWeyR19qHCiVthRULDpao
         /g6UmrB3NwZPnBqnvGEfYPEyDZ26RBTQGP2WcvJNbYGkMuXNIDHes2o+dIdgwTTCjf9r
         o3Bwc/Kd9YJUtlDq8FSfA+plYgUbIyCz56Y4u1SrtjzweIRIQSNVqjvCigfxx6LuNpiZ
         w9Ag==
X-Forwarded-Encrypted: i=1; AL+hErE+9yPQX7M8CU5ue4xelHGDNrP1b+bPTKitzV//R7tKFrUqra5i1Y2Rkx84Rkfj6UsB0U+VK6d2wA5d+TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tYADlQZeXDMkmeVi9uxirmqvGzuYhKSndkbLHkHWgqcN3IhXJ
	heeRhadzvFIRMlz7LCldun7VBC4V7+lMA27NxZZRrCPd8IvO1EfO7CpO21uY
X-Gm-Gg: AYBFou1SRCELXogroZOXNH3C1IWmA1ppHr7R0VNz0OgkzDFQDbdnONK0WFgfabnxoRM
	fMh6nDnckEh/PXiBKX4QZr1QoaSq4VOyW/yA2d+4OyD5QTHFJKZ+fWsJctcsSgOSJOcUB1l/Qyg
	rIVK4P0G+1OE2vuNikgq1VbpiS5kqRDZuTqw6LWz0h9W95W7h2TTLp6dI7CWMfBUe+oAqVsjtr2
	XZpW0OB8G8eLj41OLQsfIDYwyTSyo0liiVGe4eFqUCenJuhepo/TWaLNnYZ4wZjBjqqwXVE087y
	8gcyfavpgscndGjZypKXvteGr3zupDHTu1s8AGNg3SuZnhIdCE8R3/VD9vGKSkHlTwSlJ7/BwkM
	LlxCN0Y53R7qdRSke41ZAw3IC/9ZUzw0iuZF8kaP3Xnu7+/mYPkQrYYwiiISbEvRxe+f9w21tyK
	yoML7Kqw3EoK+xu6vg6nGyG3oYANac4p66QPrB0DgCXODUOjmD0wH2Uy1L6BWh8WE8nZl8nFAer
	VJ0J+MXk1QRyaJX92pAA5J6Igk0ygR3F8ajrpt+kA5K4Kv8nTK/+1UHOmwZjL46UvUMZHv0NgwE
	5cKwHbA5AsEp1gY7EYqoMowIIXBzbob/Ay7060rfHerYVfL9LuiSWruWvMSzfy7K6CTh3I+QNAi
	faV3mTNggr8KGqq35UluHc0zU+WrtnnPj2UYQtH/Adcqxxp0UkZUlEUNcV4/HETq/
X-Received: by 2002:a05:620a:6c84:b0:93a:14c:32ad with SMTP id af79cd13be357-9479f09bf6fmr258929185a.0.1794285013134;
        Mon, 09 Nov 2026 20:30:13 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e9b4bsm134049385a.39.2026.11.09.20.30.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:11 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] memstick: r592: shut down the detect timer on removal
Date: Mon,  9 Nov 2026 23:30:08 -0500
Message-ID: <20261110043008.56716-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

r592_remove() deletes detect_timer before freeing the interrupt.
A card insertion or removal interrupt can re-arm it in between,
allowing r592_detect_timer() to access unmapped registers and queue
media_checker work on the freed host.

Use timer_shutdown_sync() to wait for the callback and prevent
re-arming. Keep timer_delete_sync() in r592_suspend(), since the
timer is needed again after resume.

Found by a static analysis tool under development.

Fixes: 632644227850 ("memstick: r592: Fix UAF bug in r592_remove due to race condition")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 drivers/memstick/host/r592.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
index dc3de63901be..399873a61d1b 100644
--- a/drivers/memstick/host/r592.c
+++ b/drivers/memstick/host/r592.c
@@ -827,7 +827,7 @@ static void r592_remove(struct pci_dev *pdev)
 	/* Stop the processing thread.
 	That ensures that we won't take any more requests */
 	kthread_stop(dev->io_thread);
-	timer_delete_sync(&dev->detect_timer);
+	timer_shutdown_sync(&dev->detect_timer);
 	r592_enable_device(dev, false);
 
 	while (!error && dev->req) {

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


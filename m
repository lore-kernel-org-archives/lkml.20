Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90C38C2D1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572876; cv=none; b=UNmR7n1ZviBbWCLJjNSMNrQBP7SvJz+OTpbSZfaixqHuJ5Y8Bz7/H0w7i56InLRDJ2XidNVh9tDMQnDJuxdIXNeqjW7tDR+MlSfSwtskpf+WPU0wLPtl8o7SB/XIJrFothj7MSVaZkDXFI7MX8tioCCPx6B5eg7ZyeFVDa2Oa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572876; c=relaxed/simple;
	bh=oCSvTdXERt+oQFp/V52Il0O0Va3F3t1XTd5mQjPemvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5mz70C+WD7J38JE03+FZh3ZFcvHwzQrHV8jK9nKvcE7CsBqDqPmKuKaTZ+RIHEucy83bYlGvVIzSD08YVoPl1SRyDi49pfURfVmNeYIhstaAk2lNsQwyR1lD4ocjq5ZGOeMTiU6iRpVAhObWJbhCzPqfX30tbP71/uler1M+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7qddauF; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7qddauF"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so3307eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791572874; x=1792177674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByNS+o1NUbSuUxwr1m7Zp7UN3FXrFp68YUrjN0G+wX0=;
        b=e7qddauFd6/+EwJz0mbMQ7oLKQatDXXGj58FhYUOl1YZia6pB7VdTmpLehKLvIdL5v
         RIg1fxqvcoIsg7ezbAiTLMp71ME0WsSuRw954PvCkx/50yQb2dMNOvd11RPOV02GgFgw
         kRh+m6BnQUbXnwBJQnh5/bXVEYfNhwOcvgeGP4vQKyAh/djIME4b0kmbUpnF6grrpZ/O
         cm+83YqdL44R/WB5r8wUB3XBDG/cdBhL3HgM8xcQWjdIqCmubpz9KpDeVUTozWePuWhl
         Dmm3/+qibD0unQDhhv0+qi+KEaw9HUYL6QupI4M86wxM9N7kElVd2wg8KiK4FJoLYW32
         8x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572874; x=1792177674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByNS+o1NUbSuUxwr1m7Zp7UN3FXrFp68YUrjN0G+wX0=;
        b=NhJdioDY2mvUFmwffEON6O2bzzI6E3Ai53nJZpzuaSFbWr64/GcnfaHAWxlJ1hrZK6
         f92nlXOHHptkovehUxiiPafHmfG0bxfnOu7qU3l+ksa3PIxrXMBybtqVzTaFzqvbH7i4
         CKBqeX+kkVkBEfOQP1xjwoe0kqPEF7B3nB3/HZBJyPN1E4dUFchz5ef0+/2wlCGzWjW7
         iXZrX0Y6ul/qp706CM4sjZqRwu1pelmt/h1yHgVoCdBg5eVWoI8cjg4l/fuU+LNJlSiE
         o1aDHD0jg/s3l4W57fVCQv2c7zw82Z8/GqCOR9UkTdg2boRg6cNfgDlW2CpT/wRGmo1P
         3OHw==
X-Forwarded-Encrypted: i=1; AKwUvBwTCnjjVJM7l5n0scQIGeEy6esns57VbSDJFJozfn8vB1NgRKdBw7utPkM4p5UFSm7ANk3hbMK2XZlGrRg=@vger.kernel.org
X-Gm-Message-State: AFuF++kk0bteCd6rR+46Ov1la/DDK9Joi6yfupDQbZIg+OsbNlZ8HRcr
	viRNLQtmYb3ygZohO05eP41gQykq8gkuRUvwKUbiwDV9ZKCTmxsPxzwH6c59xOew
X-Gm-Gg: AYBFou1MQItzYaNOiKG7H3KuO9Gc3tMnfv76QRdGGXw8a27mHSCry9jAFYtxR7T36yC
	q7IDWUsmz4Oa8PZZG8aIUVG3B0h7cSlDm4NtYhuW+TGhuhBdEtMLinnt+VCpnZqBIirmWoN3S3G
	jQBX6QnCwQEeVHPPyE/OpCgh/yY8EO153T0gCqy2BCDeUUj/X0u+DnGgvNGzOvZwPXsGQ9tueCh
	E1TICHVJJSQXVr9eucBPjMoZgZxBdbizn+Ol6SLwNoH1lahFjcBHqnrZ6iHiSBvfFUYrH5R/Q/d
	nmZ1ccHgE7ihdOKMqdQJ01nfHB2MQVKjRK1allPXBl4M/WZWErqdjEJCOzZQ0OrNzlwwC/kZlmY
	zGRupqF10Zr/i8+YfFvxHItsb1yYVlRXoJHsvtGjpJ8OcGa6DMWEXhDheOLMi5MapdvG9EYNtnO
	8EyX2sRjUvJvF6HV7ZLDv489lK6CEP2KdQPg7ar3BAZH3B7QldEl9GRK277AGNysdeodEGMXhjy
	DhwtndxQgNfOXApKgJ79v6PqkfHbc2EYavn7K9C7SwOwm3qnnOWTbHqoJkHe7Y=
X-Received: by 2002:a05:7301:690e:b0:353:e390:e395 with SMTP id 5a478bee46e88-353e390e66emr2529768eec.24.1791572874261;
        Fri, 09 Oct 2026 12:07:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8725:99de:769c:1fe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm10191598eec.0.2026.10.09.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:53 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: wacom_w8001 - use ACQUIRE() for interruptible mutex in w8001_open()
Date: Fri,  9 Oct 2026 12:07:44 -0700
Message-ID: <20261009190746.803607-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009190746.803607-1-dmitry.torokhov@gmail.com>
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from scoped_guard(mutex_intr, ...) with an error fallback of
-EINTR to ACQUIRE(mutex_intr, lock) and ACQUIRE_ERR(mutex_intr, &lock).
This flattens the function logic and propagates the exact return value
from mutex_lock_interruptible().

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_w8001.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index e967f2413706..b34fcac44f63 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -387,18 +387,20 @@ static int w8001_open(struct input_dev *dev)
 	struct w8001 *w8001 = input_get_drvdata(dev);
 	int err;
 
-	scoped_guard(mutex_intr, &w8001->mutex) {
-		if (w8001->open_count == 0) {
-			err = w8001_command(w8001, W8001_CMD_START, false);
-			if (err)
-				return err;
-		}
+	ACQUIRE(mutex_intr, lock)(&w8001->mutex);
+	err = ACQUIRE_ERR(mutex_intr, &lock);
+	if (err)
+		return err;
 
-		w8001->open_count++;
-		return 0;
+	if (w8001->open_count == 0) {
+		err = w8001_command(w8001, W8001_CMD_START, false);
+		if (err)
+			return err;
 	}
 
-	return -EINTR;
+	w8001->open_count++;
+
+	return 0;
 }
 
 static void w8001_close(struct input_dev *dev)
-- 
2.56.0.385.gd3acb90ef8-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161155;
	b=rqOVR4j9CWfkHwE63pbSFCB5YYAqNb2YF2HyGfUKcLVX0UQuabin8wio+KLxevdKwL5J
	 uYABVbbnsqna52SmbV3kIKHvKkAit/EOxRZmQNjkGh32Xz53ePq41LvW4DbEpNAGkT6Qn
	 kn0vl384VrdP784Uvf2BNBXwzdXkxnW9EuQhkvG4qtTlOZekhmbB26IqWS5ReYq11O0GI
	 YF0V0nr3xJPVA45gGjiG/SI72CHsRqHh4tniEiwlSqUCilXSWOhFbHCF5qmM3jAAhpyFm
	 l06q9EUy4c2PJ+Wrpkl3svHNSYzGk3kUg4/6UYivnu3OPnQa35vR0bZuhMw80EFnBSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
	b=LxOqvmybI5wWQglKSwAc9QjSoajgX98IvANRkNGjhWGMMPFftEJP1gRJlZmVWPAPBhQY
	 7rTXunfRqlZAPIvH9fmrxkTAY49PFVUKY6WwyOvcJXx5krUxXsaxYrgTmi5hLI337dZec
	 Nvl5Y90xBpSwWVIzc+am4m9ueZZydHQTYwKDYQTFP6mdadRncVhgSzitf8RoGDrQWq8q/
	 Wka1KCQ3IbtLyvyA+9Wg4o0Qs4KV1t74X9pDfyV5b/g9spbKVy8kQjl9lRBY/SOLz+qjZ
	 tRCfhqEFhosWwgnQz/TcWpW8PTYqpgBaxpIsWuM6dyoAFaE6Skx1Ex5BhX7gagXy9MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmXc+wnl;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF0C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmXc+wnl
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-881269371acso842546b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161153; x=1793765953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
        b=BmXc+wnlcRKYvkF8gmd5XN4jaHRhrXqev63ZmIrEuI5TUNQPO4LrZC180J3kEdMmzu
         yT4+co3kGpQgKTyf6kLgkqArJhBMB7xb54qwLBC1hQ9sxiBNM/Wi7eVPYcnvv8e7BAN5
         Zebp7Yiich//isnc9YSk17TY2rIs/odM+sIsof5+pp1SFoGZOc1XzQ0PNCH2jqamKwXi
         V07hXbHskEnT082rJj5WGf41FI0Y6mGjW0XJw6NEIqhGRQT4rCMJRBkKVx3Wwp5rQ1Tw
         c1GHi7uC1+VKqGwTzSI/aWCc6aPFprzqngyVvkIcQDNNkp4r3+K6VtGgnRPiMC3BH5po
         NbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161153; x=1793765953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
        b=xm+suPGG4xxDt7alpjsYaNfjR5OFUBRkZs2MXXwtkkOLAsTWZzftEmlRyahyBKmLQO
         lZ6HZfR+sFuKzebpndtuNlOIaUD+72ZtTZzEjFmS70MpEJWrnlqXoFF0MwMSzAeEbzhq
         Vq0gF40r0vpWRehNxTF2njCRT4ZNzic3IpPJ6tnfgPq1hoB2Nsz+ztSJMGIvzEEwxPrd
         xAOvugxk3wDel7hfiw9pGauMcfhcHRlGOwyi7Ve2gnsXAf/D843sK92mub5gHnMsIqOg
         nOQLmDS3oB1mnCMURcp+8KRL/VwM5gbKMGkK4QPKyyBFnQtdtR6hLx3aDdkSZNHY/KCZ
         4Zmg==
X-Gm-Message-State: AFq9FYKLhMe6uX8+lAIBjsUJ3GWzwnYmQbWVUCYKP5alI50n1KaLH3FO
	IjYlCSyOUzT8oaJMbQTTkKkP8BxJf9ECZOb497ltwy/dWPqU3qR4gHnj
X-Gm-Gg: AYBFou3D97r2KAofZ7QlFfQxi4h8Hw19DbZ26yk6PQTwVCxUjLWdX6NU4KsiuDZSO36
	dBGjSMUDJbbSjfF9kD5snZt2czozzznaAJVgkLTkqo1j09czZI5NJbhdOVcab/DZGxWdkRVywbR
	F49tcR6cIR6Gz2UTpzTmkBeezvgZDNK7puoMMlQuteoS42IbDuHZx5XAcsu6EKi0dTuZ5qOmycK
	jiiAS4W+4l74g3Fpxn2wC8BHx9Vh9WLGznmbt+7xqlOzW/9FiikA2sflrIYFyOSj7V9WuZu0p+H
	+SZqvUBOTGjFBOhZD+OiZhoxSrwxGPxuOxELRA9UMfwmfzZRbmAD3cH5K3QhKN3+HenffXSo8ry
	74saRtvf0SVaX++MtcmeDfZX4bSyt/ISYyNovpXe2rwcJ1ZSooi7yt0/Sp1odIMM0PSUINFDKMk
	Ke/Bd5981cHJcv0TpWPOznhHVY2/UO0M8yaA9ZSh0P/MU8+rgbwLZQCVRY9zSXrDES1tcwvekv4
	7By9TnmQESL6KKWMjqTmiyVJNz+GHFyuNGEELJ1jpiQt8+iqiqDW7A+ovMY1MO/TwnAiLrHATsA
	6OWJPYWjX7Fm6H9BrNKN0I9zbqfeIt3Lb4GWSp8JPDo4MqEcHVBROaTyl6AeFVag
X-Received: by 2002:a05:6a21:4d81:b0:3e2:2459:b774 with SMTP id adf61e73a8af0-3e90807fa4emr117670637.16.1793161153541;
        Tue, 27 Oct 2026 21:19:13 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a73bfea7sm636952b3a.47.2026.10.27.21.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:19:11 -0700 (PDT)
From: Jianping Liu <frankljpliu@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	shashank.mahadasyam@sony.com,
	johan@kernel.org,
	hadess@hadess.net,
	frankjpliu@tencent.com,
	guanyulin@google.com,
	gary@garyguo.net,
	rafael.j.wysocki@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: core: raise root-hub autosuspend delay to stop a busy-loop
Date: Wed, 28 Oct 2026 12:18:59 +0800
Message-ID: <20261028041859.1061836-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

hub_probe() sets the hub autosuspend delay to 0. An idle hub is
therefore suspended at once, with no waiting time.

Suspending the root hub can fail. While a port reports over-current
or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
usb_runtime_suspend() returns that error. The hub is resumed, and when
its status URB completes the same suspend runs again.

The PM core would normally leave a gap before that next attempt. It
starts the autosuspend timer only when the delay is still in the
future. A delay of 0 is already due, so no timer is started and there
is nothing to wait for. Suspend and resume repeat immediately, and one
CPU core stays at 100% until the port is no longer stuck.

If a root-hub runtime suspend fails while the delay is still 0, set
the delay to 1000 ms so the next attempt waits. If a later runtime
suspend succeeds and the delay is not 0, put it back to 0.

Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 drivers/usb/core/driver.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..30965d6ffd67 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2008,6 +2008,20 @@ int usb_runtime_suspend(struct device *dev)
 	if (status == -EAGAIN || status == -EBUSY)
 		usb_mark_last_busy(udev);
 
+	/*
+	 * Root hubs use 0ms delay, so a persistent -EBUSY retries with no
+	 * wait and pins one CPU at 100%. Set autosuspend_delay to 1000ms
+	 * on fail, then back to 0 ms on success.
+	 */
+	if (!udev->parent) {
+		int delay = READ_ONCE(dev->power.autosuspend_delay);
+
+		if (unlikely(status != 0 && delay == 0))
+			pm_runtime_set_autosuspend_delay(dev, 1000);
+		if (unlikely(status == 0 && delay != 0))
+			pm_runtime_set_autosuspend_delay(dev, 0);
+	}
+
 	/*
 	 * The PM core reacts badly unless the return code is 0,
 	 * -EAGAIN, or -EBUSY, so always return -EBUSY on an error
-- 
2.43.7


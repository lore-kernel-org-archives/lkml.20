Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096749;
	b=mafrmJbM2oeEHe4snyaQHqGIxWHczsiJVrj8aMCJV1mfSFTbAmobd7J/VfjjPJACBeHg
	 CKGPPzi5zxOpKfmyQg/OKO1LX3G28dBMfK4vO2Up4fxOHDLRqOE2ivw3GjxOimehDS2eJ
	 NXbzIMO4hgKG5Ekc+SW9xzQe0NaHRxeGztWNXjLN2DJI7zgb/hw/tvei8COhUsUi5+j4X
	 9Di7Sna+qZy/yC/0rpYawdMadhqx0Z0Z/IKwl/RNsD1qeUVmGm7Fb3r9Vp8NeGfZRIl91
	 e4KP33cfNL/WxyTEv8ZGLgj3+6gxjgbxxSb/Hp0Kv8Fii/dXSa8N2GWiViZqffeLs2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ijw1U2kb1kzZv7aGgFzZ0Z47dFymm7tkHOWXjQdf5qQ=;
	b=KCxHKu6LzOxopSRGND+8sbrKctHKHj9krWePXPYfzD+PHZm6bDZP8krGPb0qFDJUWa36
	 XSz2FjfyUxe5mVoaADn/4jpVmTb/7hIZUFUhccuWVGmignNbrbmtNyMjcnxrsWGUpnlyp
	 XWiDkafrZAO7BEE6gffk7bGjdrzNCY0KhnwA2VNSTpVe1+7v3golzi7yV4ROsGOgzOp+e
	 Amh/eArvOsqdhdGL0Dd3sxg3pajbEca/z7dDsA09NkhzeK1E/D9whgw/XNNxYx5F7oxd5
	 YhO+qQO2+bI7NZ4V8Cf37Z4RpYPNU6o+CSJmUR3m7cujmCQ710tc4Va/B2khiqAwpFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P48FoCU2;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C88606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C88606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P48FoCU2
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so421755ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 16:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794096748; x=1794701548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ijw1U2kb1kzZv7aGgFzZ0Z47dFymm7tkHOWXjQdf5qQ=;
        b=P48FoCU2wJLuOW0KvMaQuorD4bSsAXGz0958TAY4PSp1uQZOn2l2Zl98oZ08R42vL5
         XqpiwXtmXaOPqg2GomlOeekqpRjWYs/24dJ9uKCF3FRL0BECVCZjRkRWDh0HWto71KxC
         h8CJLG9PwqIr8MU4A0BtRMwxxKswSUr0vYKF9SCjhG+MfFw7QCyqwkE9L3Vp+Kg32W69
         uTtyTgpY7ij5PCuiwHjWLxvvsViLr0BJn3E7ssYSp01C5a7qqvvZJZay1eD1AdPN77OF
         EPrnk2Hk2QGwjEI+CBlU2zPqyLH+0MLDJn9cTsfCdun/TMWwe7whJc/ki9yUrWfV3+66
         nM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794096748; x=1794701548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ijw1U2kb1kzZv7aGgFzZ0Z47dFymm7tkHOWXjQdf5qQ=;
        b=NtCs3Cgl8RRq2qXh4WuZ3xGMYCU2U5TqHcuKkuhvbsy3drO1/ShZNWsibjCo8lOxYD
         2b4uvcUjpgjyUINzqBotx3HsOFgM44qxtRwjnr50KRbL8HfDShKn4yLrtpWU3vLDdumk
         /7nnjkkvHPZVEgVSy5ELDuLkZiRfvKgpUor+Q3SqV+1YEIN3Ls3IESfJ6XTI05bVdgb+
         ciRVJ+P+6bT5ITHFOKytTKCkIzW+xeEucVC4EEWrz34ag2hxh7iE6MPwEEN/Obx7uQcu
         CXSUlJKLj/UEtI+1mGOd7OUaJar09eVNObsQFCrzTmMem07ffidtRtNk7Of7lBfV6zU0
         1hlA==
X-Forwarded-Encrypted: i=1; AL+hErHatFbM0/1z3gacsXpNJWSMiDpCPtLzjlzY7B+AQXHRY06jhECji1b4L/zP70oDixe5ezpPSpMFLuh7sdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ftz2oYRv4jvPp4b/AEUh6qBg6F4z2442Mjx+B6doi7hWizXIn
	Kbi/tj/h9fled+vOgai0Fw+PY6N08/VZqDDsPUOSCNqGCC6sAP372Oli
X-Gm-Gg: AYBFou0McnL7HPkxkxVCDssa2vVcKB1j3QotsFei0B1WlfqNbyZS3lm3fQv0dV3DoX0
	78YGcklnoXalOOLjIA2CRmDeljSx4Od3zpbZvUZmDuQF9BiOVn0FAUi003rpxPfvDSgTXw4s9dt
	Wtw8VN38QSZiE7jSewMirrWCkKJgx7aGkujpQJIYsTkRDdbCfoA4CiGUU2Coh1Swfoaz0cwD7Xh
	GmAZFY24RV4YwJAqUMQd+3ZYalJiWiTAGVL9/EAytDusU1VXstTpF48FCnUW8u5skdB0P5FgQOr
	Q2tehRnD5/fLppfVTi1NqwkB+1DhWpWOmh4IUfj/MOESbPQFYUdUF21o38PCg/bM7ouHgXvW8RP
	tSoLcldl794Il3SzcRIez0EfImHUfzFC9dSgWxLqNz6JL2coQL37y6zYcpNU+MY2bUXUhvvWQVR
	FzCIF3Z4RRvu5bY47uPj4Gy9GQN3MawSKXKgG2IBMvT4tcnnEBKrXxBkCDM+QtSrnkXje7O4pvu
	XI0eblqunqRcSVP3s4C02iB83+e/MMOXMuJCPklw9e846rDu3LX6U86X9rgLcIfj91BSxJ8K6r3
	NgmyrGdk7aiWUro+uqPOLHDH0NYYoDNgtZlp2tO31HiqLLKtHyBhjcX69aJktnVVY1iuwFikGtB
	nHs7W9+sktoCCehzCCwZpwYuzFDBSZCnuMNLKwGbplmhFvGh0m5WU4BypxFQEA6fP
X-Received: by 2002:a17:902:f612:b0:2ed:18cc:d3a4 with SMTP id d9443c01a7336-2ed83784326mr1769335ad.46.1794096747574;
        Sat, 07 Nov 2026 16:12:27 -0800 (PST)
Received: from sanjays-pc.govzhome.govindz.co.nz ([203.94.55.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81712282sm614905ad.50.2026.11.07.16.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 16:12:25 -0800 (PST)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rosalie Wanders <rosalie@mailbox.org>,
	Brenton Simpson <appsforartists@google.com>,
	Sanjay Govind <sanjay.govind9@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: sony: fix sleeping in atomic context in RB3 Pro raw event handler
Date: Sun,  8 Nov 2026 13:10:58 +1300
Message-ID: <20261108001057.29776-2-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Rock Band 3 Pro instruments only send navigation reports until they
receive a magic SET_REPORT feature request. When such a report is seen,
rb3_pro_instrument_raw_event() sends that request directly through
rb3_pro_instrument_enable_full_report(), which does a GFP_KERNEL
allocation and a synchronous hid_hw_raw_request().

The raw event handler is called from the URB completion handler in
softirq context, and on USB hid_hw_raw_request() ends up in
usb_control_msg(), which sleeps. Plugging in an RB3 Pro instrument
therefore triggers:

  BUG: scheduling while atomic
  ...
  softirq: huh, entered softirq 0 HI ... preempt_count 101, exited with 0

This was reported on a Mustang guitar (12ba:2430).

Move the request to process context by registering
rb3_pro_instrument_enable_full_report() as the send_output_report
callback of the existing state worker. The raw event handler now only
schedules the work, keeping the 8 second rate limit. The state worker
is already cancelled by sony_cleanup() on remove and on probe failure,
and sony_schedule_work() is a no-op once cancellation has started, so
no new teardown is needed.

Fixes: 7245b0017d12 ("HID: sony: add support for more instruments")
Cc: stable@vger.kernel.org
Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---

Notes:
    Reproduced and tested with a Santroller device emulating a 12ba:2430
    guitar: without the fix, 'BUG: scheduling while atomic' is logged every
    8 seconds; with the fix no more warnings are logged.
    
    The fix and changelog were written with the help of an AI coding
    assistant (Claude Opus 5.5).

 drivers/hid/hid-sony.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 50f5ad6bbeb4..9ee175f9e58d 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -630,7 +630,7 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev,
  * Sending HID_REQ_SET_REPORT enables the full report. Without this
  * Rock Band 3 Pro instruments only report navigation events
  */
-static int rb3_pro_instrument_enable_full_report(struct sony_sc *sc)
+static void rb3_pro_instrument_enable_full_report(struct sony_sc *sc)
 {
 	struct hid_device *hdev = sc->hdev;
 	static const u8 report[] = { 0x00, 0xE9, 0x00, 0x89, 0x1B,
@@ -647,14 +647,14 @@ static int rb3_pro_instrument_enable_full_report(struct sony_sc *sc)
 
 	buf = kmemdup(report, sizeof(report), GFP_KERNEL);
 	if (!buf)
-		return -ENOMEM;
+		return;
 
 	ret = hid_hw_raw_request(hdev, buf[0], buf, sizeof(report),
 				  HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret < 0)
+		hid_dbg(hdev, "failed to enable full report: %d\n", ret);
 
 	kfree(buf);
-
-	return ret;
 }
 
 static int djh_turntable_mapping(struct hid_device *hdev, struct hid_input *hi,
@@ -1098,10 +1098,10 @@ static int rb3_pro_instrument_raw_event(struct sony_sc *sc, u8 *rd, int size)
 	if (size < 25 || rd[24] != 0x02)
 		return 0;
 
-	/* Only attempt to enable full report every 8 seconds */
+	/* Only attempt to enable full report every 8 seconds, from the worker */
 	if (time_after(jiffies, sc->rb3_pro_poke_jiffies)) {
 		sc->rb3_pro_poke_jiffies = jiffies + secs_to_jiffies(8);
-		rb3_pro_instrument_enable_full_report(sc);
+		sony_schedule_work(sc);
 	}
 
 	return 0;
@@ -2217,6 +2217,7 @@ static int sony_input_configured(struct hid_device *hdev,
 		hdev->quirks |= HID_QUIRK_SKIP_OUTPUT_REPORT_ID;
 
 		sony_init_raw_event_handler(sc, rb3_pro_instrument_raw_event);
+		sony_init_output_report(sc, rb3_pro_instrument_enable_full_report);
 	} else if (sc->quirks & SIXAXIS_CONTROLLER_USB) {
 		/*
 		 * The Sony Sixaxis does not handle HID Output Reports on the
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687342;
	b=aIkz0NmBl0sQwaLoW4eBYsM/MUBzmNCAdJy9NiBQ5fea4BrvyRtERfp48fAjfy55Ud1k
	 O+O0sHfgQ7EWzRtKpixDI7mWaU5LED/tsqauWSObMPv7rVRxEAEHYZ5ztdBKLgylUGttA
	 d2qaUhdXpRObzH0DurgN9pg1pNPy805h7oD0YYYxU3jeC4KxxM3M/8bEZ++D61U5xQUZU
	 il0OWCawMwTLRpEsWHA6sTyd7xfBcVaGTrDPCGgMawcQy3hwdjHdrWOYfowVTBKPdPg8d
	 sjiV5sWNK5GosfbVlgREMoqM0ukOPi+paQFkzjhetb9GDXiILaasH7qZRh4Qk5RV/Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
	b=qnC1kQLPdPSm/N6lZw4xxVW1gG1zzd3BLld3f/x5t+A40EBHzWbGTs4y2zp2yjct6lhk
	 Rm62fGc9Mq2iH5NWwGCmwXs8UHi5FoxJVPpjrbWFBrjOjwJVlISWvOuIg0/wf6y7EGjml
	 r/FNAJYHqRtnnYu5QVudomBayK1zvY8W/9FmqFBu68tNb4zrTF1ogFyMmtHzMiwHmA/ut
	 fbW9DGD/83uR5sBfmsZeDpmASJxyH2Gv/YEpQbpcK3BlEzh673rcYX7mMWD8vposXnTp5
	 wZIufuoKiOcxEM2xpyh7PnGyCPc30/2tcwksJYIzznhgBRTSYlk8lwYWYy8eKDrgGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cyueh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j1GQBjH7;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D6606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27D6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cyueh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j1GQBjH7
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-887c99013edso1960020b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793687341; x=1794292141; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
        b=j1GQBjH73SUB5ThsxahsdEBents9hXXu2EKz1l0qZx6gkh0tn9edRg/WWJ+wK/UC6g
         ahVh2MkdvWY93+GyivU5dz9jJfHJanY1B7+FpYn1oJ6mtQVS+haXlmuRMi/pwsXKC0t6
         0+7KMq4l1DlofkirWHNMOXZLoavk4oZ4TVdP/EzzAJVNNZckEL2+Ts1BepYd97b25BWj
         Yj3PkAosT5q+Ahob+qW5ZwU6Gh2Bnmj6mA47H5sUmremYidoTxClt/BHuxPG297nfMwD
         7NOuJYr3QudiJwZzUMv7m+TJa4LfififrfklHQ648y1AGogZfOUjHX7UgdNymGHo1I3x
         RFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687341; x=1794292141;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
        b=A0K0mdzqucAtaQ3tXqna/LtIpbTc3gXVQrVn5xqtdiqGMgPqfK3V7lKIJo+x+Nel19
         Fn5rmjmgBiwNWe2ZG+5hvYwDhRJ/yH+F9FIgoCbICZP/eiCBtl7YtqsMQ5Qukqgv+k96
         RtXMFAWuON/8vg9Ik+XE/yjW89MArq8noFZ86BosqJks/xhUKJARSG1whrPuv21LROUw
         RMJ+AwmBhZ0CdvYopAGBT3BG4xHdxyG878z4CaRtILKI81DeV4h6DgvMjIp6+Aq3fPfy
         a9i89hj8eJv4Sn6TDj4M7mb9ekc9sry0gr4lsp+CX5V+4kytnnPe/A42rATVvKpVcfxv
         8Asw==
X-Forwarded-Encrypted: i=1; AKwUvBwKBRel+AhluVnoKrFC/V8WJ0LGdQvhk6CpmsIbwdM8P+7O1/lxzGjQ2YpH5dMOhctnarPLYwg3qPFIIIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j1TSS2mfSlb5IYvoSKsgAOfwOzLgNfURcJOpf5U4edBB0s56Q
	5/twZ5I6fptivYQHFaDhCfQR2IsJjhmY5eoNdCMieQcd8WDRzDZsJLbOWbxwg3kry8i/wU/XBJG
	6RA==
X-Received: from pfbgq25.prod.google.com ([2002:a05:6a00:3bd9:b0:89f:4f8e:282d])
 (user=cyueh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a510:b0:3e2:257a:a61f
 with SMTP id adf61e73a8af0-3e928fbdc2dmr9948243637.59.1793687340722; Mon, 02
 Nov 2026 22:29:00 -0800 (PST)
Date: Tue,  3 Nov 2026 14:28:02 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103062802.361878-1-cyueh@google.com>
Subject: [PATCH] platform/chrome: cros_ec_rpmsg: record last_event_time on
 host event
From: Cheng Yueh <cyueh@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Cheng Yueh <cyueh@google.com>
Content-Type: text/plain; charset="UTF-8"

Transports with a dedicated interrupt line (ec_dev->irq > 0, such as SPI
and I2C) record ec_dev->last_event_time in the top-half
cros_ec_irq_handler(), while transports without one (ec_dev->irq == 0,
such as LPC in cros_ec_lpc_acpi_notify() and ISHTP in ish_event_cb())
record it in their respective event callbacks.

cros_ec_rpmsg also operates with ec_dev->irq == 0: when an MKBP event
notification (HOST_EVENT_MARK) arrives in cros_ec_rpmsg_callback(), it
schedules host_event_work to invoke the bottom-half cros_ec_irq_thread()
directly, bypassing cros_ec_irq_handler() and leaving
ec_dev->last_event_time as 0.

cros_ec_sensorhub_ring relies on ec_dev->last_event_time (via
fifo_timestamp) as the AP CLOCK_BOOTTIME reference timestamp to calibrate
the offset and clock drift between the remote processor's local hardware
timer and the AP timebase. Without this calibration, IIO sensor sample
timestamps cannot be synchronized to CLOCK_BOOTTIME
(SystemClock.elapsedRealtimeNanos()), failing the Android CTS sensor
specification TimestampClockSourceVerification.

Record ec_dev->last_event_time = cros_ec_get_time_ns() upon receiving
HOST_EVENT_MARK in cros_ec_rpmsg_callback(), matching the other ChromeOS
EC transport drivers.

Fixes: 2de89fd98958 ("platform/chrome: cros_ec: Add EC host command support using rpmsg")
Signed-off-by: Cheng Yueh <cyueh@google.com>
---
 drivers/platform/chrome/cros_ec_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 39d3b50a7c09..07b9e71ac8e3 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -180,6 +180,7 @@ static int cros_ec_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 		memcpy(ec_dev->din, resp->data, len);
 		complete(&ec_rpmsg->xfer_ack);
 	} else if (resp->type == HOST_EVENT_MARK) {
+		ec_dev->last_event_time = cros_ec_get_time_ns();
 		/*
 		 * If the host event is sent before cros_ec_register is
 		 * finished, queue the host event.
-- 
2.56.0.385.gac671c819a-goog


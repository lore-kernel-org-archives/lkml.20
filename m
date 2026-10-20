Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488273;
	b=Qg/9FwZt+ihSXlR+2SZqYgItwOCJmyT4tM7Y9/3itVYTS4RXrn2CpTZtp1fOVdt1YIcD
	 QaB2aGRLfOmfewLqK6SGoTNOUz//LY3H3YhiDRY+wTQc8g7HA/wSq4AVaYMjRrvqV59gX
	 tzhliHu/QDZBTCoCOVlz/mSMvwBgow7uh0PJNX/dLPOQaBSdczZAylcmCNCAHM6uuWhWk
	 NCnmG6AeE9ijzMyObMnCrTDWmxmJHgnFLv0uX2PNJuS9iXdoQhALMOxbzcSgpoh/17JJN
	 IbRfajfmXg/q3IcdyNKvxBcNMt8d/hVZatXT/+Uu2HuUHWOQ9y2AYA8Fwy1C9Z5FHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PlHEmQzeT8LkXqBVeD1sDfjB0dlnEHxvW6gX+ZviY5Y=;
	b=1GsqT0UqjglxlpSrNfKbe9guXtXQ5Q6XKsw1F+k4sr+GbCnwgtiMeAeDovOvEA3CSRCl
	 tPMu4ts1VTGjfPEuI28QjP0cgWUItLBcrmCtLpS/QGypxR6fdidiXZ5gmxKISbfbEuGSt
	 LR7vOkAZDV3MeWlgDXLcdTyLvJYlbbXSot3m7Nbo1tM9U6Al4NiOd0ZP62MCE48MGl3AH
	 kUuPCQy7LBEfJTTNOvWwdbXy5EfFQ02j7qj5afCG99Tffxx161Xtvs49YXke0j8mBblgR
	 H3R3uiCtIH7F1HfljsPqdFzD0S3oS7p3GOsSdDrLK4K25TeHQLEKzSMHRrAVF91UaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC4b5LLd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9658460A2616
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9658460A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC4b5LLd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so14648255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488271; x=1793093071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlHEmQzeT8LkXqBVeD1sDfjB0dlnEHxvW6gX+ZviY5Y=;
        b=fC4b5LLddXhkSUYXXpkZzuy4di6Zcq+3fG56uuKa2Z9DZON0aqcUowoHK1DddrPODg
         nAhKfJabrnFwVFJAvJQqKEVrGEY5G/x4cMlPTmqYX3Ra/XmRRtRm35IwOKgjEth8WjWj
         Qw7oxZ8SsnsIXcOYRAwPinx6KR0W3gYym/BRqgTihMrmRIpf+8Z/CRDfYWFocczIYt9D
         qOnm/V/rmE7zlMhIr1lUl/9n/qaVKwCpUE4q6NvIy0Gla3A/DIb5u3DtGbkr/6bLt9iR
         3MDmIgY5gjwiLvZ88/N+Ecdo2J8YueYmIU5TtKSPANQ5/SsEkpABYcOy1Ykp9idjHnWd
         1TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488271; x=1793093071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlHEmQzeT8LkXqBVeD1sDfjB0dlnEHxvW6gX+ZviY5Y=;
        b=pKM5pvazzvr+KIBjnj9hV+4DKttj3NtfQ22we7hfhQyI+P05bzIQcmELpAspOZVpWu
         I8YQWCup6cCD+5qz+Os8VmzDjE/lIslAj01qtapU1goR/+Ca1I6YnZ14Uzol5G2zcGBD
         5cnUHk7sMT1kOl1UpuzPhFNwX0LOBxvb+RdgaQCcnmsafLq5zMlvHbcV9DoPcIoV+f/p
         6IRCN5YhiT91vRiWZMWTO9cCEdxbizJrezKw+8r384S44XV+bMT8ve0elmvvG34eWswu
         6ifBE9rwXkGAmCR2WwCN1c5BWsnN9dk12t/KfKpQjPZg69ZRWcGHUjGJAIvVUncoIfT3
         rt1Q==
X-Forwarded-Encrypted: i=1; AKwUvBygtm10xbEu0+XgkiG7QCG6J5A3LNWhf1c26pqy6xwW7QoZrT/km398cqnRDmdGBTebwiK15WXI+JRaY40=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl7a6A2lajok7ongHeo1pcU0RMws/1i0hucci8GAFGCveKdwZA
	a/kFWWeL/ZkXbR0RERssBf+AJ8yz2EBFi6fbgVDLHiCTqh9AAVgIZlHR
X-Gm-Gg: AYBFou292cPcCHmwIzvu8TpsyLnZP8Xhywjrgpr2zCy3D5sOyC+DjWdj3OuF/lXYyQd
	+QRm265Ken5bI1CV151uacrsHixBPYf1AJIXb8YL/owRgPiylSfNoFyJQw6vyxhfoiOt/pHv8Xn
	s5YJh4hCDu1t/5iOYmcc4FPWTlICZsjsiMqvZf1A2Pv6h6xZq1QDGNYoYEkZBDs3o4OWhFPUGq5
	hAwJD/nshvQiLrvIsQI7Rq192wen/zJPxKgelwaP3Vwys0Vj/3bIei/vheYb2RJclqfYTGBd7Au
	HZSF7FANvHYQfcKWrxjChyMAutcKCEWeTE3JWfN6nJsPib5/WqzE+rqPmeY2RAKFwoy2RqKxjj2
	Pvizla+iSO9/BYpm+KSAclmlMXEu0G8+z/ij5hOyQCX5RPc/qRiiuNqbn49s0OLNHjMkkBJdGYC
	Hr673U++rvsHVqP1Zu3a/Op9yB8uk710UCBzq0vwZy07rcLtyb/NrNgO8yrw+lHaHYpfe+a7oj7
	Y0W8eSmTcEXhUdg2uDT97woAFaELxAEfoPGskzByxFSVTMFE9OMLLLM
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr167529335e9.15.1792488270525;
        Tue, 20 Oct 2026 02:24:30 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm40765015e9.1.2026.10.20.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:30 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v4 5/7] HID: asus: Do not send feature reports larger than declared
Date: Tue, 20 Oct 2026 11:24:15 +0200
Message-ID: <20261020092423.36380-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The keyboard backlight and Fn-lock commands are sent as 64 byte
feature reports, the size of report 0x5a on the ROG keyboards. The
Zenbook Duo keyboards declare feature report 0x5a with 15 data bytes,
16 with the report ID, and do not answer writes larger than that: the
control transfer times out over USB and fails with -EIO over
Bluetooth, so the backlight cannot be set, while the 16 byte handshake
goes through.

Cap feature report writes at the length the device declares for the
report, when it declares it. hid_report_len() counts the report ID, so
the handshake and the other commands up to that size are sent as they
are.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 739637f1964a..65ce31a5489a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -631,6 +631,19 @@ static int asus_raw_event(struct hid_device *hdev,
 
 static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
 {
+	struct hid_report *report;
+
+	/*
+	 * Do not send more than the declared size of the report, report ID
+	 * included. Sizes differ between devices: most ROG keyboards declare
+	 * 64 bytes and the XG Mobile 300, while the Zenbook Duo keyboards, like
+	 * the touchpads, declare 16 for report 0x5a, the size of the handshake,
+	 * and do not answer the 64 byte writes sized for the ROG keyboards.
+	 */
+	report = hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[buf[0]];
+	if (report)
+		buf_size = min_t(size_t, buf_size, hid_report_len(report));
+
 	u8 *dmabuf __free(kfree) = kmemdup(buf, buf_size, GFP_KERNEL);
 	if (!dmabuf)
 		return -ENOMEM;
-- 
2.43.0


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595624B4871
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888044; cv=none; b=izLUKQDGgYmgk4GuxuGGpoNxIP0gLj8a/sp2dgWsKa9VGnTwmOWccGQ75ItLo9c/ydrqtD5yxMX+77FcPUCivGmJ3Vsz1tbBKKFl5BgrQD/c3mA3D4DD2Vm2wRXK+UYnsUrOBH4hk0INwQ1elHysjCzYlYKz/aZg8NySV72wXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888044; c=relaxed/simple;
	bh=bl8DC5WOM940OcUZ0HKjeJ8zrpQwrjXA+YeiWLryKnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6UCM2pUc6gvupzfsOj733mxfE6Iet24ZvxkWWhJt/GtO5CVc2oqQvfK1l+Ztnf3LDvdjs4nROp2VuL5rNXkEHCEvUiVnctdmVY86ocfRZs4kELzVYzYExAi9SJp7nL4sEZhbTLJrXs8ZmTYdnLpiJ2g0hduz9OMwJwnCC/44Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg/Tc04S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg/Tc04S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2678916f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888040; x=1792492840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSpKFPrBiXLqTziF9p8uMEZyzm13zAd0Ie0+X+8d0Fg=;
        b=gg/Tc04SdNNIL/wdFNEUe2AhqzXwNROIwOCi7d2rU3bYpfwijMmrHAi0TnGov70e6C
         BcMBfJNNYj5jrXtDbkOastenHg1ZjoOGvU6Mz0zLHSW8IrqEiF2fUHpSTTBXLmqyHm01
         SXUSQoLFGo/MOSisBte+p0aCDnkUPuvDEWlWgSsWHdQRUYgoPbz2V+UC/era9fBwvHlc
         mO4InlDCtk+xHQTkFNVti927slWlr9UQyw/CnggC6DSzwwCNXJqwmjEEjh1ke11YUxrF
         157D+bmG4+dblxqjm+u+XOwSAPctEdu5ACeVmVlqGMI34BWSVYrEhdjXd5wvdRpCVTe7
         0rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888040; x=1792492840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSpKFPrBiXLqTziF9p8uMEZyzm13zAd0Ie0+X+8d0Fg=;
        b=Aqk9s0uF36pYtWu90nSgLWGXwf58re1veWkL2xgrwS1viuLrpvNUviQC6KkIOahEB3
         85bt6VdQWAen7lBE7L55veDhYPy4A297mHttWpiDCdfmMdGHlnaTYdcCYmaCkDasVL3M
         phNCByZcSz+rHhKKruNXCtoMK+QRRHGbHIEsk6QiRSk2DVoOmU64NTkAwetchKw5fkbH
         2flQMv3eLg+Hs0TSqdh3htf3uZPO+wh9StoElFN560qDrWsuyJWpeNtmIAr44FMAL3BX
         JDljCyJ2ds3RTczKo5jHSdIDp7eQLyWbNzuAc0Lm943lYnP+SXiW6B6l3bKXVDODsFVe
         XkvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVuIJP4C5rzZjzkOXXl02t4rFZSm+32pwBsfIuzJ7gssgul1LhS4wXxtW27SgDQzH/Uoif1JCNK8uRjsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1kyJwWIPhxIiheQOrWzwD+klmp/etjsHs0JJZ2ibQc+UaIqi/
	R/Rls3ql3TuvQyPjiqGGeowkmys0ON14yT/d4Si816TLtJeJYGG+Po7r
X-Gm-Gg: AYBFou07cFQSVBxRUGGzc/0pAf+C64dJ3QAvLA5wSXxmSmoLdaKx/NPbfBs+VSJtCN4
	4Ef8Izi0toNNaa+BCFWMZeIYHjMpvSUuaBT+XBzEBVcnv75sr6DudA/7YeQGQ5AQRNNWFTay5rY
	siRfFpQ2on21Xz6aOLcfDwFnLm0N3z2hEQH/uQ8Lu4lzQIVLgAGrgynJplttolo8FbDNqPUjcqc
	G05BDI3hwDffj83jAK/1WRFANl2JFGjPZCDWHX04qPNYXjvJUs/MOBqWFpk6XbWDcA+F2i16hCX
	WlzC/RrXas2Z/aJvl23WD7dZn/Q5ae2mF8JvHer/7MbZ4V4jAkaQZ3n8Eg70Z3726CWmhtUr2dk
	2tFNAaQLVIW/Cas8BqHm4Xj6ZBOOWWTG7dh6XFpkt25g+ec8jhT1KTmOhlHkGWETkOqWC8t2V7O
	RN8qAOsZRSp5aEJLe5b+QHqbEB/zpISJWEdcVlonnX9rKRXGaqoV/kBHTSWFGmioWd+3eQ8vj/u
	zk/xMrcP9HJoQDuVXUPUCBLHDouPUZKdlnuYkik9ESlsFtCBcKR7jFCRg==
X-Received: by 2002:a5d:6084:0:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48dbacdb462mr18938822f8f.45.1791888040290;
        Tue, 13 Oct 2026 03:40:40 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e22b:cb88:4091:8aab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac37acsm4255088f8f.34.2026.10.13.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:40:39 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 5/7] HID: asus: Do not send feature reports larger than declared
Date: Tue, 13 Oct 2026 12:40:02 +0200
Message-ID: <20261013104033.36079-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104033.36079-1-p.pisati@gmail.com>
References: <20261013104033.36079-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index b127f5c38f60..7b17553e94b6 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -632,6 +632,18 @@ static int asus_raw_event(struct hid_device *hdev,
 
 static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
 {
+	struct hid_report *report;
+
+	/*
+	 * Do not send more than the declared size of the report, report ID
+	 * included: the Zenbook Duo keyboards declare 15 data bytes for
+	 * report 0x5a, 16 on the wire like the handshake, and do not answer
+	 * the 64 byte writes sized for the ROG keyboards.
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


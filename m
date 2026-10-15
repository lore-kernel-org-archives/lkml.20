Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755341D4FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074882; cv=none; b=sGxcjkmAUJsu5J9mhDJz1h1t+wNv9Eq3y8NdIyKAr0L5e0ect7EQcmAzyiNFMUtAo/Gd4Xei3m8iYSJRvsEIZxWl1471LSs5JgwDayACT8apqZl0TjOLWwpbWjMPNkSKAQ9zofpefkLtuGg8X7axm7Het3Gdd+ocyeSdOLYyAC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074882; c=relaxed/simple;
	bh=MeLprhUAZMvvtaG2SQyYdpCUNDDVZn+Gy7G5TywqqHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He54KAFgD4mJKoUNwfJ4dXgxBOb8XdHbtAXu6J8m0Xq75dZmGdNl/cSeEitzJc3mI3LRDWG3JUy0uCjy1qPvx+UFha6eL3QKdg8Q9hQphSBtcezqCiTAu+d+IODv8CzYlx+frSNb5Li2IgimBZ//83XsCuWvgtX6vZ/hZDCMLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT7/VOLd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT7/VOLd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e95bd1c14cso7887845ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074880; x=1792679680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwKCN+cdZZKyFrwaQPyGpZEBhl46V22LLAfT1wOQ0EY=;
        b=RT7/VOLdqOmwHsYpvntbPzjo3dvLOKd5UFsrxmpF3KHg+1/EjLmXaeD+m7sDwKBcgm
         vObubCQzA1iVDSIjIFSei4MPS0fjs0c990YLy5r7Gb30TYDXHmh2dQt9sFoLSRC1l5RW
         pRwOtVi7D24b5hUwatqXLybb9TzVLUYV2FhKn2/5JQGPMPlrTErtYbZt5gbJ01AwevkH
         QoLIkxxYwophsP0fr1xNHHv3iR6WwB1FvfWAv8YS5TxLkt85fs3n2LVSDeM5CNNy/XFj
         2riJwx7Z2ZpD8lZggYCYTnZb0p8/7ytrMRUbXItEINVAfYJghOFFBmJA88kdOG2kBoEh
         vWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074880; x=1792679680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwKCN+cdZZKyFrwaQPyGpZEBhl46V22LLAfT1wOQ0EY=;
        b=JpBHvITS2G5nkyvO9dh5Qx9eV9fhxOnUhaQwustLlssdjtnBbvR+G5bmUpP5PRwTSN
         ovWkAPff9+CyfvKIrfkZNc8nJNbPZKRkLpbYz1ab4KXlIBP7XdZQyhwFj5hJj4Ub/W7A
         B9AOdDKSbEbzw4vpKlCtTsGIKHY6y2tMre8atfSAq4JDvIS9cBNBZ8t3FoxYtrk6v0Gd
         hs7MhePfaQV25Stl1g14jOGbKm3Sahz/SiwLKgJOkxH3cVKfwn24fwH2WAvfpbSM0Z8E
         IefkCWpTUeMHx5TsV5pmC5avfuui9vHKzYeeWbJZ5bYsOcLjZNsXDziyCZh6uZ2oktLj
         7rIw==
X-Forwarded-Encrypted: i=1; AKwUvBzM2Ynpv75Z+wldcqIo+TXkjJHm6pfrp92+DaLM7VnuMC/5ysh1u6AnkJbx8PWqsOq3+DOJWmIXtxnmni8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGArOB8XPH1VoPGMVeHLHRslVui45WZ+jNm0SstVJRHQam6DLD
	rpEdcPeWE1WCyC8sLXQy8lm//EZSWwqdD7wWlZ5kHQDFzIWGoKIW9uVj
X-Gm-Gg: AYBFou1c+oeht1o4GFN7K3XkxoDJjnKVQ/spXQyqxOmAoG005VS/DbcL9sCGtYqD9v2
	lNRcfznw70kQ4BvonmftdRXwe7PDyojmMaoSahuw3t2QUKoG5Z8Cwz2dasOQBITK5fYVkFLZABF
	Xklu2vsNP1xzSIKH4Ay/PyUPrSu0C7FAPxB4ForplZE7FGVzBLprZPxmZKcoCjZUhKGASAPBRE4
	jwIR292zfL9tqsiVrEvgZFLDBmm9u76WQf3FEIdWfw1Eiuk5H4DIUknGi3fNOvOIu9EbqjjFVjA
	jfW/I5lBxZ/aGnmaeOXBeLNylx0JDu9PLgG8Gao37aU2WfrsMZGcxO4Snx3SpEyxWH4loHxVNYs
	Wj+P0Mffn/cOjsSt8AIQdm/bJlZouOVuR8whb+HK5NkFjY/WQzfluEeQj5Z1n/62TnI4BqMzZM0
	43r6dPSRKK7qk7k/qp5U0wnTckj4E1X7NYHvHxlvqiZcs4O/bSUX/leuR9PCoWQoFhngZePH5P
X-Received: by 2002:a17:902:ec8d:b0:2e8:3cab:3af1 with SMTP id d9443c01a7336-2e842cfbc69mr174591995ad.23.1792074879630;
        Thu, 15 Oct 2026 07:34:39 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:16c8::245:c9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm79933765ad.15.2026.10.15.07.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:34:38 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harald Brinkmann <hbrinkmann@braincalibration.de>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] HID: saitek: don't dereference a NULL hidinput in saitek_event()
Date: Thu, 15 Oct 2026 21:34:33 +0700
Message-ID: <20261015143433.129525-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hid_process_event() calls the driver's ->event() for every usage of a
report, including fields that hidinput did not map to any input device,
e.g. a constant input item. For those fields field->hidinput is NULL,
and saitek_event() loads field->hidinput->input unconditionally:

  KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
  RIP: 0010:saitek_event+0x51/0x2b0 drivers/hid/hid-saitek.c:154
   hid_process_event drivers/hid/hid-core.c:1572
   hid_report_raw_event drivers/hid/hid-core.c:2109
   hid_input_report drivers/hid/hid-core.c:2180
   hid_irq_in drivers/hid/usbhid/hid-core.c

A device that claims to be a Saitek MMO7 and uses such a descriptor
triggers it with a single input report.

Bail out early when the field has no input device, as the other HID
drivers implementing ->event() already do.

Fixes: 37c492c8f6a9 ("HID: quirk for Saitek RAT7 and MMO7 mices' mode button")
Reported-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eba2b3201bd25a97cddf
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/hid/hid-saitek.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index 6fe7c087c594..2a9e07a4fc77 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -151,7 +151,12 @@ static int saitek_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct saitek_sc *ssc = hid_get_drvdata(hdev);
-	struct input_dev *input = field->hidinput->input;
+	struct input_dev *input;
+
+	if (!field->hidinput)
+		return 0;
+
+	input = field->hidinput->input;
 
 	if (usage->type == EV_KEY && value &&
 			(((ssc->quirks & SAITEK_RELEASE_MODE_RAT7) &&
-- 
2.43.0


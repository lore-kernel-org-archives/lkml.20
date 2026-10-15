Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17F531AF8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077207; cv=none; b=OLHWELhJ2VMOxppdckBia0c6JRSww0pFglS7obChetBH2XkJFyBxJa+i03U6xfhiEvDJlDjAYcgMfrEtyQc8GpErmMmURGNSPIzXUaGjnYN+w5gsXnF9mRCGca/8c1wmx8CpA4vHE3huDC0llBAxugPecs08g+Z9okR4Ae8djYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077207; c=relaxed/simple;
	bh=r79clFkHcqAlIgAF7dPQqiJC+HXwMzt4NkqmdL+gKqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzgQR1O9efi5uA76XSxjnH8IuXeOg5xoVAiP90VWYX82BqrfDUhe2neVjU3cKMPq7+bCjEAlQuaaMkLc7imNHvQa3ox+X6lRMy7sHWVJWaWKMp7sJOFkKCa8rPBy+Uo1Ng9ZgWWH2GAGAfzJp13CNdIdXuDtjgwiTgmAGDYfb50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWWwH4Z/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWWwH4Z/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso662250b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077204; x=1792682004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOQw7g2Msu66bDzbYk3ptJu7TL6fCzl0qAToEIpu/hQ=;
        b=VWWwH4Z/Wt7fab4fvKqrFe74NRkcE+RmtxtjS2BVAyxGtRdhjhhkNIj0L4/qDMkvO4
         xE4QZevYJ7Kx3/0uMyZ0SKqsd+TQH+S8swX/Iub890xia9nlAsksPJ3CPha0WfoMRgOM
         7dPO1JUTI91BAtgE4dfEFEQOVZ7aqs9vO/4fRnegj1RFFs+5gHPEiAi/8xtdgDWYReFx
         bNUDxPxhevtNDpwMxPlQUhdgSkGqcdBcyJZU8siKWItCQNV++NDmSiC/ipMSIYTmKLLl
         jto7SnI9kxPPTTSsrBsu5qTFTyR8Ssw/QW2WaUjEJ4qLCZcScDq9PP/YOd3u0ntXM3o2
         M/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077204; x=1792682004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOQw7g2Msu66bDzbYk3ptJu7TL6fCzl0qAToEIpu/hQ=;
        b=L/LFwk58OipNUa/xUi7u7r1WKTOCW4eJc1Um+nHkD8vuFEkbVr7mC5UIJu9HeR75xF
         fZ0fsqKOVk+56IQQGA4e1+9EDolBeEx8P0ru47FyKqUjT9KeagpXF8+enz8mHleodGjU
         HxlDyxNcd2LIiKCwEajGTiIRmsdkjL4wqm4Xc/XkPCY8MSOQOdoy/rzFu3CbwM3mYov0
         d6S1WYbcTQzSKb2DInPMRR0RG1r9CXZvK/JUviuBuXiEfpSZJAfIas2oBerkgDiLXhcR
         QhvXZAJ/hl0ZY7wk1OV5Wh5SfqXInQsno+5KOKyrnoVz2L1jHA0QGZq5O1pa7xfdi9cM
         lLMA==
X-Forwarded-Encrypted: i=1; AKwUvBwyuoAGkLqqEk8bf1+hTaNWh1hL1qSahbtwaN/WUFcDJUZLGl/amoQrG5TNOCIXcy706ND6HWAlgR618kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEVnshECU+SIho/xJJFuswn51FN6ri1WCWaZRC+G947gy1V6Xb
	lhC+GxnkUxKP/VAybkdF7PMMnFS///N8qRGc5bSBkQjQm7dgiXuKCqgX
X-Gm-Gg: AYBFou34D116Oa0ab+tqM/QGAwtP2Uqr0rqsX8ih6Zdg4RlCD5hy4zLfN34shnI68dg
	wWQT0WL3TYJ7kO8vb8pWl9k2NzayO71KcsOnUGn77FVWdQHmVJuQLEx49pfaTjAQwqxhQmw5HEv
	dnJYVb2GGaraXN0MYvC6t8B835HoYVtEMz7zWTegIz0wf+vBT1LeJIYzV0oXt/GvR4sDi8evPRM
	PhLFaroFb8t93bps0J9xnz8ic40RW1QyTvISMTnyowQdDBLauP3mTWZmeD85UrsVovqedngowsR
	P8chqv1zrR3pcyrta4+SvLTNqCQSO/hQz6Qif5/TyaQxsExAOXaahP7+wZbaC8Ei/DvG3EQHiWm
	/cu+4m44kvr3i+YbpmlJqcsMcIi2EXVi3Nc1e8utQn33YwQfz6wHkDHl2Vg12eSukXGQQlJ633r
	Rhb0DjCR6huGcv50Gdxu6t2PH2Nssaeqy3tJu9TS/WjRYRDnTLIGupXkZ0MdXoSlbu9kA8i9dJ
X-Received: by 2002:a05:6a00:c482:b0:899:465d:c8ff with SMTP id d2e1a72fcca58-899465dcb17mr8864486b3a.13.1792077204050;
        Thu, 15 Oct 2026 08:13:24 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:16c8::245:c9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm2419097b3a.1.2026.10.15.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:13:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harald Brinkmann <hbrinkmann@braincalibration.de>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: saitek: don't dereference a NULL hidinput in saitek_event()
Date: Thu, 15 Oct 2026 22:13:18 +0700
Message-ID: <20261015151318.208115-1-ngocthang2710.1999@gmail.com>
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

Bail out early when the input side is not claimed or the field has no
input device, as the other HID drivers implementing ->event() do. The
claimed check also covers a failed hidinput_connect(), which frees the
hid_input structures without clearing field->hidinput.

Fixes: 37c492c8f6a9 ("HID: quirk for Saitek RAT7 and MMO7 mices' mode button")
Reported-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eba2b3201bd25a97cddf
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: also check HID_CLAIMED_INPUT. hidinput_disconnect() frees the hid_input
    structures without clearing field->hidinput, so after a failed
    hidinput_connect() the pointer dangles while the probe still succeeds
    (->raw_event is set). Reported by Sashiko.

 drivers/hid/hid-saitek.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index 6fe7c087c594..7e1160a24230 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -151,7 +151,12 @@ static int saitek_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct saitek_sc *ssc = hid_get_drvdata(hdev);
-	struct input_dev *input = field->hidinput->input;
+	struct input_dev *input;
+
+	if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput)
+		return 0;
+
+	input = field->hidinput->input;
 
 	if (usage->type == EV_KEY && value &&
 			(((ssc->quirks & SAITEK_RELEASE_MODE_RAT7) &&
-- 
2.43.0


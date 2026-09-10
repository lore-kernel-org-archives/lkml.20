Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD34AB1B5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057419; cv=none; b=tf+26Fpl4CRRJE+i2BuOAqkEO9CJClvRrBvI8NN2ElpBLNwclpnoIc06gay3Ja2w3T5aIlSllnHb5RfMgoYDHgP73JLdboyLFI8UBWEBUqK2kWwFIxt8PiB3EhCDIEaPkpq1CMM1AIMzAOq5W5q9JPAPkJH1gtdKR5weeA2LNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057419; c=relaxed/simple;
	bh=kjpF59fe4ubdCkFvENJAVeCWzv0Fgh94P0CK6dGCBfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqi9Xv+h8ePX0VfTWkG7LADiKNjsMF9wKTTSfnELWL+9cb5dKQQ1CEQpO6yAcIsfL4E7kViPfmNbmadgaqoLJEYGZS35LOefJDmUE7/SBnAOy8ybCJYtVkeqHm74OSO2ecf1JhPDkkoVBx+eZqF9Tgw82jNBsihqzNXgST0I71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7v+Z2n1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7v+Z2n1"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so1085612b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057418; x=1789662218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERs0ZBdo2a6X8YAmXloXdwhR0inMOSFiQbLLSRZtan0=;
        b=Q7v+Z2n17/VJ/L+PXGe7WlkcqwxZOQsbW431z/jVXAwY/ngB4i1vRxb8qg1jmd/dX3
         O9wNoHnoprUCUvLxMuv3pWQ+aq+2QhjYHQWCeovs5Db7px2eAFY2i0jTlADR1LmF21aM
         ERCHxtffTpphvgMRw82QkrGSps7QuGV/v96Iprq9hMVbilj6CYVr7XXPD4IURvW+Tc1c
         sGc3R3paHUVjmT+ka6YKddie6xBBP7DizAb4ZMSVHPyLson7Wzh4ecjguMNJgWgAK0Uk
         6tDccap6g7QLvpmymsr6kJy0ctbNObL1Rwsz1ICDhI5QocbZ3HngckeY51gJPOBfWdET
         txkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057418; x=1789662218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERs0ZBdo2a6X8YAmXloXdwhR0inMOSFiQbLLSRZtan0=;
        b=J+aG4x6hvcCht7FUqyuKI4O9a7VwyktWAeW56KUMG+OqvbD4RjOgnLmA0gE985vAOi
         DAS6QOL7Wrm0+zZm6FZvGTnUyyJiZrG9zFjMLHKp8ir8cF9rG4AMSP8qSoSXmlS3BRTh
         T6TwT/eRNTuXdv3bvGG3OS7bg5exZcNuMf6KB/3giT6bNdQU8IhSlsr0x5qXV9lkYxTG
         hrwSk0gfkT4smzpd+0QC4wkcgeEQBVCHvA4AxkE/jdp06szBUnoAEokl0np0TJ0XsPaK
         KbMfEmkJ2TuHUVUNMNFkBb9/hiQ46602xwo6dklFyZmbXiFtzwIk4MAbLcrZT+WK7VnA
         IzMQ==
X-Forwarded-Encrypted: i=1; AKwUvBziodWX6O4vKmjdUw5qUUg+5rXhS1ws/aqIwgusHrK/ZWAUtkrKubJVJnWceyX5X0xn7B30PnVB3mcj9BA=@vger.kernel.org
X-Gm-Message-State: AFuF++m8hW3hB9Iwt3UqDtc9LZcb4DeZRuE95Ja7AnPGJBGU+YiIXcr4
	gHCBxsUVl1p1K3YZn3N9Itr6sfG2XQSpZ//dUVgiD+SjQrwU0Q6wwC4UNFhYpw==
X-Gm-Gg: AYBFou0rDm1hhqKdrIGT/STRxP48vvK/SAjF/dxL25SQT5cYG0/LmlnwDWcGU61JUbz
	wKcwogP9gjAVZ1q6rGFDRtabpDs7J7QllpI4Y/eSnU5WHbXSsUGnHeAHAC6EmP3/0r31oIUiXK2
	LaDkNreMo/bKKyUVPJKjaleY5Fh4Tblr6b5wiDCwQdk6WRyCpDod3xFuE4v2MqknbeAHgAVvMuT
	ZzZR5fphypP1T+TpcMcxept2xru3q21oviGpxaBbml32LmhgRJBFNFF8X+6QPkr9b9AootfYSh8
	dSr/QdqVPdxSH22aYfr/vobQaCtSUtOSrjaw+NQDsyLbnFJdrck/HQhaJYx2jjPVaCSsWUO5fd4
	6cA4mdpvU7HD+94BcxC9CzL0p2/JbxszY5vcglcxh7eXNangEZzXl8q0KxIO1+/SqH+W78K3ff0
	jRt4kLh5JlKzWXx5nAUIKIZtx9vwUHXw3IwsXFUlr2g7hZLKfJjKZAsQ5IlBcRRFt+ws/AWdslq
	jFAyPmbKh982RO0FtE=
X-Received: by 2002:a05:6a00:80f:b0:857:7384:b5f7 with SMTP id d2e1a72fcca58-8694801d67bmr8118952b3a.19.1789057417450;
        Thu, 10 Sep 2026 09:23:37 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86343e6dae6sm6895066b3a.11.2026.09.10.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:23:37 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	sashiko-bot@kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v2] HID: multitouch: use GFP_ATOMIC for report/application allocations
Date: Thu, 10 Sep 2026 23:23:31 +0700
Message-ID: <20260910162331.31578-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910155305.58E4A1F000FF@smtp.kernel.org>
References: <20260910155305.58E4A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt_allocate_report_data() and mt_allocate_application() devm_kzalloc()
with GFP_KERNEL, but they are reachable from mt_event()/mt_report()
via hid_report_raw_event(), which can run in (soft)irq context off a
USB URB completion (e.g. dummy_hcd's hrtimer softirq). GFP_KERNEL
there may call into fs_reclaim, which lockdep flags as an
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} use of fs_reclaim,
alongside a "sleeping function called from invalid context" splat.

Switch both to GFP_ATOMIC since neither is on a path that needs to
sleep. mt_allocate_usage() is left at GFP_KERNEL: it is only reached
from mt_touch_input_mapping(), which runs at probe time (hid_hw_start()),
never from mt_event(), so it does not need the downgrade.

Reported-by: syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=093e05755c2d99caab91
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
- Keep mt_allocate_usage() at GFP_KERNEL. It is only reached from
  mt_touch_input_mapping(), at probe time, never from mt_event(), so
  the GFP_ATOMIC downgrade there was unnecessary.
  (feedback from sashiko-bot)
---
 drivers/hid/hid-multitouch.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2c41bacab1ca..9b78f8f23fcf 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -604,6 +604,7 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 {
 	struct mt_usages *usage;
 
+	/* only called from mt_touch_input_mapping(), at probe time */
 	usage = devm_kzalloc(&hdev->dev, sizeof(*usage), GFP_KERNEL);
 	if (!usage)
 		return NULL;
@@ -633,8 +634,9 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
 	unsigned int application = report->application;
 	struct mt_application *mt_application;
 
+	/* may run from hid_report_raw_event() in (soft)irq context */
 	mt_application = devm_kzalloc(&td->hdev->dev, sizeof(*mt_application),
-				      GFP_KERNEL);
+				      GFP_ATOMIC);
 	if (!mt_application)
 		return NULL;
 
@@ -692,7 +694,8 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 	struct hid_field *field;
 	int r, n;
 
-	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_KERNEL);
+	/* may run from hid_report_raw_event() in (soft)irq context */
+	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_ATOMIC);
 	if (!rdata)
 		return NULL;
 
-- 
2.43.0


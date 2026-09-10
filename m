Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A349B1E6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056755; cv=none; b=ZOcsyAUqcCW0vC7DzQf5GKOoK2aJffJ9EvOZY+2QzzdpwoCxqhRtp2NEnI2gPxNdR03sCnCCr3sMX+WOhDQrKYXOOMTrhUvMh+dFQh6f/LEwrBog2h9z6UELlUv9QO622uzeUlk4FemmSdADEBODBySMnyO8Xp+a8/MFFmUILA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056755; c=relaxed/simple;
	bh=GXalrwLzzTTBgALbvFODGq3SYZ8bvEu2vVVnxJtIZ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZWQIjKP3RgSScLtdSsEb5iU2/JZs5nimwEfsqmCWLik14IS63J6kSfjuArkC68Qg9QazRjHUYVgHhXMQ355j1TQPrxQz85mWym2yvpI2YZEmSxbTBlYLAjVDJu43d+CJRaTyPZPbQjb2u7CwFsQ+hooGfBJ9Lkfzb/rH5cY3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3ZlEn8q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3ZlEn8q"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so30967225ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056753; x=1789661553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzOXKkjLjek2eBf4/YRRMWedpMo9OjK0tCopm3Wj9N4=;
        b=s3ZlEn8q53hsr4Fv+ffw/oRctP4I26XTLd7ygfUo5w4lQFFDJqlkTd3oSZ0PHK1hiu
         kbTadp/1a53W8ABRu0zYSDl54rttYsFJ/RFtFzy/X2bX3R6MLyLUvvL8Ht8tULW/mrV3
         X6aWmtljXdKsJ64QJY9VARlZCf1dRLkx8ZQnP6Tpla7kPCQxW9u95EA6C148bz3bMuvZ
         mvb1bKfY4HKefCYr5oU/5bHz+rmz45SEHEuuuY3aWrhj/C5rq/7OZgZnZFciVtdXIVkU
         TGERfQdg72c1P8CLr4a9E7LRWBI3taC6HH960NZ5qRE+DX0vUEyJXKVqkyxNWRO5ollM
         vNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056753; x=1789661553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzOXKkjLjek2eBf4/YRRMWedpMo9OjK0tCopm3Wj9N4=;
        b=gC4MkCXJR0VVcYT8tMQuTzmPCWlvQjxEOKAElZgN4Hf9TaaxGjcsiCyMJ9lTmmzj5K
         2dRp87BK+BnzoJkmFJiTd6+Z0nIvhPMWfyrSfQFPx1XKa9XFMwWn0LSsbAstYP1Eernd
         FNvVt/iEb4vFLOIm2f29hd8JlxjBJURAP/TOkm/B7uHnpdSeZF7whYCIl1kgGQdJhapw
         4RVbJFFygll0g6WFe7jRP7A4bmDdoVaovWPoLX3Ymw+soa73hyW7Rl5aSPrMdS1CKjj3
         yKh/6bs4AqKIiGZOVRch64xwlKyBLzbwqOioAZnQ+Q7LT76pI5rmuGt300wpeVGtNsPw
         Ok4g==
X-Gm-Message-State: AFuF++lMhJYVl+BL/oCMt6mPY2vsEWD3RWkASK4BTQ/0tX1mR8D65aS1
	UE8lo9SjndlT7wQ83Keo3AtwerA329OIv40ePE4inlZWF1yq/YZvzan5yTyYuA==
X-Gm-Gg: AYBFou3qNk9koOctINZTw1DW74DxyeEq0TB2j6CDhBGI5/kdic+ZlLxH77FBtSXRk8r
	mf/J6nJN4s3Hw+JpzAMeaI5IgkQKmP+Da2GyKvAVYY+ajvZhOgMRjzzCDPBxKNbwcXjxkn1wdTE
	HtRfG/2La5S1VVBYqUs/UODrJaen4YgQ1Lm+SRGPPPBHWem5rCFtzJXuTt85DkzsQvM485tPOac
	5UYzzpw3rFHwevQhhOeCZsOHWKE/douCTMmUrh4JtAiEjzYnUVfve5i1zTAvT2zyr5lP6at8lTO
	O7zuk6d30/E9mcy0TgweWtp8zhv87CYZoCDdE7vicbigGC/27+hdyqA4kZoA0mnnt0JQgR97JDL
	vUDNVRlaTfiiZRxw5dJiVlmZC+6iKJD0RLlYQrr7WZ0u8SpliupXe7BwxWqtVgDiCJvsX3MLqln
	9NSGSfZcHsEiQ4qbBE+EZMfZFVr3Qu50wzlcipHbEG00KU5gFi14COspgZMDOGORc9v3ZHIub2S
	ViNebVuGBRIfwl5Kio=
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr21419132a91.17.1789056752638;
        Thu, 10 Sep 2026 09:12:32 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm281031a91.17.2026.09.10.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:12:32 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+8996fbe184c5b84f89d4@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: fix unbounded wait in pn533_acr122_poweron_rdr()
Date: Thu, 10 Sep 2026 23:12:27 +0700
Message-ID: <20260910161227.27945-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn533_acr122_poweron_rdr() submits phy->in_urb and then calls
wait_for_completion() with no timeout. This runs from pn533_usb_probe(),
which the USB core calls with the device's dev->mutex held (via
hub_event -> usb_new_device -> device_add -> really_probe). If the
device never answers that bulk-in read, the wait never returns: the
hub_event kworker hangs forever inside probe() while still holding
dev->mutex, and every other task that needs that same mutex (e.g.
usbdev_open()) hangs too.

Bound the wait with wait_for_completion_timeout(), matching the 5000ms
timeout already used by usb_bulk_msg() for the TX half of the same
exchange. On timeout, kill the urb and fail probe with -ETIMEDOUT
instead of hanging indefinitely.

Reported-by: syzbot+8996fbe184c5b84f89d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/pn533/usb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..ad4d84614241 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -416,10 +416,17 @@ static int pn533_acr122_poweron_rdr(struct pn533_usb_phy *phy)
 		return rc;
 	}
 
-	wait_for_completion(&arg.done);
+	/* device may never reply: don't hang probe(), bound the wait */
+	if (!wait_for_completion_timeout(&arg.done, msecs_to_jiffies(5000))) {
+		usb_kill_urb(phy->in_urb); /* waits for the handler, so &arg can't outlive us */
+		nfc_err(&phy->udev->dev, "Reader poweron response timeout\n");
+		rc = -ETIMEDOUT;
+	} else {
+		rc = arg.rc;
+	}
 	phy->in_urb->context = cntx; /* restore context */
 
-	return arg.rc;
+	return rc;
 }
 
 static void pn533_out_complete(struct urb *urb)
-- 
2.43.0


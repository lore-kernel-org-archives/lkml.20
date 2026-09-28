Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27D495524
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597560; cv=none; b=JqDhbqgIC/7VrJqk+Atn/At9bb76RtYti3GEJD3E+630DhifmOxwFBTPge2MLEw/OozWET+Z18O/VUqYd1H9Epyb9LzZ7UFCGk7XnOWgiyC6WulcLlcFxjDgG2oNR51Av6CjDGqHZzmvKrwRpJ19poud8Df9gO6WEUnXp50JMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597560; c=relaxed/simple;
	bh=1RLTg6xuNbSjs+Mn4U2htPWw5wZnbKunkIGvH5P2w3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YvMBLUkssUiwaBuiDA3WBEdizzpL6orS0mZactyBWPZM2WfrlXJOQl2Q5u1wxH6annzfNGksWX41drGUw9OSLJXQxUAr07DXa//Pevgn22F0LKKT+2sECzQbtCZ0ws9E2w1RjWYDoDgLKj8kZwjNnqKPEEjmBhEALJAMrcin2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxk9Z3dy; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxk9Z3dy"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04edb5so4925483c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597559; x=1791202359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+Cac6ypgXdq09Dr7ETlbYkP1qwqow9QwXrDgwFzEeM=;
        b=sxk9Z3dyR+9xblwUuRrnbZCSoDs/yLyTKIZiEB1gLAob6qOjuloVafy5fsYqr+Q8YG
         zpGopaex/zKMiBKV45zG/4rs/BS2kaDSM0z4yH5au4UwexYRWRm2jyPvrB/8Zq7Ju1TY
         mlwNqz7FmmrkVZiPo+2SAN9eUp5Zz8aG4n3uqK239aCTtIf+3b6RLUp/hKEWuVUzIKzU
         m3uxT1SQvJB/In+fUt50mo88OcvhmIqJgy78J8vezR1fOkUWv754Ets/76Gz0IWG3CBt
         6QnX34rDUIiwrxw3RHiPOZRS0Fa1p0B0MbhMjRP0DJJGTvltTLIin5FBSezVLq5L9jyF
         Zo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597559; x=1791202359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+Cac6ypgXdq09Dr7ETlbYkP1qwqow9QwXrDgwFzEeM=;
        b=Cj40bRdoI5OL1Oe7PvgQLoAMVouTGbdYfPgL34DZtGAaxom+q095tUFQxLyLiXDuTS
         xn9pEMK39CYHyucn7tqpnVCG9SqTaaFsUKuH+V2siKlP0uNCyr5GBV/OQqcupTvEqRmz
         hFWEwQuzobpgZ0/8v6hfIiPqVkpcFGh+3b8jy7s9FO1fVEjy8NsOjHK91bpdyACw5XCk
         tkpdjDU81AdSW2FFm9o/W43k2dbopz3Vt0xyYzRcRfk9jG0DbpN4Z9oLXHQkmDbnMieI
         NFykNMcvw2egchYwVWKJ6U4ceykDj2HJFvBfMC5fQrt6loaiLX9J1MLgWoyYd3OyQyFH
         bEjw==
X-Forwarded-Encrypted: i=1; AKwUvBzvyZTA5trS1fA9YnTU/BAmWMWeIGmZFLBFehLkWytRZWg9+19cGIx3zY2HnSX7WscDJvmNTILwEDDSLvA=@vger.kernel.org
X-Gm-Message-State: AFuF++k0tZazn8jSTpCg9uFOQ+OzQSbwQcbhy+T24z2b4xh9y4YyZzW1
	Sgs5YvRLhZ3BMOMj53sM9+pBvwnnkGwhUC2GPrncvuOEF1z3TAiZGgF7
X-Gm-Gg: AYBFou3J0g4B5pDtcY5VZOQJyZraymbqPLZlaLc6lyyhqo09rNLBbunVZ2YaUfOll6A
	s5YeEa6RoqJKAJHRcAWUf9G0z4WKBaEWtxw2WElmuTsmdfaWET01hNoUT76qVMNkpzq6ueD/3Do
	7HB0O4/oeaZ8sVwtW0TLXSU6LmUwoN3DgAht3O0jeG4RsfQaJHBRn+cmIQxeN1xS1TyL/9j83Yl
	3mRlnSOfa6/AN1wdUBqaNxfGEsYtbZlbZgkYwgWnfQQO2i22unH4BqBaBdMWedfZkB/0TxF+7Vj
	u7qnAFZ7Hk9uP+Kjyl70R9AY1Zdj8dWRok8gUVryWbLQrAyWV1hwOUMqYz82X3FrXHmTSiD+oV9
	O+gOq1A70ngFVqSZ0V0fPGq931CPY8E2YvbGGuBVKQrnQ5VlgB3353F21eKjBJ1Vub2LYmBkZZS
	x/adfjKHn9d/fKazscnVbydip9P4BYDH3+8Os48JTewI5j5o7T6oBFBGtZr2Q8plv/4omrz34sz
	Xg2mR6X59mZO8b4QFINzD6Ff1Ow2Pr6EK8BQCn9rwXP
X-Received: by 2002:a05:701b:241a:b0:13f:c85d:17bb with SMTP id a92af1059eb24-146ce1a8af3mr9531539c88.1.1790597558447;
        Mon, 28 Sep 2026 05:12:38 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:205:7fbb:c742:e03c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm33021156c88.14.2026.09.28.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:12:37 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: jarod@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
Date: Mon, 28 Sep 2026 17:42:30 +0530
Message-Id: <20260928121230.35359-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ictx->dev is a raw pointer to the usb_interface's embedded device,
cached in imon_init_intf0() without taking a reference. On
disconnect, usb_disconnect() can drop the last reference on the
interface and free it while a userspace fd for /dev/lcd0 is still
open. When that fd is later closed, display_close() dereferences
the now-freed ictx->dev via dev_dbg(), causing a use-after-free.

Fix by pinning the device with get_device() when ictx->dev is
assigned, and releasing it with put_device() when ictx is freed.

Also drop the dev_dbg() in free_imon_context(), which only printed
a debug message and is no longer needed.

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
- Remove the dev_dbg() in free_imon_context(), as suggested by
  Sean Young.
---
 drivers/media/rc/imon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 049a73b5f882..562a70186db4 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context *ictx)
 	usb_free_urb(ictx->rx_urb_intf1);
 	kfree_rcu(ictx, rcu);
 
-	dev_dbg(dev, "%s: iMON context freed\n", __func__);
+	put_device(dev);
 }
 
 /*
@@ -2253,7 +2253,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 
 	mutex_lock(&ictx->lock);
 
-	ictx->dev = dev;
+	ictx->dev = get_device(dev);
 	ictx->usbdev_intf0 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf0 = rx_urb;
 	ictx->tx_urb = tx_urb;
@@ -2314,6 +2314,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 find_endpoint_failed:
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(tx_urb);
+	put_device(ictx->dev);
 tx_urb_alloc_failed:
 	usb_free_urb(rx_urb);
 rx_urb_alloc_failed:
-- 
2.34.1


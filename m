Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43562582B9A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971238; cv=none; b=aEN0+1pO8wEBA7zAhnlgrsW7a5s0vsBqXTM8wTRCiW58vJb4CUUextYHAc8SrLhwfYmXQL8dOJN+TWxE2qA+ydo0mZ9nIlQBDLfx8w6Ex28FQp2Vg2Ymdp7ZHcvmvVekqEJy4c+OFQ7ZHBQkBS8zNWhCAW3ua5Pmpq5XQbWowTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971238; c=relaxed/simple;
	bh=AOZLttGhmUv5jquu2+3I7Ud1egnq9QSCJNwq8sO2MTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjPMZL5sKOErZWIZ/KTW28HmoStQSxwRvNx3GTjQfyAXzXXgFsvnfKK15NXo7RHwLgdGWqPXbnmwoUfC4l3zQb8Si4efbHAMKb0OEmD4rCh703eD8c9qQV660LzkruW/qo6MrTEfZPaJoT5ufs6ZpMLZfRM5GxflOdEJ+oaPvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDhel7bb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDhel7bb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5036367a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971236; x=1789576036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WQUthtyqHxeRsXcz+ABlRT5Bj9eULs6bP863YlVETY=;
        b=gDhel7bbTlJ+o49XgvkDxBSEd6wHvNKVolXLHtFLyFdwhgi6gYfJzQFmnmoqGnbm9w
         OU//McmrbM+lgQNQOJVgTIgbFETGRZo7otW+1jVmFdcuZMnXJKiDqWMJ/bPia64DxfAm
         b9xBxMSfirRFY1W08WJkc9/Ued18W5pQ6z/qPwBKqORaABJun0u/IFvprDbP+sIZVJrj
         lyjXkKaoWsfINGL/LNG7AbQcOI59e/8qLECe5OZsDmyQs+UKiS5E1c5TohaxvEMS707d
         +/bSQ/Mi0EwOx0NZqJk/x3XZykX6+Z/Fe103+W1B0ckrqyaFtikjKLX9URqfzDU+3bFV
         Likw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971236; x=1789576036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WQUthtyqHxeRsXcz+ABlRT5Bj9eULs6bP863YlVETY=;
        b=p2Ru9SSJHQozoUshbLY7Z/GMaJ5vtJXjK857VGcOpX0uJmEbnzOBV/h41miJPePXwE
         6M0nljXtiuCe0e9hldzasoIW+zf3BDpAUuLEMgfS3f7Wv6BV0THtaSqLAcStlU3kVXp+
         urX8jCX4nmi6fE5FiIGmRfcUt9tNVGocJ2SdZU+AKJYBlWxTCwKUiYGgTIEGNzCBxG49
         foTiZx16C+dWV9Kad7cLtse+CvXGw/4uoDO2XiP303vjSjn33WNU0hNmIOjf57dUgMGe
         e6WDLLeoHjaOfiQwsKK40V7/0J8W+sMaJ/aaS5LI+zKUPco6AcvI73Khsiz9PwaHLfDU
         w9Bw==
X-Forwarded-Encrypted: i=1; AKwUvBysBgaIduHqNy6qj3ZNuH6GRDSP5acEKmTIMQXJ+Id8gDKpviyngl1XSZBUEBBXVQXq+P2XC6y5e+DGGIM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSngk21qksoflakBaaHrYH0eL7GKTbQ3xJ9xVliGi/k4zTDYvU
	bAfAuoO6hxOdWCW4EwOsb3HWwfKjDEveTSMxwwtY2JPz1ScoB25vgfNk
X-Gm-Gg: AYBFou33LKcu6iEG6xbDK4lKeCiemgf1aAwKFoFGoZYuIEOgIHAQCvUlKuK0IR2/RCo
	XjPk+rSmTNrO70BPfJDOgEpB+/5Jb0UiCzUp7RQdHksqDjzMly23jgh9ZS1KiMgYgoHQEb8+49C
	M64wvsLxQd5eVE4FTyh8cqK3yVc7alqxTc2FwnNLmL+/epH2UF2wPt/jwzA44qYILSsjAswF8qg
	/RzkeIlBPS5jWAQJg5Cr3p8lo1emkAcq+AeOSqPzs8FCQ80QILkKbS5R9G2O7osYrUvDIVAIO5B
	zgmm2iRDCyVYv8M5mORNHKIKKxoKXF15iJx+IS6KO9A50OGsAxnlvcw3/l8c7pID7wlZRflI3/K
	IBMkJAr7NVMPe8qj71Y0M5KHVtINcKSDvGpK/LvC51J/4uBodZTxZJ7rutI1a4Q7cjsDRZ/HY6m
	8pT+2ROpS71cX3jecI5aCteJAeF20+pfinCZ0fpg0nd++GT1ZqnAhuycMMasi1iX4MwuIns6HLr
	MqM6y/I+g3Y4z4NOjwPEvzl0DzAyw==
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr55263314a91.12.1788971235372;
        Wed, 09 Sep 2026 09:27:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm174254a91.2.2026.09.09.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:27:15 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Wed,  9 Sep 2026 23:27:10 +0700
Message-ID: <20260909162710.28740-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ene_ub6250_probe() sets us->transport but never sets
us->transport_reset. get_transport() only fills in transport_reset
for the standard USB_PR_CB/CBI/BULK protocols; since this driver
matches on VID/PID alone, a device can report any bInterfaceProtocol
value and still bind, leaving transport_reset NULL.

When the transport then reports an error, usb_stor_invoke_transport()
calls us->transport_reset(us) in its Handle_Errors path, dereferencing
a NULL function pointer:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:0x0
  Call Trace:
   usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
   usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
   kthread+0x38b/0x480 kernel/kthread.c:436

Set transport_reset to usb_stor_Bulk_reset, matching the same pattern
already used by the other subdrivers with a custom transport function
(alauda, datafab, jumpshot, karma).

Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index ed49a3bc859c..3137c2cdd021 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,

 	us->transport_name = "ene_ub6250";
 	us->transport = ene_transport;
+	/* get_transport() only sets this for the standard USB_PR_* protocols */
+	us->transport_reset = usb_stor_Bulk_reset;
 	us->max_lun = 0;

 	result = usb_stor_probe2(us);
--
2.43.0


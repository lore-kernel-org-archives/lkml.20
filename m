Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CE3DCD95
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356052; cv=none; b=e48vZ7Ra/YBmWkhDX035wBx3JRx1hiVbn9BvhcjVwnrtgdG/eKMPbR+KYV7x1gnVmGlX9AMydCQIebJhDMAKv/kxH9KwMuFSMwVKkStmTGzGrVIG4+jYsEFpDcX7AhDDER7RBLZ7n0Ys3p9rK5y359gHpfx7UOyGWlha1g4Dqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356052; c=relaxed/simple;
	bh=3POjkudjwJ6EJxTxrfVNUQfMbWObNEMuI07xROIvu0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIdjXCFfRWuiFv1unEgvDaMMK6GEPZCffzIayrV7mQEgSXdzJOwvnx0Eb+R2utauN/xc+sIViEMQ8dRMbZM6fUqrYOv+aBhjlgH5+Z+B5JWKLgMIT7aUKESXCmgCiPRWskyaSzbTY7rvBuXI9xkMSp3tBEwJ+PpYxVJEGVSA4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls12/Usw; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls12/Usw"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79223bcfbso467087a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790356037; x=1790960837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU0uuuuRr+p5OKNIYAUGPnmlCF9GOux6FtDbWrmbBmY=;
        b=ls12/UswfmD2c8TY3P+N3aZZ1F73eYVSjDZwmKy7n6iORAnUk8PG8zUtJ2YyxUZNj8
         lcMI6hcTMH5X6etUWqlx1FkET6L4FsYMgo15eQpdbX4yyeTmG9NNnd9mrQEm8Z0SpQuc
         kQRUQPVBGEO4mBCyuSR7cH7ilV/j9NNTdYBSrB5yjmH4rHy2qx1IaqbrMYb+DKzs96YI
         mHra2QeI0TGQzulnT2pUO/OVcCGzybgNvDcfwHJnspnaDE2Vbfk/e/45KNZjnT6PV53x
         WP1QbkdYEiLoO3w4yzQVdf88I9w7BlkONi6TVrBhwMiR39r/GCT6c7v760g9RdIzVOO3
         mZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356037; x=1790960837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU0uuuuRr+p5OKNIYAUGPnmlCF9GOux6FtDbWrmbBmY=;
        b=1FRpapJ1tX77XxNWhSZ1eOT6KiAJAFynq4C6P4F3O77WGUbY+Y8KYERjVztAYaAkkR
         xzeuyd7hhwMUM6XJop1UkAIa/GNLs1CeKTYomX2/e9RndZ4igkGqqBk2GYxxMI2Udi6g
         bEE/DgBDVQtvAJFZaYfjHjobZ0MfiUFfZzsAvQgQDAPYhDPX8QRCLao9lB6TpJnKAZAJ
         kiDr4UlzB3XSe66icuHqMMWmGYMHy8U/lIldo+twirbc6AuVQv0RIsMXOFKttX6klwoK
         vb6NUWLz6zANd0nC83FIdoMGpWR83PiP04WQtsxO+ImsLV7TPgtRrxGmuGwetR7NRccD
         yM7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3qUxdjx/VCWTwYgAZP23tOipJYiX7CcKFYMImN7zC4AYw33teHhYhv0jC7stniDI9gw8b97JDbGHXTWk=@vger.kernel.org
X-Gm-Message-State: AFuF++n5iraOv41Grl8CpfzmbkfHHNjtKDpH/UIkQQZuGOxNbOhSV2Jg
	SEWDmbkJ0bZVFZhWzSKw6O5uxZj/VKmV0aiRyx4tFa8uN4q6ZEdEVthQMG42vw==
X-Gm-Gg: AYBFou0wqzCwzniZo13ix1UA82b68ngHmh99Yz0/s4Kp6hklucxfdOXqDEs4M98d+Dy
	XiFTgnlB2Tv5am92+OJA3wBwrJSz9qTLJQ3+cocibpirzUi0+iwMSKvsFXIvtI5Xfq4yDarigZI
	RtRSalsfh8G9SKDsu18GpTCJRug7c4t6QCzlPDu4Er2/IJCpFhDcSRCACUeSkzgZP7UXNZ9Y0nU
	zeXfzvCuforHcsM/J0l5kwzCZBf0S9ryM5uke9K5i9xtbZID7BYZowIkNDm+BMig7361JGDMXCH
	YvSzS+3m3soi7iSuZqn6mUxBE3ONbyQ0Lg/yvcL6Wt/ZCRsG7NeXkZnk+Ska/mHDNYiN83XWNLW
	OnmIvyteRBidUfhqY3RmKbvrSdDE03Wxo0/it6BwK4lhR0PX1n4hUWvY2R09fMnAJ3ClNoIDBZB
	8uJ7YXbowpeKDlqEH959jCsDPoMvmkLbLHV2Od9LawGz2OGe/pqkib0nPDJCybAMzuxN58KZTRY
	rJOEnlk5Ta3mk40wRb5NSreks8=
X-Received: by 2002:a05:6a21:e93:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3de0e97b9camr6669562637.70.1790356037407;
        Fri, 25 Sep 2026 10:07:17 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:6850:49fe:a642:bbf3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8811c94d5d1sm285987b3a.21.2026.09.25.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:07:16 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: redrat3: unregister the rc device when probe fails
Date: Sat, 26 Sep 2026 00:07:11 +0700
Message-ID: <20260925170711.22447-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

redrat3_dev_probe() registers the rc device, whose input device points
its name and phys at strings embedded in struct redrat3_dev, and only
then calls redrat3_enable_detector(). If that fails, the error path
frees rr3 but leaves the rc device registered and leaks it. Reading its
"uevent" attribute afterwards dereferences the freed name/phys:

  BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
  Read of size 1 at addr ffff8880272bf758 by task repro/4968
   add_uevent_var+0x183/0x3a0
   input_dev_uevent+0x162/0x900
   dev_uevent+0x2f1/0x870
   uevent_show+0x1ca/0x3a0
   ...

Unregister and free the rc device on that path, mirroring
redrat3_dev_disconnect(): stop the URBs first, since their handlers use
the rc device, and only then unregister it.

Reproduced with a raw-gadget RedRat3 that reports detector status 0.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Cc: stable@vger.kernel.org
Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/media/rc/redrat3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..e9dd563e9cb3 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1111,13 +1111,19 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto led_free;
+		goto rc_unreg;
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
 
+rc_unreg:
+	/* URB handlers use rc */
+	usb_kill_urb(rr3->narrow_urb);
+	usb_kill_urb(rr3->wide_urb);
+	rc_unregister_device(rr3->rc);
+	rc_free_device(rr3->rc);
 led_free:
 	led_classdev_unregister(&rr3->led);
 redrat_free:
-- 
2.43.0


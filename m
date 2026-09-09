Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D718286417
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914888; cv=none; b=JgaOQhzd5UTijj4Dg601nZW9+3saz8q0tIVfEZWA5sCrpoEVXiXNYN2rf9PmmhkspZ8V/V0V2j18wP8Po19a9H12N0pmWUReh87kskOOvqtIhg06bCJ8W5JhosnTZd8nhhi1d04+Woa7mMSvY/4enY5y/11sRRcYHWtrsxJnbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914888; c=relaxed/simple;
	bh=0OBuBZcDxz0yXlYT5+7u18CLzA3bRaLFeD5pRVsO2dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I263V9lMndG5Cu8TBujnlOhAzJ1xGly5ZcprBt8UQplUy/qH3DQlGGBwRw4+PxCdEfDcD0LtxItSJtpbio/P3hRqE6Q+2m8dGUpvNCSkUvLnwCVjkWvvFJD/WLECrhUAC9m3J4jtS3POnFaH85kWeTPr3eTSN9m/CQ/fxmhtVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOT+FPVt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOT+FPVt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5cad1a6baso49098225ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914887; x=1789519687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDxT1/TbsBfAKnq8p0dAQp20MRQIxoi4F3S/Z4t7HCU=;
        b=TOT+FPVth/jfGzh7qmkkxvwpBQOvrl5eYewpEpfN0VoFstjn3/ggWUOX+u7bi7i6sc
         w3RRyv54Feg/CmhehVbzXpYTTitNDIWgDNzOBRDw5CqeSH4ThOIzCbWBnnoJyKhYKxUE
         ch7Egl53t9IVw1C4MyctT1fO6Cz9YNudpyvOV0ANK3yjJY3gaQ1s3PNiRcY7waM/ugTv
         Lq3dCDrF9QPk+6+1TDtINCAytUyAF34Hv5+iLu3lqiZD++9XiQBOmI/L/hsffPhZKOc7
         NCwAK89A33GtECcZ4hdRDwy3kCa/60SYbAyAFM39vtCj6lY6xjKhySwUp5pE+NhVdlkS
         YaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914887; x=1789519687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDxT1/TbsBfAKnq8p0dAQp20MRQIxoi4F3S/Z4t7HCU=;
        b=jmOrnztX/HAU3xg1VchVcZUggqvGTqEvc9YUUC7NqJJtRiyN4Lq+RluMuG+wS2xkGl
         3jFpMpyiSymMr9NuJ+CDXFUUIyzKLC825/y1QknuRtXfpKsWI4bKXDa9nJXikkr5bpXR
         bN7ZH+SzKzNSsqpfhui0c5odd5tT01msjuBZ3x6Xa8M4wm+SFIadkPbuLXBozdVVIN2W
         UIlRmsFo6NSwvF/440IuVizaH5TEDVoPbyjMnl+T7ghE83ncUnsFU0/3je+BLS4Bo8DK
         jKCntehLSAQDvL0X0NdOB1VumCGMxNDvZVN91ww6EN0Z/vQDLcPlXJWwMq+o8Ejh+Qr6
         3plA==
X-Forwarded-Encrypted: i=1; AKwUvByB91o/lrTFyxgGqhkOuK2XQ8UGHeyIKJeKWviQmLnzrFt0afMWtsTkoawHvjjqFR8FgnKjDjKAZK/2B+A=@vger.kernel.org
X-Gm-Message-State: AFuF++m6lc6BZLLdW2KrhimJof4jttn+GA0CD3tmEO05o+0p8xviwoT4
	4vITGdkgk16s+NmLnnBtQ8qElAjn/v9aWX2ihxNCcDOfMT6NTObxq+59
X-Gm-Gg: AYBFou3vYhaNKuI2ueEuo9xebMCNKySdBTA0J0EYaBSFqukO5SvRQlPN1+cfwACXNVi
	BKpit2r2pS99Dm/GvS11iIo6ik1A7/hIoDimIE57cpZgT+NqQ0nY9oEd8KBq3IePnc7pqeXPeqZ
	/VOV6Z/AoSOnZ7Z/4DH/GkpxR2VWhm/pHnCG1V28RJzXu2AB+CbvwDGgRKzz8dGsRvkKLuvm9UV
	lARAcadejsrCu2/FntB+VzIxQ1vqDQsUROeqO+B+k6UmYoe9hkMGW5YDA3HZxieTk5Mk4YlGSM7
	xLrj1CdwgDR5vyBgSp0CA3ytGb2mxNSkP2wdB7yJOaFu/C794ilUZcwPvcoP/Adjs3XqQSd+KYz
	JVhajltfVakwUjmFAO8YIoNilvz+e/Lrbv7u6jnmlaoHt6osxhHN5I1+564R9Q4dzfNuO5yFiOs
	ALL4L6YognKTa9RlFbLk0b/4qbmTcZlbk4sZS4XnrlAvr21pFm12h8nQ==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr47979702a91.2.1788914886667;
        Tue, 08 Sep 2026 17:48:06 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm29256977a91.2.2026.09.08.17.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:48:06 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oneukum@suse.com,
	kees@kernel.org,
	Ivy Lopez <skunkolee@gmail.com>,
	syzbot+023b30ebfe0dc4bcfafe@syzkaller.appspotmail.com
Subject: [PATCH] usb: mdc800: fix circular locking dependency in probe/open
Date: Tue,  8 Sep 2026 18:48:02 -0600
Message-ID: <20260909004802.233380-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdc800_usb_probe() acquired mdc800->io_lock before calling
usb_register_dev(), which internally takes minor_rwsem. Meanwhile
mdc800_device_open() is called through usb_open() with minor_rwsem
already held, and then tries to acquire io_lock, producing an AB-BA
lock inversion:

  probe:  io_lock -> minor_rwsem (via usb_register_dev)
  open:   minor_rwsem -> io_lock

Until usb_register_dev() succeeds and creates the device node, no
concurrent open can happen, so io_lock provides no protection during
probe before that point. Move usb_register_dev() to the end of the
probe function, after all URB and state setup, and drop io_lock
entirely from probe, eliminating the inversion.

Reported-by: syzbot+023b30ebfe0dc4bcfafe@syzkaller.appspotmail.com
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/usb/image/mdc800.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index ca287b770e8c..976f751886f9 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -480,15 +480,6 @@ static int mdc800_usb_probe (struct usb_interface *intf,
 
 	dev_info(&intf->dev, "Found Mustek MDC800 on USB.\n");
 
-	mutex_lock(&mdc800->io_lock);
-
-	retval = usb_register_dev(intf, &mdc800_class);
-	if (retval) {
-		dev_err(&intf->dev, "Not able to get a minor for this device.\n");
-		mutex_unlock(&mdc800->io_lock);
-		return -ENODEV;
-	}
-
 	mdc800->dev=dev;
 	mdc800->open=0;
 
@@ -526,7 +517,11 @@ static int mdc800_usb_probe (struct usb_interface *intf,
 
 	mdc800->state=READY;
 
-	mutex_unlock(&mdc800->io_lock);
+	retval = usb_register_dev(intf, &mdc800_class);
+	if (retval) {
+		dev_err(&intf->dev, "Not able to get a minor for this device.\n");
+		return -ENODEV;
+	}
 	
 	usb_set_intfdata(intf, mdc800);
 	return 0;
-- 
2.55.0


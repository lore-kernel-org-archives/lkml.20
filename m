Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCC3002AB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220126; cv=none; b=Sb/3TJPWZcFN36bQCZvrjHCucrfFx1DJYmuRB7QQZ0J4JfX3JMc/K8oi7jx80a8ajzHaQxh/cnydyihNWgPZqs0zVs9DrmtxHB8oVgovRDtCmfLj0jpgp114mQdKiRHqr1H2y5Q9r1U39jIZaLDKsDiz6Itwf67jZ+Cf8mDdMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220126; c=relaxed/simple;
	bh=q70HH/mBfJdgqeNuRYqidh7qDOCYq4fuR1vmgUYmijc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KKOo6Ph+7Ve/jNblwwfVW1LMfDGHBKyqL3PvHdNyKiTVXDoPeEUodLQzO1akcdmAdzTdfbsVPSjel3d4bwib2a7nmaywE881NP6fQ1plCg0umTn7sF0KPFrojZYJ0237NZIvDYKJAqXWOBJ3MPHbajrf6EUS5clhOFNoee580hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-469debb526fso2146574fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220123; x=1791824923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJdrtc10ArNA5uw/Q0FBfJopjkuBAZtUDip0eoty9G0=;
        b=DautTsu3vBc0DhQe+7AfyniN3nQPfrdFVZIIfvvWQAZ5y5O9QY7uJb1zjQsxo98EDv
         MTOBMpPt98FdsciIsZOnHskRNPUMV8fCPN9xR1xQyXaxYx1YMOp7bEtAeHuznpSVALUi
         keuBqBijmTsFshuN61xxflvJq6w7IPENcjG/tErQ9Tlz/LL0eqB2/RzNTPjmON5FAkhq
         JMHfOT1TTLocYoDh0Z1/peWP8cOqEcQjPPyDIS2YQ6hlWVRXExXy79GKX8NCpP32A6y/
         1Tj9NhFo72A9e5t5qGMiQ+Kx67A5nOi8Dd66niuHR4b6twVQM0nWzP01iNvRgEZCj4cU
         FPSg==
X-Gm-Message-State: AFuF++kRwLXCAe6D0i/C+rByOaxz2iawv1TQpCz7BqxpKEp/AVINywT7
	tjnAmhM3+4q48wD2mZxQ8Om49qcyWohqguTnAyRdyVp66PBpl9Ar57t0F/HO3clG7FAtRtHhZbx
	rZlfOBxGO+EjvlYBDFlNt9WqvasXMVZ6KJW8kDZiztJYdDrqZJdyM2WvaBuM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1190:b0:4ec:b083:c6a7 with SMTP id
 5614622812f47-4f67a1f7da0mr7791164b6e.36.1791220123581; Mon, 05 Oct 2026
 10:08:43 -0700 (PDT)
Date: Mon, 05 Oct 2026 10:08:43 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac3d99b.34119e79.2f92f3.0036.GAE@google.com>
Subject: Forwarded: [PATCH] media: usb: siano: Test fix
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: usb: siano: Test fix
Author: jakovnovak30@gmail.com

#syz test

---
 drivers/media/usb/siano/smsusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..ef400d01af31 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -348,8 +348,10 @@ static void smsusb_term_device(struct usb_interface *intf)
 		if (dev->coredev)
 			smscore_unregister_device(dev->coredev);
 
-		for (i = 0; i < MAX_URBS; i++)
-			usb_free_urb(dev->surbs[i].urb);
+		for (i = 0; i < MAX_URBS; i++) {
+			// if (dev->surbs[i].urb)
+			// 	usb_free_urb(dev->surbs[i].urb);
+		}
 
 		pr_debug("device 0x%p destroyed\n", dev);
 		kfree(dev);
-- 
2.56.0


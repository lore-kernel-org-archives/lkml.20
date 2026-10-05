Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E82D876B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223549; cv=none; b=d1lTaa+v7Dvblxnmm9TCTbVgUUrIm5vCOdwddf065HZ9WsNYlgdOh+UXoMSnU9ykxFJqZ3B3ZmeXpqNewJVFjwTsSGjNYvdnDjH7c8W7M5lwK4XtArGXnTKVut2afWiLQ7IkqCDi9XhSrfCkYzo9o++kPEzqUV/dQcpuuQRJev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223549; c=relaxed/simple;
	bh=q70HH/mBfJdgqeNuRYqidh7qDOCYq4fuR1vmgUYmijc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KdUJiZHVfXN9WJ/CynPzaTC8u4smC6wihjjzzcchOBiwIphVTON/W8Pqde+vvpBOMZM6AcXicsa21plobX8c2Yk/Yp4X2G2FboYau7Csly+PXI1zo/i5x30oHhlCfjE9NcUWTHOaWEhj7dc7WXTrtan12BNrXkjaUAezThJonuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so2105145b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223547; x=1791828347;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJdrtc10ArNA5uw/Q0FBfJopjkuBAZtUDip0eoty9G0=;
        b=hK90m3vhNH/GA0CSeikNSu/376yB1wYFY9KdDcNhG0slqZ+y8GLcvRmrVi2TNmp+lb
         Y6MbvGobmYekemICtZGBsGyeWucIFL72ovIFyXyo1bUx5sGPl0qJDQ8TOa3ksAkQPBB0
         JSfjgXk3sse7WzxoBcsaHOH+sUsVYuFpbuV1hE8X/jiO5lLwiUPnVdy0lCc8bdcko7l6
         xQXqtBIwyd503xuap83tl7ijXoD3/kSNy6GXPn2tfV6Ohf04kpv7b2uQ+rYhDdHfufX1
         YUYKFzo0h1G1xJRTSJ3QOg7bmK9WWg5hGQvvsf25+1n9amQoMKDNlrFSTYCuUMCB9MpG
         V2dA==
X-Gm-Message-State: AFuF++mzFijEbuuIGMPJqsroAX2Dh5lQ4VetIAL8ZHlnfT+469wIH3uj
	b/tUqIWbi6BekyZxMtG6cI17TKz7XPMipfaXqnT72aWfILxTlmeMEUZb5jyhYr/5t74KD8xS1KW
	KSfVtkZiJzrouu1ve0dVd0Ryc0uvxxCbSxB+4jb4PlAfypdgJRYxayxnRlpE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:24c:10b0:4d6:90f3:74a6 with SMTP id
 5614622812f47-4f5435f8aafmr6571247b6e.49.1791223547252; Mon, 05 Oct 2026
 11:05:47 -0700 (PDT)
Date: Mon, 05 Oct 2026 11:05:47 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac3e6fb.9ad129c8.3858c0.003e.GAE@google.com>
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


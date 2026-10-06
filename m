Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD03E49C0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282983; cv=none; b=YPvBSp7CDh9/9zWaCLetvsB0P5a+A8ONN3GYmm0VHtGb9jLREWcJS2nImIV2IF+BfMHjitj5bOsM5nfUT32EafQO4/gkGvtTXrsz6y8gd59mIRjBKGQSCBB/cfjKjuaJOSb+PxwLwJZ6FH0iuW5cthkQSWeIfODTiBBcIXWnMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282983; c=relaxed/simple;
	bh=CEDYYi6Msl986810vZcKJ9M5YpSb832ptRg1VGO+h4k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=i61qj33e33j621KcdhNgZ1kmcaMORj3UAFmsVlCz573Gz+pRtqAVx63bVRzu7+2KY9zzgt589HP/555AwMGd2LO6HXPTWy2Tydl7T1dV01cplr/FUSre5KgFqblU6W4Op/NmCUQvVoFpjP3fnCsjT2JnB+mmln+MGPn4aZ9Tj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-49dd26d6f07so2873851fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282981; x=1791887781;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41p/OzSr3LnKkpFOUsZ4qYoyS3Awh1bPwYBganlK9jg=;
        b=1p4P7Gw9YpzYadnPME3FI7eTuzgClRly9st4/TV0deDGJ7HQCky+w7APAGkW61cYQb
         dXuV4qceyEiPrYE+CwKgP1DBfiMDaP9KRx/NExGWsMO3J+Jl+/hYzhIxJxDUUC09Wmjv
         HoPeElvYeLBarhKwi8SFKGHhDWBPF0v7RCQbZBS8lz/RNcgrkq2BUEAzvkqOS6ioEusL
         GF3oolv0ZyADsSKYX/jbkei5s4m+EmurLwh/2lTa9209P/15GPFNroBnJ4lY6GSLz+wC
         JtIujt2g9AjgzvZKpf22XJUYOBXKRFXxUPoAIuE8R1JCmHysS9QgCQzE2SEO7018dL1z
         Gixg==
X-Gm-Message-State: AFuF++kpST7Rf+XuNCRnD7fCGYjJYEP7/WatvrN5WxqIK09RA6nGs7+c
	olSUiFmGiO3TVrSvFX1CbqXiTBniPWMFF97A3VZE06RzFCDhhuGBzHCpuGaanFUucHx9mlWG9Kz
	1zB+IgFut0jlxzXHcdHxOyEkuKY7lLoUOms2KserO+RnocnGjnfVGX7JdCGM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:203:20b0:4fb:6402:a8ca with SMTP id
 5614622812f47-4fb6402c7d5mr408480b6e.21.1791282980827; Tue, 06 Oct 2026
 03:36:20 -0700 (PDT)
Date: Tue, 06 Oct 2026 03:36:20 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4cf24.353c8d8e.177895.0000.GAE@google.com>
Subject: Forwarded: [PATCH] media: usb: siano: do not resubmit urb after
 EPROTO status
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: usb: siano: do not resubmit urb after EPROTO status
Author: jakovnovak30@gmail.com

#syz test

---
 drivers/media/usb/siano/smsusb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..43eea51b60d5 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -93,6 +93,11 @@ static void smsusb_onresponse(struct urb *urb)
 			urb->status, urb->actual_length);
 		return;
 	}
+	if (urb->status == -EPROTO) {
+		pr_err("error, urb status %d (-EPROTO), %d bytes\n",
+			urb->status, urb->actual_length);
+		return;
+	}
 
 	if ((urb->actual_length > 0) && (urb->status == 0)) {
 		struct sms_msg_hdr *phdr = (struct sms_msg_hdr *)surb->cb->p;
@@ -168,7 +173,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
+	// surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
-- 
2.56.0


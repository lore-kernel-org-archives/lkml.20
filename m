Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F1526A84
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865633; cv=none; b=fOpZAHlBjXpYISSj9JdaZMRVNv2WpTK9X8G/snVr1DxCk2KfVEBHc78t2wlXkOPCBmBD5qfMm9aCps2ah+B1sofJmx6lZRhGzn6wCKgBsT030JKWbMEr4XrH0qhjk3qn8Xi6jVp9fUPgAGkzG5QkMgCyRApIZQDi0Dnh80SZCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865633; c=relaxed/simple;
	bh=mVnycIIIdt93Q/C6T4Eea9qad0nDQRG30pGBwKnOwZE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CLUKswbZ41fhcchlyqRI1eeTpqf5I3E56jowQG2YqsVXTvk27H727rtdLF3NQ3JXGB7P0NdMo2P86wOFhhHUxByQLuMcmtv7LJiFp951vby1eNsvzsk4slIuHeaMG2Sjxod8uawOePRe9lP9hZXPCYfeGC077bfaMwu4cRSHbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d9206f8so1921043b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865630; x=1789470430;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CZ0+01D4AuO1B4+6k3s3JJVLdaevTDGCudWPqPrm4ZU=;
        b=UKTh/vGNwezTdCGvxj6KsuKEg9Fb3K3F97yviFkemf0q12Ge6lueZCbSGUS7KxkYqs
         Y9D4cpXxuKBDEjaTCe+TTckhsxBqaLjhv1TT9D/h5VlxT7zIKhoYTQ+HnajGuGAM/8Sw
         7ScJ6CVC/+83homfpC5y2KshwjAF0nD57n+ZIWHvugrChXD+bYY7MPSZBwi605CB1GCg
         b2UImDrKiQr3CMJQxPHifW/XaTbgYD8SnNvIq/TZ+sVKYMvX7mdhTsx5P6qmkXdkjRjN
         9Lo5YUSA9AWoOtuBbM/n5QdP20y774EJsFjPG7UCaSAzciNumMlkUj+PQV7bj4lextz2
         pgQw==
X-Gm-Message-State: AFuF++nuV+uva/UW43lNxKs8ZNWaTiy60EVd3PfJqpjnu6P9Gp/Wyzys
	tm6FkPOWEzoXq8ZLe7Uqlb1lVlmlu+b+ZkZcxzq9r7J0EfozZZHJ03Wyrdbp4ZaXLuk9o20X0yd
	4fBVJdm0h8C8U16Li5dxTYQ7EbB8chq8AaiWSZwSklzPvQPEYyTHAwwQGsW4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:191:10b0:4bd:6e20:2cd1 with SMTP id
 5614622812f47-4bd6e202faemr3400180b6e.4.1788865630218; Tue, 08 Sep 2026
 04:07:10 -0700 (PDT)
Date: Tue, 08 Sep 2026 04:07:10 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9fec5e.f614420e.2bf292.000c.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: syedtayyabfarooq08@gmail.com

#syz test

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d00..81d761891 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -115,7 +115,7 @@ void usbip_stop_eh(struct usbip_device *ud)
 	if (pending)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
-	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	wait_event(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);

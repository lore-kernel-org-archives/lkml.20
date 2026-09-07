Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5234E80C7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790450; cv=none; b=Y+pL9Ne3S/vR3zN6YS+rn6bzjWmKeBubyWWdoLvsYR2cDFO2Xt6G6TnPHv5n1h/2frGB4XCp46qqV4i3qCqouOSxy9GXqytaU5uI9GL5c/VEsUCGVVeOd8uj3fBEjhkI+aO5WTUzEBjW40NypQENqU+9wx7uiBa8y0jh4DZEdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790450; c=relaxed/simple;
	bh=lz1xIqEWes5uBbLpkzKtUqL7ruPJE/zdaXIas9LlIJ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VYDOv/YT5DEETJf9/HWADekN+WmOzXLYByfUpeuc1oAVmLGJujVAVFPC0KeyFK90GUQjgdtgNzSoOf8+3E9HmyxeUOF79LrIC1hHr0jvdMz6WZIH/j3DF2PylMoJeG8cz5jpUJqP/ep8aL41zHPyW+SjatN3sVKqo7UDcnQQwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a49f09233dso2423689b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790447; x=1789395247;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WdMkUCaEkrcwPWAckSFCUqv4/1vx3Bq+q8mWnmCupJ8=;
        b=INUeoX0XJrLZjL8nJp6IeiD6kDhsovIIXEmX0Ho4/YmyVSN3V/BJukdfN+K1XpnJGe
         VMmBlrgqrI1N+I4J47T0Ka4NtBdjcI+5xmWFyAGn3ZSYSSUz0GSWjAX19vpc+fQVDryY
         6nZ5qTyWIXVFgOTIi5IaWfxV32SsPcDnEfJ7zKxv6BS4WNvfnSCSCf1e3rCcWv8ivJJM
         gQGoMiSkjC6MKyBtBbrBENjS4VyDwI5T7fOV5Xrz2qtrUPd/TO3r8xXfd5dgMhOBOVQF
         C9UWO+gZmWtOm9Jd9MxY/eTwE3d8XmXBHs+bz/uE47CmNVzM9QjJwzJ5JTwhm0Sk+0Tp
         3MIw==
X-Gm-Message-State: AFuF++llq7sAI9mX876ceqkxHXOcCQT0UyfUGPLtVzmu1ChDLwywfEL6
	w2+pqhcNEN1UdOy3rv7seV0jEwcY7XrYDcJO+nBd2t/sE08FiUyGEgOkOHcpnRG2MG2gwBEgZKE
	E3OZ8luvCsI2VUmA4GIUPW4SSaV1tFGw06uuLSnm/rRFfjFcKKTEK12K8qrc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198e:b0:6b8:5906:2c11 with SMTP id
 006d021491bc7-6b859062c8cmr8681260eaf.8.1788790447652; Mon, 07 Sep 2026
 07:14:07 -0700 (PDT)
Date: Mon, 07 Sep 2026 07:14:07 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ec6af.6e6c5f9e.240462.0001.GAE@google.com>
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
index 0e00c2d000f8..e498102e8b26 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -105,6 +105,11 @@ int usbip_start_eh(struct usbip_device *ud)
 }
 EXPORT_SYMBOL_GPL(usbip_start_eh);
 
+#define WORK_QUEUE_NAME "usbip_event"
+
+static struct workqueue_struct *usbip_queue;
+static DECLARE_WORK(usbip_work, event_handler);
+
 void usbip_stop_eh(struct usbip_device *ud)
 {
 	unsigned long pending = ud->event & ~USBIP_EH_BYE;
@@ -115,16 +120,12 @@ void usbip_stop_eh(struct usbip_device *ud)
 	if (pending)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
-	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	wait_event(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	flush_workqueue(usbip_queue);
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);
 
-#define WORK_QUEUE_NAME "usbip_event"
-
-static struct workqueue_struct *usbip_queue;
-static DECLARE_WORK(usbip_work, event_handler);
-
 int usbip_init_eh(void)
 {
 	usbip_queue = create_singlethread_workqueue(WORK_QUEUE_NAME);

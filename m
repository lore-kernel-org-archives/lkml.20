Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B183CCA02
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789454; cv=none; b=AEBo8k/P8V0g93njggTEGo1xzytrh7qia+0wEj9Qdbysi9BZgTazu731fmKJz7hA9Im4Xz8OOPc9Dw74OXsAzSUT1G5CVA8FUXR9q4S3EOiGSPjh9E0v5pkabtwI/5igxY3JdowUFMpKlHNax0hq2Zp87WsIdzcpiIoorM0AktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789454; c=relaxed/simple;
	bh=+PIa7RCCl8olkBEYaYco1dViLKWTa01hHSp6B5FTSfQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=liztJGevoCi/IehrZ8k3juDCKZgTCZALjrBH2MslVvQfPrm4ZLPUDB64XgKDzphcqDL+ZXn85/Dxs2GzHv5gICj18BizGPJEzjbTyM9raLPsyVIppHBlo2Uv1TlpVFqewJPwklxVWuLcSFp3WVY52dajl7gZKHnptF+Q9J7aSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e0e71e05so6456782a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789451; x=1789394251;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WkHLWemjua9M8JGz/wKd8Lu3ngZhrUdH9vDay4I5ST4=;
        b=gQM5HlI1zqQTBeFd/p8zrDpsjbOiQAw3pmJIKlPnqBb1hF5CNtDr5qcX9jyjTo2Y5b
         W7qqdVIJAbMx+bt7gp+evhkq4HwPG+cz3sIvm4okKwNlkEtigXUKUqCk5U5gHpvcMMHh
         xCmSR6yX/xeVvOfa0KJqqNTVs+Nf+u0ZjzOI8stmNc9l8/e1tAN8Bf1AhFTMSYs3+abY
         VwvcDM55Q56PQPcBLQmRnhoh6dMD1igf2sXZLHNrX5zETqsP6yNb9eBVc4l401clvyiW
         yRUVZfzpLxqaR4LEDchWkBv1a6dQNDFpVwbnV+uHl4ghde8GtBLJMmkQdPnF66dprOsJ
         W1rw==
X-Gm-Message-State: AFuF++kbq64n+7QT4cnlkNojjAUJV6Iidvm0Mu8By3yTonEJc9qJrUU4
	YaTmTptPXDAgAHAI9tCNPdW4k3QrNYCs1bouv2xTnDLLqU8I2s3y/p5K88U/kDJUj0PZ/nS7I1a
	tWWrjThWRli83qiDjuaX80vFLp/GmfmMfnJhKPN0cDsolgRGzyIzBFtlm9WE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:190b:b0:6b7:83c5:fdf1 with SMTP id
 006d021491bc7-6b783c6039amr11440113eaf.50.1788789451526; Mon, 07 Sep 2026
 06:57:31 -0700 (PDT)
Date: Mon, 07 Sep 2026 06:57:31 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ec2cb.2bb5a69c.24b23c.0001.GAE@google.com>
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

--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -105,6,11 @@ int usbip_start_eh(struct usbip_device *ud)
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

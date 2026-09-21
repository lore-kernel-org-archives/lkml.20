Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C845198F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980542; cv=none; b=Dvglmk6W/vkpifUzy5ZmqyFNSgoqdMaV0FJNVnr9/EH2jwCaNNi1EGce/U8ZZhKBLpddpF4Kpdbq8aXFTAQ6h29v3Aug2Y5chjen82BLWlSfM86gDP4eKOnBSf/fAR3/ihThtK/4kZVSAwtAc81YKnf65bPhPYA36unPsYfqeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980542; c=relaxed/simple;
	bh=DQCj1J/jIfg1YUowIN1zzXqx0CAqdoWCcdmZ/Ngkohg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D9WgkzKd7BrvDd7f8S8lY5R8tAaeS/ES1Qrw9KPMj9HbAnvj10iX061bTDkL7V9rM4ymhGjSzHwczMFiaXtj75IN5P1nIQIdGm449hp79f2uT9ierMrpmAELWcbYlH5Qa/1EvxnsJMvgvDteOlELAUNavIF2xQTX04+I6jM/ucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47d81384b4bso3355570fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980540; x=1790585340;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WEbY8rfUhT7rVMuOYhpNAIH57OV6/qM6hSQAdOqPqpI=;
        b=uSfvMxH0uKzYITVxTVwqUCgI6nMMhiNNw99RCQUSXn7Izr5Xwn1kwqSljTU9ibOUyE
         KC7w5XRgZPBH+15c/gWWVuobAG424ftTBZOrSgTfwbdHD8tVacZst+3rOiatdpK3p4W9
         9AqPgElBgtjanzAPcYrglOZAPbk53vSubbf2T09G5td8gx0mxSw94x7huGrLO4IvisHM
         biFWZAer2QijgQCL9Mh4IHsGlNTQn4ysOJkcQPM8zsgrkHieh1MR2bTkvrN2yWncpOVR
         U+yjpkbjjh1w7QIBqV0f0X5qelu0RBtt2N5IOIZ8hlvxqE/+ZFZ/5qIYi9BKObRVokGA
         IZ2w==
X-Gm-Message-State: AFuF++ksIDOARdk8xYdDH5kUQS/AIdBClxgbWRhGM6/C8Llmizf3WCoD
	ZJuZMx2f4SsguatTI0Ox2eklnmgzkf4VyAdgs0XmrHH4sO9SFrcUIhrUb66fF1lAfHdmR3DQbdV
	Io8LHnGDjtDoiPcZl+zBETdlcNMX8LQDNwSV9z1ORorNlAPdc9axJveccAkc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee19:0:b0:6cd:3fdb:fa5c with SMTP id
 006d021491bc7-6cd3fdbfd51mr6027159eaf.71.1789980539301; Mon, 21 Sep 2026
 01:48:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 01:48:59 -0700
In-Reply-To: <6a81dc49.dbb3a75c.20434b.0037.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab0ef7b.71f81b7d.15fa6d.0026.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] general protection fault in adsl_state_store
From: syzbot <syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] general protection fault in adsl_state_store
Author: jie.wang@intel.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 636f7886fc260..501a51b27e466 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -356,7 +356,7 @@ static ssize_t adsl_state_store(struct device *dev,
 	if (!strcmp(str_cmd, "stop") || !strcmp(str_cmd, "restart")) {
 		ret = cxacru_cm(instance, CM_REQUEST_CHIP_ADSL_LINE_STOP, NULL, 0, NULL, 0);
 		if (ret < 0) {
-			atm_err(instance->usbatm, "change adsl state:"
+			usb_err(instance->usbatm, "change adsl state:"
 				" CHIP_ADSL_LINE_STOP returned %d\n", ret);
 
 			ret = -EIO;
@@ -376,7 +376,7 @@ static ssize_t adsl_state_store(struct device *dev,
 	if (!strcmp(str_cmd, "start") || !strcmp(str_cmd, "restart")) {
 		ret = cxacru_cm(instance, CM_REQUEST_CHIP_ADSL_LINE_START, NULL, 0, NULL, 0);
 		if (ret < 0) {
-			atm_err(instance->usbatm, "change adsl state:"
+			usb_err(instance->usbatm, "change adsl state:"
 				" CHIP_ADSL_LINE_START returned %d\n", ret);
 
 			ret = -EIO;
@@ -396,6 +396,15 @@ static ssize_t adsl_state_store(struct device *dev,
 		poll = -1;
 	}
 
+	/* cxacru_poll_status() below dereferences atm_dev, which may not be
+	 * set up yet; reject before poll_state is advanced so that
+	 * cxacru_atm_start() can still start polling once it is.
+	 */
+	if (poll == CXPOLL_POLLING && !instance->usbatm->atm_dev) {
+		ret = -ENODEV;
+		poll = -1;
+	}
+
 	if (poll == CXPOLL_POLLING) {
 		mutex_lock(&instance->poll_state_serialize);
 		switch (instance->poll_state) {
@@ -481,7 +490,7 @@ static ssize_t adsl_config_store(struct device *dev,
 			ret = cxacru_cm(instance, CM_REQUEST_CARD_DATA_SET,
 				(u8 *) data, 4 + num * 8, NULL, 0);
 			if (ret < 0) {
-				atm_err(instance->usbatm,
+				usb_err(instance->usbatm,
 					"set card data returned %d\n", ret);
 				return -EIO;
 			}
@@ -490,7 +499,7 @@ static ssize_t adsl_config_store(struct device *dev,
 				snprintf(log + tmp*12, 13, " %02x=%08x",
 					le32_to_cpu(data[tmp * 2 + 1]),
 					le32_to_cpu(data[tmp * 2 + 2]));
-			atm_info(instance->usbatm, "config%s\n", log);
+			usb_info(instance->usbatm, "config%s\n", log);
 			num = 0;
 		}
 	}

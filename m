Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3331ED93
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364951; cv=none; b=KbO2V2iCFlA94GD9pVuwVIFQeeWxvq3xQCSOgr/wDLfgx5ZOg6Wzz1I8uP37mt3oEx7ZI4G1/8mDQXqtxISTWzVEF8jpfmuvwsoVZztFHJ3MWeoJIAILMcPRRCFmi4xa+Ix5TUPvsz2qIsi4AJQex+/Fxyv7HaTkz5jEQUM7ZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364951; c=relaxed/simple;
	bh=ivh13HzVA5QxL+Zb+IHVHtcjSt2Slp4M5sU37uuQdRM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sNVgJs/D1xsc4al3dFJLme4HmvXzrAm6ZJB9LE/zFLlBDZVAY4CDX0lwfwb7sKA8IGZayFvwXMjQ1qOVz+N92MsqSqHR6K8pSbfQUQwPlxVv62CEHjh6mDpWcqb0jfk4Lx7S/unyWFLliDa2vOI5gDkzst3hgRMmU1tz1zaqLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b8b593a4so2843000eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364949; x=1789969749;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xixKmGIr/+79hnLBM805eu3Ie29jfMAa+RGyQDAWg/I=;
        b=ZfLZWSYP6xfa1+M3Dpie4c4Avzembu1eSgVpQQj7R5agwdkG3yORuSxdGP7xE58Igs
         0ybp3Jpg1F+OY1VS6ePVCnOCt7BPdS9GhLtCsDxx4SJPMLMYKUJBwZN79yFRs8L6xfEM
         XWzLbS/ElwEDMKTniu3fjjG5v0AXXPZSqfNNhHJvzA0aJhh4KaJT2slKWCZqxruotmxD
         nxf/DFERSBJaehPYNfCgj00MBfcdnTEHr/CGExAIqPNvIVKCo2N2bdaZ82RIJF28z5cT
         jBbySXGEhwY6i+4Y2DmTXcGtVw3Gu6WdIn3FuOjtoqAKmTwVrW7sQfpJfhsLqmUy2SH7
         5bFw==
X-Gm-Message-State: AFuF++nbyUcYFRMwdeL7cHO+WAzJZKJRE3FqBc9FBjVZuy9PGn5Qy8sd
	+AoYOcJizX/qz9104ytv05wd7sKNxGKe5SOvGuo5FqwaLpBWUDgSWQGXt/v4OVamXc7tD2GJOFN
	zeYa+6vOAqRM09BZ6JfHdwHauLUiHgm2x6EPfmly75HTmt7l/BghF7NeDGIs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c85:b0:6b9:447b:8798 with SMTP id
 006d021491bc7-6c543112816mr487028eaf.63.1789364949316; Sun, 13 Sep 2026
 22:49:09 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:49:09 -0700
In-Reply-To: <6a6d4178.13bfb6d0.1ecdd5.0256.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78ad5.f670cee1.72fc4.0017.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 762137ff748fa0c920f82ce718163691cb02f907

Reported-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 4266a0cb7..b1b358b3a 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2458,12 +2458,21 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 	struct uea_softc *sc;
 	int ret, ifnum = intf->altsetting->desc.bInterfaceNumber;
 	unsigned int alt;
+	int modem_idx;
 
 	/* interface 0 is for firmware/monitoring */
 	if (ifnum != UEA_INTR_IFACE_NO)
 		return -ENODEV;
 
-	usbatm->flags = (sync_wait[modem_index] ? 0 : UDSL_SKIP_HEAVY_INIT);
+	/*
+	 * modem_index is a global counter that stops at NB_MODEM once that
+	 * many devices have been probed. Wrap the index the same way as
+	 * sc->modem_index below so that the module parameter lookup stays
+	 * within the bounds of the arrays.
+	 */
+	modem_idx = (modem_index < NB_MODEM) ? modem_index : 0;
+
+	usbatm->flags = (sync_wait[modem_idx] ? 0 : UDSL_SKIP_HEAVY_INIT);
 
 	/* interface 1 is for outbound traffic */
 	ret = claim_interface(usb, usbatm, UEA_US_IFACE_NO);

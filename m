Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D736C581
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436341; cv=none; b=YHlTBOs3spqEdzGA3rGTLVk2785RTxOJgQQF2RRwjmk9IVwliDoBz4oDvSaL+Jyhwly0dlJCXJdHU4H2RJCS7aIsKrNfDHNVTC2Zvn6cyKrgRKTmnJmN6EbzYpM+XoXXXkRrtZyaj8fr5qwc7E2LywxokFPslPAYydOZS5eUtJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436341; c=relaxed/simple;
	bh=1yspUFk+ZP+kidYzHfTSzl9kf4gMmKFWBNYIxaJUT6A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ju1CWgxVxJFx676FcuMaBd9aP65URQJ1jdu+/K5KWchGzn4ircdtnQQ60GJC3Shi8zKLDQtxvx8LuHM1XcbzySviKngCs1gLpS1f23+SPqTKcqCJcgX1oMOeGa2SdfwDPzDrBXJ37Zhp7GqxSSTdSpvacyyG0E0scybe0Hhhzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455ad408573so7120354fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436338; x=1790041138;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y3EalpK+7xuIw9kXf4+DwCO8EgrZQj8B4NNl9QS+vhs=;
        b=ospnVnK1quDbfvKoZjBb9HNtQLDfhya1evxD/K5V50gnYLPePinXvbPeT4udVz0GOM
         lUcdWB6QX7UbFf5xj+YvId+fKDDz6qxcUBksWgHNm9tY94XJJlAT0R6b2u6f5zl6Vrtw
         mqIg2UirfmlfHOUFxkQkWus5tbfj0kDelGSrGtvB8IFhPsmjtelJS3lnXRba3DAbyEqL
         qgd/yPLQVcCw2zwvQm3c6KeICVNTseZ3g3tVno/oL70CIR0d4E2dBz63w11iFCrG07hu
         2Rk6nexTCn1TH1lGeSMkMBUn7Ms2VBpBYrLgDconsxu5iILfdsxQRME71vX/JdskwBYR
         WrjA==
X-Gm-Message-State: AFuF++nCa58v+LffpXIQta0YY4lXEyKRCCj/j5pVovVeDqRbqxFgMZet
	/kcBjm/Bjtk6UCj+aHCH5CCD3flAw40u+BD9u0gX9rTXSKW+DH1Nnk5SYtPez+YjsuDlRiVcVvC
	y2V9EM/M86RX9CfaZTJ4w5429U6UwBnGZUuazrNWbqfaA476HYpjfh+Rlv2M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca1:b0:6b1:535a:eb8 with SMTP id
 006d021491bc7-6c53fd884f9mr3325193eaf.2.1789436338722; Mon, 14 Sep 2026
 18:38:58 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:58 -0700
In-Reply-To: <6a8cf1e8.dbb3a75c.7844.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1b2.4c28b7d0.c1bba.002b.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
From: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dc..5b30303ad 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2382,10 +2382,25 @@ static void vub300_disconnect(struct usb_interface *interface)
 		} else {
 			int ifnum = interface_to_InterfaceNumber(interface);
 			usb_set_intfdata(interface, NULL);
+			/*
+			 * The inactivity timer holds a reference to the host
+			 * and can be rearmed by work items.  Shut it down
+			 * before clearing interface, otherwise its callback
+			 * can drop the timer reference while a concurrent
+			 * work item is rearming the timer, leaving the host
+			 * to be freed while the timer is still active.
+			 */
+			timer_shutdown_sync(&vub300->inactivity_timer);
 			/* prevent more I/O from starting */
 			vub300->interface = NULL;
 			mmc_remove_host(mmc);
 			kref_put(&vub300->kref, vub300_delete);
+			/*
+			 * The timer is shut down, so it will no longer drop
+			 * the reference that was acquired for it in
+			 * vub300_probe().  Drop it here.
+			 */
+			kref_put(&vub300->kref, vub300_delete);
 			pr_info("USB vub300 remote SDIO host controller[%d]"
 				" now disconnected", ifnum);
 			return;

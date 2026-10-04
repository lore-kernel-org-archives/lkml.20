Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A5230264
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791123133; cv=none; b=Cye1OR/OqBhXTrpatMIhnqBW5OY/kJ3ODUzXyHORIU3J5zh3NuxkhOxeChVmAPDR282vFvdU1BhDSs9ZVWv6U8c16YqhJLXRwj+Is1gIR/7hIhOvWJDenvQyj7bo5pZ8wEY5rWUVzt7RX5cFVQFf5nWr+DYBUsdIChqJCIe5Uos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791123133; c=relaxed/simple;
	bh=CCoJ1KR0qfvZweLb+uXDdyvtl0oOc8mfU8nZTkZYD2s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IhydlTu8fxJzlIGf++yx6zAjL3cEjE2qAICISTT4wEnsbEp6n2mEhSZ5lgsNptpsexUadlXaREbvmrv2kBPljqsWw/GrrNjmx/vAT1XzIFEw3EaRxeqdR2aPPdwvMS6Ds9Pgz6yb12Q4OXXGHXe8jrDMbaHZNtUs1uVH9fGrSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d7ffab1so1714637b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791123130; x=1791727930;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=llxwhrQTzrtq6H7K4tP0/XyGccTIK9lkqK/zHPr9Oy8=;
        b=24BNrwf/yBi1OxkGA5PPb31YFs3DaU+NwbBB4uuFmmXvO/JjQf2JZHAdwLRtNmYEdx
         7Iskf0j3FvUYkT9QKiomAaMIo8X33wl6V0xrCwJ4E/Qy/EEFsv1znlkZcH2cLBr29nEk
         BPtJ0qyRu8JeRCzJ0yetBHqT8uyavnjE2c2d1/cq4dPWuyjH/jt/KnFv+/oGeYjXkgvi
         Eo7t8bBBj9I5CB7iYbkSOM9eeiewLmtREkok+IMUEVzF2CxvnS7L55iGKqQU6ASz0sun
         aPxSTElZlKVs4/01LOWw3uodrW910ovxG5w4h0TjUlQNfLhEriRvpK0wymaSfgx08JZa
         o9cA==
X-Gm-Message-State: AFuF++mz+PnwnDyYy+ChomiOUzYHtgQ1+q3+KJamc/MWWKeN/OOmgF0k
	Gb0/9p9bex/pAxIUNzUIgYc5vxVLXNukYX8HoEvsrOUdgDGg6wW0MjqYQzG98RWEVl8v80jj/fJ
	PYK7bSWg67PwT9jN/aM6JMTMncEwKbTvHpOQJ0zUrr5zxwdduqeDZhUE3g+o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238f:b0:4c7:26ee:3378 with SMTP id
 5614622812f47-4f30a657059mr10125928b6e.30.1791123128293; Sun, 04 Oct 2026
 07:12:08 -0700 (PDT)
Date: Sun, 04 Oct 2026 07:12:08 -0700
In-Reply-To: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac25eb8.5aa89728.278400.0000.GAE@google.com>
Subject: Forwarded: [PATCH] media: dvb-usb-v2: fix NULL pointer dereference in dvb_usb_start_feed
From: syzbot <syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: dvb-usb-v2: fix NULL pointer dereference in dvb_usb_start_feed
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


dvb_usb_start_feed() only checks that adap->active_fe is not -1 before
calling streaming_ctrl() with adap->fe[adap->active_fe]. If the frontend
was detached and adap->fe[active_fe] is NULL while active_fe still holds
a stale index, a NULL frontend is passed to the driver. For gl861
this crashes in friio_streaming_ctrl() when it evaluates fe_to_adap(fe).

Check that adap->fe[adap->active_fe] is not NULL and return -EINVAL
otherwise.

Reported-by: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ac020fbb657e00356ca2
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..eabf020431c8 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -254,7 +254,7 @@ static int dvb_usb_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 	/* wait init is done */
 	wait_on_bit(&adap->state_bits, ADAP_INIT, TASK_UNINTERRUPTIBLE);
 
-	if (adap->active_fe == -1)
+	if (adap->active_fe == -1 || !adap->fe[adap->active_fe])
 		return -EINVAL;
 
 	/* skip feed setup if we are already feeding */
-- 
2.43.0


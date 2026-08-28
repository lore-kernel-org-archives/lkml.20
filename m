Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DF250BF2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880532; cv=none; b=Q0bhldNzwea5B58QssZmsc5aE2EfYi5HASBiN7mL7vj0aSrpEAYRWCP9CyOlLzN+16q6y3fqupAGkE8Iv+ZgElD3htm3H5SA7Ug+DJTWNHWVrWkMkG6RJsn4VXFBiCfQbbFUgMvOB2ZXqPtv1ZOM6MqvZElZWcCvFkwXzVWBJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880532; c=relaxed/simple;
	bh=BYHFmCFPWmb5ot5TgEjuSBCPTrnPvfmVEuBXLl/h42M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hdaUXATyQ+eg2jbcYeRru7QIZ3PPLIzo0Jz9lLKaSRTwDrGLufSqkUB9AZ5EzQ3gytqPUlATQrU0NIUGp01p/4t28d8fVzPPHKkg6cDF2n0mX9CIfO3lDqJFGiIkxDRW25QBsuZn4I65PAowMpYvQ62sGL8LnCzpw3xs0NhUPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so326923b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787880530; x=1788485330;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lxsp0z9HP23MQDM7Mt1YLo61kRgSyqCYkKGFcgLyq/E=;
        b=gyGkSGo5Spj26fhPtWSdgnsgNNmw0rskB9H1dWcDPesPgfCtZpSEysrv3IpamhXw9J
         19hdxzkIfvly1rM/YPXCSgnrvxqEV4G3os7dPgqFc1GTJaCywLFtR4w28hRd4RG25y8O
         LgYhIwqXh0rquEjBZksno7WsfI2koUdc5DY3kBisAUNuVMVn56XxHV+crd866DDQBmUP
         iiv/RrOo7UoUw8m2LfXd4TmI4tmkY9Jpa0wlVTnbxW+nCnI3Rv+8nmvnWgWq/LWt/jHw
         QgIcF0FGh4EdSdnVmF18QBe275MQ/OYwjWKK3loOOFex8/EqNmsjjldi5saRFdKcRQzJ
         mHBg==
X-Gm-Message-State: AFuF++nAh2/phLKo7PooNd0RsTJQ6Pg88uOidLRApDsbVnc8iCgF3Zc+
	vOGWPCsRuB5Uo4RAiH42Dl3meUOkIC41R9jDaZd2Wga/JlzIRc+YKmyJbrYy6qwmCUpVPmnuxKA
	05mu550a5Ev3vwvUc71T8Y8eA3LX2FUS2qnIWD8c1coNuvB85Mep4oOuvjsM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:404:b0:4b3:98f4:f057 with SMTP id
 5614622812f47-4b398f4f0b7mr3160030b6e.3.1787880529984; Thu, 27 Aug 2026
 18:28:49 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:28:49 -0700
In-Reply-To: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a90e451.1d9ded08.62e62.00e0.GAE@google.com>
Subject: Forwarded: [PATCH] usb: serial: keyspan: add debug prints to trace
 NULL p_priv
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] usb: serial: keyspan: add debug prints to trace NULL p_priv
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



Add pr_info() calls in keyspan_break_ctl() and keyspan_port_remove()
to trace the lifetime of the per-port private data (p_priv) around
port removal. This is a debugging aid to confirm a suspected race
where a port is unbound (freeing p_priv) while a stale tty fd is
still open, leading to a NULL pointer dereference in
keyspan_break_ctl() when break_ctl is issued afterward.

Not for upstream inclusion - debug only.

Link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/serial/keyspan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 4d3746c7a94e..36626c0cc0a9 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -601,9 +601,9 @@ static int keyspan_break_ctl(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
 	struct keyspan_port_private 	*p_priv;
-
 	p_priv = usb_get_serial_port_data(port);
-
+	pr_info("keyspan: break_ctl port=%d p_priv=%px disconnected=%d\n",
+        port->port_number, p_priv, port->serial->disconnected);
 	if (break_state == -1)
 		p_priv->break_on = 1;
 	else
@@ -2975,7 +2975,8 @@ static void keyspan_port_remove(struct usb_serial_port *port)
 	int i;
 
 	p_priv = usb_get_serial_port_data(port);
-
+	pr_info("keyspan: port_remove port=%d freeing p_priv=%px\n",
+        port->port_number, p_priv);
 	usb_kill_urb(p_priv->inack_urb);
 	usb_kill_urb(p_priv->outcont_urb);
 	for (i = 0; i < 2; i++) {
-- 
2.43.0


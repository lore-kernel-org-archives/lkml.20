Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC73C1F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788135023; cv=none; b=EwbYHS65//wWi0TjJScIe0+of3JjyEYPX1L0/8qiXw8SdkKGUXoBGbNuP5XBTaen1ivOhHN1PIXcf5G+qKjh/2/D2v660wm+laM9U8aKvGiIO/e02WjPhL4KtwY7ErF5LtofSBSbJeOZw4/V8GE4wV66oC7V2TqkXT9XR0Nfueg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788135023; c=relaxed/simple;
	bh=5kPYoH2H2zgChuEacH1BWXP1LfpDwSvK8bJDuSpqjwY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T8m+ZE0Za+K6tCGtWsLyv2+GLRGIumeu4QeKJSNTpNwEHP7Y/KRLl6RGjgxhe+8T/idB+NRiNaC7buEUA2jj5mvJtVaRdjM9+z+eXDyKGr8hqBfV9M4GQzfhVKD5CBCnFZ6GTMNGDAXvrFm5Xs+4nXXu4dk2Gh5thfsLs2F0myo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12abf0e49so1432829eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788135021; x=1788739821;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SNpCZbxiRt+RAAxmUaTs+FBpK4/fvtQs6Gqoox7oH2o=;
        b=qNyT+mGABU2b7AYPIwPPh2A8dnbFGh5MOXoGobBEIM/0JOplnYTEecLhl+FmDDMY3h
         Mhqp4LAe4thMfwylGBy8/rapx8pJq+iULR/n4BlKN32H48RRpwNThxhGRuLZBcXQxY78
         +IM2zIq+Dz77XxEDn3hRnXxXS9L5hEx1ov5tLQBvgHSZanJDGxh0F18+V0U2AkrWqHR3
         6Y3j/OGgpSF5Z29lrGlbcEp6tq+ZhrkRGfSmW96sEeWvRsrG9qyOAttf243nCVT8I98d
         0VozwpbLJwcCb5BocIGl7XQs9/bvEXDnLAxFQHbio9jl5FGjDf/uqJxxshe6RPZ6O4Z0
         pfUQ==
X-Gm-Message-State: AFuF++nK+5kvFepYnORkrNo9w93I1g3t4dHXuSBNjn6Ymh/Br1HS2x0l
	ZjzVN4Fz864v4lpt0z0WGTpRV/9FF9guBdeFEfVd8POzJJhSUN4RUS977oh4xBSCYfy5tRSd9nH
	9WI5M0J42r3Q63/sifGSgpZ4GRpZ0agEw+rlmL5Qi21Nk/TMTsGSv2xJgdLY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f0c:b0:6b1:7798:a80e with SMTP id
 006d021491bc7-6b36b51e32dmr168015eaf.6.1788135021065; Sun, 30 Aug 2026
 17:10:21 -0700 (PDT)
Date: Sun, 30 Aug 2026 17:10:21 -0700
In-Reply-To: <6a944641.4d659fcc.734b4.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94c66d.4d659fcc.734b4.003f.GAE@google.com>
Subject: Forwarded: [PATCH] USB: serial: keyspan: fix use-after-free in keyspan_close
From: syzbot <syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] USB: serial: keyspan: fix use-after-free in keyspan_close
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


keyspan_port_remove() frees the port's private data (p_priv) while
keyspan_close() may still be running concurrently on another task,
e.g. triggered by an explicit TIOCVHANGUP ioctl on an already-open
tty racing with device disconnect. This results in keyspan_close()
dereferencing freed memory.

Fix this by adding a mutex to keyspan_serial_private that serializes
keyspan_close() against keyspan_port_remove(): the latter clears the
port's private data pointer under the lock before freeing it, and
the former re-fetches and checks that pointer under the same lock
before use.

Reported-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/serial/keyspan.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 4d3746c7a94e..623f15b51a6a 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -541,6 +541,7 @@ struct keyspan_serial_private {
 	struct urb	*glocont_urb;
 	char		*glocont_buf;
 	char		*ctrl_buf;	/* for EP0 control message */
+	struct mutex	lock; /* protects p_priv vs port_remove races */
 };
 
 struct keyspan_port_private {
@@ -1581,8 +1582,15 @@ static void keyspan_close(struct usb_serial_port *port)
 {
 	int			i;
 	struct keyspan_port_private 	*p_priv;
+	struct keyspan_serial_private	*s_priv = usb_get_serial_data(port->serial);
 
+	mutex_lock(&s_priv->lock);
 	p_priv = usb_get_serial_port_data(port);
+	if (!p_priv) {
+		/* port_remove() already ran and freed this */
+		mutex_unlock(&s_priv->lock);
+		return ;
+	}
 
 	p_priv->rts_state = 0;
 	p_priv->dtr_state = 0;
@@ -1599,6 +1607,7 @@ static void keyspan_close(struct usb_serial_port *port)
 		usb_kill_urb(p_priv->in_urbs[i]);
 		usb_kill_urb(p_priv->out_urbs[i]);
 	}
+	mutex_unlock(&s_priv->lock);
 }
 
 /* download the firmware to a pre-renumeration device */
@@ -2794,7 +2803,7 @@ static int keyspan_startup(struct usb_serial *serial)
 	s_priv = kzalloc_obj(struct keyspan_serial_private);
 	if (!s_priv)
 		return -ENOMEM;
-
+	mutex_init(&s_priv->lock);
 	s_priv->instat_buf = kzalloc(INSTAT_BUFLEN, GFP_KERNEL);
 	if (!s_priv->instat_buf)
 		goto err_instat_buf;
@@ -2971,10 +2980,14 @@ static int keyspan_port_probe(struct usb_serial_port *port)
 
 static void keyspan_port_remove(struct usb_serial_port *port)
 {
+	struct keyspan_serial_private *s_priv = usb_get_serial_data(port->serial);
 	struct keyspan_port_private *p_priv;
 	int i;
 
+	mutex_lock(&s_priv->lock);
 	p_priv = usb_get_serial_port_data(port);
+	usb_set_serial_port_data(port, NULL);
+	mutex_unlock(&s_priv->lock);
 
 	usb_kill_urb(p_priv->inack_urb);
 	usb_kill_urb(p_priv->outcont_urb);
-- 
2.43.0


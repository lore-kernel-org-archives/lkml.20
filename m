Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183E38889B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143841; cv=none; b=YblOmqAI9LfglTejoxw7n1Jk0Tbspzerq+Po0xGgIVgHoy/9Dqum6Wn2/OuuUwm45BPQ7pHO8zqoSYjOyYXuNrPnQCzehmnAw/g12EEtO9RMWqh1M49CZFeV6GPsJ20egvHn3INJR/1ipvGoOUHvf4wZMIrH71yNULHuc/f+d9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143841; c=relaxed/simple;
	bh=62DEX6DHb57E3s+a/b4S93uPbw7Dit546+vTJRw0S68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBPkJOfxtmgy8UTyXWrCyuMsrTCRHXoJXERMxtGQHeglSSOXlmzTWmj1BHtY+EwQnDTMwqo13kKJt5t84Z3hgZrjYFwEosETjDRfaWYSH6xxdZTPHietjWL90kVB4K2tMZhy/fbmvA1KK9C7cSBiUGbw/TrWi1reqaS7UWdvzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdZbfDXV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdZbfDXV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so3051397a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788143837; x=1788748637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNqy5MN83JTGwUAaeejS1KoqOZ5xExZsRuOWPYVEuQ8=;
        b=AdZbfDXVABbgXas3HBKQCyTXv2HGwHz5osB2DnxETmqcj+6EfEhNXMFL4qCBLEbLFL
         BqTT2Vv1EMJfWDdwZN7+KZFpqJMMDOeD0Z71oU8pHAQdF7EArazTKo7OOKuXDvlL6P1a
         pwcilISngtde2BdSHi2l8uYmkoGf322FOHZvWSEw/6EPW758J9MlRhiKd8ndD8ivnu5I
         baul2v2SKM88EaXYi1RIc9WARGFh4/BaSoyU4BoREn+wTdBju1VesTMaCbfF8A4L0TSx
         eS1vzzhN9Av1Eyxsxk8iN0NSxxsJDuyTAxiA8Du28RlVo4WOE4POZxgKFXakvc9ffQj/
         yulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788143837; x=1788748637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNqy5MN83JTGwUAaeejS1KoqOZ5xExZsRuOWPYVEuQ8=;
        b=p5i+sai+YpvDJ4AUUcGG+i7IqWhM6TuT02zD99ObYDeExPubuB1r4T9ib4wEUcDqte
         ufknQqu1iD6vO4xKHQQ92osvAZtQKeW3cXDWdkiyQJ39Pez2OdrDVj6IjvBEKoUcC9Sr
         7jbQqvT0xqLCpH26fYSzTmnA2jIoWUpRFR1FYl++f/MpUaUA2Ejl5z//6fQRKDRMGZa7
         Ra3SKUmjbjok7XRHZbTWIfzodo1mkuxJ+/iQqf60UF7NfQn6KVfRea6LHgEdh2IO56qZ
         zTOPaWsJ7Sb/3zHLonz/zQ9JXMH4G5q1DnTCxSHjJxb9y68bpmixtdVFkMHVEf7OME+u
         1UhA==
X-Forwarded-Encrypted: i=1; AKwUvBzjGMoJze25aJdHO8ObhYNqfKsrR7OXxbim6lft3215UO3H0hMLtYb/Gj8Blneee4LVVwEntypMYkOIQTY=@vger.kernel.org
X-Gm-Message-State: AFuF++kvfT9RdVsrenzInYDpfwG31JEK7JogPDgY0BqgI2RjVn4BG1oh
	kGDNoDBEBs8ljXDtOk78Ht4uy00CVpQDRfjL6DrlLik4dAknGPVXhbmt
X-Gm-Gg: AYBFou0+O1i6j96gYgzQKG1HZ8Lid0dgbClOcYeggS05YkSYMhzusEhIZn9GIdJ/kqH
	moPj86xk5W1CdfnjHjv3572yd3Jye6AdGAgh9pSZztWxjeI/2fnu7qbX81DMJEHYIlMPvsvw/aY
	f5gF7HBE02o6UeYpnXH3jPBX0hq/zVhVossz7NeAqQlsfaVzMwRmRMp6o+QK+8ICwzLu1lNkTDE
	N+YpkvI6KiZsQlsOPr+KlAgdJvky7ift+0mIiFtZxuJIlPZB63oj/EhUg/f9ziVKYN/U1wy09ie
	II3cHSrQ08UIlllw0RGv3NfvHjlWgzGVjUgZfEC+e8Uv33+s3Sq2sgRGV6aGcyhAqqKcLwOniyY
	9HBQB74fcPm+Kojg29doy78U7s6WaH1Lq+siNf4MydpXNXoxmSrCsGPgSpzOXhL15c5J8sgpEVR
	eahaf/DDqigFPhIKhe6AUgyNPzqBFOAbPZAIxlaqdT57a6aERXVtrzdEIChZatp5q+FeXfMwjtv
	WILWRYFPFx5WBkzEYRLpvKAt9/i45eLTXaQfWw0RISYYEiKEQLTOg==
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr9608724a91.25.1788143836731;
        Sun, 30 Aug 2026 19:37:16 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3ff5:d9d7:73c3:8d0d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm14216308a91.7.2026.08.30.19.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:37:16 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Subject: [PATCH] USB: serial: keyspan: fix use-after-free in keyspan_close
Date: Mon, 31 Aug 2026 08:07:01 +0530
Message-ID: <20260831023701.9579-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Tested-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
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
+		return;
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


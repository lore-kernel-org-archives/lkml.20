Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC8757EA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246182; cv=none; b=KmBLBs+YSKH8zqbu9WKqURnfIewuyBwXOkBVZUXPkNt1IcbxoYD2/tpzdnTpkSlhJz/8RottI0uSgbzzrGP78F+HU3p3g4zawAP063tQdxTeBRDv3kVwD+33zRB3oZQBExbzFModaiH9j/38Ulm8dEjXMtlwc00kPMhFB0C9v7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246182; c=relaxed/simple;
	bh=RCksDI6mcklvZzhqPcWEI8iAHnU7QBEh1z3um95gNw0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rF7l9s90iMI+w/UrC37ZVKjIR3i97T4bLx3xLkM/VOX/KXY5t1jW4vn25X8o5Qw50FQvFm/kZ/9I74gjDtkVyQGMZL9fA3gK+XT8x/OHxDxy86QhRJmqJSoOeWYyTnWxiuo0EIV5p/H98zydY/RUkK7Uetl7tVv5SHqBAKepWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c16df7bd53so1513888eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246180; x=1789850980;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1/ZTV4hObFNYAaWwNHEkGHUENWc3He4mt3jK0SseFZE=;
        b=XU6Zu289m2viw3q0m/ETxF0G1UAlAiEr501ceZfZmOvRajSx1ni2NqUDmB15TQqDfw
         Ep79lidw8zpzn748dJSYvZp34VFG1wYDNYASZgrDNqC6Z4ynCSHleFWDkKtHjgd1yGIl
         BmXntjK7mFBfmlU2ubr1czpXcz8n1Lh+gM+zgEoBetLRPw/rNeqsnfjujMB0AxGI7IZe
         19nmuQI2fgeItiR53ZdFg9zXv94lzQIYb/PqT+CCw/2qm+HkZi8mavBZnd9yFTk2Enlj
         MrTtjO9pgTHHHy9e/ftUxPuJnjufNy9TXsohsmfk+taKcDkgIKZiZAPaq+HzIRpbFqaU
         UM3g==
X-Gm-Message-State: AFuF++mBfgE0F+ABA/idq2mkO18eIHwlOwmj53vRC2VOZM2R6pYsTBkF
	PRmIuKhen7pRfgrR89btZnKt0/jFj9NDt/MNx0UgsjBQe5j0DjhmupWDXEMaO0HBwu/tGe3P54s
	hzI7uGBt7m81hOk0eAFNIAuo+4wZOlgAFXmkhffB4Du6uI9GB9b4fwbSS6Es=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:161f:b0:6be:731b:5544 with SMTP id
 006d021491bc7-6c0bc1d6d86mr6656242eaf.37.1789246180551; Sat, 12 Sep 2026
 13:49:40 -0700 (PDT)
Date: Sat, 12 Sep 2026 13:49:40 -0700
In-Reply-To: <6aa2d63e.6e6c5f9e.28f11f.0036.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa5bae4.f81106d8.2ab401.0030.GAE@google.com>
Subject: Forwarded: [PATCH] Bluetooth: RFCOMM: avoid socket lock inversion in
 listener cleanup
From: syzbot <syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
Author: jcperdomo100@gmail.com

#syz test

rfcomm_sock_cleanup_listen() closes unaccepted child sockets through
rfcomm_sock_close(), which takes the RFCOMM socket lock before
rfcomm_dlc_close() acquires rfcomm_mutex.

The RFCOMM worker takes these locks in reverse order: it holds
rfcomm_mutex while rfcomm_connect_ind() or a DLC state callback acquires
an RFCOMM socket lock. Lockdep therefore reports a possible deadlock.

Remove the redundant socket locking from rfcomm_sock_close(). Its only
caller receives the dequeued child with a reference held, and the
function is already documented as requiring an unlocked socket. This
also matches rfcomm_sock_shutdown(), which drops the socket lock before
closing the DLC.

Reported-by: syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cece8fa7d83523f47a3
Fixes: b7ce436a5d79 ("Bluetooth: switch to lock_sock in RFCOMM")
Signed-off-by: Juan Perdomo <jcperdomo100@gmail.com>
---
 net/bluetooth/rfcomm/sock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 958081adb..1a35fb5fd 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -242,9 +242,7 @@ static void __rfcomm_sock_close(struct sock *sk)
  */
 static void rfcomm_sock_close(struct sock *sk)
 {
-	lock_sock(sk);
 	__rfcomm_sock_close(sk);
-	release_sock(sk);
 }
 
 static void rfcomm_sock_init(struct sock *sk, struct sock *parent)
-- 
2.50.1 (Apple Git-155)

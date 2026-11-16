Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803616;
	b=f+KM9+YMfFsJ9rIhF8JNzYLjCiHf5giPps4N0ErDXC4ZShfTVxcYxTJoCNC76Aciu92M
	 2zqWeaeB0/e63RuaAlN4pe0kzKcTR5s0n2tbMKdvddoNaDbq9mod7KBtKz01jrBIPe7yj
	 X/UnqQDOLOigNN4mkfl0QmuilAdGDGauSthr1yLWF4pr1Ek3CQ438MfHTxRhJJWn5TEdS
	 y/h6UJWSFtQAXxX76dbAGQ3/7FWBwm1yYNXvyXslBMXyn/rH4eJkEfUKMWEVYL36nr76D
	 ohFBdgfVmK2bYfTnk7pMjhyvnBvROraMZ8geZKbVddmX+iGAs/r9U4SjJHct3srOVAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803616;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tK1kQDQ9VFpYSF8W7MukIVOMVEC+nFZPGaW46BBVu68=;
	b=PUV75EwYsqBBvyfEVSdMKD0ZS+ZbOlpEokM8TFY6uVx2MVAvw5CoJCYVr7bY8+SEAWT4
	 q0al+Kmf6QCMQ7P7Jd6SAdjuyC+RFXOjyRLO4LtXulTwfCyW3rMy8iCRormibxmYtpKuY
	 RGu861zHNBlQVk1Shcv7iXxq7koKVWckGkQHOMRfe+rWyrnQgEWmO0WMtVbdI6XmMO5Pj
	 Jc48QYoV35MkDWJa3JSos8l8iYAuMCDo05SMLs1zrpERAk0cRr3P0XLQ1F3HTWfjTJPtq
	 9QWPZhYziymUU5F54myX+NV89KWCyzBASFV6Uo8FevpwzmY3zoVOFrRZCXEI8dEoF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B050606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B050606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5587351d419so2136470b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803615; x=1795408415;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK1kQDQ9VFpYSF8W7MukIVOMVEC+nFZPGaW46BBVu68=;
        b=IzcST6sk5KBAeymLdb/qq1XxzDIUr1uP0i5DzAzjgee+iKlcSvsOeKpsMEUHKf79ps
         FD/+eZayihiRfWfkdCiyYHlrEiPHo0iWFod8hSzITqSrpPXhPpfJvsI+VlvYJNKX1pC0
         PMdHWCK6odV37zUaUtBZmIQ8OQoFBVkvxkiJZgMxpZ/RdrZEMJ+ZSwZPTNEdzvyuDnkc
         qKtmPt3kGhCuJ/rdPFnDRtaohciIP7ia2VJgGpMliLNStfuwuxKYs3uBrJBd4y2Y/6wd
         L3cRSMZ4kjLmp/NTUIGzJgeVgiLm8CsgeSBmQM3gGKbqSiK0uq/NugahSKACHSJIpK8Q
         +Brg==
X-Forwarded-Encrypted: i=1; AL+hErFoZRdSUMMdD2Lj7JZc4JWiu9IJLK8rn65Iy04TqIg8iYU5a2Cc7eaZnRkIR93SbFC+UkhHhcrKcbIUvRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e+p2hNqhT4Sib84cI3sgUwFlJfECXywGF+3L1eb6V/64qf8NQ
	E4veW91ev3zgJS4aNjjTGDd2ipwYdzDE4vKBkIy+g6xLBA1df/uljP8IuSfuEEdz6G2KxSeFX4g
	25Zeh6tD0YvdFx1F7DwdiTaLL+DkkXapxZRmTOTHVOpl4FLBvl6F0DtpGYrk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3386:b0:4fc:248a:de3b with SMTP id
 5614622812f47-56e643c9297mr8008506b6e.23.1794803615054; Sun, 15 Nov 2026
 20:33:35 -0800 (PST)
Date: Sun, 15 Nov 2026 20:33:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa879f.920b2b3a.148c65.0061.GAE@google.com>
Subject: [syzbot] Monthly dri report (Nov 2026)
From: syzbot <syzbot+list7416c33635621b860c32@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 1 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 44 have already been fixed.
There are also 8 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 347     Yes   WARNING in virtio_gpu_alloc_vbufs
                  https://syzkaller.appspot.com/bug?extid=1b129b44597a126d2d79
<2> 145     Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<3> 123     Yes   WARNING in virtio_gpu_free_object
                  https://syzkaller.appspot.com/bug?extid=3590d97d8a586fa955c2
<4> 70      Yes   general protection fault in drm_object_attach_property
                  https://syzkaller.appspot.com/bug?extid=1944765c3659f63d3777

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

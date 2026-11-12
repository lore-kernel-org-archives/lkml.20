Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515637;
	b=rR6jZEyuwoLG7jCGO0I5nZVrwjFFefeYso0JK9yBFitJJv/UNV3Kt08s6u5R+aTcNApW
	 X5N68rApSI3d0BCZBVcTiKqP0yzhpAPI3/hgsGCzrWk0b91g3Ewao8doczGfcguAxiWwJ
	 b5T5okGnOY8eogKv+jJO+WWjJqoKKZ5Q6AwR4adqW5p+f2PdBlf8xZu7qw9bJYFrmQ+Kl
	 LvxXaXOFdQXdBKPhC6lTOLxmDSsTpVkNTQ8N7GpTzZZbWwP80Xg2LovH3ATPE/5vAo9B6
	 TzhbcEpr2J2C1c66pK7GyfJImL+OdVOX6cA/13mzPRKB0H+Ilw5jrMwLjnhlfiq1ZqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=gBrVAJTdCZD3/za9gWbaVLKgy+2UrOYir7j9/p3Gzwo=;
	b=lBkohSXsjFuEVyc/zkNgoUV7UOMd/1SmUVu3VD6UbczdDg6YxDpUXeU4uswrq7gKK5+c
	 nZqimg8ArI5j0wGwpUR0ov6rc1tRHTOHdAO0ExyaTpar7h8594ZJiEncNyalgvF/uhNSN
	 J1oYFCqVmiViWeByg6HKAOwe3+Yt0ccto3Hb4Repndyu5I5AoejAV14C8SQ5g88I2F9JK
	 nJFsyEibrrqzuoCFld0cyE6L0PJqovWUgfmpXNZYhITYDPFbtR05xbhJa3wvJ5CMtuVgV
	 HOeinrZaua7o5vusmSgJUCuxzHuPrw6E9ZEwUq45laIT7JiykYHap5mH6Lm9l06v6bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEF606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso243916b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515636; x=1795120436;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBrVAJTdCZD3/za9gWbaVLKgy+2UrOYir7j9/p3Gzwo=;
        b=M5IH+DN9DcFeJfgXqLOGw8AtrVugo0ncmJmjgeV3tskOcfzdH+vBA3p1n5GcnRbyaW
         H3+BW1rvOoO6Q5g5bMkzAR6vlCkmBhonrkRXFgocwl8W24uLFWIjJoxA+yomykK1gtfn
         uX04ZrdRTMZyP/ActhiYmlVBVfQT7BI03RduwFai/+7QEmSatOHwp9FdFCYBRqcq7BwP
         ArlTD3++sfch2p5NeSSuW0nShegUG301cAsBK4rM+kQlJENel/JeHiHhiyU37WQFzQtR
         apSOtf0u1GSirlE+iOjOu3DLopTYsMR0A8S1YfKiRs5UG6Z/LggKf1eWxudSy6yoSX99
         pNiw==
X-Forwarded-Encrypted: i=1; AL+hErEwXUwK52jS2/OXIx391YnTRtEx6xdhub6l+tqKWvyv+IJ7Je20gqoV0SJv7l3x/T0nPt6+fXcRKwvKusc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DYgQqOtVv/LiLAcYPSnsSYFl9f8b3T9EbKy/gtpRj8DVTtF8B
	dEFnZCQ3XmZzDX1A87/PqcTA2WKVhe0W4lHP1qni4ujjWpgFDeh/IhR4+xGhgSxD9AF/l0mMOXq
	ccAMpf1ndourcsM1sXc/rryLisbS/yznQskxWVvS08gEpc64FBqfU4ZvPK+k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1645:b0:4d5:27da:a496 with SMTP id
 5614622812f47-56e65c55d18mr343213b6e.48.1794515636371; Thu, 12 Nov 2026
 12:33:56 -0800 (PST)
Date: Thu, 12 Nov 2026 12:33:56 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af622b4.ff6dfe28.557e.0019.GAE@google.com>
Subject: [syzbot] Monthly fs report (Nov 2026)
From: syzbot <syzbot+list2e977b7855a334fac744@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fs maintainers/developers,

This is a 31-day syzbot report for the fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fs

During the period, 2 new issues were detected and 2 were fixed.
In total, 42 issues are still open and 644 have already been fixed.
There are also 35 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  12025   Yes   KASAN: use-after-free Read in hpfs_get_ea
                   https://syzkaller.appspot.com/bug?extid=fa88eb476e42878f2844
<2>  10568   Yes   VFS: Busy inodes after unmount (use-after-free) (4)
                   https://syzkaller.appspot.com/bug?extid=d569e274f46ca86f78fa
<3>  8841    Yes   INFO: task hung in __iterate_supers
                   https://syzkaller.appspot.com/bug?extid=b10aefdd9ef275e9368d
<4>  2045    Yes   INFO: task hung in user_get_super (2)
                   https://syzkaller.appspot.com/bug?extid=ba09f4a317431df6cddf
<5>  37      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                   https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<6>  28      Yes   INFO: rcu detected stall in sys_close (7)
                   https://syzkaller.appspot.com/bug?extid=393022c13d02e1f680e3
<7>  26      Yes   INFO: task hung in writeback_iter (3)
                   https://syzkaller.appspot.com/bug?extid=1e3ff4b07c16ca0f6fe2
<8>  11      Yes   KASAN: use-after-free Read in hpfs_bplus_lookup
                   https://syzkaller.appspot.com/bug?extid=8debf4b3f7c7391cd8eb
<9>  11      Yes   divide error in qnx6_mmi_fill_super
                   https://syzkaller.appspot.com/bug?extid=6a0633f11d3fb88860bf
<10> 10      Yes   INFO: rcu detected stall in kswapd (4)
                   https://syzkaller.appspot.com/bug?extid=f886305df0acc6fa097a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

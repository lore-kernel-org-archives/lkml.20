Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968430;
	b=lGh5FNgZoLSbMazvcPq1j0KLxu4orPL6Hm4GA8QMCmnLglsUySlxFpBoeBxNSH6LZXjL
	 IYC4g/R99gcoOrPZ1dC9rOR/jAoMsSe6sgA3alrw7bwqpQp+xoKcwXpyRa+FLZQeOgyXe
	 EE8LQBSDMYzeFAzvo7TJey0DVvICURjOXbLCRlvSXLgTc+5r6edcWhPTmdisI66SzkwZN
	 EDghZtd8gmxvP6x9SyFxYRpqDQKfhGpL79Hk0wnEO+cdvaHvZJjVZ4nGzqQFynzfBAsvv
	 B9cTOIvBYxvgYzO2k4AD5HbDsm3swK4gU9tby81W/dapY1t5GStk55iwUluKnswyvgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=2uqcxYTgBXJbTfbI/DlmOarXlJOAhStn4Uga9XDZVLM=;
	b=G/yFHGHljpNntsuZqJv51TcN1AIFTJLLY732bxNi309VcCPLAlE5XjoYrILnnVFKVdAd
	 togB0jLj80+lebeANllbkhi7JcmXm9CvKkA3aFkx0wxeMzL6gpnSGZKKBz9OgWio0gMvr
	 sgkcROBmn4Y/D0seGsTSIFqNqiuOo4llQacN3rM46WHHBKYpBJrAcHAMt3Td8rk1kphVl
	 ODyDubGhpc8n/RhkHPYpFeJGHfCZT6lHePe7cvfMIfKi6pfOCmImko4yOvKRds7Thbqzr
	 BdOqcdCAJu/Td/Cw17jZROQiNWwNU4XlBBxRvCEzYUmD9dXnpNBj1LwnCseP6loCwsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08016606D809
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08016606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso795344b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968429; x=1794573229;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uqcxYTgBXJbTfbI/DlmOarXlJOAhStn4Uga9XDZVLM=;
        b=xgeFev3484qaH6s4VwClGjCplVV0gBWv3TK18JAXzBtxlY9O3y/uC/zOfA7VZx65r2
         pcbxOd/7Z0TTLaEFdBtlr6nW8XBn5xxru3S7We80g4lArnHKHHeyb0OfW7jjzhoY96e5
         XD68K5CPpmFp83ZdY9xHDEq3i2Z7obcph7303g0+zByp43RsXtoKwBpuqTc/yMUysqtv
         e38tEteuTHAeGwhb43PnNhi3zJHFBY1UR0/5AmbXL40H+VtMbGXlHBgygKXp6SGgaC5w
         CP/jf4YqR8GYJUhgd08UqR7Gbtf+5urF8nozkEA9lfg7WffvIfXG//CWp29JLps9hTDc
         2jug==
X-Gm-Message-State: APuU4Z97g82oEvlMfQvQiP9FIe+tZALzzNx0lkSIvclFX9HVf/9np9SO
	MSz2DTexw34zwul9YiMfHLEl1jOdTN9wFLJMulIydRtgArMdztmwn7mCUnRZckqEf6+Twxv/GiK
	61fqTqIIhhwBN5MX0mthrdd5Pn4fTgV+Dvqn/Yui8o34UYAhzAXYFJpK8o/Q=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4b07:b0:525:184c:7952 with SMTP id
 5614622812f47-567e14c9215mr1547560b6e.16.1793968429095; Fri, 06 Nov 2026
 04:33:49 -0800 (PST)
Date: Fri, 06 Nov 2026 04:33:49 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedc92d.a716b02e.a4a62.0003.GAE@google.com>
Subject: [syzbot] Monthly media report (Nov 2026)
From: syzbot <syzbot+lista85d4caaecea173177e8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 4 new issues were detected and 0 were fixed.
In total, 50 issues are still open and 128 have already been fixed.
There are also 13 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  472     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2>  349     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<3>  198     Yes   KASAN: slab-use-after-free Read in rc_dev_uevent
                   https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
<4>  157     Yes   INFO: trying to register non-static key in as102_stream_ctrl
                   https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
<5>  156     Yes   INFO: trying to register non-static key in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
<6>  72      Yes   WARNING: held lock freed in device_release_driver_internal
                   https://syzkaller.appspot.com/bug?extid=ed3ed4f52d1fb6a7367d
<7>  33      Yes   WARNING in ttusb_start_feed/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=3caf6a60e5f9be12de08
<8>  29      Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                   https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<9>  6       No    KASAN: slab-use-after-free Read in __video_do_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=4a6e6173b1fc7916e950
<10> 6       Yes   KASAN: slab-use-after-free Read in v4l2_release (3)
                   https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

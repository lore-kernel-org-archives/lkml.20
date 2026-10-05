Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE155390600
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232421; cv=none; b=e8YZ2uX7LVu/GncAcsB8aroObgKpbO8+0vfmTvXi0vAq+Xs4b3mpmrDxOL9S0KtvsHZw6haUV7TM7qRhGOEtPeV8FrMfTmWWSp73Ph8TTm5j4T/KDfkn00NFCbfwuVx76wNh3EJ4YYnQ2oKV4SATdrRLFVhLRr5UUETLE16Gr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232421; c=relaxed/simple;
	bh=oa3kk4KTEaDRoze+xs/Mi1MlNz15pd6kjVnXAdFXQAQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Klgcz7aQgvU56n8Rb0ToH2bhOqeEi1EsBzopjpuOuzED+HWc1+6fi6wmCpVmpXr0JUZwZHJU+UuQDf7cW/6UJDT5tu3my2VhFv9hRYjCyuVOcwSrNWQB+nv0DtHxFNH+iHmMJofjbpfxaaQWDBCbyA17L7VtenK1amESXAXI4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so3270636b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232417; x=1791837217;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UudK6LacjO/O8vH7bYAzLel4l6J+dKtxJHj0zP5o4vc=;
        b=rh37GmnCgavnTbGfU0k1h1YgzFsi3FACcJpimi0iotwG4XGmSOxzmeHiwBekiZLPl7
         HzvWn6thNPokcYylWgveRNGFtrVUoI+0Xt8q4KcYei1Rqi+rG9YQYxqJRJWnXx8E/nY2
         bFRgdtKTS9G610Sf++DCXyaifhk/Ci3vsl00fZ94OxHaXBezMTXWR9DV9n8HFR8e7Hb1
         wp4c+Iw+eE5FlEAgDQMZ+MxUsbzxXP/UZdl/GW8vkotZO99KfxLSeAROcnbVbKLCaQtN
         G/wSypl91X3NVULHPb4ou8TAwjwOiimISzqWdow/PrAIofJ/M6b7Y/KgHLze4AfWQFHN
         vH+A==
X-Gm-Message-State: AFuF++mlunpKNvYd8n3aPUQjHiB7RSEEbzgH7rey0rDRQyFWb9ivHuW7
	qiaNb0IlDpWOF9CVgzEwAViluj7jT76Qi/ZgNvf7zK4w6nrJ2sXqGDlXe/6qNqs3fsuJZcHL9ZQ
	+me5oeE1Z81gVFOCm1DLeyuZn/l1MfZTEn2OW9vy4N69wNphLcFQlw+US3RE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d0:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-4f67aa155f4mr9280693b6e.36.1791232417564; Mon, 05 Oct 2026
 13:33:37 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:33:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac409a1.ae2c267a.265a6c.0008.GAE@google.com>
Subject: [syzbot] Monthly usb report (Oct 2026)
From: syzbot <syzbot+list6ad4d3ed88bfd4c0876a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 8 new issues were detected and 3 were fixed.
In total, 115 issues are still open and 460 have already been fixed.
There are also 45 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7662    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  3850    Yes   INFO: trying to register non-static key in __vb2_queue_cancel
                   https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
<3>  2498    Yes   WARNING in usb_ep_enable
                   https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
<4>  1840    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<5>  1815    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<6>  1061    Yes   INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<7>  771     Yes   WARNING: ODEBUG bug in corsair_remove
                   https://syzkaller.appspot.com/bug?extid=0a031a76585d1c7e737d
<8>  449     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<9>  380     No    KASAN: slab-use-after-free Read in __usb_hcd_giveback_urb (2)
                   https://syzkaller.appspot.com/bug?extid=7f5e98b052c766f47f68
<10> 307     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

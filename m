Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DEC372673
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261210; cv=none; b=IU/IHrDYOc0GO6aCd/UCmWrd+E8Zq+tOQ5qN8aCX6Zprmt0MQfuj/xLzwTy6OHmY7XjG/9rKFKpRID9zCJK3rCSaVqIPGd6SkOlwVT9a3kFc8O6HFQgtrhi5WbmRhWi/OkhEN0rFZJTErDgHlMl4kNNRhuPojlQc6PGZjqOciL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261210; c=relaxed/simple;
	bh=TnTce313NjcyC0JIWSJVLDaUCSSOSf4juQgSQ/hJoGc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=j88Ndhjty3VE+MZdNOY+tbvqPfyBO53bRBo47BWGpqcKNjuf9PhrpT1jzgfCwu+MY+845ZpCOVHUuW+H13/0jT2lJHLVYGZdreAPV/dGBSMRGuRBayx2YdE3Bqik1DJ6DENku5zeBZbusBegmijOd1UJ+HRmU/JIuacRn98BeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso4032082b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261207; x=1791866007;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWCEugY1TPY1aIZTaHZc8c/vZIq+klJR9OSQcVtsQwg=;
        b=nvtftRhgVKh4KBY0slfJIy64fQ/2dbQGPJOGM+zV57L6TfEqCW7f9LEZyvRKywHDyE
         tRujx4NB2FCwLiWcI9F487V5XrwO0Yoi8YlIrvExywPUHRuLqe7/erQk7agfbcdVF+1A
         o8wD81WSdbMkQ+1uLNN9Vzd0YnPjdnTR1inKrPjsGAqGKqmZeIfr5g9zLY7hJjaf8eww
         Fai4CsVp4Kg79A+KQJaqQAgZII/Kg+Jjer92myujeeLNHmSCPsX2fz7gJ/DDJ+LRIYV4
         ruqKcB4klFojxFg38L0Ljt7uNqi6OSiotT0V44uj7fU41z3s38Dch1O8Z9NXS25xvtsp
         0E7Q==
X-Gm-Message-State: AFuF++l3ufCqF8REKocHeh/CRgZS/SQKcCNFeY7Km4NsBA/EpsiS9q4q
	hY0R6UsOKT3kgKXRLBoedegDYShcLHwEeHPUPZDHrVD4hHWtF+y3JMEIeeff3u/AkhXtVKfrrJa
	l5Pis6C1T6nCKclIS/P+xiNKdc/CeaHsu3B/KrEi6zZAw1/Mvtqs3lI6LUeo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c413:b0:4f8:4a95:994f with SMTP id
 5614622812f47-4fb4037a2d0mr353572b6e.30.1791261207400; Mon, 05 Oct 2026
 21:33:27 -0700 (PDT)
Date: Mon, 05 Oct 2026 21:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac47a17.598348e0.18b15.0009.GAE@google.com>
Subject: [syzbot] Monthly media report (Oct 2026)
From: syzbot <syzbot+list24d523540eee1c37758a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 7 new issues were detected and 0 were fixed.
In total, 49 issues are still open and 119 have already been fixed.
There are also 12 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  334     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<2>  309     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
<3>  193     Yes   KASAN: slab-use-after-free Read in rc_dev_uevent
                   https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
<4>  117     Yes   INFO: trying to register non-static key in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
<5>  84      Yes   INFO: trying to register non-static key in as102_stream_ctrl
                   https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
<6>  27      Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                   https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<7>  18      Yes   WARNING in ttusb_start_feed/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=3caf6a60e5f9be12de08
<8>  3       Yes   memory leak in dvb_register_device
                   https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
<9>  17200   Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<10> 30      Yes   KASAN: slab-out-of-bounds Read in ec168_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=64485d3659c4c07111b4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

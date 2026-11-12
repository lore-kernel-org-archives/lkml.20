Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486812;
	b=o4R1OjLsuPt5lUq5Tc1w+2+zc8BvbOPPED3PNSDznkihxsqXz43kmnnJAyl2x4Etg0mR
	 lWMqFD44uBhWda/Y+KYIA+nWbrWEQUjz0y2z57/LI0t8KqikPtKzLJGy52gfmCcLGPcAw
	 nE1IJbdNJPJmKYy5ZAC+VjILTVlcsdGRW22cp09GNfwzPkwuSfPPcnC6xIgXR7a2e5MjF
	 JiA+5VbYjW6y3qjMaLw5+F5XuAh7YcKFSHkmF9RpWufpkX7VYId3iL29DERCS5fChN/s+
	 rNPA4lb4mH9SObC/+LonwcwGeTTrq49nSdXQIzoL03sdhjLwXAVm4zjXoKHurwwwzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=J7e/HQWh9pXQoKTp7kH2sZAez1f8qPQApyE7NMQ7Dcc=;
	b=scBfoURkYcjaUcuu96VYJt5qqGnFanII8IOHBzMUBLyqNpH05FFlJDJrHQOzhiVf/EM4
	 EyS7qxEoGWSc4khtVEIe/eqdFuQbOkZ1lTX/THVQ2PryJyUKTh6EasWgloSzqu+xaMryV
	 mAVzJ47CPri3Ys56toKnpMkBD3AWqjpYzKsy/vPADC9g0f6yhneU1h1MNbOXVvEvUj9oL
	 GN6+PUIHLDk9EhkQqMA1G7xVxgn/cqR92/9PfVo7k1Kk6T6KtZFCNobZWGoPbQ5hukKzK
	 Kzvww+zEnExlknTbo6XZXRmr5CySv8Dud/C0QemKMB9kka/1hYib0zcJYEJLhaf1R8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C8606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602C8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-568249fbf5eso5364299b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486811; x=1795091611;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7e/HQWh9pXQoKTp7kH2sZAez1f8qPQApyE7NMQ7Dcc=;
        b=KHRAo+23IT4CiNvQ3JOedn7Stje/qQhuPn0XUbENckIGGw+bhumYCiPBPcJMVpZDKV
         WHyemCBoPEgSrzTcu+VEcY66ITbWqg9GZd62NaQWBUZyPwmM9e9QfMKZ51NgR1zw90OZ
         cIT4hIWOAPQQaUwbmREPi980vfm0xGartSNeBvrB3TZ1roWkGyeE3e0/f4KVia+bgnoJ
         Z9Gr4KmCU50zje0udvbXPjKWZcpbfQA29M0samqDWH/YJRhk8s9fe9LSGHSM8TOwaiq/
         Qh+iPEHWrmBaHqOpi15b9++ksL8t0mibudwZtEVZuubYBCzv1/sy3pOtNQCoXflZeAT2
         QwbA==
X-Forwarded-Encrypted: i=1; AL+hErGAh1mH4S3Sy2ShE9D4K4CXemPs3zssST7vLBolHoXRJyRP3WDpjyVQiJjaKb0ziLOnLIgI+UNmIY10UlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HXoaUWtPkNM9Yyvze88FrITQbQorZO+rBFn+TTwjrKZaezn7p
	rta06Z07TNX+CrgIENKTMyXGWSxO0lDzmepICqBb58Y44nzJwN6Muj3SHAhWhkd2Mg4zWwndKyO
	Ns8wVeVQY3QlwD6nl/feKcbcmJ83tvyz6EgN2g36NP8nyIr+UMeN9lnXHmGg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe3:b0:556:82f5:5aaf with SMTP id
 5614622812f47-56b97d11f1amr5246723b6e.49.1794486811208; Thu, 12 Nov 2026
 04:33:31 -0800 (PST)
Date: Thu, 12 Nov 2026 04:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af5b21b.0f67a820.5686f.00e7.GAE@google.com>
Subject: [syzbot] Monthly ext4 report (Nov 2026)
From: syzbot <syzbot+list388317f27f7b9295f8ac@syzkaller.appspotmail.com>
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ext4 maintainers/developers,

This is a 31-day syzbot report for the ext4 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ext4

During the period, 2 new issues were detected and 1 were fixed.
In total, 29 issues are still open and 189 have already been fixed.
There are also 13 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 8189    Yes   KASAN: out-of-bounds Read in ext4_xattr_set_entry
                  https://syzkaller.appspot.com/bug?extid=f792df426ff0f5ceb8d1
<2> 6060    Yes   kernel BUG in ext4_do_writepages
                  https://syzkaller.appspot.com/bug?extid=d1da16f03614058fdc48
<3> 588     Yes   WARNING in ext4_mb_load_buddy_gfp
                  https://syzkaller.appspot.com/bug?extid=fd3f70a4509fca8c265d
<4> 358     Yes   WARNING in ext4_iomap_begin (3)
                  https://syzkaller.appspot.com/bug?extid=626aa13bf52efc3aa86e
<5> 3       Yes   KASAN: use-after-free Read in xattr_find_entry (2)
                  https://syzkaller.appspot.com/bug?extid=fb32afec111a7d61b939
<6> 1       Yes   KASAN: use-after-free Read in ext4_read_inline_data (2)
                  https://syzkaller.appspot.com/bug?extid=085a394c92518a04fd09
<7> 1       Yes   memory leak in __pcs_replace_full_main
                  https://syzkaller.appspot.com/bug?extid=4d078516add5f4f12cea
<8> 545     Yes   kernel BUG in ext4_mb_use_inode_pa (2)
                  https://syzkaller.appspot.com/bug?extid=d79019213609e7056a19
<9> 79      Yes   INFO: rcu detected stall in wb_workfn (4)
                  https://syzkaller.appspot.com/bug?extid=5b4f4f81240931b16844

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

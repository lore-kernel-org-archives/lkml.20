Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289849;
	b=RrKdD+FtO8I5qgpdb6uXHMBRaMqk6woM/STdKYM4nk3zG9BBz1JW0hb2uOD7UiRj2LiP
	 esJSARCJhJfPQ/p46xr3IJWWRECDijBE4mjitxQXCz8DLiOJY9tdWr1xQ68IMhQ8Hm+fD
	 UqUFwgSPsEZMw4KMPORCGBax5+koX+5laTLfBhA7nrsoWwrui98rcIeNOGbXLej18liXM
	 GgtODKhnRXooVQ9OHTkVU7PEaN7RWaeQWvveKSZnzPK8A5NH27PKgrWMoRJZxHghBE8d/
	 srjnLp5DbCpY0r8RKHWctyGUgAdPszVzgu/EvOW+ywFK1xuioVllg/2Jnxj5Ap5nnvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289849;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BT20worzG0ZlnN862p660bfUbOpsK47mpVvJf+3XDvo=;
	b=BJHnkHpal+ToYk3fy/djyQ5ofTRLFZnx09YqIHVkpekqbHO/Ngk2lkQ2xupz1RVy5ZXC
	 vNmVKcSFyVVzyWNt/F9eCd+HDaWKewBA6qFmP3Ifzl25b7m8u1EsvJCtWSB3eSP1+lL11
	 xzXG/vcsQwzVS2lbsn9L1rzFdltajA4xE5YOnz2XYxSZyj1Z6JIgMwcfRckG48yZNdr/A
	 ORtIATlSHfCtmZ1ySDvRLZ+fMwHR34ksCDaz9GDA/TFncnZv410IaRCh3m8FjnM0B9WL1
	 KPRnnn4d17RnV8TdM4mmBsHXfTExtpWNXhSIBa5Vx2R/RfhDS/tecMYXRr57gqEqu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CC606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-847e2926d94so3294339a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289848; x=1794894648;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BT20worzG0ZlnN862p660bfUbOpsK47mpVvJf+3XDvo=;
        b=wU1f23i9xV0H3wH6BYtDEHIzsB5XC52pFV32SlGQs9ZpjMg1+OXVdWoI1Uhs9dsJTF
         jvFUWbX52NDWMNIb8C1uZSpa61mTVui9z0DCB4gqGHlcZpO/tzGdIIdCCMFms5JUdLtf
         sVzAYBfaBPCc4u0sUibZ02ISpnHsSXypTgyh0bGhoThmaNgdhXC5iZS52UK0Iy3sbpJi
         tz92FvYHYsQ7YIBjxZqLhJDF5C/XCi1/p3a2fm64Ta1nHP/9n4iZPjjf+wqBnsrqHWw/
         f3gzj7YVgbZ67xQJlh54SrBkKkn33d9cWOS68vzJZbVKlp6TCjRqOSj9xp1d/z3CstAw
         BLrg==
X-Forwarded-Encrypted: i=1; AL+hErHZ4RPSdN3VGgHYbuayf3iFNAamzE/k7JuKMqej8zG9fNnOol6ci5W79ooF7RfLXxJY1jXweXumsuZIu4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yo/CiSys9K3umD1pogLlf54kqO9lNYgDlfxkmYxfCE4JECTn4
	3iXyIrCw1cClb+CpqGBCb4EzN/QCUu6pQK45qQZcuPOXi0mGBViJxbwz7jyVEOROfr9EhU7Cq8f
	p1kmX+As/TTxhPPQUhTCZvmxhvF5f27JmQkplWTc1em5ejqBCOqpKXmyv/ic=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40a:b0:4f7:27ba:9db4 with SMTP id
 5614622812f47-5683cdd6dc7mr1212802b6e.60.1794289847956; Mon, 09 Nov 2026
 21:50:47 -0800 (PST)
Date: Mon, 09 Nov 2026 21:50:47 -0800
In-Reply-To: <6ac94026.70ed5d86.2ac85.0077.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af2b0b7.4dd4714a.f8d02.0021.GAE@google.com>
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_pmt_create_sec_for_each_pat_entry
From: syzbot <syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, matheus.aalmeida@inf.ufrgs.br, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    b3dfbde62cf1 Merge tag 'linux_kselftest-fixes-7.4-rc3' of ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13cfd83d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=3bb39e30be6cca84a865
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16436f35580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881112c8690 (size 8):
  comm "syz.6.49", pid 6988, jiffies 4294945880
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    __do_kmalloc_node mm/slub.c:5530 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5556
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    vidtv_psi_pmt_create_sec_for_each_pat_entry+0x7d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1471
    vidtv_channel_si_init+0x544/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:478
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:198 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:243
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1072
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x540 arch/x86/entry/syscall_64.c:89
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

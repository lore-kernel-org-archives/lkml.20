Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515637;
	b=xL3tJzmv+q3PPwoACj2E8L470A14lIIJQtliil+gGLgnCE4bgoq5Kmf0IjrnCzIg0cWQ
	 fxFXrnlMXSovzD6qc92uQ8X+Dm896ybwpd5OLp7sKU24//Vxyg9UzEwn1zWJt48iyBQHx
	 5TUrsMouV9ziEphQCHeNGuKpFVjBbhSXmHNYjlJyrWDIpb/oR6Tuxs0bEbcR0MpoCUDMr
	 DsPaFDiYCMxAMcU01xbQWPnSIVLp4AqHC5oF2QK+2gp/LwDKshwr/PYXJFCc4gf+8a+FG
	 8YZiXpy31m78kxNIRlLlV/cywwvoCnxnoDUpZGdelzi+EFGibZQ6RUE5IbuWUEmdLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=AGrviyGKzOJyqDNGuonvUk0+iEVsk423d//XjaI5/Pk=;
	b=o1x/1MKAEUS4nY6kYpdl0UecnfQDORpHy688eW7wI+HUyKoyezZ1VPI9qPDAGP/8Wz2R
	 ERrNXuHFWvvKvc+vWQfTqK19mOvIjVMFC1HfxCwaXL4+6aAqbEoLwa57Hc3uX7/PQQJeN
	 nXG9ZSRHipdetyUfwkWMn5ckQiSdu9FxUGUxPUn1i5XKlSPgE+ylQit5caPW8Q+UIdtIT
	 wA6k4agMkt942pb5XUqyQ1Y7yUdY8p2JfnO/lautW7X1zdM2yLlJ6qt4BZAcaD/BfSevs
	 5AeoT911y1zlknB7Ft1M6vP/RvccihtsyiezjWLlRBotvnQXt70HJusytqY+KLco/PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465B606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8465B606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso254206b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515636; x=1795120436;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGrviyGKzOJyqDNGuonvUk0+iEVsk423d//XjaI5/Pk=;
        b=1ncengpXquJ1bBb13n+pIlKFbN9KAgifpfstUEapcQEhF0KJW5LnuvNAglUohw6vM1
         Yv4LV0jUvTj1uoGhfCQjfUz6bsR5wEv8yAPIVIr0pFI2NuKy3onRMhb5D30kp9XTM4bD
         ry1SEwW4dBX5ykI35Dt7z4CcqsGF5qQN8xEXj6J5RZRTnzLbOjOo5YwSHiHd9F9ENH0O
         4rJNvl6vhPdV13e33actZYocgy9hibmIT4wqLwp34o5FZpkLADFFBMl7LsNWvJFhFcOU
         MPzcbPu4j+4hbhLNBIiQOh2LyiuH5K8DlZEMvf1/qAFqILIRyo3Q6JIdkFUo/NLJ2tH0
         8SGQ==
X-Forwarded-Encrypted: i=1; AL+hErG7OTrK1k5WbU0kMkSJOekDtN/DIRbEzDHVQf1UkRSJJNENCr4NJRVvpFqvCsHYFoHyMNpNLHf82hBFHVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c1/9bQNiWk3GQWyzvx5zxf7AtnZsd1p+9pe/m+J4f6u7O8ONE
	LbE7UJeISZlPJaO+Urge3FheOnw1daxQrAgO1/ZFMDKwD1MG9AY+FoFCZtmj4pXlJDqSZBS4oQI
	1cDNNvndX80jwfFfJKYAbgDgsx+3F73WjD17SowfL0yLzZD3WHCulvKB2Lt0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3509:b0:532:963f:3118 with SMTP id
 5614622812f47-56e603885b7mr346645b6e.3.1794515636629; Thu, 12 Nov 2026
 12:33:56 -0800 (PST)
Date: Thu, 12 Nov 2026 12:33:56 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af622b4.ff6dfe28.557e.001a.GAE@google.com>
Subject: [syzbot] Monthly ocfs2 report (Nov 2026)
From: syzbot <syzbot+list812a400613f624e19b24@syzkaller.appspotmail.com>
To: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ocfs2 maintainers/developers,

This is a 31-day syzbot report for the ocfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ocfs2

During the period, 0 new issues were detected and 1 were fixed.
In total, 23 issues are still open and 61 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  434640  Yes   possible deadlock in ocfs2_try_remove_refcount_tree
                   https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
<2>  50002   Yes   possible deadlock in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=5d516fba7bc3c966c9a9
<3>  20078   Yes   possible deadlock in ocfs2_setattr
                   https://syzkaller.appspot.com/bug?extid=d78497256d53041ee229
<4>  9457    No    possible deadlock in ocfs2_xattr_set
                   https://syzkaller.appspot.com/bug?extid=ba9a789bd1f4d21fcefe
<5>  6292    Yes   kernel BUG in ocfs2_write_cluster_by_desc
                   https://syzkaller.appspot.com/bug?extid=18a87160c7d64ba2e2f6
<6>  591     Yes   kernel BUG in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=fd05de09d1267725aa95
<7>  473     Yes   kernel BUG in ocfs2_dio_wr_get_block
                   https://syzkaller.appspot.com/bug?extid=f8b081be889b639423bb
<8>  8       No    possible deadlock in ocfs2_xattr_set_handle (2)
                   https://syzkaller.appspot.com/bug?extid=b4732eab3dcd27c32ae6
<9>  72      Yes   kernel BUG in ocfs2_populate_inode
                   https://syzkaller.appspot.com/bug?extid=779d072a1067a8b1a917
<10> 25      Yes   kernel BUG in ocfs2_block_group_search
                   https://syzkaller.appspot.com/bug?extid=44c564a3cb08605f34a1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

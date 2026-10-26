Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046824;
	b=wD7mw1L6pH6/LHtSbXuK6MbJH1KBEVQyUksjHip0oYxJI3pZvdcfKUjTvWORsYOmm1nn
	 YuwvuVHu0MOCakfeeuiexxp0cgfLM4ErGKqFD8+JmlS34P2w1sLMyOAXpaqjmtFV6I3+p
	 wJ3xUL6GG/9I6Fb9iD/sRJT51XfmkQuN+JA1bgYBa2HI+QJQsx4PdnYrYgRsDp3hMpIx7
	 oLqmkNxffUpWcEdRwJb19JWuoxdKkcC6eA/tjY7024Zb1RmwoHw+FiKAV0fHrxmYlusqR
	 gIweFMsTK10XR7isP720QDEG1/d+LxBYfbYIE9IHCbwqLwfyZL7IYh7uE/wBdTIVBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=iRccZVeCNKdc/8T/FzB99LACl98McbT2PAYi2Bpn7WM=;
	b=qeVc2TU635U47MR/834rQFKDm7r32jHRCPK0dvmfzB9Phj0s+epE+nMX0nn1XARyxL7d
	 iRkq/Xm5N7IDHSmNrgA15t8AYk7bPXMlL1Cs35TwW2RAjpqokyKyLGU/BgkZ7KVUEDw97
	 pI3okyDXF//eIV+jZzZ+vzTMf5aDVb5gmSXPcHhoGFQy1LBvTTF9Fn3mWeFLVuYR5nH4M
	 Uub/gff4mE1J3p6KLDGbiWmUUi/lRh0D+iVRI38Pic5y7noD4XCd6qT3EM5dWUGRHPIL/
	 2WkCdWEtEQbQQnPSSxXZDRxl17wDuwJSLEkDu2Ls9W63PLIr2E4O71uiM+siR6vkJqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D5F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5384e381fbbso3388651b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046823; x=1793651623;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRccZVeCNKdc/8T/FzB99LACl98McbT2PAYi2Bpn7WM=;
        b=hlrfQRmc/ZJhVR6KfRb60S5MI3MjPADygxiEPSCZHIB5sgNCzgM2zfLZW3fJRruwdi
         +E08Z6NApoQaL4O76PEevw0ehuNRsRDROBtSVLr2B9nlp68JfUqrGLSfgq5gXr0+N9S1
         /3XJf8OEx70QpxqcLQgWtGsYkCQcuwn2H09dpChm2IpDkC7z4yCwDpZ0MA6WlHjSMa2d
         2GcD791zvzA8H+JevjTN6n4j+lGPe0B3ieus6XKzdlanEA/ZcvbR0OvAXc0dpXskOPsN
         nccwiFs8Mllu5auDVKKHBD4eiCEAtb+XgLbhKSIh/VziiCuXOhV2SvBgcoWfNtZ99V3q
         OooA==
X-Forwarded-Encrypted: i=1; AKwUvBy71dfwYGV39VOgGimajukj0tbB7+42aXWr9nAFNhk40edoIYotckweFbVQh4QELZatHtFO7ASNSIYEVQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6L7BgEem75GdWac3T337/3zb+S2BvPM50/htD4quqdzi17Kus
	4S4wb4UUcbY7ws4n4tSn755MsK6zQ7jtwSVZHBLpIeWA+2aAV4Q2TkGTBEBMONsLDiNzhoWUzfq
	W+SoiNeIF7VfAK8fA2TDAtWNIfsChHPUjZouz1PeY+b9jS7QLllg0jLlMIU4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1819:b0:539:596f:6623 with SMTP id
 5614622812f47-55c0035e613mr5083540b6e.64.1793046823318; Mon, 26 Oct 2026
 13:33:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfb927.3a3d6196.2ecadf.0020.GAE@google.com>
Subject: [syzbot] Monthly gfs2 report (Oct 2026)
From: syzbot <syzbot+listff7b9f36ba634c9915eb@syzkaller.appspotmail.com>
To: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 1 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 50 have already been fixed.
There are also 10 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 163     Yes   INFO: task hung in do_uevent
                  https://syzkaller.appspot.com/bug?extid=b114bbe890d76037877c
<2> 108     Yes   kernel BUG in do_qc
                  https://syzkaller.appspot.com/bug?extid=bad65435361712796381
<3> 79      Yes   INFO: task hung in gfs2_recover_journal (4)
                  https://syzkaller.appspot.com/bug?extid=9013411dc43f3582823a
<4> 62      Yes   general protection fault in gfs2_glock_dq (2)
                  https://syzkaller.appspot.com/bug?extid=5a5f492ccae698fd7434
<5> 57      Yes   WARNING in gfs2_ri_update (2)
                  https://syzkaller.appspot.com/bug?extid=7567dc5c8aa8f68bde74
<6> 36      No    KASAN: slab-use-after-free Read in gfs2_ail_drain
                  https://syzkaller.appspot.com/bug?extid=84a21b16aba9f279d96a
<7> 182     Yes   kernel BUG in gfs2_quota_cleanup (3)
                  https://syzkaller.appspot.com/bug?extid=af4d53576692f8956fd6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

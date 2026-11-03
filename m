Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680439;
	b=M9tlcT923ThST0/8/9ES7bFeFO6cduCkTLXEi74vYL0nNoGqxcQabHb/PK+uXy/hMAsx
	 omJvrhBgcRZIxgaLYdCfAiroUVN28zoypHqYPexeLfbHnnhS/puuAzznuAyTpxcLZDV9n
	 JEQhr2uW98Pra3ZtTfiuPBzHkgLUTh3PSmeNOTm9CZiapZVE17N3bGFK7SGUBSVpQLIsi
	 dBqP2ghg2MnANABDALF/FqjLuFOeEVC08VB/UmkTWLupvde56uUvvZ+zuig+bQ3eF+MF2
	 p3aJIcdigw4E0rBP7PDvhKJHd2bjp2a+kC1EydkIBzsbUXfckufqv57Sf4zYJNdk3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680439;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=rAyXrOOiSgxA6Tmwf2Bm1LeAX51YI2TlZ2FCwqS13ZU=;
	b=n80P6bie+PwgGxguQ3H7ReI99FKONJFOYYYfM/ODeC9pne5CdWnfPYxrrdzo/i2JUYj8
	 tXxkUyIJLzvFLx0SD5UIMdeczXy1ST3suF0PNGCRxFHTOIS8/eDfIDq+IP/M3tmJQQ7Ep
	 2vf+5ey+kCoAcXjjtVipDSWBqz4XYulmVpyHb0edriZ2a2nBkapLz+MEBe6fl3vOs4GAK
	 FRr7Ox+qGu0dhiY+DbuFhONP7X4hu4Cxy+nMK6JwZXPGE+LI8kpJs1EywzEjttPTgKhxy
	 WLYuSBJA+0/jbJWDv1FfiJDOxPgHg58hhfrzdpWD/8XplejOwPymNVi9LhDcnhODwqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA40606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA40606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so6142766b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680438; x=1794285238;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAyXrOOiSgxA6Tmwf2Bm1LeAX51YI2TlZ2FCwqS13ZU=;
        b=BqEelL+80p/IWLopzehqfg021IPcZ7bLJaNz+ZesElXk829rsfRDJGSaNO2z7awNEY
         tPZRRlrqhb6cnoWqUYBAhHbOGfBnOP/RnPmOR2aMnu6xpcxmRXyfCihaJcmuuXfRLSsS
         cDCqC325CblhbvkBlg6vk2Q5GKbyFBoL/53OGGXIRvevNObyUpJ6BufJEfq0ylR7GEaW
         gjwB0uM0P/JNBgMBmmeYwcjgg4PfpxyGjoRFa21PR5FreUD6Dh24PGniQCt9yXBriIuD
         HVbqao21jYnoqC2NMirSn3WkRxmhThSQtRyuwf+lhrz5fasG5C3Z3SdBYiEq+SISYvNa
         Zojg==
X-Forwarded-Encrypted: i=1; AKwUvBz7gQod+tE37CeCNTQjuG/Q2CvJsPjGygPoIj34j39DCH4p1uUIjeipJILdvJ7qUiMw/XpOJLDL1dUTy5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAAWSnbJP5fQmfNJ353gWFuyIlpx3aQ0nyMHIAX0rxdt+8WpKr
	pBbh43PBl1quuBosoJ5lP0m62juf6F1E6436lO7memHA2qWWn85VIK7MQCzNLm0geYDryOrV/JQ
	YH+rjynfmWxETtumH5Twha/O8eyykH4fIKQL5ei8MJF+gppnimiXTR3SGMx4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b25:b0:552:9d62:f1b6 with SMTP id
 5614622812f47-5640de5b910mr7813214b6e.51.1793680438337; Mon, 02 Nov 2026
 20:33:58 -0800 (PST)
Date: Mon, 02 Nov 2026 20:33:58 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae96436.abb90550.19e2c9.0000.GAE@google.com>
Subject: [syzbot] Monthly jfs report (Nov 2026)
From: syzbot <syzbot+list421f13bcf36317d2fd2e@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 64 issues are still open and 73 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  110743  Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  96427   Yes   KASAN: slab-use-after-free Read in lbmIODone
                   https://syzkaller.appspot.com/bug?extid=ecf51a7ccb6b1394e90c
<3>  55459   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<4>  50442   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<5>  9261    Yes   general protection fault in txEnd
                   https://syzkaller.appspot.com/bug?extid=1d096d31de6a0491b55e
<6>  8201    Yes   KASAN: slab-use-after-free Write in dtSplitPage
                   https://syzkaller.appspot.com/bug?extid=a939a1121380d3212940
<7>  8178    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<8>  5481    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<9>  3323    Yes   UBSAN: array-index-out-of-bounds in dtInsertEntry
                   https://syzkaller.appspot.com/bug?extid=5f7f0caf9979e9d09ff8
<10> 2762    Yes   WARNING in dbJoin
                   https://syzkaller.appspot.com/bug?extid=a67911c5a11315aa55a8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

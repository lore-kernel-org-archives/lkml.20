Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D0F348453
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973215; cv=none; b=gpbvQ1BrlcAR0lK5Nb7Jblv7FDSIWq8gTOzlXueR3njT3x01SuCV4fb0JpOdr1dVm7XiJWl2j+Oif9GtxylQqQE2lSPap8x9HLEIg58PkdtdAcl9f6/yb6n7x9Ff3dYV6d/WeyVp8T153zRmj/8wtpCu9lDr8TocJHF0RxsbcCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973215; c=relaxed/simple;
	bh=pt+mjiH5Aq6MBepMHogVXZxCLRcZbsKOcUOzqZcJ9yU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ap00Am3Rfblfi+7CLd0Z7NQ1hG18WOfsbTpaCIYEgNpLKXcGBehoAvDZHatb5gbaVNu7M/E87SwSfhbzSIKu1k8UInfdpdspTxXaSTf1evKpzH+fTTH9Io16WYB4NjM5zaZcykpkMxX/oTIoItVciMwUluJYK51sIQes0cKhLfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea4c979030so523149b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973213; x=1791578013;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL2h/bmIrApXcpUZrcDtHwAt5XGFETtonpvl6Vb0uJ4=;
        b=TFf6AAPgNYzhxydCXD5pt9WshW8xPj8kNkFcNHZfllKBV00f4SD93szmMNlRmgcNPG
         sXfANN1PUWUiMY4RjofFIheit+jZjTmGyiom6dLgNi6lAxZe9mVZJsVclEIQhVvwDVxr
         ZRzaCBY+alxVqaVNvgBWAOvCb2Ip8ASmdY7pDr65a6gtpX+wAVnsLaVzV6DvNqZ+VZYr
         3Wx9GRbdEvNuwwj9oXCoKjlVsPVU0/DM+aVoy6f8ZCBJMuZ5CSLbamdMClpGdU+KfcMH
         IxFRGmcQ88r+y97kKLa915j86KhMXFP8FgtG7qwgQeUxqNWqgEP4GCZDTOvBuIWRaVbQ
         iNxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpuFAVcHXtoHP9PVaNvYYU2i/D1HV4FZECc4jmBq00uCLt/IXtlyzm8QipcpohE9GW8Tp1lc020/L6DV0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/N7lW75YvY8gqYePMMocBjJ3hIc+k/yF3E7MVPiQ2JS8mcl0O
	K3D8LFCEduhX7OXenMGXke0gXp0aoEES+8qhxKrRxvI1uQyPPvbqMQlSajxuaHdOD6Y2DWlG8AJ
	yyymHjLWlAeQ5hzrT8cgaPHOrivtg/26gPtfB+3kkImu37/6tV9kK74eeJlg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1823:b0:4c3:95d:91f1 with SMTP id
 5614622812f47-4f526948ca0mr3914226b6e.1.1790973212886; Fri, 02 Oct 2026
 13:33:32 -0700 (PDT)
Date: Fri, 02 Oct 2026 13:33:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0151c.34119e79.2f92f3.0004.GAE@google.com>
Subject: [syzbot] Monthly jfs report (Oct 2026)
From: syzbot <syzbot+lista47b3529e18b029d9978@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 66 issues are still open and 73 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  109184  Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  84986   Yes   KASAN: slab-use-after-free Read in lbmIODone
                   https://syzkaller.appspot.com/bug?extid=ecf51a7ccb6b1394e90c
<3>  55438   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<4>  49781   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<5>  41982   Yes   KASAN: use-after-free Read in copy_folio_from_iter_atomic (2)
                   https://syzkaller.appspot.com/bug?extid=6cc93ec9a4035badb85f
<6>  8783    Yes   general protection fault in txEnd
                   https://syzkaller.appspot.com/bug?extid=1d096d31de6a0491b55e
<7>  8141    Yes   KASAN: slab-use-after-free Write in dtSplitPage
                   https://syzkaller.appspot.com/bug?extid=a939a1121380d3212940
<8>  8016    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<9>  5405    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<10> 4392    Yes   VFS: Busy inodes after unmount (use-after-free) (4)
                   https://syzkaller.appspot.com/bug?extid=d569e274f46ca86f78fa

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

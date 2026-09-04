Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D03F58F5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525212; cv=none; b=uZj3UljL88X6CPBuLgY+D6KDb3IIsdiMHYmQy9lpMpwjUgpgEBhpB6wFbtJ+wFoe1Dh2qFo4EjW4s/EK1qrDda/cl9ejOwFZ4laKpgm/jz1lPjzxmXwcUfaTAOXKGMUuZjyI2xO9ShimOH1j9C9ugx+D0Zv/nMdYuizUJt0FL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525212; c=relaxed/simple;
	bh=p+wWwWXK9zIQaPKBkCJGlP0YptlJs1N80dclIPOQAvQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eqE3tNxy7zKGPshYlNkEdo8RTk4VJTxLnyOqx3TIThEczO/+RUeaqJNNrNB1VpA3BYBbrC+Rpx7vSsG/HDqkypuj9Gr5dYKAAyqtf9z+4Ac/qqg19oKyWc5KJZ18TDaRsrrQeJSRGzITFfoucb7VLwa0f5li4zCiiARfSq5TNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab7bb257bbso1398995b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525209; x=1789130009;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T69ANzvMxolJj/DakBGbr4NVyd2eSL1A3t9J3mxa49Q=;
        b=bnQ52/n0PR4RC0vVboqDssgUIxAq3R+diwZevEB+LNAifjrpHxctMIO1dNCdUvm9+J
         CgvizLY1hUX8eMnbx51mj9KSqzyU2OKmC4mFGvuMgVVZcHxWXRKLkPM96VSbpQX8cMWK
         u4QfuR4/9QbmLhF2CqbNuaRvqRbk2PNGidmmKZD9d4LCz01pGExyScePerVtG2AAb0pb
         2UGuRxU4FEHeHBVEX/NgRrDsIzZTAL/QZxvC21r9hGIGq8dFUbpnACV3Rx7i08Apj8eT
         G9sZaO6seZp08Ob/iTkVchR7B6Z/q2vEQxAR/+G2YAe1nMaXogcMgX2RpUQcKII+8sht
         Q+7g==
X-Gm-Message-State: AFuF++nfPdwbq/3R5PFm4v7dAlZkW47n8W212bwu5QBU2gtGA5mRKO3k
	SoOaV8S66zdJWJtkX+lxMxBXoHP99ROd2QZroEPmRVVBnf7Aay5KJN6GZM1hpplCBCWBGFXAEif
	82JQ6O+K0fg5TDvPGMawRhx56o0jjox2zpIw6pPCcIXtlhS+C74mjFZmc+ko=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3102:b0:6b2:f445:af17 with SMTP id
 006d021491bc7-6b6fc7d2b9cmr4277301eaf.26.1788525209203; Fri, 04 Sep 2026
 05:33:29 -0700 (PDT)
Date: Fri, 04 Sep 2026 05:33:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9aba99.efa90033.8a9e.0003.GAE@google.com>
Subject: [syzbot] Monthly usb report (Sep 2026)
From: syzbot <syzbot+listeb24060e7e1069a778b6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 39 new issues were detected and 5 were fixed.
In total, 123 issues are still open and 446 have already been fixed.
There are also 51 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7512    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  3461    Yes   INFO: trying to register non-static key in __vb2_queue_cancel
                   https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
<3>  2802    Yes   WARNING in usb_stor_msg_common/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=73c662df6e55838c6ac6
<4>  2713    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<5>  1833    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<6>  1157    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<7>  999     Yes   INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<8>  722     Yes   general protection fault in f_midi2_free_ep_reqs
                   https://syzkaller.appspot.com/bug?extid=01a17afb30637396955e
<9>  674     Yes   WARNING in usb_ep_enable
                   https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
<10> 494     No    KASAN: global-out-of-bounds Read in usb_copy_descriptors
                   https://syzkaller.appspot.com/bug?extid=debc5c305403f180c01c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

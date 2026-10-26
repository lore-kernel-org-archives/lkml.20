Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046824;
	b=S1mAZhVpnf625oK3bJTR5bntVz+VAwIYO11rdy7HQShBpwOP+9RJADobOmM4C4YZXBF9
	 LBfrdCXWmagf5b5+hWLNncgPGay0EvAxCam0+F5WMCm5T2HOpd0LXTXjaJ50Y4MAzHuQx
	 i+zXyV6Bmv5Wf5cKqA8GB9N+P6AcppmNQZbCaeOOPkI5Jn/jrckQt6epgaNuyeC3ED1Zn
	 Qrl8bruA0d7Py1gfBTkbN0Pa57NoBRd09TDIQT+kYGZQUdvByiz/6woEA/W2gQAuyYeww
	 JYJpVEAj9/Q2DVhuz1rQ+CIKowKAUyOxNen/NuMXEdrJLxEEceiOJVZBATL1fLW5vPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=h7Aq+vqPvdElieptV/YoncWuNTXZ1m+hINrzzecmweY=;
	b=S91VKiCitm9xhjUa/BnLiPeK12/G4+wHRryPfhnCU2QW/XBZXD3w7+UEB/sZwdfy/phv
	 meAxKeK0+CKknn2vTm6hUxjoEbPZZCIkNpENAj84q78mYnItxYKtXmL/alv05+U4AuyMi
	 j4+1y+CKO5/+88kDqw70ODTWtK3hPiOwatY4pYMOTZZ6zOPoXNXlCFfIMX4uSVRLR/FOE
	 aSS2p1so7otUs4cTRjq7zG3hvLLwa+Z6t/PDdzIiMJR5C2AnccKfENUIIlawxAb4mG57G
	 teysUUWtIeDFx2dthXs8eAYCKqgSJiSMGTzCExF7aoYtKdAg/SqYSZp1VmG5jkSYfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACD606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03ACD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so4537661fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046823; x=1793651623;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7Aq+vqPvdElieptV/YoncWuNTXZ1m+hINrzzecmweY=;
        b=WStnYQpbqNDAJX0gbacFbgHMda141qNdg9MIgZLmFtwl/H9j/EwZpZyCi0Q7UDd4y3
         8PTwoTAoe/kS6QiaxQLSPm7FJVzL21vXaoRdKe5AR5MrhdsVrFw4io9KZx/wQq6cIdfT
         wBkTqr+z8N1sSSwCOo1T/zI4/zL7YpHVAALPSIv3zNWKCpHD8OUcGJrWDYB6wtlXWE0+
         5EkzB17LtRSH1opDeBNPbNn31AyuOMGy5mZJtxi0dp/S7Ywng8aTX9DWlzkxBbwm3/+f
         m56s0Bz4MBf1NRTlS5gH8FZM4kX9UZ1dxOs/nX/KZ8Xun1O2WchDjcllWIufO2HQ2RaC
         9jvw==
X-Forwarded-Encrypted: i=1; AKwUvBzgns0gql+i7UJGjG1yqQ+uzs+yCUTAfcYob2ivM47h8FkVnfgE2sMuHTgDHW8Uai8NwZMG49FiP7I09YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDzGOKeuRVy+G1OAwF8ye5DhPx41bacnpKj4dVKUP77a0mQ4qn
	VdqV4Kp5Lfxs5WEOPOAd7LGbMstuSbWoJqwLqcJRMbBZ91BQ/hCb62toJY/wvPkCxGyU9L8f4W6
	gPkwdqXkec5KOMr4IpSzsIshwZ3LQYRrVLFFIyurHgMlaGYz1IYKAAz6boeY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a4:b0:4ab:230c:5faa with SMTP id
 5614622812f47-55c002622e3mr4970843b6e.18.1793046823037; Mon, 26 Oct 2026
 13:33:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfb927.3a3d6196.2ecadf.001f.GAE@google.com>
Subject: [syzbot] Monthly driver-core report (Oct 2026)
From: syzbot <syzbot+list3acbd9912bd634558b43@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello driver-core maintainers/developers,

This is a 31-day syzbot report for the driver-core subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/driver-core

During the period, 1 new issues were detected and 1 were fixed.
In total, 26 issues are still open and 4 have already been fixed.
There are also 14 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  137     Yes   KASAN: slab-use-after-free Read in disable_device
                   https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
<2>  91      No    INFO: task hung in usb_disable_device (2)
                   https://syzkaller.appspot.com/bug?extid=5cf28d3643d94bfb0821
<3>  35      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                   https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<4>  22      Yes   KASAN: global-out-of-bounds Read in uevent_store
                   https://syzkaller.appspot.com/bug?extid=d164947c037324221043
<5>  18      Yes   general protection fault in bus_remove_device
                   https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
<6>  11      Yes   INFO: task hung in unbind_store
                   https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
<7>  4       Yes   BUG: unable to handle kernel paging request in usb_driver_release_interface
                   https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
<8>  14      Yes   KASAN: global-out-of-bounds Read in bus_uevent_store
                   https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
<9>  8       Yes   KASAN: slab-use-after-free Write in do_bad_area
                   https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
<10> 7       No    KASAN: slab-use-after-free Read in remove_one_compat_dev
                   https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046824;
	b=VMj2s9kr8HPFlET1Nyv0aMAmH1GC3BRFfNsMrGlyJAYIWpAomc0SVqHmo7S4pepPXHgw
	 Vo2W14MHvd8EprKqasXjQIjOVVvucW4bN21vaffpToQnl1y0T4O8NWbS/dbrQ32b9JO51
	 4HHYw9SKe420SnRzD/mGBPv/QMZ72fo7C/RTHO9RelntRtfaQk5d/MgxXJOTXGwqbvxqF
	 iW3g1bTNhhtlC8Vr9xXDhKQQEdPcsaR12sl59LtPNsz94gZvjWjQ84JMd40HA5zETRvHd
	 xTZanNt9OxuUCkxn1ypLuUtyj4ANAcvPyEZxFAUzeftJzvsBHtxnHncytL3RUlWNPtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=5hqDsNbv3APBSI4mRAAUP+dBuR9Qlkm6bCI1usHEYVg=;
	b=S+NLQmNjkK6w8x68MhWsVoHR1cggoIviHHypVpxBYihQ7y2uZZzz65I+l71YRvo4ilME
	 ooWOP6AY0KEI6HWqqxzASgbqndT24i1fgIl+5H09+xyB6n6sSVVV46Y8FLd6uZWC0Gam5
	 oJ15Jed/AjARx9RYCSh4j2qVrfIx0dg1DOgoAd7/JUeyoLeN+8Fn2b1UF5UU7S6CccYwP
	 xLCYH+RAYcAtGkSykJbnd9aP9Z47nsVGaIlxVF9oVbbCCAqOrSHD3osZmsUJ6n1T9Xs3o
	 CU/CSM4ozHOADKychdR/XF469zvGlG0TqCRJI371/Pc3UNTl689VKsxkKclHyMpr0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210C606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7210C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-844bc76180bso3350200a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046823; x=1793651623;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hqDsNbv3APBSI4mRAAUP+dBuR9Qlkm6bCI1usHEYVg=;
        b=Vj+RI5nhD2OiGyDRsH8ZHSzZ15bBrL96w75zPrdpQg3PjVemWQ3iMysnlKIgSQKEN+
         FldApsqDCeVNGMv82rDCMQ4Kp4RK9DUOVhD3jqQMuHtNiNofmX6Sk85TQG0GuIiqhlkE
         tsWtMK/HGS3ez7kOo45L2zYzLkOQSA9H+VHcaI3lWvFAMT3B7ajX4h456YhkoAODAYLr
         pHaEc++IDqbycRfzJzGDSSXcVFkL4Mkn09goi77ElIO+YH1siGtRJxBNXtrJxL0SBHKt
         B06ueb5uaIWjssmWxlAWLsHtPUOUCMQG1+rUty0teoYThOtuUDQSadMOjSEvGTNuzoiL
         NyLA==
X-Gm-Message-State: AFq9FYJdpRBzCkSDwCSj3RgFcQbSTdt+3C4s0yDe2E7MjcfmI0gu0usf
	YvNz2WLwFQjtjBhNkGaOeEHnE2PTX1D7ggUw73m1l0/Y1/VfsQViyUJY/AwhitBDozBZAESuKAr
	kT5tvG6ib1F2Q0whPPTP352I1+00VylvWmLOsa3ajuWcqD+dVjtJHrIU80UU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1786:b0:4c2:5ac:7f9e with SMTP id
 5614622812f47-55c00384e83mr6236870b6e.43.1793046823564; Mon, 26 Oct 2026
 13:33:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfb927.3a3d6196.2ecadf.0021.GAE@google.com>
Subject: [syzbot] Monthly mm report (Oct 2026)
From: syzbot <syzbot+list72238feb199a0257ca76@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 4 new issues were detected and 0 were fixed.
In total, 79 issues are still open and 386 have already been fixed.
There are also 37 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  45812   Yes   KASAN: use-after-free Read in copy_folio_from_iter_atomic (2)
                   https://syzkaller.appspot.com/bug?extid=6cc93ec9a4035badb85f
<2>  4126    Yes   WARNING in trace_suspend_resume
                   https://syzkaller.appspot.com/bug?extid=99d4fec338b62b703891
<3>  648     Yes   INFO: rcu detected stall in sys_newfstatat (4)
                   https://syzkaller.appspot.com/bug?extid=1c02a56102605204445c
<4>  536     Yes   kernel BUG in filemap_unaccount_folio
                   https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
<5>  444     Yes   WARNING in ext4_mb_load_buddy_gfp
                   https://syzkaller.appspot.com/bug?extid=fd3f70a4509fca8c265d
<6>  361     No    kernel BUG in __page_table_check_zero (3)
                   https://syzkaller.appspot.com/bug?extid=2b5fe617654be3d8848b
<7>  324     Yes   kernel panic: System is deadlocked on memory (2)
                   https://syzkaller.appspot.com/bug?extid=c61d6962d0b7e698439e
<8>  189     Yes   INFO: rcu detected stall in sys_unshare (9)
                   https://syzkaller.appspot.com/bug?extid=872bccd9a68c6ba47718
<9>  126     Yes   INFO: rcu detected stall in dentry_kill
                   https://syzkaller.appspot.com/bug?extid=0635dc2e2c3c21a6aa04
<10> 124     Yes   INFO: rcu detected stall in sys_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=6e61d59e9d2150c8492b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

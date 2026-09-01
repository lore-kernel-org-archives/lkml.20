Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B64746A6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294823; cv=none; b=DVDvtb1mDsXWBSydrqB/6KK08querwDUpFP46OX22kruY0zfvdpYPIj4/u1xY+u340iK+W2UxXVGK61Gtf6R+uoancHGofEthLMEJ+eTUe0zv8FXKefXpEw2lN1JAwa9Hj5reFn87WhKnZu6llKIZ007MGU1z11Cyzij5N6OJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294823; c=relaxed/simple;
	bh=oyZYl9MQ0GluBPsgfa4OVS8Mfkb5JX4A/AK+ieJ9ZRI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mIusRy4AYU/zZT3loy7PWIpZqUpVXRwEgwiNkQBC4XWT09j5u9uEFaN5MwwG2SPduKgN8QMt3D6ftd+4yU8RviMh0MaBNCGvGX3yc9lPDjzT211yQDGNbDL22VUt2DFK/d7nmg7YnKSBko8Sr+bVKqDQgjcKy5nV7AHzkc7dbvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28deb7ee3so381590b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294821; x=1788899621;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3I+bTSA/CeCOeSpygGOdoVt5Vie1ImeZql69enoaeU=;
        b=CtsUqEa0ArPSTuD+OWyGechqcUXnTjdBErrf16CaC9VWQ6Ojiv7RChm3NXve9ixeSn
         MLSvENkE+z4QbgscVDl9Sm3Qrv5Fe8P/mW9jOZsr/vRl3b+/K6CbRrLOmGNxCIpoUX4B
         oCwQEVlM5QxLM96z9G78+mNa2V+H9P4eZakXJkj1MhNFb7dUatWzMuPBUlv/R1Zwus9q
         q4i0F21oq0aI2aB7EVggkgnR2AE/syEyya10ABQl5bm3qdtffrdpgPJn5+wDGxcocuEH
         VIBWo9MZ/BQ4Vg7oQhyt6z0Lc2DBNuqwmW/TQVsZBxn5VTpDSA1H7Y8+/ckoHCYEu+V7
         NQVA==
X-Forwarded-Encrypted: i=1; AHgh+RoBrP23By3TjUi+02t5OWLhp3L5BRzQs2mmxet9GvxH/u5MMuuaX2B3ogDY49FTzY1r5cASO9xgf2ZgmdA=@vger.kernel.org
X-Gm-Message-State: AFuF++nihYWfAHYQrGc31lLpwBEEh96MF8EoxCVqbigMHwLkU2WaTygi
	fmMUoVc05Td+r9IQ1XbQBQ4f7DxmpKXRkFdDAiyVXcL4cfPcBsEbIkp/y8gC3aF31iD6dg4SKiY
	YnYdD88f50vpJyCy07KwG+3QAS4dv+/TW4lfCL1fbjghsG2kqI8tnU3Yz8Ik=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6902:b0:4a3:3108:866a with SMTP id
 5614622812f47-4b5b8265377mr10846805b6e.17.1788294821575; Tue, 01 Sep 2026
 13:33:41 -0700 (PDT)
Date: Tue, 01 Sep 2026 13:33:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9736a5.e163c37b.143a1.0002.GAE@google.com>
Subject: [syzbot] Monthly netfilter report (Sep 2026)
From: syzbot <syzbot+listf5b787023d22ee928c14@syzkaller.appspotmail.com>
To: fw@strlen.de, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pablo@netfilter.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello netfilter maintainers/developers,

This is a 31-day syzbot report for the netfilter subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/netfilter

During the period, 0 new issues were detected and 1 were fixed.
In total, 12 issues are still open and 199 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 119     Yes   INFO: rcu detected stall in rescuer_thread (2)
                  https://syzkaller.appspot.com/bug?extid=d5f7a5097c24c7c2dbbb
<2> 10      Yes   WARNING in nf_ct_bridge_post
                  https://syzkaller.appspot.com/bug?extid=a8ba738fe2db6b4bb27f
<3> 7       No    KASAN: invalid-free in rcu_free_sheaf
                  https://syzkaller.appspot.com/bug?extid=60332fd095f8bb2946ad
<4> 1977    Yes   INFO: task hung in addrconf_dad_work (5)
                  https://syzkaller.appspot.com/bug?extid=82ccd564344eeaa5427d
<5> 706     Yes   INFO: rcu detected stall in addrconf_rs_timer (6)
                  https://syzkaller.appspot.com/bug?extid=fecf8bd19c1f78edb255
<6> 176     Yes   INFO: rcu detected stall in br_handle_frame (6)
                  https://syzkaller.appspot.com/bug?extid=f8850bc3986562f79619
<7> 148     Yes   INFO: rcu detected stall in NF_HOOK (2)
                  https://syzkaller.appspot.com/bug?extid=34c2df040c6cfa15fdfe
<8> 82      Yes   INFO: task hung in nfnetlink_rcv_msg (5)
                  https://syzkaller.appspot.com/bug?extid=c4b20b80ee6a7a2f5012

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

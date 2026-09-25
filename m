Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66986478E3E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339620; cv=none; b=HBtW54p6yh9UsfmUaIctZS819JdK/b2+yXdipAIp9Zm12DnuAFNpsfJ7Z+C0A01w8Irk1XCiCgQ9j/tnrKKOH97qL55gUSXJDQedAZ4J5KES7nS9wZ86m6GR1p8eCHrJd49dMR61XPgOt43PyP+MLODex6Dj+0m5M4wEwRnQ/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339620; c=relaxed/simple;
	bh=WN3pSoYU9cdvre0ABEdZ7GvzLTz1/2Lz1LP6gItmKp8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WYSI9n0PNLI9LnXIChlVIvJB2SsfzEa1Hnuoclu0OnC2sA49cwC7Z3eqW8JftfChDgBfEFdfUVRpxcQX9oe+rrBQxCzRKmtTpTp/ZLCjCKOaWiIqYH1gOlaF/lLSgQJi9EIeCF4q6/iZ8H7NMTNiGghnjCUnu7hXRZC3VROpwE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b5bfffcc2dso969040b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339618; x=1790944418;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTvJAREw4fBrRmC0o4M4TAzqWax/qhWP2VADM3U9C68=;
        b=oaSEV5Fe23305D1sbB4nDhuV4dxvn8W4aY8147apYxxvQ+HCa/9y+vrHplnrdIQYqx
         ql0t1//k9Pn+Cp/E05EWj4HfAAFShyp0z00QvuuN1imHvN26Qc+aBP76KrQAEY91bDvh
         aNISUiOW7iRhytqD0eoMmorweKav1THxfK1ZdZgCBNegxwb/qOMVwgnKpPqjokLwwjvd
         gYqyKBBm4NrsDuy3Xz+8xgBDBlRABMNN5JVnNjU+rVGTOrpwzbqBo4+wn5jxYLC2QyOG
         PAphWPjSajeK4m5YlrosamqvZGE3fsvuZCoS35Od2HcWz/WMrpnX0bR/7cP47KbxIpAS
         tIoA==
X-Gm-Message-State: AFuF++mCRsBhhwQ0P0wn1DhfGruUVpmnWDed+zp1w8IUYLiyzpRLQbag
	upSu3nVNMgz9oBIutQJbYNMYDdSbyX9cDhkwYrUE/9UdalpIwRB+IeELocTUXgNJNNvZifmnpIf
	g5UQYwR4A8afS94pD0lSAt1sPp4RYtih1S2UIkizJZuum3Nq0djVky9Vqavs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:124e:b0:4d6:9133:cfea with SMTP id
 5614622812f47-4d72d15df51mr4330904b6e.47.1790339618397; Fri, 25 Sep 2026
 05:33:38 -0700 (PDT)
Date: Fri, 25 Sep 2026 05:33:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab66a22.80e1c6cc.1e8e5f.0032.GAE@google.com>
Subject: [syzbot] Monthly net report (Sep 2026)
From: syzbot <syzbot+list9d8ba8e7238408167f9d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 7 new issues were detected and 15 were fixed.
In total, 56 issues are still open and 1793 have already been fixed.
There are also 30 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  816     Yes   INFO: task hung in tun_chr_close (5)
                   https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
<2>  641     Yes   WARNING in inet_sock_destruct (6)
                   https://syzkaller.appspot.com/bug?extid=5b3b7e51dda1be027b7a
<3>  509     No    possible deadlock in __ipv6_dev_mc_inc
                   https://syzkaller.appspot.com/bug?extid=afbcf622635e98bf40d2
<4>  500     Yes   INFO: task hung in nsim_destroy (4)
                   https://syzkaller.appspot.com/bug?extid=8141dcbd23a8f857798a
<5>  126     No    INFO: task hung in rxrpc_destroy_all_calls (4)
                   https://syzkaller.appspot.com/bug?extid=1c21ab751f6531a595d6
<6>  43      Yes   UBSAN: array-index-out-of-bounds in llc_conn_state_process (2)
                   https://syzkaller.appspot.com/bug?extid=628f93722c08dc5aabe0
<7>  2574    Yes   INFO: task hung in addrconf_dad_work (5)
                   https://syzkaller.appspot.com/bug?extid=82ccd564344eeaa5427d
<8>  1209    Yes   INFO: task hung in switchdev_deferred_process_work (3)
                   https://syzkaller.appspot.com/bug?extid=d6bbe0f5705cb8a5aa2b
<9>  676     Yes   INFO: rcu detected stall in tc_modify_qdisc
                   https://syzkaller.appspot.com/bug?extid=9f78d5c664a8c33f4cce
<10> 252     Yes   INFO: rcu detected stall in rtnl_newlink (5)
                   https://syzkaller.appspot.com/bug?extid=2e90866706ad999df132

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

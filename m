Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046824;
	b=WcZ6W6LYjo0mSYelyXQFGHMmKyUGdI4wNv8wD07rODaT7TxHSom5zNWOfkFSNnZRuRW0
	 mTaNiMvYdCFuSUGC2vVNfs3tzRvlI2AqdHAk5AyvXYsPpQDRJLb8wL/tSMdftTgiqw28h
	 ZwMhlEuuvtnOrtJ6clzb83RqTaj5KzHa2qTBqbX3yZPRD1FBcOwVMQRxqw+hp6gZq98SA
	 6jUnOeX4KGaMnqN1jgygsaaBmteykQm5t3hMUZFK49aS1TZfUCu6+OkPdZG1YWn7YXrVS
	 ORoi82N+JuwI7BxFjxtoGNPNTFMas2ELIT/ofTMv4W7HQMIDLsztLaiAIxHEtZo7sZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=3uByF+XBf20d4oPmX+C+Bemtcg+uCCfvs+3UVHavAY0=;
	b=fOeqJgkwHfsDz28g3uud+gSHdZV0SFtsTD0SjnHz0tj3cuSVO1lWTwSIUlJuOzM4z3pN
	 I5clsRAd1SZHK7OB5gUSSrQSny0I2tHkNO3WUl4yXAtW44bVr18mOwPy9TCBHKPcIw7Rs
	 ECajICSkToHAGhhwHbneq1udPiJKfD+BGriqo8RNmDaUAcxXC3HeHWrLXyJXc/zVepa/A
	 BORjVHnhaGF7xgMPXsbjn2AiNWeXOfDJte6Cbgd6+Cl9+MsXN3XXNeYKLHyj2JcGB1M+u
	 riwI5+Fj5xa4J4GouJNarMhQGhaP+I9S1uGKs96lEasjW2AJazSe1qG6urkNMvZWDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E3606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f9b643ae53so3056631b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046824; x=1793651624;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uByF+XBf20d4oPmX+C+Bemtcg+uCCfvs+3UVHavAY0=;
        b=iHlnIRqiexZNkzpBZgr6Si3yfWcTHgsnxWWh+iqaNOI93Qxm38v9nk3/T7I+scUR3a
         rH5MonMLI0bYitgou6zZJJO7VsZ5xRV4+uYQuZ1QGboK18yVzUzqc5KyLLbViCfUnOXD
         DXkeCSuZVqQBQn/t/qmkgysbmb0RjxUCBuUesyx4+vvCrkWANvIPBjlJ80WadR250FZU
         soWbQyqy/U60bgHvxhRR324r0smS8w1G79sOLVzig5XN75CMKUIqp/6YMnB8xrWsr6ye
         ighQyXKnakUaIwldNjf8P9OjQu1RLfr5AsvA8GHS1W0Z2HVTjc4z+2vI5MjaZeSFpMa1
         rhVg==
X-Gm-Message-State: AFq9FYLt0MOf52kJan6TVRLjwdCMUrTJr9yjyQ7AIiOJaiq9uV8n6+b7
	gcIprFMYrfYLryGX5PScue7UU0c3pejW/4YmWEQIuqEk9tdwdt7CSDyhyAaYaIs3rPOAPWApW3d
	zK6A6T3jkVx99IXXMx/4x7IgABTODqqchgWRrfaNrHdWrWFEmchQeBIixsGs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:48db:b0:55c:844:98b3 with SMTP id
 5614622812f47-55c08449eecmr3673448b6e.50.1793046823825; Mon, 26 Oct 2026
 13:33:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfb927.3a3d6196.2ecadf.0022.GAE@google.com>
Subject: [syzbot] Monthly net report (Oct 2026)
From: syzbot <syzbot+list402b67683d6a416b29ea@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 7 new issues were detected and 6 were fixed.
In total, 58 issues are still open and 1801 have already been fixed.
There are also 34 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1034    No    INFO: task hung in netdev_run_todo (4)
                   https://syzkaller.appspot.com/bug?extid=894cca71fa925aabfdb2
<2>  917     Yes   INFO: task hung in tun_chr_close (5)
                   https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
<3>  644     Yes   WARNING in inet_sock_destruct (6)
                   https://syzkaller.appspot.com/bug?extid=5b3b7e51dda1be027b7a
<4>  554     Yes   INFO: task hung in nsim_destroy (4)
                   https://syzkaller.appspot.com/bug?extid=8141dcbd23a8f857798a
<5>  520     No    possible deadlock in __ipv6_dev_mc_inc
                   https://syzkaller.appspot.com/bug?extid=afbcf622635e98bf40d2
<6>  203     Yes   BUG: Bad page state in skb_pp_cow_data
                   https://syzkaller.appspot.com/bug?extid=ff145014d6b0ce64a173
<7>  45      Yes   UBSAN: array-index-out-of-bounds in llc_conn_state_process (2)
                   https://syzkaller.appspot.com/bug?extid=628f93722c08dc5aabe0
<8>  40      Yes   WARNING: suspicious RCU usage in phy_detach
                   https://syzkaller.appspot.com/bug?extid=694b49f41098a5df4fd7
<9>  29      Yes   WARNING in dev_shutdown (7)
                   https://syzkaller.appspot.com/bug?extid=c9ecf60a8adb7629821e
<10> 25      Yes   INFO: task hung in inet6_rtm_deladdr (3)
                   https://syzkaller.appspot.com/bug?extid=55141a0ffa0d17f01c71

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795624;
	b=bg7LJ4HkmDEJJ1ePU+dJ5klDZAUjkYZ5IJLvEtVEjrLpaDsLwyd44H52DPPoxgKDXewL
	 NcqiWk7ZH1mph+/5HFEUPnLWEXm+A13ZwNv5BYA93T7L6ckFse+xX5/R+OAyckKlrv/NC
	 RCvx7TBAB0Gc2gdHFtPmq7HOTAp7alU5i44v0Th3kZ5pOfV1fmNJv6QqVzAeH0SJkgQfV
	 qvxpilQa/BdSqXKmCEfegh1OvGLE6UIATaHMN1Wxj7p/RfDWiL6RM+BGMLp9wb7So+UpT
	 /oUya7nbVdKt4w6ji2ULx97VnRit2NTkCven6tcejb+PCMQ4NNSk16oOo8QjcnRPNKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=9AR0FOiJM2KreFj6NgsWrS5suCUEQHylQP6yJIgXQu8=;
	b=1qq8aThf79UmbGsFaTxV9YDlbuW5qQb+zQ95G7JOYDpxWVXXWakF88/zVSXHSuYiUzsK
	 wxEwM7N+BkhCQNJFKJCZEsL/ZPtnZZwASnjU2tKYvaf9APGAfq1PJFCSQyftGT7Zo9YPH
	 XLyP+16lXgsv7gtAR4IFJSQ+OLIoQ7PR9tXgAqk5hzsDb9F6/mqJODMJWPu7GesUT9X0A
	 xnX0hfkI+Omj6jf8IYsbY2OhRjXp+wlFSli+fbgGiOPnUBBmDJ25lfVPeYU8SvOh7KND4
	 iQhlybETDbLN7HRsdQpKhOelVp6clieN6knrq/aqsoeuk30OjbVxOJ59Y83RZi6WzFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9F606D806
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B9F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so931880b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795623; x=1794400423;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AR0FOiJM2KreFj6NgsWrS5suCUEQHylQP6yJIgXQu8=;
        b=ZBnFJUDy1nInliAE+5Lqr21CCDJiqexbBxiSRY37qEa0EqdwpDCU5ujRjsBXtq8X1g
         AgZtTSbJjHB4zBncSP0yysSGERhwhZ9UH22aKbjZyiKfr4MHsF5G6+KDZk3NWLPWNdlv
         I4v5XluQ56xDy5yescLrVpzRCKEW9tK8tbVVPiFgqxPaH05TRG9E05n+O/eTwsrPVPdZ
         8ILgrCyBDLUGMwCPm5Y3B2mBxXHQBsgKJMy3Webc1+qK6agBhhHJVMLgmuyGkv3zSckt
         wS6S4jUWyWeAGhD7rekuScbckoSVbGzXdV46OgXt9VMfJo4oyvASe4IMTNOblO9/5Z/7
         +7Bg==
X-Gm-Message-State: APuU4Z/I8+iT2s6tdTiwnjt/VCKxiGlGpYR6ZmLiTd7xrxE6nxz8ffXy
	GzKmpl9eCbGnpF0qMPwVLNnyXLbSc1c6XRU/PPTK39vIAqnUTcyEqPwW0yD6Eq+O06BVq8nzaGX
	yoPDX6nwnt9i6lF2Oj4JCayWiEofByK+rQloIToqOdXCiAuiFwR4Z50Qr0MQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2218:b0:53c:2a2e:8650 with SMTP id
 5614622812f47-5640df72f37mr10852091b6e.34.1793795623537; Wed, 04 Nov 2026
 04:33:43 -0800 (PST)
Date: Wed, 04 Nov 2026 04:33:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb2627.92bb9006.66ae5.0001.GAE@google.com>
Subject: [syzbot] Monthly mmc report (Nov 2026)
From: syzbot <syzbot+listf70463e198a0b7fdf0d0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, ulfh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello mmc maintainers/developers,

This is a 31-day syzbot report for the mmc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mmc

During the period, 1 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 1 has already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1156    No    INFO: task hung in mmc_stop_host
                   https://syzkaller.appspot.com/bug?extid=d0688023306aea3aefdc
<2>  675     Yes   KASAN: slab-use-after-free Read in rtsx_usb_ms_handle_req
                   https://syzkaller.appspot.com/bug?extid=3ee5da0319ca17ef1f4e
<3>  515     No    INFO: task hung in sdio_reset
                   https://syzkaller.appspot.com/bug?extid=e8678cd3d8b65d1f2c74
<4>  496     No    WARNING: suspicious RCU usage in cancel_delayed_work_sync
                   https://syzkaller.appspot.com/bug?extid=9c1988bc953fca2086a3
<5>  252     No    INFO: task hung in mmc_go_idle
                   https://syzkaller.appspot.com/bug?extid=bb55e8118af00556efa2
<6>  110     Yes   WARNING: ODEBUG bug in vub300_disconnect
                   https://syzkaller.appspot.com/bug?extid=f4a0159ce6802a0a4774
<7>  109     No    INFO: task hung in mmc_send_if_cond_pcie
                   https://syzkaller.appspot.com/bug?extid=30341f17551668478919
<8>  99      No    INFO: task hung in mmc_send_io_op_cond
                   https://syzkaller.appspot.com/bug?extid=15adedb55f72fa957b00
<9>  96      No    INFO: task hung in mmc_io_rw_direct_host
                   https://syzkaller.appspot.com/bug?extid=fd993974345f022e97f2
<10> 50      No    INFO: task hung in mmc_app_cmd
                   https://syzkaller.appspot.com/bug?extid=c6d8091b47243f2023b8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

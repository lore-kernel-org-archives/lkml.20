Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026021;
	b=B8h1BN1Lhd1cUjiub3Lq6PL03zao8QQkuLDCTliC1lWMdOfcCwkladAjTFpxld/Kk3Le
	 toXNJutn34umDfJ96R3f4IqkVaeBTuRpwxMVZrCurKEknuG06Q5wT4pEB1X0P1yvIF51Q
	 mbjfxNlalvaufuz3RQUKlpl3o6DtOxZFYZNCNJswsINMcngKbSTH6lXSDfflM9SUSq8cV
	 EBZPRPaiHSI2GDlLUYT4szFhNSJuWImt0qhLFoAl+wgwQR3W9hxfuk2iwnMxcOyS8IdaT
	 egvdLNRFs/LL2eCEkJ4rrF1e7YGwNGroRP12MrZ8mzZaNSeyRVCMM0sRGd/zefGlOaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=7NFle5EcCexVV6wXsp0CMRBUK7BzcYXOnIxO69P4PHU=;
	b=41Lb7kdGlXr1QF6aWeuIR8jE6KOk3eT+PG8bx0sYdzPMnE6cyw8HV+AF4k1DaL7TbiEQ
	 SueahAkrr7V8ad54iTRtKZ5oi4rb9+VcUzPiWtVsDLGhWoGa52O6rViJeX+YCiGQgFuDc
	 +Ge4fiZEixDDiveFafaE3Nt8MwODn/1EPI4adX3V735wFm3yDrndUgsZFyC65HScMtEHQ
	 M91/kzML54Ep6x7xuVFaARL77MV2dTVt+f27ysHCVybyfK1yCluVBQKutQb41Tg8sQLA6
	 hLLpymuvCia25++xyycd4N6s5dj9a+LrpF88mW2teUtvvAROLT7WU0EIlvwsi7C6ctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77849606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77849606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1928924b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026020; x=1794630820;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NFle5EcCexVV6wXsp0CMRBUK7BzcYXOnIxO69P4PHU=;
        b=Cs1B7fjvpqX2gphk+fsGCj2rAqsc2RXMiX2/aIo8KAxPcuF8THMOxqft9FGHFF3j6e
         1pZWB2xLVKNty89k07R2cVcIBCD97BelxwQEoPBRLwAo2O8N82QdZU0HF7QSB1eCa8M/
         wc7fUC25/ap8K13+48vSffkbRjr7uqG35SgJB7JXJykSuiB4FB3KT2j3PPs7HCDLYN0b
         lhqNraQI62c8zMmNJ0itm0KkVWVGrICtFfAXuiBU4oo2Brp6kW1RhmsA9aPa71CBYN1Y
         Wf5lKdDoSsVZ10zZr3r7hBPko1eHvYtvD66og9TZ3AU4d+pbIltrrQzNdb49vhRGiK8P
         hFiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoYBdOShpWUgKs92QwBCbHYgiFo2zMypebykT4kMAdZoFtIsRU9qdgn1pkqAeu12i+h7XCCwygyq7niNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7xBrM3p6yrb2Izhloymfcpsuqx7q+yZKryVwbFNYurNg1Lrm6
	3epdh3K7vCqXlImelZIVkYcirP8GXSA5tnMj8vibrNB++7jQZRoxmbB21/v2FFMqgqFGcEhMUvP
	XYdhnNcYxIRUX/rUAQh8ZiJn6SABFgcUqoDWGHwLDE0gUJc8dOgUzCyd/TdQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b0a:b0:4ec:4c7e:37b5 with SMTP id
 5614622812f47-567e154cc49mr3455968b6e.29.1794026020468; Fri, 06 Nov 2026
 20:33:40 -0800 (PST)
Date: Fri, 06 Nov 2026 20:33:40 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeeaa24.1da6ca5c.10a313.0000.GAE@google.com>
Subject: [syzbot] Monthly block report (Nov 2026)
From: syzbot <syzbot+list1913a7ecb8f6c20c529b@syzkaller.appspotmail.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello block maintainers/developers,

This is a 31-day syzbot report for the block subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/block

During the period, 1 new issues were detected and 2 were fixed.
In total, 30 issues are still open and 124 have already been fixed.
There are also 34 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4342    No    general protection fault in lo_rw_aio
                   https://syzkaller.appspot.com/bug?extid=cd8a9a308e879a4e2c28
<2>  2419    Yes   possible deadlock in blkg_conf_prep
                   https://syzkaller.appspot.com/bug?extid=144a1c0e22e53a08ef5a
<3>  1749    Yes   INFO: task hung in blkdev_fallocate
                   https://syzkaller.appspot.com/bug?extid=39b75c02b8be0a061bfc
<4>  323     Yes   INFO: task hung in __rq_qos_throttle (2)
                   https://syzkaller.appspot.com/bug?extid=53706c567afab5131044
<5>  219     Yes   general protection fault in rtlock_slowlock_locked
                   https://syzkaller.appspot.com/bug?extid=08df3e4c9b304b37cb04
<6>  69      Yes   BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
                   https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
<7>  34      No    WARNING in blk_mq_dispatch_rq_list
                   https://syzkaller.appspot.com/bug?extid=49b69d460fb5134ee1d7
<8>  31      Yes   BUG: corrupted list in blk_mq_request_bypass_insert
                   https://syzkaller.appspot.com/bug?extid=f4353e96f7004ae5a09e
<9>  5       Yes   WARNING: lock held when returning to user space in blk_throtl_init
                   https://syzkaller.appspot.com/bug?extid=1eb53c83ab8b0a0302a6
<10> 3348    Yes   WARNING in blk_mq_free_tag_set
                   https://syzkaller.appspot.com/bug?extid=02b37e31e64ea5cb6d29

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

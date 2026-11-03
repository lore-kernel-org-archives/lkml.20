Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709212;
	b=NOwSCYUjGGNdiPkvSJJKopuLJV8vg7xj0Go/aoEavrnTuvsCo+tSPG2TmgWyXkjGEyqe
	 vsvkkPQCYTm4bKzEfSGX6/cWSqlHD7R/UIBmW8l2Re0tVRUhV4SS0yfT0+WwRVuSOa/NS
	 JAr+A7FGnlhY5hfPeHdrrRQcRWdJViOOBFbuuIRLk/4rC39i+Qj6MmJTpMhHd+EQCD2ac
	 xTDdlV+LCoKfkHdkVNoGPlxN2M3OGeLmxMcC75QicgqUUGbWqZaHrJLwjKP/Yu3cQDDwO
	 KMzJZ+VaHSSZdsC144SXJaD6tdMqjhNcHKnoVghIMRvblohrRP8egZAXBZb0Sq4juPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=oXMJpEB1SAlRxcq+SoC4OVx2mtps+6gke2HzvVwNibI=;
	b=aE/F31gZdSAnvX/nhcyzBSc90KfpY6G/h2KqPSp9Yz2bLiKOad3a/jflJDOoZ5ivN+QT
	 fg51XjyyzZkxV9qYCopb2u+N+TVP0OS0yxCopJ0U1LEEnSX2E6UVkd0f1NnzWJK+HHVJh
	 7YbrVajgVnJNTxkntn1ibn4aTaL7b4ofK7gEqxQr2ZN+0sRw7FgHCYGuFmw22KzQWqBkt
	 wtkFO+z8vn+HJRCS6+gcae1YdKAAywn8R/o2Z/SWbMcihXgSJKePnaFAz75uTRTvhlNP5
	 i0mTFpSd82hz5U67OsPrgdQymiU0oS4iH7M2znGYnrwne77kDMlDkn1E7StN2jgtjYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C624606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C624606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so5527776b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709210; x=1794314010;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXMJpEB1SAlRxcq+SoC4OVx2mtps+6gke2HzvVwNibI=;
        b=ryz/DHoT9kgneatdxp8LABWYs1c1L1+HlLtatzhtrqroTQDBpSHU5rEYsumLBFec5c
         59e9l7wOUHT+cNgpeWGRhaeAvExqhE2zKY6B0TprKg3zipYf2iOV/5j0/HKW9Rbs6oiP
         5P7lY4yHX2PJfAWC24Li6cW00D8fDo5f1dsoCMJaqq0P6uapngcixdYitRxnTB5oJa7H
         NNMM34Dfg4TuDHaKiljz6iLnMR5iXxy5O0aWAtDCJizOsUmhfwBf52u9pwVYjzzP5FRf
         /5tFYm5/+UPG6na310bwFxaIPPgbWtZTIJS1G5MN008FlXgTd1zbH3AZJpRES23vr6UM
         WQ6A==
X-Gm-Message-State: APuU4Z84brWVjgbDuGGz234rqQaQJ+HrrxuOP5e6zq4VFt1I9bt4EsYc
	eHj8urfbRa1Qv2yYLeEsWTCfATS4UhlXP80X98/GfcHMp2u3GfLFIqFMQUAgGk5bboJa0ck4z6Q
	/iIjb49lvssmGpHet+gRLBJ/Q8Mq/9PJujwE6t5CZ4/JLZ/P7LYUuk7/00Yo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b2a:b0:4b3:7549:d3c0 with SMTP id
 5614622812f47-5640ddb5e3emr8203490b6e.18.1793709210654; Tue, 03 Nov 2026
 04:33:30 -0800 (PST)
Date: Tue, 03 Nov 2026 04:33:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae9d49a.26d36f6c.15fe18.0009.GAE@google.com>
Subject: [syzbot] Monthly raid report (Nov 2026)
From: syzbot <syzbot+listb80138072a82b574f50f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"

Hello raid maintainers/developers,

This is a 31-day syzbot report for the raid subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/raid

During the period, 0 new issues were detected and 1 were fixed.
In total, 3 issues are still open and 11 have already been fixed.
There are also 4 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 43      Yes   BUG: unable to handle kernel paging request in free_conf
                  https://syzkaller.appspot.com/bug?extid=270624bb31d478afe62e
<2> 29      Yes   general protection fault in md_handle_request
                  https://syzkaller.appspot.com/bug?extid=89a9ab2a134d092fffae
<3> 21      Yes   UBSAN: array-index-out-of-bounds in super_90_sync
                  https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

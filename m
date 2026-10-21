Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586026;
	b=1OBc/XW2wekuXFXbdoHaS22DFGaYAwcMYd6RduWDLtGPSq07rHxGbPdIhFYL7xbOH8sL
	 eVPiDAokw+wzAc6G6jUFJnfrnun7x8OHDdOF8KKNB+jdPzFHUmxPaayDLfP8ROR3tNw4+
	 TXGkioDP5NdcVwGVoehnfgfsmvR2YlKuNO6s4xaoiGt6ZWStDW5GvvD7jIN6XjcDBBzT8
	 0rNEQd9Tq30DcTr8g9iQ37+2lZkPBTrKRig6RAjvNEQeEBN9lL37emnBME6z+2NFNTU3v
	 B4eAdOCbD/enAK4oI99h9jMjuTBHnYwrdZDM7BMAy+o346uPdEkJ3mA7dL0UvCTCS9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586026;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=g4UAyOiHX3u+Z8VUXBuCR6x3De88Q+2oGF4gxxKpcrc=;
	b=eyh7VxoC1IW2uLXF5AkQUJ4Can77QYDLozND1HM9reJ4KU5hsrHhmMsau+HQz5Ga1/6A
	 x4sO7fzAAvWAoLcXV5f8hr9NaimoUvziZX9Wq5NQ/AvfBOFoZYGTf3aeeOb8wCCvnZDs+
	 vaB/M/fL8Ho5vwetT5jBn2UP0sh1hNeuR2+5ZMbM45eWWGwQsa7q93OrWBKed9Qpek4H2
	 G02I3lWKNEqIUNJ3t2bAndkXgOlQe9GcViJzgVJjxXL0tFneHZxdBN7yOgKEmjmeNMQwk
	 7drpMiblaxDLMv/lo9qHl/hFjL6m2rLT7k4ARuCZaSnTBtGzw/yeGJQa2cl2dzGWZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915F606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6915F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-824cc5f7fcdso980195a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586025; x=1793190825;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4UAyOiHX3u+Z8VUXBuCR6x3De88Q+2oGF4gxxKpcrc=;
        b=HnQJBkhz4oXxrCF8LJetDN4U47bGdgPzBOvrFrcTxsFvKWaE+0zT24HlOBdCq8h10G
         z9WTOjubFe86bNdd4t5/VfXLlYyX3zzEfWRDPiAXZECmckygB8vjEk2amYG4TWrD+ccp
         gtOxXUEHFjRLzjkEl4YD3P1mc1QPlguPIdL7kasovf6d3tmB6jrJINpmCgQXSS3kh6jD
         PCdBtBoZtMeRzNTRmNDtp+E8BOSXG41gkeLz9nnH17R4xa/pMOGk67naXiV2R30Vzx6N
         Uf0xeSq1P1RmP15rqFRae/a7S5gvTmshyiXRh6VM+E170kdklz0HY4ujrrpZxXqoY9oy
         2Ltg==
X-Gm-Message-State: AFq9FYKQocPrDdxVGWyKuxUSMnaCMxM0VwRyoGYfMeVRC62/m3s5NSlX
	OrjkaoaCAfd9zy5x9L9VDIubQpUcsYpKHTjYJagSZ98KJVXXNjw3UWuuHDWdDbDnqzV2svWzYsO
	nyi40QrCwcQI5DaXqkzd+ZlhU3+rBFkrbv3N2PLelLH5i549vlCaF49MyHXM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2507:b0:4c4:8ace:cce8 with SMTP id
 5614622812f47-55350396824mr1164508b6e.8.1792586025405; Wed, 21 Oct 2026
 05:33:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:33:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8b129.a384138e.1e340d.0002.GAE@google.com>
Subject: [syzbot] Monthly pm report (Oct 2026)
From: syzbot <syzbot+listc1584644ec31736acf97@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello pm maintainers/developers,

This is a 31-day syzbot report for the pm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/pm

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 13 have already been fixed.
There are also 6 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 93      Yes   WARNING: ODEBUG bug in trace_suspend_resume (2)
                  https://syzkaller.appspot.com/bug?extid=98850521518b962c5bab
<2> 5       No    BUG: scheduling while atomic in trace_suspend_resume
                  https://syzkaller.appspot.com/bug?extid=3ae5f6fdc78789d76c5d
<3> 112     Yes   KASAN: invalid-access Read in swsusp_save
                  https://syzkaller.appspot.com/bug?extid=461576769f21a04b4bc0

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

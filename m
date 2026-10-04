Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73A32B12C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791088422; cv=none; b=KkYOnXbL0XrW+5KA38p+3JPCxc+ahZ1xHV1YFI/VlmVJvGVCSjcL8stYgCt2dKzTjWdIzf0Fr/+aNPKaK5AjD7cmr9j+onh9jYBY1jQ0qAC4pfv5D9rrQJAyh5NW9TZBl8cF8zW/5p9ZFVPN4zGTAxWafT3isXrfvZcyuRMO+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791088422; c=relaxed/simple;
	bh=1GDbIu7PE2AjKB9yS/1ZXtbOoN8q8/dNL6RxZ3LffCk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rUTHJFLLJM8HEZfGPkQHT6fF9Meeaz4h3fzi6/8liZWZ2QBjebOu6v/khSQTRCuDFU50jm3PuZ1g7V7+JID6wUz2fgD3AS4V4/B7O9oIZ492M2mB90rf8lGSAhNtVy+eIgeZ7nwxgewuuTX0Xza4Ph4UVlr5ENcMB0Zy+Kdp5Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea4c979030so1541912b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791088420; x=1791693220;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKJCTUIEtBlhRM4dNTsrpV8kt9lM1iUiJh0EwaNyx80=;
        b=oTbC4wY43vpVkf/0swmHDCXDAEdvMiT36VCBfhGYHuK/jfxxJDMmQCbnE4VMfI+nIK
         rHkQOXZwbPacQYgdXJYwLug6ejEIJeHnboQVR4cQKWSIm7dUpKzKk81whm76bHIFuk94
         /3SCXxRMzRXnRwFcpyoxIkL0jh+kug7t3Q2dNtJWa64igEiYrNYBke3l5riESM8CA9fu
         3zSLQXPwluKpwDUaI5hb5+SK83+hQVoFjoLiOBjQZvalYvov4nEr/NTIesCnyAnJnvGj
         STjVFg/alZZdYWVVuxjVrkOpnxKBz267FEdGufUA3OvF4yILxDlOPdA2BRXmJMMZu1Z2
         lN7Q==
X-Gm-Message-State: AFuF++nbfUkC0SbKYiGYGYyi6ik8HTwdOq3ejwcebCqlNhqjg0G4WDzz
	xZPNLFoJn+YH/tv8c5ToBK41ug+X1dSniufEthUBYVeIl6HKOlaAkXQFqm/HjVuvX2818iHDJpr
	qoLSgkOGOBDbaZ31yDkHL8q64ZnwB0sW98vBPIfM/jYqV7GtsDJ/MfJ41tDc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0a:b0:4cb:f21c:a79e with SMTP id
 5614622812f47-4f52a77893bmr6779562b6e.38.1791088420438; Sat, 03 Oct 2026
 21:33:40 -0700 (PDT)
Date: Sat, 03 Oct 2026 21:33:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac1d724.34119e79.2f92f3.001c.GAE@google.com>
Subject: [syzbot] Monthly mmc report (Oct 2026)
From: syzbot <syzbot+list47ee4443aeac8f86ebca@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hello mmc maintainers/developers,

This is a 31-day syzbot report for the mmc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mmc

During the period, 2 new issues were detected and 0 were fixed.
In total, 13 issues are still open.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  865     No    INFO: task hung in mmc_stop_host
                   https://syzkaller.appspot.com/bug?extid=d0688023306aea3aefdc
<2>  401     No    INFO: task hung in sdio_reset
                   https://syzkaller.appspot.com/bug?extid=e8678cd3d8b65d1f2c74
<3>  354     No    WARNING: suspicious RCU usage in cancel_delayed_work_sync
                   https://syzkaller.appspot.com/bug?extid=9c1988bc953fca2086a3
<4>  193     No    INFO: task hung in mmc_go_idle
                   https://syzkaller.appspot.com/bug?extid=bb55e8118af00556efa2
<5>  128     No    WARNING: suspicious RCU usage in mmc_free_host
                   https://syzkaller.appspot.com/bug?extid=0d22039ef0915696ad4b
<6>  80      No    INFO: task hung in mmc_io_rw_direct_host
                   https://syzkaller.appspot.com/bug?extid=fd993974345f022e97f2
<7>  69      No    INFO: task hung in mmc_send_if_cond_pcie
                   https://syzkaller.appspot.com/bug?extid=30341f17551668478919
<8>  65      Yes   WARNING: ODEBUG bug in vub300_disconnect
                   https://syzkaller.appspot.com/bug?extid=f4a0159ce6802a0a4774
<9>  63      No    INFO: task hung in mmc_send_io_op_cond
                   https://syzkaller.appspot.com/bug?extid=15adedb55f72fa957b00
<10> 41      No    WARNING in mmc_free_host
                   https://syzkaller.appspot.com/bug?extid=82a0a7de6d84867d030e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

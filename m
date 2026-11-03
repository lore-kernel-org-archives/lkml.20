Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738017;
	b=mxWqW/mkYD+ffGK8ADzqDQL32Q/9A9ibVXrMsefiUOjwDZx+/2U73qCRZCCYcV4RYVOB
	 VqNr+L9CoK3b8iSlxRiAfOHrSWYzMYuh80rexQ0RLrmdtIAl++hGxdd5BJ/QItm82uvo+
	 XbH70FqYPhS78brU1calLKuW9qfQHoXDOcj0wt0wzDkW8LKR+SptX4N6VI5rxwramFekM
	 o+0zR1T/wrDIf61PUiQzK1yQTWYsevrU0KVj9YXHJJSeuOZHAFYuZzA4y7TDlqVSqsa+U
	 4vSRAH5vHT7FRIX4GlJ9Iudp+8zSWRNJNHGf9LPV9Rc0CYBhAglGK1C3qUBOGw7seTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738017;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=OXDc5ezpSoR7IfOkdZK6JrzmX2iAs+aVI0tl0bUgJvc=;
	b=Wyh6gmBd+7+BGom8yYwfDQ0wV+9xExKVwfNyAqKbvVyugJTVTUNBE8IjsfXDlZNLw9xG
	 0SI0E0nH/itamd4w/p5I2wSOS9EKHEW8Y13k0xEWITTNzy7qVYaaRQTZI6pTK/TGNCNVy
	 YMV0HfuDWbUUSfGHrXHARcwnZ2Yzkxv00gQrT3oh3qrbiQm0hyEFASisWsX+5cndIOIpB
	 iettP+UWKA/fNdNv+cxRAx4EQWT1Eh2lZ47/30kPsf+wiguLaXaEqvFZYPG3zXjqI3HBU
	 egt+D7GDR095Axj015mwnSHbiCKSsypIIS89znibCEsQe6NbPdfEZal3tZ0EMA7cjKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28905606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28905606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so19063b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738016; x=1794342816;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXDc5ezpSoR7IfOkdZK6JrzmX2iAs+aVI0tl0bUgJvc=;
        b=VbCfo0tjDXksRnMXnpix561rDwl6qlZ8IsMY+Nk4MgOISEfHmwBeQQh6ao8gjGi9Yg
         K1ZuRbMNB5x4IeBOdN7Ttg1d2OSZGEr1rQ606HxIOf80au1JyeLOqFjchGGDcdvk3LfP
         6Wh5cPwTRLevE/Mv9r/5D9vaOgGY6yJUQB8SdNgN0Gx81aMeTqNSXAiGxCq99yWzDKFr
         pN4BjG+c0AnwOxYlEIKRI6cZuHjQf+ouIB3UqLRgCRgHgLwEUHKfe9qw2EsGfYn4ryBa
         cZ2iIcVuzVme1DhJEJjh0eumjrQ8lhrrTsrNnLrU+JGgT7M6M/92W424TfyFjXS2s0lS
         4gGg==
X-Gm-Message-State: APuU4Z/D4DqMVX8eDGs9kIk1AzEo/dYVVkyVlbQnGl/M3xh8eDW7EFsQ
	fi84Nhv3dTWkV2S2NH5hLTq6KRP2F945PxXPH4+gw+7S9ge+xccSIOcDn+AKi6CAdTXsdPf9qFZ
	O6JU4FCXp96Be8ThOvlyad2aVmzzSQ/iHPYQc3CdmHb+MEVlteHu9g1RoBT8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1527:b0:4c4:28a5:1885 with SMTP id
 5614622812f47-5640d9278d9mr9644492b6e.9.1793738016233; Tue, 03 Nov 2026
 12:33:36 -0800 (PST)
Date: Tue, 03 Nov 2026 12:33:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aea4520.26d36f6c.15fe18.000d.GAE@google.com>
Subject: [syzbot] Monthly lsm report (Nov 2026)
From: syzbot <syzbot+list9b459ecc7623bd2224e4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello lsm maintainers/developers,

This is a 31-day syzbot report for the lsm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/lsm

During the period, 1 new issues were detected and 1 were fixed.
In total, 6 issues are still open and 47 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 121     Yes   INFO: task hung in process_measurement (3)
                  https://syzkaller.appspot.com/bug?extid=cb9e66807bcb882cd0c5
<2> 54      Yes   INFO: task hung in ima_file_free (4)
                  https://syzkaller.appspot.com/bug?extid=8036326eebe7d0140944
<3> 4       Yes   memory leak in prepare_creds (7)
                  https://syzkaller.appspot.com/bug?extid=53515d23498d641e21ea

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939631;
	b=Dw7BQIq85yFrtQXzK714JVu1Fzi76O2ZrtXRJLNY+kLK0xk0HJHSdGz5WaUienI64+Ji
	 2OpazmGGAVJ29ASUqZ9ICum5VzL/zhUqxY0zqdjZutcvmbrdwYMyLR7DWMoyHyEdF3FOS
	 0IwV286uev6Ctj3KK6pgDXYRGKMH/vyEn2MCbUvxyNonltuKIwp/a5SE5EK8Qjd8Ffj8q
	 gMnG/4DXipxB1Kja4u9uLxbV9NHZOjA2VGkx230Gta/0rPXQrkKwJN0hOf0vIQLWfBL4J
	 9OEj7nO0/87OayMbh35dApDrr6o0z4kCFVLn0v3Ng/9Wa+85jYlOYmNqYtzLgQQuzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939631;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Q2tmnUML9xjff6/p1fEMU5at38Hc24S806y3q3ahbQA=;
	b=sF1Lfr5DxSEuyeIrOTXb03e0DS8b4CVcjszfa/P18SWqrl5IVX9aGjIVC7kDNy0YJfC3
	 rGjlFF8zVa8wVfMvegEjW35mIO8R8Bhmg9kfb+y/PoTcFzOr6A8SxbF7BCMmLhK0wLqKF
	 M8rd/mr1Tuhy15E3X/nWycIeyUgPWrIpFFrDUkheQySULL2K6aFoKi/eYfL1u0MAttVo7
	 PincodVvjmdtaipdU56NzNwn/igzq+WgLU4bvZrWqt4ErdAy6BBZJNV3EZGAvHd3p2FXF
	 b8lynzxQzTQnZAehG7ph1aYPWL5woQ7vfhLTtNu5YJ/90ZSBZyMq6V3P4ete91vO02Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69CA606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A69CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso308012b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939629; x=1794544429;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2tmnUML9xjff6/p1fEMU5at38Hc24S806y3q3ahbQA=;
        b=2EPNuLDYzUqFrxpltNfogJOe7qNaox9eRQAhXgJ1kWgYDVoIrsI4dfYjWKaMJOg2J1
         gK84dkUGDT695FprLazfHmoFOm+cD/NLQrdNTQLIAcrbtmhKMJY6+BbMN/vrHqOb/6Zg
         Afkt7s5fe0wHx+90HkKhq6plOb7V0ptsbq/VXsc0zkC/csIx210DtkNIV12pOYXCQIpq
         2hczNQshnMiQ1jzyZtzgwitLQx4jHcOEU3V+ze4FNux+TQsYSB1lWTXJ4+HcdldEAjao
         RLm6IKwhyIHLoWvi4kmZkKYFZ9no7iev6UPiBTEpHWBh/DU1HZNvRupZov3U59fy/JdZ
         MqFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6O7Lr9F9K61hcomKlT5xWX8gkkRFDGYaCFbzEDaJ0VzhzvLKpBgXf7kJI/0VjP0PbQPMsccJtNPmUqVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mFK4pQaVhtyBkyTA5Mw9eAn9x0vKk9oQVE3T6Z5vQqxgG46Ru
	V9Lmad+NbgosrhaxCdJZe17+0nG8Fm+sNrem9U8tVpVTdacE++J3z8Xj3xhwsVEAJo8dUwtxY9s
	+JaFqLs/QwE8G1O9CBq9fGB75v/7aNjE6ghDdn2DPmtncND7Pe903mY0r/bI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c110:b0:4f6:a430:1822 with SMTP id
 5614622812f47-567e0fa62f4mr1022308b6e.7.1793939629709; Thu, 05 Nov 2026
 20:33:49 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:49 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ad.02d3f859.2829d1.0003.GAE@google.com>
Subject: [syzbot] Monthly bluetooth report (Nov 2026)
From: syzbot <syzbot+listd5b89f3aed1bfe64dd6e@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 0 new issues were detected and 0 were fixed.
In total, 14 issues are still open and 116 have already been fixed.
There are also 6 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 10047   Yes   WARNING in call_timer_fn
                  https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<2> 5030    Yes   INFO: task hung in synchronize_rcu (4)
                  https://syzkaller.appspot.com/bug?extid=222aa26d0a5dbc2e84fe
<3> 162     Yes   kernel panic: kernel: panic_on_warn set ... (3)
                  https://syzkaller.appspot.com/bug?extid=fe5ea83cdd7fc263f452
<4> 17      No    possible deadlock in rfcomm_run
                  https://syzkaller.appspot.com/bug?extid=0adf2aef8ca78b84c4df
<5> 10      No    WARNING in hci_send_cmd (4)
                  https://syzkaller.appspot.com/bug?extid=00f5a866124dc44cce14

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

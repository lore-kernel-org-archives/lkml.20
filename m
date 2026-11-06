Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939631;
	b=V5rb9DmR1ZuLGMNJUtT+U//5GEjWO0q9aBQl620yJKVQMXkuZQz7OgZ/lOJiXu5BvaMK
	 GydV5umb19AbhUEFyWXjfyjmZAVpxsBgcFvQF+yGZPQKIZcTwhMWKgzApOrQifXmbvlrS
	 o8RuZn9A12cyEpwwLx7Af9zmLP9clgDzlF7jluztrgjzPch3t5XHxOyxFQX6n5kRAQqyO
	 Df2eVBMXN/WPWxwJpfBjPIr4qkupk8PkLRu//IstixuqbOzM5hT+wxiKkAKk+szmMIXmM
	 OMPmeGVsKQNcwevJMZXO1MGVGNh7aBKS5OuXMa+F1gX0xqCB1L4Pi6n1A5L25fwIKog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939631;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mcXyI5nT/wZQx28ZUALYNvOJlhVMFjY33zSG6Gck+70=;
	b=XWDg0NzwLk7TBdi801h6vznILMuEn7ua9AiDy8knK3u5L1diXDMugDIxq59Z0yv0+y+q
	 k8qw7G5kMAySTgz55fPPh799gTwfMEZq05VFPmc1AB2irX8DOFAfDxv9GY7R2dVphPbEr
	 u3uTN32RQQc1Hom65YsHI78t4a3Wp+WKDWXnHgFIDQmEFTXeDsqjBFDCGDNY41VPNPYjt
	 3XApLEYEPAq/xbKa3pZo8e0IE39toPAI60VYVuYQ5bOWQcJgHKxMJCYlt6YN7UMwAOrwD
	 k5C8eT3Tfe+rk/eHbJgGud3ZG5ryGcxFtt7A7Y6W+nx8X1/1EAaVAx2OBlmPR6KvghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098E606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7098E606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-540537f959fso283357b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939630; x=1794544430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcXyI5nT/wZQx28ZUALYNvOJlhVMFjY33zSG6Gck+70=;
        b=e+oofCvWga2P/Euqz3PdAdlVwjBInvVJtBOa++mVUgVXAw5tWUkDM2uv25PPsRaVnE
         5OogjOjEp4eYRb6gu7xL3E/+V8Peo2/OZ/pCWt9L0jWxbgckZog0azJab9n8xT9zJgXz
         vVGWrYo7oTw9H1R4p3N6HxnsQqAcWQWn+cZTZBvqjXBhqh3cybM4Tww3xu4lQxOWPLnO
         bQP/WPHXSv15AF3n6ImtnFvmEf1EXk20SekjtZthkvHrXj36gKKvsYNZvAwGor296gC+
         MSzb2SZwiLlsaVysazyiszvw46rrp9RnUTnlp/4FcL9zeqdvGDCaHG7ynWtSi0NeFpts
         AMzQ==
X-Gm-Message-State: APuU4Z/5bFC6Z6Ra06Qxg8EmhQPSLXRe70Ui1IsQOqTnmaJS9InI0v9O
	ez+aXHxNKYkKBEpvA/BxaNxEJiCdSrKCWPOcbdCKSfNnWajUlXd0xqbza9MH7KtYXbSxSG10NpG
	CViBTcGX6Ebya0lRNb+xi4ccHpnnGka63gIWGyfSBqiq+COi8YfDXybFX8lk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2228:b0:4d6:90d3:e185 with SMTP id
 5614622812f47-567e16a6786mr969352b6e.46.1793939630711; Thu, 05 Nov 2026
 20:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ae.02d3f859.2829d1.0006.GAE@google.com>
Subject: [syzbot] Monthly usb report (Nov 2026)
From: syzbot <syzbot+list44b027de7df2fb008682@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 8 new issues were detected and 3 were fixed.
In total, 112 issues are still open and 475 have already been fixed.
There are also 40 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7712    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  3885    Yes   INFO: trying to register non-static key in __vb2_queue_cancel
                   https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
<3>  3669    Yes   WARNING in usb_ep_enable
                   https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
<4>  2714    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<5>  2599    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<6>  1098    Yes   INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<7>  639     Yes   KASAN: global-out-of-bounds Read in usb_copy_descriptors
                   https://syzkaller.appspot.com/bug?extid=debc5c305403f180c01c
<8>  478     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
<9>  452     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<10> 349     Yes   possible deadlock in mdc800_device_open
                   https://syzkaller.appspot.com/bug?extid=023b30ebfe0dc4bcfafe

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

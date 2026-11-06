Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939631;
	b=r4RZPigMWce6ocuLFI1gWNIkx+/aZMpuLQ0SYd5FQZvqHuhY/R06IbgTVxTvk8rDQHVr
	 2Kbaxx2yrt8Xu6jlX2skwqXjztdOXE/FRBLdr/n+AJirSradE33A1V42bxasuM3ryjCcP
	 5XlPRGBOzO2PINHAj5Fa1Cglm3wRlK9sXqTPSr8Xl+0mMuW9Ckdle/zgsMHNNXaOPOCu7
	 4R0ziOa1AxYUyvJhxh8+xYjxU8COsrNZvUld1n3Kog7StuBQ44qdm0JR3DtbPDTVnIe3+
	 3/yLel7iqrwLUA+QzQNQquzXQZwEsdF4y2+P8T7aBh4HZqBq3GW2hhRVVGWI8n6c9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939631;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=u8F47qY4IABnzW1SD/iDt/N1xrxNvhOSu8Bvnim30K4=;
	b=dTkIplUf3dxV6qIAHldMoal9T/zfs+qygnVQCXw9M3U+IeLR0EogPHr+uByYZWzvvDXb
	 mn9DX99vtTbcKeID/QoEVoKanvZoQLXsaylFu4u9j3iVBboS3cPcUUYPjMf7aGt2UVrwT
	 ZbAFKlZ77UFlmNHWzERcE7P+AVpgnrzqB+qj88jX7L6ezX61Jl3gBG4mOQ8BIyh1EvYDN
	 WHLulNWq6ipm0zcA6YeCpTiMqrKecbv6vkASKnHSdtyVJWhXR72UrRvudBKHX4XLO4SWX
	 1igpSxWLiNa1RCMbmNeJJJCxF3f+veTR7pXqLsEJIlq1pKTKQFwHl3EwTHm8s2vx8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F64606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F64606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so331070b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939630; x=1794544430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8F47qY4IABnzW1SD/iDt/N1xrxNvhOSu8Bvnim30K4=;
        b=AG/oLV5vt21rD70Vj4e7DdrE+8J3jmKfeVYVP19SNtrmh9eHypy2gtOspveMezkgbo
         J75jUE/jNus0RK+j/4/ZDa3BMa7HBsQFO/2u5fEr2SSpLu8qS6RJS+DvrdE0TzjPJYz+
         Uu/VYyzuxcDJutKNUEr8xXjVR2YQYUySwt8cCgtKrZddvFoKaF+vGJh6ROEfb8X4pFgO
         jXtFDWCkvbFz/VaqrpGPSJ4dINV34xuMNXDVBDbdnUubdOSAR1SzYM5nWCkyFA69//NP
         gW8lCuL3gXL48kSaoAXP3bhRlPgytE4AnWbxznAZXRXbY2mQDJ3/Vy4NjH7ZIIGWcFAw
         I+tw==
X-Forwarded-Encrypted: i=1; AKwUvBwLOpsP1Otpwuyua/QAjaOpcyxHpga85msdiARDy98twYgCR+9CEQYGc+TyXF0RUGCATEcjXk8hLYQK2PY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+EKhIPOme/p0eFaQVg0U0eBGTqQdtBppQCTU7yOeB+Kf4bB6K
	Y+qYMxgOFDss4uQCJbyi9fU40g4Q1q+BYQ2T8ynZ5TSwKtao0slHMk9H0kaliZMWJXj4McOHzaC
	/XTrv7ZSxsc60xp7/Xv0vp9ulwp0dJVcGxEu55SP4J8hwfxN34j/Z/UPsVe0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f04:b0:4f9:595:b80c with SMTP id
 5614622812f47-567e160ad12mr1206021b6e.41.1793939630402; Thu, 05 Nov 2026
 20:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ae.02d3f859.2829d1.0005.GAE@google.com>
Subject: [syzbot] Monthly serial report (Nov 2026)
From: syzbot <syzbot+list13132b08837edb44a184@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello serial maintainers/developers,

This is a 31-day syzbot report for the serial subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/serial

During the period, 0 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 50 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 19      Yes   KASAN: slab-use-after-free Read in kbd_event (2)
                  https://syzkaller.appspot.com/bug?extid=098cefc0911c68db5dab
<2> 305     Yes   INFO: task can't die in show_free_areas
                  https://syzkaller.appspot.com/bug?extid=8f41dccfb6c03cc36fd6
<3> 211     Yes   possible deadlock in tty_buffer_flush (3)
                  https://syzkaller.appspot.com/bug?extid=52cf91760dcb1dac6376
<4> 84      Yes   possible deadlock in n_tty_flush_buffer
                  https://syzkaller.appspot.com/bug?extid=d84934b4184d7f9a1aed

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162025;
	b=lgxxukpRMkJw7sGoDQr6snRYY2QH9NbAxcGYFUX7MVbP3d2q8Xzls3q+Qfm8l0N9geEG
	 XPpg60AsVJSh26saHkYu2K9Kgci4zxtYZ0flU5w0xYv5zUYWaEWXUtxYHlyORwxqlDMs9
	 UhImPD4P4c0zO++OtTCPPCSfkB0/mJ/+QTdcRMUiG13PK2hRXnfj8xyp4apLV51LKWdoL
	 NC4R1CsL2Ab2O0+GhVwhR54Ah9V0JkUU8Z1KLK3ZqBYEaGAvOzGUjSSy50FhlRrwnfK6t
	 O+f4dumLIhfiLM4rac/OiT5fXhN8BDacLlSGsviHj87Svzy6tIcsgMmbuBrmW8X+dSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162025;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=wT66TGIvpZCHrHHE05hEIvqStnKLFFiHYFABNX90Gc0=;
	b=HAL5zy9cc282BQCgIstUEcWXppMSqtfL3GvysO4tPn1UISHAT931l/Z/9CcMM+03y5eu
	 NAwSNr9tgxYVNmOJSzSKWTNXwcOX6GuIQX+lj9FdpZPGO3ztJ1AhLaWapxposnKBntQ8u
	 256hlJNpzmMEb3R0r+Itls+eHQ5UVFCZY58kPZl630bcC7nDVswKY94gh7IqiWgyLFIkO
	 z5kBPCk6pw0WiN8/j02WRJNeOkF3je34e9VJthGSzTEk+T2KKiR4uw1dyCTWW4KSgLpyq
	 VOq2KFff7UGZUw0b8uukMfI749id0k1uIgEWVnMyOcTZP6TnYyuvp5MWUAyAhiHYk2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF29606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF29606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so542863b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793162024; x=1793766824;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wT66TGIvpZCHrHHE05hEIvqStnKLFFiHYFABNX90Gc0=;
        b=16cYzNxHiNOlBRv3X8MTW50yQ5byjQlvJ0iFgo8yrq6/AE0yixaofpc52/MrhuAGU+
         wt3KO31TWrs7vYuYcFswgj1yKbJsJU8FdcDZmaJLj3J7MD19gLAx55E4pj1mV+MUdWdh
         fx5VwSQxR+ouJhDCLB59s+O/SQ59ZMnC7iuTF9SFNs8+UoSwLrS9cZa1nZWw48mtdSfl
         DpqUT1bA8xT4Dt9KkbgO2XKYLdMjHM6OEwHNMCgpx4dANz8aQvjLdBakNLVVKyRPOOVP
         9VUh/1XWZlZCB3JVbtBkbZz5AfHvX13RfEtnstsIAXGdh1LR/+1dpL5zVgIMVFJdyBLk
         Q8xA==
X-Forwarded-Encrypted: i=1; AKwUvBw3DHikkYMo7wVUrw1LUeeeek/Da8vFiwvQCe2+7yaH2vkjytN74bz8OcSUfy7LZj9y6P4E70MCgTuXch0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHZ+iujmVSFMBd0mst22UAwM7eeoM10NOvI/MXoIA3yPvOR79R
	5a4uyNanj8M+8uSVGKiT9JvZCOPGUshc4LNzrV+Hnyin1ZC77CH+ddDbrDLcqZXpc92ITlMZelb
	23o+R3H32BzTOWcDL9Tp5s5BSggMOO1tQ6kubjL0gF0haZdODIhEPyOFXf/k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c133:b0:4f5:41f:fdba with SMTP id
 5614622812f47-56382c82ccamr833659b6e.20.1793162023919; Tue, 27 Oct 2026
 21:33:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 21:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae17b27.6200f071.51519.0f5e.GAE@google.com>
Subject: [syzbot] Monthly overlayfs report (Oct 2026)
From: syzbot <syzbot+list5b4fe76f3e4e41f927af@syzkaller.appspotmail.com>
To: amir73il@gmail.com, linux-kernel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, miklos@szeredi.hu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello overlayfs maintainers/developers,

This is a 31-day syzbot report for the overlayfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/overlayfs

During the period, 2 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 38 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 276     Yes   possible deadlock in __d_alloc_parallel
                  https://syzkaller.appspot.com/bug?extid=52aa59fd5e3cd8a19dd7
<2> 74      No    possible deadlock in pipe_lock (6)
                  https://syzkaller.appspot.com/bug?extid=603e6f91a1f6c5af8c02
<3> 69      No    possible deadlock in iterate_dir (4)
                  https://syzkaller.appspot.com/bug?extid=7c4b3d05083880a09cdd

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

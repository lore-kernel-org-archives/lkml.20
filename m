Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787783;
	b=f9+EHLElj0s7U43OUJHt0WbRJX2IIm2ZEqUle0AjRlb4kug3299EBo+EShS5UY2pgZjp
	 7mSbe8gXcAhfaEPsnj9h5sfXnpRcy/LsleKKdt5kZ5RZOPvPjZ9hRe93MGuKd3+U0Vwab
	 qrORpjqqueBqgRgXriKCQqRBupPFFi7a7TMG5yT7Cguo/ZJ0E0VzcaQ0S7dtbKgOC2pOR
	 49LK3GlaY2A9XPWNKyExAPvO5sAF+0vtwK0DZ5jw1W+jbv0Uo5ePWv2bxKfXZlmdZifyW
	 C7FU69Kun5Nu6Xnz9bJaTD3GUpA07lhgibM5YHGr9218kyKb23JXtIFiuiryiA2A4mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787783;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=in4uu/6jU5K1TQw6OtPELk24DSSrt72HF3lVYXCjGr0=;
	b=M614MqbE9mN4/hH9sIo7KamYr+OGsvOH182h8o+JPaHP7sd08fVY2wZEf/NV25W0QVwb
	 qz0HefLmOus9aPK4T5mFrET7Xnj21vHfX/mOdQWcXUwrIlJRZFP9JUaqH4TYTdgJ3htcs
	 e83I4Bm9PloPfHVc0JPMdNqOxAF8RbEBvi6euP60Xxz9H0CCJcfkc6augmgW1OgoQNLxf
	 ve4WckxlGtQbYETTIrokaYxsMzki5QmVMnH+InAxUf9C8ODc3p2MoP6WyD5X3yAhYVTYC
	 X9l81tr0FTaMiPDL6EhIpxD7LIDaG8DY0TX/6AtwtNsRKhcfAF6t5O1gGDULzOjGc1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AB606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747AB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso787359b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787782; x=1794392582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=in4uu/6jU5K1TQw6OtPELk24DSSrt72HF3lVYXCjGr0=;
        b=NSL5zfVTwrToXefEHJoV/xnjJOxSASe5eAVwLoWczw/bdZMJZWrvp8cxcRIJPPWk9u
         Ug5si/iKAKV3Pca/qRYf4UaRCRC7yUFL4Ftua0KJUFgQ7mmKezsxfLbpyUbx6B9PyZH6
         N3m2KTYQQswmSnpcLL8bQ+X21T4PaZ5xb1y/U40EiggRc5v2KQeTTPIfoa4qwvAqsGY4
         6G7AAs3XQcxcYjCKAZEf5cpuGKiZuxwminnf6iWVm0i9JRa7ufo6i1vl1Es/5uFefhRr
         BRU4Y6p4Nd9Bed522wNREHFN0W/t8iRe6qBOvLyviNV8e8tMgPI/Vv47eTm9HM6KJMHu
         IbIw==
X-Forwarded-Encrypted: i=1; AKwUvBzHAVfIo8z0BWnactxlDWM7ncdcL9nFBOMTqg6JDIhCDHI5RbNvUJX/CuA+Jt3wSjwp3J0mngLIdhjP6Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I8qhvIlSSgLiaQcy2pH7WmRyJ/wQgvaK/qGq5nWGi7ardyWXN
	jEwxrHJtMsjGqGJ0w7Z4AGH1WUQdhPhQ7v+W4iP22qYr8zdvKSD9acjXkMYV/Sw7E7dpjeUrrpb
	hpUoD/5LQNlIHjFof1rZaosDVE2WFyaoSkEOLOyoq1j3vbR2sNHmHPa0vasg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:151f:b0:53a:e153:e8e6 with SMTP id
 5614622812f47-5640de7d903mr11089160b6e.59.1793787782323; Wed, 04 Nov 2026
 02:23:02 -0800 (PST)
Date: Wed, 04 Nov 2026 02:23:02 -0800
In-Reply-To: <20261104095530.4178727-1-diasyzhang@tencent.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb0786.3c6f2eba.20048d.0001.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] kernel BUG in do_qc
From: syzbot <syzbot+bad65435361712796381@syzkaller.appspotmail.com>
To: agruenba@redhat.com, diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
lost connection to test machine



Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1554a055580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e29ebf56758bec63
dashboard link: https://syzkaller.appspot.com/bug?extid=bad65435361712796381
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f4b2dd580000


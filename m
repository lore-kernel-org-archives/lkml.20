Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197624;
	b=Zf/Qd21bXeiWFzS8k/fTrhJXJE0Cdk2MljSI5zz7xQi1Ttxchr6H7x5IcwoG55dYLx/C
	 qeiOgXRze31ssYpyYJNKCmAa1WiHCHzVsNDtbCdO39A3SMOv4pNPw4KRaX9dUHdkbnKdu
	 75oJmVitYCL2Mwg3Xlr162kPH/UxS0BYlVCYYCubFF+D5xO9L2ON/Jomd9NgaCJZta/tL
	 4ihF9kn3FfloLVO6XYhWCJWoC79OVsscqdk1vrQF7UtBmnQ41sZ0Qfv6LWxv8doZbdFHR
	 CtWG3uFunoeKZPy1jDfrK/ngzIGIFnGTA49Kzt2oZTEUiccXEaJDqOHA4ZwLnoViRNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ouM8Jyf5xp1XhUc42Rrlc+J0uWzI2n/sd/KhMhx8z+8=;
	b=s3VEnFVUaNvNWQ6etQi45yJCzWymPRTUu6fDgO9rxjsKWe7vS0kSRdtzUX74R5O7mfsJ
	 zSBdceqhGKa0Vg9WdaoB7VpUjeXsvfFUbrW+o9YEd0BCOoHlBvw5+u9+vfQQ6741a3CPw
	 5bhnqxmGUdnXpe7p7ZuKICojgi8x5f1pNxq7lvNOUtMAlNPVun6+aQru6gkkv86YuroDY
	 upmFEHzdil9uopfYBGvt6074E8tYFHc1oWkbQfK3jm/u/hpoHyT0NtXJxMXKfAGQMAV1V
	 s0KQn2VttbJqkVT9e9VnMzUeJzYsuDsNyumsdVl6K33bb/oSPUc6KkVMbmvyJ8heDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A33606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cbf700ddccso1003837b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197623; x=1793802423;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ouM8Jyf5xp1XhUc42Rrlc+J0uWzI2n/sd/KhMhx8z+8=;
        b=pYCkIwtvJ39249JlC/Lyuji9xq2KaKSCHkgLt0EQ9jei3N9+qQJljqG7mbevQ3Ulke
         Zq6oVsfi+YBy53hR1dXxYCUR4ERKIhXtfD19QeWxQJ9NGOoD/+xWDNo38P7bmPmAP0ZZ
         VHW7A6XjP8XK7hxDHj6dLhVcH3LCzfDjKE+alMl69P0u0PymRDzOlxud5thHUDKz/b8Q
         Nu2p8UGZYxrQko6lGW7590UDU5Tge2BvjVIRAOHF+AbOU0nndNmItOzH5ESdH6WNVxtY
         c0tthFftkiZK+RabA7QcJxL0LLSDmOeD20N5dEZVLo0u93Ckd6kyhzUThbHc/44gFy4Q
         IZ9g==
X-Forwarded-Encrypted: i=1; AKwUvBz7WHg23p6/dd4TX3g77OsWfd28rfpkUu/wYRJIu5ZAoSG+k/Rp0sOMzvi5WIQQrNXQte61RmKXQ9IburY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv3FgDQjH5L/XwFadPmVrJHKc4DCXUGFxH6E0E5SXTsO1m3I2b
	RqB1znVRFpSsD7a2d2161SzaHY+TiAsrMl0o+1iwYfCuthbGS7v3SnQnKz/+r1h1h+V4gqBxhwC
	cycfAKwliE5cR/UwUEVx8LWG2Lg1U9eMmJR3YSi6SGgrpDXEE0Qnk0dUVTcU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:309c:b0:55c:6aa:14f7 with SMTP id
 5614622812f47-56382c81c64mr1795765b6e.21.1793197622894; Wed, 28 Oct 2026
 07:27:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 07:27:02 -0700
In-Reply-To: <CAA=drAoaK4tbiwuR+RPMQvo2LwDwqbSKsN0Ft-pMi2vCOH0m4w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae20636.cbab20e0.42a9b.0006.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: google-kernel-team@google.com, gowtham398gs@gmail.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Tested-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com

Tested on:

commit:         65ba8f34 Merge tag 'xtensa-20261027' of https://github..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13631d21580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8fae3718ee4d506
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1637e17f980000

Note: testing is done by a robot and is best-effort only.

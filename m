Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579222;
	b=q812fQYbV/xDte/VdpUqJWmQDb4if6qKfp2mYuZxPu2f7xzpKFRv97oKGzrJiV24d7GH
	 Qsa6+y4NIveDG/eqkIeB9hVU0o0Q/JFlD5kviuSaxnAN6iLC51l3ZqsSYYwyxFrrewES8
	 zM4Rm++HQSCmFYx4wnnc2870I9pcd5NjiN0S3VdyoO7agbQF563tc9r5nX5+sQN3IHyRO
	 xpvKx1P1DqpORMT3m9Di8pBrghle3kT5PgmKSKQYAR6ngY6RwOSxWk06yHTO/t0tTTgjc
	 BNnoiW4QpXbz+rxWh6JZ/aP7tWPUJdHwN5nQxReFOGKSOSc6WbJN1hRT0bDPeSogkwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579222;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=f/m1FnPhiZFAB54M83Ro2OYMqIc5CunLUhnYvOj2PqI=;
	b=mpVppOYlb1WLf240igT4oq8U7ZzzUZGG/+/FP3uVS+u4o02jf9Zf9s2l+Zqfk9VZrTMM
	 EG8Jz0xpnpyqrT1Xe5C0vuubO4Oj8rfMdLPvH7kyagJUuWiGhA6JDQoOCj9jXqU7lmUFa
	 Mzm0rg8UeQimKvFmsZ2kjHVhilgrVrNu2XuBQunAX31SY3ffVsrVVr/LZ0MSa5q5qaW2X
	 iFIov9EV8eqt/PvNGkTDKO8zrSQ0HT0kCgamJTwBc8YjVdRqng9YUffGxRPivrgJaF7F1
	 TRYVJXSQHw4IGvAEJODWCWnHdoMNdob8bdiJWHbUxarh5VTOT5ormU1LYkKmZrA15JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADAE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab260600easo5207643b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579221; x=1794184021;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/m1FnPhiZFAB54M83Ro2OYMqIc5CunLUhnYvOj2PqI=;
        b=JiomvjOA9q3xP7KSqqTFk6iChhPBqTTuRLawjZoXoHxElPlp19C2TKRFwwrIhc3W3T
         kZsGcCLM9U0fR1QA0dUo+KxsQ2CYuv/vwggmZquXQfxhmXbaa5o2B/QDF/3S64iAB50k
         YTWs72SjZgMpA5jZG1bgbhmeobsNM3czOJ9azk8jN7pYco3I7FVUC8UcY3PVRZPKLlhV
         vks+z2cK7EDoxbNnkLgp3yohNTg7sEEOV0OPjLctic+8dxO3zpc3QbkSwROjb7/7cwhx
         WAKfbN3IqLYFNz6OGsJnDPYeZNV2zQPZ2HlMAtunN4+As4nRkyFGn/IYWSoQNNGyuKuI
         iJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3C7jNf2BNvQPqxKl37GygrQooC4b7pQe0YgYLoXMn+Yt7mDz1ze5khzXnmfY7EH0UNkA70cYE+s8BTRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi4scTRFffMq6agCsmrl9DHBfzpTNCyyhg4FEy+iZrYJ3Epp1G
	puwx6mMYaldtS/gk6emzlpYlGpT+Blh0D5Qr+lUPHpbJv+mlN0RnEeP/3UZ57I0WSiRjCTKnvzA
	WvnfuP1aa1TvD/6mvVJMtcAOMDNGZo2bC614jmyL790GSK9OmgR3aMfaWGkM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f92:b0:4b8:4703:db91 with SMTP id
 5614622812f47-563ef9cd728mr5525776b6e.26.1793579221640; Sun, 01 Nov 2026
 16:27:01 -0800 (PST)
Date: Sun, 01 Nov 2026 16:27:01 -0800
In-Reply-To: <20261101203949.184-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7d8d5.67782f90.13afb0.00b3.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Tested-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com

Tested on:

commit:         7649ba73 Add linux-next specific files for 20261030
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13384f95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=32200e8f6f745e79
dashboard link: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1603b5e1580000

Note: testing is done by a robot and is best-effort only.

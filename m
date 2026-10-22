Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688283;
	b=jPmjv8vG0JxMobBGJIjQ8i25N7s4mowqV5K1PrK6k2EC8JvEYWcIoUIFV5+TANIk3u8o
	 u+sbH8pHjGMXp9t4QkPxxCaEFyOEySijzSSJ2nXlXYMCrAgZ2tUKELf2HTwhoVQYSA4kf
	 D6ccSjmZvN3YOlIanVpDQ59JbsgEXT61vYu2oLXjDqnBnopw1BwguTbEwyEiLZHHb+1/o
	 gosE7NpKgyMLK2NKyfvclXmWJv/RWM2iA0NQ2OlpmL94ReEkqcSFtEXSUyLIHvQeaxIb6
	 onUmA2qsEwGUVJ9rDv2Pd2RRRGa/i5kRYgn3bQf7tfmn1kDG91HbcItAMcI9oz5q/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=VkJ9//0HJIh4v7Y84dcoo+PAwX4DjzcQwaVnXSif6dA=;
	b=d7i+X4ePIAoA3JMg/zfWcKX1TGPqmymMqdepTRfJsM+7/VtwaUhqGtlUHnTBBIEeTTbZ
	 pEiG5dDzL8sSF0XSxK6HZwLtq62nssbknhhdEV2MfEhodQj6T1e94vuLpH76H2ib2CLus
	 SB1iZRFaYwoEqtlSRrlXdDder9OVu6LVaBSQNJPGy1qOjaR6vdaOpSHwE3ZjB5ustb4HX
	 OalQS3CQjp6bivv7ngBw4ZnG/Uh01BwYQ18Zi0aUzsQ/Hz4M9XPmLZGVGE0EnW/G6wEmN
	 fAk7ZCf+9+Hcv91xgxJID6uihmXNXgcRCfPsPu9y0TBfypkFsAwtpb4440atZxV4t1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-809f1af7992so4560109a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688282; x=1793293082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VkJ9//0HJIh4v7Y84dcoo+PAwX4DjzcQwaVnXSif6dA=;
        b=0wMH+3FLsFESbcqcGHwOHEdZMfuJ4H2WG5fKnRPTLsB8ZMD66XR9zIMI51qZqmuw9/
         1FkaqtYQoOMgUK8hwt08m3/2VmUYCRXrYNcNAB1jfzz0w1JO0XcYbPQRvpPy3Gnld04f
         zkZryci007YXltQ3npG7+t8eq6LT8Lc0fPWUfkdoVRhhzzUcvrgsQBaasscWgdYKovk7
         iUA37/HI7oswU469tJLb4Kf1RBEuyxpgyMMqnorlgNB0170a8uXkEez0N1gflLx1UroQ
         dVmxKy8k72V1YYwV0+dLlWOnAzsPTSOvh6lOF7SvZQUPxi9FGGlhVhM2TajAVygaM6be
         LV8w==
X-Gm-Message-State: AFq9FYLHu9AExo8dXkb3fa+qPRLeYRje+n8JvyT0UQGo+JxHBWcAudCV
	FvzKFo6JimjHPan/kZJ8e5u51/2shTUj/6URTFKHYLf84d7GXGRrQnNSXjqeyEJMy3unfjMXiHX
	GW4j+XMRnrH2AaXzwO/jggUrouWaI1IXevvpP1Oq3J+e8JWuH8vkEA9fz95Q=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc7:b0:4e5:c2b4:33a4 with SMTP id
 5614622812f47-5535a293930mr4191033b6e.50.1792688282254; Thu, 22 Oct 2026
 09:58:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:58:02 -0700
In-Reply-To: <CAFJkwZzqQtu6K7xYdJMp8Wm3DEa-Psp4tiyPxi_H=gcWygT6uA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada409a.d1c214cc.659fa.00dc.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Tested-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com

Tested on:

commit:         8f7df005 Add linux-next specific files for 20261020
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=155a9fa9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c1b9b13e3e4ce1a
dashboard link: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12170f99580000

Note: testing is done by a robot and is best-effort only.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370264;
	b=S+AQQozpgcK/qYKhBL+PjNqUTsElMxRUJXg77qMhVH6xIppPuqpFdKCfvbeYo32nfa96
	 bdDBj/8LrQck7HJri0tyPHAnRoWNSLDzU7Ez30Cj472Vqi2UZaXjKNVoqC+h2SAksG7gu
	 i/4wR52M4wiANImdrfwXtYL2qVlwZMnPga3GtLKfa1Jl5e0FJGp3/C4P/Rh6GFUmWBuwI
	 jT6QLi03CRmF2rkxTVBCu3vulacinlnq/ZVeSTgzEDdCPFHvGHDTpob5UUgAhtlDOopNF
	 hUAG3Q3qo48lhdXgIKnCzVpgqy0xWSFfUc2sbGjXSJftPQpS65CZQtqfqWHcC2CSJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370264;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=vBoHYFy/cTUCjfOtJFMPMFMPiX8gIH2AR8PWXIpQqbc=;
	b=3/Iu3Vif+4Pe3m0FhC/PR16jYm4oq5Z6YxWxi/vePL/HqN9LcQbOYB9GkgTcAyPa+F8X
	 d1PdXVG/llRsifZ7Qmc2D9klLGt+FmRIC2zHs80FUpWm6AMEzT6QSGqg+Flk9+kEnm3rg
	 dIkV52PdfdifMQnSzQTXMnQrqZCN8yExBNMMW5B2Dgh70qfAyJmHe72+bWGYkQtetI0jV
	 KXGmId7lqTgiF/wnJNFMGQEq9F9Ve5fgN0lozxvRjpaLH1X4wLxuY6lo3TGtIPsbZ5Oa2
	 UFcqZk17XbqEDJreZrHYJW7s4LD8wvKGcVvh51yhZfTeAhJInmNo/3VEOIllMIH6zCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B0606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281B0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5682eb98dafso3063503b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370262; x=1794975062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vBoHYFy/cTUCjfOtJFMPMFMPiX8gIH2AR8PWXIpQqbc=;
        b=mdMiBMMXAnZyMZSVaGAzu7gKOirO+ZUToA64eLYtt8vmQRa4ikUhLV7nqmLRT/IUSL
         hRMVNDfYh7buMyyvizCEUDqyCxQ7vOA0y0mdCIQUhtux002t4VKpI1F1WO7vT1WR7crP
         jeF2Oyhg+keu9ayI2ytgkDxR7cQiYmpC6V3Lcxk8dgFiEwSdb+WSlgyA318QqAI2JHGU
         hMxbsfQ40dlyKOcIANAnmf5WtNYkUJwpqFH10H8IA9tEVrPbRYUyKlgzvDTVmXcpLk8R
         5Zhv1hXY8YrsM5gAD8aBn/X2LW1S4oe0Cf9Z/czWOPRRTBAKKBmNUsboor/dX4TDXpag
         /3sA==
X-Forwarded-Encrypted: i=1; AL+hErESEQVR6F0BZGLv3K9MEm8OhRbWo6HkfozTPJqy+UbLwf56RoclkwQSjSEckV7mN3bwJyIFhSYzf67j1Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NTG5EbBouDDeGl03PYZNLYjUD8RBUISUp1JENBx/0ocfslRqX
	mq6v3p5p36zyP5bCbySxMIEq9rC+Uv1wL2Tpv6CUileRCWe5A/AvNfswFYiMYi4CI6vnVVs+HCe
	iH1V/2S187rqWkKniJaINvSODizImAUlb/cwFyFKFapdVh5DPFEbWa6pKerw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1b8:b0:55c:836:5955 with SMTP id
 5614622812f47-56b966af254mr990206b6e.44.1794370262171; Tue, 10 Nov 2026
 20:11:02 -0800 (PST)
Date: Tue, 10 Nov 2026 20:11:02 -0800
In-Reply-To: <179435860052.4109564.9298992817657762327@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3ead6.a9443767.1fe41e.002e.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] general protection fault in dvb_usbv2_generic_write
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: immersa.bartosz.chronowski@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, media-ci@linuxtv.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Tested-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com

Tested on:

commit:         c03c1a14 Linux 7.3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=112d05a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bc22e3bf9a6ffd73
dashboard link: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1030544d580000

Note: testing is done by a robot and is best-effort only.

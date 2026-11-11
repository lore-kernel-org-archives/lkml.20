Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428223;
	b=H6Iv9JI51V+qzI0QBB0xethvotIvaCiPERsGzh7/YCQwM6j53htiWBQ6tHiMaqhJ+sH6
	 EpBQ5bj+J/l8wzTeKhxXZSJWUfQIUhmAm+8Y2+2lyrH++mlYh+60PWPOQ4T9fpbgt3Tjf
	 eAoj2F8aBoDlTiBRBB9Avalfhpu51Qkd4soi2nbsvkvEmvxyR+vdijDW51VlR8AtOix2C
	 7XJjrooKLDCIbQOtUJyd73VkB64+tLBAOazPu0ke1DMCmKYw/3xK3CXUKQ4onhYzdoqEB
	 rsnytu19EMPJwCQjYPMm6ExIOaZkv/hXfNvrGu0g/LmKF0L8LAX0EPolKVPpTg6r+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=RfkBKF58kVgbWsdJ+ZVq9Di3pEhjn/OspdlJxdGJBqM=;
	b=jwOL+RS6fzdYXvdk8+U1QhMH0D50cY8Lp6nKiWBNsbVJHQOwdMhE6sEhcy4ZiIi8qYU6
	 /94AlCDkeyKN5PFn+esdPxQppq5swyjQSJC8LulcPxRkeBpbpeGvbdRC7tKv/GXVEEWdF
	 zgfPphEuG0C5gBH3gQkGm69dZwwkbVpBJnboTo0Zuuc1ukQH2EWQu6V1fSOd1uzNFhtJ+
	 36I2kNLx6vZ3/vJSeY8LQH1qopxc/OO05VFELnIwnNHFDfrELzot6g8LVnIuVvEDb9vDC
	 3osCqJuXos5SEhmD/4+yvXRBlK7RSRURem/RRtS+T0W7DBKB21EwiayslADDr/BLd2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A7A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5682eb98dafso4039199b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428222; x=1795033022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RfkBKF58kVgbWsdJ+ZVq9Di3pEhjn/OspdlJxdGJBqM=;
        b=nbprmc/aQqcUfn9/dx384EbiL4a+nrxYDIV44PUlfhnNm83h2j1o7AMU7e+HIgSECK
         ctt3Xa71ZSYSYnnFXvOLpjrUSwlCw5MQrIJ6LnSZL4tyXrZA4W/32ptv5FbTQlPw3WBV
         B4z0/rWsKZI0e4Ixk3U8v3fQBSQ7sFaHcBbomtc7clb05yz2YzdX3/YOZngTtFYFl438
         491VdjuEWx6l6cKtwcwxn2W14YnVvDNmXK0f+HK+Quxwsemd6Z9QSyNCj4Mg4sFhENrU
         Maz8DrIN7WzgmPc2yj/semHNhI2hxRB2oWNOsxj7Q3ADn52VdDx7cyProPdarNAAxgPM
         VY2A==
X-Gm-Message-State: APuU4Z9GaCzoOTNV/qx5tSPfvwE1imSHNfhPWxi/WAWRlzmA52Nxgms9
	KqZxZZWTWHizFNyNtSXmO2Nrklv7gYalR0nPweS8vAnkSHZ6UNANZ0zacSaJWd+rkgcR/4bBe16
	iL87RpteHzy2DEu5wNBzF5T+BSjtRWGnTySuXdGQcVAwFztb4XHdFtXrctkI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d0:b0:567:caf2:9540 with SMTP id
 5614622812f47-56b9293be4fmr3146072b6e.1.1794428222023; Wed, 11 Nov 2026
 12:17:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:17:02 -0800
In-Reply-To: <20261111113252.307157-1-timo.joannin@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af4cd3e.6d8d289a.8382.0000.GAE@google.com>
Subject: Re: [syzbot] possible deadlock in wg_ratelimiter_uninit
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	timo.joannin@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/block/nbd.c:1360:29: error: expected ';' after expression


Tested on:

commit:         067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=d30e1495ee3ac817
dashboard link: https://syzkaller.appspot.com/bug?extid=72fceb8393e04ce876d9
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=106e3955580000


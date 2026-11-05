Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897224;
	b=17h8OTw5NgKBYt25cf/VUQ2FmJTPq3YsDDCk8h/gS1MWhsol8HFW6fzII+GVAvmrL4ER
	 O4u9uGwTPWO8Xwf12I9+LdLTxlVRJiolVGfBBYcq6l+SC7QX9+haVp25QqSTXC0Psedaw
	 LwEKetAE3BJAekCIOMgw0BSG/IrY5yrXQkoxvimw2UW9PZDAnhFtUPekjO2GvrDuOAEgs
	 gf8GBXYK9BN7R2+LtkRZmvP2F09C0yprpar2jcqcDQgGqxJzUa/VqPlRaiFS97lXvDmla
	 ojiH6uW6z4ttR4F24YxN0ZCbMZ0xkMwfsqQDYcc39UJWeZwBr99oM7x20h/DEAHowJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=hQVqdw1jZnyTvf6HuEzkfI/ea8a/7UEr6wdSrPO21uM=;
	b=oIxYHbOSDzlvnY8L84hfAo49MRfsPLbFSQIsASzmSd40el4ax02pKq0c4Ui+8Y/K9t2T
	 tNJdNx0zPY+eBWoqMwupbX7t9lOgE+3C6JE4+eIldQ2LWjfml5VKz1Y4I9mMTQpVXPz6v
	 t4hWNvJNzsgmzyVEjyuzUs2AHgd9dLm6cBfzQmTK2UXk3TF4ovUccu6Y0xEYan58ZRe0n
	 hGAhW+rDneTWFO6NJZwfb/PSa4f/bjxy4195z8mUL/tZoryyB7sRoZ90TFCstmJ6KBa7J
	 8YMY7Xr2q2/mqXHm5xJWriAecu4XIuvDCmsF0m/iLj5k61hnqmZ6fUnwpwJ5/RKpMOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C78606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C78606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-55bf11583d9so1086485b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897223; x=1794502023;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hQVqdw1jZnyTvf6HuEzkfI/ea8a/7UEr6wdSrPO21uM=;
        b=rA5OGSIDfBzh3+vIfsAep9nRxVDFuW9yMeqfsqEXGuBl2+/CXlfztz/229t2EINyKe
         OGUzyQZdRj760dQYkG5KeJ0eZibV/wVOOVn81D/A8Pb6elwaTtCyYAbWJwpWTNGjI/An
         qWBA/NDRLzUg06UrBrlJ5jBLa74wOwu+js1tgL9YN7gC61f1jx67JyYFf0Orhj6a51wf
         bzO7EKDw95VtiZNDA0dfX97vjT0tP5N3e5eui18AvVRGl2FcICV5llLDhbBnrg4sNq5d
         VCXEPbgdpKlRpsWCju5iv5y+XTOPhf5wgkGZb/1PupG6RonHNUF1YQJ6nK3tKGO3AUQQ
         mJZg==
X-Forwarded-Encrypted: i=1; AKwUvBwzk4ruVQcM/XED6h1EfA12QiTSVkQc5I53YHuzj0zDsDSFQhX2QUZKY9dvKXD573ytqwNgws6Bft7hRO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zqQfExQ5LOgXNs2V/qRojKePbKvDQqBRjtbmYJs7WTk/kvimd
	/twa/5T+848H1qh7m11sceBqIBilaCV9yieN5btilWOF7enNtibmzJlorMZITE6F4qkgbHegHde
	EtZSZD7DklRwtAtQ6lrfxbrDwIu0KHVSbMtzsGYy2sm3vhp7wfcxVKoKoRkU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f10:b0:495:f8a5:8797 with SMTP id
 5614622812f47-567bde98696mr1829687b6e.0.1793897223413; Thu, 05 Nov 2026
 08:47:03 -0800 (PST)
Date: Thu, 05 Nov 2026 08:47:03 -0800
In-Reply-To: <20261105082717.c459bb33778fcf27e5675082@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecb307.a24d9935.80af2.0019.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
From: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, fuse-devel@lists.linux.dev, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mszeredi@redhat.com, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com
Tested-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11953cbe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1624c98d580000

Note: testing is done by a robot and is best-effort only.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348484;
	b=1uhaF750Gdi+PVnBaQsRl0yAN4hU3FlNj9jqOKfRWWPhpirDslucvPHEwwrZWx8l+Gck
	 7TbbObh+RMDIMynDiidEFF8cmv8XCwrPwEajPCjwcHW0JmCNOD+pSaaiaZXrPDKvmE7De
	 XykwnToe8Db4Ypo15JgxdElC1eGevwf41O4wUxx/61NAgmbQtP7AnO+IhrZKVh5c871G6
	 gaCObShm/coYkr3boGGL0ZPgif/fVE5YcStw8oAvKckrU3f3b6ztm9UeMQAGemHJf6PLq
	 5hOdD6hd3sLpH/cICZLCbPp2zYxzpWc2kW00xRPhed5dJzU9FzG93ez8YjnonTuKVNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348484;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tmnzGkLi+KipWE4sVWcd99YVlZ1A1pCz9btGd54xe4s=;
	b=v4MXgbfhg4ZMIyPWcmZiVekfGYsx5buiAZi4kAVruXh7jLIkLg85xu4b7QZDm7Z2mSMB
	 q+9MDXpunBwP17NDQSOu1d/47NNlvevJ+vM6tBIyWV3O/rWNvJpTNORZBh7N9LWSKhAyR
	 k16WH9XuXs8rx3UoLBhB/5cWWIofslk9Oa3/eX7sTrTezarV3cjM6GT9HBwgIHREBoLzZ
	 Z4JSHOzuQ2Pm8x/ss1aYEFsLqElKxnvxpP1Tnxx2eh4DgFi+LIObjvSDw2QAMCBMp3acA
	 RCJC1oLj5cCZqrjcUt7pe0fui5qyu2JILfD2gPQ5YAKe1zZOQ74UTgxr7QqzhNkIJ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8660A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E8660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5384e381fbbso2052126b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348483; x=1794953283;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmnzGkLi+KipWE4sVWcd99YVlZ1A1pCz9btGd54xe4s=;
        b=XBgpN3yQljF0LhJOFrlyv5KQ5LUrOhRPi3r+GRHScONNRUdnNt880vJPLQdVt12+HP
         /A+WsX7cz93ZA6ELQgxN4Rc+MMzl2MMhnARHn81mXYQZajAhS+8SttY8HCRhCu1kG7Dv
         sxtySScZswNsGoae8EV1Qbdg+0uVoqnEl4AYlfdfbL3e5WT8fvbkU6dIfZe8RlEEO0eP
         Sf5p4LQesynMhbZ55d61UC2F729iH7WszHuL+LeNBUffQQzWzRuBN/34wGOM+ThwiZOv
         /iNnewKrifaBKg29jgjoo8+MD6f9BDqNG5XiJ9GPIKD67YlHMaf4ib2BQ/bqh4X21WZw
         biBg==
X-Gm-Message-State: APuU4Z9Js4hDtzZtNwYqnkWEW3wQjLVoa9/2n4nU3LtjdS4bRMsUU4lm
	cqDVQG+qPpQYSnNTG5v/OzTJ/AHa0PPdPBemqkG/bMUZswaMayxv5td+GnD/J8GKpxTDHzG7BXS
	8NWxZBcORITqfOfk3Ph6k++L8y6h/JlAJkypBKs4hKAl59fkFRg4xdZUADws=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2c3:b0:4c3:db9b:3ead with SMTP id
 5614622812f47-56b9334e12amr313869b6e.3.1794348482763; Tue, 10 Nov 2026
 14:08:02 -0800 (PST)
Date: Tue, 10 Nov 2026 14:08:02 -0800
In-Reply-To: <CAO7_G+y3L5-N_-01cHPEbyvEob5mwgDCN2JgEHJoALzcptMX8A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af395c2.17ff5aea.1b027f.019e.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git on commit 58c1eb84e97701c583605ba2fd553b69afba2245: fa=
iled to run ["git" "-c" "core.hooksPath=3D/dev/null" "fetch" "--force" "--t=
ags" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "58c1eb84e97701c583605ba2fd=
553b69afba2245"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git 58c1eb84e97701c583605ba2fd553b69afba2245
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da58b6b4d667e7a6=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2e3bf0bd49acd9b21=
d4b
compiler:      =20
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10d221a15800=
00


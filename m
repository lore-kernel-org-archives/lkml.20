Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608383;
	b=IGEqP+TgmHp6bispfhDuJteLBqxKqg2yp/1/RO2irsHZBu95MfriiCZMBPZwQRfjxaTs
	 gx8TLx9k6Aox5em7kKi9ecQu0XXDGA3tmbMqh9POw6QL60jXjUk0RZXwVGTwsGVJb/Vds
	 eSZigWdqsfic+rUhVUQ4wdtuWCbERO3gN5a2cdO+4iLtZ1+uM64vudTbzHAdsDEOGV58y
	 K+VEAKHdfupRMETdMBJEL8rML8qHboZUBgcaN2fHOepHjbMhgje6Mw8n1FnBBBgGaqSCC
	 mIOnv7Ox6HezwnlOOP5FcjNWQE7xwKOAiHpc1lUFCqI4H4enMqXm5h2xzzL5hRfjHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=QGcTZJzW+xMsKpYi5IZQ6V6prOuqDJ91eD24Yaff/KQ=;
	b=HQOf6+HkkGpBtzIP2TYm7qNlrHiNY6bPJ4vnujeh9qEXGn3x3ToyabllDk4BTTWIJYIT
	 5yiCDmNXD6LAAdKMbYZ/3XoxS15yqi2zIeBqMMz92OpTUf10h1/uT5CMV69MnMla2eTfI
	 SaFvqOyposbADt8oSLqqeG2bzBdU6DNhFvbub9hDaolRPICUfHOPNr6k7Adjn6tuAMBng
	 la8Pqk3zJCOlV5aI7MxB2ghswZT85LQjq5t1azSwkBzuXaCjxqmwwsbnl0P4WUCiSaKtx
	 JeD8CxTVKjVWtZNjl1jdD9wgxo2HT1p+uwPYiVZwMx+1sg4KUflnVIUGHzWgv7ZIwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4d2f0f77124so3105063b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608382; x=1794213182;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QGcTZJzW+xMsKpYi5IZQ6V6prOuqDJ91eD24Yaff/KQ=;
        b=NaKmJm9IsSuCsL5IIfqhFbhLz/JDpIimvhkdB4WpNsMOJd+Xmx4bEGpjieoz92f+Jf
         o/jUnPDXcHqqwQfVZMcDsTGtn0VXO8N8az+PGUDO7lR3c33MvgrWVaXohXKDl/f4u0st
         FZIa6OPLvSyr6u6oyisnOf4EPYmFCfbCNt3aUas+odK4/LQR9lhZnEJBQMZ6QFXJxLHA
         bTQ8aiKRg+z5PWmuk5c6gwp9PM4VhlpZk6vO1ZUxhSa3vUD/6rfoWa9ERc6vCjy2hQgB
         prbK6Z3XqKIkCSBtlH7CQpgCMIsUp/D+BRfn6wKFwfTQBk6wJLiYLXbwJIDTQgYjWjh6
         J2Rw==
X-Forwarded-Encrypted: i=1; AKwUvByZrVAkSsXK/8Y4eHwfivRW5Z3PlzeoMNYrzY0QMI8tqqm4yTwa8t54Z+opCfBJgmmFP+tzlw6Q0ZaKBKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7muCzYrqZUj9o9fPd7kwRQNb7kM1R/Pp7oAFleitQU40q3nsJ
	JdqcmXeJ7Ua8/lyDPokwYYT3fFBlt5E5JOAB1jN4WkBIeqccfwgOMkSfhrCIM7+k08ElX7cMsr6
	0eERhN1L5nTGiwKjj+gc4orAK1QrhZ9Aa5WZsTwlqAP/WEShe3AwYfp9uKyg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:58:20b0:564:3bc3:4605 with SMTP id
 5614622812f47-5643bc34ee3mr1433576b6e.40.1793608382276; Mon, 02 Nov 2026
 00:33:02 -0800 (PST)
Date: Mon, 02 Nov 2026 00:33:02 -0800
In-Reply-To: <20261102080049.417712-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae84abe.e91b1aea.38328a.0007.GAE@google.com>
Subject: Re: [syzbot] [dm?] WARNING: zero-size vmalloc in cache_ctr
From: syzbot <syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Tested-by: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com

Tested on:

commit:         7a19f0cc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=166b1cb1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6602d83d2f34eb80
dashboard link: https://syzkaller.appspot.com/bug?extid=c8564fc0a96e3ecbe4d4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16ea4f95580000

Note: testing is done by a robot and is best-effort only.

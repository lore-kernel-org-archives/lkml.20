Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606223;
	b=NKLj3cDzhLEMHk9XJmdXSLFzm6+DNSLo+1GsE5IeSfFAyBjTV511UlnoG/ZmLKrb5+Gg
	 0PuIfnjN5Pr/vISf3Tjwq1NqN3oO3lQuDjx51MwJIHVTNiILSKRf6xcoS74675xv1tIvP
	 GP4+OdpwwZLh1DPGchO23X3A3fQSSO1zJ/cxRl6TrCf50IPmUwX90k7OkHjyqDS6ntFya
	 /7y41yM7rjYrWZINlwH6wud+5LNpglWQ4SDKK746g19O0Id4OgnjnfiwdoHzHfJ4KZKhZ
	 00S3m/DrFFWedT0kMBrn61Zxn86QWfqFe3/3IBqBW6wuwjqIGYTQ2RHedb/0ItpKXSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=wI9KAy96i4MGJRf1iOSNZlHXJ/nQO5Z5UnZhBKC0R90=;
	b=wkTOV8roOYnMThTDlwdYkTY1bMQaYCqJdw0RaVDvKjJtSO55AG/2Wml3nIOztVqxEYwk
	 BhF/otVZiT2e0ZSb1PdoAhjZvRg9E3mEO/4LO3a1rQDFjCacr5qtwd2WM+FfUShQE41Uj
	 Q6ndc4Jgx/IdU8ywGtYK4EF6ZTAN6H9xS+BxM8YQN525RZTYfO68cGpiRz8eRJ4MfSHMG
	 G+0/3ZN7eVRHEnEkSL/GMw/70varIgQWKYmAuSFvudWSmMhFhUigb8c6HCI0Eg3UtZQdk
	 JMCMTisqkU4Z/F3hJ7kE7COZmwX1heTQHpO730znyWT6woCBEr4OOr7g8axNyOPp4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1825606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1825606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so4667452b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606221; x=1794211021;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wI9KAy96i4MGJRf1iOSNZlHXJ/nQO5Z5UnZhBKC0R90=;
        b=y7tvRE/tXCtwHGqATsvkyzDZ5QIlCQ9mXS3EUT0IO7mkq5M3uUutXWDZ4i3qX6dagy
         8T21vJKdD+Zwh94l6zWVLKi6BgN0IyUf6eecswLEKfqyz8iKHeBkpSs+NMW5aHp5Ob7c
         3tZkEa8fcjJasMImWI6zjoBvoLtS4q1aU1RJhekMfMots5HlhGX7DNOiKxbm7YcmAuzU
         hnvwVSGTQGscnPYj32PvdO1ZiyRGJ9q5L9FZwiWqz+IVi83ry/pUHiWkUud8oONrwbWC
         RlJJRRzlAN7ZYTFBv52Fe05hE1SN4938H5cazBz8YP0wJCybGlz509rrbBRfNbigHOwL
         iQpw==
X-Forwarded-Encrypted: i=1; AKwUvBy6ovD0uQtLlSHn6jlfBGyq5xrgPNi+eyIlU4HKZvwx+xb79ouDKZ3LJzQLO2t6BSi6VZm2+TeP0NSIKDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3YWvNuzHUfAoY/xZqnI/bKfS45yvA6MKkGw3hNdluzqU4P7ag
	MSgL8vKDqa25j6HZOfVxUDBw7qAsE8f0O9WPmyWfPwRuQWOKtjLC+A0DKS7BwQMRsS6+9KxqRhH
	/JUlExIKfLJvmktXmQki4sDG0LJq4uZNsinxhDoT6HmEzm/9pPnvPaH2FuvU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:198f:b0:4bd:c8be:1e00 with SMTP id
 5614622812f47-5640dce8abcmr7185955b6e.13.1793606221790; Sun, 01 Nov 2026
 23:57:01 -0800 (PST)
Date: Sun, 01 Nov 2026 23:57:01 -0800
In-Reply-To: <20261102071501.414627-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae8424d.6552420f.2a0efc.05dd.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=1187e62d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6602d83d2f34eb80
dashboard link: https://syzkaller.appspot.com/bug?extid=c8564fc0a96e3ecbe4d4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17527935580000

Note: testing is done by a robot and is best-effort only.

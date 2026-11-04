Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783557;
	b=rzle5xMB70jjnSbhpZwMUKpyyqgGmImOp8e6q8oWfBe41p1EzAYafNBzbgTKtgW42DBR
	 swhKm6wkOYsKLB7hN7xYxlIXHNDp7YOfAS3VdUf9/32SOrvy5uoCEgmh8WQgsV8gcjNVt
	 Ik0ONiAz3neSWA9jnucB2+H/AEEbo2+cM06W7XTn6mfmKCFhkyC8SWE/AXIMDeS7aLtNP
	 NsVtbzzKTKzBZeWIEfsUfJmfLW6rlKpRyCTA4fWvgk9Q/JA7mSL4bSUaexEEwSpFbSX0s
	 s8/FRap/Bt6kTigUVB+gmVng4BAsfj16SbkPqCVVvU1XhSiRrMxGmLUgvPKY6Wr5Jzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783557;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=PhqDLzpG5VucvgTkj8iM6oqUUBI3Zf19jlZt4j4eJv0=;
	b=VPQksmEitSiiaRx0YCwJyqbytENGx8G+8kzWa6wMs070Y3JenYdc8hfKZ6P5daw3qfh5
	 OcSoEaJdaaajfzcexmgXVjpGiXs9gpKHkbEDg3iqjI3oO20PaxjhB4SGStcrSWyC1zz6l
	 VGt+Yzdq02dzwlvyMxAW7KfbI1LKTshhkyR3g0xyyB67Ktqo9iiZkjqhGl2dZnK4t4sJR
	 idSYzTAi5JjRAk8hrv9AKkXfRUPhCqckCxMtTz08PIU0/PXQsbj4GuPXThSmc+xc6cicC
	 wGbbp822SDUfw+lBBUFOtJMND3QvCsFudrmggSpNkBNLz2xbENvtLAR3r01S3vXr/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2981606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2981606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-567ac848d83so429620b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783556; x=1794388356;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PhqDLzpG5VucvgTkj8iM6oqUUBI3Zf19jlZt4j4eJv0=;
        b=mhG6rmyWaj4MvET9ERqvD3N7pwl1ACek9G3crG4Lr2616cgOdR26gsvWjarjCZFdiu
         xcxbWneVhDjSr/IwQ2tZQCt7lBAo5HI1Os8p2tEnjYqCSLlzKt+ZHT6/ylAPv1/f488H
         FVQKQtHTm6m5FbwR3XnVZPigTw5BaE/BluWtZXO+u+OvH+JhzjvnPPmjXsDBUZYqRMQK
         GWrjQJ5JobvsPu9GbyZd24a9MHIailC5ZAOqL4tbiaJ8qnQADbE+nAFbtI50fscrutFh
         uVwfz8fzAxkMUaF365fak5gArtWwrgg7IJfRM+Mg4krTjyOqRUOtB70uBFZfbXA2rf/X
         XGQg==
X-Gm-Message-State: APuU4Z8NdscA4WaLaazwka8kxD5b4B/pvT+BFgaUW8JpqYMyFQxiP56v
	kF0Xklhx4sAgdyb2gsO7d6LbwDfZV3pVfa4WC0fCAX8qyM+gKuKEgNXOlghwNZKWULLVqd6/1Zv
	kF1+PkHbbqZxqkv66rfIpzgQa5JlE3ECiMq2RNUeH0t0GmkU7gxS95GY4dps=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:309c:b0:4a3:3108:866a with SMTP id
 5614622812f47-5640dcb5ce2mr11291863b6e.17.1793783555757; Wed, 04 Nov 2026
 01:12:35 -0800 (PST)
Date: Wed, 04 Nov 2026 01:12:35 -0800
In-Reply-To: <000000000000bce370061f4207cf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeaf703.0b257d1c.25e26f.0022.GAE@google.com>
Subject: Forwarded: Re: [syzbot] WARNING in firmware_fallback_sysfs
From: syzbot <syzbot+8f06445357a052a92657@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] WARNING in firmware_fallback_sysfs
Author: xujiahao@cmss.chinamobile.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Testing the attached patch, which stops WARN_ON() from firing when
usermodehelper_read_trylock() fails because the usermode helper is
already disabled during system shutdown.

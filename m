Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237797;
	b=e/JlM2YEXyYylA5D0ZqRorzSfk0VqMBZrhZCXtQmIzyWSFfAZH9lsvwcsyqzjcbDrePU
	 /pxDT4B0Nu90qmT49FOpWt+YSHQ4FD3FhTIvq0FS5uKS3nvb2Q3Nt/V9VVO+5r2HxF4uV
	 3+sTJ/T6S/JulR7xcPzagFx0HZZsbqehu74kyrky1y9Nkz9K1QdE9YUuPmclnP5f9Akh1
	 D/eHTfZsVG1chfBM59JRTzgMH2mIFlQh+5+jkn3LlA52oePkFnCquPqYKXThpMhItOXJj
	 ZUJrPltyU9Wkj7tXZSGht1EPlc0A6VacaQ3VT6jOJxrzDeDXtcsUMH/uSdId3A5rPFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237797;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	b=FmolRfSkyyLxkvbVouv6bciMx7nsX3oHHKmZIHeO5LaMAfh8j0aqHGXnO03WmzJf65/0
	 fhabCLWZuhQHu0ZDE4dYk5TA1FvJ8mHUZamiLP1H3wFwhb9JZk8uqpgPyYnkG9jxkMMPQ
	 O4Nh8l62XRkLWjjzLrgMz/Wck7fAXz9SnbBBJ3teBdTbH/cWfD2j1oqn+W2sr3GplmGb1
	 wE46ZwtslZejxXFXaNUUf0KxKdVsE3IuP1PXjeZXBXNsQgzJUkUimCKyueKahP1CQ3aBA
	 0A8U8E49ejzeAtfBu2rfHCwCJrZxIE6Do6pRLopWSH/oBCOcxQER5pLKpYS1dytiMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1261830b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237796; x=1794842596;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=gnKMxCCLknMyu/qieUAlvGLvbr0y6HmlSEqtzZFJ6UzpGZGwO225cHdl9EtCEla55A
         hFITnX1xjoUhwn/JAVDg3SvzDSoCMangGAxxpRuyqpt2werGDAKCDD3hNN83Bj12nVcI
         uzrNWmOevDZBNUZeu+46NYtvz/tlaehxhQ+BxFZvYAbXDdVAq1uXgCyeUuLPnaqNjAp7
         H+wvdT+cOXOfccNKlV2gLcWbS7YYC6elvWLXNQ+v8LcU/2ZVKVoHktzzyffR50N36gOA
         tXyUGxW6FGJAx8jvycmLhB06pMhj/faVQyRkIIANTUtDGsPh7Njy6ptOc9iQhjbLXxhC
         JEjA==
X-Forwarded-Encrypted: i=1; AL+hErFNHUQV2L7XODuH/8XHNVXHrXO7sRCoZBMpU+iUXWjZ8cjd9Qix7M9N/4URqZLdZ9ZDiwsWR5exDKp4VI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DWDRdUIqv1PFK77WTxl9nZKgb5XEzwRF6IFFtdxgH6PSEx/C+
	u6sw7X6+VOz1z82WxhhIEsCd48hrf8V00caq59BPqX8dLflhBYASJu6jrVA/rEsKjqwmOR/+DcQ
	iZOBcl8wjh2I4g2rqL+KLMA46gxHjgqjFa8Bxktf1b6p2E77RjvYVljxG3S4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f13:b0:4b9:e65b:8c2c with SMTP id
 5614622812f47-568145f410emr2419811b6e.26.1794237796478; Mon, 09 Nov 2026
 07:23:16 -0800 (PST)
Date: Mon, 09 Nov 2026 07:23:16 -0800
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af1e564.f50b2b3a.2c0de7.0016.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos

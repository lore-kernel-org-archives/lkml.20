Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105CCE56A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818481; cv=none; b=b6S7qhcaeePt5oHi6h/PVsDqTy7FcX+ItGtKevwIGrg0NxbTUNa9Xb3jQdIEIFAFnlvWJmNQwerDV3nOQuMQxxmjm0sa8uVfueMEIHSjytQAUD8XNEx4qYwsvH4FyhvS+alzUvo8uD3kuKb1B51aJerPNilAjrtV/Zi0XghL4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818481; c=relaxed/simple;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lpT9lEbdbO8bUA81KjvYXjmoKIfcXR/PQIJ08/U3aKw+43qXP4ZkgfTW1frdYE4ZBI9pqBEeFMMyn2hv4vs15ucKNW/uN8hRA00d4bCixQ/NLlOB/Uagpo2mOkRGtcbe+NjVrtkVsIELwpZVaiXiNMPPd2AuFxrdq5Rs3sETE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4519ef1babeso2574300fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818479; x=1792423279;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=waZeIuVq3mJZMDQWstX1VM54t9UdgcSEnvU6nmO8/jTHDnMMfXeOv+ChXUg3ZAcc81
         HITeQf+MkxpJ+8RpdzeELDqPDaR/SIcWqHZn/htNMBvgYiQ3FmasYYTN4iaD5b0+8uVk
         pxpi6WLItenIJG0TIRfZ7jKnUJVGaIcxZzderG7BcQcC06F+hTsGokMyPwkn+UKljsLg
         pNXbaPYzIuIlSQ3jIv1I/ODbJvZNaD6yxqex4TXw4j/lsrKsZ+upvzr1DMSk5EAPlpxE
         Wymsn5+Z5ebA7efaNpO0FSrsyCQyalJRzy23RXVYvYWCuGhUOST9X8RjfnOvvXBiSOEo
         hH6w==
X-Forwarded-Encrypted: i=1; AKwUvByspSi45s7xebgvgQCEa2197mvajPIuWy5AwtWczLgSyvD4cjPRIvtNRcFmo4TlhC+XJ4Lr04BTInCvMPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4Uu8Brk5OM0BLEfD3ILMk98akbHkfgcSBCBiqHZAJQK1w8Asm
	Zf9aOgQhsaN0WG4/TFtII6xIbmGvQpw568tQmbovLKSIt/cjr3+ItYatVQDfFcOZ7lHa4Va+aJk
	rGQgdrr1xlaStPuSVtImvnzRS9YXmga+++RHM6DPoM7ygu9x7ya/Fcr4LDvo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508d:b0:4b2:8e1c:5920 with SMTP id
 5614622812f47-50c41c9999emr10589380b6e.9.1791818478965; Mon, 12 Oct 2026
 08:21:18 -0700 (PDT)
Date: Mon, 12 Oct 2026 08:21:18 -0700
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accfaee.0e5b5d80.2c029c.057e.GAE@google.com>
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

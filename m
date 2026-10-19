Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443247;
	b=KqUhoejEsEiCBuHK7Ho9fSZrUc/FdZ/A/jgpAKY1qAp8I0YQqoO6N39ku71VtmmAS0IT
	 pMr8AaINu2tLI0rVPq9BEFASI/TQHNG3P3Ky5QWMgApxkg5p+8p2nT7hwdwsEuUhJgA94
	 bFoTYKS9P+LmJCgK3jviaxJR8jNiF2GzryBSh+pDAM+P3OCSf1BPXH93753XoKREH/dtL
	 ELqMiNGhB7nQdgpHMl1J/m1aRYSXk8pjeUUvb5h6fR6Xkq1iAIvqw6O60lGFMiXNvy6uv
	 2dkwuJxgPHvgQryiSyHHuHT1ckjWZIRESuJjd+JLnit8sufKdoP3z8h7RRWhY9qCAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443247;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=9a7ei6yh+xi2h1KYEniGfz31q9lcfn1of7Yrfu33gao=;
	b=AW7maD7UoAh5O4LySCaP4OihtfZLCGYua7JxQQGtvCcgkEZpSLkaWQU4zwcaJ++9jqPR
	 TUD5wVY30wfV7s5WAvAauKAEN3MtM/HT3dlc6YDukagmBj6NrVflYxB9gmYtGXCrnsY0w
	 w9bvVEEkhveIlLkdhbk8c1SIYMs4lJDO85aNO2h/tm58YPmk1Dcj+LhiiWOA86nuPTxkB
	 vHwxaDBrXOg1Wd4CRy47JQjCbUnNnqiVaENvPlxuUSXi0NwS9XA89Mfi791IUK20bLdhR
	 cq+9vVaQk8hW9AuzN9S0PfBusJlpvCg7nGpolKB0tHw8X2y9s1g6WWuPmfwmSi28gGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59605606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59605606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso4662323b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443246; x=1793048046;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9a7ei6yh+xi2h1KYEniGfz31q9lcfn1of7Yrfu33gao=;
        b=WlerLsDkxkQxfLGo9imKdG2y6k13pIT7wiaXSEtmd0ULXnFuZ9sZf+1QISvslWv5hg
         oVsQq7wXtw5ZltVpGOpztofwfCeBvkqPEBqLVWZbJ2co4NyguXk6vUcZAKdZzhqAQQmI
         EvhUysQrJWgJ0Mn60IQ8oIqUftKRUfMziXDSutQQH2W8CrkzcPNwVdxQuciKGxGuq+sD
         GgtienNe41SjoVgZMP/19nG/FUDYXYYeYziw9xs7kFGnjRtOKFRSPdj26+v6bPPHeXaa
         R4QpcUx2djGLV1+qjP5TeKMMirCiTtKD85I5DiHWT+WKq6hLkMayog7DW+fG11aWVtYn
         WRJg==
X-Gm-Message-State: AFq9FYJepI59PU8QxO4w0bvDVk+QTWaYYCR8CkouoBmBNOsZzZ7qoaEM
	VsJ2cNeePRBzBPuMU3QW49vJvelRMwqSLlAryp0cggyioGq/ZsADxD70xoKRM/GiIovNF0E0oaE
	9A2km6vt3/lSBGkcmIXqm/+6HxH416YofmUsdkkNZuqDcm0A7TBqU7zEv7MU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3501:b0:4cb:f21c:a794 with SMTP id
 5614622812f47-53cd0565b15mr7594349b6e.28.1792443246406; Mon, 19 Oct 2026
 13:54:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:54:06 -0700
In-Reply-To: <CAFJkwZxMKhF+EfqYrrVuA+Zu5apvaZUN45M9LVQYmxgqnd0tdA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6836e.2431563d.3b88b.0027.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: unable to handle kernel paging request in read_seqbegin
From: syzbot <syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com
Tested-by: syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com

Tested on:

commit:         7a19f0cc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1267ec95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d6221a572842ac
dashboard link: https://syzkaller.appspot.com/bug?extid=975ace299d6ba2eb1cea
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1210d495580000

Note: testing is done by a robot and is best-effort only.

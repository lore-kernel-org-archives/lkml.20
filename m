Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D433360EC9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363267; cv=none; b=cROUKJvVj8KhYb3wVz1WmY90h0HDn0vbwxiLGdmh5u57b0fAOHP/SpCaGomYvbTlVnuz6X1pAKkq+nOvRHsvZyTBbHahS3wUPrJ4gW/h2epPINJcSkAUDPM5vlOf6zC5nCMOaXiR0FK4UTQuiO0+P5zRx24MmzxWc8461+tzPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363267; c=relaxed/simple;
	bh=pJ2Npc19nfxM3fRCbj/Kh/Zutq2KAwpVYxSEyeCk8ng=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dzKl0ax22a4Y4JZyE9pSYllOCf2g37Qbbxn7i3lnoFctSfUWqNt9NecrxE08F41GIFXIKxTQbBHBZiCE34dTRe7Po/DDOddzj9qs1haPWjYYpgci/XRiNf9Wewlli+rTegErgSmhnEkgJuF93XXMatezmrntK+bqioFOCCUUo+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so4006940b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789363265; x=1789968065;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTaEIXKp8JR3zwkEUlumERyACUKUdhnyo+A8OV/WaSg=;
        b=tIqfAizTkqh9ZCry4ch3bcrdvk46Hh5+Zzy0Z1mOWsqB3Dcbkp9naBnqMq8qoRilVq
         6+zrRLnwq805co+ElpD16vxAQwYpofnAWWyfd2QDFQPmwx4hATY/r59hasgQD57OwisM
         VDtI/K0vQ4KPIlMT7efC8N0Rm7HB5tJD8nHC2ttaFCStVEr3U3/Eo3xQUjtRAOQRxw6R
         mqDPQ3JtEr6U2sFO72zJACH5n0++t9okO1aUTj8MSoEFynMIFXcR4oKdM6DUSpQBied/
         9ykh31Y7intIgesc580VKfeVfBd+uQAwkCmYJkcic5Jjm/H7op1VvEFTqcIVYsgRNmoA
         5u2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8Zy4OTtZ8Gucz0S1IHICb6abIDxwWZmpOV/D+NOI1hJSygzi/EFIaKCVQhXNiTFCiVin5PQCr9Ay2drM=@vger.kernel.org
X-Gm-Message-State: AFuF++l4QWiY4sIQTHTbi92UjkBxkae5AeqTudObb1dQ189INbmDbgBs
	eKBKFOu89T8wovhXEuj4u3oLszB0YDbKiicxx3gNWJt32l1QwO2BsKP+Clut1rx7a+0XeU89uIB
	Af9tETz8jLFfdGAsLPWHRE5VEES7FRhugmTDwXuP5TTPb6jcNc6kqBxoaLdI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1890:b0:6b7:83d6:2927 with SMTP id
 006d021491bc7-6c542343e61mr485566eaf.42.1789363264983; Sun, 13 Sep 2026
 22:21:04 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:21:04 -0700
In-Reply-To: <6aa780ed.9c80204b.1abe44.649aSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78440.f81106d8.2ab401.003d.GAE@google.com>
Subject: Re: [syzbot] [block?] UBSAN: shift-out-of-bounds in null_process_zoned_cmd
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com
Tested-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com

Tested on:

commit:         069f4aad Merge tag 'md-7.3-20260809' of https://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15cf35f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=acc0a882b963ae23
dashboard link: https://syzkaller.appspot.com/bug?extid=abd6a8dca0f2b7726060
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

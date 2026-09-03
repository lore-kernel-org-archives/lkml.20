Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B641E6CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420904; cv=none; b=mTHmCArNjEgtbGJ3iKuikcmdcHIj4ukAEn2rRHTls0mQmvObxKyBnFdBS0acwowNfIN/ZGueHdSbsKS1oN4pB98P8aikPKihq2osN2bngc21hb+shJEDE7uJr4L5dFQAhMz6boKGcqri0CSDfJvkoyWc6LfiC+gVe2D45CjvwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420904; c=relaxed/simple;
	bh=PkxrvKzvWb3F1SkAOototNbsWKeC9WjvFW1F0e4iRFs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=c7NYFRE7msYl4UqJ61N0T2ou+e5B4E8cwbRcdZq54ZRQQ0Oohvl7pqmzPQLWii5UaS1vXRaxvrO8fE8+jpDWxaC1pfbusDTlGq4pQXGs2/AcwI21a5RgT4KKRQ5twBvj+ieP1Ue5rRT22HKc8/JdX0qeKYdgCGs6CkSTJBUCG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e99ff505c2so2662107a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420902; x=1789025702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NLoKDNgFkZljVKf80yy0HoTFlUo9qExOXyKkyCU30a4=;
        b=Ebh3tcRPPZWIliaBFr3khK+QLuHi0KBsQE7v3nek6Mum4+3p7hJQ2ZegiMHidrMXOW
         uW0nj9vDihGkz2JT1v7RkodekoHPVAOL5MCt1xlcGtZT5bQ+vvYBRjBmgya8iKFjhtuB
         6A/d804MT3jWgrZofs5gnrGudrB+Hakq3jSMlf+WgY63d+Q5rJB9vJ/pmKpAlYKcrWOx
         2Gc3B7bz4a48LekGte8RmNVE5uQ3WnFwMXyyx2GtD3ojDUOOwAsWkMmOivEhCOjbgbNf
         Z0EsTBxvZTAsSnY3et/UwPttJhBLyUyCn9zgCJbrfYfCr5aXmYZMUvKQfaJtTOxLw1ZG
         RZFA==
X-Forwarded-Encrypted: i=1; AKwUvBw+oeg+XzbRhFpmtZRfAQur+0Dslx5Bq3kriwTUP4EDTizg+FrhOBuf4mkgvyTDnng1WJ5Veuj0HK68vgg=@vger.kernel.org
X-Gm-Message-State: AFuF++kCF9+ZMELveCUT0LzheMLRjdSkYBcJvK+Hgc4hHcMheCEZ3qMK
	EGY31PX6ZHnntiQ1oPLvGTD02eDHLcWvIYmyxSUiff/e6UC2BESnADgNUerg8dC+1qcGDoyJwL0
	+nABMBnBtMEyISHvp8E4s/NYLFEqqo24Anc7Q1a7ZQxX1p+lA6hPIEEM48lE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:212:b0:6b1:7798:a80e with SMTP id
 006d021491bc7-6b47ecca7f2mr8356531eaf.6.1788420902197; Thu, 03 Sep 2026
 00:35:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:35:02 -0700
In-Reply-To: <20260902185451.5ba1a829a15bb2799d121bd1@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a992326.e7659fcc.146146.0005.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in vma_set_pgoff
From: syzbot <syzbot+f12658786a4153df5113@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, kunwu.chan@gmail.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lixinhai.lxh@gmail.com, ljs@kernel.org, pfalcato@suse.de, 
	stable@vger.kernel.org, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f12658786a4153df5113@syzkaller.appspotmail.com
Tested-by: syzbot+f12658786a4153df5113@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=147d1f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=f12658786a4153df5113
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b190f9580000

Note: testing is done by a robot and is best-effort only.

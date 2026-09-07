Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D264F2222D9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751204; cv=none; b=SjAcKJ9MdPlBXv3cRoBnFs2HXpwXdzhuk6/ITLMiUyl1Wy+4xDCpV9qeeWnuZQ/bkOB58zPrqm7ay7s1v3lOnXjVo9I51YvXRtJjpGguVGKnwgkmTfQDePX8QdECnsRN3WXDi1nNPuDG1xvfvWTHKWXaIBVMr+pTX7bztJXhjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751204; c=relaxed/simple;
	bh=fn+EU/NgixioDifXNzQfwNwO4hcz2S2Dy3tYlX0v7pA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lLxRsxwY5Pqz78TGMhU+khB8D4d/A3zVCUskXgz6CmcvxZFR4xKaRZnBfsteVngicW5rIfGsLUegJ2CcgqZLG3i4PDX580qNKlvxvy0/XvsjtVC4BazDIVht5emB8GFVXHXMZF9wPqGGkzVNjnTa2LRGfCoLZtrp9GaOBhWlz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso3482085a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751201; x=1789356001;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qgLSqmjVG9++4Zf9PxueuTr/YGX63Pa9cbK9E94Lf9Q=;
        b=e2R+RZe89x/M4xa4KjjPfOPCHbYxfW5Ns49sjaJyppoNzejC6dxFPdeUg2dDFwvM1Z
         ObSVFIGkIoj+mxQjgpGUyEfGgqm/IJqhc9ujfPwMPlwyXd6KSKnLRJ4OFDHi0EyoX3V/
         JYgylXzJxk+Wnb+ELzfktnRQWeC1PaEb17T66KJs3DVNKVaN6jaa8NWpkMqO38SplP/L
         zAXOAH1nN3DYRrXaSGAfNjBcImBVDKGRzS2zXmk/Dewlb1VKH2GbVgJOeNXHzMy77MfE
         SSDd+h2YdXL1y+YZDWxsZcTBvwozukNahcL9xttFZMaI2/cMeuYAxU8Lo0A3qNrFRp/V
         5Vzg==
X-Forwarded-Encrypted: i=1; AKwUvByODyWY4jd0amlx4gIYQNYYONDjeGQ3NJFkci/be0sGpaUJHRPqDVCbE6Pgm2wtxBI/V3ui218/viFsSR8=@vger.kernel.org
X-Gm-Message-State: AFuF++kPcVLhiqJpzAZwq0Rfs3Ed31K7wQ394SUm2HrDjtqkfu7io5fq
	dYxw8AdBAGsfB4ywQ+gLQ0sce5J4NjI6SgtC4qOky5qHmnRp8ga252zy4Zi8RwYZBcG8EbKPG14
	RHc25N/AjKOWd1vf+KSZkHAUeIm4xfDm/4FZqWEUmi1iBdvAnT8i44uIxMQE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:83d0:10b0:6ba:448c:4790 with SMTP id
 006d021491bc7-6ba448c4a8fmr1949516eaf.27.1788751201776; Sun, 06 Sep 2026
 20:20:01 -0700 (PDT)
Date: Sun, 06 Sep 2026 20:20:01 -0700
In-Reply-To: <20260906220911.103503-1-ayush37735@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e2d61.a5e650b3.26d8a.0025.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_register_dev (3)
From: syzbot <syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com>
To: ayush37735@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Tested-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com

Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11791cf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13de9b49580000

Note: testing is done by a robot and is best-effort only.

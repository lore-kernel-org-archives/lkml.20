Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABEB4B540C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688706; cv=none; b=ujpr/n3NtNuhW7b3d+eNezok58Band/wvmwF98ZwLKAqrh3kx8OEX/8ZsrzHJs74GaS2qG0AufriaKBRpfMqRroKkMpQV6my3WOoA1ui1lReTHmjMqsPw5Ki+zIbNgWnV6VdQWdzqjAnIvZFLs9A65TP1FDYElck9Gjp9VNsFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688706; c=relaxed/simple;
	bh=Y9naD90rpM63ND4vA59WQPqRJjId5Evh3y1cjy+jpc8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mlWBOCWyYsM+Poma1hneTQceWNk3q5pqlMk9AGI+TtdglqAJHTxpN2kdfZl2flWUoT1uhWsMHmglwWonZB/CrYCRzsKtCiqHvpL5spnE3DlXwLCBTbr1npd4zKaIxd206SfbRasOASN1wNBBYnrjcHOBWvnKboOGEc99yGlEGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab1so155162b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688704; x=1790293504;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=18PvEyYzljJ3BnjCEris/9MRu2OfFMwCLo1RmKJy53o=;
        b=cPKNGMK0XGJAt5YCYX8G5Af0SD7wxRrIJZ4w7EU+cbeZfa+qPtXmMNsxtNN5GDDwdy
         btp+WlyOfcvfSZDwo633fRG+eNPGfOPv6d89FabW9aI+A52CpBtfV5vr+KECr/8kWQpW
         KB+bT3rqGv14/dKR94QDvghI9dAsSuhYBCrVvOazN+gMKsE65Kc3Q0Hfa3GI03zTExbs
         8XvN7AnlJvCxWJs54djyaHsKgCeNoOR4SkvncKXUgE0D3OH3e1weWO25171VEyUfv/NP
         SSEisKgbQnWyoZIQk3gui9FHWwlajl9qtcUb5Y7mHmfjR0IJbqUPh+Csvbm05gN+8ZGl
         QHDA==
X-Gm-Message-State: AFuF++k8eTDB9U9bQgWP6md7j1H1Uw905gcruhsR83URSbjnhyYbysSH
	JancyAuXFp1yXhIX88WfeEPciPVJi042d6ncExbvk7idLMKFiQEN4hhZdsTHGADxc0fXjS8PmSh
	wYEXoqshc8Aj7EZvHFRc0RzVWFroMfqyf8ccgt6P5KADVIEIJ3HywgfyJJ6M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1597:b0:4b8:4703:db91 with SMTP id
 5614622812f47-4cb6a4e5080mr3716571b6e.26.1789688704040; Thu, 17 Sep 2026
 16:45:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:45:04 -0700
In-Reply-To: <20260917231333.19437-1-raghunathpalla.0209@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac7b80.87c06881.1db2b3.001c.GAE@google.com>
Subject: Re: [syzbot] [fs?] INFO: task hung in d_alloc_parallel (4)
From: syzbot <syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, raghunathpalla.0209@gmail.com, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com
Tested-by: syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=112b38c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=e8ebfecec06a009dd2d3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=106338c9580000

Note: testing is done by a robot and is best-effort only.

Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F8542ED5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080264; cv=none; b=tam7QW+ayduaVnw4PEX9CztJYzBbtw0VYjW7LW4KEfo/HwoyzdUBF1RzfaNHFR/nXBRNCwNIs00hHkrd5KzKPsd15gkWMknLe/TcsOPNAJ8NxTTIV24E7YuAMxYDmSrT3mXBKZ7tz7/yx0StEEWxRZbyrcfiDOnKcJf6fXQ0rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080264; c=relaxed/simple;
	bh=6EvVg/iBtR+a4feM1YRLHpasuI4J8NPExSxBMT5HkzA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cuwCgt3YBT/5n4hF+RnTXlvOmOGWtUMeNN9XCsIS32x9Re7wkarnf9GpKDJq5SJ1U/5WaNDlUUX6a6AdcxwJXJzVRa9+GEIbqfR8WpY6bA7czalvp4kVlcsOYdPILAWQdpfjFQX5QD82vwHwOIzP+ILW3dmst+ZX2NQ1yhjcCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6d278014371so60921eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080262; x=1790685062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KVcHS35tuPynRUAfdJXJpQM14rt6aff9ywXsRwrhpM=;
        b=nt/rMgzLQzI/kFpgQnuLTtMCkDY4qmoraiqockkjJywdkukqPIFcWgbZWYY2hriDIu
         qhfNWd6MdxNL0PMqEbEBcvJNMfi7PLZB7V7cixA+aPCSbc7NjMP6YgJLrIWa9rM6f1mz
         RLvOPEUIChKtVtkM5bfQvs53JnM96q1GQsOMVsv30itLtC+SHfdQea8jUMKS+e+ho4Kn
         6gsYDrw5VBrIwc+A0466Cpa6wcJOJfGv5BzmbdT0xiOEIkD637p/6ozyFz4SOmBt3zIS
         iF7mtIdx+Z3ZEKHcz8pBWcMdh+vDJtux7HaQY2zKJZpzLkM5r3AVHdYJReAQyP2e/Ten
         TJZg==
X-Gm-Message-State: AFuF++lauZwsaJAptOnpRmiajcSCqcfhSQwz57gCIStaWTTAcXp/u8Qp
	V8wBcvNYODCGYQJ+5WYVk8O1nXgnHDiVzto15oOq8ORE2JjoKjyDCjnEFfBrgqoz0zSEtosYjKm
	rK3uZeW2T0Z9PjkWnsp6drRYs8gS/m4MaC+/RoR16hGVsL2LhXJe5LodJUn4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2219:b0:6b1:2843:1312 with SMTP id
 006d021491bc7-6ca972e90f2mr11409268eaf.0.1790080262302; Tue, 22 Sep 2026
 05:31:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 05:31:02 -0700
In-Reply-To: <20260922120437.4844-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab27506.71f81b7d.15fa6d.003f.GAE@google.com>
Subject: Re: [syzbot] [raid?] BUG: unable to handle kernel paging request in free_conf
From: syzbot <syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
Tested-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=108bf805580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=270624bb31d478afe62e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ed3805580000

Note: testing is done by a robot and is best-effort only.

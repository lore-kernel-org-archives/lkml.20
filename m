Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109C284693
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788078964; cv=none; b=Oh83x3UnS63xEgSV47lRktXaXpmZ/u7xc9zzwUKkZ2E5BEZc8sOS541kAacUKAkF8VMuWOgXvPEHDG5wbAs9RPEKh4Ipu+meqosJ9WM+umvT4JFvAYdebhqnJgOx2nSZQ3l1SkyLBFqw7EglHke3i7cYWtMHJKG5hvIj3mPZ5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788078964; c=relaxed/simple;
	bh=ZOddXghoua3JeiXxFvPqGA2NhajWqIMiB4tSEHdsDr0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gz4l66FWnqS1K9n8IkSxKnzIMAiX1bGzYdmIVAm7ExBVPB4+JxZ21aMLbIKSA7JqdHyYHFALLlmTR2CVtmz+zJgPnd20tGpgH0ITqVDjTlr4Bt2qwXQwe42QbP3F5A13CPx/CEQFHLPEkiC1nc4BN0qOSDrvA+tzessLmq6lbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b59d85dcso4907029a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788078962; x=1788683762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AtQ0oL82vS2kMVC6ay4l5Weh8R/jgMf8hqzYSNho1b4=;
        b=dlCNVxF+uy8dZCq88JnTR1tG1EGfcf8SSlW6yWriLD2YCiHZqGDXVFgMeHik3I9fpb
         y7TOlVExL6R97QYtLD23RlZEWK60KSVQgVZup9xTLsLHO5YEXuV5sYhK3fpi/UcGKnrD
         WycsuCq2ESbdbXHz7CaXACfIuOs4YgBQOXt75W1iw7IfAHnNzgnKjM/oP8+gOdOFW/wV
         Kq2wJmmJnWLDNfw0CjA69Qfe1HbNvMQ5yWECM7I/7GkvcT+7DJkDT28RnFETBuXUoET0
         pada8g9q/naBKiXDCpsrYtPub9aM+5rdAf54cjzHmIJ3vQQKHv9xyUUVq8dHffXxDcQo
         XoKA==
X-Forwarded-Encrypted: i=1; AHgh+RrAveh5/wgpDZJ7Mj+T2A6WVb5Ow7PmyO1HDFCLsr74C6yN4Xo8gAq2jL3G8A/wQFx1u3OwDyRgbLThXsU=@vger.kernel.org
X-Gm-Message-State: AFuF++kl3guyAx3zSjHG1u6ZWGuI9Qy2nfciPjBrIx5u6VDkO8uDKY7D
	RVKwt1OcyKmFtDrT0L6r8pyvvscQvtNZPbjREcYIfaR4dabEcOqDn/92Yh5krnd92GNkbF94CEu
	MphqXG5ywlKnjqbeZn0aEyF/WqkGUfn4KcFs22snAei+LcsPxJpUSy8r5bks=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2388:b0:4b3:1e40:640b with SMTP id
 5614622812f47-4b39800d0ecmr19313056b6e.6.1788078962469; Sun, 30 Aug 2026
 01:36:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 01:36:02 -0700
In-Reply-To: <20260830081619.17806-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93eb72.08e933ee.dbf97.00ff.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in sd_stopN
From: syzbot <syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Tested-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com

Tested on:

commit:         08dbfad3 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10deac15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12f22379580000

Note: testing is done by a robot and is best-effort only.

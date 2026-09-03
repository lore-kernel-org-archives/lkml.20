Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464AA3D16EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423004; cv=none; b=FER3n6hae02nNja7Fx9Fpv0gBqZZpfVbd0Nni9B8O1ttMfpamjhJR/ngh8NmZQCsE5bLB6QyET4SYYIBpf4RI+pu7IqXCjjskrTnqQgdWaq9yaOvwK/uo+jKjCPQiZNFW1Ap4jU/6RBz2AtUaJT7/VLZtpQInJCjx2LQqHszWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423004; c=relaxed/simple;
	bh=FNfMYXWRcuIGBhACrXQlzjtqeD2Dsc0r9mIQ76DBkoE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CMp9vL6ukljAIFVZHQ+HLx2oRUHo9I3AeIrM1CFF9RNnypubB4lDkARPPjlB6Oq3KjEyJaAqRB4fBdxUX7VFgSdQ68vLslFtirqgWA5XYsIWvaoAufrukZkMuz4lSvzliS7IwX4byhvhsNP1qkOOw/UfP1NvgyO6I48tGIitkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b13266fab6so1846610eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423002; x=1789027802;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tjfLZIVz8IVIz8V2f55JHPzhnJkxgQUaGqaYWI0J4Lk=;
        b=tRyQsF3KRaq1jpdTmvhmxAxKS7Gg4sENEXog2XcrgUFwhNUFKCNmdssM1MXBFU8151
         ALjQzK4tU/04Y3cZH2kgHxqmr5P7eoPhwc0eu2kNyDWvwhyQ/L1DQyM9d2LEHAd4A0wf
         yuzg2xH8R5zVk4YWGfXIWH1lcflSMoCSPzc4j3v+xDq/AxppfAWeFoEFv1ml+2I152Xx
         CtjHWOgO7lKU/BBRkoCLC9sJwqUo6dAWizXRjg80eS2Q1LO6RBXFa0XbKyI9ybYVvmXB
         r6l470CGf3YoUB0pdZuzeKUCbWIHVW5qblEyc7PyLDu9a2IUiFeodkSOYmDBGrKaqQAA
         4ulg==
X-Forwarded-Encrypted: i=1; AKwUvBz4DFUPDPT0ZxmE6+zIIcI5tJW6EDGviO+WkANJqrdcUgiDY2Bq42HwaYpqgQ8GVM4CsKYAiSzPiLWkJ6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mzKXwlhEzcYeeRmdnjbUDFJNSbSIOyEnyEqA+b4Q4VCpbJ/968
	dkQYBHvEtWtTfkvGDfhYFUej7LA0JlaWS70uncRpOT8qArrgRrmhzkYMUmeb8CR0sxEAbymWMoj
	cm5f1k2UvHlLIo8+Ts+eThtrC1VbA2N5h8SxX55P2X81vgECVPb0ez+8ZqEI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1515:b0:6b3:b9d1:f629 with SMTP id
 006d021491bc7-6b481e29d9fmr8438023eaf.31.1788423002056; Thu, 03 Sep 2026
 01:10:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 01:10:02 -0700
In-Reply-To: <227725e6-8242-40a3-980d-2f721a1c2c64@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a992b5a.e7659fcc.146146.0007.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Tested-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=114b1f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5bf18a904921512b
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=104870f9580000

Note: testing is done by a robot and is best-effort only.

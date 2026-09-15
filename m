Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956541D108
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466469; cv=none; b=t67R1hBnciVQsfhaYXl2G4aHNnrdHiKHhco4UfhEBkAy6+mZoHwycLbtJGBaYT2QJNg4aozo6Twz9q/AW20izn6Y5XEPSmDi6cTiUHms/v+lg6j40VXwabzm9O6B4C2CrtKq+bFkLRKoCE5uz6JZt3aAOLUF/QNbLLGXiIQ/NNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466469; c=relaxed/simple;
	bh=zcCLgqU6Udxxj0A6Rzyg7SOVOTiz79pY8+al2QLIfi0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CBvi6l2fHA0TQAIAN5HGZO5Lx2fmpSOn9MiIaWD1RqeSgABf0p18nLjvU1n4q7vpjaYiWvRljZaL+mCCdqcxj42JeGBvDT6Hrj5+DwdcAd6x0z4MB6EjN85B5OxJVOlrqGVMi5PxBiQYW8aQegGEm15bRsniJFSf2SOQJ34yaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b3962f71e7so6263999b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466465; x=1790071265;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=shKCgBsyNnzBJMPAjOwIpk0zXLRwqK22WEfeEAKcafU=;
        b=dAk8Ima3jyvyt788CTvV+Ke5ZGzR0+QJtQ4xOQroPi5xL54ztzLjY2tOazONRPPe8s
         NiSuHUNbum+xpAxKY0kWuEd2JxqALfwxjxIfe+qz2XpYWGAaRWcVlZHS2dxwTEJBoQW9
         4KQKAEUcv9bSFMVK5SWcldJOvTYlHdU5iqvH2PvZcUsUXfqOMt99VXcFD/LPivB7Zz3u
         uPXUyIexlL99G7ICq8KdeBy8RzCCz7RSvUxwbVyY4ePTeMqdlC+k+PZoU+33PW3Isu28
         00PpoZomaqmkPo3K31MKR6vQkAm4hcOttmBOITSV+LydAIULafZVHcBTmJPSDhou+OoH
         81ew==
X-Forwarded-Encrypted: i=1; AKwUvBy/d+TnOgaK6rESc5g3q9XDrgdKwcSmSVxzjXy0koQL/N7a1GwNijp90p0uV4D/lLdt48h4P+1AVojMHAE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktyT8noIvDUQFf7zaQzZqjsisgcpkI8e/Q05ZQC85bVUpWi6w/
	a2mzQwQHU2E9lXrLVsQCIMVvju3d9Ma3UfBeNHHQbSb+h9dXwUJEs/4PmuCe2lSHLF/EjNcupX1
	Pt82vH1IxJr9mGcwz3yxnIwj57JrMVkGErbM+efF0n03pvspw1lHPuSyFgm0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160e:b0:6b7:46fa:169a with SMTP id
 006d021491bc7-6c542043be9mr4164197eaf.47.1789466465294; Tue, 15 Sep 2026
 03:01:05 -0700 (PDT)
Date: Tue, 15 Sep 2026 03:01:05 -0700
In-Reply-To: <6aa8a19d.bfa0a463.33fe0e.0877SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa91761.a211d2ce.1a5198.02a9.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: using smp_processor_id() in preemptible code
 in sk_skb_reason_drop
From: syzbot <syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com
Tested-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com

Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e64df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=dc57fd6722deb17e92af
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=156e2471580000

Note: testing is done by a robot and is best-effort only.

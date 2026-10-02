Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882F44C670
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932273; cv=none; b=CkbqckL8gubYB1ARkfPc0fnrsXtXRTsz2F1+b0fwx1noB2VBjHqV2DHT9iCkjFB/wi9wfQkRQvkUoS9kb6jbyQYvdXhWIgkl3KLKaTYC7+m0+jtv/x9hIdnVgTo9X7weBVUQdsRgKI/19ylnvO1rhjCY4V2fyG0ta5BP6ZLLDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932273; c=relaxed/simple;
	bh=piPukauOAUeMNtH8t8lIio6tXfNqHWBcFgvZhwJ2muk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r39TXelFSfU0+Wq93oj/GXw/Y10bxq1hEqChqHVOG67t28Oc39fAyQX5oqo67SNUg9st17rCdPQ3GijIypwDAUcPE8D8GeESQLuefgNawW8omwoOAAil7fpKTyvMR/lkSc6frAPteFo6nCmpMmNRSk1YPRWX6lsB9pgT1AIwgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so12351242b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932263; x=1791537063;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WK2sMtNTWDSTkYsqFzYqK4WnE0J4ThcggAW/wKcAXsc=;
        b=TBJj2LFsX1yQbfTg05pptXFPiwiNAgbCe5tkDheNl8Ghd3H3bhJZMe2S8BQazgygxd
         si1zWhellQV2FdrZgojevoLOUzsqLwKYGtLzcZpdMf+djODnp2R2FKamyBZkzivJMi2h
         bLLDDjxRF1DWExxFdIJ7svHpB5QGVojj4iyv7JvweNCuoP1MD1vOxLWaMhKHqzO1/cHa
         mriJ9YfTN3R8Rpzml3OvKKpQiSOiuWThLCtJSdKzTWM+/GwUvet0ySgQM3sJj2G+aC84
         i1dejJBQd/Upl+JKT5+Zg43ak6U9Onod/l1ooRRxKMjAREvZawtTbBS4trHSF04FCmFJ
         IcBg==
X-Forwarded-Encrypted: i=1; AKwUvBwfy9vQoDiTDuTaHgcfMhTT7wktoW0JKj4JxvtClxzy0HGuzMA9jV/HQ9ru382Y0yIIuaJ3XwtvOEinL5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lurJFEawN+0OLfXWpCtBPSuepoRO/hoA7Sg7q2bGPM+/6BcuOp
	NTTs0JP6COO2v+ian7X1zzzq16M2aH2qD7WLuGKMBGx6S4BVs6tRky9T0fw6AjIqrVWb22pJ+Tv
	8msQVpx5H0pYAbrgtAAHxqltZ4h4xQt2bDytzEgJg8hHqlnplXiDL80ryCGw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5396:b0:4f3:e029:1d5a with SMTP id
 5614622812f47-4f52376f39dmr1383279b6e.0.1790932262881; Fri, 02 Oct 2026
 02:11:02 -0700 (PDT)
Date: Fri, 02 Oct 2026 02:11:02 -0700
In-Reply-To: <39106200-88a7-45f3-b79c-70aeeb77aaa8@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abf7526.7503fbd6.2d3f6.0018.GAE@google.com>
Subject: Re: [syzbot] [can?] memory leak in j1939_netdev_start (2)
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com
Tested-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com

Tested on:

commit:         ce1e0223 Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1233f3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94b4b0fa252d90cb
dashboard link: https://syzkaller.appspot.com/bug?extid=489e907b2a026a6f5fa0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10cc6035580000

Note: testing is done by a robot and is best-effort only.

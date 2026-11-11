Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372363;
	b=CkBVluT0bVKwuoEwz33I63mUkHElIo00jU8teUAVaL0YvgbJzmY7vV/ogVkAW0w32WGP
	 xIcb0QR6RZIGaI5g8WD4MhnbLlH1GMRLbYRBLySBci4NxMKoSuo3laNCEdXT7RB/S7b/s
	 F2UMoi7P/aNT85QIpsNu9uv9GbrlCguUPLUwhY1+vWNbmy0636Oz67bOv72G+8HLmipOt
	 VowrMzKzY9Qne9l70ExuyDL3GlcFfi2pB8T1sIkLQwYhxfXP8a6W4fgZ2xJM0NWOdHt2n
	 sgtljfVvmrW6JzRUjJgfJ5wlK2xwfal+2mn6VlpqZd2y2q9Mce1hTry7Bi+SMuC7nnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372363;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tc06brEby95ail1F4lHOJFrAbzbjGxWAEQqRmICG19U=;
	b=TGlo8+VOVV5ju+yd1HYv0HVYIfza1fc48GzVo6W2QY9Z3pvZrHcJ8BATWANXP2ZabLIF
	 JGWnqGv/VqMnOU6/WcMkyHDSbiaDsKAjON8i7OjS1eairGHyqCG86IBj0EaxrkG9G6H8g
	 ygEuNdP2ZUaG+UfrIVRferAntOB3DwCg4vPBKWQviuys0xOEvo2Zft1V7IP8XZknaFfML
	 krOy93ZFo9uMkc7oyjkkM+Yx/kt6Izfo7XJPGcbDP2o5ghQkn41k9rKxZEJJCzJS1r1KO
	 4OI+CZauD3dX+MZOqNYkl81LOu+zs8EcYt+mI8nAe+AvCMwKvFLpJuFij6MxTD4KzVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404D606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9404D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-823d73ffca1so3357459a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372362; x=1794977162;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tc06brEby95ail1F4lHOJFrAbzbjGxWAEQqRmICG19U=;
        b=p1lm0Un1SL4io2zHHeyAvkXONx/FmmLza3OkYBevV75yJhPGEJgNAbkIzQs5MEic1Z
         J0rUx2Wme6xzdlCg38gXIr87q5C1p4m/eHRSuJjCmNjaU4zNHDGMA74nwye8YZLi+26g
         LSD1MIt3O7h78Kn9lkRU+6a5vLDtC7FJ/9QMMC0EVtRDGjgtsZg3kpcSUMNvR2iM0tFh
         wx0N8tve+ZYx3GzFcNKqhsyKeHOm/DsIOw5f/huF4fxnFgAB3dAgDnh6YyG/ZVhssIHC
         0ImGs0QT5kI+07oKCfL6pTuyUkuN3VYYUSLr3Nmju2LAAoLsFn2UrGJlozqJlMcKS0O7
         bohw==
X-Forwarded-Encrypted: i=1; AL+hErGE6vOCMbyNPg4jJ+2ciii/TWXzvNuqpwA4y9Xb8b33ImFbDItd3++FUoKel77HJbXtdQuJqqdzLtPA4GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pj7oFe7ncEuPKO/TUyaZfa/jFVcJkgDo1HxXVPbLFkEJ2ZP0i
	or0PZinQ+z+L5NeRamY1+tEA4CydqO71DCEbWWFVbm68d9FZl5Mwvtf+o4vY8PWXtbIwhBSP1M8
	OUbGn3oN14EvBBUE4FPMbw+Y2P5mlPl714NwaBcOs+5XuvcSFiHC1AzMUr68=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c123:b0:4f1:a873:6efc with SMTP id
 5614622812f47-56b98c19490mr1069217b6e.64.1794372362344; Tue, 10 Nov 2026
 20:46:02 -0800 (PST)
Date: Tue, 10 Nov 2026 20:46:02 -0800
In-Reply-To: <20261111032743.549426-1-diasyzhangqing@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3f30a.926a6ce0.263fd.0199.GAE@google.com>
Subject: Re: [syzbot] [block?] [ext4?] INFO: task hung in bdev_freeze
From: syzbot <syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, axboe@kernel.dk, diasyzhang@tencent.com, 
	diasyzhangqing@gmail.com, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-block@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=d4ecb9a1e5b3dcf8baec
compiler:       
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f58b69580000


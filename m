Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAEA2222A9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790992926; cv=none; b=aDke8+r4VoJTlE4Wt74Tuy8+uzSfXHvBRefweQaLP//BlZKqaOjf/0L13MQ8rwyBL8WSKL9pNyQ1xCs5iUzmQvUVL961VM4/yLIbOZ37JsWkS9E/yBjYztEyr3VBd2BdU/3utm9X5PWhqCGrejCW+JaIRaxvBmtQoj6m+tg2F44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790992926; c=relaxed/simple;
	bh=n61lzYpRXgB0mG/gyj704Pvqr6bacjRthTOHdtSM/Pc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tt1/5Xy2Wt2UV59oPSNnKAVSFcpGJt0d1kIBCNe5ZXvjuCXjOud5z7kFXWPY76Ewb+dM1pQXRawmBA9lESttkqthw7NHSpvlQl4QMqNeAwO2kCsggWzILVk5gZk9x4TO0UmRUc+VZZFuGg+tqsLZQJ4H2ep9Do4t/KYXw0+8l3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cd3e90ff97so24590b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790992924; x=1791597724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IW757ycUVKIumf+GXOXhQRC7YByi/BrIxe7PfpkHuq4=;
        b=gukT0saR8DO0+m6dpUXs4M7yRz30jCUXHp5u3EsyRFhYLDRi8XVIToAI7foL/FqIZ1
         5umEpxRDTbQRPFK3mz/8/IraUFt0kYOTg1q0uExpImcLrwOi4VVJfp0r9KA+XgZ8LFox
         ag+jacoFAJmzkWYORqt2QJrOm0N2lBCX9bBMrkmvXeqyyvTADOgVDzfPDXqrzmlPASr4
         qToAnMOoj/PXiyXFZ2Ec5iwVEYkq/FAcDotV3vWnClfdDxRszjFYtx9SsaeALLtvmC/3
         GUnR+aD31cDNxkOIFu4XFwtc8PeuKGlwqLxuDZvUBgQ05BgZwBKw845qZ0/b2iJTWghF
         hhzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8urXfDYLfqd/xaJ6pIrLChwP3LdoNmbM2BYDshEPFrKNLvVGsDseh44TLgMQGwJeCZD8McDeOWB8VDbA=@vger.kernel.org
X-Gm-Message-State: AFuF++lR0MeSBiTOskRWVSzjpxi4TqEK9kBvus+ntkMoQ3aaRDAlokvY
	JGeo4mNelBXvwV/D2LEW0vKCzcuSrzfuXxiyncbLs3pzIymG/0Fcxk+9n+SsuT48iEhnRsJ5ToL
	wO2rvAvz1xlwB4PDGaNlJ3rfiOc9UP07wqCbCP3GhMOBp7eWkcYrq1wXymRE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1585:b0:4f4:3088:e536 with SMTP id
 5614622812f47-4f5288bdb62mr3469211b6e.16.1790992924121; Fri, 02 Oct 2026
 19:02:04 -0700 (PDT)
Date: Fri, 02 Oct 2026 19:02:04 -0700
In-Reply-To: <20261002230851.103334-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0621c.9ad129c8.3858c0.000b.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com

Tested on:

commit:         ff47652a Merge tag 'cifs-fixes-7.3-rc6' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11921035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1556db15580000

Note: testing is done by a robot and is best-effort only.

Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D433EDE59
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418084; cv=none; b=IgAV/TbWzv270t7OUO7+mM2biLQRmjVjRwu3ms4bR14FiRBqLnTOSRtMePtEbhbv0wZleUM79VX0zoZ2MEuprg1Z0toTXJJrkRyC6RKIRsiIU9ktMCR9QUG4v7ZN1FE5lQ6l6jcvS7VjhlQ9R11JdyPCfgCp8HA/PmT4cAfvv10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418084; c=relaxed/simple;
	bh=qiQIzwdJ6t8cRbZj2S+yexnJDf+p+W5BHoaGRJtAgiU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V8FQUVMV+wsKttaaDeMujKaFPSlsA2CkE8nm5NP70SWouJQcFgPg6152cMdsduwxFSS4/ukqh7GEpWo105OsPsQnI5lTtuvg5vTdS7i3RyVnbStKy24ZG1fncG7+GOMhTzNOrqFmI3VugHIyjsTXMxEzf2LQZv+88AeJHoWzw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4e52682f0so2170930a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418082; x=1789022882;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geI/Eer2Jk8SAOLbfwhlH6e0XOjJoEfyZTAqMkpzv7Y=;
        b=SU8XScMhyw23m9s98tq1q6pHqW0ul7jqQxgvXTT9wuY65mHY/DaPxqrs0a1aEKwH9J
         mfDQmH7Rk2f/V4+dT8zmraTurGq3FsM6L5ZoqgZ+6CbATmCQtlj0kGbe0zkbQae3cs6l
         hrBn4m8Wo3dTI3dFVW0nUy1oEuqBClPW2+M4vnBqtmWarbGPKcFcV0ZAlpFnRvsi6Xk3
         CVqHS+l0j44IXC2Kqfl0KOgzBb1V4/sRgg/SlkfeWXKBoJpPPjgWGJ7zpLgiGlMKcNXQ
         GlxelgEjZ6PR3konF/xgca3VMibbxmC7+uru6b3qZGd7D82ET4iUaVhwNYb2XQ6juNtV
         4kNA==
X-Forwarded-Encrypted: i=1; AKwUvBxlJUI0M4KXfjjsxvu+maRGXwaq7684FuocTGMhzJc6jsLGAd1QAIzZukdhhZTwUWL4gnTWNf/8vqr2uNE=@vger.kernel.org
X-Gm-Message-State: AFuF++ngs7RdJG+O8LXQDBiDtmDgEVN+OtzNdlCYTbtE2ET9Jt59Y1gT
	S9OPdFin30mvtEttB3p6aYheqxrrpKhImcCEYdKolRnHjb7bzpxjxXOxdJVSQrDKw5Tn5zLlEWQ
	iOH8ZlXfyc+AaI/faCybDG6ZXAgoUTnxvkHg7fJYdzFAPNi4AANbNd6/Iz3w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2004:b0:6b1:3db9:b758 with SMTP id
 006d021491bc7-6b47efd5f6dmr8189943eaf.9.1788418082301; Wed, 02 Sep 2026
 23:48:02 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:48:02 -0700
In-Reply-To: <CAEe5be47K_b9T2oaFzoMVOKnxLjghNHRhq4Cg-seooBanxMEVA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991822.e7659fcc.146146.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14951f79580000


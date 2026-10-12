Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A203290AA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823504; cv=none; b=WtrmXiYVNZFOcagJqttYjRbeT817b5uPUJU5+1pje9gOzOSJfRUkztlwhN23nj/qsBDN7RPQ3mFY8TPsAUqdxtkHOPbHZXh/RCKvjHzShqm2+9kHmlAvSSG1NnI+RlZnrmcnDMu8zchMI6vgsfEs6fAiZ6CGczbw7O1X/SDV6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823504; c=relaxed/simple;
	bh=orvMHA0tK0NzLwHia4UVEvLA7DgboKzQltKRh7ise58=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f6tywTlKsM+Gv1mWMgx+Nhw+0eSTfLQtJAMS2mtn3WpwzMbvug4kAQHIPevBus6czA6Qgobe8fvjhFgaJCD/ZVog731tzPvivIgfAmjWbCsBTd9xifI1xY/GITGV7a8fhEeu9GpJfys2CdZPJA0o6yKK9BogUPulRz3G7XXqkOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so3807139b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823502; x=1792428302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MtfVgGXZMMx3Yl+dn2SsazaLYN5GZhxkboUwj27h+V4=;
        b=Yad3sQNfpWz4Y+laPUBJWM0m24CrOwVOww/LCoNkPWA6vT9lbkKlV2P2fDOQcEhfvM
         PoVLYLEcUWp/hMAQ5ub9ol2R5xHn9G9lwv3htuVTVxOloE1fTPfH4eqWtDsIWhZ9f1UR
         u8gxWRcJHD8m5jeL87VBc4aweRP7iMpb0PcupEwBys5ORYCpVFCfDCmsd4Kyp6dGARwo
         chCqIXb71xe+c3QuFURomljynRMNekgjmz51iNrb5OXQK8d1ZOpIh1QH1FG/3yLTjxD+
         EtrE5ujJRNZhY3LCmT/K+3wnZeNOX1DvfvIiBp1olP9Uqg1+L4jxVmK76D0uy2AOwQ0E
         CJvw==
X-Gm-Message-State: AFq9FYJ/t0u7oEm0Uj8Zz9JL+Rh4J5nIXUu0xATDcxu2aAsRqML88+ba
	PPKj4Vjzz1cliQ1p21wPPTf1IF9dpRiPYnYhomCdi7/EQf5/UAdnm3Bdr0IPhYjJL/BIaS18D1Q
	uxbXyL9t5YElh0dKggqjEu0566fatGxio3XhEvxA0RXTM7sz7GEs6IjmeR3o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1303:b0:4d6:9222:99f7 with SMTP id
 5614622812f47-50c59e37adcmr8114121b6e.55.1791823502302; Mon, 12 Oct 2026
 09:45:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:45:02 -0700
In-Reply-To: <CAEfrx+BVayni5vLt7vDR7bLM83OKYB-GqhSfJxNXUH=ekqniCw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd0e8e.a150a118.27e199.0051.GAE@google.com>
Subject: Re: [syzbot] KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=181b8b439f5207144b16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13fea9c9580000


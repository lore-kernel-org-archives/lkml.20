Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C1425887
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279188; cv=none; b=kLOfPmPSfVw9I7V3VlPmcEM6kXr9RB+ea2wxF8zd+gX0YwwNB9gpfX14sOiXrVrKF7FaMR9Qp56fqSqbgvGknGRqUpzFmEr58JZ/8ZTKuPvZm7l2kWPjS391YGe/Ev5Zz6I3NU43JDff/w+rUAuhW+svrUnEssMxVzTSllzSVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279188; c=relaxed/simple;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LYeaQfjQ67mZb5WbqxzUmIlF74mAHwYqOYeGw9HNCiLlSEE0TT6DoG7Vh/qbx/0nm2no2hXpzdRfPbLFwb0ha0tR9Tpqw6XNIlqRPub0tGgmx6mthbcwstTK1NjqxVpViEjOslz07SqDEJhLHKso9Hs205x9gpsmxyykZWSJdaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e8568ccdso235346a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279177; x=1790883977;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=bF/AKeYS+lxOaOdjmDxMaXa2K1FNAmK1KffN7MATjGxH/DQsiQzDwo3/DR/Uiuj+SQ
         rPwzmlz2Zt9F+Ccxb73utkVV8POP3f1bTQ8XSt4//5bPHcrJ5Zxf69Q9tZ4VrzQ1lpRr
         RA9HfY05L2Ilh0DBiJBg9i1Oap1xj+rqB5qFlU9FPMYNhTK47xJPbPsDNSTouXk5npx4
         H4AyxueFPscgnrsSPebsqRL6zodGMBKdswv1H5c67iimWJg6ihZqokNRbijkPSrAQnXn
         NlGhbGoVuouMrpYNzxdFi+/TIY6UMbjH7LVvhGyQfU2QwFboyvkWNbObvKq/A0gbSfT8
         E0Fw==
X-Forwarded-Encrypted: i=1; AKwUvByFRoR1IlkOJk3jnGn5HWbMSuKumMdtb6WcIYDCzgqkhnqg80DkfhgNS0GC5tqEDOUP0L+LKENm5Qu0eWw=@vger.kernel.org
X-Gm-Message-State: AFuF++m7bF9GLUvGBrtir4IT9hcq8/f9mm/IrJdienSjtu47tUlAVNbo
	YidUlbU+d3ij5YuS7CCoefeweAncH/lv/S25oJqw2YPR9GbU4pQqvyh4v6j99yI7fSJv6UkhScr
	yFkJwBGFMDLydc20iWb5pDT+QrG3Ctni8NOtHXGYQUV9gZxwChN4v8YV61wo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1782:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-4d72aa5b90cmr3716886b6e.36.1790279177126; Thu, 24 Sep 2026
 12:46:17 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:46:17 -0700
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab57e09.80e1c6cc.1e8e5f.0017.GAE@google.com>
Subject: Re: [syzbot] WARNING in update_curr_idle
From: syzbot <syzbot+e671c2192fed8645642e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
c095741713d1 sched/fair: Fix newidle vs core-sched

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e671c2192fed8645642e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos

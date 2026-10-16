Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EE13BADB4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168809; cv=none; b=F6sMRBMC7gYr5bhG5TtdsuD3yuyc5AYgV/qRlVipX+lh4Fifld/MFUIJby74KZEQ/EWBmYa/PbAuZOHgvMFF+LOh/4etkPBV2Dy6/LXgZcklwF2IzE8zqulUPxWr1+ViPvqkI0H7dgikBXZYfuIvQ+en5SddUmg1zxMIJ8yyj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168809; c=relaxed/simple;
	bh=sG/hsw2zTVHQWmhVdEV4Mi5jk1bu9PL+pZo/8vyP7Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mSGr0/t9DppXUesTMYs8wKVOxhytEhZFjVIyy14ksgfkRfIKPBGb1XK3xg5nZJh11gpdjL+MtqKm9BCVUEOF3USDbKCJgTjxqDSIrnWtbsmqPbqR4Q6MtUuiYdug9PFg/kB+wnDNgvL2HmmuPMdcK53B+mrWXgsMl2xgGMVU5Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NANa+tt0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NANa+tt0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso1620615e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792168806; x=1792773606; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVbOA5btR1kk2DQy8IP4i6cGZwxte5Yshhx2fKQeaqk=;
        b=NANa+tt0gX3sDkd/+RIA1xN1mQ7c6A3ar6B/Ar27U+m8od5ZNBnkWbFye9qXKMpykX
         jtxtkn5dLHsWbSLt16ER7F5Z+Q/KHUxKaKCXoQki9WwvvH9YtIn9pkL/XknT0JnrfUBy
         +OnfyJq7CAKy7a6jnVMu+I0uVzc9jPZsgIUqDiv5ILilOFp+Bsedxn6xaXML4kGaSxck
         c7OX3LKEDQaEFTVLQLLiQkoGc6fzPX6Oj8hDjiICvTxnAkKoTSAm8UwkHwe/K7LiS7iK
         r/0VZN5vZKbKnZdcZQ94cEf2yF2qHgdMe1tKV227j3G4vv578Pc6UKYK2n4B9NqTFimy
         BDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168806; x=1792773606;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVbOA5btR1kk2DQy8IP4i6cGZwxte5Yshhx2fKQeaqk=;
        b=0fGAaEiSmmUsAPbxYGin/C+9WxIouv7tSO5LuCna6J5ecA+WSTclbos0tdOrbshjp5
         AqEv1SLWV/iScJDQrtiI415Hf3CKsOswCRnnvH+SPNJnNo/FucuamYNjNpZEZkCZe60i
         3WQeI5ar0ozTJ5vUo1s/OulTmEo09z399qidGjM4wx2XQFCQClujxBRL8FXBFwrJtdaf
         GNWbjhjITxgLu+ynnRGcJ9y3Dwvm1eMKjiwXo7qbkYzEgOKn3aQfPdGnhmVVu4EEw6jU
         qFg0EpIqL3U3x8SgN83sO7YQc7xfhx57K/ShC39D8s/iZZ2hkuM7uA9YHbnn/WSeaAuE
         CoHw==
X-Forwarded-Encrypted: i=1; AKwUvByBZq3V3znAD8mClBooeIrTj5+FwLwtE8+UFvaD3PRk8UuUzFSrV5AER5FSyuLPeCBR3ttAjmf/EwolTao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFxvxeZOD1vj17f+bTZIp8rhUVTsmX5vRMiKx0i8mx1NQTQETl
	jkEJQlMI4gKlbDRs33ikBvzrxvLXE4l1Fi6IxachlQgj+D2w4e7ZIPVGOvPuWE6qmdw=
X-Gm-Gg: AYBFou3wpQ4nfocYUTsq2HhEwv3G0briWaCbZAZ6xVL1ilqWRe0DyoWYMbmFdAoODdC
	qfgveIJHoiGGiYlmC8/5chAkEQhF5/M38A1m54T4ERx79IuyvYJXAMq8emm9cvm0wz30+sfefKw
	IOvLXkOYHz4PiSZ2CqoT7Gsf1IX4shupOeZBKjC3vgl/luq9fNXyHxpPRL1cwN+b0x9jZbR0wBW
	W8KCdK8iQzjTgBIiWinQkEBkjjimJP4/94nH64i7j+dHmilYYgdZUHrwgBBrp+2r8iSniIQl1y0
	wvIa829ZZV/MgCDYhx5HXkg6/eyuml+GU/lbOuMTpID70OpGAoGizEL9nb/IlAK0g2fbLvtJXVU
	4YjXgr5UFQnWE+a+E3kJXncFmuY5qJTsucTn6wEoDhdqGTpnLYLLu0FV6AmYKmmZPpDWpJZnyKO
	4642pKS+5FkRDU8aQQx9iL60UfMHRRXyweGvAQjevovTbbQua3LY+dIHBo9T/OxBxxYL/V/O3a
X-Received: by 2002:a05:600c:3511:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a1d7613789mr7971465e9.29.1792168806308;
        Fri, 16 Oct 2026 09:40:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d080sm6302732f8f.53.2026.10.16.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:40:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 18:40:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [GIT PULL] More printk hotfixes for 7.3
Message-ID: <atJTZAhzySxopfhH@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull 2 more hot-fixes from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-hotfix

================================================================

- Switch NBCON consoles to the emergency mode in emergency_restart() to
  see messages even in this shutdown code path.

- Postpone the start of printk kthreads after smp_init(). It prevents
  boot stalls on some HW.

- Typo fix in a previous hot-fix patch.

----------------------------------------------------------------

The postponed start of printk kthreads obviously looks like a workaround.
I wish we understood what was going on there.

It seems that it happens only on some (likely) older hardware.
John was not able to reproduce it on several systems so we were
not able to put hands on it.

We double checked the nbcon design and were not able to find any
location where it might cause a deadlock.

It rather looks like a HW specific problem. I do not have enough
experience with HW-specific bugs so it is not easier for me to
focus on some particular code path. It just seems that smp_init()
is not happy when another CPU is emitting the messages on the serial
port (manipulating interrupts?).

Anyway, the change looks safe. It just prolongs the time when
printk() tries to flush the messages directly even on NBCON
consoles. It might slowdown the boot a bit. But it won't be
worse than in the pre-NBCON era. And the direct flushing
increases the chance to see the messages. It makes printk()
more reliable for longer early boot period so some people
might even like this change.

I want to continue debugging of the problem. But let's move 7.3
to the safe side.

----------------------------------------------------------------
John Ogness (1):
      printk: Postpone kthread startup

Muhammad Mahdi Amirpour (1):
      printk: fix kernel-doc name for nbcon_write_context_is_braille

Petr Mladek (2):
      nbcon/reboot: Switch NBCON consoles into the emergency mode in emergency_restart()
      Merge branch 'for-7.3-hotfix' into for-linus

 kernel/printk/nbcon.c  | 3 ++-
 kernel/printk/printk.c | 2 +-
 kernel/reboot.c        | 9 +++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

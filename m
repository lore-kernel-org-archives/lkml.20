Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2F48A8B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944929; cv=none; b=gokv15/29PJtBgJZpWulqRSHeuV7jMhn7Nxv8BkEzHQ4exfqXYKBbuRrc26/xwmvNaA6mJlRShj4lFZu56DeH/Qv9UbThtWv6qGheS5G9n++F1erIQIUwpzWl4HUUvFp2KOuV6WYZlLsIpF3Bdb7qEbfcPPuSPOZALmPqYsi3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944929; c=relaxed/simple;
	bh=6YxppO/2I2Ks8Fjh2EFC+veXF0DRkzmq/2qtv0lTkCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/Cr2UP876aYb6kFB7rbmsMpcMIB+c/yBpZx/w5kYAuhuUln6bFy1L2madqWp5E++CV6FTMignN/EUGt4kvSXeRlTa3++p2SenKNx+J1H53VR3mCYqcG6HlDF/13XwlBUb/phHIq46T1WaDvnxyyg+xr2a0FPAGXAjlP2XJT5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DkiK6ART; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DkiK6ART"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso59590295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788944926; x=1789549726; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrNuzwqRhqvFQLVRvAju0JJb1XGDjs6HTbDtOW9hNGM=;
        b=DkiK6ARTKQbIGiAfqM875DVEpNxdwWI8O53sQ0mok/rJo0shTCyGWdaeiwWe278Q5p
         zqgoGxoHC6bCv9XG65n4QmQAyDhgvoblcsc2rbWlmmFRJOGDWMmD0zNnRuquE5tSgRuY
         rM29M9dCDc7U3VuUfry4Eiq/6w1qVu510kMqwN4lTHMZMUpQZ+i7zqqZrQUBIpt0VziE
         o4LNuN+1Ya9uZnEbZrbjqisIgndHcR2CQxUubRJOhjHNa/EaTLZsxc/+Y6juZJQBLaQQ
         cYDdGX8iArrhQl006vVK5rsVR3s0SKptis8am6thf/oGtulGhqq1GVvXCxlbg5/nNtlS
         mK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944926; x=1789549726;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrNuzwqRhqvFQLVRvAju0JJb1XGDjs6HTbDtOW9hNGM=;
        b=UBMsGKmXj6o4wTS8HKtFWEk3wDwl+Sh9EAk3xVsGbslG6m/oaFtP19StJXP8JEP247
         QqkG+XKr/2krdhZaq84WB6u91SsldL8i7lYbYyIGTRvWwyQ9YONDhpLAeR2aW0FaBFuD
         iBPRk/G8rTNwTWkFcGhPA2iozqCbDLi9nUpmtU+2IByS1LcMyxWjLiyhciANDw+XMyNJ
         wQzo23T3rdjJFGV+phn15AUzPgng61t8uicCY1qEq0KAJnoER1BcIuUrI16PFfTSi4Mf
         SRZWa3qlZws9lgTTbJztaSQm7gBQTDQGK3pxd9F4AXQIAWCmGoEkk65noLbFzc2K50eS
         fcqg==
X-Forwarded-Encrypted: i=1; AKwUvByd9+72ZeQN8Zc+SvkuxneAv78p6tZ4W21uyyoC85lOvUIZb+713YMTaQlTiud4/RfaRn1yuheiJJNKSrw=@vger.kernel.org
X-Gm-Message-State: AFuF++ngAQ5XRgQLrq2TehFvG2KUFpx4esuok6JOhBTk/k3zTL4ctGeC
	HETdqoVsw62UCpVRXHw029yN2W8apd9RBYKYJsI/j0VltR9yIh0ZCB7zH1LT/dlBWPg=
X-Gm-Gg: AYBFou1MLQACY0eAbtpfJ2aPy268Ve8l47lWOoeQF0jKdOTBEmTt4ZDQ66SUXIgA7Br
	Wa+ttzJ2P04saEYHs2QIuuSArRGOXlC6yBWEkRqQriZABqhF1UIN3mlBJajPRbgLJ4qp+p01o0O
	SDTPk2uQUWk4TpBsBaDL2NMB7OkvluKRHTiRRRFMYKFJR+YscpvV0LNT4wg4YX6RWCBGW0fpAXN
	Cl3RHdOKRJsu/cCH1APp4Y6rgX5f+hH8ZuQ7orOHSgY8Ig2QHwkaZ1xV5vTkiDwseNEi9azncI6
	C6k5fPZWepOpPqW0HG6d41LskeU5ix4rkMl2oQaH/A7+ZxGQ58hRwtSrUnrj/hnBcaEnp3PIXQP
	lL/yMjWNEHWLoZw/uf3nH5AQR0/FwmFaG3BoFO+fY7hFKBN7iE17+1iZynfKb1dABInaO9UBvYU
	5RhgrKSUc3jGSjeQwE0b+JUzBkPAE8OVuQziWY/hY95KZpWKg0OaFAy5aRcyqBil8XXYwFJdhV7
	iyG8rjptcKlSZo=
X-Received: by 2002:a05:600c:a00d:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49cf81e4a05mr319450715e9.2.1788944926305;
        Wed, 09 Sep 2026 02:08:46 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm517302385e9.7.2026.09.09.02.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:08:45 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:08:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [GIT PULL] printk for 7.3-rc3
Message-ID: <aqEiG_01A3T0XhFW@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull some printk fixes from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc3

=======================================

- Use lazy irq_work for waking printk kthreads.

- Flush pending irq_work before destroying printk kthreads.

- Remove redundant WARN() when a printk kthread can't be created.

- Typo fix.

----------------------------------------------------------------

The primary motivation for making the irq_work lazy is that pending
IRQs block suspending and entering idle states on Tegra20 and Tegra30
platforms. They even did not boot after converting uart 8250 console
driver to the nbcon API.

It should be acceptable because printk kthreads are used for
non-emergency messages. They have to wait until they get
scheduled anyway.

This seems to be the least hacky solution which might even have
some positive effect in reducing the IRQ noise. And it allows
to keep the converted uart 8250 console driver in 7.3.

The discussion about the Tegra problems can be found at
https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com/
https://lore.kernel.org/all/20260828155811.270462-1-john.ogness@linutronix.de/

----------------------------------------------------------------

Johan Hovold (1):
      console: fix /dev/kmsg reference in flags kernel doc

John Ogness (2):
      printk/nbcon: Flush nbcon_irq_work in nbcon_free()
      printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY

Petr Mladek (1):
      Merge branch 'for-7.4-trivial' into for-linus

Tetsuo Handa (1):
      printk: Don't WARN on kthread_run failure.

 include/linux/console.h | 2 +-
 kernel/printk/nbcon.c   | 6 ++++--
 kernel/printk/printk.c  | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

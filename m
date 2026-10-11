Received: from e240-11.smtp-out.eu-north-1.amazonses.com (e240-11.smtp-out.eu-north-1.amazonses.com [23.251.240.11])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CC13D53C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726149; cv=none; b=HL5CLakaO+aEwMduXiM2XrycHbF+odbkbJcUO+xd9sqzqmH3yR/6hSoikznKjJ6ZUbVH3cGN9vQs8pwJsJf9Wmb/93P0pTH1debDkrhAatHoL0Tw1mESimLJjyBLdoTTTMCZ9qUxTHPTqL5R/+kADhdtH9ukGG+R27EXv7ez10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726149; c=relaxed/simple;
	bh=hfQJFn70VYAXWozUfLYnW6KfsWKdzbG7zMERoEGn1r8=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-ID:Date; b=RD40p5WvsTURsi2bYcElYm94HANTi6kzh8M/lT+XqV2GxOECFiF4aDKt8zAt3zU8IwbPXjJOy3GYcpQPJ+8iA4xkIxuo+s8dIj+o7qTOcIeXBNLlTvM08MT22uBwNIZrkkd6FyzcIhqrsGhQFe5cd1tQ39Rcw8hfsCQqbHMLDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=omail.sh; spf=pass smtp.mailfrom=bounce.omail.sh; dkim=pass (2048-bit key) header.d=omail.sh header.i=@omail.sh header.b=DZoShlvz; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=0IzOc23b; arc=none smtp.client-ip=23.251.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=omail.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.omail.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omail.sh header.i=@omail.sh header.b="DZoShlvz";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="0IzOc23b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zxgh36y5xmxffsfhdraqlru6gk2j7i2l; d=omail.sh; t=1791726146;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
	bh=hfQJFn70VYAXWozUfLYnW6KfsWKdzbG7zMERoEGn1r8=;
	b=DZoShlvzV+fbA0qw4CWjc6pcs+bWa1WYDo9LqmNgRJ4A5ONh69OXmPqlPKsEpeAX
	bVrfYTLh2+4dpR6aTMrfvoxNl4mFw1tCdjRC0XF1aJyM9vN3K1OyMrlA9qhuXOjtLIw
	r4136g9kZ/iiMqG7siFfLcrfxsd1W07QDiHkHNaL3H7uKIzlbXNYZYnfXL1jPi/ZQhU
	8BL2oLi+RRNH/XIAn/cD8ks5T0vxgTrK1VkEPha1PYO6ETfCLYDQyL+GQGdohYjbbd4
	wdx4Fhug93JAkNU3YAVvGR++h354cWJ30zVE0htr9vABqf80BWUhj/oRJJ9JPyqSDGS
	p0hzYYJ7lw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ejx2vwln25gytu6sovwgn6br34bly4ut; d=amazonses.com; t=1791726146;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
	bh=hfQJFn70VYAXWozUfLYnW6KfsWKdzbG7zMERoEGn1r8=;
	b=0IzOc23bJ4SxzBfnFmpTn4sC/kMjtshQf0zQ1piu1sTfJ7DJJwSrUcCEQXDDQGMy
	3a263Po+K5jOutfrRSixpaVP4BrWRCtDPukozKHg86HWoZoMsibOP98SiPWioUqjVTG
	mTyGT7qPtF58yjQa9NzckTOsrrNJ9Y3Grode1jB8=
From: Theron <theron@omail.sh>
To: intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Subject: [REGRESSION?] i915 CoffeeLake: HPD poll work hogged CPU escalating
 to hard kernel panic with HDMI->VGA adapter (7.0.0-38)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <011001a12b335373-f0459849-fd9f-44f2-b576-cffc92ed02f5-000000@eu-north-1.amazonses.com>
Date: Sun, 11 Oct 2026 13:42:26 +0000
Feedback-ID: ::1.eu-north-1.dcHnrzh0oIDskpJedYAo7sl1WzM4+gvnwzvalemM5GQ=:AmazonSES
X-SES-Outgoing: 2026.10.11-23.251.240.11

Hello,

Reporting an i915 display issue on CoffeeLake-H (UHD Graphics 630) with an
active HDMI->VGA adapter, where the i915 HPD polling workqueue progressively
hogs the CPU and the system ends in an unrecoverable kernel panic (drm_panic,
no TTY, no SysRq).

This closely matches existing issue #14777 on the drm/i915 tracker
(https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/14777), which is
tagged platform: SKL. The hogged-CPU progression sequence is numerically
identical (4 -> 5 -> 7 -> 11 -> 19 times), suggesting the same root cause on a
different platform generation. I could not add a comment there because
registration on gitlab.freedesktop.org requires reCAPTCHA + Arkose Labs
verification, so I am reporting here instead. Happy to file on the tracker if
that is preferred.

== Hardware ==

Intel Core i7-8750H, CoffeeLake-H GT2 [UHD Graphics 630] [8086:3e9b]
ASUS TUF GAMING FX504GE_FX80GE (TUF GAMING FX504GE_FX80GE, BIOS FX504GE.323, 2021-08-23)
Hybrid graphics: NVIDIA GeForce GTX 1050 Ti present but unused for display
23 GiB RAM

00:02.0 VGA compatible controller [0300]: Intel Corporation CoffeeLake-H GT2 [UHD Graphics 630] [8086:3e9b] (prog-if 00 [VGA controller])
	Subsystem: ASUSTeK Computer Inc. CoffeeLake-H GT2 [UHD Graphics 630] [1043:18fe]
	Kernel driver in use: i915
	Kernel modules: i915

== Software ==

Linux thor 7.0.0-38-generic #38~24.04.4-Ubuntu SMP PREEMPT_DYNAMIC Mon Sep 14 16:37:11 UTC 2026 x86_64
Ubuntu 24.04.5 LTS
X11 / GNOME (Xorg)
Kernel command line:
  BOOT_IMAGE=/boot/vmlinuz-7.0.0-38-generic root=UUID=... ro quiet splash
  i915.enable_psr=0 i915.enable_dc=0 i915.enable_atomic_modesetting=0 vt.handoff=7

Note: i915.enable_atomic_modesetting=0 is rejected by this kernel version --
dmesg contains "i915: unknown parameter 'enable_atomic_modesetting' ignored" --
so that particular workaround is no longer available.

== Setup ==

Internal eDP-1 panel plus an external VGA monitor driven through an active
HDMI->VGA adapter on the card1-HDMI-A-1 connector. Both connectors report
"connected". The VGA adapter is the trigger: unplugging it stops all i915
errors completely.

== Symptoms ==

Two symptom sets appear together and escalate over hours, not minutes:

1. i915 HPD polling workqueue progressively hogging the CPU:

12:34:55 workqueue: i915_hpd_poll_init_work [i915] hogged CPU for >10000us 4 times, consider switching to WQ_UNBOUND
12:35:37 workqueue: i915_hpd_poll_init_work [i915] hogged CPU for >10000us 5 times, consider switching to WQ_UNBOUND
12:40:33 workqueue: i915_hpd_poll_init_work [i915] hogged CPU for >10000us 7 times, consider switching to WQ_UNBOUND
12:44:00 workqueue: i915_hpd_poll_init_work [i915] hogged CPU for >10000us 11 times, consider switching to WQ_UNBOUND
12:54:00 workqueue: i915_hpd_poll_init_work [i915] hogged CPU for >10000us 19 times, consider switching to WQ_UNBOUND

2. Continuous i915 atomic update failures over the same period, ~30 occurrences
across ~7 hours, continuing until the hang:

i915 0000:00:02.0: [drm] *ERROR* Atomic update failure on pipe A (start=70610 end=70611) time 173 us, min 1064, max 1079, scanline start 1063, end 1087
i915 0000:00:02.0: [drm] *ERROR* Atomic update failure on pipe A (start=153656 end=153657) time 164 us, min 1064, max 1079, scanline start 1061, end 1086

Eventually the kernel panics: the display shows the drm_panic Tux logo, TTY
switching stops working, SysRq REISUB does not respond, and only the physical
power button recovers the machine.

== Frequency ==

Infrequent -- roughly once every few days of normal use with the adapter
connected. The machine is otherwise stable; this has not been observed with the
external display unplugged.

== Logging problem (important for triage) ==

The panic itself leaves no journal record, because the machine hard-locks and
the journal cannot be flushed to disk. /sys/fs/pstore is empty (no ramoops
configured). So the escalation pattern quoted above is the only pre-crash
evidence available, and the last kernel message before the lockup was an i915
atomic update failure roughly 10 minutes prior.

I can reproduce the pre-crash state on demand by reconnecting the adapter, and
I am willing to run with drm.debug=0xe log_buf_len=4M ignore_loglevel and
provide full dmesg if that would help.

== Observations that may help triage ==

1. Writing "reset" to /sys/kernel/debug/dri/1/i915_hpd_storm_ctl clears the HPD
   storm counters (per intel_hotplug.c, the write path restores the threshold
   default and zeroes every pin's stats). This is consistent with the HPD storm
   machinery being involved, and it is the basis for a userspace watchdog I am
   running that attempts an HPD reset before falling back to restarting gdm.

2. The existing i915.enable_psr=0 and i915.enable_dc=0 parameters on this
   cmdline were added earlier for a separate issue (external display blackout
   after suspend/resume) and do not prevent this problem.

== Question ==

Given that #14777 shows the identical escalation sequence on Skylake, is this
worth filing as a separate CoffeeLake instance on the drm/i915 tracker, or
should it be folded into #14777 as a multi-platform confirmation? I will file
wherever preferred once I have tracker access.

Regards,
Theron
theron@omail.sh

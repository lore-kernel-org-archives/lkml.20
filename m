Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460432;
	b=NzgRMDPjmbDNexFbyNw1OA/ygMonH1EzfFV0l0Vf7Md/mrMkCdCYO/tD0JjKpSTQLaP5
	 Cn7R5w25HVVrwhC+AZ8rtcD2zOHg+thlUzl7T4uy+AN5FSwcKi0cJWJ2cWeIij3JkctgH
	 9mx1pgaOL+F6xX0ZTXV+xDcFpT1Uadgk9XIjJY+EYHUjX6IFx3q3173r6kr16AB04ZGgn
	 1zlzDxaUI7IwEAGEsRPvg9NF4ByXHYqhcEyUwwpB8QJrGxhJy3FMzVDAq2fAo82LaKMkt
	 tfopKV0E1+PSfQNKEs3HTOvvCzneTNFK0C/aHdK5PX4O2qmV2b2eZpf5nOpEGv3IEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460432;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=epqa4hM2fNdEwIbvTE0P+n48JJiWFmQ5rpH56MumhIo=;
	b=0wpDIq1+5lsoBE9xy1DQ2/AqyQAmpPJwpFxakeIuYiL8e2Aejdl2LolmyRUGVGBwKlAW
	 Pg5PHOlmRbRcB4V+Bp8HViY2GbSiE8O2nuWmKSeVxqTI7zlfzlREpccHQOHqv/fRPGFE6
	 eX7cYs0S5oJQ8AE624MTu8o3uLJcpFT5Ye6HS1I5VxifsOJK+fYJ/3qIQxY7vygjAPfR3
	 Wy0aRXTGPJfZ7e0wvvj+EsgZGRDmRP2gIAyVQyq2gEqD9ZSywrZ+L+LFSO5SwK1n8sMKo
	 pXXEckDt3lMCLbicC4tFSFq1YQg+aTMr4WHAGcCMU0byYKaDA3EOGZALspuLZK+dKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="Uo/vI3aO";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DB606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Uo/vI3aO
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3CF3F40E00E8;
	Tue, 20 Oct 2026 01:40:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KBMI3ftJL8Sd; Tue, 20 Oct 2026 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792460427; bh=epqa4hM2fNdEwIbvTE0P+n48JJiWFmQ5rpH56MumhIo=;
	h=Date:From:To:Cc:Subject:From;
	b=Uo/vI3aOtG1o2lyJwmhk9Fu+OunVSP0hYA9RslBQSaIa0peHlEh1hR5yAJ2ydtvYs
	 2DTco5yxN6e4Y6HLo+8HnIge52oUImvL1dL6A7Y4slKqPQtHcLlDGBwofDVBZmivo4
	 TTdE6XAv6hCRoNhTIQfb8zHW9jjc69so9qRzl6zdxRYsJ2yL5gAiCYgYSn98u8H/5Z
	 iv0XkpKZY3e0Py2zq6q/hsgJLteqjXj8ttKqsw7VQkmqK+pkWOB/cer1mJamg7bvSg
	 655uT2dWMBaeK+vmgtREXNEKBFaQWmwTswZ+FFV/ilKCs++ZhLkSGAZg3xBlhrFSrP
	 kc9+EB/HdTNogx/XSbnxVuN82kHIKjaX+mJUwxzScdMgrae3D5VySDVgiT2UIzzktE
	 RSSBHqygpFb83cWxWj5HEbCgyoatDIybNtZzHclKh2lYrvN5XfxrZnxBAqVtAAh4Sc
	 iYNhE/CiTsQ8wzuF49r9yl7zO6OBlDuUiM3Usiz6q/e3Mh1aCu4ZgQ1Ki9ErdfhhDx
	 YkdvzgjvOz49rRrpVuMrquuLJyTjE8cDQNbALHJO0iO37i9YZl09lLpgqs5HpODroK
	 24O+oT+XUUL3d4GBj+ff9nAy05wK17+00K+bVbj4JsfmhNjt8IYKI4G3ftXf9aTacW
	 lUMs7RGegi/HlMMa3nPluSUo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A8A9D40E015B;
	Tue, 20 Oct 2026 01:40:23 +0000 (UTC)
Date: Mon, 19 Oct 2026 18:40:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/cache for v7.4-rc1
Message-ID: <20261020014020.GAatbGhNglC2npwc2r@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/cache lineup for v7.4-rc1.

Thx.

---

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cache_for_v7.4_rc1

for you to fetch changes up to 2c10b3fa5bdf61e344bc522e6c2e00d870ce7ab8:

  fs/resctrl: Ensure default group reports tasks on monitor-only systems (2026-10-09 17:43:05 -0700)

----------------------------------------------------------------
- Push down into arch code the rounding of bandwidth control user values due
  to the different ways ARM and x86 report MBA

- Fix task reporting for the default group for systems which support only
  bandwidth monitoring, aka Haswell vintage computing

- The usual fixlets and improvements

----------------------------------------------------------------
Ben Horgan (1):
      arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (2):
      x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
      fs/resctrl: Factor MBA parse-time conversion to be per-arch

Dmitry Antipov (2):
      fs/resctrl: Avoid extra call to strlen() in schemata_list_add()
      fs/resctrl: Simplify pseudo_lock_measure_trigger()

Tony Luck (3):
      x86/resctrl: Update documented unit for the "activity" event
      x86,fs/resctrl: Add event group descriptions for Intel Diamond Rapids
      fs/resctrl: Ensure default group reports tasks on monitor-only systems

 Documentation/filesystems/resctrl.rst     | 19 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 arch/x86/kernel/cpu/resctrl/intel_aet.c   | 34 +++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 fs/resctrl/monitor.c                      |  2 ++
 fs/resctrl/pseudo_lock.c                  |  9 +-------
 fs/resctrl/rdtgroup.c                     | 10 ++++-----
 include/linux/resctrl.h                   | 19 +++++++++++++++++
 include/linux/resctrl_types.h             |  2 ++
 10 files changed, 86 insertions(+), 26 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3343553D;
	Tue,  1 Sep 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232219; cv=none; b=l8suo6773kgBVSiQKefObFt4Q4gcKM76biDJAVM0OiGTydQH3pNDewvIvzK6/Ldii+z6lh/x9h8GkFK6PM/UuvByEoUWa7PmMIN7WxRQnWm6rNqaIULuAHR/mqvZ0tyQy6k6sVkz7mBgP0vlqgRSxq1LPh+6kEjKZjK7brD3adE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232219; c=relaxed/simple;
	bh=lhZ+qTCI3I6ZC/XWfnMRBJCL9ojUrBH2xTCVeFPxuxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXZXGmwyKAjUZmYQZ9eOcmIvR6qIFXBQltm3pouAPOdRMrH1ityLl2pBuMe1yDlW1U7cqBAEXLGWlplAhmfGCqEcglsJWzcLxj0bV4/O7uX4QCkwsW7rQNJ0wwE2l2Q1Rp3VHK0XYRtuf+o4L4ybDQ+MZIb1LlGDOWLLrjaU7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=akBm1gR5 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="akBm1gR5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 80D2B40E01E1;
	Tue,  1 Sep 2026 03:10:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SDQJ4VW3y9DR; Tue,  1 Sep 2026 03:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788232195; bh=TbWGCUQ4S+PJve5Sniu3m+9SPEdWSvbL8YSpQaMfJaY=;
	h=Date:From:To:Cc:Subject:From;
	b=akBm1gR5GYFtJYyONWeME6+vISDnEtrYpgiWA5SHNDJp2eCz/BikREVXgUtaH+5vk
	 m2NKPTcx+9kp0bsrNrUhp2L3I9WO8Izk1qajtlOJPhLj+LrzYB1g7ZCWKO6rS7UGVi
	 /+Q4o361rZKxAI0uxMtTYx1X4ROvTOxOHhU7hGoLdPRV8Qx4ZiNufpalXfTinLJP//
	 S4fT3VJVRQXercKpZ+iGs0hnt4YIQQdGeteFPU9WMxo4iSUq0iz9Gdwx43oZKDbVgT
	 N7XcygNlTeQA5IYKtsQVW6nmzJtWQSZLYq/+wLXvEWDOplss7Jb9kNEQtI1ODX/Q8h
	 1nzVxyzfUw3CwzwnRl3ijIcnZ9boQkgzxIriWNSPajvGq++oZq5d+KKjmobxmp80wN
	 FV24UDKnXX8uXK3G5ZVuMtWWW9D8XAFBaR8g87NGDJwz8M12KjIRaWBc7xYmFHlJx3
	 lPOOYKd4e3cbUHOuTB3vX+lNE05TIgt67wHmccE+h5OttXPThlp8hA7aABJOM+OV7n
	 8PD5UZgfneViq470MIfuFyWM20nc1XqMcnoqvThC2dC4MoGxzlQ+oV9jNjuFDYG2so
	 KGuf+oSwsjAkvmyZWuZu/4ypWPiNIyM2cYDNNMZy//1Olng6dTE0FpBbw/ka3znKpb
	 ZxzZ9w0/BgA0ieMOAxvXwEQQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D795A40E01B5;
	Tue,  1 Sep 2026 03:09:51 +0000 (UTC)
Date: Mon, 31 Aug 2026 20:09:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC updates for v7.3
Message-ID: <20260901030948.GAapZB_HCk7wi9A5OP@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull a somewhat belated (and forgotten :-\) EDAC updates lineup fo=
r
v7.3-rc2. Scripts are fixed to avoid such an omission in the future.

Thx a lot!

---

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags=
/edac_updates_for_v7.3_rc2

for you to fetch changes up to 68c90773f40f91f48a557e9fa65e2a72cebc58df:

  Merge remote-tracking branches 'ras/edac-misc', 'ras/edac-drivers' and =
'ras/edac-amd-atl' into edac-updates (2026-08-31 19:29:47 -0700)

----------------------------------------------------------------
- Mark the mpc85xx and ThunderX EDAC drivers as orphaned due to lack of
  access to hardware

- Remove the unused fake error injection interface from the EDAC debugfs
  code due to potential races between logging a fake and a real hw error

- edac_mc_sysfs: Use sysfs_emit_at() for proper bounds checking

- Remove Mark Gross from maintainer entries and move him to CREDITS

- Load the AMD address translation library only on systems which can
  actually make use of it (have ECC memory) instead of on every AMD Zen
  system out there

- In edac_altera, detect the SoC variant using the ECC manager's
  compatible string instead of the build architecture to select the
  correct interrupt layout, and remove leftover architecture-specific
  ifdeffery from the double-bit error handling path

- Add a new reviewer for the Xilinx EDAC drivers

- Unify address translation logic in Intel client EDAC drivers igen6 and
  ie31200 along with detecting memory controller counts at boot time
  instead of relying on hardcoded, platform specific numbers. Also, fix
  a bunch of issues in them; work by Qiuxu Zhuo

- Add support for a new Intel processor platform Starfire which is
  a derivative of Panther Lake SoCs

- The usual cleanups and fixlets all over

----------------------------------------------------------------
Abhinav Ananthu (1):
      EDAC/sysfs: Use sysfs_emit_at() in dimmdev_location_show()

Borislav Petkov (AMD) (4):
      EDAC/mpc85xx: Orphan it
      EDAC/device_sysfs: Cleanup around edac_device_ctl_poll_msec_store()
      EDAC/thunderx: Orphan it
      Merge remote-tracking branches 'ras/edac-misc', 'ras/edac-drivers' =
and 'ras/edac-amd-atl' into edac-updates

Jad Keskes (1):
      EDAC/device_sysfs: Use kstrtouint() for poll_msec to prevent trunca=
tion

Pan Chuang (1):
      EDAC: Remove redundant dev_err()

Qiuxu Zhuo (11):
      EDAC/ie31200: Decouple DIMM width decoding from enum order
      EDAC/igen6: Fix interleave boundary condition
      EDAC/igen6: Fix channel selection hash
      EDAC/igen6: Fix channel address decode for non-hash mode
      EDAC/igen6: Fix Raptor Lake-P logged error address
      EDAC/igen6: Remove unnecessary XOR on the zero-valued interleave bi=
t
      EDAC/igen6: Simplify compute die ID comments
      EDAC/igen6: Detect present memory controllers at runtime
      EDAC/igen6: Remove redundant resource configuration tables
      EDAC/igen6: Refactor address translation logic
      EDAC/igen6: Add Intel Starfire SoCs support

Radhey Shyam Pandey (1):
      MAINTAINERS: Add Radhey Shyam Pandey as Xilinx EDAC reviewer

Rounak Das (2):
      EDAC/altera: Use ECC manager compatible to select A10/S10 IRQ layou=
t
      EDAC/altera: Remove remaining CONFIG_64BIT ifdefs in the DB-error p=
ath

Sang-Heon Jeon (1):
      RAS/AMD/ATL: Remove conditional return with no effect

Uwe Kleine-K=C3=B6nig (1):
      MAINTAINERS: Remove Mark Gross from relevant entries

Yazen Ghannam (2):
      EDAC/debugfs: Remove the fake_inject debugfs interface
      RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed

 CREDITS                          |   4 +
 MAINTAINERS                      |  16 +-
 drivers/edac/al_mc_edac.c        |  12 +-
 drivers/edac/altera_edac.c       | 127 ++++++-----
 drivers/edac/altera_edac.h       |   1 +
 drivers/edac/amd64_edac.c        |   2 +
 drivers/edac/aspeed_edac.c       |   4 +-
 drivers/edac/debugfs.c           |  65 +-----
 drivers/edac/edac_device.c       |  10 +-
 drivers/edac/edac_device_sysfs.c |  23 +-
 drivers/edac/edac_mc_sysfs.c     |   2 +-
 drivers/edac/edac_module.h       |   3 +-
 drivers/edac/highbank_mc_edac.c  |   4 +-
 drivers/edac/ie31200_edac.c      |  18 +-
 drivers/edac/igen6_edac.c        | 471 ++++++++++++++++++++++-----------=
------
 drivers/edac/thunderx_edac.c     |   4 +-
 drivers/edac/xgene_edac.c        |   5 +-
 drivers/ras/amd/atl/core.c       |   1 -
 drivers/ras/amd/atl/map.c        |   6 +-
 include/linux/edac.h             |   3 -
 20 files changed, 387 insertions(+), 394 deletions(-)


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

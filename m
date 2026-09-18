Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3D511E60
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748446; cv=none; b=T19MpQNirnWff3M9jRW/0xwiB10nE+/hksVeP7ydjHw4bj2PoxCrUHyo0pZ8D7geDfdTGZ8JEMGbpAayipeljkKwZ1ntnPnWO/sxvbYa/7KthHAGZi42MS7+XtkZF+DUdxPgiANnHHY9CJf7oScetgbzNQuUje59CsFtkENnYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748446; c=relaxed/simple;
	bh=URGeA7w/chQlkU/MBb4klfhc6jrTrNP9CDBMx9r9OmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RGGKjZXcBmW+kg/docaCOYdk4LixNYOp35kF++ZI91/qSCuhW2yjOYhKFCF5OGy2/UM9n8nSmF2jANP/Ya6WzoVX96vPyGoZ1QIgFobrvbwq3SUI26Y4JoxQgzW92zTILikbxw8WeKTjeX2UKGBzWC5+RA8Wph61zxQRdUsokB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3upBK2w; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3upBK2w"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so8354205ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748442; x=1790353242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SActHdUMawXLcOqYGrSqy2fZIutS+3r6VSMbaH7My1U=;
        b=U3upBK2wYBVgkVhgr9zS7GTwFP4KLofvXiuxSkXsh7hNgGT6sGRiKWCy1dIAdxyWZ+
         EjLqs8mHKD+pNG+K3IdhUEphVdlEgx0FKkZwLQLQpLMHEyD0G1PNx1peqh77te4WPamo
         UqBw2fP94/ZGwwxwfTmBmLGADWzHTqKwX4eU0E6gcc3UHlZn54n3lGsuO/Vy85evwQmh
         L36x/dR1LhCrNJuVT5OdCyNClXHTAanxFmlVXQXdwlADEZK60r/epH4sK4kQwUdGGtD3
         UVBr3gfIAB+EOZNnDHUYelGKC8KIYX4fEUBaOTfvB8hX6/PsiHf6A+m5ftodZl3gc/bN
         Hrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748442; x=1790353242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SActHdUMawXLcOqYGrSqy2fZIutS+3r6VSMbaH7My1U=;
        b=kATPEPoybU9LICrG0nDXVbcczNSsEwZxc0KXfhdjdot2x279hzDyWSJtaxDn/+RNqJ
         TmDzJ6peIrfd15Jr6SZjr3ZTtbgN09KfdXuADybjMJEOz7iDvUuh6nUmgXkHpmLzp+T2
         4NmWmc+F9uTL3d7LcVfljudHhvE2/1e++SSViOUXlVwVUInVAzrLdOKv3Lj1qSkmeS0t
         gXfJMGf5a67pGnKYCdOqOA8A4kyKjE4s5sgIIVn9FLpujvSdCxhrTTmB5a9p5EGgPkko
         B8ODg81Tquv5Qnw9rkZXU4vk78I1koRJfZnlTR72XGKwBArbso4ZIhCfO06tMOKpaj4n
         KyUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdxaieV1KKbiUP8dpzhMnhP4bNbtW2950o1IWKubaRRky1+uON3O9VyMPVDD+bLn3JIEfw2iBFWzqNgX0=@vger.kernel.org
X-Gm-Message-State: AFuF++nt32aggERQLohNiSF8W9v54VXBR/M2Ylk33LHq+IFyxaZQh6Mn
	gkqzdWy3Wyl7718p2+l4MpNOGtiGMjQ/OInveFNljmFqIB8alXemA6G3
X-Gm-Gg: AYBFou0pEEv+gSXSKpEJjry7QfX/9xzT6rkJDGga/9N6rknx5Q3zsjoUlaKOjEHvnvY
	3VsbJLl887j6zlunnwww/PM/eln6FZDBy18kUhtHbPe0j55Ile4QOiEpl9H5GTj7vXSiO2iHazL
	eXdQGfIPuBsTqfqYs1KDE4rmnAdB8OK3e9t7do9veutnpDARYOTKssqios/0Madp1EdG9OjNY/u
	RJ080jQ9qLOxvBFxs2ed/UKApwQJndxU/T5V4OiGNl+/L3I9DUXWj/eDOIc2meBmvzH9eeqZmeF
	wRSZeIIuMyqIgHZk3VTQ1VrSI0l7GKw0pXwlwvMEY7djwb0LChj5D/SeA67Zao3m/n4jzNKDeP6
	EECeX7RX4Diu+GGLzryc9k7ds31yrakjMU/5LQMke44a/Ekc1BhWktQoC2yk5fiDElcbsYwdnjW
	DPJ0wiKi5L2U0PhE3v9liNXM4C+CkFVJ0EQfihpNAJoRUc1F2eT/kspjPiFpt7nxhqKoiuEFl/Y
	Qr8+JHpuyh8
X-Received: by 2002:a17:903:1b6b:b0:2dd:c100:942d with SMTP id d9443c01a7336-2ddc1009b84mr1946445ad.43.1789748442410;
        Fri, 18 Sep 2026 09:20:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c288f088bsm5668038eec.28.2026.09.18.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:20:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] watchdog fixes for v7.3-rc4
Date: Fri, 18 Sep 2026 09:20:41 -0700
Message-ID: <20260918162041.18444-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull watchdog fixes for Linux v7.3-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-fixes-for-v7.3-rc4

Thanks,
Guenter
------

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/watchdog-fixes-for-v7.3-rc4

for you to fetch changes up to 7cb575b71ab98194d2e040bded3a7281e089c5ed:

  watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog (2026-09-18 08:10:45 -0700)

----------------------------------------------------------------
watchdog fixes for v7.3-rc4

* da9062, da9063: Fix suspend/resume handling of HW_RUNNING watchdog

* digicolor, rtd119x, and rzv2h: Avoid division by zero if clock rate is 0

* msc313e: Fix premature reset during timeout update, and propagate error
  code in resume()

* sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()

* starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()

----------------------------------------------------------------
Li Jun (2):
      watchdog: da9062: fix suspend/resume handling of HW_RUNNING watchdog
      watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog

Tzung-Bi Shih (5):
      watchdog: digicolor: Avoid division by zero
      watchdog: rtd119x: Avoid division by zero
      watchdog: rzv2h: Avoid division by zero
      watchdog: msc313e: Propagate error code in resume()
      watchdog: msc313e: Fix premature reset during timeout update

Wentao Liang (2):
      watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
      watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()

 drivers/watchdog/da9062_wdt.c    |  4 ++--
 drivers/watchdog/da9063_wdt.c    |  4 ++--
 drivers/watchdog/digicolor_wdt.c | 13 +++++++++----
 drivers/watchdog/msc313e_wdt.c   | 16 +++++++++++++---
 drivers/watchdog/rtd119x_wdt.c   |  7 ++++++-
 drivers/watchdog/rzv2h_wdt.c     |  7 ++++++-
 drivers/watchdog/sp5100_tco.c    |  6 +++++-
 drivers/watchdog/starfive-wdt.c  |  2 +-
 8 files changed, 44 insertions(+), 15 deletions(-)

Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BED40F759
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903327; cv=none; b=tGGSXLIOR8k0OqSPHJTMlEGd3+0rnkehYMbmCnaSKr7BLBD4DeYjglaYs56x/0EJXq3xvBT3OI0CVlvP8YqRh0yyuu0ApEUEbNZS7zYafyDRFzoQInjeV4UPA/yDp25dnKcFHQejnf6scpFX99YsaabL+5Wp6d9+MG5ytkDLu2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903327; c=relaxed/simple;
	bh=gjNX/CWNpI50rVnvxvJfgkNoOMgqeJJz8BT5hbq7fLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV/S2meAXet1NRXvHb0dquSYwCaMO+j2y5kndmPGfjOJ0swq2ZE1u8KcVXAbYSBEDrXQhsDcX95/HHtTMIcMv0DvyzkSA+LdeLFYCb0haDXg7B55pt3AxRUzxoa15HQXQvCvTKBMJI6A04Ixyrv23o3a5F4GWPyg81a2XH8eYx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsAPN9lm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsAPN9lm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so3989540a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903325; x=1792508125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCzRjuNiQYuIlt1ayBRVrkI/N8zFISckqW/w4VRTdfQ=;
        b=FsAPN9lm7/em7IDwwyQD3mQgkX/jFwRcX3wD8VGJwYi5P4Cl0K2uXkWVTnN3dHQ9Lf
         ls+1ixSKcFY54dTriwzMNXvTyH+OlY/quwDe7btcl5TU9nCr5ie7DSSMot7y8IHKLAvz
         SwI+xfBtOORmrkstctQwWp0RFevy/KJ6OBrM8D/D6u6uRr5ti1cT+SbtsWs9gO3Eml7u
         1jPLIYKtOeUgRZhzM8Ir5EZVgDljvZdQBRyv7wZ8nMXHlBg9NSfG0aCjJopIW+nceDdb
         owt11BRj30dD2I/wSPKz/o9kR7U108QxmZF5tDO4UhFEWJZw3+XMhCSZuuky0sSC/G/V
         e3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903325; x=1792508125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCzRjuNiQYuIlt1ayBRVrkI/N8zFISckqW/w4VRTdfQ=;
        b=0zUdZxxw4n0/p85Npc2JVCP71HmufXCy4Ffaz4jG6qgjjXird8wb1ea+hi9gAU99VI
         veXEHq0bE4T/sed9PTi/CHB2rOYjxQCOI33L0qnagZbWza9+aRfZHfrfgYxPsQ1BX4pP
         IaxrDprmtHeHnIHdCDIDobdf1Dsz+lDreYT8y60MDC7JBvzEzAyo1sMRkCdurc7oTNKm
         4vBGabVhnW7x//lIvpiaPuI/A0JM4xpJPvzmZEqYw63VsFCpu4FDWUIXWQ5cTqfOGyJT
         iwmUuA94cVYS+By+Zu6quFBYL7kD3reqnzwQx6jJPGuDzDdr5TNhzMe5PT1n93p4Y9Ov
         WDIA==
X-Forwarded-Encrypted: i=1; AKwUvByuKow7mm6OcBY63vmDY2MipZ3LE13Yd6ohJP/4g4xJKIgBHtV2flE2O/INdN5Qjz7bbA6mG7U8YLcjJa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2l4ztcsU6uUag1zcEJc4xjXFf0EnxGaqk+9SSNoTWCISuCrEn
	UJ+Do5N3Gbl9X0jklQFvaCMiQ8k64FNWI9igOvI6enXHsmpH0oWl/q4R
X-Gm-Gg: AYBFou1oPVh5YsYOtfrNC0Rpxvbci9FiPJ3O/iUzwvzHCqRVrFKSe/lq7FktYjoimF7
	zo6t6fwOQ+Vh5BTLC1oNjqJ4w2+u+jx1hlgbMFgAf2SAWRBpWBHTNuIH+bFznnfM4nfTKLpStr2
	iPhwy8/gwxVd7KC0ydMpifSLiIwhIlLZiT1a9AZQ3RjQEISA53nfs9CzsVkLEFY/cN+6UJWK2Pd
	zoEnpAw3OmtHq1yzZOx+9QgELmYRg595gs/cLbV6WpZKbP5c86qH96qpNarBVHJ5SbOM4Un6Fal
	SBDbG/oya2BKyyy9SAQ5vBgh9nn8KXA8oLsfzA1+PlRK1Lhv1tK+W9lEoCSpNlnaClq3TnUGUGr
	+7n5WyWg4sBfmjckfylldXkOGgkAeAtMwdA/crnHGEmZuYC4CRKQzAr928E7+PFW//2EFPVnp49
	gNjfy6jj3k84Ys8aQ1eGVvyJauqj1eZKVFOpgflpQnSBB7sYLdODpmAaOV+gIgA5zpXpWYjWRj7
	rPDGfarkR9rSKsFQ9LBn/ZhjEEDFM1t/x7OlIjQ6zuUFl8=
X-Received: by 2002:a05:6402:a0d8:b0:6b1:d2d6:4013 with SMTP id 4fb4d7f45d1cf-6b1d2d656aamr3347810a12.17.1791903324468;
        Tue, 13 Oct 2026 07:55:24 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm6169161a12.37.2026.10.13.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:55:24 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] dm zoned: fix idle reclaim problems
Date: Tue, 13 Oct 2026 16:55:18 +0200
Message-ID: <20261013145522.17499-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mikulas,

I noticed too late that v3 of this series is already in dm-7.4 and
for-next (24646f6ed3, 2cca719c63, 5829edd027), so v4 crossed with it.
This v5 is v4 plus one more fix; if you prefer to keep v3, I can send
the v4 changes and patch 4 as incremental patches on top of dm-7.4
instead - please tell me which you want.

Patch 4 is new. While measuring an idle pool I found that an idle
target whose random (and cache) zones are all free never stops running
its reclaim work: since 90a9b8693f1b ("dm zoned: reclaim random zones
when idle"), dmz_should_reclaim() treats "idle" plus a non-zero total
number of random zones as "reclaim now", dmz_do_reclaim() finds no
candidate and returns -EBUSY, dmz_check_dev() checks every device for
media events (a TEST UNIT READY on SCSI disks), and the work is requeued
with no delay. In mainline the loop can end when a pass finishes while
the target is busy with enough free zones; with patch 3 the idle poll
stays armed, so the loop recurs whenever the target becomes idle.

Measured on 7.3-rc7 with three emulated host-managed members of an md
RAID5 (idle, 30 s average):

  stock dm-zoned        181,195 SCSI commands/s   32 % kernel CPU
  v4 (patches 1-3)      187,707 SCSI commands/s   31 % kernel CPU
  v5 (patches 1-4)            0 SCSI commands/s    0 % kernel CPU

With patch 4, the random zones filled by a 2 GiB write burst are still
reclaimed once the target is idle, and on three 27 TB host-managed
drives (7.2.10 with these patches) an idle pool went from about 155,000
TEST UNIT READY commands per second per drive to none.

Changes since v4:
 - new patch 4 (above)
 - patch 3: Reviewed-by from Damien Le Moal
 - patches 1-3 otherwise unchanged

Kyrylo Biryuk (4):
  dm zoned: back off when reclaim finds no destination zone
  dm zoned: do not reclaim a random zone into another random zone
  dm zoned: keep polling for idle reclaim after a reclaim pass
  dm zoned: do not busy-loop idle reclaim when no zone needs reclaim

 drivers/md/dm-zoned-reclaim.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

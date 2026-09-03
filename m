Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A41F5825
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401974; cv=none; b=VDT4ehMlNkVqMHuBTYeDpbf012sNXri8jywPXqHtsCsaUP/iOtU04C8eeZmz2xp/fte5XiA8Hn7tit2kJ/bFKmayFFAEk4HxiW/YZxqeAQ/WvRWUBLJkpZH72JjJ4KU02p6MTGO0uwfnBq8afA64BrSp6EjwUekiB7ZlqdrXDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401974; c=relaxed/simple;
	bh=ZwMsuH7eZzcHZb+bxrsak+DWn/K5UXWPROmyoI0n14o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4SSVhpvtxP1QqxOBg6/18V9mNcoXpG8FeuZoDCyYXSCN1CvCweqPDO0iNDNXHEXvOPcywClhQZB4uWXV7PTVfKQNLNIJxl0wzcY+dB9mc7zazjyB+m8lKja1EoSuFVqL5aRLlWVWao6d23lPiJQCtBw1S/cCuOfSbXN/+byxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZZCNCttF; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZZCNCttF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788401718;
	bh=veJk2ror+hEi4Ty7W/Sg5U26XPTeLYM4/GoJraBnK7g=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ZZCNCttFVNdy+g0mU8gmGsIhJBPdmUZiCAl991LipbEiZZQC4rZmqQpIt1ZvilbbO
	 yBAHkzkT1pBcJEDi6sXeb9AOOQnqYs4s8TnTmMlEFdPbGiBd6vmiP7ZGWsQXERQb3B
	 xDe8NL3O+MQ2RPBtBYPwvDEsb2RECPO8a6WCjOxM=
X-QQ-mid: esmtpgz16t1788401708tcf7d2a19
X-QQ-Originating-IP: AbsfmLogBfzNDC2ZGLAHnKrajWshw7V+7Go3V8q7wlI=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 10:15:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8266889136189670214
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: tuhaowen@uniontech.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	huangbibo@uniontech.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v5 0/4] PM: hibernate: skip unnecessary THAW resume
Date: Thu,  3 Sep 2026 10:14:55 +0800
Message-Id: <cover.1788399733.git.tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260730153817.GA1555869@killaraus.ideasonboard.com>
References: <20260730153817.GA1555869@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ODcDgdcDagQKPR6Yp/lkKC98baFwGbyG3LLEjjUxgM1+vI+qidNptTar
	a1H343s+6BZEPK6Ps2TvSTajwX/W3cMcD0qyPiOC7GiYpxP7DDpIbVckSOoN70w/DBEwo0W
	d9XI5qlCYVQnZLhxiPvSdtgVa0ss9COfvMKuAfrCGmURBeixyuEkn9RWNKV75v0ax1921Y+
	yaAjEzYiOF0Sv8+gyrKvT1HzBXKhJn/jXtZF+NjP0YrKaPE3mwKGiHiN2Djp3xeVlZsQpdi
	MtAdDDoPMthzCjWDRsid9/3JY20t81W+MNzT4PKgEJskwSWTnvJ5URqkI9wjiF8oKUc4MO5
	NtjBXn5e244tfKdgCowlDuiI4jWeYo8nIfTZTrw3fdXNk60xtrsOQro3Es9gaV0eZJzAOhL
	ivHH1FFZ0azuZkHScSHDTljLbBTD47P9GX3B7ZL1vlwAg20YZ+WeakrAosevDjXbElWFZjC
	8crpSG/1BSWzxlYvbHW8dDonCH5/ZnIA2jqzPTThXWpCgxhPzpWpvimPstAAlZob2UFPBzI
	GNXyrVDbbWeuLzcD150DmAnntLS+CJwsdVUzsgxCoaOfBoLYBMXmYepMCz3UW6B/MZwBbX5
	vo7b2b4+pji4EtPAiOOTtngvIB/IwFzLYnFFQLa5M41sfXdU+zVbCxRYFj5UQyNARzFDaE7
	T4QNN1dQQy45BXuvKgCY57scEboPg2Q9EtgHtftjKilQWGCYc8dPdPQEypFT2j+k8JapfTU
	YU8Ke4QvVVU4z7nGZjAuoEeCmDBgLVEd1vjpRcjHjNO1Wk6OiNqvPmLel1ePZDkXJ/QU5am
	wrdJl+rjJgRITrOL8vigCug8+JzrSCyPK5amwgJPm73gOkIsCS5jhxpnG6Pn/xhBkYIxZqO
	APQ4GXg40ezfejk1hDx4U0Qd2vsSuW9AezteqHQWbnujlubU2sfFdYh4JW6xpweZGlQWoSk
	7uoGKv7CEBTEK7gAw5xB681Uh8OAiSyUAzItNeug5iT75dwsH2q9h2A7+Z/VJTKB45GrCJe
	W70x59IsR6Mm6lNqSH4Fh39q+K/yyBQyR3OQjBZyLF7GnbCX30nSgqIU0bgXw=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

During hibernation, after the memory snapshot has been created, the
kernel resumes devices with PMSG_THAW so that the hibernation image can
be written out.  Devices that are not involved in image writeout may not
need to be resumed during this transient phase.

Earlier versions handled the UVC case in the driver.  Review feedback
pointed out that this does not scale well and that the v4 notifier-based
recovery path does not preserve normal device ordering.  This version
moves the skip/recovery handling into the PM core.

The new DPM_FLAG_SKIP_HIBERNATION_THAW flag lets a driver mark a device
that can remain suspended during the post-snapshot image-write phase.  If
the original kernel continues running instead of powering down, the PM
core resumes devices skipped this way before userspace is thawed.

The first two patches are unchanged PM fixes/helpers from v3/v4 and keep
Rafael's Acked-by tags.  Patch 3 adds the PM core mechanism, and patch 4
marks UVC streaming interfaces with the new flag.

Changes in v5:
- Replace the UVC notifier recovery path with a PM-core-managed skip and
  recovery mechanism.
- Add DPM_FLAG_SKIP_HIBERNATION_THAW.
- Use the flag in UVC streaming interfaces.

Haowen Tu (4):
  PM: hibernate: clear in_suspend before freeing the snapshot
  PM: hibernate: add pm_hibernation_snapshot_done() helper
  PM: hibernate: allow devices to skip post-snapshot THAW
  media: uvcvideo: skip post-snapshot hibernation THAW

 Documentation/driver-api/pm/devices.rst | 17 +++++++
 drivers/base/power/main.c               | 65 +++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c      |  1 +
 include/linux/pm.h                      |  4 ++
 include/linux/suspend.h                 |  2 +
 kernel/power/hibernate.c                | 38 ++++++++++++---
 6 files changed, 121 insertions(+), 6 deletions(-)

-- 
2.20.1

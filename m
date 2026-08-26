Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56E41D206
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747296; cv=none; b=VoEUwU4bnbb+EUHVH1UqR/JI7IDus1Kq28hsnYvlvINqqXmKXfOhBNHhsBBIOGg4kPrNfayWyP7PxhZVn4LpRef/+5RMIJa+yQMRBm1uY2auRJ1v9exCpSB3ceCC+5k/4nqLIi/XCjStkh/odWm9zN30MUaSTsYwsyc5Vq30XZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747296; c=relaxed/simple;
	bh=naSV8McHKnnNI2pipdH2+RdS4c3WqD8L4smiuy2wB7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKRcMUNjmKNlPWbiR8XCKE6JwncTPnEpX0TcD57qRK33uMVC4VkjD97vjLtjmCq4ATZPC01P151sQMixehZENZvQhMBqqJ6WwEaIQaNJbCHCqneR65EyjUkBM+EMhrJC0uC04ZC2TDP4kmVLCFdk7aYfCPHDCdzJb8gtotW2S+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=inFSt91E; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="inFSt91E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ME
	0r7jszVPlwvtMma8SMHdoXcLqmq0d/w7jOAp55v/I=; b=inFSt91E1f9T6p0Bcb
	OTcBw02RLDKLJpQKiU6OJYWfKQTVGh3FTU90jpVDMf+XrH0PSMQ0PvqZO7/5We/8
	SaGM/7BycZ5yARvW5pbpIrAkJQBPfyCbsQtPKXyL/exfswHJ3xF98Al1HGoMteZU
	YdTsytGpKHlF+oAbC/quq+RnQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHUCC4245q++wKOQ--.27428S2;
	Wed, 26 Aug 2026 20:27:38 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 0/2] ntfs: report filesystem errors to fsnotify
Date: Wed, 26 Aug 2026 20:27:32 +0800
Message-ID: <20260826122734.2129830-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDHUCC4245q++wKOQ--.27428S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr13Aw4xJw48Kr4xtw4Dtwb_yoWfCFg_ua
	1xt3ykJ398ZF1jka43KF1j9FyDAay2gr1UtF18KF1xJrZ5Jr1DJFs8tr4fAr1fJFZ8Kr1r
	Jr98Xa4rAw17ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8SksDUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RpjLmqO27q5xgAA3E

From: Baolin Liu <liubaolin@kylinos.cn>

The ntfs driver reports volume errors only to dmesg. These two patches
wire up the generic fserror infrastructure so that health monitoring
daemons watching a mount with fanotify(FAN_FS_ERROR) also learn about
them.

Both hook the flag-setting helpers rather than individual call sites,
so no callers change: NVolSetErrors() for metadata corruption, and
NVolSetShutdown() for forced shutdown, which also covers the
->shutdown super_operation.

Follow-up work, if this direction is acceptable: reporting corrupt
inodes with fserror_report_file_metadata() so that events carry a
useful FID.

Baolin Liu (2):
  ntfs: report volume errors to fsnotify
  ntfs: report forced shutdown to fsnotify

 fs/ntfs/super.c  | 15 +++++++++++++++
 fs/ntfs/volume.h | 29 +++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.51.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743624;
	b=nFSBI+O8RNw3TAV0Cp2HITx9biacNNNxtT8a92I8DYXsINpzaJFL3vKrZReFQyLPx7cA
	 LvYGnwe4/oxqoJyuHQ034A0JfwpbZpOX/g42rVV+jB2QJKVBZ5cE2GE5LuZdk8hSZk9xL
	 pN1CGtDCu2986QgZkvBwIdB1EvqwrBcmEsIyjG7et2wGwMfQ9rdZuqllAy6DdoEAJrW+S
	 1aSNgrhj0dJYguCz988rzuNtkuEqWaDx/P6DSVmcnD5CwlIxkTeeXvdjMpJgcmu95q9oO
	 KBjRJngS+kYW0cxTDM1VbfIhtiKUq7OQ7qScis03JYygTQ878jq9W3EgbZje4gxiIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743624;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YGMB3+NAm4faRx3w9bRJYMM7s3usV8RgkqrWV3C0ORE=;
	b=wl0Q+yC9wGzEI/rpTNDqRoM6bfW4k6q5HNSmOow/rkQsu2nDyMpQ+HyT5Zk5PHlMHqDv
	 2gAMvCNIt2xEoBo93x1Y3FHKPrEtPVszO/v7VNx85mYANyLUbPdhX4ck6RCR7Xog1BhaZ
	 XHoCtogmyVkv+mtn9AbrkkL+h1Bo+5J5S/Rrm79yizJkKg3jth9QxOWTbzOpI2V1ETTBQ
	 ST1rcLYzyhBJ445YAeyN8tsjUB3x7vUBSPrUYCfOtopTd3ikHGWO6/UBeoChHGi1+6+8d
	 dyboQ75nIBQveJ1wfXACeM/A7Saaoc/+zEBipD1FmewYMzwOU7P57LFfqQaj1um981A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wpJiP0GN;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC89606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC89606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wpJiP0GN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wpJiP0GN3jLBmlTcUZD3LD5SCO1hflf7q7lFMOnYS42wHZ3ijoTwGMmhh//zxt7DloaaZuB/6llgY
	 ht4pQcV+wsNj4RJ9MP5nePL87VbM3OSS49VXV2rmK1TGSB/qMH9mYZuJdea2X/j7UqA/PAqZER8WMa
	 dQfOk3DBxSbpvF5c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af99d2f938-d1ffd;
	Sun, 15 Nov 2026 19:53:32 +0800 (CST)
X-RM-TRANSID:2ee16af99d2f938-d1ffd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af99d39d8a-63c14;
	Sun, 15 Nov 2026 19:53:32 +0800 (CST)
X-RM-TRANSID:2ee86af99d39d8a-63c14
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dm-integrity: initialize free_sectors when the superblock changes on resume
Date: Sun, 15 Nov 2026 19:53:29 +0800
Message-ID: <20261115115329.1174-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fc79aeb86a2c ("dm-integrity: validate the superblock on resume") made
dm_integrity_resume() jump to skip_writes when the on-disk superblock was
modified while the device was suspended.  That path skips
replay_journal(), so the journal accounting variables stay
zero-initialized: free_sectors is 0 while journal_sections and
journal_section_entries are nonzero.

A later suspend or flush queues integrity_commit(), which calls
pad_uncommitted() in journal mode.  Its invariant

  journal_sections * journal_section_entries ==
  (n_uncommitted_sections + n_committed_sections) *
  journal_section_entries + free_sectors

no longer holds because the right-hand side evaluates to 0, and WARN_ON
fires.

Restore free_sectors on that error path, as replay_journal() does for the
normal resume.  The section counters are already zero and nothing will be
committed, since the device is marked failed.

Reported-by: syzbot+94dac3c75477e184f0b0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=94dac3c75477e184f0b0
Fixes: fc79aeb86a2c ("dm-integrity: validate the superblock on resume")
Cc: stable@vger.kernel.org
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/md/dm-integrity.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 802b37761..6ab305b60 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3915,6 +3915,13 @@ static void dm_integrity_resume(struct dm_target *ti)
 		memcpy(ic->sb, ic->sb_copy, sizeof(struct superblock));
 		DMERR("The superblock was changed while the device was suspended");
 		dm_integrity_io_error(ic, "superblock check", -EINVAL);
+		/*
+		 * replay_journal() is skipped below, so the journal accounting stays
+		 * zero-initialized and pad_uncommitted() would trigger its WARN_ON.
+		 * Restore the free sector count; the section counters are already zero
+		 * and nothing is committed because the device is marked failed.
+		 */
+		ic->free_sectors = ic->journal_entries;
 		goto skip_writes;
 	}
 



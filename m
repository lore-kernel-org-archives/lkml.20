Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386519;
	b=5iyYsjD3ebNHqFVyi7IuwKTOdHmldYDXN2FeAvjzyPzLCTjSkeCHq/xkuRDQGt+vZxVy
	 Nci7dPO7LOlgCn0FGiorpc0vZfiEhax4u0LhFtR5rflGqYejcK1pdOry+jtpP7fssois/
	 pyOX2mgOO/ufRdbXoebaiILHtTtg2/caV0FvSAkYsEbHwj7cTUP7g3GgNHnj3IOTN8dSL
	 nMU9lyJRKwbKxFEj0EU/hMS8vWu/0TvsIyT4bJA8jbvD9t42GfXCi2gFnsNiMwYOnGtFv
	 5zfejr/qnb2ucIwc8GhdlbmbB84keYnipSrMW7iefo+/vA66rTLCGBQ19QEp8xmeOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386519;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=leBldGOQmZt7O/6SkYIQPS1xwEKAHAsT12p86kInRCs=;
	b=OYiDaJ288w7nzNgjuA3HABB2Kho8xM4IHzVv8mepjfqGKSlmn80oshjo5iKTVVTZbxvB
	 U0Lgn/LOBNsLYUcmQhOnP83xVj7EBcX5bZFf+0DXHDT9BtPdDcbgIFmZFcc/6oz7iOXOk
	 pTB1rRuE9UsYPMpk3chXkSHPLQShwiU1KBi8ZQj/ReKoJkZNSwYFjmUIL27SxlwkvKHaV
	 PA97huXFYrej/qjxPCtMbMIUw9XhYvgtjuGARh8cR2Iyh1l8E9HPjciqAi6iCBvubRHIZ
	 wilxnY+UIpYmImIgBe+qs0G+05nFlYSLdjifGOr1sR9h5Q+Kto5kbTROJsk0N04jzEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kkO3X8dE;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214EB606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214EB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kkO3X8dE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kkO3X8dEtIq/pfB8hF/EctDfKJniYF45iQwy4EaBeddH62GADKqreCKqF7+hq1gxfVsXc02WbitE5
	 nWJlvyhwTyO2mDYtZzlBNvBn8lEflapm8sTkwI8HXlHhB7T93jdKVbm1OxWIfWFcnkEpGH5+iWuOeL
	 ab3Kbg7eI6iO+S5I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af42a55f10-dc288;
	Wed, 11 Nov 2026 16:41:57 +0800 (CST)
X-RM-TRANSID:2ee96af42a55f10-dc288
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af42a52be3-d5e6f;
	Wed, 11 Nov 2026 16:41:56 +0800 (CST)
X-RM-TRANSID:2ee96af42a52be3-d5e6f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: akpm@linux-foundation.org
Cc: hughd@google.com,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+aae8bd56cc1c38d50ec4@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] shmem: Serialize fallocate progress with writeout
Date: Wed, 11 Nov 2026 16:41:55 +0800
Message-ID: <20261111084155.80971-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

shmem_writeout() uses inode->i_lock when reading fallocate progress and
updating nr_unswapped, but shmem_fallocate() accesses the shared progress
without that lock. Holding the current folio lock does not exclude
writeout of a different folio, as the KCSAN report demonstrates.

Use inode->i_lock to sample the unswapped count and publish fallocate
progress. This matches the writeout side and keeps the existing folio
to inode lock ordering.

Fixes: 1aac1400319d ("tmpfs: quit when fallocate fills memory")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 mm/shmem.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 990f1b083779..5769cfab1d71 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3969,6 +3969,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
 	for (index = start; index < end; ) {
 		struct folio *folio;
+		bool unswapped;
+
+		spin_lock(&inode->i_lock);
+		unswapped = shmem_falloc.nr_unswapped > shmem_falloc.nr_falloced;
+		spin_unlock(&inode->i_lock);
 
 		/*
 		 * Check for fatal signal so that we abort early in OOM
@@ -3979,7 +3984,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 		 */
 		if (fatal_signal_pending(current))
 			error = -EINTR;
-		else if (shmem_falloc.nr_unswapped > shmem_falloc.nr_falloced)
+		else if (unswapped)
 			error = -ENOMEM;
 		else
 			error = shmem_get_folio(inode, index, offset + len,
@@ -4007,11 +4012,13 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
 		/*
 		 * Inform shmem_writeout() how far we have reached.
-		 * No need for lock or barrier: we have the page lock.
+		 * Other folios can be written out while this folio is locked.
 		 */
+		spin_lock(&inode->i_lock);
 		if (!folio_test_uptodate(folio))
 			shmem_falloc.nr_falloced += index - shmem_falloc.next;
 		shmem_falloc.next = index;
+		spin_unlock(&inode->i_lock);
 
 		/*
 		 * If !uptodate, leave it that way so that freeable folios
-- 
2.51.0




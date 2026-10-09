Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18C33EB06
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518433; cv=none; b=UcmBJq8bIqnTROpuA9tS2GdNxvsGCqmfXms+zzmXse7RxjU7vGyyRoACxwQ7cAV4YnNhdABpDbZUPYmKVPbsNPRw5sCPqcofAilNr+43skzSgatR06H2qj7HNhMUfN7UZlCI/UQpS9SgCo4LX1awLPTs5y5jP6lTjTWO7M5aa8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518433; c=relaxed/simple;
	bh=1gwjQYS1pTvbZXNzs9W9UZ0PgPmG2SHms41ZNgcJxc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POoPfRmXfDzfwoaDyE6McFDQPj7KYQ9LpR8zoYOHs8k2cY6/mYB3SfZi4LqP8RoMlIMmjl1UHLrKkV9AeT+YktWN5m4mM0rsek7tBkwnLkRoV6I+29lgYbT1gmFPO/Oj1PU7ByWtQQFmBEkA6kGAzHQAAC0Y0q4r1OtfFHpK0CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=ywcM59gE; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="ywcM59gE"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.6.233.4])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 04D9A1210EB;
	Fri,  9 Oct 2026 01:00:14 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1791518416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PhSnoMS+QHyFGUNhVEIwEts9Uoeh0mxukL6qHvSc900=;
	b=ywcM59gENzty52So8ZXDMzmrvHF7Kl4KtduUrBVgypJ2AzEOsvDmwTW/UzgL4mKko0OpkT
	5GfXQCBE26Fzf5MLTEhtBMwm7o3Iw1507WHD9uRDH+rBVmUHhq8s659CBtgtzPPFt0Y9/2
	UIkOpSL+jdlcztPUKERVi2VQlvT9k9wDfc6jR6jWQJVurzQzUyhxMPBKQ9YXIygRvkwApN
	L85DRCyxd5zPGPj95dB4TKl5ay8rJz9bVT1HddwP67xC7HdeZQWeffc7zQl/pr/NuP4j4R
	08JpJ9tIrnY9lt2QO0AhOVUC7uara1ig05HsTVK78HWYzNI8k4WQ01aHRRI+Pw==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
	syzbot+88ffc513fdcbbb39cdf7@syzkaller.appspotmail.com
Subject: [PATCH] gfs2: drain withdraw work after making filesystem read-only
Date: Fri,  9 Oct 2026 00:59:26 -0300
Message-ID: <20261009035926.229101-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, gfs2_put_super() drains withdraw work before making the
filesystem read-only. A journal write I/O error could enqueue more
work, which does not get drained before releasing filesystem data.

Flush any pending withdraw work after gfs2_make_fs_ro() in
gfs2_put_super().

Reported-by: syzbot+88ffc513fdcbbb39cdf7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=88ffc513fdcbbb39cdf7
Fixes: f458aafc5c21 ("gfs2: wait for withdraw earlier during unmount")
Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 fs/gfs2/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 06302c293..45260280a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -599,9 +599,14 @@ static void gfs2_put_super(struct super_block *sb)
 	/* Wait for withdraw to complete */
 	flush_work(&sdp->sd_withdraw_work);
 
-	if (!sb_rdonly(sb))
+	if (!sb_rdonly(sb)) {
 		gfs2_make_fs_ro(sdp);
-	else {
+		/*
+		 * A journal I/O error during gfs2_make_fs_ro() may queue
+		 * withdraw work.
+		 */
+		flush_work(&sdp->sd_withdraw_work);
+	} else {
 		if (gfs2_withdrawn(sdp))
 			gfs2_destroy_threads(sdp);
 
-- 
2.43.0


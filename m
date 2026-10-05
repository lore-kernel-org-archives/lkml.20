Received: from cvsmtppost33.nm.naver.com (cvsmtppost33.nm.naver.com [114.111.35.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37B3DFC6D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235455; cv=none; b=o6bk5ltU/0noTIAbriT1hko9wr8fDw1sotSIU4CkSsbX3+2+iuC4OtOx3Zza6hTY4LvrHMC8Hl6COfhN8fIg3dUvaD4dtzDPCITN/PV9ikP/ITX7czvsZHJIJGCFqwDxAGVtUQ8h0zjO9zqfRhXeowd5nxdMX/fptSEiaY8gl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235455; c=relaxed/simple;
	bh=ybvrWFY++MS+gDOMte92dl5DYyfVISipilA37EvA3X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YE0I4e5kh0N5eG/DLY3qULtvMi4Rx8/jaEEgssryStGABFQIZa9uSlfncSZD73O4v0eLpOYYvBhJY/q6MxzzGx6MV6xxtfGTHcpQwsCoLvRmPJP4ZHDYDYEPiQLnV6efT279sJmOz8zMR7/wT7iVUpBQVHsd6mOHUZB7whQbdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=qJnyDCcP; arc=none smtp.client-ip=114.111.35.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="qJnyDCcP"
Received: from cvsendbo010.nm ([10.112.20.44])
  by cvsmtppost33.nm.naver.com with ESMTP id 00QBjSJ+SPCYNtINRlAvCQ
  for <linux-kernel@vger.kernel.org>;
  Mon, 05 Oct 2026 21:24:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791235445; bh=ybvrWFY++MS+gDOMte92dl5DYyfVISipilA37EvA3X4=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=qJnyDCcPNd6VmJHUO9FIbIeHuEYtVRnxmw08BZGbQv9WoD0VtsgYRwvPCOnEYRA5c
	 FpHVUf7GT5OUOtvnauw6fgTGJHxNhxR+3oyOR5uziMQgFvGxMamPHgYvrbgqYhxZLM
	 3ip4XI0aNhJyOFd/MHTzFhMnvVvh/VeTOBvedVH9eBlw5bLj2fA1MN/trl4/ggpiro
	 oh5+MoV5fMvpgc+LWyZctYHHHaJ+DDQZB2LMGI57pcGGaa4T4fSDtGvttiPn4WmROk
	 ZxaWoDz9JTnMsUOySlgtx6vg609Q9ihWoH8GKNISE3Z+8T62kP5PyaMjc6ZAvlCP7F
	 UTyHT3ATzcvaw==
X-Session-ID: ZoGUcTVYTHWr3ovBTtiBpw
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKHmdjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: dwYmKoulFqJZ+HmdFAgq+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp003.nm.naver.com with ESMTP id ZoGUcTVYTHWr3ovBTtiBpw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Mon, 05 Oct 2026 21:24:04 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: preserve caller ownership of anon_dev on root insert retry
Date: Tue,  6 Oct 2026 06:23:54 +0900
Message-ID: <20261005212355.428030-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_subvol() preallocates an anonymous block-device ID and passes it to
btrfs_get_new_fs_root(). On a cache miss, btrfs_get_root_ref() assigns that ID
to a temporary root before attempting to insert the root in the cache.

If another caller inserts the same root first, the creator gets -EEXIST and
drops the temporary root. The final put frees root->anon_dev, but the caller's
*anon_dev still contains the same ID. The retry finds the cached root and
frees the caller's ID again, producing an ida_free warning.

Keep ownership with the caller across the retry by clearing the losing
temporary root's anon_dev when the ID was supplied by the caller. Roots that
allocated their own ID retain the existing destruction behavior.

The unfixed sequence was reproduced in two clean boots. With this change the
creator-side -EEXIST branch was exercised twice, each caller-owned ID was
released exactly once on retry, no ida_free warning occurred, and ordinary
subvolume creation, writes, qgroup display, and clean unmount passed.

Fixes: 2dfb1e43f57d ("btrfs: preallocate anon block device at first phase of snapshot creation")
Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
Tested-by: sungbyeongchan <tjdqudcks0424@naver.com>
Assisted-by: LLM
Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
Cc: stable@vger.kernel.org
---
 fs/btrfs/disk-io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index dc7ad92876c0..4a5e43dfde6f 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1355,6 +1355,8 @@ again:
 	ret = btrfs_insert_fs_root(fs_info, root);
 	if (ret) {
 		if (ret == -EEXIST) {
+			if (anon_dev && *anon_dev)
+				root->anon_dev = 0;
 			btrfs_put_root(root);
 			goto again;
 		}
-- 
2.39.5

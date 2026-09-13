Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BE2E7394
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789300088; cv=none; b=c/CNT1EGede7DyZmVsYWVPA5CMLrsLVdTaFvqP5HcBbpXgYLgUTcXYkvt1J8iwQAJdSi1TY30a8OZDuntJWi9eVtVr7pXCZlQZZlGgTRgBJHhcrwuJreitcJEwBj4he0pAOyguOSfh9hFZIZY8ISGRnJz5cTRgk1OdAyz8pV+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789300088; c=relaxed/simple;
	bh=Vcy3/JPS4PpmASyPCwcOoyW5ibRp31joRfYmtgfKEuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DiuU43fQ3syi02O9Zn1EVIYyA+HG2cg16yImaxFSsOiirRihJ20qHqnubYA5P3NYrio/yS7Li+pYkA+Vhj6GJqS+UmCPLxVpf9A3hSvELAWPDpQBmwoUFUjUia4r6Tq+P1dQ/ZG+q/J1169pm/3DVObGZ+/X3wZT0EgWx8L7+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVXSlzaH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVXSlzaH"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4b29fa803so999393a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789300085; x=1789904885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDUrtLaMT6jANi7+m/j0UcVZCw4+tagzNmCTTq6HPLc=;
        b=mVXSlzaHM+FBrpM3hxRWG+MrBpGjbOYTncS51k075OcAthmxu/E1YGPZOrnuvRHbVv
         N1CSggauDV3d03mS4nvjc70GKduMV+57e7M/3TbZScGZWAjrkT6RvSAkJC5ugBTwzwLQ
         JVpbLJRtaEvJ8DWB22H61AxUu334Bv3ZE7vITfGWtKL7QwQ03/1BamU6mzVNv8v0++v1
         3o8ZM4koKsdY62htwtrbHTBEJuUkBAtC3ftoqSTwtTgRNM07Vzj8h2Ot5m+i8tuZ/dbm
         iFtZV48cfK3GsLDScjL40PyiHiKy7RHWB1xne85psG0jtfkNtQOKX7N6gUIlDOkFwIkf
         Ty3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789300085; x=1789904885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDUrtLaMT6jANi7+m/j0UcVZCw4+tagzNmCTTq6HPLc=;
        b=qwAAz9U2ZVPxzetL0RvxLcN4nZRJpZkpU42RcsxRBYHJpPeCVUSLlIHQs1CP6lE8Vr
         U0+97Q+q7H6M2N0hqshepMvbUVBEVgmyFAWyFxRtpdFklwfUfoxq+6rF8NG39VBWEnW3
         bGwKDLUYqRaWBi1xigL+b6g5BlzedzKA6Ferqjlj5vh+eEnP0mGpaPnUxFxsh6nqsnkt
         FqtuQiQAodU+qS8J1UGIPQf6hqvPrNipQ+x7Zj/5jFCBBy6itqHVYtmltJ2601FgavV8
         5tOyPwtDGBxu/fkqJzuQbOcbLXzwYmv2eVNtu5GJAqd4SWdh546sWIvdOaXMYHLnnGLW
         Wupw==
X-Forwarded-Encrypted: i=1; AKwUvBwrT/PjE6G3ABgWNR/HA9ZPRx9sPm4PGeGv/7OkuS8+MoGBlVUaqmluyDFLbR9txHml2jiW4WfF7wq446M=@vger.kernel.org
X-Gm-Message-State: AFuF++kMqTUtkK11vF1cFAK7sFnRn2z+yeZzcu4IKh3br7ynaBGjuzMz
	pBXRm3LK4WTDPCHdWREMhNQQ/Jo6MRLbQ5DepGMG+dx5jLYrj9eA9sEj
X-Gm-Gg: AYBFou0UGme71dl0zqUokuRBt0ivQ+4TrmdW0jHk+Wtdt/lPg6uijyIvvtUCSRBXPZw
	1C6ZwIdihjzWiAPsdg/7OQgs1wjHOswINCjK0cFHNDLkivwSMEU0d4Ws+PJ8NWGx93vhlbTc2oC
	KpYrUMR3xYcjYri9vY0Wms/MDOO3TREuGiOhQlrRuGICjXrIgfXO6JVYmMOrXxmyb+bpyzQof52
	MfuvZlS4+NIFrWCZMTOwOTEK+VOL9yCzgQRPgMK43O9EMnh2uqZfm+oT1TDi5uxuhlPLIGI7QNg
	w2UfWFVOOc7I5B3PG7Ft6wxq0HqrYoxteXrzNrZAKCyDr8QRke34wlKdDHTPNQJLZSdBFJ9Ejrj
	H9XPZm5v0A5RijgY3W5mGtUYB3UTP7+6hV0W5SGmERFA1zRI9szpHrJPI6QWd++t7BW8QLj6XfC
	4MKpEwYLvayL0LXvP6g7Yp0mC4wXqEunOY8m+3nidgyS2Mfb9sbEhyXmYcZ+6kPDgHspC0RXWF7
	duMEENn1EXJt+ww+V5244k7C4n+zF+K
X-Received: by 2002:a05:6a21:3292:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3daed38c33amr22231241637.19.1789300085539;
        Sun, 13 Sep 2026 04:48:05 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab37sm3526331a12.11.2026.09.13.04.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 04:48:04 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chandan Babu R <chandanrlinux@gmail.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	co+af981e62f5c7171a@bugs.sh,
	stable@vger.kernel.org
Subject: [PATCH] xfs: validate buffer log item before reordering
Date: Sun, 13 Sep 2026 19:45:30 +0800
Message-ID: <20260913114528.842015-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Log recovery reorders transaction items before buffer item pass1 validates
the format of region 0.  A corrupt log can therefore supply a four-byte
region containing only blf_type and blf_size.  xlog_recover_buf_reorder()
then reads blf_flags immediately past the allocation:

  BUG: KASAN: slab-out-of-bounds in xlog_recover_buf_reorder
  Read of size 2 at addr ffff88800e40e364 by task poc/133
  Call Trace:
   kasan_report mm/kasan/report.c:595
   xlog_recover_buf_reorder fs/xfs/xfs_buf_item_recover.c:164
   xlog_recover_reorder_trans fs/xfs/xfs_log_recover.c:1929
   xlog_recover_commit_trans fs/xfs/xfs_log_recover.c:2053
   xlog_recovery_process_trans fs/xfs/xfs_log_recover.c:2319
   xlog_recover_process_data fs/xfs/xfs_log_recover.c:2510
   xlog_do_recovery_pass fs/xfs/xfs_log_recover.c:3253
   xlog_do_log_recovery fs/xfs/xfs_log_recover.c:3340
   xlog_do_recover fs/xfs/xfs_log_recover.c:3377
   xlog_recover fs/xfs/xfs_log_recover.c:3502
   xfs_log_mount fs/xfs/xfs_log.c:617
   xfs_mountfs fs/xfs/xfs_mount.c:1031
  The buggy address is located 0 bytes to the right of
  allocated 4-byte region [ffff88800e40e360, ffff88800e40e364)

Validate region 0 before inspecting the flags.  Keep a malformed item on
the regular item list so that xlog_recover_buf_commit_pass1() reports the
corrupt log through the existing error path.

Fixes: 86ffa471d9ce ("xfs: refactor log recovery item sorting into a generic dispatch structure")
Reported-by: co+af981e62f5c7171a@bugs.sh
Closes: https://lore.kernel.org/all/aqZALi7GdVprcNOh@cronus.toxiclabs.cc/
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/xfs/xfs_buf_item_recover.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/xfs/xfs_buf_item_recover.c b/fs/xfs/xfs_buf_item_recover.c
index 57929f115055..70e69ec731ac 100644
--- a/fs/xfs/xfs_buf_item_recover.c
+++ b/fs/xfs/xfs_buf_item_recover.c
@@ -161,6 +161,10 @@ xlog_recover_buf_reorder(
 {
 	struct xfs_buf_log_format	*buf_f = item->ri_buf[0].iov_base;
 
+	/* A short region 0 is rejected by xlog_recover_buf_commit_pass1. */
+	if (!xfs_buf_log_check_iovec(&item->ri_buf[0]))
+		return XLOG_REORDER_ITEM_LIST;
+
 	if (buf_f->blf_flags & XFS_BLF_CANCEL)
 		return XLOG_REORDER_CANCEL_LIST;
 	if (buf_f->blf_flags & XFS_BLF_INODE_BUF)
-- 
2.55.0


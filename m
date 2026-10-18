Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9503CFF79
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343465; cv=none; b=jSgUttOr4QLWAwvZ0XuwFQuDe1ghbxQ01OKmBmJsUgVe9s0jl1oPRJKr7JbV9MLadu8zvxvRUdhgdsPYNlrlw1BVbe8qA0ZvENu6fzS6iGge/qDePExE/wAYZq8rU0iFf6B7Ph5uGug8X+PPs5b7SLxFsR4h4vkixnkTBYqoDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343465; c=relaxed/simple;
	bh=RngPiRoKRo1SDWTQaUoVzqDNzzjh+lwILzwjsOjipso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TViFYV/k960NfFCFhPIE6483/MrnVyU7s3fmCtbATlnV9u/CSWxLndPAAaUblKpSIAVYTqqsK5zy3bDKUlkC0nQIvdKjKn/Jao5nF/y24LDUVz4gl/TGqODBUE7Fudsw8DVYX+QEi822EhVIDIt+TZ/LuLETjxvUTMIJ9k0orf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDfOE8vG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDfOE8vG"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1398248e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343461; x=1792948261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJdJrirRvF3k3Jt5AvgoO9jwhCR5BlxhBGLKGtRhtBw=;
        b=nDfOE8vG7D+x9qVwgY680MWFj1/vNe67kKtun81Zst27hIGnRV1f+7jcHHcxKxGxy/
         rf4v2/gmlYgbeCaR1W94xVQJjrw8CFFbrrj8OnGVfn2AY2963hkH0FS1NNdP0Bt7kMBp
         uy0s1SO0XziEfv3AFAMziBH8Walj9d5Bi90q3sY7jIIdcXS8z7b672IplVYRx9Sqt6hL
         euI9P1H0WowQqtpaO9GtpnoIpJb1O+wRfbbPruclYGOEVmEQmMN9AqikQZPnnMleW/5T
         CQhIhIsD+WCGwg4Y5AZsoz2a+AIobXbzzCfcLJwLoUdav4CLeECIbC4uTErfbAQ+0hgF
         iGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343461; x=1792948261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJdJrirRvF3k3Jt5AvgoO9jwhCR5BlxhBGLKGtRhtBw=;
        b=zg+BYtRgCOMW3DDE1D6Z2TDobzifoL5KAfbKf0Sq6GesYQRKxhmdU1XMyqkYobtN7A
         iiKcnjP4JGGxm1ixYDgYRIPqHcSBgCrapbJu01L/7LYz6YX0+ffIGj7MnNOT+U6Rv+XJ
         Cp/8dgBsLYSMPgiCQ/HxhfbLBDuJAWUL8fRXXkj32OzjY7v7ir0X3p8p0WDtSK9SD3ox
         2FqKDhrciTV56oGECe3FChugguGGmnyAmTlhBfV3iDN+uuU+Omn5yl0pKhvSELMuH/2N
         1MLNP+uc8MeRwdp89mmJmUy7EhwSBjanlDzR3pk0UEAq6P0+MQMiHA1TbmZI5CYRKn9P
         fwag==
X-Forwarded-Encrypted: i=1; AKwUvBys9C4uDiEMJGEAbtWNk7gLhq7YyzN2hq57WsW/CaJxWXAZQG4B66MRi9CeVskY1T9v7IlgkmoKwN9bNkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIY7weIt55zZFR4umT5LrXVk51DjXTi5HfU3UxArbaVJSCirt
	ty00shn8barY8aM+oxYGHQDINH4/6s15Ddib2KQZUgtgqJlv+EpQWoTbhHj5f8Go
X-Gm-Gg: AYBFou1m0sTNr5FQPFp+ZavY3ovQkV9IR8OFXr9gb1CMXhLZ1rI/dVQowx98EN5mCfp
	HPnfRecupbY3O0GkPgmCgG6X89o9S5v4UsnOXypKjmeAZYKLFIzvk8FGeuLDb5qWxvbwsYj/pGy
	5+Yh9NScrmF7PYidh26a0btd+gh0azsl1DUuwVdQN9Ntg3XHUqnmzkKcXIyK7EcC5VeU2yzMyOb
	GDkX2jn6TGjIJql/DO1HPzfKhC/j7zMgsxtgfk1UtZS24dFoiJvOItP2JUAvjb7/xrVz/qNmWWh
	3/AArtuxDnimGOyXr1T45xjGzuOYkl1GRK2Q3SzB1z+roIBco8ScyGI4MJVgFrIn1cLHBuTO71j
	m+HsxwC6ImaO6qt16a0Pm60NpMTLoyON2XAHXzIs2ssmZmE2N0pzMwH1e+cAAwk0964LGe1262M
	gEJ0HKoTYFVflKFc4uouX7UAu2bSMyj6CAxKaO3WPij+LpCoSaqaQ4OhY5Co/poOMK6yTqSAl0r
	cfEfj+a6Fyf0XKDBrkFAu5xAtq29g+LFFvrBd0B+6rUSg4lzhQhCSwVHj8DanFg7XpGNiJTQOey
	vPob
X-Received: by 2002:a05:6512:39c6:b0:5b8:e99c:cfa1 with SMTP id 2adb3069b0e04-5be50a595a4mr1746114e87.31.1792343461073;
        Sun, 18 Oct 2026 10:11:01 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-213.broadband.corbina.ru. [95.25.165.213])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63dcf0sm1499694e87.76.2026.10.18.10.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:11:00 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: Dave Chinner <dchinner@redhat.com>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>,
	syzbot+c32fff62cf4913d345d0c@syzkaller.appspotmail.com
Subject: [PATCH] xfs: do not release buf log item prematurely in xfs_buf_item_done
Date: Sun, 18 Oct 2026 20:09:13 +0300
Message-ID: <20261018170913.3104-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a buffer with an active log item is written synchronously to disk
via xfs_bwrite() (for example, in xfs_sync_sb_buf() during
FS_IOC_SETFSLABEL), I/O completion invokes xfs_buf_item_done().

Currently, xfs_buf_item_done() unconditionally calls
xfs_buf_item_relse(), which frees the xfs_buf_log_item even if it still
has active references (e.g. bli_refcount > 0 while the item is pinned in
a CIL context and queued on cilpcp->log_items). When xlog_cil_push_work()
subsequently runs on another CPU, xlog_cil_push_pcp_aggregate() accesses
the freed log item while splicing cilpcp->log_items, triggering a
slab-use-after-free:

  BUG: KASAN: slab-use-after-free in xlog_cil_push_pcp_aggregate
  Write of size 8 at addr ffff888036db9c40 by task kworker/u8:7/300
  Call Trace:
   <TASK>
   __list_splice include/linux/list.h:577 [inline]
   list_splice_init include/linux/list.h:619 [inline]
   xlog_cil_push_pcp_aggregate fs/xfs/xfs_log_cil.c:137 [inline]
   xlog_cil_push_work+0x986/0x2a90 fs/xfs/xfs_log_cil.c:1417

Fix this by checking if the buf log item still has active references
in xfs_buf_item_done(). If bli_refcount is elevated, the item is still
owned by an ongoing transaction or the CIL and must not be torn down.

Fixes: d2fe5c4c8d25 ("xfs: rearrange code in xfs_buf_item.c")
Reported-by: syzbot+c32fff62cf4913d345d0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c32ff62cf4913d345d0c
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 fs/xfs/xfs_buf_item.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
index 1a4ef34af8d5..6b32061bac53 100644
--- a/fs/xfs/xfs_buf_item.c
+++ b/fs/xfs/xfs_buf_item.c
@@ -1067,6 +1067,14 @@ xfs_buf_item_done(
 	struct xfs_buf		*bp)
 {
 	struct xfs_buf_log_item	*bip = bp->b_log_item;
+	struct xfs_log_item	*lip = &bip->bli_item;
+
+	/*
+	 * If the log item still has active references (e.g. pinned by the CIL
+	 * or held by an ongoing transaction), we cannot tear it down here.
+	 */
+	if (atomic_read(&bip->bli_refcount) > 0)
+		return;
 
 	/*
 	 * If we are forcibly shutting down, this may well be off the AIL
@@ -1080,8 +1088,8 @@ xfs_buf_item_done(
 	 * Note that log recovery writes might have buffer items that are not on
 	 * the AIL even when the file system is not shut down.
 	 */
-	xfs_trans_ail_delete(&bip->bli_item,
-			     xlog_in_recovery(bip->bli_item.li_log) ?
+	xfs_trans_ail_delete(lip,
+			     xlog_in_recovery(lip->li_log) ?
 			     0 : SHUTDOWN_CORRUPT_INCORE);
 	xfs_buf_item_relse(bip);
 }
-- 
2.47.3


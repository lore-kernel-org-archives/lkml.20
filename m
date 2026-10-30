Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371118;
	b=YVljCE4ddTclJXr9YtPRelHYpJzO95gntQXXE54tPRcvLn3cZyghUDWa0VGXIc3m94b4
	 42myKjxomf/RxTGISwVj44X61YzjWYRoWG1MaHrAW7hW77JFyWgiQ4+w0wWOdVhb8iJ5R
	 bmWu0cg6jt1hpo6oph9H3k72r08FlDOhytJ0EBndNlFEopluSNf/b+LPm4zcDp9D9y768
	 LnlRLb8tm6NyzRgCiUyu7MnrcM1MJyyQ2YaNzE/ZGPVFzOOOfoJ0JD9pv37bf/MMxFk0A
	 nnaHI5hAbEWUCgkYZm+Q8zBOtQIiwBN5F69YyzASmeY43lgsZrcpyedAmvpwP4YFOpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YWVdVdDv8VwCrLHdSZsqFMcHtvb0punvOdbIhnhu5XE=;
	b=lEqhcv0yZUtKdRsQW6RkiECNtbjqow6Juo+ysn3A+b4UadfO3n3CueWkw3vuwqQQf1xQ
	 hi1xbqhVjW7oFAJOUBXjop1MWGJML7hB1vBjWt6M5hlobCYcIcO2+r9s/m2Hvo5CKSkXt
	 MGSSs1wx+jN+mX6z0zShqlLCaX+4BzWVLxXCcuW6nC5vuIzJpcheM99FjasuWiIuQRN2m
	 3U3qvYZyu0IBLL9sHXvOgMtwcz3zu+gWCKXvGVVjD6Oa9VPJMmyGBk9kpP7nO/WSIB5s1
	 qF+fcp2KuzpbNwv0835+PTsJMkEN1ssok2rS/NhaB8qiyAJ8qJBfhiQvkz/XldX274Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=T4ngUMls;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5D606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C5D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=T4ngUMls
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93efc0452b5so52792785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793371117; x=1793975917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWVdVdDv8VwCrLHdSZsqFMcHtvb0punvOdbIhnhu5XE=;
        b=T4ngUMlsgcJdtv3aDZVOcuI3J4DtwPPb5vGgEakgUqH8ErQNyQzHrNHb6mhn1DrpL1
         Nj6nO93qyJtN9C0x1uBKJV0ESezHbjI0Z/sjtQYQ7/xHjXfsegSC0+TwgocuY7IxheWg
         mYdJe0sYnbLZNl61itKMbLLDMBk4tS6hexZ5YZJbG9a26fkH6LeKlfT5F6Ga5aOPg8WT
         WUetK+nneOZ5wuE2YcTxad7CGcCQK1S013Ik/ujcLf5PiKph4Ijlic2XBN2N0lNmac+A
         E7vHHTl7ETDAQw4CdOOVWY1pUGLRn0puG5it2mT42DN6Rk23T+CSbgaUNmS2Xo9Kdask
         jD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371117; x=1793975917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWVdVdDv8VwCrLHdSZsqFMcHtvb0punvOdbIhnhu5XE=;
        b=OtUwa/f4mlGf08nG/tqXjzDC+HXm+1N32S6z/VTuY3JffV4zlwD0DZXSH1B4DDtR7k
         GqGIbVVZwEwpgmb7LP/eLS4fJxjQuXv/nelv0+zGmqFpHbc316MElnj1raVVDWwmopOY
         o8fOT7S/DlC958TrtnZ0Ki1m7hvTMtOcAKS5Z3ZAUm2axQXmC/LjFV0hwZbhXwbqdk9W
         pX4brNK4Y8EChBWm2LNDBicwNUSQFoEaIgJeMmz3FQy2l5GLe17coW3QcZSMdWkc3cpF
         vLWsIindEtnJRWsNeo0kSJwD1FL0U0cZD6UXSk/r/BQqpczQYpxKt90k8tKRrSCBKGY+
         MLUw==
X-Forwarded-Encrypted: i=1; AKwUvBxh2HjtifEHW/hvjMHjzsf9OydjpFGdZjVk7nSqR1W/wrXX0YrE2INEeHL3E7WPDkulmhygBDEGkrO9l4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4w94XdowFU6fs2uuKUnFipY5rq7a+DZMGS/WXUDZWY7TwH3KV
	mkCI31ELmI52r+xX+I4TEtxkGrpOT6Kw53TfA5THcz2iwiozNSV1ViLseEsYh6oomyZe2H1ltad
	VJFGSmAM=
X-Gm-Gg: AYBFou0OI92ator5fs7qB/tBKgZZNERRiYbSpoPxvBv+AsO3GZoGcOT32XnLaqmL/hM
	+IsaC9A67gN9bCAbp2XYjM18tuaiJIeZ9bYOt4oDssleP4C5T5lSIVY/aU17WqhuAEhz2aOYMMm
	PgxBI9LFmNrAKwsP7KFQKQJMAZUU3lzarM5nh1AZg0kxB6qcyOQOS6IabICF7U36pZxshFu0/xS
	jgHcpA9iF3mjduWCK9j7B02N2iWaMNiVND+5oXCWbxbWxv1VvwrjrwdmkKGg9AbsvmjfdBd2BLz
	o42XCu6jLCVtPPkGYCUzuynMByBHHLOvG0YPauBvozF63+wPoiGBDp+whL3nHX7Z44jlmSf8gFp
	RnjSyYh/QbeoLum3JF8cokp6RDHUoQcU5GTvBM/K56yZV3v+SQz+N7Bsw8/3439493HGv0o/nDl
	kpqi3vIR2vAyg6hsKO4VEd42jTKVzBRtpVCJxrozXaRzrfvcZe5ibR4rxxb7RJyfMLxdcNpX+Qk
	ZWfaiSxCjimSf2Tl4wprJubFP/Jy5oq9TNz7RJR6iJ8X32XA23VHh1R/sCyq7rIz711tNCsZ8yK
	BAqcQklB5/Sc1YBXLZX3UIyxHYEgkcOb/SepOCteu36K
X-Received: by 2002:a05:620a:31a6:b0:93a:9ef5:d370 with SMTP id af79cd13be357-94421541a71mr424179285a.1.1793371116843;
        Fri, 30 Oct 2026 07:38:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ae7f53sm154725885a.41.2026.10.30.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:38:36 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 30 Oct 2026 14:38:10 +0000
Subject: [PATCH 4/5] btrfs: don't report success for a skipped log sync
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-b4-btrfs-data-integrity-v1-4-f4d4196731e6@toxicpanda.com>
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793371105; l=3574;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xvriq4k8yU1xTo1L0ni2NpLc5WPYJJotLDeDpDjcR/g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEI3nd3pglE2BkFGIHKQm5gtuyKdRtKifCUo7jyNYl2tL6LWZjsL6Lt1LrCfpa3fz9yNGdSQsfI
 h1Yl7r5GC1QA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When a commit of the log root tree gives up, because the transaction
needs a full commit or writing the log failed, btrfs_sync_log() still
advances log_transid_committed and hands the result to the contexts on
the list. Unlike a successful commit it does not advance log_transid, so
the log transaction it just retired is still the one new syncs join.

A sync that gets to the log root tree after that adds its context to
the emptied list, sees log_transid_committed >= its log_transid and
returns its log_ret, which is still 0:

  fsync A (subvol 1)           rename       fsync B (subvol 2)

                                            btrfs_need_log_full_commit()
                                              -> false
                               btrfs_set_log_full_commit()
  btrfs_need_log_full_commit()
    -> true
  btrfs_remove_all_log_ctxs()
  log_transid_committed = N
  log_transid stays N
                                            log_transid = N, log_ret = 0
                                            log_transid_committed >= N
                                            return 0

btrfs_sync_file() then ends the transaction without committing it, and a
crash before A's transaction commit loses what B was told is durable.
This was reproduced with delays added to btrfs_sync_log().

Fix by advancing log_transid when a commit of the log root tree gives
up, so a later sync joins the next log transaction and either commits it
or gives up itself. The check for an already committed log transaction
can then no longer be true, so assert that it isn't, and still force a
full commit if it is.

Fixes: d1433debe7f4 ("Btrfs: just wait or commit our own log sub-transaction")
CC: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/tree-log.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index 1d9dfb63fc5a..b542b1d97989 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -3437,11 +3437,20 @@ int btrfs_sync_log(struct btrfs_trans_handle *trans,
 		goto out;
 	}
 
-	if (log_root_tree->log_transid_committed >= root_log_ctx.log_transid) {
+	/*
+	 * A commit of the log root tree moves log_transid on even when it
+	 * gives up, so the log transaction we just joined can't be done.
+	 */
+	if (unlikely(log_root_tree->log_transid_committed >=
+		     root_log_ctx.log_transid)) {
+		ASSERT(0, "log_transid_committed=%d log_transid=%d",
+		       log_root_tree->log_transid_committed,
+		       root_log_ctx.log_transid);
 		blk_finish_plug(&plug);
 		list_del_init(&root_log_ctx.list);
+		btrfs_wait_tree_log_extents(log, mark);
 		mutex_unlock(&log_root_tree->log_mutex);
-		ret = root_log_ctx.log_ret;
+		ret = BTRFS_LOG_FORCE_COMMIT;
 		trace_btrfs_sync_log_exit(trans, root, ctx, ret);
 		goto out;
 	}
@@ -3575,6 +3584,13 @@ int btrfs_sync_log(struct btrfs_trans_handle *trans,
 	mutex_lock(&log_root_tree->log_mutex);
 	btrfs_remove_all_log_ctxs(log_root_tree, index2, ret);
 
+	/*
+	 * If the commit gave up, log_transid still names the log transaction
+	 * we are retiring. Move it on, so that nobody joins a log transaction
+	 * whose result has already been handed out.
+	 */
+	if (log_root_tree->log_transid == root_log_ctx.log_transid)
+		log_root_tree->log_transid++;
 	log_root_tree->log_transid_committed++;
 	log_root_tree->log_commit[index2] = false;
 	mutex_unlock(&log_root_tree->log_mutex);

-- 
2.55.0


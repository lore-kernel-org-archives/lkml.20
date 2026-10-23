Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783340;
	b=YCGXYn6q+rkUXKQpP9hbuKlBpEmg2MZ79eqACQkhreSM4Adb4fFuDXWZhAOl4Q2jXzrR
	 d2KKqF8H83b1bae55dX07NApIQ7GLgHYLfhHtXtrez7UIau6TnZ1AHWEiztyFWutb0HSl
	 Nk+gSn0KgR5mMBI/rSAO/OyUHMnCfFcLycumRo5i6xhEaJPNcuuR49kDKZ2Ns4oi5l/In
	 cc9EE2zN5I8NrZxy9T8wUGEOAel7mj38XoyQ6TvFSXZTGluv19HowdnhJl7PBoxIQi3Yw
	 /X6z2hAxFbxyxX0MWtLlxa1vaCNKUTUKcWvjoaRiPredZ7x49E3jWMRNDP+mQ3FdbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2O8huCNDA9D6LhH8u5r2l7pNtY046Fm8Q9bS6RsUJDY=;
	b=ymX1HSoWqnR4RuruG56JqWagA74uwKGq7VHsNAP3bPs00gzcEpSgQcMtyYusicH/2h7G
	 ZBCZ3XHdr9wrvoDXzBkspZckAKAQIrDcJyZ9Nle0e/JXarZXVavZbNXp6xZjYPPfKWUgX
	 27/ngTsbPBjd75geYoTwof4+HkHOZL8RB1YHKzHD7Zs5mTaOKS4+HpNLUw0xZNN+EB1PD
	 OrVGbW5T7pje6ItIGvJBjrlf8FmQcAx1W7Qn3vcCfo9sgt92FxMXJEfGJXGaOtPkfmNdd
	 UHro10MEFk1iR1kJ9bvD2QT5pPILlf6uoT3PcYwW6enEU/1Lbx8xXb/YGMJF1V3PgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=FYo2dUm9;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53034606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53034606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=FYo2dUm9
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-55651e7de9bso685488b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1792783338; x=1793388138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O8huCNDA9D6LhH8u5r2l7pNtY046Fm8Q9bS6RsUJDY=;
        b=FYo2dUm9IDzTxiP+JO3yjXkilEcWtyqPRXdTw0z6K6HCizYBBurOEvQmtvbdr2iDnq
         QOJIdi5+DONOLbX7xJgVbVsIbf04NypIzEO3tcy288Z6vSFmcaVoDaN6TJHKPkkogNVF
         xFJ1YYIxkNaIEli8ASWpSHHMdWWy01QKtqatUP8e1jTjCyNRIMmyRkK5FenOsDGYFjbG
         XyeuPwZgY0aH5cKpMyt4KlwnO0l/KoDDWVfou2z2L4R6CSaBxoGNjidw++L66qsx/WP/
         VwqCGOPLM3/n8nYMbnLGpoC+d4oSShK31P+Tj4SpbC50hAEpJK8FTcWAbt3fNUj1xeaD
         xxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783338; x=1793388138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2O8huCNDA9D6LhH8u5r2l7pNtY046Fm8Q9bS6RsUJDY=;
        b=MU1kS0SCkZgzuwoyIaokPHm2kBsBX3nZgbL+wejdIEJqGZed8ACL0CUfpbA5kyjkW1
         7eZmIpBKoB8HJac2y1/L8Umd61LQyb8yDSMwkIueyPA4Gsmg6ZVtRYpT+ONM/eBl1EvW
         UmuLl2ft/Q3ZR/nHYdGPvxe/Wr0TRuwcgBm3lg07Kf+ddjd4naVpyCuGm3nHXxyGSoXg
         sbtnGOnlCVHZRH15hMsMfy/ZOjbeoXmkSUPAV3d9Sho71psdZNCWH7pFZUjJBOzdLi/E
         kHWV3AujfOXO/WEovKFUS/CTybJu3otgyEch3YPlJlk22dOBHgpn9pbNuqG3XuS9SsUg
         hArQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvizJX94lnMI7OmL2caIrwrPF1egsTaxS+34FzWgmq3V+i8hUznWR1DJZH5Iqku5WAjDrGmM6avzjXV4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIFEIT4rIysBLYny1fqtj3zlfZmLV1DM7rYR/sZBoobAKNwvfc
	VQ0LR6TqH8ZIzhgSl49DGmwi05P0Y0ubbHwAjx1TQXHCWq7mbRbpjAZSIr9WeMJxyOY=
X-Gm-Gg: AYBFou19wzpQ8iRZxKInmFpAvq8OZ9ejY9ZttnUt12URFtFr84q3K7hW3vk7s3AsIwB
	6h1o6wr6GSBPSrPc47wavKJXai+rD01c01EtDquuSjarixBzVAIABcogSwTqqi09NqE+NKPNf5D
	dpeEd3TMuj5YHz9O+vVlcGDtBegmDGTjqEW1sJL7CKvyvG5ml8+yW3l9jsSY5mDSzndCJnYPkSl
	ZSwirSUfw1JJAiw3g4obJz8t2KuVx0lGQm8AJ+WfXlzXf6OIIw0G2LWFWTnJnB2a2w7TaIV5N1v
	DSXT/xD5ndq3iXfPWMd11MelDKaSCUOIhJqXWibLnvnhq1no1FGM6lSLtHrEKIBMV/ID2qwPO66
	OogDOHWV2BbBYYeny92Q+29OfrHBmPTZ0GmBnIMoKNS/W+//XnTSxTpIXVwmFqzArqPMrjdPVsQ
	NujYe901bfHLCRxL1FIaMiccrc2jwMtQK/HrPKP4AawHwjsIMXxGLPM0Cd5nM3+qRiRFquLW1ww
	9I9U6tWGqVw5vu95R/YGG3M0+K+b9uo+vvoMo0bRRH6qjrIF5ArQh3gpkO0SZ+SnpYhbNXx1mlX
	WGzNjV5feNFUpz05PG8mJ1o=
X-Received: by 2002:a05:6808:1982:b0:4f4:3790:65fd with SMTP id 5614622812f47-55c002b7e97mr146807b6e.29.1792783338131;
        Fri, 23 Oct 2026 12:22:18 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe114ba4sm409050b6e.3.2026.10.23.12.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:22:16 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neilb@ownmail.net>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfs: set NFS_FSDATA_BLOCKED before invalidating d_seq
Date: Fri, 23 Oct 2026 13:22:15 -0600
Message-ID: <20261023192215.1795577-1-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023015239.2163480-2-neilb@ownmail.net>
References: <20261023015239.2163480-2-neilb@ownmail.net>
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

block_revalidate() calls write_seqcount_invalidate(&dentry->d_seq) and
only then sets dentry->d_fsdata to NFS_FSDATA_BLOCKED.  Because ->d_seq
is invalidated before NFS_FSDATA_BLOCKED is set, an RCU-walk open can
get past an unlink that is in progress.

The barrier in write_seqcount_invalidate() is issued before the
increment, so it orders only the stores made before the call.  An
RCU-walk lookup that samples ->d_seq after the increment can still read
the old ->d_fsdata, and so ->d_revalidate() accepts the dentry.  The
walker then waits for ->d_lock in lockref_get_not_dead(), takes its
reference, and passes the ->d_seq recheck in __legitimize_path(),
because ->d_seq still holds the value the walker sampled.  By then
nfs_unlink() has seen d_count() == 1 and sends the REMOVE instead of
silly-renaming, so the open proceeds on a file the server is removing.

Set NFS_FSDATA_BLOCKED first, then call write_seqcount_invalidate().  A
walker that samples the new ->d_seq then also sees NFS_FSDATA_BLOCKED
and returns -ECHILD.  A walker that sampled the old ->d_seq fails the
recheck and retries in ref-walk, which waits for the unlink to finish.
__d_drop() follows the same order: unhash the dentry, then invalidate
->d_seq.

Also correct the comment in block_revalidate(): the ->d_seq recheck is
in __legitimize_path() and try_to_unlazy_next(), not in
legitimize_mnt().

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
Neil, this answers Sashiko's second point on 1/9: v3 still calls
write_seqcount_invalidate() before it sets NFS_FSDATA_BLOCKED.  This
patch applies on top of v3; fold it into 1/9 if you prefer.

The window with the v3 order:

  CPU0: nfs_unlink(), ->d_lock held     CPU1: RCU-walk open, same name
  d_count() == 1, no silly-rename
  write_seqcount_invalidate(&d_seq)
                                        __d_lookup_rcu() samples the
                                          new ->d_seq
                                        ->d_revalidate() reads ->d_fsdata,
                                          not yet NFS_FSDATA_BLOCKED
  d_fsdata = NFS_FSDATA_BLOCKED
  spin_unlock(&dentry->d_lock)
  REMOVE sent                           lockref_get_not_dead() takes a ref
                                        read_seqcount_retry() passes
                                        the open proceeds

Your afs 1/5 also sets DCACHE_BLOCKED after write_seqcount_invalidate().

 fs/nfs/dir.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 53cd3adf3ffe..79331e0fa044 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1879,15 +1879,20 @@ static void block_revalidate(struct dentry *dentry)
 	/* Any new reference that could lead to an open
 	 * will either:
 	 *  - take ->d_lock in lookup_open() -> d_lookup() or
-	 *  - will check d_seq in legitimize_mnt()
+	 *  - will check d_seq in __legitimize_path() or try_to_unlazy_next()
 	 *
 	 * Holding this lock and invalidating ->d_seq ensures we cannot
 	 * race with __nfs_lookup_revalidate().
 	 */
 	lockdep_assert_held(&dentry->d_lock);
-	write_seqcount_invalidate(&dentry->d_seq);
-
 	dentry->d_fsdata = NFS_FSDATA_BLOCKED;
+
+	/*
+	 * Set NFS_FSDATA_BLOCKED before invalidating ->d_seq: the barrier in
+	 * write_seqcount_invalidate() orders only earlier stores, so an
+	 * RCU-walk that samples the new ->d_seq also sees NFS_FSDATA_BLOCKED.
+	 */
+	write_seqcount_invalidate(&dentry->d_seq);
 }
 
 static void unblock_revalidate(struct dentry *dentry)
-- 
2.43.0


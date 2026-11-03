Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718352;
	b=lEyrYDRzXHkOrw3fgZxq91C8qR6h+WMyXXd64dWuAgHoh+CDdi8bneM2E+DUGtBUuIcb
	 +h2TdMYuDC/SoN3qcS3EPuqppupM56th20/UH8bBs//oAARVqOI/bsTU0e6CXMapknSK9
	 DDggAIwBqSqLg2il2Lxzfg/upm+Q8w4F6rQTiD99/KFZAtnDekuT1clVSOXS4+3tmOJ0J
	 BXEbE2b9pPMtOHJv91ODxQjlLmXItu4T1HEHMIb0FKEbiPNn166d8swNdnvHLSJKIknbG
	 r26HnZJc+aIBUk5Aep7PXxr90ss/ZUEgWCKBAyKcTYdlNjhd7cKUp7ktqfsjqWrbo2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lAa/3aJjQPYp1qwn90DpoaP/PT6OS4IOMITQs9V5xd0=;
	b=uwTqG+SdyXULjH4E/7eVlpxlf85fMJzSdZcjNFWxpIt1OyDkZ5PKG7w4gKzKRNI1aRmL
	 vydwhC5JXzjXFXHGhGyJkVONGVos8k/JJ9kCfTeLA850To1vyk5ClNFp1MvludAelGOPu
	 IrYj5A51+NqUK/sgCRMHxjrxbj8avmr0lOhiMSdF9/0vES1ho2A4CxY/w+8tHCW3nYZIg
	 gUpAX54iGqydNV3vGlN6EWpMt45391tjfWBI63taO7DetljZbmCloutRY7TKhVXvcaAo5
	 OC/vqZhC7O18wcl4/+HFzc8KnzOOm+HGuxZDqYQgR/SiADYpURZztzKrqb/7NZ2MXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NBNXcPHR;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCE606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CCE606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NBNXcPHR
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1192996e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793718351; x=1794323151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAa/3aJjQPYp1qwn90DpoaP/PT6OS4IOMITQs9V5xd0=;
        b=NBNXcPHRVhfotKqrLNY+IG8lG5uIbvofkj0aI9bAqJCBAHo/LGAftaMqZeCpS66ecz
         gcFdDkkekpZb0uHt5rVYeuZvVJnDh3LYzf/O9UZAe/VinE3LvbwTodsOQOgIp01ityQQ
         PyX/HAB+BH6NsqogkcGiT96k8BCovOJbsXCRovxXl5B1yLiZ/GlWzSaL15faBygv6sU+
         In4p9RwatKeYLmgPY+5BWeZ19dykPmN190m0xPgwlgisWD1v3Fh2D1xO7bR3mhU/TD73
         bKdkDrSL18p12J0TbUUuprXMRiJ3hn4mt7c/30eORkiCzgbdKdJN6wfpQidKLB5iYFgP
         6CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718351; x=1794323151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAa/3aJjQPYp1qwn90DpoaP/PT6OS4IOMITQs9V5xd0=;
        b=Y4ghn1FQYQKYgP4p0opZYbWcrtNw5zkINQE9hIuEBM9i6yEdb90exAZO23L2lEqDq0
         jfgEvIMSIuiwGm5GICnKbSECMMQ+AOxZjRHgMyN1KRxzV7fEY63j/FSxhnajBfrTPNDy
         NovH8BThgtqnY/oBuklnPNI12DE9XBmQN2hvGS/ZWqe7Qel8kYc8eXe6WqIn/HMio7fi
         C7y1yvU/e6UkQgN+Zdb5s0K9R8D1xmkOVZgCfVDhg+sAojOidLB5Z9ILVQ32ToCqTltJ
         XKgIOKLg0k5xhc9uT9WXaZs6jDAbwZJwhAwoNzemlviRIOIfhDMZzpICqgxovFYM/QgP
         TQ+A==
X-Forwarded-Encrypted: i=1; AKwUvByL+igNfXXBSwqK4JxWk+iQoUzwzdzxHBW9vTgb5/iDju03qEFKK3A+4x1887MLf16hz3p5QEsGy1292ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bcz0n/Cltqy7hAA5K3GXXTUSvY2N9iGhIx3RqxPfGPi2YnET5
	mM0cTDLc1A1afc5hkAqsTvwGEoewWBF7aIR84OQJcPiBynnH8CtTBKEVi008XAi7pKw=
X-Gm-Gg: AYBFou3+cFu3nHAp2yxyvnywS2gbPeRB5C4m+R6aLfOk+WPmJjsqhGtxC6yCtayMAGS
	iT8V/arsvUnvMWkoNgxFz7TFSpoT00mTBXQxbOcBPDtcpUVBSuoT58epWfMP5Psc6nXsEUt6Bbu
	aBf7Mv6bXqU/ad12yypki9iJOCNGoq0zwanZZy6lyWwE3HCN4PsvSYLsl0gtpsVZpdCZuga5kbz
	rVVI4f9px2L+KwiRcmTDgyPhehLlMdsWF2PmvTu0MxxUbDf0b69qaDhz4fKgo+Hn6iuE0X/WJLT
	42h2zD+j6cRGZt4T80V7H+Sf4P8Z7uqLt0WDV6pILiRIDEV0XaN75oCGtwO881XJ/o7DQG8Fc1f
	46IiuBg4q3SCIFW+T4FWTrFo4Fpy0R9UopszBkYWGF2ZYiUfflTme5dGLRzc+1pdz0Koud36Omg
	li/+rpS01TiMnNRsAI+OO4MwmyTA4UHWMhfuZuSx4EDUphyM1NaaQYhZz4l6OOLGWizCCVslm1p
	GtEgJoa0QJodHQmRt9D0pmk7d9lac+yuZecwzusATvCqZL3+Do59Qz65i9jXgTaLYir8kjV1pVG
	yytsaSf50nmFhWc0C+ZqrlGn+2ddv6pAEJE7lOgFI3Qc
X-Received: by 2002:a05:6122:4b8d:b0:5ea:e905:2039 with SMTP id 71dfb90a1353d-5ec6894e113mr5697560e0c.13.1793718350840;
        Tue, 03 Nov 2026 07:05:50 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee437d86sm15203204241.8.2026.11.03.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:05:49 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 15:05:19 +0000
Subject: [PATCH v2 4/5] btrfs: don't report success for a skipped log sync
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
Message-Id: <20261103-b4-btrfs-data-integrity-v2-4-577dc2690061@toxicpanda.com>
References: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
In-Reply-To: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793718330; l=3593;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=pb3ZJaSZEuGE2EuaruC+9DgUr6NKGbLn9bdI+79i/3E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNP/iVXQVI4rBjCBBM7l+LEfTdcSroeAQzE1wE6QOTOIxSy311mqKEM+XrtSpfK/0Fm3jHKzS1A
 M5tAKULnvzQY=
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
can then no longer be true, so warn on debug builds if it is, and force
a full commit.

Fixes: d1433debe7f4 ("Btrfs: just wait or commit our own log sub-transaction")
CC: stable@vger.kernel.org
Reviewed-by: Filipe Manana <fdmanana@suse.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/tree-log.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index 1d9dfb63fc5a..3de7757d168d 100644
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
+		DEBUG_WARN("log_transid_committed=%d log_transid=%d",
+			   log_root_tree->log_transid_committed,
+			   root_log_ctx.log_transid);
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


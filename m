Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605203;
	b=qC6mTP6V/szaxPOkHQU9jo7pAHTq8Nd4TKOQtWvFnkGNYco5z4Xmd7a7O6PWb+RnJJTw
	 YVaw9gOUugpPnFo9nOrBY+1RBJB5QfLL32G2KyUZRS4t4Z7ts7TjIRO76f7ogQppIOk4M
	 PvGcEl6tRaYG2Vv/gCc721fZSY5VFhZa1ywc6AOUrDwOS+141XWK5t1Ue6juiN6APPC7u
	 cHS31scTb98czrgO5eZXwD2Awbg8R0svYP5rZU9cZBPCFg1EqmxaPSUZluM5KL4ic03Ip
	 c1v0g8UxFVYH3EXKjbEA6lIB1JiGIbWkO79smNpSb2BZ/a8l3l8/9N2y7wmRbtuTNDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=bvopn4Bqo5mm/LiFrwVnKxpY2c+FNJJoD3FpecADh3Q=;
	b=lvGBECji9gKJaN4rfhSlA8DMV4AUa7wrs/zYubGl8Ryu3K0loBPqBKqwFWU5Q2ChcZ3h
	 pjo5sZk9HoCIG7N47JpX1NfK74y1dFFKAKa6gJJl9qXtR8SJ5X1x/2T44NAGyU0DJ7R30
	 dlRbMLIykG0KDUOsmpR/aTlDK68eWOM37pAsmng3JQyQL1RulWWkQzgg8qWUGBDIIRKuB
	 WxLrsZxstrqxozApJz2YSFDEv/mRdcUKZpizlPW7QD9JHLDledSTKt+7nEf43RcKsIgE1
	 mwYrUZgmBQoQmmviE323CHX3fsiyBgM+CNOS6Wjve8l6Ze7nws3L7KafSdD/UYkfWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KikB41Dn;
	arc=none smtp.remote-ip=74.125.230.196
Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B5606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KikB41Dn
Received: by mail-qk2-f4.google.com with SMTP id af79cd13be357-93f38343369so62434985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605197; x=1793209997; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvopn4Bqo5mm/LiFrwVnKxpY2c+FNJJoD3FpecADh3Q=;
        b=KikB41DncDcSaFMtrZ6wcc4ELt/RfWPaAhey8DUp+d5ic6Qetl6NB/JqFWlb76earI
         nDj1Lq3XmSNeRORBnCAak3AGcwDmmPHSoTsWHLoxjm60bnI7gvshiyGJ6BFfjARrSf52
         ri7QKTPfM4nBSflJjnS8wJJFi6GxjChacXWI0ho+9pJQwF1kQ5O0E4tcZt7z0J2/2Uid
         RY7U3VAwhx2OaF2JlJbMP3kFXvX3lGDpgGR2vYi6llvZklR9iQVAYtW2wvsxy5/xEiw/
         KEibdGdHBOYCODDoZEHNQFbqYSi22GZJqR0NZJRdNUsysq2vWbT6SBRrrtv/tL4jEruk
         VN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605197; x=1793209997;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvopn4Bqo5mm/LiFrwVnKxpY2c+FNJJoD3FpecADh3Q=;
        b=RwKiRojLvQ6ZrAiCSsK7gTvIQUEXMCaSsKnHRK/qe+Ak1LHFehtSQq9Oz2QNJJlqus
         EnITHfPPejoTAeNjgmF1oFpA+WRo093LYisKPa8ffhnGo9kbNHjXUjZG9UVtmwU5Uew6
         ljvapD5gp8cg2BqNUV8YLzqNR20DUQlXtOAQw722DDPCazLzIS3nr20VKU1cZcOk90su
         Bg1Fz5XS2x4uw/nL9U+z6Gr5gWD7wLUCFq36g8wq6pygS5GvE9kySoCmAt0UIA3TIz/M
         mjsyVGqZkBa5KsR4BLSW/7kKe1yzK3QP+CEVyI1AUH+rqbrx3xBsUf3n+biiL8mNLhHZ
         KE/g==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5ZwZNFO5X3BShl1u8KWsJr9X5q3EdaJblNhlUC87pXHFbcVo5o9oFUOfQpmf7vpiUmnttcYJd3RNJoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJdJK+R+BFMWBW7zug69Bp0Cq7C/xiM8Qr0GNtW3fmN6tqaXJi
	QV23UXmrZnekL6srntgYsNkLHXpnwDWHhk/s2Osbo7zxpDSY/X1i09f4+A05F81i
X-Gm-Gg: AYBFou39y2tGqIHG8487vtNZh1flQtJc8NVH1Q4ufHB8VV27iA8ZQ447vA5N/movsLD
	iF9FZG/cVQzU+kpmgta4wgzbZFVU7b9+yx2GPSutBe7TeH+MjHwwpGpVLjMazeQ0PHVdJZ1WXN/
	pdKtTjhJe7hYcJJmoOSLWQHOK/SrEF600icxzEYw+RL+YrZ8VyulH0fPe2qoAe6AE9KDfaKLBr1
	EWBdQlIj79/eseJ6cMN6t6rVm6BXrIZcwDYFeSAmxzS0tDTUpezIszydM9BzWqU1wyDDiRRORFT
	lCtZ0jGoih9NQg64ziCE4qkkVG2eXYQZ/G69eVtp4kH/mAXK0qepZ6EzewIClfgyK0iECtpYZim
	PavliNOnLVcNKmRhu0eI6/OiiStGB8FqP+O1BXsNzJZP3XqiiqUHBkhGojOESy7PFE1IV/cdGn+
	JiGW3IzfD3oA/6ToBjzEbN5/q3YtwIlVAhqpbDGT9XZ+4BaXfsVKpKCsd9jl2nxZ8XgqLX+ETLQ
	V/WvCVbsbJZ5mgfvxnJ+vWI466mRsSeV8GRaV+42ehU6ZYEDUYpNWSTSLmBGaNR
X-Received: by 2002:a05:620a:8909:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f57f05f2cmr574659985a.26.1792605197349;
        Wed, 21 Oct 2026 10:53:17 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9af50sm305675385a.8.2026.10.21.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:53:16 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>
Subject: [PATCH 2/2] fs: reject U64_MAX cursors in listmount() and listns()
Date: Wed, 21 Oct 2026 13:51:51 -0400
Message-ID: <179260511193.411.8347258310589513211@gmail.com>
In-Reply-To: <179260511193.411.2849255769062027805@gmail.com>
References: <179260511193.411.2849255769062027805@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

listmount(2) and listns(2) treat their cursor as the last ID returned by
the previous invocation and look up the next entry at cursor + 1.  For
U64_MAX that addition wraps to zero, so the enumeration silently
restarts at the first visible entry instead of reporting that there are
no more entries.

listmount(LSMT_ROOT, param = U64_MAX) returned the same first mount ID
as param = 0, while param = U64_MAX - 1 returned no entries.  listns()
repeated the first page of namespace IDs for a U64_MAX cursor;
U64_MAX - 1 returned ENOENT.

U64_MAX can never be an ID returned by a previous call: mount IDs are
allocated above MNT_UNIQUE_ID_OFFSET and are strictly increasing, and
namespace IDs come from an increasing 64-bit counter.  Reject it as an
invalid cursor, like the existing check for reserved mount IDs, so that
the wrap cannot happen.

Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/all/20261020110732.959552-1-shawnq1@163.com/
Signed-off-by: fujo <hooyan2024@gmail.com>
---
 fs/namespace.c  | 9 +++++++--
 kernel/nstree.c | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index c8aceeff6..6806745a3 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -6292,8 +6292,13 @@ static inline int prepare_klistmount(struct klistmount *kls, struct mnt_id_req *
 	u64 last_mnt_id = kreq->param;
 	struct mnt_namespace *ns;
 
-	/* The first valid unique mount id is MNT_UNIQUE_ID_OFFSET + 1. */
-	if (last_mnt_id != 0 && last_mnt_id <= MNT_UNIQUE_ID_OFFSET)
+	/*
+	 * The first valid unique mount id is MNT_UNIQUE_ID_OFFSET + 1.  A
+	 * U64_MAX cursor is invalid as well: advancing it by one would wrap
+	 * around to zero and restart the enumeration.
+	 */
+	if (last_mnt_id != 0 &&
+	    (last_mnt_id <= MNT_UNIQUE_ID_OFFSET || last_mnt_id == U64_MAX))
 		return -EINVAL;
 
 	kls->last_mnt_id = last_mnt_id;
diff --git a/kernel/nstree.c b/kernel/nstree.c
index 831f279d1..39978b56b 100644
--- a/kernel/nstree.c
+++ b/kernel/nstree.c
@@ -450,6 +450,9 @@ static int copy_ns_id_req(const struct ns_id_req __user *req,
 static inline int prepare_klistns(struct klistns *kls, struct ns_id_req *kreq,
 				  u64 __user *ns_ids, size_t nr_ns_ids)
 {
+	/* A U64_MAX cursor would wrap when advanced. */
+	if (kreq->ns_id == U64_MAX)
+		return -EINVAL;
 	kls->last_ns_id = kreq->ns_id;
 	kls->user_ns_id = kreq->user_ns_id;
 	kls->nr_ns_ids	= nr_ns_ids;
-- 
2.53.0


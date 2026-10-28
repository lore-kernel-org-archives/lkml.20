Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160661;
	b=djmArzDntjYpuhFSe7Ao1Lgagj2kxCmyv35eEqdbZEBcTECCJ3i5jsA4RDZY3zWRS4vY
	 Qxy7Bt/nlHCw0frJ+/blUwTOwTQC7DLDV2CZ+RGKZvOTP0umwZpoFDl1Gy64g9b72i+CB
	 ajIp7AQDSkQSfX5b6RTB2e+7RStCB8VwxkK6kFcobPtfNmfSr+j15PxKeHDgnDZXY0fEM
	 5FUcmKe9nzqQfWHaidEwoGJk1MPgv4095rS6NXzjGjAlwMna20hXgPNWhffpl9dm0h+de
	 2EaWMaKi36C0tiJ1PbvRPKR/J2FNHnuxtLq1c8uFcWZjxHE0q9zxAs3NJcEWbXBb7xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160661;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=vZ4Zbr/68u+5vgymWgt3H7Y+04kPUCuhEKDZg2YF6Ac=;
	b=fO5f1W6FP26veSB1Ocf6eKFOY8/1IrfKd8co+PtnIqK1RkSFkhaWjXLtPv73s1A2sJax
	 yO9QYUjSyHBOVL9+I7Nj7n3wQFhZwD+U+Wd2Y4zua3sfDe6IPBs0ITo7dc4ufQ9PNw2vi
	 9J0JBMjgr0JoNbmP9O19IGn9fEmyYx3Ooyy6ezCsNbPgeLpK+yeCFa6MjXFh5p+nTBjy1
	 UrKKzcCbGY/zCj1ith9Vkuv34cmuWrvgDdCnx1bQCBdYFHnxIUI6JAB0f4/CtxmEbZ4rv
	 8hybNiwy9T24o2tNWK+W85yRolTxbNpIaQi37qyY0eb2kJubdq7MMY28EkPY0PzGmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=lL+6fkVM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Bzm5Tt1J;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=lL+6fkVM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Bzm5Tt1J
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 24C361D001DD
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:11:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 28 Oct 2026 00:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1793160659;
	 x=1793247059; bh=vZ4Zbr/68u+5vgymWgt3H7Y+04kPUCuhEKDZg2YF6Ac=; b=
	lL+6fkVMnRxf02wO+v1sJEJcCmUtp/vOHsEaihMqVo3Jv+lwnJzdTfvddF4mUbGe
	yvHMWGcpQC7y2gmyZE6bM8fZqZXuCm94jZZSs4bBiwcVJ6w9cT92uXwShU7+/Y3o
	ChrgvBn08/i9VkKQoEGCoKKqzy19/bmwFSbOUUcnEfrRUBmtedg3kGhDSmBvNnPN
	8VoihkEcrlayvQ7vKTLHjBZ2OOzewkAdZCVKh0cPXD+r9MdEuOStRw/faO5q7XRw
	hExLQVVRX+VZ0F3CU/qza0YiCQVQmKl1t/kHA1bTh1CivlGzh28wrhnWh5Re0B/O
	S9JVJlZ/QN1Pr/DmOpiEoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793160659; x=1793247059; bh=v
	Z4Zbr/68u+5vgymWgt3H7Y+04kPUCuhEKDZg2YF6Ac=; b=Bzm5Tt1JWgBIUVmoc
	ko5yB8zmVmvjytYAvNill1xe3feXOa7B2Q/KRS/JgIhjcXhXGt2k3sxlnjE7x8g6
	KPUXtC4ZiQLP9/NngRY1qPs8evo2hrHVEODREr0BW/HNr400HLHOHXV0HIy6S5tm
	GJtRfjaXiziKDJ8SxudFDe51fywdDfYKUBLTq2RY7z5stvfrfVV/TKCL/ODqjgIr
	tWoCEMWhEHFBaYJM1mtV4xivQXN+sglHU2kXbdHSYKxS++9S3oWTV7eUTvM5Oiob
	3UgyGst9b3IGwh1YYxe0arU8+EcYXQR8ubqlC9mkdT3tOg9Z9Ex2EtO/sxze5kes
	JyikQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793160659; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Gpv+5eOFRtp+7ZWIxbFBA6uSg32RtaLe4UY0Yucmxn3jjAl
	M/VQhFrKyoRE+oCvhyAoSk7GhALdUYkrysPF4Om8khocYEudzYufmV1zMjijGPX/
	MKgBQyb+9hlDYNOQ3/ORx8Me1bvK5wT1mbJZkGJraBRNp3E5wuXp58LH8mK4Ymt6
	hWBfCRxbWC4rmLHK+YY1FIojCnifq4f0LWxDVuV4qJodK51eczsRw39YeXT8fBEc
	9cYMNnO+v/h2159e1eOR8Yc9TJT6LbHfCWi6RkbXiDPAoS+rTk8a+hs2S6bWCaIH
	A/fdwEeBcZqhG/8ihhYEn00iF+aBY2HuYHuLgUQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:uajvCvGxVVWlBag/96yS6UTwzfWp7BCS3b83UmVoAsA=:dzdi8d3OoBOihemi199NqFomVkM7Z7oh4ZVHdJ4hscs=;
X-ME-Sender: <xms:03XhahALV2FdbHb6ltrOnKJRQrSKk52kJ83Jv4ncGdq4HAmgOsnKZw>
    <xme:03XhatybOBuuIa7ItM8LlZ5INQLDFE5KW7J03zpYnxWPOnmhZmQ5fff_PiRhDYG6r
    lVJxdaAuZ-z_on7zl-dVEh-XQZa0Dd3ATpBV4GZ4EnTZYxbIg>
X-ME-Received: <xmr:03Xhal5IQOEq8sSZNzx_IZxnxRXN2J7CXXyzABYQxhaHCIFNhJ-wsSSZMo61A_6fVpZAkn0oJk6ASt0iPLELCBOcFvBj3Eo>
X-ME-Proxy-Cause: dmFkZTEtaaJo3zhk6q8YHjcrAGFhzjZGx7kav9mjn36dhiCDz1sQNUcnPXqPMC3VqBUdUM
    QC/BqNrn6VDtoNvGfXsPC6PtPC8Yf5vcT7dSqr4OQVWjbDjoqPju2ao8WKvEVWn6qwQJpD
    4CN6jGUHDBUbMwADgY1eHpCxVa8gj9W+FVkilH/Bf9wmvEra1caZDRUZmQcG/Ro3xW8rsx
    nbEpGLXA1HN5mBuF45EijzjRcn/0zOhqfoHROonBfk2oQm2kGy7PxZcAZk+GCvIPn4bVTg
    3udSvT9vlUjceFzrt+IHSgKFct3qykKWsSJoK8kyGUhtj7khaHZlaj5tXb3YwgPRJ+b+K5
    h52SSmtU1FPzkKa/eTyufGqpjneHFrkCnBsMwyoTadT11x/EA8DC04n5jhbcb+O7jX0t42
    Q4qKxoOdDpFvvbeUidYY+xw+jXDv815McVQ1vwMe8Zuto3HKkds+6gODC3vSB8vW/xM45k
    TOw/3TE/ql5wEROdqzfZgQOn7H7JRbwin0YL7RF0iyUmWFhN7Kkqodj19121VtOADYBvMY
    aNfX7Qy64B5J3aSqvHuhUZglgx43Q/iPEuEIxIu9oYoaPOwN2IyxgIDenJ+TpmY/dZQtpT
    ixHiZuqp+qI9O2wSLcZaXWipDmYr1JrEb9/Oq69X3m4yTH1PO8mESXdfdFOA
X-ME-Proxy: <xmx:03XhauwW8Noore3jXJ903tB1iAK8rqkr6tCNCAAQ-G876Whoosl_Tw>
    <xmx:03XhapflLIa6Jdj6Ud9XtpSOsZXJ3_MWqKQpjKgTHzNbY47AfFKTIA>
    <xmx:03XhajDWyM0t-QZBJm6ZprEsg8rT7g75PAZlOFwRUG_p17PNIoDe7A>
    <xmx:03Xhat6Lg-uWYslv9xob7PKonSBwTXfpy6_OBoS0XrTfa1Jm92FzeQ>
    <xmx:03XhapB6qqSBnkOYZP201zdkA2BDJXmlHidKLR7jRvYahSNVMjNaW5tg>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 00:10:56 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] nfs: remove d_drop()/d_alloc_parallel() from nfs_atomic_open()
Date: Wed, 28 Oct 2026 15:06:31 +1100
Message-ID: <20261028041023.3738553-4-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261028041023.3738553-1-neilb@ownmail.net>
References: <20261028041023.3738553-1-neilb@ownmail.net>
Reply-To: NeilBrown <neil@brown.name>
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

From: NeilBrown <neil@brown.name>

It is important that two non-create NFS "open"s of a negative dentry
don't race.  They both have only a shared lock on i_rwsem and so could
run concurrently, but they might both try to call d_splice_alias() at
the same time which is confusing at best.

nfs_atomic_open() currently avoids this by discarding the negative
dentry and creating a new one using d_alloc_parallel().  Only one thread
can successfully get the d_in_lookup() dentry, the other will wait for
the first to finish, and can use the result of that first lookup.

A proposed locking change inverts the order between i_rwsem and
d_alloc_parallel() so it will not be safe to call d_alloc_parallel()
while holding i_rwsem - even shared.

We can achieve the same effect by causing ->d_revalidate to invalidate a
negative dentry when LOOKUP_OPEN is set.  Doing this is consistent with
the "close to open" caching semantics of NFS which requires the server
to be queried whenever opening a file - cached information must not be
trusted.

With this change to ->d_revaliate (implemented in nfs_neg_need_reval())
we can be sure that we have exclusive access to any dentry that reaches
nfs_atomic_open().  Either O_CREAT was requested and so the parent is
locked exclusively, or the dentry will have DCACHE_PAR_LOOKUP set.
[Note that when nfs_neg_need_reval() returns 1, ->d_revalidate returns 0
 which triggers invalidation].

This means that the d_drop() and d_alloc_parallel() calls in
nfs_atomic_lookup() are no longer needed to provide exclusion

There is still a d_drop() which allows d_splice_alias() to succeed.
This will be removed in a future patch.

Acked-by: Anna Schumaker <anna.schumaker@hammerspace.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/dir.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index cde963e2bcb8..cf366329666f 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1656,6 +1656,13 @@ int nfs_neg_need_reval(struct inode *dir, struct dentry *dentry,
 {
 	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET))
 		return 0;
+	if (flags & LOOKUP_OPEN)
+		/* close-to-open semantics require we go to the server
+		 * on each open.  By invalidating the dentry we
+		 * also ensure nfs_atomic_open() always has exclusive
+		 * access to the dentry.
+		 */
+		return 1;
 	if (NFS_SERVER(dir)->flags & NFS_MOUNT_LOOKUP_CACHE_NONEG)
 		return 1;
 	/* Case insensitive server? Revalidate negative dentries */
@@ -2129,7 +2136,6 @@ int nfs_atomic_open(struct inode *dir, struct dentry *dentry,
 	struct inode *inode;
 	unsigned int lookup_flags = 0;
 	unsigned long dir_verifier;
-	bool switched = false;
 	int created = 0;
 	int err;
 
@@ -2174,17 +2180,6 @@ int nfs_atomic_open(struct inode *dir, struct dentry *dentry,
 		attr.ia_size = 0;
 	}
 
-	if (!(open_flags & O_CREAT) && !d_in_lookup(dentry)) {
-		d_drop(dentry);
-		switched = true;
-		dentry = d_alloc_parallel(dentry->d_parent,
-					  &dentry->d_name);
-		if (IS_ERR(dentry))
-			return PTR_ERR(dentry);
-		if (unlikely(!d_in_lookup(dentry)))
-			return finish_no_open(file, dentry);
-	}
-
 	ctx = create_nfs_open_context(dentry, open_flags, file);
 	err = PTR_ERR(ctx);
 	if (IS_ERR(ctx))
@@ -2235,10 +2230,6 @@ int nfs_atomic_open(struct inode *dir, struct dentry *dentry,
 	trace_nfs_atomic_open_exit(dir, ctx, open_flags, err);
 	put_nfs_open_context(ctx);
 out:
-	if (unlikely(switched)) {
-		d_lookup_done(dentry);
-		dput(dentry);
-	}
 	return err;
 
 no_open:
@@ -2261,13 +2252,6 @@ int nfs_atomic_open(struct inode *dir, struct dentry *dentry,
 			res = ERR_PTR(-EOPENSTALE);
 		}
 	}
-	if (switched) {
-		d_lookup_done(dentry);
-		if (!res)
-			res = dentry;
-		else
-			dput(dentry);
-	}
 	return finish_no_open(file, res);
 }
 EXPORT_SYMBOL_GPL(nfs_atomic_open);
-- 
2.50.0.107.gf914562f5916.dirty


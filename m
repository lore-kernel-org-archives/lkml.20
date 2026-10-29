Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297427;
	b=l36sjpJmXMNAGWVFmp7f06JtqF/GKmJkZHJBBXWL+4CgRisHBwIZpbGfgstZEQgnCYjY
	 wx9bC3Qkql0/uOGhUaVaiTkSAqWnFJpEWKg1rjHBIHyLytx9/IdmTuCKTZ/PhO/qgB9O3
	 S5olHv6Smmf+zYMEWXArGXggoH3ty7vRPyczcEVI4YyEsTOP+Nd1PpdwtFQK5GenVvuSn
	 bfAnx1MaOTZwOOAq6c6p1TmwtW7n7KbYa7ym6kWsL2M9Po/hwaSjW0j3HPDCQunsRIgsx
	 dxWOCzQq25tfXBFS3ILsucjtBwafON1GeMaFahW91SdefOBJK+YwNregOUY3wcJyZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzS3inKuIzObQRIJP0XLNfoskd/GgXHCSXyF9Wdht4c=;
	b=qe42HFs7+JXOypZg+ioJ7wrCRGwOsv3JFladL1eMUHWxNYDyhshESwchN6J9dQ0ceazk
	 ulV5JjXo8PG24bkCdwUOVrnmPYIqXlakStssYbMXdt5LKyuHptcJ8yRdV2pn8Hen57ZVM
	 ZVKH0Ewpmn6+TjDsc90OZTB2Jj6m5JCtorET73B2E7CfE6b9fCzzn7Mu/b05fhj6oALOD
	 Y24hL/fe5YN/NX1f08QPszj10omiDhWLw+hsWFVS8O/ZYHhb4+09n4xckpuJ3ddogFtQS
	 Hek2sirmD0MD+v6Rzer3YCBYgfnDD/neO9sP+InC+vl2sdiYKQdvhioDk7W+ETrcFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b="DyAzo/rG";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F8C60A3828
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F8C60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=DyAzo/rG
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2733245a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297426; x=1793902226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzS3inKuIzObQRIJP0XLNfoskd/GgXHCSXyF9Wdht4c=;
        b=DyAzo/rGD/vFUITc9/4gw2bFRBgt5KXT1g30QzxnVONT/H2KhMonuYBeRqnM/el3vD
         hvE4q+FjQvLdyiOrqdppQkq+aJaAvZ+UALTT0jy/M/hvfvPlpR14HI0/5UK93k7aSN4E
         hLD0KJ3kyFSdexlsmEsiOCB2TiiVevp4Pvod/HW+VnjpIEpCOr2wvksKVFupK21TqJnm
         5tP6IjiU6N+Ci2bjmFSgPSN0iiLhu6hF7mRiMDD6PH1KT/R/kNV6giiTxo4AyFJ1Rv4B
         LR62UxCQHrlJhdES678JEL1ASaXffA6fAaToDWFihOrtdJckbYyRaF20lpalzE6l3K5O
         I8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297426; x=1793902226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzS3inKuIzObQRIJP0XLNfoskd/GgXHCSXyF9Wdht4c=;
        b=LZT1eL3tzo2TxEZK5TYN3ZOdFDkbXgog4uB2f3xMokEdJXNVxm4SNpfdWqHWbmN2o9
         dcIqlVBWaKteFafveyurQtpAnFU0vZbydcpVH8XTkTlEasELQah+PTPAPOPDgsHr/1Bp
         TrH/j9wW5z+myuzTunPkbPWffsbUu27SLQq9YmG7r0cRMWGjvOf/0HDmIzoUC73hFnaN
         9N9W404Q5N5vGAePd2ZiqImrKpIp4fXRfa0HtC1gh4pvgZ/m/GHfLcFn/1ooha9l9vBQ
         DMvZEK9pofLZ0uq4quIvSy7gEskJMgWaLqKVG2AxBJwfIL5VjqCPrwxfkrnXxb1iYV96
         lEqg==
X-Forwarded-Encrypted: i=1; AKwUvBx1/JS95GXstapm1GkKIHOKK4OLg14fts7wYVy2HEVUExtPtU+TJbvj9TdcqfXJ3AJ6vNLxx5oUBgsBfVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBIQoFo3q/Wm/yfnAweAW0emqysja34OiJNwQzeMDO6wRzzd4d
	HoD95kJKwk2zfyzUOxWBdZVaCeh0zeFqg6Fu4iVhtt+hcJ+V4BOo2B1ml/MNllr2CoM=
X-Gm-Gg: AYBFou0mLLoGwr0+JaBtPuPHEutFaR0pHaB63q5PGZkxUfD+5u4not+/Vjk5WfXlJx/
	Mnx/di5cpAVV1cKOtZzbibhHY9vbk94xNGMxKthIuCh5rWWts9HbTue+oRtvTBP7SVNF4h5wUhW
	GkBDfzRDSz0WyynyuqMWQp6fh5PaAe/oian80OgH+MkOLFh/gwnik7UDvMAyx0tTpDd4cPviQMv
	oLvJrJVzhBkLST08EwlzzPlmGbhJoIxb/q/Wi2SIl3Nn/JBOMimiUzF89YGVCP7I9Zj6B28iTJH
	h6sLQepMWiOgXL9ui2TiVFxl4yhZHlOJFYOp+nL7SdgQcozmqZ2sMX3qvBHgMp8bVANHvNgBjYf
	V8miehAYR6TQjI6mX45jUi0RipauCZ5YhTl9DiLOd7heRWCYtZlXghWRL/fDYQwtlNcq0iQcoIN
	NSjOxF/0cY4MknmOKuPxTOx1PAqW78PXK/SBt4rZM656lx7U9zMU5blz4DZYJteyFitwfnHwMfL
	jgWFYwbjlsZ0xWNYQy7vTPB6BkJUpSAEx0hO/Jzyy4NcqVz6ozM0NXPN7ObkxdvjVwwuTr2IaLR
	kP1fdvNXhUKF4MBxBKoz/RFS3W6oT+WOADWZML56XHL3iAPvGH9VPHT6O2x9tLfEHRFb4QO6
X-Received: by 2002:a05:6830:4120:b0:826:1ccc:8bb9 with SMTP id 46e09a7af769-85ab7040645mr5227606a34.6.1793297425401;
        Thu, 29 Oct 2026 11:10:25 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e9684sm187806a34.3.2026.10.29.11.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:24 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 11/12] nfs: look a name up again once its removal has unhashed it
Date: Thu, 29 Oct 2026 12:09:56 -0600
Message-ID: <20261029180957.387138-12-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-1-neilb@ownmail.net>
 <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
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

An open or lookup of a name can wait for a removal of the same name made
with the directory locked shared, and is then ordered after it.  When
that removal succeeds while the waiter still holds the name's cache
entry, the entry is only taken out of the cache, not emptied, so the
waiter is left holding an entry for a name that no longer exists.
Revalidation can then accept it: an open without O_EXCL is sent to the
server for the removed file, and if the client holds a delegation for
the directory, an exclusive create of the name fails with "file exists".

When NFSv4's revalidation has waited for such a removal and finds the
entry out of the cache once the wait ends, have it answer that the entry
is invalid, so that the name is looked up again;
__nfs_lookup_revalidate() now reports whether the mark it waited for was
the shared one.  Without such a wait, an entry out of the cache goes
through the usual checks, as before.  Its holder may be unable to look
the name up again: overlayfs revalidates the entries of its lower layers
itself, and an answer of "invalid" for one that a transient error took
out of the cache would leave the overlay reporting it stale until it
dropped its own entry.  A lookup that took the entry while the removal
was in flight but finds the mark already clear is not covered either;
it overlapped the removal, so the old entry is still an answer it may
be given.

This relies on the VFS taking the entry out of the cache before it calls
->unlink_shared_done(), which clears the mark, and on the wait reading
the mark with acquire ordering, which pairs with the release in the
clear: a lookup that finds the mark clear, whether it slept or not, then
also sees the entry out of the cache.  A removal made with the directory
locked exclusive, and a rename onto the name, can clear the mark before
the entry is taken out of the cache; say so at the wait.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/dir.c | 50 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 0b6de87030..1f255001a1 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1889,6 +1889,11 @@ nfs_do_lookup_revalidate(struct inode *dir, const struct qstr *name,
 	return nfs_lookup_revalidate_done(dir, dentry, inode, error);
 }
 
+/*
+ * Answers -ECHILD under LOOKUP_RCU while a removal of the name is in
+ * flight.  Otherwise waits for any such removal to end, and answers 1 if
+ * the one it found was made with the parent held shared, else 0.
+ */
 static int
 __nfs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
 {
@@ -1898,15 +1903,28 @@ __nfs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
 			return -ECHILD;
 	} else {
 		void **fsdata = &dentry->d_fsdata;
+		void *mark;
 
-		/* Wait for unlink to complete - see unblock_revalidate().
-		 * smp_load_acquire() ensures ->d_fsdata is read after
-		 * ->d_seq was read, matching block_revalidate() which
-		 * sets ->d_fsdata before ->d_seq.
+		/*
+		 * Wait for unlink to complete - see unblock_revalidate().  One
+		 * load, as there are two values to test.  smp_load_acquire()
+		 * ensures ->d_fsdata is read after ->d_seq was read, matching
+		 * __block_revalidate(), which sets ->d_fsdata before ->d_seq.
+		 * The acquire in the wait pairs with the release in
+		 * unblock_revalidate(): a waiter that finds the mark clear
+		 * sees what the remover did before clearing it.  For a removal
+		 * made with the parent held shared, that includes the unhash of
+		 * a dentry it took away, as the VFS calls d_delete() before
+		 * ->unlink_shared_done(); nfs_unlink() and nfs_rename() may
+		 * clear the mark first and unhash after.
 		 */
+		mark = smp_load_acquire(fsdata);
+		if (!nfs_fsdata_blocked(mark))
+			return 0;
 		wait_var_event(fsdata,
-			       /* one load: there are two values to test */
+			       /* acquire: pairs with unblock_revalidate() */
 			       !nfs_fsdata_blocked(smp_load_acquire(fsdata)));
+		return nfs_fsdata_blocked_shared(mark);
 	}
 	return 0;
 }
@@ -1914,7 +1932,7 @@ __nfs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
 static int nfs_lookup_revalidate(struct inode *dir, const struct qstr *name,
 				 struct dentry *dentry, unsigned int flags)
 {
-	if (__nfs_lookup_revalidate(dentry, flags))
+	if (__nfs_lookup_revalidate(dentry, flags) < 0)
 		return -ECHILD;
 	return nfs_do_lookup_revalidate(dir, name, dentry, flags);
 }
@@ -2329,10 +2347,28 @@ nfs4_lookup_revalidate(struct inode *dir, const struct qstr *name,
 		       struct dentry *dentry, unsigned int flags)
 {
 	struct inode *inode;
+	int ret;
 
-	if (__nfs_lookup_revalidate(dentry, flags))
+	ret = __nfs_lookup_revalidate(dentry, flags);
+	if (ret < 0)
 		return -ECHILD;
 
+	/*
+	 * A removal made with the parent held shared that succeeded while
+	 * this lookup waited for it, holding the dentry, has left the dentry
+	 * positive but unhashed: d_delete() empties a dentry only for its last
+	 * user.  The dentry no longer stands for its name, so have the caller
+	 * look the name up again; the checks below could accept it, since
+	 * with a directory delegation the removal stamped it delegated.  Only
+	 * ref-walk waits, so this never answers 0 under LOOKUP_RCU.  A dentry
+	 * found unhashed without such a wait is left to the checks below, as
+	 * before: its holder may be unable to look the name up again, as
+	 * overlayfs is for the dentries of its lower layers, which it
+	 * revalidates itself.
+	 */
+	if (ret && d_unhashed(dentry))
+		return 0;
+
 	trace_nfs_lookup_revalidate_enter(dir, dentry, flags);
 
 	if (!(flags & LOOKUP_OPEN) || (flags & LOOKUP_DIRECTORY))
-- 
2.43.0


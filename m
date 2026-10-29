Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297395;
	b=pJdUW/JizeseNQpRZHJlxCBqdxspJqAligljpP4b41Fnnt+TkxMlLgsa1ReTfr0fNFuw
	 7dy9Cu6nY2HpDBPh9qhAzvuW9m/YMIyBe0GYpnZT1OtMXaDEMOqOTrwZTt/XZCACDKmpr
	 N1Dg0RsReYkZyL4a92SPk239t3KK4dc1m39aLzHM9ByDZtVk7z9wEEf5iDt7cKi2D5WNP
	 42/R/jIT/nxMoxckXAe07fSu1eG5X8VQHTfhJ1yN4vGsB+CB6rBjS51lCago5RvoOgX1g
	 FBQVV7/3kq1XPiz1zfXKO6iRygOnzVENeIZ7P3562oQ87CY4DmdWXTd+cErj9PYqdPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/EAKP+3XkXqAm0vqhsCDYAT7jfMEV3PZN/8IdWi65g=;
	b=qg4jJKbWj5J+fxi3PO30/EOPCDpr6CQrmMvnea2NVdcYolSKsRBIoWrgi7G5Adozg0QJ
	 lIJYXGW2rn8T6bFmgUqX/LOuYl/jhX0t987LZoSJlqbGqJIuJ4l9I1IH6bLr6kTED39pE
	 P8mIqQBrjW2gAXUDyCK5spDDIiLVboyBRklG7z0HSYQ73elZtDrPuQMUH5zUjMnrXxXvr
	 JE2MkS9f0jLCaNCfmES1byRHRR59Qz8wRptlhSdlXYKZNlqiCN2VVZQXuxAUix8APxU8G
	 An/OM4BFVbSTd/5MJPtlnVdqLAel8B+WS/LBwicoCREdcfI5Dcm3XNrmHdM33jD3O3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=WHUCIw3D;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272C606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F272C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=WHUCIw3D
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ddef424972so1903432eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297394; x=1793902194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/EAKP+3XkXqAm0vqhsCDYAT7jfMEV3PZN/8IdWi65g=;
        b=WHUCIw3DTHv0YSgCSziJSIq2gMfnbCVkeyXE0Nqvbg4dxTy0IkIRgO9QnyIvYNNbhy
         p0AYgxLp1JRlHRw1gQy6Eeu7FWjODrVtqlsUN2CaAzQLU49QpUK8AdWdHmLLvyEzETK7
         ywz1szFDByUrRePx/ht+DSlDwVF4f4eXSSJjXbH5+dgFTrZ/qdv29dc8VPp1LKVOVJ+4
         uKIaEoBsB+GVRCe5NUgfgy6nB7lZQXHxr84MtrGNq+pZt8qrNcdoaHQ0Tsyqj33wKSr/
         CZl29Q941vt7NTjjU5TtXOVc4MlNInsff1/WyivXzZxjWMSJTEFcdA60yluaPKY63rGh
         KQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297394; x=1793902194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/EAKP+3XkXqAm0vqhsCDYAT7jfMEV3PZN/8IdWi65g=;
        b=vcF8ZPosh6N0K92BZnc8XjUXLw21SkJf3oA16kp4rtJP0kmvc3c9PlyJLFtNgzNxAl
         BwzDlICjjG+k8PDOaW+JGzzfaxqam3eASuVWkWEFxESoCQzUBbDlxnKJv4tZAdFb/T2Z
         8twDC3WIlbZ2EcER8IaOarJ+wN9/V9vIR4deIZFR9s0wU6Z3UiZdeWmfJbuwGouLKfit
         T6+yJCTeyF32gPuYFwClq2+L9SPgM9vTwM1ARIhF18QXyGvcD74XqIXgkZ+WKhuHdpt6
         0T3aIBpFGE+nySqGeCjIwwfac/VPJiaPMCONMHk+riEbbBGzpxVoYY/z7Ep/5S/K1fXg
         ByBw==
X-Forwarded-Encrypted: i=1; AKwUvBwibXDrSLICebAZkRBbXN/xPQIiqjpjOARRgBXqr3tDolQoAMc8oq1g/P27yxxqqeLXS4f98gSzAoD9gl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYPBocs/UjdUvUW5tzGE6cEfctKN+aCB44fZjT1pv5P7E3l4x
	uI8xPU0uRfGUW9j3tha1PQGWmg8jL10DksX25/gTJrsNzlxdXY6HJrqSxfWUhZR25Kc=
X-Gm-Gg: AYBFou1hAD+TBtZE8RNOpB4KDEhUZ+GdRZcTGhhRHN4dqe3gqJjmAmNTrdP877Pab+X
	VYFukS6ln8ku6+AQyxD5gBDAfzKThStKlhTi8YBcxP1f+hHTNlAWuWIuOon5WR2PGF6CRB1Ulp2
	xOy2T1pktqopg/uf0GJ1usUc9BY6/aF/7Qk4xOfcMNzrSe2n7FRlMd9p7hlSHQ7IqACqoJkEJGs
	9oTwyB5KiSE/MGxJ3j0xPiT4gGCFyXOKpUfLau6vms++3tGmf9ZQObZhn0Y2JWT4VxYPqF0Rr4g
	6hVT/EOoceoSqkkLgo0OYFWMXXFM2msmQoGgebhq/h5qt2PM1w3ebZCyq318zXy8ybKRA+IpH9w
	buKiC5bSSVy6j5IhdUSLCIlS00JEAMugBJw3b/GZSNjOyg/bxiw9TRSx6s7u0D96VZF/XitJjRh
	ce98uvmoSWkkEbQ+XqzDHjDbDgP9lJIY1v0SqLRhakFnzl+HwBU9nXs5b3k2YTjl7z/fvLRRUca
	yXLbm8bFzMIrcRrwkVswhEEtjEp9fSoc/Ku7IIjm4YVoUQ15XVIfInXy+BkLI4MzE8Ii9YGmvkW
	J20N8MyiuHMY88lQ+4COl6hGeQNiatvv7BRw1unoxHo28TgNSr/3G5rkAzgh9bbdNh78mseW
X-Received: by 2002:a05:6820:c30c:b0:6fc:373a:176a with SMTP id 006d021491bc7-714f2ab9b84mr17297eaf.77.1793297393747;
        Thu, 29 Oct 2026 11:09:53 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f24899ebsm51267eaf.13.2026.10.29.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:09:53 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] nfs: do not transfer a sillydelete onto a blocked dentry
Date: Thu, 29 Oct 2026 12:09:48 -0600
Message-ID: <20261029180950.387072-2-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180950.387072-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-3-neilb@ownmail.net>
 <20261029180950.387072-1-jonathan.flynn@hammerspace.com>
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

Harden the hand-off of a pending silly-delete.  When the last user of a
silly-renamed file goes away, the client can move the delete it still
owes onto another cached entry for the same name.  Leave that entry alone
if a removal of the name, or a rename onto it, is already in flight on
it.  Moving the delete there would overwrite the mark that makes lookups
of the name wait for that removal: the wait would end early, the removal
could report success without removing anything, the pending delete would
be leaked, and a later release of the entry would dereference a NULL
pointer.  If that removal succeeds, the silly-delete was redundant; if
it fails, the silly-renamed file stays on the server, which is the cost
of skipping rather than waiting.

The mark and the hand-off have shared ->d_fsdata since the commit named
below, which reasoned that no silly-delete is pending on an entry being
removed or renamed over, but not that a hand-off could arrive while that
removal is in flight.  The hand-off has stayed unreachable since then
only because nfs_call_unlink() passed d_alloc_parallel() a name whose
hash it had not computed, so the lookup for the other entry never found
it.  NeilBrown's "nfs: fix nfs_call_unlink()" computes that hash, which
makes the hand-off reachable even though every removal holds the parent
directory exclusive: the hand-off does not take that lock.  That fix
adds no test of the mark; this is the test, and a tree that takes that
fix needs this one too.  It does not depend on any other patch.

This was found by an AI coding assistant (Claude Code) reading the
code; Sashiko's review of NeilBrown's patch reports it too.  The
hand-off itself has been reproduced with that patch applied; its race
with a removal or rename has not.

Fixes: 3c59366c207e ("NFS: don't unhash dentry during unlink/rename")
Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---

Notes:
    For reviewers and review tools; not part of the changelog.
    
    Known and not fixed by this series: a hand-off that lands after
    nfs_unlink() or nfs_rename() clears the mark, and before the VFS's
    d_delete() or nfs_rename()'s d_move().  The cover letter describes
    it, with what it costs and a fix offered.

 fs/nfs/unlink.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/unlink.c b/fs/nfs/unlink.c
index 0eddc7ee11..491ebd8582 100644
--- a/fs/nfs/unlink.c
+++ b/fs/nfs/unlink.c
@@ -142,9 +142,26 @@ static int nfs_call_unlink(struct dentry *dentry, struct inode *inode, struct nf
 		 * the sillyrename information to the aliased dentry.
 		 */
 		spin_lock(&alias->d_lock);
+		/*
+		 * Not if a removal of this name already owns the alias:
+		 * ->d_fsdata == NFS_FSDATA_BLOCKED means nfs_unlink() has a
+		 * REMOVE of exactly this name, or nfs_rename() a RENAME onto
+		 * it, in flight and ->d_revalidate() is waiting on that field,
+		 * so storing over it would lift the block early and the later
+		 * unblock_revalidate() would store NULL over @data.  Tested
+		 * under the same ->d_lock block_revalidate() stores under.
+		 * Skip rather than wait: that removal makes this sillydelete
+		 * redundant if it succeeds, and a wait here would sleep in a
+		 * dput() path -- the nfsiod callback that releases a
+		 * silly-rename among its callers -- for the length of another
+		 * task's RPC, with ->d_lock dropped and these tests redone.
+		 * If that removal then fails, the silly-renamed file stays on
+		 * the server: the price of skipping.
+		 */
 		if (d_really_is_positive(alias) &&
 		    !nfs_compare_fh(NFS_FH(inode), NFS_FH(d_inode(alias))) &&
-		    !(alias->d_flags & DCACHE_NFSFS_RENAMED)) {
+		    !(alias->d_flags & DCACHE_NFSFS_RENAMED) &&
+		    alias->d_fsdata != NFS_FSDATA_BLOCKED) {
 			devname_garbage = alias->d_fsdata;
 			alias->d_fsdata = data;
 			alias->d_flags |= DCACHE_NFSFS_RENAMED;
-- 
2.43.0


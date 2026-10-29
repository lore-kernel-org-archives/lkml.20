Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297407;
	b=0QILQc7cE6Iau0UyCtkvSkH2NvmuoVsSEVUUBZDt9B5ZOzFOjbTXN5v9agiMhAOktyaz
	 uDjOboOW4z0g5YXbl2elhWrPePf61Sox38R3CRVnIZ2tVfMZtIGdmLCisI8LOYDr8vuWL
	 fpp3MkOIcf/HGVRyC2YNe9UbfoKGeyvmBTSvDEqMrXPXziO2jLPiQ8soR83TfBsirNnRD
	 O7P6cVCjGFZ75Q7BxImP4bAYChfdwZoDk66h8fQ4/GOQpJp6aplJosPXxra0JuSOgIrkm
	 wZpc2qLfvqQJH5v1MjH77Du1jBDpnrDhpgMyFHgV6rmA3ZxqE6R0IrG63CBQwgfn/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lY/j4BJTPHacq4th+geW3uU/xT9CmxLqWYLCqLTZczE=;
	b=yYdqrw/A68JKy65RWN3iIPkuZJXu90vzMH3GLpCoIa966KxxXXddbGPakoZ9HRtfv5WK
	 crX91UzyBIwldAkoe8CnWr1gkz/52b6FD6Tb3m4IqekcXLJJBAu8AIHOoVB9oEl7GWDcP
	 thv8PEvAaqnJWCuNrNKEL/dlxSWjSOAvQSf9I4CXPgzQhdlsPvWu/ZYYQ4C1Vxte3c6fR
	 atYRyElMrEyLCA2lPhsQa4RZQgN5l9ccABrjFwNvEowutFhHWs1DS+Ioke8UTDsO6VXsE
	 /9aHeumvhsI65teQ+yAW8cIfTiIiN6SU/2rkLGFKcpjw1EGgu2J6NEt4oQLlUGQhm6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=Ry1TF5jp;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AA60A2612
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3AA60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=Ry1TF5jp
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-825b40f8a26so1087872a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297406; x=1793902206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY/j4BJTPHacq4th+geW3uU/xT9CmxLqWYLCqLTZczE=;
        b=Ry1TF5jpHfEtNb/wLvErDSS8ox5RnKxXAurma5fBS90BM/ds83g3mFR2ATwEzR8DL7
         LVwlSKaZJySUADCRte4WXCkQq/GC1izQCx2MmN+Ca29mhrg/P1ThlGcHsKFoDCcGG6nR
         7x5vE5eVuyZJ3utrbUtEf6i12A5SBsj8j2eHN1Nlet+iT4vloY3EUrZ2st31Cw8vozMy
         Je+wyMqJp6Q0i3NADjc4eD9NiSRCeFvQKGH2wH3IhKOPEQSyE1+nb7RdhTwmVI1x4HWi
         mK7WpuT2eNnX+6Z9h4obk2oaLUvW//10MbXgsxrtBNqePP791KDaZsFj2KztFPd42ge9
         CigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297406; x=1793902206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY/j4BJTPHacq4th+geW3uU/xT9CmxLqWYLCqLTZczE=;
        b=1RyUXqpfyO78xHUC+LQVETO9zaP41Mfdfn0zSvnLdktrVT/JwGsODP35D9WE8LHIo0
         yaThnkqN/Ddz/ODYsq4wqFr9KkyZRUTwvSJnmD9ToT/XrS+i8lsSSlaQc3yCLxq6BQdg
         4NPxNwcZ9pl/gzWUqNIA5wLBxgjCxzS6VQg1bYGqLUweV0IAM4z4AKGY3ltSFrvAsq81
         EexDtJ/3RtJwsJG0U8+3R2U6U/SPx9pipHM5auvRejkpxCiVVdlsgg0si7eLWZWl0dYg
         j5x7BZRLIGxZee77cLoAS4RnMlk5DYigSvH0hsnUY3qGfQg91O8uj+A+YlYu0JEsgja2
         SRmg==
X-Forwarded-Encrypted: i=1; AKwUvBzIIcNoIff9rq9HHTTRkTfrHwZAmSTwwcfGHtvN78j+l66xgciMy90uVF57hooWnMVVLqRVNQo9WOuaLhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFFy/TAAVm76syDbpQcxpH33eG6vhJW1i54ZLbW+Oa/OJNpHNh
	2nUzABXvwW0aoySLF7tzWBxUnnzqWzN6MwEUDukmrb/WCCRXiDItgKKb8G6hg8F7VVM=
X-Gm-Gg: AYBFou0TckNmyYU48i0ePJuF5ufQzpe8VLDuDzN2M9ug3ztwiIs3LB/6ujuUyTsdmuy
	9c9AEyHp+ow8XPfYdZlcWT9yChbFE5s5VI1hMQT3HIIC7YcfDxfXOzuy+UDNoKqzjObn1INAw/6
	oCHI4dzmO3nT8xyK0FMSd6rEEsx9WR8+cj7cIWGUfJQwxFQqPvvGGRmDoYJzUiPILm8EY0EegE2
	cfDNGSlfpky9nU92oWOWy+BriVcHd3DyEQck3spoYZeMR2jzJcljeBLzwyDjW3xgavHLkOIHLcS
	EytmdPwXpWIey3DxxgF3jhz2wWOhWxItut6D/exlCYtYW9NF36aHGUr0wdxqBezmAArx8bgi+8u
	s4H4EGP1r76xPz6tYuPjTErQqMivTdQwU3nSAsMZiYx4SqUf2WWnngEPep7rcGhW51lXR1tsa9/
	vpPLEdgioW/ZW27O2mIE8jGDQKpAXHgICXM8G+icm8fLl+3pzaefiPyY0zUMYMq8zcPG5BNYZJC
	J6a6BjzBUhKQfsAHoH6cyn4+0fhR9ynKmp1U3wBylEBsGGAFOkKmPY9fvaI+7XIk/imDtwwm/e9
	qv4uNQa+hUVdjFQ+WT+jqMyt6SO5H/sFJYGqsuGXM5kKHPRcPXfqbj7RdzOQbqfTtVGj0GEG
X-Received: by 2002:a05:6830:34a1:b0:804:ec69:3979 with SMTP id 46e09a7af769-85ac090193bmr5308756a34.21.1793297405639;
        Thu, 29 Oct 2026 11:10:05 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3501abc9sm213289a34.0.2026.10.29.11.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:05 -0700 (PDT)
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
Subject: [PATCH RFC 04/12] nfs: concurrent O_CREAT in one NFSv4 directory
Date: Thu, 29 Oct 2026 12:09:49 -0600
Message-ID: <20261029180957.387138-5-jonathan.flynn@hammerspace.com>
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

Set IOPF_ATOMIC_OPEN_CREATE_SHARED in nfs4_dir_inode_operations, so
that the VFS takes the parent shared rather than exclusive for an
O_CREAT open in an NFSv4 directory.  Creates of different names in one
directory then stop serializing on the parent inode, except on a server
that reports itself case-insensitive or not case-preserving, where
"nfs: tell the VFS when two names can be one entry on the server" has
set SB_I_NAMES_COLLIDE and creates keep the exclusive lock.

This is the only user of "vfs: allow the parent lock to be shared for
O_CREAT", and what it needs from it is the guarantee that the dentry
reaching the atomic-open method for a create is in-lookup.  NFSv4 keeps
the dentry the VFS gives it when O_CREAT is set, and publishes the new
inode on that dentry; because it is in-lookup, the dentry is not in the
main hash, so dropping it is a no-op and publishing it is permitted.
The name enters the hash exactly once, and until it does, a concurrent
lookup or create of the same name finds the in-lookup dentry and waits.

NFS does not use the exclusive parent lock to serialize its own
per-directory state, which is what that patch asks an opting-in
filesystem to promise.  Both pieces of state a create touches are
already under finer locks: the directory's change attribute and the
cache-validity bookkeeping that moves with it are updated under the
directory's own spinlock, and a dentry's directory verifier is stored
under that dentry's lock.  Neither needs the parent lock held
exclusive, or held at all.  The verifier is also ordered so that losing
a race can only cost work: a verifier offered against a directory state
it no longer reflects is declined rather than stored, so the failure
direction is an extra revalidation, never a dentry claiming stale
validity.

Lookup and readdir already run with the parent held shared, and
readdir already instantiates dentries there under that lock:
nfs_prime_dcache() takes an in-lookup dentry with d_alloc_trylock(),
skipping a name another thread holds in-lookup, and invalidates and
retries a hashed dentry that no longer matches the listing.  A create
joins concurrency NFS already handles.

NeilBrown's "nfs: remove d_drop()/d_alloc_parallel() from
nfs_atomic_open()" states that the method has exclusive access to the
dentry in one of two ways: O_CREAT, where the parent is held exclusive,
or a dentry carrying DCACHE_PAR_LOOKUP.  Setting the flag removes the
first of those for open(2), which reaches the method through
lookup_open(); nfsd reaches it through dentry_create(), which still
holds the parent exclusive.  "vfs: allow the parent lock to be shared
for O_CREAT" supplies the second in its place: with the parent held
shared for a create, a hashed negative dentry is rejected and the
lookup retried, so an in-lookup dentry is what reaches the method.
NFS's invalidation of a cached negative for LOOKUP_OPEN and that
rejection do not overlap: nfs_neg_need_reval() returns 0 for
LOOKUP_CREATE before it can reach the LOOKUP_OPEN case that invalidates
a cached negative, so the invalidation that covers a plain open never
fires for a create, and the rejection in "vfs: allow the parent lock to
be shared for O_CREAT" never fires for anything else.  The opener newly
in company with a shared create is one opening the same name without
O_CREAT, and that is the opener the invalidation covers.

The flag goes on the NFSv4 directory operations only.  NFSv2 and NFSv3
reach a different atomic-open path, which has not been analysed or
exercised under a shared parent lock, so it does not get the flag;
adding it later is one line.  Referral and automount directories are
unaffected, since they are given different operations vectors.

Every other directory-modifying operation still takes the parent
exclusive; for unlink that changes when "nfs: remove files with the
parent directory locked shared on NFSv4", later in this series, gives
NFSv4 ->unlink_shared().

The measured effect, from a 7.1.13-based kernel carrying an earlier
revision of both patches, is in "vfs: allow the parent lock to be
shared for O_CREAT".

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/nfs4proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index fac8450b65..808bb8f1c1 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -10869,6 +10869,7 @@ static const struct inode_operations nfs4_dir_inode_operations = {
 	.setattr	= nfs_setattr,
 	.listxattr	= nfs4_listxattr,
 	.fileattr_get	= nfs_fileattr_get,
+	.iop_flags	= IOPF_ATOMIC_OPEN_CREATE_SHARED,
 };
 
 static const struct inode_operations nfs4_file_inode_operations = {
-- 
2.43.0


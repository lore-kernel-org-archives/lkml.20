Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297396;
	b=AqRu2uh+h/tWQsywMucViOnQ6dQ7sXKr4v/aRR7DF2GhExwt/KYwgGsPTpbrBR15CIf6
	 2VxHEccWIAf0k7PAwR9EcmbL+mtCdJl1lxkvP8ADwMSD35sN0huY8hyTmGUdP78ClOjXf
	 MtCbezeykHqpjAB7zZEQ4eJPRYp0/c1Yg/Xg9qKRbZHsenVOoBevrbSxG3dliSAYf6WV6
	 jS+Lg5ottt3bPVmnjYVX38e+ZB8XniHuwi3l+0VHdYTk95DuF7O3TqQAaxk+r7rgFvAny
	 8AZ/bVSpObLBe2uYaxLadleYplt37n2fS4Ut+/BwWijLrL4TCvzvBPC/zvYo2hvz0Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAjOFeHOiJyO3E+LMShJhniXIw/25NQLu/aILC9IA/A=;
	b=wHP1XoSxLAuQYTMdVBKqbES+NPjH7aB2jPzW9ktWiZm5VeRrVPAzc88br66ZkyitOrf7
	 Z1WEtJURjYFVmvqXaHzhWEIF/co6Khz+zJt8Gh8+acHBGsry5GVAJxJ7FwhRUNoouCaN/
	 U8Tv1dam/zzEDRK+OlGXO2daUq7f11yPwoD2dalih08qJxT9NeZ7sJkvvWEpejCBEUXbo
	 3itdp2am1KHi9GNpIOAQkh5I4D/UfpydgWaWwtdqYulK1lewQLAIgN2MEb/Xor+PqvWW/
	 s5YsPqJyxOn4s1iM1dLJghpU0pwhYptaUo52haqop1u+W9QaHzGFAK5ZxXWYLLtTwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b="G/r5O3WT";
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604160A2604
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8604160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=G/r5O3WT
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aa9606ddadso1951980eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297395; x=1793902195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAjOFeHOiJyO3E+LMShJhniXIw/25NQLu/aILC9IA/A=;
        b=G/r5O3WTCP567pyFF5NYPtgmj6MAguEOZ4imMA9ujQJRY6FkDHU8LkHDQ26A+Gxtp0
         ghWWgbuTzHHADAfYaL6ZO1bhp0FolkLu2fN7sgmG4RVS9332I7e7PkWYa3aVVUiHaSrR
         YAbdgKF+6sNaDLZtUElzXjxgDLayPCEcmUzhPI1qQQ4SRofPZmoJSMaGMsf0lZQXEyfl
         gC9dkfr8yHrIs85TyYPh1o6uqjiiNpPXOBTtDitcHoMyAuOcGbfV+UDI35u9taassuUZ
         W+B1RANUdjQXPJFOHCQWJ3IzqOPtooz2m37Mo8aN5Vw+hzHsYONl5s1aVWL5rPq5Zz/B
         OeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297395; x=1793902195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAjOFeHOiJyO3E+LMShJhniXIw/25NQLu/aILC9IA/A=;
        b=PQulm79X4uy2vYXOrHyCozdGYjhnE3Vd1co/HYrNAv8DEm4JwBlbFiurOEhHvajUeE
         cARdFa43I/NetlYFnK2b1L73N5wPOf8if4BAlDXUKlcM0Y0e+33x8Wv2bqRTkFMPqx0q
         FOiCwyJUZb6uK86XQh8xOwNIwy+h4yhiD0XXWzeXdFNS/yJIMD8hEHALr+5g4wg9QU+y
         qP4NVraHgJL9UXEiIZvfxN8nh0XDMYRnboMmcbOSxn5H+pC/zWY0CI0BnKjoDxlTrr/P
         eNYxeS8sdcZPTstSGTStBl/mVqEnsGyQqT3yX4USeRwa1fI3urTewXmw5CRe29gVm5u+
         099Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcRf9mHF6CO1WDDu3iJOFy2MQKHx29dLdtuEN0rLCgQ88zqF0pLgF2wptr+WXC77I6fSYEONmORLMhUfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHUs69lPNltI/wucI7q6THoaxOzUsE1ZcarVby6WUCcDbb+KKV
	KwhUhnC0+Jm4gfpWt8qREPhF1frXWBiCveKWjXCdbmKx4VQVyNMRy9bxvTObToRUDUg=
X-Gm-Gg: AYBFou2uftLxPK5a7sgECOosLk/khny+8+j4k9wY0Q7MeDtwr/Ku/JQ/YtZYucQNB+9
	khVjKxSB9aGfIQv98CCAXJghlHmLbRzoRbajguZZsBNczZQUqMGpDQYHfphh4VBdjbkgRedYeDa
	TKwDsekguPZCM/pUL8ML2ii2IEaC+0OBnGf6K8YbuKgM16ZsitZkJ535/ZKIcRLdNBGIhNyJd2G
	kXnNprKu7bMuyh17qL+D1LAt8X1x1iMZxjyfbKeOrtMwTZP/iIqH/kZuhUd0L37d2rgTzwMK7Kz
	uhvdeYU/iLMIEym8SgaXv7AHtplrFq3myRA6vAASPC0LPK5ViXLj4V8D9apMvflrfTjxM8ZmYJu
	i4cj74gauwzLqtSaw4esgOmtye1s930F0+Wi1ZfilSI9Ab84EihGij+lIYG3nnzd+MbYhnEWPDk
	8FXZn7RLwigSUTc6MjqssR1T/x4t9c/ddh3U94frUE3Q9nzk5NDoTik2X+8kGgnsiO4rjfXjAwd
	64zw6yjozNuyCAnKFVreutDvfqnrOBXGb///jJlz304Xb6bUudSIe+ZE8IUlHSTtzb3qqHVvYQo
	tlWW86aCxYpY1upcSU2AN5CzFkboCQi8e5B6QZluFkT1Fbm0oALsVwRodyLGjykjUOM3k0cfCw=
	=
X-Received: by 2002:a05:6820:1c84:b0:713:da3b:8bc1 with SMTP id 006d021491bc7-714f29d3fb6mr35971eaf.39.1793297395405;
        Thu, 29 Oct 2026 11:09:55 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355295fbsm149150a34.25.2026.10.29.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:09:54 -0700 (PDT)
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
Subject: [PATCH 2/3] nfs: answer a handed-off silly-delete on a removal target with -EBUSY
Date: Thu, 29 Oct 2026 12:09:49 -0600
Message-ID: <20261029180950.387072-3-jonathan.flynn@hammerspace.com>
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

When the last user of a silly-renamed file goes away, nfs_call_unlink()
can hand the delete it still owes to another cached entry for the same
name: it marks that entry DCACHE_NFSFS_RENAMED and stores its struct
nfs_unlinkdata in ->d_fsdata, under the entry's ->d_lock.  NeilBrown's
"nfs: fix nfs_call_unlink()" makes that hand-off reachable; before it,
the lookup for the other entry was given a name with no hash and never
found one.

The VFS refuses to remove an entry so marked, or to rename over one,
with -EBUSY, but may_delete_dentry() tests the flag without ->d_lock,
and a hand-off can land after it.  nfs_unlink() repeats the test under
->d_lock and treats a marked entry as a bug: it warns and returns
-ETXTBSY.  nfs_rename() makes the same test before it takes ->d_lock, so
a hand-off can also land between the test and block_revalidate(), which
then kfree()s the nfs_unlinkdata as if it were a device name.  Its
credential and name are leaked, DCACHE_NFSFS_RENAMED stays set with no
data behind it, and the final dput() of the target reaches
nfs_call_unlink() with a NULL pointer, which it dereferences.

Take the target's ->d_lock before the tests in nfs_rename(), as
nfs_unlink() already does, and answer a marked entry in both with
-EBUSY and no warning, as may_delete_dentry() does.  No hand-off can
land between the test and the store any more, and one that landed
before the test makes the entry the busy file the VFS already refuses.

This was found by an AI coding assistant (Claude Code) reading the
code.  The hand-off itself has been reproduced with "nfs: fix
nfs_call_unlink()" applied; its race with a removal or rename has not.

Fixes: 3c59366c207e ("NFS: don't unhash dentry during unlink/rename")
Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---

Notes:
    For reviewers and review tools; not part of the changelog.
    
    A hand-off that lands while nfs_rename() is in its silly-rename
    branch (the target's count above 2, with ->d_lock dropped before
    d_duplicate()) still gets -ETXTBSY: nfs_sillyrename() fails with
    -EBUSY, and that branch returns -ETXTBSY for every
    nfs_sillyrename() failure.  This patch leaves the branch as it
    was, and the handed-off data is neither freed nor leaked there,
    since nfs_async_unlink() tests and stores under ->d_lock.  An
    automated review (Claude Code running Sashiko's review prompts)
    raised this; it was checked and dropped as not introduced here.

 fs/nfs/dir.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 36cb99f746..dc7784b666 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2605,10 +2605,18 @@ int nfs_unlink(struct inode *dir, struct dentry *dentry)
 	 * completes.  ->d_revalidate will wait for ->d_fsdata
 	 * to clear.  We set it here to ensure no lookup succeeds until
 	 * the unlink is complete on the server.
+	 *
+	 * may_delete_dentry() refused an entry carrying a silly-delete,
+	 * but without ->d_lock, and nfs_call_unlink() can have handed
+	 * this one a silly-delete since.  It is busy, as the VFS says.
 	 */
+	error = -EBUSY;
+	if (dentry->d_flags & DCACHE_NFSFS_RENAMED) {
+		spin_unlock(&dentry->d_lock);
+		goto out;
+	}
 	error = -ETXTBSY;
-	if (WARN_ON(dentry->d_flags & DCACHE_NFSFS_RENAMED) ||
-	    WARN_ON(dentry->d_fsdata == NFS_FSDATA_BLOCKED)) {
+	if (WARN_ON(dentry->d_fsdata == NFS_FSDATA_BLOCKED)) {
 		spin_unlock(&dentry->d_lock);
 		goto out;
 	}
@@ -2801,13 +2809,25 @@ int nfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 		 * completes.  ->d_revalidate will wait for ->d_fsdata
 		 * to clear.  We set it here to ensure no lookup succeeds until
 		 * the unlink is complete on the server.
+		 *
+		 * Test under ->d_lock, which nfs_call_unlink() hands a
+		 * silly-delete over under and block_revalidate() below
+		 * stores under, so that no hand-off lands between the test
+		 * and the store, which would kfree() it.  A target carrying
+		 * one is busy, as may_delete_dentry() says when it sees the
+		 * flag first.
 		 */
+		spin_lock(&new_dentry->d_lock);
+		error = -EBUSY;
+		if (new_dentry->d_flags & DCACHE_NFSFS_RENAMED) {
+			spin_unlock(&new_dentry->d_lock);
+			goto out;
+		}
 		error = -ETXTBSY;
-		if (WARN_ON(new_dentry->d_flags & DCACHE_NFSFS_RENAMED) ||
-		    WARN_ON(new_dentry->d_fsdata == NFS_FSDATA_BLOCKED))
+		if (WARN_ON(new_dentry->d_fsdata == NFS_FSDATA_BLOCKED)) {
+			spin_unlock(&new_dentry->d_lock);
 			goto out;
-
-		spin_lock(&new_dentry->d_lock);
+		}
 		if (d_count(new_dentry) > 2) {
 			int err;
 
-- 
2.43.0


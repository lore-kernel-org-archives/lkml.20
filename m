Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440789;
	b=fvTrOuxN/NxoENk01tnXAF+E1ZiORnc4wUCv1VBbYAtVqBis4jfnR+Z8JEZ2Ijyt2B+C
	 u+U9WmzdajwHJL+gXAwJRWN+jvICvwnMW68IN+qQNrfMIUKdFaDa6lKJx90gCzWA2LQme
	 PLXHBPTVJzzs7iUFtgJt1s13oCcbafkYDWzsSydyimaCChED3RG7YKK6ESOaUEizkSoLK
	 lCjuu6MT42yt4Md3HHRXsM+HKRgC29joz+z3t5Guxxt5P6NsU1z1uNOSay7HZM5kmNLe0
	 6kX95Q2GEXGHqwdQtzmV/2IDN7yUI/w1UeReJOcEVJgq5ajoHtwR8o3x1sAhajjPD4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ITYQ9SMUMUzsDBidSLwyNR2VOF+KmWaRc1GA54epvew=;
	b=LTpvk0zCiFFbJqg7KmGT0k7xdX6ENUELMeD/CVfOcMT+e5AoXklhUnX6tpPVWA8/v8Wy
	 l4aSAz28Vh+HygMojnLQMKZJp15hIZJj4gi6EWE7ofpWFVlyrfCHZ79rpuY/eHO93gkwC
	 pnFtFmTopIvSj0+74x+Of4nQg+tyfcnacigFGuW6z4G+gSsOu1I7HSPEjsNs2FrceL7gb
	 hsPK3UZ7WiMGrE5RfkerNdLLpHWH+jvlGSwtEiOb/fYeoBNL0gIe9Oz7Waza198IM9CFO
	 Zx2sqVLB8O5jukHN03XKQSf3p/R3FMvEKpmVfPgDjhsz35kgd0rbZBcD4A5bYlnSsiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSnDo03w;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96FA606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B96FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSnDo03w
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso866532f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440787; x=1794045587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITYQ9SMUMUzsDBidSLwyNR2VOF+KmWaRc1GA54epvew=;
        b=fSnDo03wS+l0nban1JFiLHwOrR1NMUzw+QfIOoISqCYGMecxQJ0fT5cm4T0HDr9bWY
         lnagcIuX4J3az+kXBw8vRSAetW+DzONYhYh+Ci8cHV1g8PWnNrJaEze422LsHp9kEgGH
         LOPig0lX8CffQh7WzMk2omuswwc8oMX4Smx1L48MHF9WbR/kFa9NeBU/rDJ743I5GQw/
         boHEaO/KCdGT1HQ2ni/spSGIylSuaPJUEftHloYAg7razNn7yjT4LWXwcOir65wGvxcR
         SRRHtYGIel99XLBDPPupwWKDHCz92b06E6iD63JeceGI48gIzr3YsF8iPPZsY2H+vMjQ
         cARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440787; x=1794045587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITYQ9SMUMUzsDBidSLwyNR2VOF+KmWaRc1GA54epvew=;
        b=FrA9JkOey0ApJ/l2WuDSnsGSqujy0A8URrd8ejYVdNeVxAhj5Ld1v/1sZ0l97++c/X
         yQZN3S6uxB12JNu2sBbrxXlrHRauTXK9JlgWM7sc5kN+0cPISv15X2cr44tXufRIyDXF
         RotvDMrih7O8aHTJKo+v9RcREJ97bceJPTvVXl4EFBWBnk1xMGnWFWwdt40EJrXO3rAT
         xDhLDiQ1cLjT4IrKO9L50PKbVcDWxY1datJtGRyhc28Aa4za9FLizm0C5taHSCGT+WgE
         QGBxybhv24xaX0IhTklBf8kbE+UpnzAyVEyDPyrIpKf2lPSUa7dyHgsQU4ja2nsoOkti
         D6sQ==
X-Forwarded-Encrypted: i=1; AKwUvByw7cQDn1h5Fu48Y6g6R91KMyCDM9yZFkMdPvBE862zvOgzEBG41ZspHg1lRUHUpjKsGURfUirzlo2BVO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ253mLDaQymmfD0FXvJtniwGRO5Ye/QdQcWpM2qnV1ZVo+kr6P
	u85r8WeTZC+mrRrd4p1AcRVnQSaYvrRvZGKcO1x9aJnk2Kqm+RGHQ+KszLDlhGWGkEM=
X-Gm-Gg: AYBFou0k3Admphtx5qKFHbKFOm9rdlQrrF2lDJW00+BwLMwqeSl0uftivLXTQEd4GfQ
	Ik2YFnqAbcQlxPuqqt7Pwm0YvECI8yo1dzjIKJTjovkycy1JhA3RH4e2oi2/W5+PBND2wsL7oKa
	MqPWtkyiPPbypos8VN4HHIrAW1J12Dfuyn3GRfUX5xQ83x2ng4JTTGLzDz6drVpES1ZxkynkrH2
	SedEf7w3qRqfGmFwnxB3toR0SXdFG0xCf1qTF59urv1gfpI+udj+TOaciAuSl/4Qg5jdUz21nYq
	sZ91VJncF0WgBFBXA2HMggTMzuuYFPGixo2BF57aWJ4/KJJe+qn93DEDPywa6u8MWEjBkeE7Asa
	LwHtAvhdlnWPnvFCaDU+gFvLtNoWUgtIuJ5FoPPJTrKVEuCrocJJBCSTy4U/BFSN16UXO6Bc/Qq
	vsFxHLonGiXHIdxD+eInsyXjfm7SlpHwikw6uyiNyRF36h183EEbNWba03cCLPeHeAYqpAdOa/6
	wT7WOmZoYv0yS/7lTSnMFOLNvK5wKUwOB2Q4e0lynn61CgiWoVkxiWSuErZPlyPHxkooDPEpnRf
	EoR7uruRzzjJ4nFSe0tFIiJrmKmY/pqFJuB3ZcEW7ls5B56SaE+0RjsPRzdZL82BxAvOEdYLvX1
	Jv8FLNeFXlcJQfbVV
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr10423879f8f.45.1793440786724;
        Sat, 31 Oct 2026 02:59:46 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm7882870f8f.47.2026.10.31.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:59:46 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix loss of index entries in indx_insert_into_root()
Date: Sat, 31 Oct 2026 10:59:44 +0100
Message-ID: <20261031095944.1532712-1-m.sadowniczyk@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When a new entry does not fit into the index root,
indx_insert_into_root() shrinks the root to a single END entry, moves
the root entries into a new index block and inserts the new entry
there. If the new entry does not fit into that block either, a separate
branch is meant to handle it ("MFT record is the same or bigger than
index buffer").

That branch is never taken: its check uses hdr_used, which was read
before hdr_insert_head() copied the root entries into the block, so it
only covers the END entry. hdr_insert_de() then fails and the function
returns -EINVAL with the root already pointing at the new index block,
which is never written. The entries that were in the root are lost.

This needs MFT records as big as the index block (4096 bytes, as
Windows and mkntfs create for 4096-byte sectors) and entries big
enough that the root entries and the new one do not fit into one
block together. With 247- or 255-character names in a new directory
with a short name, creating the 7th file fails with EINVAL and the 6
existing files are gone, also after a remount; the directory then
lists as empty, and lookups and creates in it fail:

  ntfs3(loop0): ino=1b, "d" indx_read_ra
  ntfs3(loop0): ino=1b, "d" ntfs_readdir

When the root that is moved already has subnodes (a later push-down in
a bigger directory), its entries carry the whole tree, so no file in
the directory can be looked up any more. With 243-character names the
32nd create fails, and afterwards none of the 31 files can be
unlinked, although readdir still lists those in the child blocks.

Only re-reading hdr_used is not enough. The branch inserts the new
entry again from the root with indx_insert_entry(), but the new entry
can be a node entry (a key promoted by indx_insert_into_buffer() or
the replacement key in indx_delete_entry()), and indx_find() always
ends at a leaf for a key that is no longer in the tree, so the node
entry would be put into a leaf. The branch also calls fnd_clear() on
the caller's fnd, which releases a buffer that
indx_insert_into_buffer() still uses if the insert fails.

Re-read hdr_used after hdr_insert_head(), and in that branch split the
new block with indx_insert_into_buffer() through a private fnd (the
caller's fnd describes the path to another block, or none): the new
entry goes into the half it belongs to, at its own level, and the
split key is promoted into the root, which at that point holds only its
END entry.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
---

Notes:
    Reproducer (as root, ntfs-3g's mkntfs):
    
      truncate -s 256M img
      mkntfs -F -Q -s 4096 img
      mount -t ntfs3 -o loop img /mnt
      mkdir /mnt/d
      x=$(printf '%0254d' 0)
      for c in a b c d e f g; do touch /mnt/d/$c$x; done  # g: EINVAL
      ls /mnt/d | wc -l                                    # 0
    
    Tested on the ntfs3 devel tree (ee1cb3443cff) in a virtme-ng VM with
    KASAN and lockdep. Without this patch the reproducer above lists 0
    files, and after a remount ls fails; with 247-character names 6 files
    are lost as well, and with 243-character names the 32nd create fails
    and none of the 31 files can be unlinked. With it:
    
    - the reproducer lists 7 files, also after a remount;
    - 80 files with 120-, 200-, 230-, 243-, 247- or 255-character names
      created in ascending order, with the listing and an lstat() of every
      name checked after every create; after a remount the listing is
      checked and every file is unlinked;
    - 120 files with 243-, 247- and 255-character names created by ntfs3,
      then the image mounted read-only with ntfs-3g, whose lookup walks the
      B-tree itself: every name is found and listed, an absent one is not;
    - a randomised test of creates, unlinks and renames in one directory,
      3000 operations (names of 1..255 characters, two thirds of them 254
      or 255) and 2000 operations (names of 230..255 characters), with the
      listing and an lstat() of every name and of one absent name checked
      after every operation, then a remount and unlink of everything in a
      seeded order; 4096- and 1024-byte MFT records, three seeds each;
    - failslab with a stack filter and /proc/thread-self/fail-nth, failing
      each allocation in turn in the create that takes the new branch, for
      a leaf entry (255-character names, 7th create) and a node entry
      (247 and 243 characters, 25th and 32nd create): failures of the new
      fnd_get() (node cases), of the nested split's allocations (including
      its indx_new()) and of the caller's split are handled without losing
      entries, and every existing name is still listed and found, also
      after a remount. The only losses come from the outer indx_new()
      failing after the root was shrunk, the separate problem mentioned
      below.
    
    All pass. The randomised, 80-file and failslab runs also checked dmesg:
    no KASAN or lockdep reports (in the randomised runs lockdep was still
    active at the end). The
    patched test kernel carried a local stand-in for "[PATCH v2] fs/ntfs3:
    fix double ni_unlock() in ntfs_readdir()", because that bug otherwise
    turns lockdep off at the first readdir of a directory that does not
    fit into one getdents() buffer.
    
    A temporary printk in the new branch (not part of this patch) showed
    it taken with leaf entries and with node entries in these runs. A
    review of the first version of this patch, which only re-read
    hdr_used, found that it puts such a promoted node entry into a leaf;
    the 247-character test reaches that case at the 25th create.
    
    Not tested: a replacement entry from indx_delete_entry() reaching the
    branch, indexes other than $I30 (no other index has entries big enough
    to reach it), and Windows chkdsk on the resulting images. The 1024-byte
    runs only check for regressions; the branch cannot be reached with
    1 KiB MFT records and 4 KiB index blocks. In one earlier run of an
    older version of the randomised test (1024-byte records, unlink order
    from Python's hash-ordered set) on a kernel with only the hdr_used
    re-read and the ntfs_readdir() stand-in, an unlink of a name that had
    just been listed returned ENOENT after a remount. The branch cannot
    be reached with 1024-byte records, so that kernel behaved like devel
    there; later seeded runs, with renames added, did not show it, and I
    have not analysed it.
    
    A separate problem in the same function, which this patch does not
    address: if indx_new() fails after the root was shrunk (an allocation
    failure), the root is not restored either, and a plain restore does not
    fit back into the MFT record once $INDEX_ALLOCATION has been created.
    I will report that separately.
    
    An AI assistant (Claude Code with Claude Opus 5.5) found this bug while
    reviewing indx_insert_into_root() during my investigation of another
    ntfs3 issue, wrote the tests and drafted the patch and this changelog;
    an AI review of the first version found the node-entry problem. I
    reviewed the patch and the test results.

 fs/ntfs3/index.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760..55522da73 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1624,6 +1624,13 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 	return err;
 }
 
+static int indx_insert_into_buffer(struct ntfs_index *indx,
+				   struct ntfs_inode *ni,
+				   struct INDEX_ROOT *root,
+				   const struct NTFS_DE *new_de,
+				   const void *ctx, int level,
+				   struct ntfs_fnd *fnd, NTFS_CMP_FUNC cmp);
+
 /*
  * indx_insert_into_root - Attempt to insert an entry into the index root.
  *
@@ -1810,6 +1817,8 @@ static int indx_insert_into_root(struct ntfs_index *indx, struct ntfs_inode *ni,
 		err = -EINVAL;
 		goto out_put_n;
 	}
+	/* hdr_insert_head() has added the root entries. */
+	hdr_used = le32_to_cpu(hdr->used);
 
 	/* Update bitmap attribute. */
 	indx_mark_used(indx, ni, new_vbn >> indx->idx2vbn_bits);
@@ -1818,17 +1827,29 @@ static int indx_insert_into_root(struct ntfs_index *indx, struct ntfs_inode *ni,
 	if (hdr_used + new_de_size > hdr_total) {
 		/*
 		 * This occurs if MFT record is the same or bigger than index
-		 * buffer. Move all root new index and have no space to add
-		 * new entry classic case when MFT record is 1K and index
-		 * buffer 4K the problem should not occurs.
+		 * buffer: the root entries left no room for new_de. The root
+		 * already points at the new buffer, so write it first and then
+		 * split it like any full buffer below the root. new_de may be
+		 * a node entry, so it must go into this buffer, not be inserted
+		 * again from the root. The split key goes into the root, which
+		 * now holds only its END entry, so this branch is not reached
+		 * again.
 		 */
-		kfree(re);
+		struct ntfs_fnd *fnd2;
+
 		indx_write(indx, ni, n, 0);
 
-		put_indx_node(n);
-		fnd_clear(fnd);
-		err = indx_insert_entry(indx, ni, new_de, ctx, fnd, undo);
-		goto out_free_root;
+		fnd2 = fnd_get();
+		if (!fnd2) {
+			err = -ENOMEM;
+			goto out_put_n;
+		}
+		fnd_push(fnd2, n, NULL);
+		n = NULL;
+		err = indx_insert_into_buffer(indx, ni, root, new_de, ctx, 0,
+					      fnd2, cmp);
+		fnd_put(fnd2);
+		goto out_free_re;
 	}
 
 	/*

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297421;
	b=5N+3BPGlmxeUQ9UoEUZp8qOMnVlQIjJ+LwDxSWcOt3VUJLesQFxD++ssONYx11X/jw5a
	 c5DoQ8miB2B/9jgcRm0IiwVWduiEpGWAyS9KnxQDmP/EXN9Wd15cTJywDBfe1VEfWV2xF
	 m+6pO3Oezc3duy+t0pfAy3WdlgmmEjcnU5ykOQzvm1108lw6DL1HkHgDxRupNyr6ibmVV
	 dvLJ4lCBocj65d8ahr6xol482TlNYmxruA0NACm2YBDnhdW3rkEwcnN8c+jy7idwVmx46
	 Z5HO7uNYUpFDraQ70tR+vq6Csv6bpnD5QTpDehhCR5RxpKVkFl7m1xKGLI3inaBt+cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dgDYcOW/jCAQEvwY8NBNP2pASb7BMmxqcS2FbIf9bZo=;
	b=pvp2DRn9X6UPFBMBfi9oLunExpAePKetkapUl0/OneSnC6zKndh2gHvdpvvKqNWiaFkC
	 loPlHrCDw15hR+K64x/3IBk9P2i6G2XjQ7unm4r4Q1m4cNc+nxBgCjAq9L3ANz8M3KmrT
	 X45+37GeVs0k7Qs8YiB5MwIR7sHI3gxT/T3r/2gFZLqrek3a5yOXLSa5jTKjWNaay3+Dv
	 lvo5bH2duWR/eUT685uM8TWyX7SjATfFyG0SQDa+EQawKIFo7hmdAk0raC47GkfG/lG/u
	 4DnwtlLlaHXnSyEiZHwB9tvcA2JRMp0fgv8aNSo9hqIXhwD3EXTidtdkJ9N8wa8WNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b="CcSXs2/C";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891A606AB4B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9891A606AB4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=CcSXs2/C
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6fe4372c5f3so1631383eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297419; x=1793902219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgDYcOW/jCAQEvwY8NBNP2pASb7BMmxqcS2FbIf9bZo=;
        b=CcSXs2/CdY20xLskbaPf8rK3AAKMR/0eWui6qXDzZu3US6WYaryFwEcLQYs6w3EHc5
         aQV2hg4EO7/oHZLZRTUzkCwsByA6WPvxdzbdTjjbu7dUB5tdFSyVPOkcH82WUL9v62XV
         dNr+Ihu2MFj/tCwFYwva7jQeryv652SENP8M2wIAHq2sSLnAi7+tG3pE5TGEM0BxW7JX
         1BymjPgWtDDvOYORSnckg9ANPD0FEH2LHuYgRd72IR1dXnjK1SfQlsZs5UsFxVDas8rt
         iFK/CmHuZpwy8EjPXMC74RIi54uA/1aOJA/Py/tAB9lzIVOnO5EVuGlwK05LCHGFd7Sp
         dlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297419; x=1793902219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgDYcOW/jCAQEvwY8NBNP2pASb7BMmxqcS2FbIf9bZo=;
        b=e49KLRGA6cTuIbr96mWTGG/0mVPEgrAjhJ8Kr+DdsUgNZ//kGq2tx7piaI7vIqaIfb
         7xwiL8woa2FQKCE4I0qxg6rOsbllrQDSO19CGLFXdslISBp4Deb3T0f+H28EY64HPhmZ
         MbQ50MkAhQzOungnnpv6tMVC4YAvvS/DS/s4dMfF1YQFJyXYn39WPZiMBpmouw09J9cL
         +U0/1ud+jW7oko2XRYOIiaWSOb3PIW7o6FJIK2OMrFCzbuXSc9Ynj+j5iJgomKivOeNv
         JWsVbFO1FpU6vsI2AHerX5N6NpkqaG/5GzbvXABOAKyh09K5+h09J5XKC7QV09eibS5w
         GUcg==
X-Forwarded-Encrypted: i=1; AKwUvBy1RXQOZRHwaRLRVmIxnG946kEXFgKs+DBm09+HUnvr31I9cTpSQja7ZtqcmkJF7yEG/yjgWII/4/vF0Cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKreEFOMqSQgb9HKbCQcuDx2aArKKNH7vVKyMF4kIgZr5cUWZfv
	gsnKQ/o3OqJvRq9CieUNtY2gao/Nepzujr/6fuc0vyJncD5OGOC4I5USLGJywdhgUX0=
X-Gm-Gg: AYBFou2ARKCDXxF+xrFGpjhSfi+ICkfRSBLOhAC4orBcvz0p9liJb3muI9ejKuDeRlE
	C+30f/ekl0i584/7L2Myct2yXd0Ut9MnZE3zYLn+1Md3n+heyLr6T3+eS8jM84kpCIfi3s4ecgS
	fum5PngXS7VgSieRZmayDgsXVbFbKTqk42KkKqfO+XeAh3gjWqr/dcwhxc3DK8xsPF1Ffwn12Kx
	BWaFjZQZoHwOieTSYEhDes7SDWzEpgZQlUyxdkVDJovAbPfeKt3FLM75AoEBgaQUUYgdZpNbqRA
	hGGKKEZ7iAsZPAw/lY5cK5EgTABcW8HcNpKYlyD1F09qFL1xxqLwk/dZCUmLWiZdvKzh5bEhXjA
	mhziDnHkYW4dUMuK8CEyv22hyKNOQYJav662Glsu4h9Xsk4KgFwhVLuPV4vB/bZlJ90YilAIb8C
	iRDEO0VRWlfxnvgwXcDzUU4NJqLAQFQKwztGLvnupn1CcVlvK3hrTIHhcJveWSK7sig/kdlC53M
	8M6lHPdMydH/c9Y04smhA3JPlJWUai122LzYlCAGTvQ/4BFZr7v8n5O8fyhHnDMej40UL8mH88O
	UsqrTUQVohThgN10UxeT4KanZX6e31Ej9nsOqOfoDjjOS/BkCYe0WKnJWtcddo4kiPp/OVjb
X-Received: by 2002:a05:6820:a504:20b0:6dc:6e90:f650 with SMTP id 006d021491bc7-714f2947ed7mr33452eaf.15.1793297419439;
        Thu, 29 Oct 2026 11:10:19 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm189856a34.6.2026.10.29.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:16 -0700 (PDT)
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
Subject: [PATCH RFC 09/12] nfs: do not cache a name from a listing that a removal overlapped
Date: Thu, 29 Oct 2026 12:09:54 -0600
Message-ID: <20261029180957.387138-10-jonathan.flynn@hammerspace.com>
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

With a removal holding the directory lock shared, a directory listing,
which holds it shared too, can run beside it, and the server can build
the listing before the removal while the client reads it after.  The
client would then put the removed name back in its cache as a valid
entry, and keep it for as long as it trusts its cached view of the
directory.

Count, per directory, the removals made with the directory locked shared:
those waiting for the server's answer, and those that have had it.  A
listing notes the second count before it is requested, and adds no new
name to the cache while a removal is waiting or once one has been
answered since.  Positive entries already in the cache are covered by
"nfs: keep the dentry of a shared-parent removal hashed".

Nothing counts a removal yet, so nothing changes.  NFSv2 and NFSv3
listings note the count too, and NFSv3 listings that return attributes
make the same check; the behavior of both is unchanged.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/dir.c           | 16 +++++++++--
 fs/nfs/inode.c         |  2 ++
 fs/nfs/internal.h      | 63 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/nfs_fs.h |  8 ++++++
 4 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 2a4c059064..d9ba3cb1d7 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -165,6 +165,7 @@ struct nfs_readdir_descriptor {
 
 	__be32		verf[NFS_DIR_VERIFIER_SIZE];
 	unsigned long	dir_verifier;
+	unsigned long	shared_removal_seq;
 	unsigned long	timestamp;
 	unsigned long	gencount;
 	unsigned long	attr_gencount;
@@ -603,6 +604,7 @@ static int nfs_readdir_xdr_filler(struct nfs_readdir_descriptor *desc,
 	timestamp = jiffies;
 	gencount = nfs_inc_attr_generation_counter();
 	desc->dir_verifier = nfs_save_change_attribute(inode);
+	desc->shared_removal_seq = nfs_dir_shared_removal_seq(inode);
 	error = NFS_PROTO(inode)->readdir(&arg, &res);
 	if (error < 0) {
 		/* We requested READDIRPLUS, but the server doesn't grok it */
@@ -723,7 +725,7 @@ static void nfs_lookup_advise_force_readdirplus(struct inode *dir,
 
 static
 void nfs_prime_dcache(struct dentry *parent, struct nfs_entry *entry,
-		unsigned long dir_verifier)
+		      unsigned long dir_verifier, unsigned long removal_seq)
 {
 	struct qstr filename = QSTR_INIT(entry->name, entry->len);
 	struct dentry *dentry;
@@ -825,6 +827,15 @@ void nfs_prime_dcache(struct dentry *parent, struct nfs_entry *entry,
 		d_lookup_done(dentry);
 		goto out;
 	}
+	/*
+	 * Make no dentry for a name that a removal under a shared parent may
+	 * have taken away after the server built this listing; see
+	 * nfs_dir_shared_removal_since().
+	 */
+	if (nfs_dir_shared_removal_since(d_inode(parent), removal_seq)) {
+		d_lookup_done(dentry);
+		goto out;
+	}
 
 	nfs_set_verifier(dentry, dir_verifier);
 	inode = nfs_fhget(dentry->d_sb, entry->fh, entry->fattr);
@@ -853,7 +864,8 @@ static int nfs_readdir_entry_decode(struct nfs_readdir_descriptor *desc,
 	ret = xdr_decode(desc, entry, stream);
 	if (ret || !desc->plus)
 		return ret;
-	nfs_prime_dcache(file_dentry(desc->file), entry, desc->dir_verifier);
+	nfs_prime_dcache(file_dentry(desc->file), entry, desc->dir_verifier,
+			 desc->shared_removal_seq);
 	return 0;
 }
 
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index e0a2e92952..7885216a48 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -426,6 +426,8 @@ static void nfs_inode_init_dir(struct nfs_inode *nfsi)
 	nfsi->cache_change_attribute = 0;
 	memset(nfsi->cookieverf, 0, sizeof(nfsi->cookieverf));
 	init_rwsem(&nfsi->rmdir_sem);
+	nfsi->shared_removal_seq = 0;
+	nfsi->shared_removals = 0;
 }
 
 /*
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 907ea27ea2..9cd8e5e808 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -152,6 +152,69 @@ static inline void nfs_d_drop_unless_anchored(struct dentry *dentry)
 	spin_unlock(&dentry->d_lock);
 }
 
+/*
+ * readdir holds the directory shared, so a listing can run beside a removal
+ * made under a shared parent, and the server can build the listing before
+ * the REMOVE while the client decodes it after.  Once the removal is done
+ * its anchor no longer stands in the way - the remover's d_delete() leaves
+ * the dentry unhashed or negative - and priming the dcache from such a
+ * listing would put the removed name back, as a positive dentry with a
+ * valid verifier.
+ *
+ * So a remover counts itself in ->shared_removals from before it sends its
+ * REMOVE until the reply is in, and then advances ->shared_removal_seq,
+ * before anything it does can unhash the anchor.  readdir samples the
+ * sequence before it sends the READDIR, and makes no new dentry from the
+ * listing while a removal is counted or once the sequence has moved.  A
+ * listing whose sample is the advanced value was sent after the server had
+ * answered the REMOVE.  The count makes priming stand aside even if the
+ * anchor were to be lost while the REMOVE is in flight.  A dentry that
+ * priming finds hashed is left to the test in nfs_prime_dcache(), which
+ * leaves it alone while it is anchored and once it has been unhashed;
+ * one that the removal left negative is dropped there, and its name
+ * then gets no new dentry from such a listing either.
+ *
+ * Both fields change under the directory's ->i_lock, and the test reads
+ * them under it.  The sample is taken without the lock.
+ */
+static inline unsigned long nfs_dir_shared_removal_seq(struct inode *dir)
+{
+	return READ_ONCE(NFS_I(dir)->shared_removal_seq);
+}
+
+/*
+ * Has a removal under a shared parent been in flight in @dir since @seq was
+ * sampled, or is one in flight now?
+ */
+static inline bool nfs_dir_shared_removal_since(struct inode *dir,
+						unsigned long seq)
+{
+	struct nfs_inode *nfsi = NFS_I(dir);
+	bool since;
+
+	spin_lock(&dir->i_lock);
+	since = nfsi->shared_removals || nfsi->shared_removal_seq != seq;
+	spin_unlock(&dir->i_lock);
+	return since;
+}
+
+static inline void nfs_dir_start_shared_removal(struct inode *dir)
+{
+	spin_lock(&dir->i_lock);
+	NFS_I(dir)->shared_removals++;
+	spin_unlock(&dir->i_lock);
+}
+
+static inline void nfs_dir_end_shared_removal(struct inode *dir)
+{
+	struct nfs_inode *nfsi = NFS_I(dir);
+
+	spin_lock(&dir->i_lock);
+	nfsi->shared_removals--;
+	WRITE_ONCE(nfsi->shared_removal_seq, nfsi->shared_removal_seq + 1);
+	spin_unlock(&dir->i_lock);
+}
+
 static inline fmode_t flags_to_mode(int flags)
 {
 	fmode_t res = (__force fmode_t)flags & FMODE_EXEC;
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index b45952727c..3e86449485 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -205,6 +205,14 @@ struct nfs_inode {
 			/* Readers: in-flight sillydelete RPC calls */
 			/* Writers: rmdir */
 			struct rw_semaphore	rmdir_sem;
+			/*
+			 * Removals made with i_rwsem held shared: how many
+			 * have finished, and how many are waiting for the
+			 * reply to their REMOVE.  Both change under
+			 * ->i_lock; see fs/nfs/internal.h.
+			 */
+			unsigned long	shared_removal_seq;
+			unsigned int	shared_removals;
 		};
 		/* Regular file */
 		struct {
-- 
2.43.0


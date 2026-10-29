Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297405;
	b=k769zXbV2mjgED3KXmxOei084LEc0QJUDygCu3cAiCCWeWjyH/IvX/vZ62D1/KZnO9Gv
	 r3tmSDRHRfvuZdc+TKnLnICw1CIJS2LuqduFLhfNYE98o46f9i2smqEzU6cflgL08aHwU
	 UnfosfX5oCROXV1uStQosTWrmk3mXjy0UR8SZeHVAIZQT2uUmDqHQfVNp2c8RuQq0qvam
	 RD2PP78WwjwbhLA4X47vXiQvb/BJ58obkbej8o5yhW0vU3OVduMfR29g8xxzG72GOHH0d
	 Nj9GVYGlsw18YLbMdzmfuTenhS1uui1kFTIyMOWquqzSiO4lG8qo1bR1NTuXOt3I4bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pm1R1Yg8qM+RQX7ApNjTy6aurLKiAREVlSqc/qkmz+A=;
	b=vzHXlBhsyWBuPtnbKRiJyBsvOITesAYshcJW2SKwdXoQl5mNNnnNKFD+OOFeaDb9vwdQ
	 XIziqPbwrISqQiSi/5MwFhiUU0+P70iZPxs5oKGNQRO6ta9kM68JmSgywxgXP3eAb5H7J
	 KaKyt5G5pcH8yOoFiPCq7PDAMbfYD8EW1WNpSemBVT5CHDFRWjk+gcFjsNd6iMPYmYe1B
	 9lIzaSgF6h0rPKFPaBzGbi00hBEynaKvNGvzoUm7eUZQAL4QP5Np+FWM7y2gV8CHvc+Pk
	 vInOKj71pRsTuDAbbVaM/7UhvRwA0iunIv2NIw62ufPN5Eyc2UoqUSRgyaKpZcMgmZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=m41LuiIJ;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3D60A5BD7
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E3D60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=m41LuiIJ
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b21f71613fso1651941b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297404; x=1793902204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pm1R1Yg8qM+RQX7ApNjTy6aurLKiAREVlSqc/qkmz+A=;
        b=m41LuiIJlm3MggjpHDY1vfjUIc3UfxLDNZGSIVM8Fm3PovKNWnn9hGmi3Gz42FmWKW
         1089sX1WmPElVGNk7+XJXmOA7D40jb8N2b9CJ7tpRrb3Bh8LnlsDoLp0mjQk8fMUvPPc
         mdP4X4O1OSG/tPVrUxR8lw4cIQI6sgkwPLL/pVmC/I1mHKDXr0Uj4hCOnO4+6vWQxXMb
         l3c4nMqwgJmYSolJYQGozefAPJxYZjEaz5i60mFN+Tg5i70xdP+V//Ff+4djT3yvRDy5
         mm6T7swk7bJkv2f9lyBPEDqW6lD6W4FmujHpQTImEvHSWMdvKuOsUvoktLBUJl8VThXJ
         HuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297404; x=1793902204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pm1R1Yg8qM+RQX7ApNjTy6aurLKiAREVlSqc/qkmz+A=;
        b=OeNzEP8QR0qMnjDvYoIzLObm2iaNyum0m8XXHgMo1XxVF8MXALfMDvLYi8nQDMEwM+
         +O7mz97mTFyKcG4wbBskN9szRnQRekj04OhQF/0EtFtMNJzJIAGEiV/Xv6OL+oT0b1v6
         cI3NNgNgjlaiLKr9Qt/XM6tzxfezbL0vigzxymxfPGBMsufIRGrKu0wAcIaV0QVWJiuQ
         prEFe6FvSbbB6PFSUZPTaAY9lpSrAqtw6sJoysJqgOZmHG7WhvxIVKoP4v3b/1WP6akb
         +GsP3h6q25aOFj4/SCULZGdK1oaRWJCviVS64svc8xgNlzt+/9JLjms08LneHJHkwtGG
         +C1Q==
X-Forwarded-Encrypted: i=1; AKwUvByQm1rC4Zgp1jnsLUGB8RlgNq+c9iFeSvhN9TIuHMrMuTEQ8uoM/71P4LxerQZWwqSCwmkG0lEbTUrFSaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Nqb9hF7kNkREBCPaWbaNbDPjxwxdZ/P1+fL9plDs04JFsrH9
	AldwANXSLDdAvv13vLNg/6zzdm94Cr2HoPBZHotqcJHtyVthyC9wXjLoWeqMT/2NPDs=
X-Gm-Gg: AYBFou0PqzhlYibWDmJRSDJG74tdAPcXsqGo0C/yTqPzQs0SN0c9ym+7IGLqmPZu9p3
	EWyewj2QzLn1Wt04k+K5yHqvshudHTzMxwf/Y6iIeVCl4govmBkFXxMVQ0HN8ZiAYgo0ijRU6Qs
	ikerNkCmIWQJTMeS8xuXtpfVoyNu2E1bYpkdom4lfvdnjZdnCuGFXBgVDDk8n/dt6igKgjFHcj+
	MkLUOYHrz3b28mZsQXiJjF2wFRia42SR9UN6VzclMpmpPWH+W1VJe5OsKcQk4gypWIh2hCFmWJu
	MKVORajD/9bDCIPtYjWvVjT3bJNsLNoUJZLAXy3eCKXW2zxeEj1bz18IZmD4mgY64DfEkJIK+Ce
	3msRDk6Xo4gm8kf8CoA/IPFpVnUpiZFpc/m2HAfO8AiLErqG9dtH8HCs4L7mOTuAXrAuBw/C+3g
	mGMKYvoHnR46cLPh6FEXcB68ND9ZPsm1T2TdpdAhXDa9Thph/T9eSK6Hv9rr0k65yK+Q16W7dE4
	YNXHkZiwAkyc/wLcGF4OZAOuYwFXWm8+V4BUZ2w9l9CBWPU0I4uAjrD04SV1L+9oty1oWjA4EO8
	YVcQfH7Rpkup3ftIQ8k44LL1LdEUKwPLqIntdwMAkzzz/XHhplcEg/tax6tQAqA19hVP2vc3
X-Received: by 2002:a05:6808:238a:b0:4f2:ac42:656b with SMTP id 5614622812f47-5640dbd6766mr13996b6e.7.1793297404102;
        Thu, 29 Oct 2026 11:10:04 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm4093603b6e.8.2026.10.29.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:03 -0700 (PDT)
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
Subject: [PATCH RFC 03/12] nfs: tell the VFS when two names can be one entry on the server
Date: Thu, 29 Oct 2026 12:09:48 -0600
Message-ID: <20261029180957.387138-4-jonathan.flynn@hammerspace.com>
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

A server that reports itself case-insensitive, or as not preserving
case, can make one entry of two names that the client caches apart,
because the client compares names byte for byte.  Mark the filesystem
on such a server with SB_I_NAMES_COLLIDE, from "vfs: allow the parent
lock to be shared for O_CREAT", so that the VFS keeps the exclusive
directory lock for creates there: the per-name exclusion that replaces
the lock for a create made with it held shared covers one byte string,
not the names the server treats as equal.  The client learns this when
it reads the server's capabilities, which it does again on remount, on
migration and when a later mount reuses the filesystem, and it updates
the mark each time.

This is a conservative fallback.  A server that declares itself
case-insensitive should itself treat the two names as one, but one that
did not was seen making two files of one name when such creates arrived
together.  No filesystem relies on the mark yet, so nothing changes.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/client.c   |  1 +
 fs/nfs/internal.h | 35 +++++++++++++++++++++++++++++++++++
 fs/nfs/nfs4proc.c |  1 +
 fs/nfs/super.c    |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index ea99b3c105..30206b309c 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -975,6 +975,7 @@ static int nfs_probe_fsinfo(struct nfs_server *server, struct nfs_fh *mntfh, str
 			server->caps &= ~(NFS_CAP_CASE_INSENSITIVE |
 					  NFS_CAP_CASE_NONPRESERVING);
 		}
+		nfs_server_publish_name_caps(server);
 	}
 
 	if (clp->rpc_ops->discover_trunking != NULL &&
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 5af6a032f1..34b8aff4e0 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -224,6 +224,41 @@ int nfs_init_server_rpcclient(struct nfs_server *, const struct rpc_timeout *t,
 struct nfs_server *nfs_alloc_server(void);
 void nfs_server_copy_userdata(struct nfs_server *, struct nfs_server *);
 
+/*
+ * Tell the VFS whether this server can make one directory entry of two names
+ * that differ as byte strings.  NFS installs no ->d_hash or ->d_compare, so
+ * the dcache compares names byte for byte, while a server that is
+ * case-insensitive, or does not preserve case, makes "foo" and "FOO" one
+ * entry.  On such a server SB_I_NAMES_COLLIDE keeps the parent of an O_CREAT
+ * open locked exclusive; see atomic_open_create_shared() in fs/namei.c.
+ *
+ * server->caps is derived again on every probe of the server: at mount, at
+ * remount, on migration, and when a later mount reuses this superblock
+ * (nfs4_proc_get_root()).  So this is called wherever the case bits of
+ * server->caps are written, once they have their final value, and when the
+ * superblock is set up, because the first probe runs before it exists.  The
+ * value is what the probed file handle reported, normally the mount root's;
+ * the homogeneous attribute is not fetched, so a server whose answer differs
+ * below the root is described by the root.  Migration runs the probe from
+ * the state manager without ->s_umount, so the update is atomic, and it is
+ * made only when the value changes.  Two probes of one server at once can
+ * leave the bit as the earlier of them derived it; that needs the server's
+ * answer to change between them, and server->caps has the same race.
+ */
+static inline void nfs_server_publish_name_caps(struct nfs_server *server)
+{
+	struct super_block *sb = server->super;
+	unsigned long bits = 0;
+
+	if (!sb)
+		return;
+	if (READ_ONCE(server->caps) & (NFS_CAP_CASE_INSENSITIVE |
+				       NFS_CAP_CASE_NONPRESERVING))
+		bits = SB_I_NAMES_COLLIDE;
+	if ((READ_ONCE(sb->s_iflags) & SB_I_NAMES_COLLIDE) != bits)
+		set_mask_bits(&sb->s_iflags, SB_I_NAMES_COLLIDE, bits);
+}
+
 extern void nfs_put_client(struct nfs_client *);
 extern void nfs_free_client(struct nfs_client *);
 void nfs_cb_idr_remove(struct nfs_client *clp);
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 113c199a6f..fac8450b65 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -4020,6 +4020,7 @@ static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *f
 		if (nfs4_server_delegtime_capable(&res))
 			caps |= NFS_CAP_DELEGTIME;
 		WRITE_ONCE(server->caps, caps);
+		nfs_server_publish_name_caps(server);
 
 		memcpy(server->cache_consistency_bitmask, res.attr_bitmask, sizeof(server->cache_consistency_bitmask));
 		server->cache_consistency_bitmask[0] &= FATTR4_WORD0_CHANGE|FATTR4_WORD0_SIZE;
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 23292680ad..e70cef88fb 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1082,6 +1082,8 @@ static void nfs_fill_super(struct super_block *sb, struct nfs_fs_context *ctx)
 			sb->s_export_op = &nfs_export_ops;
 		break;
 	}
+	/* The first probe of the caps ran before this superblock existed */
+	nfs_server_publish_name_caps(server);
 
 	sb->s_magic = NFS_SUPER_MAGIC;
 
-- 
2.43.0


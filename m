Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383323;
	b=Y2/y2j/ct5YsF5+H/tnYp+UOPeMD1mbCOPQ5scdKjfPCX0fC+qs2xyrCImGmdZdhfsQ8
	 yuWFw+85PiXO5L0dZWkcGHelGARPS7Xjabxym+o/q58dc4fHfOPxYEAzVToUjwSCtdNBG
	 8X+ZE1eJ6KULb49HkHBYBi+oYcw4ysoOTJkjOq4AC/0EsasyPzSghlueuJM96svHc2Kd/
	 ewch43rtWJapUALXYU62IsK6Pe+rTpXlvpKLoNl+hY+ssv0Fj4+DtrnEB5M6s5zSFKT5U
	 +N3cc7ZO+4X2OsfiQWMJ7wcxxs68DLSOHpfFV5FSOVOealzaqGO7P4ONywUVMADpwBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KmH4ZXitu/F5zLcyKAJJuc2GxRLS44lxp/qvIGKdIQs=;
	b=YDArbx8lo3wI1vu22rRZriXsTy/nq7Iw3N60jf1gO6ZjbhWSKgwyj7eTwBRatvfS+zQf
	 oRANs2B+AoChGNtOykT6CPzZ7BQ4Iix+zwXuC17El+70BKXIcAQYsdj7YXNa1EanVBtIu
	 5HC61gWXOCrrzK/tgz/716o51tarGrYeq1TXah+o/PkVhwMigSFvYQVHcNzBSaGSHSrti
	 bOz5hsuhAAU5iu2EQhed9e9ZHXhpmFXH5qOn9g+eZHaJuVjW9hLFXcHK4zag8wy6S+x0Q
	 M9VbtB6JTqdp7UAxmbiCXNwZKuWRbewGHoLTuIYgm88u0Wyy61cUSjNOSkAj7TXR2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLe2eJFf;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE49606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE49606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLe2eJFf
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37628596783so1775772eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383321; x=1794988121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmH4ZXitu/F5zLcyKAJJuc2GxRLS44lxp/qvIGKdIQs=;
        b=iLe2eJFfKAcFCdWrwD05o+538qgEn4Wi7msKHKTQhjfH+ddAg00tMoDW93HTHjh2EV
         0Nn8yDtKnO6s8BACiq9sJ5b/O9ET7Axn9Z6mGHrconoSjUS22IZi6jcIQst+dNfr0qcS
         Z0IWIMZRLd1dqCqNs9cJMwettXn+oqS3bGDTm0uWUVqk2OwjtPnw4qyikZhPF4MgF7FV
         1Ncz7nbFzs+QmXVkL7EMg/4SoaKqopb9jWZfZ+xy6mPsBfWXYOpKCCYGRlsYaN9KXHoo
         mkHce4cpfJX+D72MW+9oCpghH38MKL9mOI8QWxp12J5mfY0zkkrI/63gtHyMVwh2G5pX
         28tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383321; x=1794988121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmH4ZXitu/F5zLcyKAJJuc2GxRLS44lxp/qvIGKdIQs=;
        b=U/Ju8TZf9PgsvR6FR8r5q5dbbMMWJg29263kBT/cSMcv/UIjgpfD6fovXHrviGm8JF
         oRLDWyr/B7VN+ssarSldLmB7ji5pGvRbS1I3Qq9BW0Wp7V5x6nO+bWQ990eijIaorTZc
         K9s4uMk01yRs8IBWDYMnfUd4BDwMoZnl1l0OCF6+LfZvlTML61SWCQeRTUfhbaaOobsZ
         xfM4okqJzLSO47gAiriUo4Fr9pYg9QravS48JtOoVH407iWsSRulorF/kebj8qXTj0QD
         8eyL0wrknz+XdKklkBxoGymrJq7go15N94nT9uE9kW8eii0a/v2Ta6Xt/TzSMheCDRzh
         lqYg==
X-Forwarded-Encrypted: i=1; AL+hErEoOj6Un3uQixSlpzieBlcQ+3yJTiwsgHp59JjYNVwQ/v7HJOuUiASRdZVjLkT6PC3uYv2F6DsFxy9rGRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W7GB6Xd5BcnmTWdyiaTDdp0VnTB/+LeodPDW4F1NUnZdEan6d
	bDmqY/v3Ob+VIwBieVV7a6a+YYB5T7E+VOjwaPH8uZWQiakAJGdj2T04
X-Gm-Gg: AYBFou1vt8FZ6B0tCX0ksVnGr5HXJO0pAsLMoke8vfvmwU/wNNzB1uwGiLgV+1cJJPP
	ZhC3YdK0xpMujD3KZDpAN6UGneQL2x/h/iWoRIR57EXZilh5QDBolkG0w+CHzszSAzpg0odm6ba
	m2OWwmvAYW1qEyaMTZEWUZxl94V+fliO8cGCJ/zLqDr9/xJVnKjF/qRgQWSrpMJJFGA/6VEBOD6
	ujVIdRhqE7f5At1dvoXZ6JkvxaWqUkfYO8xBsBZaXQdxd5b0PkvrA+DGcmo9FXBlhvBeHi6isDr
	TQGgehTZPZoG6FbijSwPWd+/judXZMinTjQRHhyovkW+Mz2/PIbawjEQ6VSgSmo6TLmPzAmMyv5
	9gC5Zj2yM2UrSO+XAcARYDvKOEJaY3L5MyNQj4Gv6liXqXqo2w1t9IDog0+Tp0mFE5titKMBs6C
	GIRh2T38sLWMSYeogs0dBAM/9dIrG2+DZi3kkheiERbTiesGiedCFxwA5+EFdsOb8NgcFeqClaF
	kCSmVQJ+UHr8Q3Sr2ZC31rKrCB2Qsu2ejOGcnLa11L5nqAszTuU4XRR8oSm+zxEv6WYMocKe1VQ
	wiDyep1Q1M1m/1jx8O65qgEA2M+fialo1CjEi2RhnMgIPBQFM7gE7m1tj2rQGQGnb2Y=
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr2028290eec.7.1794383321067;
        Tue, 10 Nov 2026 23:48:41 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm13675956eec.15.2026.11.10.23.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:48:40 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: cel@kernel.org,
	jlayton@kernel.org
Cc: neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2] nfsd: don't block on a file lease while holding the parent lock
Date: Wed, 11 Nov 2026 15:48:35 +0800
Message-ID: <20261111074835.599584-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Since commit 2a60db3525d4 ("nfsd: (almost) always open file in
nfsd4_create_file()"), an NFSv4 OPEN with create that finds an
existing file opens it with dentry_open() while start_creating()
still holds the parent directory lock. The open flags lack
O_NONBLOCK, so break_lease() in do_dentry_open() blocks. Before that
commit the file was opened later by __nfsd_open(), which breaks
leases with O_NONBLOCK, and the client retried on NFS4ERR_DELAY.

A lease on the file now stalls an nfsd thread for up to
lease-break-time with the directory locked, and other creates,
unlinks and renames in that directory wait for it.

To reproduce, set fs.lease-break-time=15, take F_SETLEASE F_WRLCK on
/srv/g from a local process and keep it, and run "echo x >> /mnt/g"
on an NFSv4.2 mount of /srv from localhost. The nfsd thread blocks
in break_lease() for 15s, and "touch /srv/other" on the server takes
13s.

Pass O_NONBLOCK so that break_lease() returns -EWOULDBLOCK and the
client gets NFS4ERR_DELAY again.

Guarded creates and exclusive creates with a different verifier
fail with NFS4ERR_EXIST on an existing file and have no use for the
open. Skip it for them, as nfsd did before that commit, so that they
don't break the lease and, with O_NONBLOCK, don't return
NFS4ERR_DELAY instead of NFS4ERR_EXIST.

Fixes: 2a60db3525d4 ("nfsd: (almost) always open file in nfsd4_create_file()")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2: also skip the open for guarded and non-matching exclusive
creates (sashiko, via Jeff). The other part of that report, the open
running before the permission check, is older than this patch and is
not changed here.

QEMU guest on b3dfbde62cf1, a local write lease held on f:

                  touch in f's dir while    open(O_CREAT|O_EXCL)
                  "echo x >> f" waits       of f
  b3dfbde62cf1    13.0s                     EEXIST after 15.3s
  + v1            20ms                      EEXIST after 26.5s
  + v2            10ms                      EEXIST after 2ms

v1: https://lore.kernel.org/all/20261110080038.232210-1-zhanxusheng1024@gmail.com/

 fs/nfsd/nfs4proc.c | 43 ++++++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 3a82af381a8d..f19bd69d66f4 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -250,10 +250,21 @@ static inline bool nfsd4_create_is_exclusive(int createmode)
 		createmode == NFS4_CREATE_EXCLUSIVE4_1;
 }
 
+/* Does @child carry the verifier of an earlier exclusive create? */
+static bool nfsd4_create_verf_matches(struct dentry *child, const u32 *verf)
+{
+	struct inode *inode = d_inode(child);
+
+	return inode_get_mtime_sec(inode) == verf[0] &&
+	       inode_get_atime_sec(inode) == verf[1] &&
+	       inode->i_size == 0;
+}
+
 static struct file *do_lookup_open(struct path *parent,
 				   struct qstr *name,
 				   unsigned int oflags,
-				   umode_t mode)
+				   umode_t mode,
+				   const u32 *verf)
 {
 	struct file *filp = NULL;
 	struct path path;
@@ -277,8 +288,16 @@ static struct file *do_lookup_open(struct path *parent,
 		 */
 		int err = nfsd_check_obj_isreg(child);
 
+		/*
+		 * Guarded creates and exclusive creates with another
+		 * verifier fail with EEXIST. Don't open the file for them,
+		 * that would only break a lease.
+		 */
 		if (err)
 			filp = ERR_PTR(err);
+		else if ((oflags & O_EXCL) ||
+			 (verf && !nfsd4_create_verf_matches(child, verf)))
+			filp = ERR_PTR(-EEXIST);
 		else
 			filp = dentry_open(&path, oflags, current_cred());
 	} else if (!(oflags & O_CREAT)) {
@@ -312,13 +331,13 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		.na_iattr	= iap,
 		.na_seclabel	= &open->op_label,
 	};
-	int oflags = O_CREAT | O_LARGEFILE;
+	int oflags = O_CREAT | O_LARGEFILE | O_NONBLOCK;
 	struct dentry *child = ERR_PTR(-EINVAL);
 	struct path parent = {
 		.mnt = fhp->fh_export->ex_path.mnt,
 		.dentry = fhp->fh_dentry,
 	};
-	__u32 v_mtime, v_atime;
+	u32 verf[2] = {};
 	__be32 status, create_status;
 	int want_write_err;
 
@@ -395,8 +414,6 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		attrs.na_pacl = posix_acl_dup(open->op_pacl);
 	}
 
-	v_mtime = 0;
-	v_atime = 0;
 	if (nfsd4_create_is_exclusive(open->op_createmode)) {
 		u32 *verifier = (u32 *)open->op_verf.data;
 
@@ -408,13 +425,13 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		 * verifier, then do_open_lookup() will also need to be
 		 * fixed accordingly.
 		 */
-		v_mtime = verifier[0] & 0x7fffffff;
-		v_atime = verifier[1] & 0x7fffffff;
+		verf[0] = verifier[0] & 0x7fffffff;
+		verf[1] = verifier[1] & 0x7fffffff;
 
 		iap->ia_valid |= ATTR_MTIME | ATTR_ATIME |
 				 ATTR_MTIME_SET|ATTR_ATIME_SET;
-		iap->ia_mtime.tv_sec = v_mtime;
-		iap->ia_atime.tv_sec = v_atime;
+		iap->ia_mtime.tv_sec = verf[0];
+		iap->ia_atime.tv_sec = verf[1];
 		iap->ia_mtime.tv_nsec = 0;
 		iap->ia_atime.tv_nsec = 0;
 	}
@@ -428,7 +445,9 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 				       &QSTR_LEN(open->op_fname,
 						 open->op_fnamelen),
 				       oflags,
-				       open->op_iattr.ia_mode);
+				       open->op_iattr.ia_mode,
+				       nfsd4_create_is_exclusive(open->op_createmode) ?
+				       verf : NULL);
 	if (IS_ERR(open->op_filp)) {
 		int hosterr = PTR_ERR(open->op_filp);
 
@@ -456,9 +475,7 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 
 	if (!open->op_created &&
 	    nfsd4_create_is_exclusive(open->op_createmode) &&
-	    inode_get_mtime_sec(d_inode(child)) == v_mtime &&
-	    inode_get_atime_sec(d_inode(child)) == v_atime &&
-	    d_inode(child)->i_size == 0)
+	    nfsd4_create_verf_matches(child, verf))
 		open->op_created = true;
 
 	if (!open->op_created) {
-- 
2.43.0


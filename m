Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1593064B5
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311009; cv=none; b=N+7jEM3ti/RFbYrIZUkyDC89+n/+jh0Itqx0glq7bXv/IDMKu9CYEUyV6YLs7jE6yiwf8bx/b4NFXwAUtgMZ97jNxTsTLIY7+kl7O+zG8UBd20e0o9yOLCdth6d8F4ienasx+QJtrveKJmAUZJDCVMCWO0ao/w3sBzTJpSYZkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311009; c=relaxed/simple;
	bh=P9Op4lsJc/HwOr9jdCJ522h1eE0TJiozb+9WvD8ELRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXx/ojrwGljUVlEH6dYYJVqIejdwP+KjP5q239noEo2azwnZCEyY9lGQ1Df3p8TYRtrhqW6VQKGif5YETDwgEIwGn9PCubenXtMIs7SvfzWFqR76fpaU66UnVjp1jdJwpQeBJywVG5Bf6vVqFe49pplNF0VCXyuFdWjv7EdbjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khCppjpA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khCppjpA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so4065265e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311006; x=1789915806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45V3oYN24WWaNfR3SZkM292e3snBgoENKm4rPxJfUnk=;
        b=khCppjpAcYgGDeEjzqEkgRhOiUO9qjGU4FIzciMSeyNqMmIzlskEdQjEtSD4Z6en4V
         Ip2427+xIinUkxDVBbTnD0lhoNvAN/I24nUBYGOLzuTHb5bvchN9rwLlka0DQUFsy3hR
         EPq0fTUpMDZssbXXyFP1yIQj3iHMg9+F3EJPuV2gIZVLmHEpUPYaIdamlQhcqFtQv4/t
         RzOKYYPu7HY6EmmYPQz4UXSBqB5jvdt3AzA/Mwb933FZSZ8bQ2dh/LlevqpHkpNDIMLE
         laUsY+UigUL7wtNZFdLc+FnVPD0LHZ4y8U2BdxlHyqKRczE+8oR8fE8WAONLcLWEE4Tt
         Mmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311006; x=1789915806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45V3oYN24WWaNfR3SZkM292e3snBgoENKm4rPxJfUnk=;
        b=lM8JhGo9Kz2rs6VTC1tSdQQGs77SlaR8XLvFryIWOQXqM5tf52veCJaFjpbRLnvxDn
         yLKsfgOWnybGFtKuI4e8idiYgmedyFYgkerunFkrJ32Dxb4RWi119+YVjQSU4OjvOoAn
         yKpg/lpvXA6E5Ytl7rfAszzfcnds5QRyG7+rqk8AXLgy40oMh88SxXI2mvTvVlR5iVri
         2/0w5b38PUrnRbryd+3yjLA3QTN2VnwimsvJuuVfGOegOjn1/Gw0/+Qb2IR2EjzgzEyw
         EVasxE8eplZr2SDu9etwrdOqIwEaOs7b2xOMjwRakQKARveBKfKJmq3mK0IkH2eQ/p3C
         pL8A==
X-Forwarded-Encrypted: i=1; AKwUvBwFcZtClVgD4p9Qi+87jWHGeMHrWaB9In13yTRzvjW5puwOyj9FxNeKXU9cqHEPyAg+USKrAqK5Nhn7WHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mV6KKbVjCuI8gSB2tPeyDg64e0XSfcWQv35A7yIROFVrUWHFP9
	1YzRKTaRLSbebR6Ywf3hrEWeVgHM1azp9t/ziirm22lkfuEIlOx4QsT2
X-Gm-Gg: AYBFou3x5RvELwvKpS29oeMay2Tlcz1gil2smTwJopZPao1ptICozmAGP6mM6lehSnX
	4DqIkmVfUmpcex9wXK+ocqgJ5d7l1WN4E2qsDFZzYXn8DOcC4BtZiEiXGErRPgKoWIige63UOSx
	xajxr8PLF4YIdUY8PgNWTXBTDenF5stUHqp1XUGAHhzZuzZGANi83gXcr2/cj2em+Bc3Xzy9h8Z
	YcCwRtngvoG+wrBxWbPSImFwWCIioxZds5Dcbzo2iae8YXpTwa1A0Wm/i0YyLIlYwe0BDv78b7s
	+u0QntUgGrq5OvZFeErVUIbymXi/1ln55JERDsFvQ7AsxFn/y5OUgnRyk/caLNPI6q00OkmLmp7
	xuS/bOBGKQxG4CCoDUQamN5tp0WXZQdAkFVR74kgQ1pEsQaTJ9p7nzlHTW7ZSfKfyFN6VfhHzKr
	TaqVNa8ohdmov/lcVY97uu1g27o++PzlYwdHgpWHWNxycPFGmSuz2m0U35M7KEdtBKQz7rC9gr+
	vCrNWkrTGgQCKb+INsCmngFauJFHFfYBvgp/TL+a3Y=
X-Received: by 2002:a05:600c:34c2:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49e6cacf765mr67544475e9.12.1789311005425;
        Sun, 13 Sep 2026 07:50:05 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:50:04 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 10/10] nfsd: use path_clone()
Date: Sun, 13 Sep 2026 16:49:17 +0200
Message-ID: <20260913144918.1606123-11-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/nfsd/export.c  | 6 ++----
 fs/nfsd/nfs4xdr.c | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index e5a0f1ababe6..84ea833816b5 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -233,8 +233,7 @@ static inline void expkey_update(struct cache_head *cnew,
 	struct svc_expkey *new = container_of(cnew, struct svc_expkey, h);
 	struct svc_expkey *item = container_of(citem, struct svc_expkey, h);
 
-	new->ek_path = item->ek_path;
-	path_get(&item->ek_path);
+	path_clone(&item->ek_path, &new->ek_path);
 }
 
 static struct cache_head *expkey_alloc(void)
@@ -1533,8 +1532,7 @@ static void svc_export_init(struct cache_head *cnew, struct cache_head *citem)
 
 	kref_get(&item->ex_client->ref);
 	new->ex_client = item->ex_client;
-	new->ex_path = item->ex_path;
-	path_get(&item->ex_path);
+	path_clone(&item->ex_path, &new->ex_path);
 	new->ex_fslocs.locations = NULL;
 	new->ex_fslocs.locations_count = 0;
 	new->ex_fslocs.migrated = 0;
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 7d1b2d6f57f2..65a805501b75 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2966,14 +2966,14 @@ static __be32 nfsd4_encode_pathname4(struct xdr_stream *xdr,
 				     const struct path *root,
 				     const struct path *path)
 {
-	struct path cur = *path;
+	struct path cur;
 	struct dentry **components = NULL;
 	unsigned int ncomponents = 0;
 	__be32 err = nfserr_jukebox;
 
 	dprintk("nfsd4_encode_components(");
 
-	path_get(&cur);
+	path_clone(path, &cur);
 	/* First walk the path up to the nfsd root, and store the
 	 * dentries/path components in an array.
 	 */
@@ -3216,11 +3216,11 @@ static __be32 fattr_handle_absent_fs(u32 *bmval0, u32 *bmval1, u32 *bmval2, u32
 
 static int nfsd4_get_mounted_on_ino(struct svc_export *exp, u64 *pino)
 {
-	struct path path = exp->ex_path;
+	struct path path;
 	struct kstat stat;
 	int err;
 
-	path_get(&path);
+	path_clone(&exp->ex_path, &path);
 	while (follow_up(&path)) {
 		if (path.dentry != path.mnt->mnt_root)
 			break;
-- 
2.53.0


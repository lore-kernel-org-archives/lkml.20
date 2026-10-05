Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C752F83A2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233240; cv=none; b=AV9j/UZc0e4hEAc6nIjXjGMdKZwwNIzqzDYy/sJ2cKkbRcLUD+V+llkmMiJ8ZeqADZM1/wplAskZYoNtEqrB1IzPTkisiXB/FTKIGZJw+42nfGebdMkkw693epDFhhrpzXZ15+47FWIJo+Sm3MX7K+ZVAoXs68b8F0pCseTFKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233240; c=relaxed/simple;
	bh=K5jMvLI42dau/owM3NydgP/Flb/yMDGzdOYs6ie7rXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INXHACLaujVRpKOLkxWd1cHrzQti537j66aSUifRT8LwXnPUBRhWeP2u3RAMXtQ2S4Ko9C3ftlcK+2vQc7SXe5vMCkt7kFRizXrCSN6sJAHRJRfxVi1Qo4MRzu/5aD4WoMyGCD/dwUhcDSwp+TW/Ja01qkQH5ZR9uzBPfMxtqtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRgSgLhK; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRgSgLhK"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35120d43ecaso3020378eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791233238; x=1791838038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp8a+TVr9LdSg6+JCTnLJK9m2C/LGmllCoA6ydtXU2k=;
        b=BRgSgLhKPnR6ZScD+LmhmxmMBzPZ+x2JHaoBtQwr4VeVia6LVMON1aspMqnlsB7G2+
         F57rx+YMaeiafMpG3zcPQ6qFvSgpAGX07R9jA6pY6Wky41T0ScEPCirobB1BRk/C/GYR
         B2GdiBBP6AT7/l2tzJ1WDzxt1FBMZaUjXA8dAoJuUh0xjbcmlBI9jbbNq8aiDTqGy1Ah
         k7rKRnvN2BgqsdQmluSnM/GIghhYoAs0Wu1DNMwYaqYoizHW3su5uYr749bsAZwqFxPx
         WRWi6zgZv+pVy/gdcqGQOkqtcLGBz6bUFENoC6BnATmFd0gTAlkgaeRi6Ps5xWtDV1u5
         lbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791233238; x=1791838038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp8a+TVr9LdSg6+JCTnLJK9m2C/LGmllCoA6ydtXU2k=;
        b=2vaXKfweSLWIIzHdmIMjGo6psPr+u/0qVxIg1kgmdHFpONCXy6TLjjxP4JLtdE+g5c
         jb3QBmiaenbOptm84myeTuJVkJonrm1VhmDa4fpXrnQ+wAYfJrTPwIqZIdWXyaM+lDZI
         VzVHHGDu+7S5YwazBdHtXvPxnMi5hz4a5FYxL6c/Zt4TDFiG18lmG3QcXruCDTPISi6p
         /Xap+H0XcSq+STPPuaCeP8wCavmFwbRB02Ux7wRNO8SjxiOAaIuqJADtPHrD1P4PoIDT
         FFPg45Zy+39UXk4XclbOV4UY+jHF1RBnEhOnUJvhWSU53qe2KAf2B/5A6ncIbL7+321G
         cgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9aFi8J+dGVlaaQrXg5iLYdmfXZTJxoVKXmNBt9whNU5+UhvYW/misoqpzmcBf7XF4SDCiEz7kKzuKJTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1SpwgHoYBxPOht5ReXXex2ydGhHL/5eOgWbAoFNx/Y9liCg5O
	AvVTkmOAQ9vug2nxm+FSN/CXu2xBp2A0dRMeff16OWo48SFzYjIlic3nUUjMI8U6
X-Gm-Gg: AYBFou1c/Jf87+toJyjRRB4WH3aJDsFTMxr8JMWwkCrhjIKHEqqOJ0oFWvfhiX1/3V5
	BQs7POmqPmtdeS6Vul1cv1UouymiO+pMtOdUsOLPfbh08mEzKZuB2yR3iWcwA60iSeKOrBQSfe/
	FhP9o2ba6pRp2jB8bffVUO32mhVgdgEhWNAEbnPVNeVhJz5oYKF83P88omzzDONJL0i9pUsHGRh
	ekq0MB+mLi1Z17wHn34NCIz/6TURqWZYIOyKM0i+9M81Bqn2eeaNHvztNNtXKm7FLKkgheAdF/m
	FEYu4P/Uni+OEJjW/9ReOR0LAt0uUjFtlYFPCOitcjtlJO9RSXJYg94KxX0CRWUxcArZCIIqxBD
	c+9H6uYWyDctjraOAH7H0GtnutcsShV7bQl8zFe3A9SaX7v7mhEtwYkRxRg0lZowjP/5awImRWc
	/JQrzg/M9WiShvNkCI2ADEOMxljY5si/+ke+xK11MZQ2KQOgB2fxoq4Xv0EwjmqpT4VnvcjBvca
	81LI83fUPhaSTaZGJncqQDiQeAXQV6yrDUZaEYLgJF59TV2ujnzBUfN9Jqhac/rxP3tSgQQpwuO
	CPxqgKLMnaV0j5eECq7afFzIez0Zykf4B5mndno8F0FUqMCx
X-Received: by 2002:a05:7300:8b94:b0:34b:b3e1:c926 with SMTP id 5a478bee46e88-351114d36a4mr17713684eec.28.1791233237941;
        Mon, 05 Oct 2026 13:47:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b16846sm1483724eec.28.2026.10.05.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:47:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: codalist@coda.cs.cmu.edu
Cc: Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu (maintainer:CODA FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] coda: upcall: only set outp in upcalls that read the reply
Date: Mon,  5 Oct 2026 13:47:15 -0700
Message-ID: <20261005204715.259623-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UPARG() macro always assigns outp, but 10 of the upcall functions
never read it. With W=1 this triggers -Wunused-but-set-variable in
venus_setattr(), venus_close(), venus_rename(), venus_rmdir(),
venus_remove(), venus_link(), venus_symlink(), venus_fsync(),
venus_access() and venus_access_intent(), which breaks the build when
CONFIG_WERROR is enabled.

Drop the outp assignment from UPARG(), remove the unused outp variables,
and set outp explicitly in the upcalls that read the reply.

No functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 fs/coda/upcall.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index 3438119b5dcf..1e4cbe40ed20 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -62,7 +62,6 @@ static void *alloc_upcall(int opcode, int size)
 do {\
 	inp = (union inputArgs *)alloc_upcall(op, insize); \
         if (IS_ERR(inp)) { return PTR_ERR(inp); }\
-        outp = (union outputArgs *)(inp); \
         outsize = insize; \
 } while (0)
 
@@ -80,6 +79,7 @@ int venus_rootfid(struct super_block *sb, struct CodaFid *fidp)
 
         insize = SIZE(root);
         UPARG(CODA_ROOT);
+	outp = (union outputArgs *)inp;
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 	if (!error)
@@ -98,6 +98,7 @@ int venus_getattr(struct super_block *sb, struct CodaFid *fid,
 
         insize = SIZE(getattr); 
 	UPARG(CODA_GETATTR);
+	outp = (union outputArgs *)inp;
         inp->coda_getattr.VFid = *fid;
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
@@ -112,7 +113,6 @@ int venus_setattr(struct super_block *sb, struct CodaFid *fid,
 		  struct coda_vattr *vattr)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
 	
 	insize = SIZE(setattr);
@@ -139,6 +139,7 @@ int venus_lookup(struct super_block *sb, struct CodaFid *fid,
 	offset = INSIZE(lookup);
         insize = max_t(unsigned int, offset + length +1, OUTSIZE(lookup));
 	UPARG(CODA_LOOKUP);
+	outp = (union outputArgs *)inp;
 
         inp->coda_lookup.VFid = *fid;
 	inp->coda_lookup.name = offset;
@@ -161,7 +162,6 @@ int venus_close(struct super_block *sb, struct CodaFid *fid, int flags,
 		kuid_t uid)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	
 	insize = SIZE(release);
@@ -186,6 +186,7 @@ int venus_open(struct super_block *sb, struct CodaFid *fid,
        
 	insize = SIZE(open_by_fd);
 	UPARG(CODA_OPEN_BY_FD);
+	outp = (union outputArgs *)inp;
 
 	inp->coda_open_by_fd.VFid = *fid;
 	inp->coda_open_by_fd.flags = flags;
@@ -210,6 +211,7 @@ int venus_mkdir(struct super_block *sb, struct CodaFid *dirfid,
 	offset = INSIZE(mkdir);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(mkdir));
 	UPARG(CODA_MKDIR);
+	outp = (union outputArgs *)inp;
 
         inp->coda_mkdir.VFid = *dirfid;
         inp->coda_mkdir.attr = *attrs;
@@ -235,7 +237,6 @@ int venus_rename(struct super_block *sb, struct CodaFid *old_fid,
 		 const char *new_name)
 {
 	union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error; 
 	int offset, s;
 	
@@ -278,6 +279,7 @@ int venus_create(struct super_block *sb, struct CodaFid *dirfid,
         offset = INSIZE(create);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(create));
 	UPARG(CODA_CREATE);
+	outp = (union outputArgs *)inp;
 
         inp->coda_create.VFid = *dirfid;
         inp->coda_create.attr.va_mode = mode;
@@ -303,7 +305,6 @@ int venus_rmdir(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
@@ -326,7 +327,6 @@ int venus_remove(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int error=0, insize, outsize, offset;
 
         offset = INSIZE(remove);
@@ -356,6 +356,7 @@ int venus_readlink(struct super_block *sb, struct CodaFid *fid,
 	insize = max_t(unsigned int,
 		     INSIZE(readlink), OUTSIZE(readlink)+ *length);
 	UPARG(CODA_READLINK);
+	outp = (union outputArgs *)inp;
 
         inp->coda_readlink.VFid = *fid;
 
@@ -380,7 +381,6 @@ int venus_link(struct super_block *sb, struct CodaFid *fid,
 		  struct CodaFid *dirfid, const char *name, int len )
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
@@ -407,7 +407,6 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 		     const char *symname, int symlen)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset, s;
 
@@ -440,7 +439,6 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 	
 	insize=SIZE(fsync);
@@ -456,7 +454,6 @@ int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 int venus_access(struct super_block *sb, struct CodaFid *fid, int mask)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 
 	insize = SIZE(access);
@@ -482,6 +479,7 @@ int venus_pioctl(struct super_block *sb, struct CodaFid *fid,
 
 	insize = VC_MAXMSGSIZE;
 	UPARG(CODA_IOCTL);
+	outp = (union outputArgs *)inp;
 
         /* build packet for Venus */
         if (data->vi.in_size > VC_MAXDATASIZE) {
@@ -555,6 +553,7 @@ int venus_statfs(struct dentry *dentry, struct kstatfs *sfs)
         
 	insize = SIZE(statfs);
 	UPARG(CODA_STATFS);
+	outp = (union outputArgs *)inp;
 
 	error = coda_upcall(coda_vcp(dentry->d_sb), insize, &outsize, inp);
 	if (!error) {
@@ -574,7 +573,6 @@ int venus_access_intent(struct super_block *sb, struct CodaFid *fid,
 			size_t count, loff_t ppos, int type)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	bool finalizer =
 		type == CODA_ACCESS_TYPE_READ_FINISH ||
-- 
2.56.0


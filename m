Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08129B8E1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792348269; cv=none; b=e+b539SuEmNl+ovIS4mqIIZOmEaeGxCGYxW/2swQNNRBHSQldSJteh01JTJuxPwkM+I+zS0zKC+op1SD2jEtWuyJ5k6qYM9F6FOBho0gtTLiOx0T15VU7Qlr56tVl6Bgi1ZXXjrQaUrrtTzoylsiYsA1b23EgyCTCnHmNGvL9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792348269; c=relaxed/simple;
	bh=Uj9+qHky+dE9izYYbvuHNTGILko5SLhWfIyvo0wld78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FntI94yA08E4gwEZZc9+2lWICFrbP61Fi0+4Ehm35oG+0WnafdFbbYAxzboV6ywjTinSKqU5n7O9XXNAo5e4Ix7atnpfCzY4VDiD+KB7tykioRidk++D9oRDqHUVL28l5L3xJALeLgdZ+9cw7gQVvtHQfu6gdz88CjoApdIXUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK6NlHMC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK6NlHMC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so665518f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792348264; x=1792953064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcMP7Q1KNhaLlQR+4iLuiM4GDLeg5VcH7SeMyQePIo4=;
        b=hK6NlHMCIvy0uiRkex2m9R2EM/pYtRlUsao1LT4f6Mt1hiIWKgNv0+IrD5w5OWSxNQ
         ZK08ECJkQfquh7BofnzXmGNH6ciSQraaf+ZWEw1Trii4vNeKxssKVUYPTgp8s82QtgvX
         XVGB3RWthRvk2vyVeeZWWqCZFYvgpoj+I2aP0fGbU4GhKWW52DUoLMPnA/X73r6G5oay
         MxuUxEC05WgWIINUZGx/NsdlS9c6JaNgWcSTQq3UdMiiLK689e1BhAnGRWMiSnPJ749T
         7REIk44RYfP1ZQMziG1WHFt8Zpc+ANN3grUj2jO+Y33vxr0sjF+SLRc6zwSITmFbOngP
         Yw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792348264; x=1792953064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcMP7Q1KNhaLlQR+4iLuiM4GDLeg5VcH7SeMyQePIo4=;
        b=FPCj834A6zlo5hNeRid1dQhUJb3oBdKbn+83QvcJkAyVUMZvL+POdwUYZDVru/BZna
         VWILRqVIOnRTzReeSstAaqxhaQZK48/t7OBLi0BXnjyAEyptC3sTzGciSASvZv7uu82K
         b9zNvAp+ORpT4+CMJWMbSezq9sWhAem0eCLWAEpqIukEJnSx/14n9mbBkscG8J8kLw1s
         QZ32duHJf0BEW4eSRvSup4c1ohm/+1S9Vb77rwyO/j+gJtmZZNMyew98u/cLxDTgy64G
         T+JtqZtY0yXk58AE+0HLSJWA5A84A9GAR550REmM9kn49Ahf1iKKXiSZDiHkLs3iogpZ
         jNLw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Ks/OMjjT3mvtL4dQKV/nGAkSqK5F2vPX8zvkiypBpPLod8bGJAHjKiERscy1uPC4OtTSHymGfgeGllE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG+hxjxIWrFgXI/iuq0VqpmYftZevAxsr9r1AV3wrGbLh5gtMY
	fdFQVq+b+2gvdhQut9wWwxYXw7ecZL17byB1bymatrSDaBaPVt16Cc5N
X-Gm-Gg: AYBFou3OjBw+vq2u1KkI/+jWmtvOXD6XUcPkEh7vbf3u0Zxod1fpgCmPhdN3syvkU8o
	xSOTuRrzWzqHYHNW48qMoJmLb1PDdnxB4gCJ5edxyrH2hbS2hYkAaBrbSKopRy1TQ/uNjp+yhUz
	VD8CBJY0qw60I55Cyb6MkZKCd2/ht5VlRN/AP7suFN80JtU5u1IL5XLDln6pDDBTpwORYFmVABj
	3+C4JveMAA+0lMTdhlG2QNGkVKXQv5op7Q5gdE8hgJu6qepsDNqN5VV3eeJMNqwdV0jvRUiUvIV
	SvCKdGQ4XCGNRu8uasYUygb6XwGDYI3uPbr1VbvNswpeL0D8BX0P9WNBj9bnpOrkMxFBODAJ3vX
	jjLXWg2hSlZxbp/gJM4AR4goCEyzwd1K56j3DXmq4i+K8JbyY1TYwk5GK/DaymlXfwR+ngsuAua
	F8Pj2hRL3MKwqzu1BXRPhOl6PJT1uYE8QGqbfyc8XSXrVtUCl8BTdTbon1IZmFVk1f1ODrAaQFK
	8My7QmO+kHbNa08UKci/Ik=
X-Received: by 2002:a05:600d:4447:20b0:4a1:d483:559b with SMTP id 5b1f17b1804b1-4a1d7612bbdmr82057095e9.24.1792348264208;
        Sun, 18 Oct 2026 11:31:04 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:9bfa:b312:9d38:19b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm144701735e9.4.2026.10.18.11.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 11:31:03 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] NFS: Fix inverted cross-directory rename check
Date: Sun, 18 Oct 2026 21:30:42 +0300
Message-ID: <20261018183042.2221243-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfs_rename_is_unsafe_cross_dir() returns false for cross-directory
renames, causing nfs_rename() to skip nfs_sync_inode() even when
filehandles may expire on rename. Same-directory renames may instead
trigger unnecessary synchronization.

Current condition directly contradicts the function name/comments.

Return false for same-directory renames so cross-directory renames
reach the existing filehandle-volatility check. Keep the conservative
fallback unchanged..

Fixes: dcd21b609d4ab ("NFS: Avoid flushing data while holding directory locks in nfs_rename()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 fs/nfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 49394123bd09..aff6b9d45523 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2740,7 +2740,7 @@ static bool nfs_rename_is_unsafe_cross_dir(struct dentry *old_dentry,
 {
 	struct nfs_server *server = NFS_SB(old_dentry->d_sb);
 
-	if (old_dentry->d_parent != new_dentry->d_parent)
+	if (old_dentry->d_parent == new_dentry->d_parent)
 		return false;
 	if (server->fh_expire_type & NFS_FH_RENAME_UNSAFE)
 		return !(server->fh_expire_type & NFS_FH_NOEXPIRE_WITH_OPEN);

base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
-- 
2.43.0


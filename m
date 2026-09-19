Received: from mail-pz2-f24.google.com (mail-pz2-f24.google.com [74.125.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FD521254B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824578; cv=none; b=hCPsReIAwU+qgCmiBVU/cul3QYhZpoeJ89ZPmgGCU5CDZgq9vb/j+xw0R6xfQ27tKX8inGEiBhR2i9C7ZHWnjfiZRjbXwd4wRn0uhND0BBzqFNa9SWnHygHsT/He3BXVZg0W1dub7XGNVb2xNFsBmLyT7jvcnJk7J34020LykJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824578; c=relaxed/simple;
	bh=XtiDZEkhpgxr/7/s6xHqE6JEe1Ck5RysQMC98z8366U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srl/xkzDtEKD21zmQ1DrJVczDhKAI3WcOFXV8mCc8pAUb28X0jX59+3hE8Pb9ryUJo3yp+xSGojdy5ZGdia17Z4luaZwmd56/o2m6eMt0ea5aAN08zztdHTpJVURmR7tPJe9m+K0StyAzA29rHz689ztbrpoIFpWxj8tTSwQVYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDyeId6J; arc=none smtp.client-ip=74.125.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDyeId6J"
Received: by mail-pz2-f24.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so462993a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789824576; x=1790429376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDAB5rM7cgneI3xUOQ28RGJkgneXH4Fm0vRYATKjiUo=;
        b=dDyeId6JOC4sfT/C002KamOoybjSvump6BBk2cxSWJjwPL7mFm9mp8VveSK4smY/UR
         t1/eVF4WTIxYt3RG8MnmQH2esdNRnHxS2pFfNiS5a+CSg8Q/nwX6IiAS6apqSu4ieBuW
         D9UmEnSNuh+Q0nfzXB3ueiygHVs7JWOERMhQbmbCEzSjigrlXSBp/UyLkLCNDqqL5BtX
         6CcwvcPI9f4yaQ5JD3Ue6/1ajomEHp8w+XBStX4HPM51Urxp1yjU1dMBdeKtNDlgZ8L6
         70vRBn9r1FCnJGhNztd1b703NShbnpmhh2OoiCHx22v+DlcD0LSp1znc996FGN+DPIla
         qo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824576; x=1790429376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDAB5rM7cgneI3xUOQ28RGJkgneXH4Fm0vRYATKjiUo=;
        b=C94YDl69pNedND9EiY4g3aD96lpiy1l51AHFk796sZiDjToodJ+MNVefxoKIDUaAKG
         FMutTeZRc+BsuhNBhutn0Tv4lm/onzQFf58YNFUIyiPnTLyLcIoSaa618W8ffyukYSWP
         /l0U2DU4kHSwx0weHkWYBnZ/+NMYa6OFU6uwp6AubqCk5WW7aiCyp87ygUFUUxCJMHvX
         tw5hboUXgFX+lXKBrR1LXnna4aFQvlHUotD/Rje5ts9UDZzDyPQCI88cPnlHtwriD/tp
         IB+BMnWNmzchrRT27h275KBfGlbs8FSu0iC+k7wUI6Kh3ijyoE2/cJrJZomv3IRNdQJJ
         JcOg==
X-Forwarded-Encrypted: i=1; AKwUvBxj4oabhExjJsVNYwQ4CZDiwvd/5oUHy/xzdezpzaukG/tzA+bhM+1CUyZa7Mw3p3m5cW1RJeX3vzDyUQo=@vger.kernel.org
X-Gm-Message-State: AFuF++nlaKeUTw6vCZ1caV4MdhOTMfE53jrA5XpBAoAFo9ki002/wCO6
	+1zVZXrqT47w7pGtWv+Mm+VCQDLoJ9vNgk2imy53MPPZnUJ+Uw6Vk1BO
X-Gm-Gg: AYBFou2+mrBBajNDlL9RgjSjSJlBvidkjZHCk8mrQ5ceBXKntKb9YRUQYclC73/L7fc
	s6b9Aq/brpyR6J85JVY639xiA+8zug2TuX13q9Qc6Svv2X8UyrAqQEu7bzm6yDrciR6SEnb/XZw
	4CCIILnuaNall91xiEekiZVrOqs+XWIaLNWOKgJBYdjv4BHksK36qE7tqiUoGA1kFXFIPHdaPlE
	5qVkGz7+UYEn5dd1q8JdXBTvXc8D6kFmOfslGm/NqTp+xU2sFCCxa7V4jK/aCflvqG02wtkI/4q
	8d/R3ha6clHv9w1/w0la/Czg6lVqRyjiKBnC6EOD+V+g96KLjsi3L4+1xoTPCVNViEtyajX4gm3
	GdGwvK8TN8bT9LkXBpdfeoJgbJGWKvcT94wpLeGCqfrJUHnYP3NUVCLJwSx+Ggflrzo94GaEGsk
	Z9tSj59d5F1YZO4YkMSvWmT0Vq9FBUNKx7Cro7gy7aeMenbAiI+AcjM+FHI8Au0aLECMZ7hWbCZ
	zLoUyPiDKCSAmMMXrZGVireiq8=
X-Received: by 2002:a05:6a21:9086:b0:3dd:a196:ffd1 with SMTP id adf61e73a8af0-3dda1970073mr2909245637.33.1789824576434;
        Sat, 19 Sep 2026 06:29:36 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae71fe3sm988866a12.8.2026.09.19.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:29:35 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Christian Schoenebeck <linux_oss@crudebyte.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com
Subject: [PATCH v2] 9p: bound the xattr size used to allocate the ACL buffer
Date: Sat, 19 Sep 2026 20:29:29 +0700
Message-ID: <20260919132929.238025-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8777483.NyiUUSuA9g@weasel>
References: <8777483.NyiUUSuA9g@weasel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9fs_fid_get_acl() sizes its kzalloc() buffer from the xattr length
reported by the 9p server. A server, or a syzbot-style fake one, can
report an arbitrarily large value. When it exceeds what the page
allocator can serve, mounting with posixacl,access=client trips:

  WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof
   ___kmalloc_large_node
   v9fs_fid_get_acl
   v9fs_get_acl
   v9fs_inode_from_fid_dotl
   v9fs_get_tree

The allocation cannot succeed anyway and the failure is already mapped
to -EIO by __v9fs_get_acl(), so reject sizes above KMALLOC_MAX_SIZE
up front instead of tripping the allocator's warning. Larger ACLs that
kmalloc can still serve are unaffected.

Reported-by: syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de6fd6789748a8aa64a0
Fixes: 85ff872d3f4a ("fs/9p: Implement POSIX ACL permission checking function")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Hi Christian,

Thanks, agreed: XATTR_SIZE_MAX would wrongly limit servers with larger
9p xattrs. v2 caps at KMALLOC_MAX_SIZE, which is already the effective
limit, so nothing that worked before changes; it only avoids the
allocator warning for sizes that could never be served.

v2:
 - Bound by KMALLOC_MAX_SIZE instead of XATTR_SIZE_MAX so that ACLs from
   servers with larger 9p xattrs keep working (Christian).
 - Reworded the commit message accordingly.

v1: https://lore.kernel.org/all/20260919102958.142460-1-ngocthang2710.1999@gmail.com/

 fs/9p/acl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index 0dd7e72bbdd3..915877cbaded 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -29,8 +29,8 @@ static struct posix_acl *v9fs_fid_get_acl(struct p9_fid *fid, const char *name)
 		return ERR_PTR(size);
 	if (size == 0)
 		return ERR_PTR(-ENODATA);
-	/* the size is server-controlled; a valid ACL fits in an xattr */
-	if (size > XATTR_SIZE_MAX)
+	/* the size is server-controlled; it cannot exceed what kmalloc serves */
+	if (size > KMALLOC_MAX_SIZE)
 		return ERR_PTR(-E2BIG);
 
 	value = kzalloc(size, GFP_NOFS);
-- 
2.43.0


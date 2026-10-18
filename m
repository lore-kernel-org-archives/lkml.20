Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366ED498E24
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327130; cv=none; b=C/HEMMQeBhX5jbv5ODifB+Aal0y9f4QqlVdlw4AELmHh3GAss8qKNRAw/ym3YC9CsytTbcD6qQFkrHx1YNs17pOo/Rbis8Rp5npb7y29vZL2bI7ORRHpaS/5PHppVenXSY0LeLXhrt9Z0GHNTB1na/3PNS0RWix4fD+rq8BuXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327130; c=relaxed/simple;
	bh=JV0s2Xv4Dlty4I6/E87zQbK2+zYAn6I2yr8xmOV1kT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcoXPERBIgvnMpN2U8IZv8hTitBnU6Wwz/NJSc/CbOrsRI3hMfbHBdzuTduSdUP2ypaVTYydOolgM30xwYZwpcujHa2T8hj3tm0GccwF/9rtiFkBl8n6U6xZi28VgvHpIjFVJLPx/pCPy63AidRx6+586j7jHgyeD1sSNCXBbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg0Lwl40; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg0Lwl40"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1020557f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327125; x=1792931925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNqS6+7gVpfXiKwApglNgee+T7VedzIxHvUWv5uW3EY=;
        b=Qg0Lwl40L2DG31N+fbMu0cVdcEWCbFDcY1OArLjRaY4r3IXVPQhJTLSdw6shKK+26a
         HCHCYXLcXHPu7wkouNM0NkYNtFYDaXxL/OWvxRiraT14Ddz60ViX/ZKU5YRY0Y9Wo2uJ
         /vMrrcWTG7kBgMCduFUKkOvy3WB6BF3yZO8hZZ+307I6QY/Nzlh8nFzUpDahI1iVVwU0
         dWjKO2cfxgJmzL3o0prty7sOfcwMWlYNR3QQ9q0olxP3QqYEbqkS5BkaMZ+GLEwdCfvs
         UY3f0rheDeTdDseLdRLQSsM/C7NceLLv+/T+cf3AdgtchayPxamnfJOfi64iqLh2OPYC
         opeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327125; x=1792931925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNqS6+7gVpfXiKwApglNgee+T7VedzIxHvUWv5uW3EY=;
        b=cLAK1jWeffyH6GMWzGZ+8RYNtJN80sIyLhPlNiFSeGv/y7gFHLJ09gxWQFBcdmRAv7
         i8XaTlL6MSYMVNkrYsbGF86x9atHBhSsKMPV0qBAIUcyp+ipvRyzSiHx8A2MqHFgfELi
         yQSn5M1CX7r2MlJSO/pyqNu4EmyyRmBEqGO0hxxK6O2lFcPfThum++BGIAkyUfORUpvR
         8sQtH2k6fEKKNsMEE7GFtNG4cgAIjHtXw5BOjGqdejbMx9t9CnKoHjkxgDJKuRUcGXXE
         m3lQP4Ns4rafqTrZTcEr5TQiL89DhB9Y7opPfaIWd1lqwmHXY8K3hl6uXWILFoLHkKVQ
         S5CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbd3JBTwcF4SD1DvxDc0Sv5uD4nH5LGax96IZfDCQU+502ugAX2H42xWUBkZi6t5dHx4OkVHD2tvlcW+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP7/mdchl90zFH2U4bDCi4sPaDPAhN25WCUjpFpJ16Xq5qXlWD
	Zk095dZJbAsGe2HQGEGzvTvPqKq4eAFsQwSx8qRHIjNOK7ExlqIs0GvN
X-Gm-Gg: AYBFou0e/YvYPkNUcl2GCw2mEOLZ5NifbyaWPO3HCYjS0uzd/NhJ8ipua2+5ce/dghh
	gzH/lGL1MIqQAWroT0v0JdgoLPZlZajbhWfHkrHITQL8fyZTeAFnLDZ3FqgMwKMzmejy6HbJ1Gp
	zgm0lh6Xt+rQX1adz/vRuWs1nhCpMGlzdxS/XbPXRc3Cv6n00JZWtc39zKJWEs3pE5aTxlSYV+Y
	SvBEA+gLDx5sTVlbpvTCpQ0l1EXfwvYPw61RcwHOW+QnJXNFJyzz7C/PQazMiYz8HJK4QjbmXaq
	ZataMi0G8BKmW6H5/M8ji2KCtADReADsdERGGNtA0kzaQ09JaBEYy6s9lFqwNgMdDUwO3JZ3Eg/
	R/sHq5vvpCAiPJKmzVe57DeuGPSBHyC3OVWHdl6bycxv6aTEHhqECV1hBjOoyddnZxZH6gGWK2J
	dqtf+p96W97R5Zp71h7R2E7/wVRvy/vyjKvqxwGntVLLlKhpXj0kxjXePAgyDgqDw+dTlU9qDKe
	ix6gB2dbseKJnpWhj7C+DxfmEIRE11wZA==
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr99341255e9.16.1792327124837;
        Sun, 18 Oct 2026 05:38:44 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:d430:1e43:f3d6:7b9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm14367798f8f.7.2026.10.18.05.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:38:44 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] NFS: honor UTIME_NOW atime with explicit mtime
Date: Sun, 18 Oct 2026 15:38:41 +0300
Message-ID: <20261018123841.1855641-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When utimensat() requests UTIME_NOW for atime and an explicit mtime,
the VFS sets ATTR_ATIME but not ATTR_ATIME_SET (as it should). The
delegated explicit-mtime path calls nfs_set_timestamps_to_ts(), which
skips atime, but nfs_setattr() then clears ATTR_ATIME, allowing the
syscall to succeed without updating atime.

The delegated explicit-mtime path already updates ctime locally.
The VFS also supplies the requested atime value in ia_atime,
even when ATTR_ATIME_SET is absent.

Check ATTR_ATIME instead of ATTR_ATIME_SET to also apply the
UTIME_NOW atime value supplied by the VFS.

Fixes: aba41e90aade ("NFSv4.2: fix setattr caching of TIME_[MODIFY|ACCESS]_SET when timestamps are delegated")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Reproduced on 7.0.0-38-generic with an NFSv4.2 wa delegation:
utimensat() returned success but left atime unchanged.

Tested the fix on 7.3.0-rc7+ also with a wa delegation. 
The same operation updated both atime and mtime correctly. 
A kprobe confirmed nfs_setattr() received flags including:
ATTR_ATIME, ATTR_MTIME, ATTR_CTIME, ATTR_MTIME_SET and 
ATTR_TIMES_SET; (0x10170) and returned 0.

 fs/nfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 3022454f7698..4fa6c5547ab8 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -644,7 +644,7 @@ static void nfs_set_timestamps_to_ts(struct inode *inode, struct iattr *attr)
 		inode_maybe_inc_iversion(inode, updated);
 		cache_flags |= NFS_INO_INVALID_CTIME | NFS_INO_INVALID_MTIME;
 	}
-	if (attr->ia_valid & ATTR_ATIME_SET) {
+	if (attr->ia_valid & ATTR_ATIME) {
 		inode_set_atime_to_ts(inode, attr->ia_atime);
 		cache_flags |= NFS_INO_INVALID_ATIME;
 	}

base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
-- 
2.43.0


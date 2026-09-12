Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1B1FBEA6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230870; cv=none; b=W40Pp0nqY2jEbxBhCDPm7jdywrtYYUnunmCUYBaPMTWXZ0MFo819kCdsUfliJOBdMr9+RU66/JAPeXbO9Bde110OrgzRY0VWErJkL829y+5TiqsS8FG2KkEBKKbXi0b+dY11zaSEr5d2hNQMLh8CMlgUbV4WIYPUOsezHlKMl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230870; c=relaxed/simple;
	bh=YsbcAYVvZJshCf3WEFWcy4OFijXlktq43yD9dSYgyps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrMvOf2IFlCWrjXVw2NLpcCYpk53aNr6STHkv9yfX+BOBfSajAcngV4pPuc4fMn/ZoIcYv7hJ7Rm7rJ2PDiSLiHBTV2sTNdT1qVAWM6wa32gGE7c4owLso/tSgBxiVL+0syykkJRaV7N/s58ur/nM6jbI1GIhOU3TVozxXIcUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTQLAB7o; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTQLAB7o"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so804605ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230868; x=1789835668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ym6jdYyN/QStdoFTmPNmN04dPe8+evYK1TqM1mOTnzc=;
        b=kTQLAB7ok/xjgQCXaNSmxAN6L1WD9srwFKiVxw6kswHZrFyu7/IQEJJclP4qq+Ff4b
         NPNQIZxfcRWIZPCdpkz81T2/gZv8Zzxkjv6NGe30+mUQkc+yYyne9eyZ6H5tBUF1hTRL
         OqN7DNls6QSbECkgm2jFX4Wct8awM8STchTcpeh7wf9OrG4JbQl9IYpG4wgK0dybtS64
         E85tjcwn0xOQtvR2Ej4rSS+tu4l/mwalHxWrYeHt1J/Tag8VZcp0w3N9+PnfcLqbG+sw
         FG4mJsEQz+JPp9svFeB8aoFP8evyvH6S6G9vfzoUNV4R8O5K/2maYe3mgauhWUPj/Kws
         1XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230868; x=1789835668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ym6jdYyN/QStdoFTmPNmN04dPe8+evYK1TqM1mOTnzc=;
        b=GpFkWxSN7ePgjAanmVBfJzbNfzrd0RX8WssOyMYGLYIhJjh8qzA4WdB98MAziX/lCA
         XNiWBAaef8ME3/qnsOnYLxFOMxeF4ud/s16JAUnSsznfQ0rt/GiaNIi5T45Ud6MprJy5
         /5vZ27qoQo0GDNcsdYZqKHKcgRMfmkYeOT7Y3Is33ZlaS4pHWTgs3++ZHWiw/PqXkKMP
         paiUtl+c//cnVBGUhBMF5YMcalOO6e/1uA87DPFvWOjpc9bli3sximI+qa37tBf5oH1A
         y5cXAs2c+6NR+l3Jjjdm3C4O2KX8m0RWkfLM8cwxq07pUXFfoF93fQDUPLFybM22hFNn
         fmHw==
X-Forwarded-Encrypted: i=1; AKwUvBzd7A7I2vR3qA4QiKYyeMRZ+Tdcpgb1MEh6l3yj1R8ngliV8ZDNDo97JzM6jDGIoJt77M7ecA49vNoDPrU=@vger.kernel.org
X-Gm-Message-State: AFuF++nmwU5Vcb/z5MkOHiWKRcW60bvGkXG+1fWZ3ncRiE9mVkL+l60/
	2qHba84lLsnDjK+ZOU0zeZ4LzDJ79LJIQ37TdpHlrjoFrYGgWPSxDGVI
X-Gm-Gg: AYBFou3E0YTx/G2SQ0SUtfpEfPWbhsx1IJXkDbbAqTY3KyJ/a5hZ8AY/R31X1+k1fHg
	jwcb9ZNSlTlrCSPiDIA8B4EdUN+q3xQ//POIdEeVqNVKWK3rhIDSTbW7l+wI83IYAR7A35J29ub
	6VRfjwTJrM3ySYeTSU+xBmeFvYaJ6/yNjVtnzqJLuFokwDbB4Or6OEmohBTlBFRUM5GfxPR2ai2
	HfPdAzwHy9kubqKoOHtnUCsnHCwjM39pblwGOnk7rOEBcY+YvMKoMSlCfJzb4aSK9o75aWiXJ3T
	bB0AhB/YoJyYAsvn0widvoBN0Nuyx85eHhDYvkg/XU0OzsnNsXjCarjAMT53bs7gklgV4W2Queu
	uiF3NsUny5sqJlTJmtA2dbhvS5prb00HkqPynai/GRaguJrMHUgVeiYmqYCaBS0XYfi19UWYFut
	hB9j/56axKeA7bRB3suKR3mx/+CZ7nSIQYcX3akifIeGfsmQNZEEY7mcye10Oqbbmf6ysHEVkDj
	vYEia/krn8AGmo+vBI=
X-Received: by 2002:a17:902:e80c:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2dd4bda1a6dmr60528625ad.16.1789230868332;
        Sat, 12 Sep 2026 09:34:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:dfd9:c41e:7c9b:c69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc300bsm24585045ad.47.2026.09.12.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:34:28 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+dcea2548c903300a400e@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] jfs: return -ENOSPC instead of BUG() on corrupted dmap tree in dbFindLeaf
Date: Sat, 12 Sep 2026 23:34:22 +0700
Message-ID: <20260912163422.80989-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dbFindLeaf() trusts the on-disk dmtree summary values: the root level
says free space exists, then it searches each level's 4 children for
one that actually provides it. A corrupted (e.g. crafted/fuzzed) JFS
image can have a parent claim space that none of its children provide,
which is neither validated on mount nor recoverable here -- it used to
hit assert(n < 4), i.e. BUG(), crashing the kernel. Treat it the same
way as the two existing sanity checks in this function and return
-ENOSPC instead.

Reported-by: syzbot+dcea2548c903300a400e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/jfs/jfs_dmap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a841cf21da7d..079765450bb2 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -3065,9 +3065,12 @@ static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl)
 		}
 
 		/* better have found something since the higher
-		 * levels of the tree said it was here.
+		 * levels of the tree said it was here. A corrupted tree
+		 * can claim free space at a level that no child actually
+		 * provides.
 		 */
-		assert(n < 4);
+		if (n == 4)
+			return -ENOSPC;
 	}
 	if (le32_to_cpu(tp->dmt_leafidx) >= max_idx)
 		return -ENOSPC;
-- 
2.43.0


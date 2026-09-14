Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC24BEE4C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379090; cv=none; b=IeDDvIQYLOYtSZ7QYypswV+o5FgVAIJwyVZT1qWMuwo7xLSM8UTdXKvxqVlNc6rvtpsD9dSLMr8v3/R06OyvymjAKsntlpVz3pMp9H9dZTVRKXANqPiUffbhUkckmHvnT5wZkztEZkany0lj3KGMAyFp+5ePThwpA6uEog2h0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379090; c=relaxed/simple;
	bh=bJMpjnC8818Qn90JG4OyI5Z5w5FClyzIr/EvppeqS2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGKJjNCKgWZvIZu/WSOlWKxpMtJTOtUIhaPNJM0S1OxIKFb9RL5ZhyWA3G2kP9lPYJmvVqchyKDXWu4jIwGVveOFoQm1jwOskSvngm5niRjuZKK39XTiIjuNF+fDKkNRp+HmxPtJ9Bnjb3/iUlOPfo0FNxCaMHjD6T1bEKryM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kani3b4J; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kani3b4J"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc149372c14so1913863a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379088; x=1789983888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkRU9xRYmAFB55vHbz0XfJewi+FHJzT2FTL1zw86HDo=;
        b=Kani3b4Ja4qi4I9AmZNPeZod4nv4KGX9Xl5UdOUZaK0v891bD2EtPbbkHzFEojL8by
         8vNtyi8ssPL4a0acYJw/qadSmQjU69SrVhPDTlKD3Vgq1BYTvvA2xgL+MoXuwlNCPy5N
         R7yYxD0CbDW8lGx2Rmu9VaQG8Cc2Ldz3AYKC9vT5Vp6jdWoEah8ArblPdxzOitPiy5GO
         Oqf5oUNc5pzitt8MgfxLQXRxyQG399o7Jk56Vlbjgsm5xRmxhl+KiVZ7mo+Ug1p+xMfS
         vQhigEE71AI9d6vUzCu+mFUZ88QJ7SuSdsHPV6WpBxyD+VCVM8UMU+ssl580n3wusJ+4
         0jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379088; x=1789983888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkRU9xRYmAFB55vHbz0XfJewi+FHJzT2FTL1zw86HDo=;
        b=XTOSuabdLIwjDQXHIwSus3BFAs5OLJ7DI8TogFLSq/Y53x8tdb980qmDER5jc9FRHu
         1yoyBzMoBrHdARrhgn8Z+z1cQGPlhjpJTbJ/xqy60ELW+7LCAV31sdek1Sp9o6485oDT
         HNoJnuJl3jHPlr2rQ6MEUZaM5t9JAh+7Y/uVmdpg+1QxkN584D8JnSTTeHcH9WIbOSB+
         irm+foA4TXCJ5RnP2PFMnYCQr7IpScAa4cAlx/oWT8yNK3R3xIlrvZnDmWyzthxw8SBx
         iTvwG0F0XO9Y3qGgihHH0qic6SSDGVeURsOpb0Xh0yEScWq2OYLfYDiF1FOkjOfzIaqc
         egaw==
X-Forwarded-Encrypted: i=1; AKwUvBxSMuw+ynvRalb1hg+ohCaPHB7KVRtIZwuYcaOvl9U8Gib0ZgFui7RTHZw4sDPsGB4fNaQOxiV8rvnIEAo=@vger.kernel.org
X-Gm-Message-State: AFuF++kkC81pRdUj3nlYcybMGzodRpuQi+n8XrgSxGhxO0owwYB9hz78
	E5bEp8kxNbQMibrw7vA0LFTxypJ20P52gdiSFSQS/l99LKSIwB+2r5hlrzOPpg==
X-Gm-Gg: AYBFou0tE/v7JK9KN04vhblRCKuCZIZuwulmI1UE/tv4XCstxGFycmRN2lTLv2CkrmF
	A+lMNvh2/3Cf19WeJWITS1dMDM9YTU5BAocOmZ4gy4rgzye32YTLJWdEjt8KD8qOi2mPsqNFssA
	95bQuK1RUdhGZSH++JBF2UlQjGB0FwAm7r9TtmLdSSEQR3O0BkthMLPy1XpFwMlbjxvfIeVy78s
	behyj9BpOVQ45vCo7GZgoH9eS5mWPRiqBSquPl3/9CeUVwEjwjbVc2VI/QuQdMu1r+OBihXo1T7
	YfeEQQ/fyOWYCN4BqnQD4JcajDa1J68Y6MrlVMggx/Xkmy6ShscPr/XmrpQ23xDSs0j/m/si3bj
	Db4orhurfLJsX9XW3uua80JEJlTMv+zSbvyJkQzqzpSmmDtYRbRL2vZtz++w4ExH3zh4Ub4D5tk
	id7Wi90GsKXABHRH7TCoPZ6CDQ8YBw9arjqoAcGaOfHCG1e03s4eqSqCIc9+ERQve5ia/7ZZkJI
	gL8290=
X-Received: by 2002:a05:6a21:1b8a:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3db4039c820mr4065867637.6.1789379088059;
        Mon, 14 Sep 2026 02:44:48 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:dfba:aa04:857a:222b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6550bbasm4554443a12.17.2026.09.14.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:44:47 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: Breno Leitao <leitao@debian.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] configfs: fix NULL dereference in configfs_depend_item_unlocked()
Date: Mon, 14 Sep 2026 15:14:26 +0530
Message-ID: <20260914094426.25595-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

configfs_depend_item_unlocked() can dereference a NULL parent when
the configfs item is still being created.

The item can be found before it is linked to its parent group,
so ci_group can still be NULL. Check ci_group before using it
and return -ENOENT if it is NULL.

Reported-by: syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a9efa71b884a23e74153
Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
Cc: stable@vger.kernel.org
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 fs/configfs/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index eda80c2a2d38..301a64f41887 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -1244,6 +1244,9 @@ int configfs_depend_item_unlocked(struct configfs_subsystem *caller_subsys,
 		return -EINVAL;
 
 	parent = target->ci_group;
+	if (!parent)
+		return -ENOENT;
+
 	/*
 	 * This may happen when someone is trying to depend root
 	 * directory of some subsystem
-- 
2.43.0


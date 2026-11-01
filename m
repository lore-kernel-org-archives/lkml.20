Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793537938;
	b=XcmRUlswD18n2JlZMJbjH7qY/ZQSMWIB42rJa1gS3jH+xkYXcUlsW1gaU0fnse799f4B
	 ZfLuH0C5aYGFVCAEqOh4TliUCaPJyqkf162WxH5mppnT/GJdagk6uFbNvP5lGIKeFWwBw
	 fU3XUl83UN8u07i7C5JgsMD5KzaF8PwlQU4boUr48bIGuK04SObwZwIrntPPm31YzOQ4/
	 OD0eJ88yMQe7qoLMLZMFMZPWVMdCmacImsgtX3kMQPcv4BTrMGGoPIAC7wWXHr359Chvn
	 MVFphXShW3iJuhvKNOrzw7RJUkncYRooXli5EiFehwZAT1T2j8222ci2hj0cphd4KKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793537938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f1wYtROk1JVShHemw1ffijHkVNneua03omMSYk9W4/I=;
	b=fgM6QFqEZ6R8aIfYBtXmTwlQgk7uAGx8j2pB0moKPDZJjx0Dp+nVz4057dWlKH02ddm3
	 y0g3N+d2eXH1gJ++ySJFUz4Pdiujw9WEwoWL3+9TKVx82c8i39+LbtalEPXQsia1acoFe
	 du5kCwOzsw9qBAMV3eF4R67WAKQXrLn/lCfEXbpA4+8tUPry1g8Bl0s3ty0rSPGf63wP6
	 gL1bgkEqX7lGI2N58VJ9zhl35X9P2HtfNbR4tRp+HlJ4wURgk5K7TIVN16nQM6DDCMuTR
	 8108BBBb088bqGWdM8oZ0y846shWjk67IH+v9WwwWNQ1CpogX1P+cCvW3PobSTHRdzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4pwIr2c;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2542606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2542606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4pwIr2c
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso818704c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793537937; x=1794142737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1wYtROk1JVShHemw1ffijHkVNneua03omMSYk9W4/I=;
        b=c4pwIr2c/emHOXEN40E5IfXyk15GzTXOji9PPET9yj5joQViGOmQyWLaslV86a+Psh
         hGUdIRE+IFYyukG3ODs21A6x95+aPn7RPYAkOsJxL2jqp5l/Qx3IO4J35R1ebSmkIZnw
         ICmUgPqFQ1fe0uodhPooU4v1VLnaUT5K6ZG7luXyQKLZYYdcoA46amImiVcmWDgAnROe
         5Tan64D4AqK4ovvD7KHGgOatNu/SnRinAvmBZvRH6tGOFyvoYsdvQo6s3kcPXBgF4Pc2
         J3tlT9p24l6NdW4BjheFQ7jHPYxiEWRoydftP5FAkE2bzEyx6mQYgYirVuKxlcGfFrtr
         lbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793537937; x=1794142737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1wYtROk1JVShHemw1ffijHkVNneua03omMSYk9W4/I=;
        b=R5tsH9Mci83JgBNzVk52vNOcKN3mDIvzDtj5Tul2/BSRllTXmmZNLfo9KpQ3Y5kuAv
         VL1jz2mOvo9iP5jOVgVjxBslwGH+1GIxXRec3l+ruDwOevdrsFEiaTSocPfXfvE227WR
         Q7eIN1KdGZxwP7ofug6RH+P4tWII+lZBnwmLxa5Co8Vy9HJyk3ezT5E9qLajwwOlrd/J
         gAxOfJGGQMp9KkQY5MGtV7gIw+Cat/+Jt+VlLG43Ud1zPF72GwPWXX8oXhik+73NlMdS
         l7z/fwJbbS+r77se5jJQJFNeZF4LCaZE9CNghw5KIsvPOqKLuMlyVKMtkOT0LPsJPfYv
         iboQ==
X-Forwarded-Encrypted: i=1; AKwUvBwprX/Dh08aEU1rfFK+YMLh3dmUMbfKx6HGD/oqiclQpvJ9EGw2U2L5o0WS/ZGlW/w8an2W0ezSR4wbzkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaLWVeYgN/c28xBxrhiZOcf2DwGe3as39exWRRyFkuB48GUAi1
	qus1yxm3HVOUheoj25SuqZxXwJH+SKJvLS5bqmdwRIGRhM4uv85go5I/
X-Gm-Gg: AYBFou3Ugj02mjorMICu1Mo+NegF4hsJ0liGYZhjugZEpKXU04jR3M9dXAqpT/W1Y/G
	jDj1ifr1k30XiBAUX0fjvxNnyjC+fFvWBvIaFKtHPE1TE1TyMxoLo0827vPH0JgFDWM02w3tE4C
	HN15pFvstztcn+8M4iFizaAyvzaNqylILFa7N/4ZknbV1bwOQe/yRqcj4U/SWtQBEWFOH65CJja
	YAoTgPQsuJxStf54hoc4uwtUYM8wgNOOW6KCM5qpA3dj1yOi7OBSMm9Cb638f7hofiqDxPHaF+x
	I5A3+kuRwf7eDGmaBRhxtKMhWrGt6XKIxiCw1AsOc4ueWQbzU53a1zsdkJ5DIZq2Wt5FIR1H3HI
	CHVz4b/obiREQPsuHX3H0HaGUEh0Rnz1QZBskgiuY2mklqMVFOefpnYh7VTUsrSchPCA9xxRCGT
	6S0oggAhJFe/xD473APZ9iaCYQNaDnZ1jNbtp93LfZulsg9BAIg2R8qZajPWraPKHL0BqpBHjhI
	GREWc9M07kO9SWxMZkXGe8yGZI5RnNuctfNRiRw6m+FMS8YreVlztqMsUl5AzpRweV1kom+JOYN
	LEBkpNBhkACJIAtrKvhFZxM/ZpuMQ5WgNyJjLkBbugCXFSo7MZn4Hhya
X-Received: by 2002:a05:7022:7e0c:b0:147:a685:9125 with SMTP id a92af1059eb24-1ac574556abmr11534422c88.2.1793537936546;
        Sun, 01 Nov 2026 04:58:56 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm27433334c88.17.2026.11.01.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:58:56 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tytso@mit.edu
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] ext4: report sub-block project quotas in statfs
Date: Sun,  1 Nov 2026 12:58:47 +0000
Message-ID: <20261101125847.54531-1-dennylin0707@gmail.com>
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

ext4_statfs_project() converts the selected space limit from bytes to
filesystem blocks before checking whether it is nonzero. A nonzero quota
smaller than one block therefore skips the project space adjustments.

For example, a valid 1 KiB hard limit on a 4 KiB-block filesystem leaves
statvfs() and df reporting the underlying filesystem's space, even when
unprivileged data allocation fails with EDQUOT.

Test the byte limit before converting it to filesystem blocks. The
resulting zero block limit then clamps the project space statistics to
zero. Keep the existing rounding and the rule that a zero byte limit
means no quota.

Fixes: 689c958cbe6b ("ext4: add project quota support")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9cae52471dee..91c1a54730f6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7001,11 +7001,11 @@ static int ext4_statfs_project(struct super_block *sb,
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
 			     dquot->dq_dqb.dqb_bhardlimit);
-	limit >>= sb->s_blocksize_bits;
 
 	if (limit) {
 		uint64_t	remaining = 0;
 
+		limit >>= sb->s_blocksize_bits;
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		if (limit > curblock)
-- 
2.43.0


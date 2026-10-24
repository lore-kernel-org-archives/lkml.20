Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833746;
	b=iG3HDcXavuwY3cBDWKSUk3C6zc7g7Btm+jlQlEnfPE6nC3xNhal2l5zk26Zlg2jziPtY
	 MpFpQ+yneiG8/uriDTANdzCP/EygDSuJPPhZ6s1aXdM9CdzpewReSi46TUDShMvqRdgbD
	 Q7eTi/SwZ6jeeeUEf6JyAJESzoGFCy7quj9f1cKLUeWxms68Qpd7xphOiX+vCGLlbZU3o
	 4INpzXxe4S3fJmFUzpFnIoR8koGmqmvBUthKJ/spJ1ESr5nep98LA0MKrvCin1nDwlHmZ
	 vff74sSQ4odbceAzAZMMX6Tb+nKH66VHRw05yKAndZho9NIIAjPMgGfuPxoRO1GB8GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=btz/2vSJcEYUBSOnVcWOhmgZ9TgiUEWaYHmTTBOv25c=;
	b=rOw3vaXNEi8ggbG8s9jq6C9bJd/zMP451oV+r2jZwZ6j8+znPMpiwfIut2QZbaeHgnYl
	 fNWgdBS5sOMrhGWUadP4ahzdhLBaE1pvT7wzV17ABc8URS+NlogxGOLudxxw0oikobIDr
	 JyusKANOsZM4o3OevLYme/DqYHhTBGg1LSkjqoRtPpp8WY8BtYjYkhGZGpxd0hs0WSfk9
	 p+KZO9aFt87iiIM2VxiZvC4eYXYDEKWXopSiQqDAJd4S6n/SLPPgcrCGp720wDz6wVreC
	 5kRL2ZeaK3KmiXwAdhJaPYx1DKyY+cdzD/ryS+/qXbOVZGdvLDU7Ax95LVnk0iW4mNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BOO3nsPS;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16C606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C16C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BOO3nsPS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35829219da8so3119467eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833746; x=1793438546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btz/2vSJcEYUBSOnVcWOhmgZ9TgiUEWaYHmTTBOv25c=;
        b=BOO3nsPSjczx7PvIgSJ2PG3b5MYwHU2bR8njZG5+fVgKFPdnsyS2GLs7w31rQH23DL
         AlCwg3rd2knxDh02bjvDZE1jLlRar9rk5zPqyCbsU9B9XRhm8JiuL+m8C09JRDf8LJeS
         5vhfxrWqjLqMcvjnNi9V/kWb8ydacPdWhqv6emEceC4+jGq+T5KAHQJCDESonaN/p6d1
         uyC9Np94KQNvIWTu14eEzpcJDXhA6td5Bzo/0GOnknrgyLIoh6SiKAfNrizo6K7VbhH7
         XvaG0LMWS9DfXsIJD92UGacUH48fIREnZ1ILvfGY+3d5MGVkQNqHZWzqIZznIyl7kNUg
         dAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833746; x=1793438546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btz/2vSJcEYUBSOnVcWOhmgZ9TgiUEWaYHmTTBOv25c=;
        b=WZIxS+dcEM3fj2pJyDJGHGKdh9VjHcSHfy49x3rGcD80+5qPTCW3+QC0GOyCkEFQnw
         cx5v0uiLwcbKoiAzhe4xygYJCG+s4fflJCo69J3kHm+5c/iWUgkb4wNgIkoIZ+Jw0cL0
         cy11xDLyjQDf3DLptFilRz8yGaYCyYeBKBldyDF1d3ZUdBqYQs/V78TacbHGlyj8RcS5
         M4hlOFVZ7n4vlUOkcpU2rwjJGLeA/JM00N7//hywSXQRMRGSdR9XYLKMKiIxIygd2Per
         zmizaV3w2A6YVGW6ouFRTgA4CeKopY1vQuzXuwSkuHigk6mkZUy0gAc8LAHylNy1THHk
         XOAA==
X-Forwarded-Encrypted: i=1; AKwUvByMMvBiZXDB0CELgzdogLjjpHb4ohKGPve962KPja9Cbx7hjLpVT6CcdKsLnYyq755qcHR4MfD7VdS1bJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkczz2gG0pFyFYH65Q7rs50ngdhbQJ7/Yx9zllliS1imqLXj9u
	GsEiTY6GqSsuWwN5Ti8lHIsi10m9itDBOPQRjLXJm24PWGgdLes1dtVy
X-Gm-Gg: AYBFou0RIQa0XxDK3zxkdAHhmSHCkZOnW/eTA0GvD0L2CMvB1RrQbpHoPQsOQ6uDiAe
	HqZsMn+5hXXeamg3vRxOsTyuFg9pQdecayMiEeniFGW3ZLZIptp9vnPzcUYZh8LMhRFMtrpbcbY
	YGvtuteeFYUkBh1AzOmJldFKxYRcEJB/+8utZMi9fMojxS1Xrw/AhyQELp25ZuE6OxOYHi+0zq7
	tgHPLIInsDObL8THt1uHn8yv9d8lHnbcfotPtF79A5dWT5XnnXY4CAdAlTioOTEgcJUEXVpnE00
	NPUA5ONWF8743gDsLt2gf5Fgw6iFtmFNysgY2GTQwkg2nHScq4nfPv1hxOaUGaSP9SoeDWuqNWK
	B7fWhHNrYmfgtageuEdu4XBV3VgO8LQOs6WDYHCPUdeqZGGWuzyX6jItFAPSgOkjgOFdHwHh9vv
	NV9g62/R8lm/NLA0rqRM9HhaFI3DDCJenhH04H1KzlE1mC8lokLruiUrzx5v50ugJZsfvs7XHGs
	awAP2GMeciEHRjfduv7ClsvhkoIOei8CRTwdKQwxVApFzjOEvYx7Cl7+Q/NDxDZg3ISVZ7KYIw9
	uya1KX20LWTHdavtPTdvzRsXNKbb8oPvOuxtTH0Qct/Hx9Bk6l6TCKjYX5ILiZwbpMjv8SG2KaK
	403e2Hs2+lkYZ1MpP+MI1DyVzPg==
X-Received: by 2002:a05:7300:7aa0:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-369e84f9962mr2354642eec.21.1792833745636;
        Sat, 24 Oct 2026 02:22:25 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.26.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm5108584eec.17.2026.10.24.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:22:25 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 4/4] 9p: fix typo in file header comments
Date: Sat, 24 Oct 2026 14:51:54 +0530
Message-ID: <20261024092154.1844-4-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261024092154.1844-1-codeankit.thakur@gmail.com>
References: <20261024092154.1844-1-codeankit.thakur@gmail.com>
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

Fix the spelling mistake contians -> contains in the header comments
of vfs_addr.c, vfs_dentry.c and vfs_file.c.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 fs/9p/vfs_addr.c   | 2 +-
 fs/9p/vfs_dentry.c | 2 +-
 fs/9p/vfs_file.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 170a2b91c..3723c827c 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * This file contians vfs address (mmap) ops for 9P2000.
+ * This file contains vfs address (mmap) ops for 9P2000.
  *
  *  Copyright (C) 2005 by Eric Van Hensbergen <ericvh@gmail.com>
  *  Copyright (C) 2002 by Ron Minnich <rminnich@lanl.gov>
diff --git a/fs/9p/vfs_dentry.c b/fs/9p/vfs_dentry.c
index fa6b7143d..5b05fa7bb 100644
--- a/fs/9p/vfs_dentry.c
+++ b/fs/9p/vfs_dentry.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * This file contians vfs dentry ops for the 9P2000 protocol.
+ * This file contains vfs dentry ops for the 9P2000 protocol.
  *
  *  Copyright (C) 2004 by Eric Van Hensbergen <ericvh@gmail.com>
  *  Copyright (C) 2002 by Ron Minnich <rminnich@lanl.gov>
diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index cddfb4b7c..a983ef866 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * This file contians vfs file ops for 9P2000.
+ * This file contains vfs file ops for 9P2000.
  *
  *  Copyright (C) 2004 by Eric Van Hensbergen <ericvh@gmail.com>
  *  Copyright (C) 2002 by Ron Minnich <rminnich@lanl.gov>
-- 
2.55.0.windows.3


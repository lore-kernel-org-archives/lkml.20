Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201316;
	b=wqcum08DaLXVAKRcWFKI7rCN1YHWOmqoqYZ4mXXOCggcbgn9v8n9CsllSqKyrFtpRMKp
	 aGe25aAS9vE4w8eVtfgBFjzsVp3tvvaNyzNXMa85FnngSxbV7CjWNC0gaCR/EUP8s24pH
	 PB8lt0hU5PS7Rp2k52HbW1M5kWLkbI7Fu27yhvMjrYguAuqaBZTGX/ypq5KUJ+zRNP3b/
	 /IUDQYYvpS7rri3KfZ3mOqfbNjS3eUKqyeAVgfkwv8ApVzXtH2mtgYwgoRr8Uq3R5tkWd
	 2UdwvOrFne3twywRgbtaqCSeQcXXyXb/5xfBPOf7PMpDn+qBHxskHIe8PCns92gihdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3EFnvh6M4nOfo//zmUowr8B+BehGN6D7OuDC+mfDQMA=;
	b=lXXWj7luFfhqU18N0bkmMxzaYwI62OEMdg1u0dlS7+uoBvzxI4S8k+YMPVeKOJzVuSiv
	 RrcTL01zL9vuXq5F2Qx3n4i804PA02E61Q0OVjqPT1IEQf2yLHNSwx0Le8ovn3kIhpaz6
	 kqY5MCxKY/KkSWxI4zdj+X6F505njDP15mx37fH7VD/OAbBzAttHVUqsCuLIx3tKVAHlF
	 ywZBplW/U1Go4+xrxpj564KOaqR+mykGKUcOpgmuV71/BamwwAL1zNlwzmpOUY73g//zL
	 k6/5GtW5IzSqufJZBB5WP/JEjrWoljmj5ta2cx4Frf+fnfFtl7OspXva10gS52eldeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kpm/IOYq";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461060A2611
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E461060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpm/IOYq
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so492633a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201315; x=1793806115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EFnvh6M4nOfo//zmUowr8B+BehGN6D7OuDC+mfDQMA=;
        b=kpm/IOYqo+7GqMVydqZfXf3rnJJTuYH1+qm3m2pLTRv75gikPP66iIbuBbx1Y6PNnv
         C6lyWrdTrj0S+aonvY15svJzwqeK74XMt0QjRRK3VgNAPM2l8osz/bXluVR6FKfr4ngB
         P/RbmkzJTISw6aiu7gNJxgodbWiY/woHTdPvadWGLVBhQOE6SW2Z7O0INuCxJk0HhK+z
         peuearw8wWupxSrOMfsHK5qpj6PI5PlMeqTGNh85b2noNxwAQH1Xg3Ehup8wRVYDEuU9
         rrmwY9cTpusi3QqywHV8Mesgjh7fILq13Zohicc/uuQ336iCEvoF4jYMxiI1kQPrkjr8
         /EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201315; x=1793806115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EFnvh6M4nOfo//zmUowr8B+BehGN6D7OuDC+mfDQMA=;
        b=1103t0Re8PGmzpM2HdHz8zqzo8mbn+E2gvQY+v17Zr5vywNirOGStbRviCDfDTd1rU
         v/gtmcad+1q8mi1xEHkc75X5AEgrYC0j7JIUISzXTM80MmZjxv8eKtvoZkUZMkohm9t7
         DzmWTFpsAg17jx/uaSqoq9o4Js1HcA+fWgkAKiGpuUIdW3TaupbO/R1TMHM/vQSNdu00
         CfnGulXUgfY7bwYbCvunorysi4XyzMLvK087MMIe0CLkcuxy9HaB3dgBpjLUbvR9S0Av
         E855YJv7UPNQ4Yyg090DaA1CcLBOHxrGfuPCF79e6XR9o+gI1P3VeFqLyNYbxhTgYp/H
         sBGg==
X-Forwarded-Encrypted: i=1; AKwUvBzL+vmvo01ROVGppN4LhsgD+G93wzajhByY7JnMRNEI/sn51h1Nk26CHZhDalFjcuuZDHckzADrzveis5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ4/mLndBexR3GwPADDV6and0tiWdXxnoQekHd7Yqw1qtY7Y7e
	wLRVsw+mX18mws4UvyEpDQYrAy606bgKkkHRdpXgDB6nez7lX7aWwa5i
X-Gm-Gg: AYBFou33BBUrkTFUkKvALH0oVY+mhvZaswjYXJrGd9DEF8QFLxtm9x06HW45f2LpkXs
	T8lJdRMLqXKd1dlmREXur4qcpKB5dsQ7JZbWpbj9cP1A0IgmbwLXLOxHe+zLBXVFBWs8athd1Ta
	wb4QN10K+m1pulQSnFRh0owDwlB6ht7gZgoflQ8ONhXRQ5BJkV2Yf96dcY641Hp+kz9EjT9HPFh
	6d8IZdhxn/Lrsi7i8vs1Gw8d++QIaJg6f4TFOAQDUb6rsCtwYPx+qzkEofICzGPYAH3zOHjFAsH
	y5+LDRb+pcgTeG1UR3UWzxuLVPl25wBbay8YlcnluNIDc7S3x57o9FnDfJbVSLfCMWTEliyyJPi
	X9V3n+UGWbRVDDr5iGMybHM2HSvgiAP/HUG0hMbhV3/QHH3d39D+/EWyisT22th5i7Q1VQmDaBu
	ssQg3/rW4WeWOSUv1j7ZKN5SkqmuEO2yW9bWUJ2dgc3n4MmRT6SRlnJapVSvCM9c6Ii5WEWROku
	LL83U9F6x440H7bKrgatXCC0VajoHQeSGCTYrXNvSsc/tP69siY/AwJkseE4uYbzLDxomkRxlEA
	YDz8Z1bWwnSoplMR8yOkWBBpK5nSFC9Byyn1/0E3SMYzCyjR
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr2028733a91.45.1793201315127;
        Wed, 28 Oct 2026 08:28:35 -0700 (PDT)
Received: from spidy ([2401:4900:e01c:35d:d4a0:a769:c60:258c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f286fsm3445533a91.15.2026.10.28.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:34 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>,
	syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] md/raid1: Prevent excessively large memory allocations
Date: Wed, 28 Oct 2026 20:57:55 +0530
Message-ID: <20261028152755.383821-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Validate mddev->raid_disks before memory allocation to prevent integer
wrap-around or allocating an unreasonably large chunk of memory that
exceeds KMALLOC_MAX_SIZE boundaries.

Reported-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Cc: syzkaller-bugs@googlegroups.com

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/md/raid1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..88038d535727 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3050,6 +3050,16 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 	struct md_rdev *rdev;
 	size_t r1bio_size;
 	int err = -ENOMEM;
+	size_t calculated_size;
+
+	/* prevent baseline integer wrap-around anomalies first*/
+	/* Safely calculate size; overflows automatically saturate to SIZE_MAX */
+
+	calculated_size = size_add(sizeof(struct r1conf),
+				   size_mul(mddev->raid_disks, sizeof(struct r1bio)));
+
+	if (mddev->raid_disks <= 0 || calculated_size >= KMALLOC_MAX_SIZE)
+		return ERR_PTR(-EINVAL);
 
 	conf = kzalloc_obj(struct r1conf);
 	if (!conf)
-- 
2.56.0


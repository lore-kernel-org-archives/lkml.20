Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4CC3B42F3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476410; cv=none; b=FqfQ2+5uyw3gevl46A0txV/Q2NIKh34il0wryUy8iyLBqHOQzrFA5END2ItaEDriYMaD5ZvTEceHr2epkEuCeUxff41Ai+pEg5vLhhSpBgmoYFcUNJZt/l+1S3MCM9pjvqke4k25rdwyA+vkTR5dwQWoPgGyxeuF6F+GQbpQGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476410; c=relaxed/simple;
	bh=v7BFCLmcdeaerEqOpGi91hESq63lYpZqv/j2EWQ73wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0uKgB5gF0AA0lSjtPH+fM/63SjyuZea02FQnY9wyr0QtlVPmmzn2LkKZgpBaDwYTod6rdHcchocWu4CieuVaUqGrBSoRW4ctimoWoCjboNt8ldjOUOSUpqzlZ8qzgqRqOnVAAykCU07l77ToR4BpY/LyBFm8uRKT/STUTt3Cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEyJWLJR; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEyJWLJR"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-39ded0d7f52so1316655a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476408; x=1790081208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4zZou9G0GO5cZcybgt12UlI26seICje1hbKIqqh7wE=;
        b=jEyJWLJRE1RRwrYyB5qLwU40zwdmcbP/QGlh1FH1K48y427KK5Ii7UkKGMyCRA0Vgx
         93truoJO4wWoVI0/yxD2ui0lC1/utGIwhZUdWfUtxXqQZ5afc7mv2/Kqy2JIyn2pVngT
         Y/KTa2ZW3aLMBLpz8IhusctiZNI4ED8K45yJc9v9eRiP5q8Ew2F8DVDKQS4JO5Czg3e0
         UwDyOjkAVztwksPaUGALBehn0m91gHfW/RiA1A/osaatNHqu7B9jArkV6Gw9mlvf9FqQ
         nG54r4zsET76CwRAw78zpXR0EvLJXtK6RJb05u5i6XJdHEk5TR5slPV22L5hyN62reKb
         VKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476408; x=1790081208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4zZou9G0GO5cZcybgt12UlI26seICje1hbKIqqh7wE=;
        b=IDdqBQUb1NyDYaYci49ekJo8UunQE0mr9WtgG+4uW1bVnY7xLwhUbmvtZ32g5/K4fG
         b2+RgNc1+6OhYp5khl1AGmyurcFoTw2b9QmwHI0HOA6FJ+21aPlFQD5fkV48/DWVpI/2
         rAkoVP8J6ie7QCva8hZJxvvxGdhA2xaDf6neWQMj9/2rZIMaxXT6WGzF8WcnA65jfdDJ
         gZy8L73YOVI7JmWbwUVZuZpd9JBOXmhcElxYnFwJIwm22SMZTXdTwaZicYq61gGE7245
         x+OlK+9M/642mqwyhkJzSj//lMfO0KvJn3S+lT3p+lJudls5YZJsqPn/PX55Ky3sC8+3
         l2yA==
X-Forwarded-Encrypted: i=1; AKwUvBxhUkdCsSo7pgVWeRCRIz9EwMCTsTv+5kclvXJudcgsU5AI2pp5d3B5GcTqAarg9BuCOl2Zg0Xm/v2Aj9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nVlSO12pDH99WzjOVFoAvMyRw48ongelJnunj1DKXaWFQVmFxG
	DuLEkcYv8C/4cgT/e1/LAULXCPnBNKizqnzNOx0W1D0KeOjY+5yNd0pWdBjMt04J
X-Gm-Gg: AYBFou3PNNLjkCqwfGAH+0bAgFomShvziFW+RwsZfRXDw77/b8Oe5j3PYGcIdotK73z
	oF8r+DIjuiveVeqCn4iWdPM6TR7N30jO/B266JTal5ASyaTr5/UGpBiN6rdWTTr1L3I9KwN7jtV
	kBGisr3HYpKZHZg0o2UKpkl+PkYXAwEs2AQlCYHJ9tFJVmveK80PrhGSGCZucaZhXlA3MFquelM
	yccotRiE+/2Hg4xIj4xNA5J1pv/wtjA2SPvagWLGHf2B6rbWVlLY30SVRUE9LPPN+H50aLxQw1H
	hKgHDgwE6D2mBun7LBq66nTfGX0UJdD1g/zjkWaOvJJHr4GZRH8vk+zbX/o/R0P6af65FMfouY7
	vVCvPiv7ZeCixPaVXzvgjpofRdKxHXi5YKiKg/MFWkOXHZW/5nvXmr4D0QPizsOgzKz3zNC/dIn
	f5SJKt2+tLDeMbKNSUZbiDCYqpatrKSmQ/xN32ddhm6hn/mNWSIqEPs09nWwf4DPqbVuLyp/ab+
	FeaaHIdBD4=
X-Received: by 2002:a17:90b:4a46:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39e110ed019mr1426128a91.22.1789476408264;
        Tue, 15 Sep 2026 05:46:48 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda249efsm5268049a91.6.2026.09.15.05.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:46:47 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: memblock: add missing HugeTLB flag name
Date: Tue, 15 Sep 2026 20:46:41 +0800
Message-ID: <20260915124641.2498280-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
entry to flagname[]. As a result, memblock debugfs cannot report the
flag by name.

Add the missing RSV_HUGETLB entry.

Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/

---
v1 -> v2:
Split out from the reducing vmcore size series[1], per Mike's suggestion.
[1] https://lore.kernel.org/lkml/178936321614.3691424.10386784926753862087.b4-review@b4/
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 31961ed628b0..f51811db118a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2874,6 +2874,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


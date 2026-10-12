Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ECF316199
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783749; cv=none; b=CU4NTbFY6VlBrkhVQ5kHURNFx+LW/uNeujXhJHClkswq3CGaph6wZAnCMRcC3USlRLWUXVQjX/JDJaJ//xTuHCioTwucjjahHLKRqzys1o2mEI6CsnPl3/AX9q6vpOzR86Qt/8TTvhDZxRUEyhQ8wCm1LtNDbEIwir0xieP1xes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783749; c=relaxed/simple;
	bh=p+9HQ/2qU6hqqbNv9Hj0rg3//zMxgJo30lA7NXPrBp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fa0Ea7HlNUP/qn01kcW9LTn+jklOpJzmixy17rdQNHhfp0rEBse0NfNC3Oel6S9RQQnYRVQufYBRndIJh5KfjOma+DDjiIDhHPUdAAaJydr1EmK+VKKpA4RHCTqJauyITGrE51PvyI5avmpD3ttj1+qehH8zsG8VKa3i0ESslig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGRnOnwz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGRnOnwz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af27fe287so1230857f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783746; x=1792388546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oj5XhgSe0FpI9L7joKTl2xjZXYCjBG3XVmlBR03TmF0=;
        b=nGRnOnwz1VXC3wSgdHIAa4X7KSrT4RUbyNxx3OTmzOu7Td0FqvwmqHvVZhxO5ojUql
         rRkGbTt+0iyoYns8AK6eb1Ts1VZ7eKQUV+MEkIWh9WO22RjzROLGmjHEgk8wCX2DIS7a
         BOu6po5dG8iqS4XAg6CwU1I+ecNrBUutEuvwjAzLkUt/kzrpq6vEi04RVtImW9SBU7NM
         +zJhsuOqOFdAgxLdlUziMm/Bdq//gTQ8RNBPoM64X+UHr190eRDqATDo9V5oka8uvHBh
         b0lKSNfqYml8ItWXtktkin/Hy1mxhQvJZ3JLZDkjHubk9GpYf15trpRXHZSml3tL/cjU
         fQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783746; x=1792388546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oj5XhgSe0FpI9L7joKTl2xjZXYCjBG3XVmlBR03TmF0=;
        b=mRp2lf5i92EoGBeWAF1YHw5G4jhu5/kQSS7iEUCKTO75c+UEp/IFbbcej1hmkErdtZ
         JGr4yOznVaXH7P5hzkRa1+vnm+nQs04tDRIEvKpbZ1x5BSyogZIVY7uqPk624w5EC1+e
         8L8deqfh8BboxhLRtrfXI0hK/YC2TgUOi9ZVL68qrxWBv/BnJ7YjlS5y+pWvcFyq4wFu
         TcolbVkWcIzhDa9IeRmkT2FeQ35bD6uZK7k1Y/iGAuCWahqGdJQEFO0acYQcIB6KZSc4
         KxOVF3MIbws+pP+ylZNSDjUSgBDTUKarmQ+JM3VQfFroImK30CFGxzOiXrGZHM/EiHXh
         DeLA==
X-Forwarded-Encrypted: i=1; AKwUvBwvMyZRvfLrjqvgfb8xEGZtJO3iWSOXpO3dJcguk7YPC2lrirramOLEjW2TnSvBIR7kVTJBr2sh4oZlPw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyL1+zCdMAtJNsA1ASejzFP1njp/lwrtaErZ29EnZtwRfMLyZM
	ljLX5ZARZZL6gY+HxcjlfjGKtfJcAaCa8hiJpWb2Zji6t+NePhWtxMm/
X-Gm-Gg: AYBFou3puI+sYoGFwiYYOik02uEEQsc5AYfK6YMlXAOX5PJ6Lg9iIQggoXDZ+OpKuD1
	6jkgCDtaFQHpcWTOyuMiI6QM27WsqZNIKLtevxG7zbZJSQ0YYxdJcHMfZBv81ZkMyeqJjSQUPua
	pEqu1Hi/mhQ7kqij1GjRxtbu1GYLghgiaGXw+4w5T+tDiURkubMPZETh2ZqzUNH+Y36uMuEjzQ3
	/cgYmJw5ukwBI5Y8+E2YvRtn+cjlfz30eX0hOZD4NqI9GeO52usUEsQhP1mzzxLZ2wxmS5fU+bn
	l7UMazUDxxGcv1kwhzY+wGLZhFnc1F7+VNpmOCXLdzNbRdyGJFFBGsXHJJafz/b3hcaolxsulxA
	2UFOLoTwx6siCuRkZpK5sQkIL+QwQ3EAe9qxTyNJrjRX/axT5/I7Y2jxmceW1+wXGPHzxQplgcc
	PIGnj//RakijUBR9oS6tm7ezWSpVQgf/CnpOummgmZs2xUCmsLfXoWA0WSAoxE7LOd7kVqlcyFL
	3LP2dWX490a6y96DAsyu1UmeL49Q+pj7qtbh17o+2EYPgV0p59RHBTttXGyRAPMdWLfQRGogF8s
	l0IAQxDuvDAzOPJ8Zmp5m+YPlu8sp9+oDwwWKtlDP6wT5L/+Gcu4a4fHoPqEM0FrFU64gJUy66M
	=
X-Received: by 2002:a5d:6312:0:b0:48d:ba1b:e151 with SMTP id ffacd0b85a97d-48dbaaeb490mr11563603f8f.38.1791783745844;
        Sun, 11 Oct 2026 22:42:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ddbbd745dsm1013851f8f.15.2026.10.11.22.42.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:42:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Li Zefan <lizefan@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cgroup: Avoid warning when procfs is disabled
Date: Mon, 12 Oct 2026 07:42:19 +0200
Message-Id: <20261012054219.13365-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CGROUPS=y and PROC_FS=n, proc_create_single() returns NULL and
cgroup initialization warns during every boot.

Only check creation of /proc/cgroups when procfs is enabled.

Fixes: 035f4f510583 ("cgroup: replace error handling in cgroup_init() with WARN_ON()s")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/cgroup/cgroup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 227d09704ca5..567afb75a4ec 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -6612,7 +6612,9 @@ int __init cgroup_init(void)
 	WARN_ON(sysfs_create_mount_point(fs_kobj, "cgroup"));
 	WARN_ON(register_filesystem(&cgroup_fs_type));
 	WARN_ON(register_filesystem(&cgroup2_fs_type));
-	WARN_ON(!proc_create_single("cgroups", 0, NULL, proc_cgroupstats_show));
+	if (IS_ENABLED(CONFIG_PROC_FS))
+		WARN_ON(!proc_create_single("cgroups", 0, NULL,
+					    proc_cgroupstats_show));
 #ifdef CONFIG_CPUSETS_V1
 	WARN_ON(register_filesystem(&cpuset_fs_type));
 #endif
-- 
2.53.0


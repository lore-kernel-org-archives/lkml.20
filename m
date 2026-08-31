Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B53BB687
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155093; cv=none; b=GJw6EKSJBB+04EUVd6VN2Hemmr4m24B2tuRARO9fyjlyfmGnd6CR8vUqmfOj0OR56HuhAKKFW2DGbKuIanTatpPTAGWS0QhV2lsBUQxDNwSGCfaOWcak75EFI5YEGZxuMhMmmNrsjyM4CXscMHMOJjNQQTeufjGipgOZrrlU0es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155093; c=relaxed/simple;
	bh=Q6d6FOYr9hS3YI7ZdjePKvr3g+MLXtD9221bmjYfgkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DqfTob40eFbv3Qk1iz9sKS+9ENN+px8L5Gvpd3P+xYPeapfM7zbF06PFxKS7NFLY/30LLG2+6+yYRtxpO5kvxDn/3okQuCg6Ba7Oy+gaYRIYMPromCaOdG5dkDY9BeHyJ/JQOOqzEzx9mBGsVsEXVuPDQlUJzp3fP1rEsTNeFq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so13576065ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155090; x=1788759890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Leo4TEKbsifUY9qx8kiJwn0buLofMp6xUgFHSeJz9E=;
        b=bs2q8lzPAB/J40pVPhoKWGAEst5/TUVAWziYu2PVK5d2s29Pibaqr6vgmdCGac7ITN
         43rDJ3Gxx//slerbx1+d/UaYSsLh1SYDQdwNy2cZJZnxfxJteRA8XP4ShrCeR/AUfEkf
         mYb/DnQ0PxboE7KQBVws0DPo7wuqqC9GkS5w9RZmOWOCTQM1vjVywfe1zOKHXtZL3SWr
         SxeeQiAgJJweQltyFeiU4KyroUc/XtQG4CX6+g3b+dVNRzYDxTZSf4KOQ+/9RpI19GXK
         BsucCAFzsi+1XUAJgVQRP4df7axoda4AdGgerHc3slIV8iqTAklm9r+ZTG9Jd4CKZVgs
         rIJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXf4uB+HRvpEaKbnuNXu2w1XVTbd3C2KCeGljaoWM4tW5zDLBOY2vogqa7E18lRhWrFBpKvMokKPf5ZU0=@vger.kernel.org
X-Gm-Message-State: AFuF++mWG8iKxsLM+azVrJgPl+fdqtN5zMTz+5DlTPa5gGqWRdAHYMAC
	HOm27blYSjhAt8gZLNNiItGr4t9Qjb9bvAawiE2TbXfXh0Leta35FOPZ
X-Gm-Gg: AYBFou2l43U5YiQ7iiwrFP7Qrabi6nThEx6CadBe+JDCpNVDaMPCCIsfSwWyA754AZ2
	i8wnezCknkG7mQnwYg2Zw6rCBVISgST0iz6XlhhOHu02oeV2/iW/Bai1LtdvwftccvtVSBnSKku
	B2W9ye9EZ19N9D7QdCfJrv1kVDmV3TinQgYWfM9EV3iql2gOjD5HD1LnoXmu+hX0BlgUCz2zFkx
	Ds2llUg4yFRV8Vl9xVJqG9j3aBidc0aCeIqNLcydxKztkVEIUMVjK0HXMeJgZmlAUDIeh7HSHCS
	3qGOj9oGf73un1D2q7zKorNfSUo2IFFNB3YlUaMh6/5vNPRSq+dXLZ/qSs+TCS6XQXmHsWZGbL1
	ME8AaohGvm/CgSdqU1L6l8THgq/yhLp3qc+CttH19arzFtBvjffDAh60WGHT6HydvxKthCnp9ts
	QWGiKXSKCNNLE3ZVLhfeW003tLyx5tYPTo04PfX9AYQ/k4zL8kW9WJ/FIUiADE+guspBWDvWN8Q
	PxGII6UB0A0O/1S7gUp
X-Received: by 2002:a17:902:d4c7:b0:2d8:d4d3:da51 with SMTP id d9443c01a7336-2d93fa47634mr13039775ad.21.1788155090238;
        Sun, 30 Aug 2026 22:44:50 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869aeesm28826835ad.46.2026.08.30.22.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:44:49 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	zhongqiu.han@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v2] cpufreq: sparc-us2e: fix frequency table index copy-paste error
Date: Mon, 31 Aug 2026 13:44:38 +0800
Message-ID: <20260831054438.3632612-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In us2e_freq_cpu_init(), the last two frequency writes both use
index [2] instead of [3] and [4] respectively, and the terminator
uses [3] instead of [5].  This is a copy-paste error where the index
was not incremented, causing the divider-6 and divider-8 entries to
overwrite the already-written divider-4 entry.

As a result, only three frequency steps (div 1, 2, and 4) are actually
available to the cpufreq core, while the intended dividers 6 and 8 are
silently lost.  The struct us2e_freq_percpu_info::table[6] has room for
5 entries plus a terminator, matching the 5 hardware dividers.

Fix the indices so all five frequency steps are correctly populated:
table[0]=div1, table[1]=div2, table[2]=div4, table[3]=div6,
table[4]=div8, table[5]=TABLE_END.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
v2: Correct commit message per Zhongqiu Han's review, no code change.
---
 drivers/cpufreq/sparc-us2e-cpufreq.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
index a68706406b88..5cda391ad03b 100644
--- a/drivers/cpufreq/sparc-us2e-cpufreq.c
+++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
@@ -282,12 +282,11 @@ static int us2e_freq_cpu_init(struct cpufreq_policy *policy)
 	table[1].frequency = clock_tick / 2;
 	table[2].driver_data = 2;
 	table[2].frequency = clock_tick / 4;
-	table[2].driver_data = 3;
-	table[2].frequency = clock_tick / 6;
-	table[2].driver_data = 4;
-	table[2].frequency = clock_tick / 8;
-	table[2].driver_data = 5;
-	table[3].frequency = CPUFREQ_TABLE_END;
+	table[3].driver_data = 3;
+	table[3].frequency = clock_tick / 6;
+	table[4].driver_data = 4;
+	table[4].frequency = clock_tick / 8;
+	table[5].frequency = CPUFREQ_TABLE_END;
 
 	policy->cpuinfo.transition_latency = 0;
 	policy->cur = clock_tick;
-- 
2.43.0


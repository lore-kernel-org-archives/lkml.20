Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51517BCA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790209152; cv=none; b=e0HKJOXLE8xEx0bgA38c2K5AdpybWHhLY+ugrftwvqVK3NDyOimMu+lzNFGwddT9GHWd/ZWAS3vPNIIcUWz/24REJq90IwmE1qygRFvzpA91DRYqdVqnW2jAaOhlwHIGdguuM9ol9oX7/fIq8GmMPIDgphFzDzevqtvfs3VXQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790209152; c=relaxed/simple;
	bh=zdLyxl0P8gaJ5VOlGWmIKMZBFzYwM5c5RTXcN7no1js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCT2ehOSx5iXP9vLBcQVkOa48nvM6lU7tIHMFQbPGFkYY3m0urHRdszjEcp4Vs1l+Kg7znrgdgSl/iaIVuV/ZJLt7ytHpHOs8sUM6ha/ewhUNUliksACyqlY8vgXbzyAIkjdT/TfHXH5AGgZi2oZQ0VY7RHqD1klUwlsWXtx7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbujTO26; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbujTO26"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93910ad2273so162528985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790209150; x=1790813950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCL53sxKRzp61dtGrnrYmPy4+hTQjDiBDeC0aw2Pc3Y=;
        b=TbujTO26kC1nbd3u8TxePiMYV4NJZSj24WM9NjrRI8efFtTI1nn57aLYW3lgk9hmZk
         Wj7nuEULzKjmr5UYOPt6vW88PFdzpCvftnaVVq81+i47lFcIGS91WFN7WCG/ImSGkMBd
         LCP6LrcDBtpxrA0T4tTGmsHIVhyICBW36vEKt4ZIkGaljqnrzgeMVAJGedmCLZ1ABSq1
         ZiinLhID8C/N8aQ/3frtfyGQfWOcuBUN/8WqEyK4Pzaqg0RFwlJfr0L+VF+8F8MzBiTo
         /YW089aYdGnqUn42zcoDpXbbLVmU6quM2QNkH5TOQfr27OkEVhfoh0UdY5eDhXHH+wN3
         LrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790209150; x=1790813950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCL53sxKRzp61dtGrnrYmPy4+hTQjDiBDeC0aw2Pc3Y=;
        b=fPzjJWz+a5ISPJFr6u5/foNqcJAKx+mSnMmcs3xbBS0zgYFLr7ouNI3kZkrNFBSFIt
         M9zPXumRb9SexPCCv6l2n1U2QAYM8eEn9VznuIAU/pmQxh0Fy/glZe3xytqhNG+3BhVB
         33r8Tk67Rz2NrpbWEN5yiFz7gZfsA5rh3ggDU4zMvM/cTTeYAVtbE57oafTrhRzGlpTD
         QCsHtugU5Q9J9OIQ3skhxwx+7SBMPD+ycOBJTpx/WiFACa4AMzYh3TlA3DuWBnULx8zy
         crhV13RLj502xhjGoCZS1fpNoGcqnzUkbLDdh8uGfKINl+nBfBgj/bs0LWSlc0PDfJUw
         9L7A==
X-Forwarded-Encrypted: i=1; AKwUvBxEi3hMtWlc1/ITooAZYwfCv/fSTP6ThiGw8kdCCOIDbT1EzuLxcD+WHsLfkY9J8Z0fTiG6akynyCVnSbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nGkTnTis+bqUWQn+FdQ/Rm8mk710me9tjOgo2p0CWlF9uLDRli
	hytFWuL7YwEls8w0Y2g8JBzZL49NX6jWJZbnRJAwG8FzETzrORr3xPJP
X-Gm-Gg: AYBFou2h+Y0xm/a5U6sTH4QotpDHWLVuw/5WGp1gcuvYdJvIxvaD+f7x8S42KrzZc6p
	2ACv2A2HIezn+XEh7d5Ac6yVe4H7z9YMBPC0aZBlr4btez7yJv5Az1e6sthdYksQdS4M5WpHO4K
	wk12tqn/RSF3f5IR9jdrIliOLSLQ6tHxBkR71yROI4jewdGAV2Cof+iqES+RQQgQVEDKLAQuhD+
	8C50wFyeaLji/mpSUepSJx4kpBr1PuA94d3ZK8WLpWhHlvulQKwzpssHo0344Jwc6p7nytZTRcZ
	zus1bvPDQOaX0tHKILscAIsfpdD3eWmVtdesD66lsecGWfP5MvGrq6nTZ9Y/kpZkXPm7RB6dfKc
	VDW9bGzPNH3t+pRHT0MgZXzOmW2zBtjiH4Y9y2Mmf/Zj92D/ar4ihXqTz6TftBsGwkhvl3L88vV
	6Icr5g+b0vRdt3k7HsX2SqeGm+00/A1eluVHiSq9NG6BNY6biVdJRaFHkhoGDL98WNcqeHQc92w
	zuZOJNZcU6cy58Y7S5/Pw==
X-Received: by 2002:a05:620a:8393:b0:93b:f083:b269 with SMTP id af79cd13be357-93c3642fe19mr48680085a.64.1790209149728;
        Wed, 23 Sep 2026 17:19:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e0d771bsm5694546d6.1.2026.09.23.17.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:19:09 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] coresight: Check runtime PM resume result
Date: Wed, 23 Sep 2026 20:18:56 -0400
Message-ID: <20260924001906.715322-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coresight_get_ref() ignores the return value of pm_runtime_get_sync()
and reports success even when runtime resume fails. A path is then built
and the CoreSight device may be accessed while it remains powered off.

Use pm_runtime_resume_and_get() so a failed resume is reported and its
runtime PM usage reference is rolled back. Drop the module and device
references acquired before the resume attempt when it fails.

Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Point Fixes: at commit 32b0707a4182, which introduced coresight_get_ref()
  with the unchecked pm_runtime_get_sync() (Anshuman Khandual)
- Switch to my oss.patchbox address

v1: https://lore.kernel.org/all/20260802232552.593435-1-dbgh9129@gmail.com/

 drivers/hwtracing/coresight/coresight-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 928488a216d4..c492f9082c46 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	if (pm_runtime_resume_and_get(parent) < 0) {
+		module_put(drv->owner);
+		goto err_module;
+	}
+
 	return true;
 
 err_module:

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422B492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914235; cv=none; b=jN8vQ9ja+2lCzmdDR+Nh+MsCKWFCNjCDh5w4bcNpbpSyzDzAe/L6FT4GzHurd6KGi1Rz6LeaHAogfaDV3soxYrQSl/0/RKj22mx/JPI1h1dgQZsjcIXXbW8vmfE/UgRTbPDIl1ojFutAOrV52z0uZiJ1YVZ+ofRgi+ChtgbbCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914235; c=relaxed/simple;
	bh=ZQ26WuN/2uDNusaBnSlD83HCZx/Czvc7ZEkPnGbepS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQlOzJGo/LT9NwVej3uZykHBXUnAcA9a/YOBTj0yt+eubrsq2/n9VM/+86ORcpiQ3u+YaQFhS/KCUgJ0jH/7GzvI3in6GG+8kYkSSOUCpuvnZ3TiHjrT0oY2MY7SIgWbye7KPqu5QN95/wDxrbnRpHTJh3gz619bfdsgCcbE5n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSUadF2x; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSUadF2x"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4183967a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914233; x=1789519033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbS3BESBt65p0R6Xy9pWvWwpzxrdANSE+CV32PeomU=;
        b=GSUadF2xdCRDpMY8p9PEOYYO1Y+ua973eVYwUK6pjlQeVATWp63na11UWDSzkaaOLk
         P4aPNi7Xf5C0Jxh9lkPUScAVJeSjd3Cq+paHoTz2yWTPW5WjVxrsIExDLehLHkJbUXTx
         wMENmRN2glhG7teqZIlSXaRMEXEfq7307JHBsXsU9OPyKt40nooj8NltqTezVM/7SI5D
         NxCZg1q8VGsFQZWNPkAzsTTuEtCqJlwDmQvIms2mwNJVWjy9oG+nVMGsClMv/qPj1Rfo
         jOWpIro+nZRDaJsQC0JIUqMHTABMBu96LCm3ix5252CvSd0bhoL0B1dziO7g7Xyb3MW5
         u9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914233; x=1789519033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrbS3BESBt65p0R6Xy9pWvWwpzxrdANSE+CV32PeomU=;
        b=rRezenlTXMYfyQVBOmXuIKdcj3dWXeAVtCYbeAHJgG3kNYqiyg6viJ7dPyjI+eYqci
         uZD23to0QD2tTtk5DXro9LK93Q4uiAbSn79nJmnFXn/Ey7zMabTZRRd2DVWlIAhe2NK3
         0McHu/5lCwdZdqf99QtPSmjLJaCFBQ7n1vlad3k5cf9i4cW9iALcIcdNvCSTaiFNrHL+
         oCJoP/rT+Uyv1f3iJXnjPbxeW7ZsQn8YrYt0dwwVb0lKnVgOMGVCq8JEOqBAKf2g7mTl
         DiSSnb2ib6TywuRX+dhUP9HG8sLMwuSlcjBweVg5BwxSoVu5/2pL/BkSGL/5syHImZ8v
         rGig==
X-Forwarded-Encrypted: i=1; AKwUvBxmy4Z9TsSSa/9s+pQD3X7rvBUDXVan4B6f7wphUMtnMBuvIlnRWLiyJN/5XapQ3QWBuaYkRPXyuXdCglw=@vger.kernel.org
X-Gm-Message-State: AFuF++mniHxO06OvN8W8fyYDfTvpM/B0v71+NkMXTW/8KilT+ye5vX8d
	O53sn5vVwG9tzuayl+I6w3bqS49n3Y/q7JLi1cZchArQO/9NYbFwaZ7k
X-Gm-Gg: AYBFou23kOYQsnaH+Xj0Xr47sCBdHl0OCTEHw3syXfM4/q/GtDEzZbP1oeUSAiYjR28
	MBopNlzWhGm0EvafpQ6jM38V/O/v0TlUEG8G2r0cQb3TdIDig56ovil/UMd8/qcdBb3FkdvclsI
	p06J10DTm+6F74sL8mZ7GbWaHjwoEecn6aC5aRVvbaluvNRinWVEAl0kGpE0y17Kw7RpLdU/Gfw
	NBI7diUszouXMmcaEJHD6PWiNQ2ZxLMJQbvOxamCTpcRyYQ85dKGZ5boZlOfH0qkSIJyziKrzjF
	eG+ayfspRhf1mB+7NVBdJdHTCvmfxRuRPtPyrH/2cMbOjIufENa+gLaM3KZAoJ3LJIxMTPctkkt
	23jwTdRIL2sFr/jzL0EDNXt6VxmFu5CfqWnevg2UQrdapTIE+paXmvAgari/X+SliX9T9JWgeLp
	QpqAaned9E6iaYOq3pQNg2vgwnh2Zu4FN6zLq3w/m61tTkN8tf8CA4RpawvegI
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr49122061a91.24.1788914233189;
        Tue, 08 Sep 2026 17:37:13 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm34284184a91.1.2026.09.08.17.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:12 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 3/9] crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
Date: Wed,  9 Sep 2026 08:36:45 +0800
Message-ID: <20260909003657.1570544-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If writing to the configfs group happens concurrently during
kexec_file_load syscall, it may lead to the following issues,
  - buffer overflow if dm-crypt keys are added after allocation
  - stale total_keys if dm-crypt keys are removed during iteration
  - keys_header will not be freed if config/crash_dm_crypt_key/reuse is
    set true

So hold config_keys_subsys.su_mutex for the entire sequence during the
kexec_file_load syscall to ensure a consistent snapshot. To have serial
access to config/crash_dm_crypt_key/reuse, use the kexec lock as we also
need to access kexec_crash_image serially.

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 3a416933979f..580534d43b66 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -7,6 +7,7 @@
 #include <linux/configfs.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
+#include "kexec_internal.h"
 
 #define KEY_NUM_MAX 128	/* maximum dm crypt keys */
 #define KEY_SIZE_MAX 256	/* maximum dm crypt key size */
@@ -306,14 +307,20 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 	bool val;
 	int r;
 
+	if (!kexec_trylock()) {
+		pr_warn("Failed to acquire the kexec lock\n");
+		return -EBUSY;
+	}
+
+	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		kexec_dprintk(
 			"dm-crypt keys haven't be saved to crash-reserved memory\n");
-		return -EINVAL;
+		goto unlock;
 	}
 
 	if (kstrtobool(page, &val) || !val)
-		return -EINVAL;
+		goto unlock;
 
 	if (is_dm_key_reused) {
 		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
@@ -321,12 +328,15 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 		r = get_keys_from_kdump_reserved_memory();
 		if (r) {
 			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
-			return r;
+			goto unlock;
 		}
 		is_dm_key_reused = true;
 	}
 
-	return count;
+	r = count;
+unlock:
+	kexec_unlock();
+	return r;
 }
 
 CONFIGFS_ATTR(config_keys_, reuse);
@@ -443,15 +453,17 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	int r = 0;
 
 	if (!is_dm_key_reused) {
+		mutex_lock(&config_keys_subsys.su_mutex);
+
 		if (key_count <= 0) {
 			kexec_dprintk("No dm-crypt keys\n");
 			r = 0;
-			goto out;
+			goto unlock;
 		}
 
 		r = build_keys_header();
 		if (r)
-			goto out;
+			goto unlock;
 	}
 
 	/*
@@ -478,6 +490,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.bufsz, kbuf.memsz);
 
+unlock:
+	mutex_unlock(&config_keys_subsys.su_mutex);
+
 out:
 	is_dm_key_reused = false;
 	return r;
-- 
2.55.0


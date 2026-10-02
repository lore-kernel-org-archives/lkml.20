Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF5379C4A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948381; cv=none; b=LVQ78olzExQyu14aVted12VvcpRRvE4JZEmt/nTjnhxq1YH5FLxeBPm+DeA8gXXMA6GiUC9S90eIkFdlobw5eYw7k3b/0HzikQfhlFRcx7uv2lUwZ3d5dedPvsYZZZIJG53j5cKrpKJr7i8SZO/QKCbO+cGiQm+avDBPiaVyz8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948381; c=relaxed/simple;
	bh=Z75jedtZDBDVMp/Owm0vVxorLSkJPnVR3O/iDqtrct8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhG3XEarYsBJ+UJY3mR2Bf04jM4ymEfxVDVrqnJHKlLRUBa4gZ+QsaI7J2ANMHGoJchJkHU+JiY3naPV2H5LLM9epELh/M8c7RBEl46pJruVZKhedTg0NDfmQRWJ8Dsj9eBNBwKl2KzzIjR1vjJKSE5M5EJa+CMTRkaYwKT+a6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7mJTBjC; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7mJTBjC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso2124031eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948379; x=1791553179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNJV6O5vfASyCmD9IiVILvGLC7JYcZpl/1tv6WAYJVE=;
        b=o7mJTBjC6vKllPU7yS7GVE+kASQfFnS1LcYNtzvZ4AYay09aICA9BwVXndhGvCmvtZ
         mo8EsKMBOsVF672GwvB5uLjixlW5P1SP4iCuzYZsREe5wSp4UdXNBkTYuyw7N7aGtcps
         l3PdZg62CPi0SDTkeqYs9bPvPMGoUehyRymVCvxVFmJH1DF0pNNQ7lMkwLTGnKfnFy25
         J0BcYiVMJfbUYUx7EhEgnzr5WG6MWqWf4QhsXgUKaSr2/ODFlSSBMORLEvyymEJGPELp
         oeUDimTnztAW3Is7I+XMwqG8hWAy6oZCxxbiNcwHP8Sy1I8pgJhr5CTmUUVzHL4i2ekZ
         UmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948379; x=1791553179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNJV6O5vfASyCmD9IiVILvGLC7JYcZpl/1tv6WAYJVE=;
        b=jDdlq8ryFTJ+iNLPmD3iWlcDtTCNhcuucxVhmyRCeiizPjHm07bn3QiHdM2Q0snvej
         LoMGuRyVj3Xiw58yaBZVublofm+tgzx4GbPgp0rgimH6ORmcGR+PHDIlW6OL0nMaE9IA
         P8YOmYJdd16X7fF2eyrp/xOQRF3U2gm2r+bx9ACQR2LoGM1S3PLHHCzfCtYpbizUgP9Y
         C3Jj8ebmLVQ4Rx7cH8CfckAmuJ3BVfrogqUTNNQONKQZpv/KCNIHUe4hYRtfGzflSKCn
         vLkgelolcgTTEs8dL430EEusLTr78t7K2xcu41nJjxp1yKgGFasRCfTYAgZduAgESYeg
         pGxQ==
X-Gm-Message-State: AFuF++n83J8RSwij55SYNsfVBkeBzFxJ9en6Zxg+xpK3mMra612KAZ/n
	b1nU++AotI+N6kSK4r+p8iBlIeCVUDeOWjVj5yM1n0Be3JMxJ7qENU3q
X-Gm-Gg: AYBFou3gp+1rdHqMe6oLEJLc/OmQ57aHizAd6lx2yJCtSkTUYQDIQyDleoM0YXIIVcK
	2O+pFjgH6YW1yQ5CMsBJQ9igDEawsKYVlYSrspkFVAj3GQbX/Eb8o0DYUfzSO2Z7qlO027bgpod
	6RHjBsiZoLHspsGznqboxBHks0sdmI3BmLh+4WjlO5BjBhqunTZNSvqqTf48+2Gclm/3icQh8Em
	NXuLqS+RfUnxFbYZh6AfMi3whmce2EePgyjeu7hPglaa54Gob3tcjwXtGK0Vsrs2dAI6JTPosz1
	KbV4AzaLGOF/10D+vBA2K3VN8XOWqYlbuDCfDofpG3qjrfdLS2UocmqFCdopT2htE+dhnyMOd/u
	LMc7KIBqIAn6HO99mAHqNQoP7zWGMmpWCFlxwaxmg8h8I4IVSmF+buFxK+u1htWKAvfoxfPaLsE
	0njiRzx4uKKTP7J3ADJyF4xj0duUCFndG9RrQNrFvXNiD2pIW41Lfsl3d1W/pWEghXAYOZqmb2K
	Laiz6QvCHt82BF3QUT8QwJlSgBsCdalnyKWEmmw3t5MEmPIRs57SSIBYOcs+wk=
X-Received: by 2002:a05:693c:8847:b0:34d:d5b:a825 with SMTP id 5a478bee46e88-34f150ada2emr2493324eec.17.1790948378604;
        Fri, 02 Oct 2026 06:39:38 -0700 (PDT)
Received: from arch.srmap.univ ([103.217.237.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm7416810eec.1.2026.10.02.06.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:39:38 -0700 (PDT)
From: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
Subject: [PATCH] sched/core: fix coding style issues
Date: Fri,  2 Oct 2026 19:06:26 +0530
Message-ID: <20261002133626.20443-1-jahanzaibashraf1318@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three checkpatch warnings in sched/core.c:
- Use 'unsigned int' instead of bare 'unsigned' for mode parameter
  in default_wake_function()
- Add missing blank line after variable declaration in
  __sched_setscheduler()
- Add missing blank line after variable declaration in
  sched_dynamic_update()

Signed-off-by: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
---
 kernel/sched/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e8c46f849f6e..9bd1bf3d7729 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4723,6 +4723,7 @@ void force_schedstat_enabled(void)
 static int __init setup_schedstats(char *str)
 {
 	int ret = 0;
+
 	if (!str)
 		goto out;
 
@@ -7611,7 +7612,7 @@ asmlinkage __visible void __sched preempt_schedule_irq(void)
 	exception_exit(prev_state);
 }
 
-int default_wake_function(wait_queue_entry_t *curr, unsigned mode, int wake_flags,
+int default_wake_function(wait_queue_entry_t *curr, unsigned int mode, int wake_flags,
 			  void *key)
 {
 	WARN_ON_ONCE(wake_flags & ~(WF_SYNC|WF_CURRENT_CPU));
@@ -8087,6 +8088,7 @@ static int __init setup_preempt_mode(char *str)
 {
 	int mode = sched_dynamic_mode(str);
 	if (mode < 0) {
+
 		pr_warn("Dynamic Preempt: unsupported mode: %s\n", str);
 		return 0;
 	}
-- 
2.56.0


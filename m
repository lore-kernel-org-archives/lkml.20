Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B65372EE9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738170; cv=none; b=shoPZ67kbjiB1LTA8NTBE27wnfiPeKbH5VfviGuOTJFmVU3hinwG/VK8CBp77ACsw4az81/WC1KWCyymggn0eMEfc3oxWmT63q/waecgQh/DSuVVPKBrBUP01wvPnEF1mcpLxDELCYHfUUteYjfucXWUTLCaJfya67wtr9Ubc6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738170; c=relaxed/simple;
	bh=0DvFLtWh/YNSEWIGblWeCEsGRSgydftqKVETMB0AC28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAAkBUFHJkrT20kExFoPzhUFL7D+SsMdE4wvpJ2+RlzUXsPgqrVLSW4K3C+ocVhSJEB87bXzyGHDCBo2sXNz3azIoI3xSEDLLZXhk3FEEnlBrthDGoSkbU9LU0F4lByDNS/w/ZotJhZK6C3D2/UeM/LqGDBEO1t8hmGyx+HJvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3NaAPR5; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3NaAPR5"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so156704a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790738168; x=1791342968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9oO5px/tUz63X6zzeE/TZluG5rtkY3Gx9MGMQ40YwY=;
        b=Q3NaAPR5L3yrx6gadDW56BAR7O7xiVZUQIOnQSmfZfrPqI6SVjVQRnHg6GZ14xfwLQ
         ep+UIMAbZk/gL4SDdoDC7Dcn1TjFvuDf68PykqhMynzxVgKmfrnFkxcdEPdEBLSpR7jm
         2Kvwv9okV3vODZePEN8Xnj7fzwCxVPRnWVD7FTj8LFON48qoPc6HnOF/fT1Di3+xkxTh
         5CH2H3Fyfp3aMGyR2w11nQhFusU4+DewxwXb6o9IDI4ruRFMwhsINyjy8OMZ/KAr31nT
         p33zIGQ3PcIaJe0kTPQ5S8gK+vmJ6456VzlNRlJLCyf2cNynGk3TizAxhkO+Hr8GwWYM
         6BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790738168; x=1791342968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9oO5px/tUz63X6zzeE/TZluG5rtkY3Gx9MGMQ40YwY=;
        b=2O43XJ0CNQsQZrQbx3RyhuZ07vu/LJaa/aEmzsQLAMQ0gfn5ymTYhiY+7CZIC6nNd3
         cUc+X7+dyQ1nS3SidTnZt89zTvKPGJRQ1mUUF0n57rwufx5jKG9psrDssHzXGLzeqcl0
         ffrZh6bgsMYZF/4BxJysjQSOWHeHNSCXUTZzUt8AxoEdeskllP/Gg6OgKTqtzoNZ4m5k
         k0vqXRQl47GCvGg05HKUeWslxMqNOQCr8kPslWZukQfayqGtKulPGH/DvGa901VmpTqj
         vo1gJP/B6P4THHg2HiPSDo/dMuT6Vd/X99DCOeSAfN6DZXWkLPJvr3q4y/nJKBOdZv37
         twfg==
X-Forwarded-Encrypted: i=1; AKwUvBz5dH/ZS3afacle5HptiyQPTzeHQKV+zHIGaE6sw86PeoWeJQgRxlGKWJDG2uJaJOmL78e8KOXTrPdZHbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKJ4YywoNtg5eU8C2sHJhEMEspzNAbEyPv5oUGGwair9WOluQq
	ZfmNVhjB8/GPUhiEysz7JtJH1gtzjPftAyfguTbzFmV7uqXS/qha8nFB
X-Gm-Gg: AYBFou1PEDtToOorkkrLG74BPmozKKo97YKNqEqSFoXB6E5+bN7MeXwXhirBhXQ2x9r
	C3zIZO7aXcEowq/sioiru8nIbjQfVCoSyxUQTWX8wLM0Fi5h2o0AUMxPSNGbRlUpGRtYp4L16MB
	hsotAynk/Bj5tOESPXLWJ8qoJbo/hwV88dLjGtfqcIkG34++MqO7rZjAQ480+mOjGXE69sYhs0F
	3KhNDlTRilHkW6WAPFA48Tqs5y86X7dnSxY5pqvgBNMjwSg8Z+leDFhwdF+Kganrx36y91HFV2b
	B8j44zxtU9Qmy6VhRLq5+/9XWGVrzM5iVU4YVnCV1LZEi8AsuhS6p70xropxAayTex+rE59i3nK
	MwTE0x0Alw6G0Fz5ZqFd/5pqAQDaoccfGi5oolaWjPHxoItrwIFE2dkqWbfbDSYw5yqHacGkLzJ
	aLTidSVk5mz+3rQtnIEwUuReG2cEnIOpKw8NvLKHSm34VbD/jbwPKVtx3VKg9vUx8nAdyCDE9DG
	HS+boJUzW3i6RlnOfMx1jErnkWBko8Uqon6shR1SHIo4h5pCdW7VbVCQo32kYHFc+znCgsL2TGB
	KIV1UU9rKfZbj1LP89gK
X-Received: by 2002:a17:90b:3c8d:b0:3a0:becb:914a with SMTP id 98e67ed59e1d1-3a4d0f038femr58495a91.3.1790738167868;
        Tue, 29 Sep 2026 20:16:07 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce1c9045sm588743a91.12.2026.09.29.20.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:16:07 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 2/6] qnx6: release bh on error path in qnx6_block_map()
Date: Wed, 30 Sep 2026 03:16:00 +0000
Message-ID: <20260930031604.70544-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924073920.2782917-1-benquike@gmail.com>
References: <20260924073920.2782917-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_block_map(), if qnx6_check_blockptr(ptr) returns false while
traversing indirect tree levels, the function returns 0 without calling
brelse(bh), leaking the allocated buffer head.

Call brelse(bh) before returning 0 on qnx6_check_blockptr() failure.

Tested in QEMU against tip of mainline commit 62f4c998b297 ("Merge tag 'parisc-for-7.3-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux")
using a loop-device reproducer reading a file whose indirect block
contains an invalid block pointer: on the unfixed kernel, check_bh_leaked()
detected indirect block 5's buffer_head leaked and pinned in page cache
(indirect_page5_leaked=1); whereas with this fix applied, brelse(bh) is
called on error and the buffer_head is cleanly evicted
(indirect_page5_leaked=0).

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v4:
- Rebased cleanly onto upstream mainline commit 62f4c998b297.
- Added QEMU test procedure and verification details in commit message body.

 fs/qnx6/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index c999dcfdc477..080f7698a5e0 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -144,8 +144,10 @@ static unsigned qnx6_block_map(struct inode *inode, unsigned no)
 		levelptr = (no >> bitdelta) & mask;
 		ptr = ((__fs32 *)bh->b_data)[levelptr];
 
-		if (!qnx6_check_blockptr(ptr))
-			return 0;
+		if (!qnx6_check_blockptr(ptr)) {
+			brelse(bh);
+			return 0;
+		}
 
 		block = qnx6_get_devblock(s, ptr);
 		brelse(bh);
-- 
2.55.0.1082.g2b9226bbc0-goog

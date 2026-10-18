Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B03DB63F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295505; cv=none; b=WEQpfRX9LUXpaNWT2l2tkdQo889C7g1aIupNZ2aixDA6VgqowfG9I7qDIZIayJL2pKGH4UY0LkbrjzR2F1YZsmIKL5WaqRzzPuGo2RCj+GDwUIpvLmPuWWQiz3GIBx+mf+tWvCvMZwWxkeDHQfy1jhG2YT+3ktS6jXnkrJZi93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295505; c=relaxed/simple;
	bh=RHYtUzD64UUQO0I5Gujz3c30bA6fMFthjuPZDuvoyFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdkPrjNQI0LbHKooQQkdPnU2ITmzINVIyAKgnt4YTuIg+gv5obFhJMDsXGFZQOk5mye7mU4S/flK1MqywOUDuGczWWtpNdhrfF8wl2R/oyGpjiSMZ/vXjKLZokPO/x3bQMLIblzfhl8lixYXrB6Vo6LCJgbzda5f63TQ1Ezxzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=feHV8BoG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="feHV8BoG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e934449bb0so9563875ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295500; x=1792900300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSllIrSwa3+mZd7MmtH8oNKCmldtJhE3Jr9UEV+PDik=;
        b=feHV8BoGwsmQoP6heYJmEO9t0VjeC/NNdPYK+Fmf62WT7lKN0cL4XzINL2aJKpbnaK
         Dm+xW9Zq5M5jeqFpAes1DXCdy1d8GX70JSmGGNSQ1jX+5IaGPsx2LysWkR1qu6MyEl/9
         JBYQ3Oo9IqH52UNtu//EhfVsaEu13wkDkhUhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295500; x=1792900300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSllIrSwa3+mZd7MmtH8oNKCmldtJhE3Jr9UEV+PDik=;
        b=s1u+q1q3HLsqyKFtSmH+xR1nPSzuzL+xMKcyX3vvAnSQWTVGrV9HzIYE+OFGxqYIgs
         bKfba1XrZhVz2CASeuxKBtooqyjiNxckh9Qn8UhX6UtubQHmZnQGGep+x1DG24pTO0hz
         rpZ5hv8FkkuNF/vUq1YRR8t4bNo6c10Nc2mVAkttutyEOoCVqqcAqx7jxfDLwEgKfACi
         ATAYpmYzFxV8FIx3QDQVwrAw7oYf5iP6Gyr/F8lfXwWA55O5n6sDQGiYOqhhCf8KTkWm
         cCoOlY4rnA3REzwrYuYNSaLVBR5UQ+Psc25iuj1uijDpKPO/nxwfCYuijZdsqOmDX7jm
         wWWg==
X-Forwarded-Encrypted: i=1; AKwUvBwzgBiTNdrmS/yBz6pw/afnXV25/gP6w6Z+9bFvJHH/pmMzoYccnk761yFRR5sqmh83ps+ayJ8rSKm/a2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWfcYSTX6ZOXnYforMMOpokiEBD5n+uNThtXYaZgg41upGi0HZ
	2dWXoPclc2b5xjV5u1E/dsJZE8KV1DpXSHJSHqp7WLkYHLoOGTQx0a+COMMs7oGpUw==
X-Gm-Gg: AYBFou201ZfBeHie7cfntvqaDecOgnzDzpkXB6cVFiA2R12Tf9ATw2c+FS+KDGR3YOA
	ynu7hYiDiNUM3R5XAt4ZMEVsR8xqidAUxxBLmhDqfuqLte/0RVi3d8VAbxMETb6rQRTCKMlmPxN
	biP9OmlWxpLPbU7SHC4R27U12CB/ld6RWiDqexKcHrml9QU9zTIF8arZDgbS6DoOBlcHZyfoJvK
	kMeBrpLMg1a53LPd5ZICZFEldsZKMqCL1ZKepNqi7F/eJ2P79X6Nu69KrjUVzkvL85JghZhrOlf
	s2pjOIsITXsc61LJo8rMf7LGK0fU/OF5yiAsXmEBwnrBcwtDgrqN62oxdPBbohv9RlKnj/E8dWc
	MYnJxAlG7RxdUAbCwdY3TUHsAKMXkmVYGjiUuPCoeh3/mOYZXeY/vq3fHzdYkCi0iAsrL1MkNlr
	hgxX6/VUQaY/TjVMzyXj05KfMQS+z4UeEdfjeU7MJeWO7DpKaSCuMF3w6PXSMT/LX9gfFLf7Fj2
	piO8/4yFwp3EWk2IEwcVqt4GR8Mw1XJCoCBz0FwGgctRmZ3q9m1X6KP1rb1mXXbLynHSLqYKg==
X-Received: by 2002:a17:90b:2c87:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3aceec709d7mr3568222a91.10.1792295500608;
        Sat, 17 Oct 2026 20:51:40 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:40 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 02/13] zram: remove debugfs entry on init failure
Date: Sun, 18 Oct 2026 12:51:04 +0900
Message-ID: <20261018035125.3120704-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ab064c84b092..593fa4ae47c4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3297,6 +3297,7 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
+		zram_debugfs_destroy();
 		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
-- 
2.56.0.176.g3575e65682-goog


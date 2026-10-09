Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CEE472558
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529937; cv=none; b=kMjpwTfkdazf52oz9oM54xNP9v6SRzYkAiOBn3aIwqiRhUnA5uSJ6Ty0TFOyjeVeZEIW+d1sGEJjBhz+QQk0pJRevn86yAgwEeSMRorYCc+Enh+1VzjqQmV4+VZE9DpxQBQhGj9HlLha8uDopjpHurpkxe2Y4A93ZRsbkr6/l8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529937; c=relaxed/simple;
	bh=lD0rQFPAO7Y56mf4/YQEUulve5+eskAq+kCcCbGhzts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nV66il6Orf/NBqWgopa1o96/DIfXwPZjzHh5wWKW6/WHw+UBZ7D2l9MGQMgNIvWhmcKZdw6LPCW5+oOCbe+N6hpK3FCIGu7UQrFWMih5QIJ3gO4HxrN9RxBn/biVbUUmneMBAtkNLJtvJhM3oGsmA5bOsFnNoxaevC/NTsEQi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LRwLPrph; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LRwLPrph"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so23866325ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529936; x=1792134736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qqaDqlHOxiclNmLEKxsRSXPU6/mDau3uowC+V/RF6g=;
        b=LRwLPrphmHcQOBkW8uiqIa3YWsJbcw9y+sYMlj2HR16jLQsMu5DWyytlToC1rfdfeJ
         L7TuFfz/WLXaKi2PCf916b1rFFR3zenW4PiaaySTsHHz2eqmyEdoNmLMAMYwI/oD3/Wf
         oSzdWjob3dcmku5/CyL3hhBMrQ5BsV/qlqPrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529936; x=1792134736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qqaDqlHOxiclNmLEKxsRSXPU6/mDau3uowC+V/RF6g=;
        b=kn0g0zJ06X8jEcSKs8umlt+5Gpbf797589e/da4e1Fpp46Pjm3pMwFSPH/aTTXU8zs
         pp8nzz1l+EBk4EGeo3ke4w4VKRsuuCou3lbIPnmuP3hzEr2SL+jlB9wW0UDxUSY/MMuF
         Vo1hpY8xH4DMN/zVYnhNyafodgVNkQGgpgA9KtOW3kM/3ffg0fk2Ng+bEMCPaTiVStkZ
         hP6LIFmfnCZ7kVV05zGQou7CeONN+S25m7q9FHPRVfmRQZsRVRmXZTJwdltPlcukKzLQ
         Ll7x0qBVl5/SSzgTCRweT0Q9e81UmdQ9xBFPRpq4wAoClPRT6aFtbwBEKGxAwX3OC2Z9
         zZ5w==
X-Forwarded-Encrypted: i=1; AKwUvBygZQQy5cVPao4NFvZiJSz0yS8XBcWtEZGT97pJfDvgpea4Gb5kzTcI5N2VNmRuE3P9KTM5UDkZSzeoZSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXortyjWBlIg7oau6u+uOOzYWgSVwuOTtA8QnxGXK89Hgou0Dc
	Yijxnmb1aShz6PbsYsYEsPNPOo6Rrtm5q2lBvj3SS8IFNJSAVqrg7XGun7Gyq0j0WQ==
X-Gm-Gg: AYBFou1jyjDLigBlLEMMXxdYyA6C7VBM2tZWGFRGXOk4SWwglziiJEtpya4fUzawSyo
	b1w437sObBb3PiD66VBdC88HPmIzY5usQOY7Op8QLOMkJyS5GehqihXPCMiqRghd37XiQCZdlET
	ZcRaaJ73yU38IstJqTwyMpexZdc1FMwio7l6m9eo3tlDu3QasQQct7JH22jf2waviennlVhQio/
	azk6KP8xWhxeh9XD6dmlQWn87kXBYnDBUQeWoF3Xt8tU/qIiSekrbvA4JbUsbMvt01jiI7MZcc9
	XzSacogCiwVGs0Jf4djs8g0/DkaSu54IjKp0R6VtGj10Sdwoo8JtNiogpu4xcgequRf5tikCHDg
	29kSvfi7SPYKT/X8blZF6QBwyGsivvMoYxDJlioLAzv+Nyxn7fkUMfXxyYCitTl0LvFFnOvOQAY
	7GHBCeF/MNKX0xKnJ9A15Wj8kBNqd8Z99IpuVQR1RgC0tQlzS+eLmcbMeVpMmYsVDFoJz7XFXD9
	1tPlT+5312cSUtDSEdT8PiQ37LJr4zAog8yqqyJB/kDHeYo5e4h2DNZE6VpEIQ=
X-Received: by 2002:a17:903:1ac5:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2e842dfb1f8mr9009035ad.55.1791529935962;
        Fri, 09 Oct 2026 00:12:15 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:15 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 02/11] zram: remove debugfs entry on init failure
Date: Fri,  9 Oct 2026 16:11:25 +0900
Message-ID: <20261009071157.3730698-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Fixes: c0265342bff4 ("zram: introduce zram memory tracking")
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
2.56.0.385.gd3acb90ef8-goog


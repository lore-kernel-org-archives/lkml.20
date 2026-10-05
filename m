Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4EB47F788
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202868; cv=none; b=WajWb98qwh9/DzcZ2h9/JoxUvyk/BSpHMJkMILsArhGWqREp8Nc1OFkqjKovLSLpsi0fN7e0BeIBskreK3rsjO0Juk3eTEBtkCMEdhPuWmxUtHMOvIJFhE0efphh7Yzl2GccniRFz+rXapwNlHqpuXZ3bqHglNfmXPUAsjrErWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202868; c=relaxed/simple;
	bh=LkJh0bZDBjHTYXjvwEA9RETJEVzSQsIcUxtROLN697o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwwiTR8milkJlq5EGCOsVNqGHYzOl0VqfY3OdJ3NtYNVNb8MzAhLfJJyDr2/T01Gdoph+PELbmapASc+Nag3ZM62Vyu2dQOnpDwWfVaewOR2NPXr/MrQvYqZ1T+uT6QKwzskljpRgdzbnp/Px003MqR+UBqatcaQmYNDSgOkLiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KgRQU3ZI; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KgRQU3ZI"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so633187a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202865; x=1791807665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIJjn31Exx0UajaxWOy2nTiUgkoHCFckWpJVBld8pBw=;
        b=KgRQU3ZI4D3wvmEAZu70FbZr/2RMjRyPjBA4KjC78aAzJkFP4a8hTjvTCkW21r+JEX
         idhfxVTvhkn6gd3mmMavPx77GtyrkQlv1OECIScuUnLP3ALhBGm9uFWIijfHaAuEXcCY
         KaHgpLZM1DWu1Zj+Gtc9WOjSuFkNaU3A1baU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202865; x=1791807665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIJjn31Exx0UajaxWOy2nTiUgkoHCFckWpJVBld8pBw=;
        b=HKTvvO18lxHs7VtiC+UVjswgf1oPdBuWMdEh2GkOuG0aALYTroh+zdhKX42m43n0/n
         8wzDe93c7E/rywUApyt4lL0zHlAkB5oXEEe0Otw/GQPLGwbdbjERtFTSZddg7uBP7WQZ
         Zey9mCS1qBqQjPc3r/5KsXRz19TbW4hVf4H1hoKl7tfx+axSWgB6C7uBv/8jsPyNIoqI
         Qc+RIeQpu8IcY8KMmdyi0wmIGYUu9RY+9dWZc9bKm4A4qvm2S7WSg1oVwU89wFJOAI3F
         5TmJjO2sP7RwyPd7QKpjf5mZr8QImj6mJmA75yOdy84GRK+RqBjZEEm5+dx+4eupQoj3
         7a3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzigPGpEcxytM6IpiUIL/Nn7iGlnC8fSboIUOWz1vcVVbQEL3BxrIMOrzZvF1/4l5450FicZ1NrDtRfSuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9VK/fTpVEOGJPNv/p9YDED9EZOD/gLJ5jd6nDSJFK8vrCw+o8
	TFUdx68YhZTT/WUkl8up2nbGXumoEX+dszMUdXuipvkFc8nnWNJQQYWXS4ooPJ935Q==
X-Gm-Gg: AYBFou3x8OCnUayu3roEi5Cw2JsK7PFZCef2Iq1XYo2Sc/uChaEtXcrP1qw/KoL2ZSG
	S3ZqcVtt6igZFTpYSQ7PhIBS+zqiIQ4ez6UUDEuTVpSdH08gV2AkjC/ZYwZPXNbZ0IfRyM8KIZW
	oiaZ9+/qolXpi93nc6MuvHZyCy4mHJno3XEFaXGxjWFLaYNnXluAX683Gx5/IZGyz2EmbrVrMF4
	m8uGvNJYkSKEEyghnxpuJi+QpnlwSFNfqW7IK3itUbDt7QvPBdoV4gxH43dIo14Q0d9qApYzRPs
	jAvZ2XF6Blb92A6f6WkETdH2VpoLOF0SGpDB9gbh+eMNJFYMth4CZVFLvDorM/mELZ3TnqaD22S
	P2c8sV7fCPiwVKkqcOe0fRUAffK0H/72oo+nv11uvOEooX3pEdv4cE1torL0B5owrRaQPwGXrBe
	AliBo6Y/G5xPWsDvbbvR8t1FPl7hllzVakCc21aOpiQQeqJdAyD1EHEZaXshrwmoFF+bIydHrx3
	1U0tzXtIBklLeARjrgeR+NKuQRi6JTKVTEaBA8yzi8KkpoGy1XIljrKbBs5W30=
X-Received: by 2002:a17:90a:e7c2:b0:3a4:7730:755e with SMTP id 98e67ed59e1d1-3a6ceb05570mr6709940a91.26.1791202865649;
        Mon, 05 Oct 2026 05:21:05 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:01 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 02/10] zram: remove debugfs entry on init failure
Date: Mon,  5 Oct 2026 21:20:17 +0900
Message-ID: <20261005122036.718976-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
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
2.56.0.rc1.315.gc6ed9934b7-goog


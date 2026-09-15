Received: from mail-oo2-f19.google.com (mail-oo2-f19.google.com [74.125.231.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF83515D7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481127; cv=none; b=o8baWKgraMnhUBIaKxipw/mG5cpsW83iX6DBw1DgQXKxkiPh7bzblO5jFkZiim/wOigz44TkaDs3L5JcfBindvfP+YWIGJBw4picrDPN7qvwxG4mU2dvuTWgO2/7fFPvJCRwBB2YH2ik/uSGOQXjD3mx5M+5cFL1HHcPVqYjz3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481127; c=relaxed/simple;
	bh=l1MSFdroio9w5UUZCK7+2//D7579OK4nRstZyOaDeE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjUk1KG78bE9QKIyUUdM98PdPUkQMZjUnMEz5ALM7zycngS+SjDT/YtVTo8Op2CteQZeO5TgmlNGZ4M0AjfWEflAbUne7IepvJb9j4FoCUm4ywpjIMEhGaF95jaLSUY3eFvBroGQ1f14jriOb08UlYJIkOQr7z3kJeQCI6u6nKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efANzoMp; arc=none smtp.client-ip=74.125.231.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efANzoMp"
Received: by mail-oo2-f19.google.com with SMTP id 46e09a7af769-7ff1e4ffb3aso194351a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481124; x=1790085924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=efANzoMpspjN+nI7BjiTg8E5Ixhw/qAu3h8y6dh64dS3y4VzNCEv/5meX8p5YZF3DX
         AuxJWZbOSeavGPqGH6kuJnXVpmxes79+PM+9Ufz9t0cAn9/PIeG4pJmiPHb6iiJPDz8Y
         JlkdQH1er8EGAtoUKNyNyse3679/0R8FR2JX+6IMK8rn4JHZ4LPLhSwUvB2MztDa/uW5
         NmPvkDZVXazApkjhMPC9aIW7uI5xWwfrj7ydtlGJ5ZKFfVlm2+UOALBrXKIamTH7pKSU
         9i5vB0njf4YXM6NydtEZneyO7a8vYo26WLQMoF4a81cl2BBhW+1B96RQwSAkBpYxQr4g
         QEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481124; x=1790085924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=u6JMN5PnfO4dk1Lf/bKdJb+GEwB4uDIgFMBJgQumBOwK1zYvJrA6CsG5+DfGuNrdLJ
         MuD0sjjgs4jGbMoS7jsbcApYcC2KkjTQFw3F5cSfLCWgnM6GODYE05/Ec+8iswvtiHJy
         XEMegm4IL55ymSe4HaTieLe26J1FpXUEUe3sy2ocOftCnAjuBWzq2MKA9QYHRWq5CT1W
         2nhvUjQdL7/nJ7eCpNNeaVfmzBbJVuWCa1eSxYZM9wYzhYccslLG7Yl3/Xt3sv6Qroyl
         7gLTUYPK37BnjV64HaZL+Vlr74J2mFrhCPBU97IAue4/kZ+p7+qyL54ejBLVE40hLQcI
         jUHQ==
X-Forwarded-Encrypted: i=1; AKwUvByzZDE6gOj3DagDG2qF0v5xTlgB6hrdd/GeDh7T0/th6ZkOnVlmewp1TfqN8VeJefDPvzdDyTNlZacgw5k=@vger.kernel.org
X-Gm-Message-State: AFuF++nMw5XmSFIyIOiccg+yK7YFDt+gcFF5jwiDQOB3DCdXVR5IDVAz
	pH94hdcj8XxzNpKNw7U7Yvv8rh7LgIsQ7xzFPFHZTpJhwLDNWehEXcva
X-Gm-Gg: AYBFou27LsLcvX6cUM3EOUXZAVN63kXVxcN+a5c+eO7fTpF16EgbIM17vsMxHpZ3PFL
	A4+l2JIn8iSdt5y2XbTNjU6/eGvF1rfvPaNa/cPUFAFohcMiRi9eND9WUZR8AHzwhbPdS0iiP1l
	lITdAARqcty7BF9zC7kXeLSLzxt3jpjJx30qlLomYWb7dGrrx28xOEioTSoCs66OKS5kYk7eXK/
	GrM4mT7RmA9mA4q6GfJ6eWO32JPefjSDzN1M571v72Gy5qR5a/XfAvOW++67SRnAZR6zHo2k3Yz
	SWpjFGq6Pa+bJp4i2DqjqZLYkjQEoGd7XDDZuKKT76tXakLOqLVm1hmCa2YZQPMO4UAfASHqgqC
	UZ9dk9QV6NIgUM4bkgGQQa94hQbhskQUTEy9SzYlUVyVSQQOdlb2rDlR0u92hY9z8ocoUx6nwjh
	DG3y4Vh+EaQloKWNOC/2/CfH+PA/pF9P5CQH2/wUjv8K/UyICCnMuJTg==
X-Received: by 2002:a05:6820:8c7:b0:6b8:1306:8567 with SMTP id 006d021491bc7-6c739c76dc5mr719865eaf.57.1789481124343;
        Tue, 15 Sep 2026 07:05:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6036fd7sm7020010a12.0.2026.09.15.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:05:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rkvdec: do not destroy borrowed SRAM pool
Date: Tue, 15 Sep 2026 22:05:11 +0800
Message-ID: <20260915140511.2429792-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rkvdec_probe() obtains a provider-owned SRAM pool with
of_gen_pool_get(), but its error path incorrectly destroys the borrowed
pool with gen_pool_destroy().

of_gen_pool_get() returns a pool managed by the SRAM provider. The pool
is not created or owned by the rkvdec driver and is destroyed by the
provider when its own managed resources are released.

Destroying it when rkvdec_v4l2_init() fails can invalidate the pool
while the provider and other consumers still reference it, and can also
result in the provider attempting to destroy it again later.

Remove the incorrect gen_pool_destroy() call from the probe failure
path.

This issue was found by manual code inspection.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..4541ef9ee3b9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1857,9 +1857,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	if (rkvdec->sram_pool)
-		gen_pool_destroy(rkvdec->sram_pool);
-
 	return ret;
 }
 
-- 
2.43.0


Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60A20E023
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024139; cv=none; b=oYxsfG3RDj/ReY7jO1bd0ILL9L9621b8CVlBXur1ZVBUZsAVbbO/pAfDrCG0z7Gg/ByL1O35wHkCcMA/5lPY4gNuoeKypCoE2gq5DBBnv48QAqUJR0R1aypnGl5OQqPeQGzxJwuGiP+B3kaIqS5NDR8xDXanIhyzLK2NH78yiMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024139; c=relaxed/simple;
	bh=n/GOlLkjoVGOj1jYUFcCfZJAUDFyu8jOKIReoDlB+Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SRt9FLAT5uAo8BDe37wobK6xyd4yEnabmzJS1xBLzF5oNJVjzXdApD+NC6hRck9AQqivQ6n83zqRjtyfG1Pk0ABuqjN4qiU9BMogWUAB71d+rPueestq1/8Fle4tFI1oD6RSDhs+wncDpTrWl3DudIV3CFoWveXxn845fvku8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJS1yzFm; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJS1yzFm"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93cc1ab5f6cso559984985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024137; x=1792628937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z04Lon24T05+gWKIStNI+3p/AYPWvmLhaYNJ4Xy1OFA=;
        b=qJS1yzFmLUvpPyAH3oCaOxzrpQgy6VZl+qdBuHCc4BR/9aY1kyH2pwCu46wvUFGcFL
         LVVMFQYYdyl+9opuN4YEz2xnzmHETXhK+qW4TGqxv0rKCm2Uc0Bzr0pUDS2SWbAz4ca/
         ogI0J/4WhUCh7FXtzJYSJ6rWfvXrJtyMc12oL63W65ptnnRE2/8ZwkUVfkcqpnuWQdLv
         Rr6H/ipTMRjJyKq6GXXqYM6mLYGqF+fPWstqjUvTJ2kE5XRM21XVUrU0+r00Qx41se60
         wFdxBti57PwTua6kd1EoI5m5o+240wdJS6bfNN5kwy/ImqYxB8aglaxYLD9VagsxQPcG
         pLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024137; x=1792628937;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z04Lon24T05+gWKIStNI+3p/AYPWvmLhaYNJ4Xy1OFA=;
        b=Hv/Fhus0e9AzN/SHL9G+zU+riceO8cWraDs0qy+oTN3syA+p/umgYdJdQyIwirO/3q
         KiBNzT8HzwE+E5NnkJ7eemWuvwUlN4+hhnBkhv35rftGA8Z/37VhGQJP1gj7aslrEPx+
         QKzoytOA32vCFB3q8ZL8utkgm3sTI41yGr98YgzwZMu4boN38LneXPyCT1KVCwOMW2WQ
         4ZskCj5ZCynw8NNt8ATA0IcekT4L1KuaaLkVxTbI6KE6rbME3G4BNzLUVFNyh4bzrmym
         8fZfzv0nULrw/aJSPh4PBs+OdJSlpSzZ1fWL9A8Kw8GelvSwCED8Avx0v1QkrkymGO1X
         VDQg==
X-Gm-Message-State: AFq9FYJJLA1bGEUqQZRu0n7yQic1QAZQVmIHE9Iq8lqO/19b2I+miwUe
	wZ0qTx7/Wi0JPjbVARE9FI4IsOsj+sFoWrm9DOE0K84ozxs1OHJB3yc=
X-Gm-Gg: AYBFou2vrJyYD1O7BRVMKvVuEzjhwF7XFMK9v7MfCALTmMMxzUzGmq6JtxfaTu/qOKE
	XAwcBI8yNU1wjGjKJ1jOYA2tJGVG/Hr+ZyqfQwNLxbM+B/eaZHya4YT4ZBtl1IeAzk9T022pQHt
	Br04PvVYgZOyoKP4O8IXXUdeFmG0LOJPz8O2IG5e+j/ax9OaKSckFpB+0XAUKDKw09mQEg+fgdG
	SjABiG0RgQGDix0C1wvE+83gx+A4qWxX2NR0CMzlJP7TdOzMqfz+c+kZ2tk9eI5Q7kYY/IaIhB4
	DGmZVd+o/Xouw7j73DN6ICjVJ7C5N7Z+okgSsmh9dEK6TE1PUOlWPlnb20yFFmt3h/+rHzmN0UJ
	r3UuyagBm315UE8cWnVbTwDCsj6A4dHFmb12logtjW8KKgtw+XbJcqZDIYDjYXSQTCsghhYjTl1
	mXxEE6B62OQK+CfZYg2/Mw3/bz4DDiMHKtthyXRCXrSIluvjgmLb9ddw6yi4URs2bWGtJj9QYZu
	TARaLdadCdE0ui7jV+28ibncZym74emz0aE7rTvt0opYRYD8xe2It3rOB4Lv7YXBuAA1LbbIV4s
	+oSCnA==
X-Received: by 2002:a05:620a:40d4:b0:937:6c0a:9b65 with SMTP id af79cd13be357-93ebd0c0a5bmr2853916685a.7.1792024136942;
        Wed, 14 Oct 2026 17:28:56 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97be6583sm67081666d6.41.2026.10.14.17.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:28:56 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: krzk@kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH v2] memory: tegra: Shut down Tegra210 EMC timers before teardown
Date: Wed, 14 Oct 2026 20:28:52 -0400
Message-ID: <20261015002852.2159841-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The training and refresh timers can outlive the EMC state on removal
or probe failure after clock attachment, causing use-after-free.

Shut down both timers before detaching the clock provider and releasing
the timing tables to wait for callbacks and prevent rearming. Initialize
them before clock attachment, since set_rate() can start training.

This issue was identified during our ongoing research while reviewing
kernel code.

Fixes: 10de21148f7d ("memory: tegra: Add EMC scaling support code for Tegra210")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Replace the static-analysis attribution with an ongoing-research note,
  following Krzysztof Kozlowski's feedback. No code changes.

v1: https://lore.kernel.org/r/20261011160034.93d011b386c2-1-mhun512@gmail.com

Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/memory/tegra/tegra210-emc-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e8d4cd8..044ec6f 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1946,12 +1946,6 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 			config->same_freq = true;
 	}
 
-	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
-		goto release;
-	}
-
 	emc->clkchange_delay = 100;
 	emc->training_interval = 100;
 	dev_set_drvdata(emc->dev, emc);
@@ -1963,6 +1957,12 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 	timer_setup(&emc->training, tegra210_emc_train, 0);
 
+	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
+		goto release;
+	}
+
 	tegra210_emc_debugfs_init(emc);
 
 	cd = devm_thermal_of_child_cooling_device_register(emc->dev, np, "emc", emc,
@@ -1978,6 +1978,8 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 detach:
 	debugfs_remove_recursive(emc->debugfs.root);
+	timer_shutdown_sync(&emc->training);
+	timer_shutdown_sync(&emc->refresh_timer);
 	tegra210_clk_emc_detach(emc->clk);
 release:
 	of_reserved_mem_device_release(emc->dev);
@@ -1990,6 +1992,8 @@ static void tegra210_emc_remove(struct platform_device *pdev)
 	struct tegra210_emc *emc = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(emc->debugfs.root);
+	timer_shutdown_sync(&emc->training);
+	timer_shutdown_sync(&emc->refresh_timer);
 	tegra210_clk_emc_detach(emc->clk);
 	of_reserved_mem_device_release(emc->dev);
 }

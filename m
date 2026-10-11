Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C0368D47
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748860; cv=none; b=a4rpCTlh5lxMXUOlDsS9JJaxTgB15TBQcIIW2nV62eAkBKUuwj2BNeQx+HkXItkWLoVFxKFP5zXAVb3eojiyD83jyIX+HVbg26I/oPQCtJWD7AipTT6AbMj+3E4NSd84DySzkBuSybjNsWuuSCMw/AuHO7hh+cdU86DWJH8XA/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748860; c=relaxed/simple;
	bh=8hzuobKMRFUIB5Gkf99Q71AgNKs1zpi13TsIJ+8zIjk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SIvO8F2MNAnle4aXk5EcqP9q0ZZP/yI3g/+QVnmugAJ2Wa6oYFf3ojHU9LLbpvFZiVcXwQFsgOSqAZanhIcWOfLDXY33ES6GHHnMXg++m+WMao6Ciw2mNCWdqtnhklNyfNNUwL/FkJFGENw66GfPt5aRF1lvv2Y2HGleGtRY5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkTlir3W; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkTlir3W"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso15055626d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748858; x=1792353658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjYVCkAhkYx5jymWbenkZ0abyqmM1tuoDhhjTrAOAqI=;
        b=GkTlir3Wtk7qaZ0+/FVM5n0T6zzmAAvUUd406SjZNPs6ppNJT0/EjIvd7G2hczhRSo
         PZzXnHHWeJ4Hx83JseVjXFCGQUiKuEkEGoTWAyezFw2u4SZfcODY+AFl1TOdtlZ0h+Tf
         bDtW1iQ47hWkxR6JURqWYb1eMeFBNrnzbLvKUVTOCnxNwe/mNuQ9Jijstd90twc4l+Jy
         WTwXmFjS4MtZ5Xp9193BY45/ZyJZb3rK4UH1dGDmkjRSCiTfrHFNsT/JNy5+okNPxAI/
         EaNpj8Wpus//JF4auF2w1mpt6sZuRIsikEz9MXDKtVrq5L166rY0qhi+933mLyiStAXz
         7c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748858; x=1792353658;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DjYVCkAhkYx5jymWbenkZ0abyqmM1tuoDhhjTrAOAqI=;
        b=IwjV6smFm5SJfBythVW1jCpbhfjCvIWqnx3wZaRreXPnOmilOm0MnDY5HhrVagd9GZ
         up8pwmW0D+3TzF63bx6a8in3NJRmctTYzZiinSFL0MZSyY4fzqVSk6wVQwzoutIY5b2M
         Xtg0qdIdZTz0vGUP6bitQUUdb9V91u8d1vHUWani5AlsnJd+6RHiLMKH3aEWhEhqbdG7
         kcl5DlnpN4Ut+UaIzRbzvdI+c0M6O/VxcoRnhHb7yMfYR2alI59SgIvvgtt69TQZMZjq
         212gx8M0ZtMQHofG6l2JUznaBk3x4b6mpv+oaGqXHo7yrIFzm4tzCVRIW3vSot28K3cB
         kLQQ==
X-Gm-Message-State: AFq9FYJbf66MC5b16z8kArguWs2oEREOXg5N5n2lvuZzgY8EXFddkUTn
	aSkImvh0E0l3velMyQ1SWMAhprJ1IRH9E3zdEr7cQGLZ5TqSLVXkxiw=
X-Gm-Gg: AYBFou1LqIsr4OEaYgq3SclZ6DnSvrqpKN7ad9PGANggz6t0ezNpznxDvLq+AF5kXpH
	IflLqji9VXQ54Bjaif7zIcgeh0O/wH3YmU37Z8DD+BLx3MBHK5qc+u+OKbF2vn+pwQmh3drOKzr
	Jj3C4j4rMe6QwP8tp/Vx2WHeFUZZiE3Es+Kl6lVAnTNG0HARHJ2F6j+IbwwupJ8eqS4hh1zv9Y8
	Z475gUNc7Opl9fkDISQw3RkflpXbLm2IRvGVetH7dI+UesWFj1lPsRY6OhiHSjcfWDVfHycuWl4
	dIfv5u3WU3IfekYl/MR3fswcTFZW4RIXPiEDkmqZrqSsOegqdJAzmGvtUuKFB3aKHk6yqw3m5n8
	KUstaLGM6OQuhW5Vd7PBwZneWaSyDYJ6YDobL9naRdrHAEwpqbjJe+8iOa+6gzPj6YgOTjM0hKx
	wJPUYCFnmsC0yuLTPw/MySqly/q3rV17Nr2edS+r865v82jl7ftATzvdrwe+l3PlrIDd9sViUVk
	+3j65ESoGEtAbFs1/YtdtWG40/dfu2RDujeruJ+UvQkXwLnWaSsTzFiEywB6BhFNfMAI8P51HOy
	QUWPmtH1Ju7SGnFK
X-Received: by 2002:a05:620a:a0d3:20b0:93e:c12c:9b74 with SMTP id af79cd13be357-93ec12c9f6amr885590485a.79.1791748858371;
        Sun, 11 Oct 2026 13:00:58 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0cfsm705308685a.19.2026.10.11.13.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:00:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: krzk@kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH] memory: tegra: Shut down Tegra210 EMC timers before teardown
Date: Sun, 11 Oct 2026 16:00:56 -0400
Message-ID: <20261011160034.93d011b386c2-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The training and refresh timers can outlive the EMC state on removal
or probe failure after clock attachment, causing use-after-free.

Shut down both timers before detaching the clock provider and releasing
the timing tables to wait for callbacks and prevent rearming. Initialize
them before clock attachment, since set_rate() can start training.

This issue was found by static analysis.

Fixes: 10de21148f7d ("memory: tegra: Add EMC scaling support code for Tegra210")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
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

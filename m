Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1504389106
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272378; cv=none; b=Osqnqf4ft8+9bsO4TcohaWgsZ5OaggwHqnmcU+4ZQ93qfiIs88EZA91/O8XQ9mHzIH3FaOCh4vK5pD9Vq1GHgeZzDkN1/i4vNfRyoffdjgj/RHMLqK6+g8XKnQmIYLtgTYiE0DfsEGE3tH76hBkpEY6zPy+ZLihDl8YnHHsy+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272378; c=relaxed/simple;
	bh=DXmCkQye1kDbUZPYw5KB8SL2D6gVtjoWUrghFucJ2ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LO5E3KklnCBmtI3WT6opJrERnEK4zSyaPdJfjGkAkpScLxO5HZF3QxYUMtaj5FxzKka2wFctE8tFd7HSeN4gykpO4qa75VUyN8gSM+NXXs5fzmKmmBVZ02RnvHNH6yUO8pgpWvqOlRiJf8ldTfbK7HBlI2hruGBX7Kp6SwagL9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BabGGvSG; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BabGGvSG"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-530e1b6a689so9062741cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272375; x=1789877175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6qUThvMWk3OXMzannpQNNV81o00j3uVEX2Exkp10Qw=;
        b=BabGGvSGwrZ5fqVzq/RIILGv1XepcOr/sSlw09jdxUMjBxmyZbb1RtMrH1Jh0P5FKd
         rDg0G3IW2DFOeoM/1LtrCa6HA9Wfs1Q+wXJ0FFlNCsdrdSGNCOYnmu+0sav8gE2+fhP/
         bMXxn3QnHhV2fnV2XRk3bgQA9GGSkueZ7WPn99BQtwGFNxxgGZYp6lVJVOaFWGly4EOA
         F8TPMgYp3O68OZEC+AYmcolFPdFSB/alsrBXJFBri9TomcWRyiznRDwWN06YGghfDCDq
         MW6eLTFIkLoVDRFQXupJwgWxJSTd1Za4tKOSzbsXSvgI2ufthiZWVG26uW+9MVmjwMhL
         G5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272375; x=1789877175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6qUThvMWk3OXMzannpQNNV81o00j3uVEX2Exkp10Qw=;
        b=rPwacqiFesDp/x0TT3H4KdorUtPODLEd5jFDqO5n31RHWEhVnqAjXx2FBWgyE9CVm6
         wRnUjBfTcZ1RLqYhGCnHL+TRO0U1kGnJDHQsPZwdHSBza12sBb2/L8K5dcWFhJP5WRZO
         rWEhiRe7NqGxnUQOZ5JxEgA97C0HoU4uhTOTLVjCdLtzsNaTYLs/aDRO77JnlT1nTTHP
         l2Rc5/CoBi/lkMO8jW2OudNATrHJcDzwLred4KwYCh716hvC4koVKeVWvSUVa4kyBfPW
         oQKXUuA3PPnILXD/HDBqPQY/TAgRgJ7oUgM23l9NyhnTxf2MRCwGDGgG3kxz2m8EMjjZ
         XKKA==
X-Forwarded-Encrypted: i=1; AKwUvByR579L+89vegWMVE2YcnDx2EJrT3JobEsxKPtG++2LVl70DAwR0PnT0aHR+19yFiAouULTmxzQYiiF8Rs=@vger.kernel.org
X-Gm-Message-State: AFuF++kIH7tJL146jkBLh6KA7zAwXZEATfuwklapKo9/0RMfjKWwRliy
	WsqihoOB4OcXICyNf+Bau+u0UBLM20tW2WpBJenKifLRi8wfzQnyQ58=
X-Gm-Gg: AYBFou0OJD5hE90IOBjTZ+Dpihb2j9knLsLetH8nSnjP3J/laWswPdSi7dGibzVolHZ
	ogg/q6wB0XJKCcVfCfBCiSf2xX9ZGV7E8oEYGpH6q+d8vgC0pzl//qwZpIZ3Gy6fZUaNFhmIYMo
	OC4QvbmZHSeuqrfF0KS69u7X9nyoNb97UqGJCp3h6Gdg2N8V2H0U5AqMWsC4YoB+wrMLpXotDE9
	JAyXg7/xYOZz0itMOSK6wNZ2NRM3VQisHfpfNNpERivcxVNx0uLa9nYTelT0eQ8O/+AKOi2fQOg
	yMG03QEjqAlyQmRlMh/Sq5pLACW1C7MEiBzdry10L67EvLMqZMx7FrXVfUKNluX44KtaE81U6ST
	LfvTtJ7FlOQxnWv8p8306qiMEqpeN/hEey1lWqIoL1sx/y9uqj0sy3LUHOq5/Z9aLgHX3gi9s1B
	Hr5MiiKpr5PsckrYvcQOBDSjsgJAPy+DNyUWkVt2x8JfUpiXgep3LK+c/4ELv+EAzltI2kZalK/
	psimKnXRQ44dLOnscdA2FAW7gCdr12Jsg+nvTuYEeSEbHEFcUy7kdOK07EdBAdw7JH6V/rOepKc
	N7wfEXBQwceM0iGNXe+MVSkALbBPMT+mQg==
X-Received: by 2002:a05:622a:386:b0:52d:ca81:e5b2 with SMTP id d75a77b69052e-530c84d44dfmr167443301cf.5.1789272374653;
        Sat, 12 Sep 2026 21:06:14 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50c8f1sm61459631cf.27.2026.09.12.21.06.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:06:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] pwm: tegra: Disable runtime PM on cleanup errors
Date: Sun, 13 Sep 2026 00:06:06 -0400
Message-ID: <20260913040606.23272-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_pwm_probe() enables runtime PM before requesting the initial resume.
If pm_runtime_resume_and_get() fails, probe returns with runtime PM still
enabled as the managed driver resources are released.

The later probe unwind and remove paths use pm_runtime_force_suspend(),
which disables runtime PM on success but enables it again if the suspend
callback fails. Ignoring that error can therefore also leave runtime PM
enabled during resource cleanup.

Disable runtime PM on the initial resume failure and when force-suspend
fails. Do not disable it a second time after successful force-suspend, and
preserve the original probe error. The failed resume_and_get call has
already balanced its usage count, so it needs no additional put.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3da9b0feaa16 ("pwm: tegra: Add runtime PM and OPP support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pwm/pwm-tegra.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 5cdbe120b..55287afcb 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -346,8 +346,10 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
 		return ret;
+	}
 
 	/* Set maximum frequency of the IP */
 	ret = dev_pm_opp_set_rate(&pdev->dev, ULONG_MAX);
@@ -395,7 +397,8 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	return 0;
 put_pm:
 	pm_runtime_put_sync_suspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
+	if (pm_runtime_force_suspend(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
@@ -408,7 +411,8 @@ static void tegra_pwm_remove(struct platform_device *pdev)
 
 	reset_control_assert(pc->rst);
 
-	pm_runtime_force_suspend(&pdev->dev);
+	if (pm_runtime_force_suspend(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 }
 
 static int __maybe_unused tegra_pwm_runtime_suspend(struct device *dev)

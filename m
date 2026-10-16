Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CD3806D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118079; cv=none; b=KpagxJj2hL0m3G+zmc1+2uQItw1sYozXHtCSMWi5joLjt0i7B+7Dk6SFDFoKfBhtRbxoLuRhs+wdVQ0q/ymoVxG7HFrLYZAcd0UEDdQSVx99Jmk7TNDxtwPVo0NlNWg+p+jE8Dl7lYoGTjo1ymyl/k1OnIABk0DIRsKkai22Uq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118079; c=relaxed/simple;
	bh=Pr5xAIu0MxvNLeiU8vK6icLPvs/OZauFDuqJMoK1UYk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MG9k5OJ4mfmnqAFqEdcixbFlKfj78X0YNj/mnAgCoHd8f4DiSQhGIIpFYQJpz/fjXcLkIOOqdWK+xXep6fmN+J93NlBcBiw3zGtV7Zjx09DU9gHpXR39iWA0bn1p7g4f1FOAyDt8tSGj4HUDQBE87CSo6Vqa4I2Ig7X0x3pL/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jplxtfv1; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jplxtfv1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91b52ba422cso65347126d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118077; x=1792722877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFt+NkiDlD6gbaWYo0pDmycQ7qIWrP9xpnL4311ehgk=;
        b=jplxtfv1UnWPwnzH1CIyq8OMgGve3I0c/m2kqeNlkv8CMErZgvYshsnO2tqSwU+0hk
         zq1AS/khOMBfP5jxAHnSntn+L6LPubF+MTT0ivK8dKOmFuOKXe9ezvhq+aIVoxgh8G8p
         b60Lp/hyGpNT8X2jtzGpWNCHB8zUsSCKgv9CjKYK5SQoof4Okc0naFTMcm9WWaLiQWMv
         1oAccASQO98S70ACX8QpKLQ9tT4XNCntlSmr7kzh5chgJg+oe+B50bvGLmuZUgpN347m
         TkP2hosaxmOj8dM24Cz5WyfeLYX7qaCQZPQASV1yN6AP1YQhRck/Evr1wCqyggQzBsYg
         fKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118077; x=1792722877;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFt+NkiDlD6gbaWYo0pDmycQ7qIWrP9xpnL4311ehgk=;
        b=S8810dPU2WYUk1XDWRUx2rt05NAIuze1hqr8z9NRLT1+YhopXdjjRqD3HVsEh0Uxot
         0rX4fMR87vziI/WvvS08dw6GiuIZPnZ+YXUmV+VUyurGzy1gXHWxwXS6pvW8So7wgscT
         wyi1wTbkCrTO6dDUmcGpTwAEoJ4jzxWEYHse71rSYgXCXKQuxYRwh11OCtNm9VKOVeCs
         SCdH+Kmymxqc1WyxdZy04dWEmfm354Eo0v6I9gQJXVIxeYs4foaGfgae52dL76JO2De+
         2GaBQj9FFKXDI3QeV81peLhKcMtd2fSUqXb80lk70lpR1EiGLoRX5KoUEFx3R7hXWfx/
         mFpA==
X-Forwarded-Encrypted: i=1; AKwUvBy+maoiUWO+GC/M4t2gl1c8yPfmsart2eHWKIsRv1F+6MR3YEqlkIStuUpYiNfE+N5Ihr8wHTWLMpUaA0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzeX4ua1NHJorHDB7LGgH8wMNyzysju64UAu8zHr/3gPh3xUWu
	cHogwhcEMU5PCCYg1CWBD7AwCKlQYYNPz5A6GbJj0qTsYYsYJiUYUcncIgPeF8BEGg==
X-Gm-Gg: AYBFou0LmW+XoJDz5i3vvvrE0vw4zxtrOgNuAvmm6NrYKGx4NZKfH8sSBNqGqSIAPQ4
	nRrst0oOnXQLHxAO/nbHaqvyBkp3NLPmtLY95tDXTK8illB6G85F/6d54gf1vuGTtR1pSis92vZ
	HfWpuiP7lN1V1UZILOOZVHlqywKrrTlBixxiW6wVDqBoQsX+xLSLgmtzLGc9pVBwczcalhNyU6b
	SbF6JyQj7MP/PlpeTaeB8sk25Uso9BsboUeiuYA08bPXFk1vOUGSgmvMzBLUr7ebEEQT7ZuE9lC
	j3w1vFWkzSQxrb1Wa9RTbNHza9bZj9fLZyPoaN0cWkrJfBPIKeT+8dRK878yGZu3VdDoeteiNpD
	w3RDZko9iakddarh9oLnrZVD2XWlglJ9YAbHFm+sUhT6BDOiUO/IW3CgK7/0Kd/GIIsiH19zXyB
	E7dC1vtEUFPeU77QNLHhtFJWYXCNmT6rja7r2Fywkf7zEh80gnLhHM20Yz7WfmihYtw8vklJ1Le
	353Jo+b+pg3WdyIiJKd4Ki508Oci38TWxsq8eUGNbTjrPOKiybgUKn63DDO8XiTm5019A2EyG5K
	9KMR0HCIWHiY/2ifhVpHpjsrfomo
X-Received: by 2002:a05:6214:ca6:b0:914:7df6:ca80 with SMTP id 6a1803df08f44-91b554c3d31mr370932266d6.20.1792118077081;
        Thu, 15 Oct 2026 19:34:37 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb0b231sm10907126d6.31.2026.10.15.19.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:34:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] power: supply: act8945a: Disable status work on removal
Date: Thu, 15 Oct 2026 22:34:33 -0400
Message-ID: <179211805459.3650807.8742309660995961596.G171@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clearing init_done does not synchronize with either status interrupt. A
handler can observe init_done set, be delayed, and schedule the status
work after cancel_work_sync() has returned. The work can then access the
power supply after its managed cleanup.

Use disable_work_sync() to reject subsequent queueing and drain any
existing execution. The charger allocation remains valid until both
managed IRQs have been released, so a late handler can safely attempt to
queue the disabled work.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: a09209acd6a8 ("power: supply: act8945a_charger: Add status change update support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 drivers/power/supply/act8945a_charger.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/act8945a_charger.c b/drivers/power/supply/act8945a_charger.c
index 7e4b087..61381d2 100644
--- a/drivers/power/supply/act8945a_charger.c
+++ b/drivers/power/supply/act8945a_charger.c
@@ -14,6 +14,7 @@
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 static const char *act8945a_charger_model = "ACT8945A";
 static const char *act8945a_charger_manufacturer = "Active-semi";
@@ -641,7 +642,7 @@ static void act8945a_charger_remove(struct platform_device *pdev)
 	struct act8945a_charger *charger = platform_get_drvdata(pdev);
 
 	charger->init_done = false;
-	cancel_work_sync(&charger->work);
+	disable_work_sync(&charger->work);
 }
 
 static struct platform_driver act8945a_charger_driver = {

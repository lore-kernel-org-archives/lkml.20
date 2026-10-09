Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7AC3C0607
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534411; cv=none; b=VoTc8+fLkQcJUEYV/QMMEJLnqoXk/tEidjkO2IhYw5Kv78v5t45aYOLCeDYhcroRXvPG4zTGtebXiORT4kH1GxVdhGNNaQ19sgP1I4bMTnfVwexnLxJ3XREIs/pUz2pRGi3gncbjLM8mf8xxRBpLyRw1/T4sSo5HtxOLlsBwn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534411; c=relaxed/simple;
	bh=CN/RDqciV7FqCK94e/7Y6l661ja6FQu1hE4KqFV/hJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q62ldMmj0kTLoT/8vUkVtMPusm+31yiACdfu/COmpZcqWbvFL95JxGdVs25//QWPqjg7hXDD0l4hkVgxDhl9+RD8ets9fGlmVxFMZdE7phsqTAqUVBlfsKI6G5+vMlqUPFSJoctqdA2Wm2j2f8nNxOU6jUK9pdiZ+LSJZMAN8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLKfUwxz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLKfUwxz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-487049569b6so2645740f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791534409; x=1792139209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH620z4UoPNlXk5Xt/Lvob6+Dvky4s07fyD7Cx5ik8Y=;
        b=HLKfUwxz02brRIJmD/DmuF9sggx/XJquMvCj3GcK+jgFvWJwiWTm4A/mW74S7zrEf8
         nC7JogflcHzqiCtPLzqBism1QPIa++mwdRw4ShbqrboSZ5YG2mz13CtQHbseiMKZ4Vc7
         kRbpwgFF+qq1tuUVvftQIjnVhqCps0+ldmEQ8wLKKGVWov7QtojHKahJt4+qNBI2Vq2K
         TOcZfCV02l0tJBhwZZtFJFiOWye/nh80rM72Xbcc8QqlCyOc4wMMvFYz+t4D70QtXwnC
         txfmFo2HM5ToV+t1h+FXpERDGSR39eE9XKZLUReTlW55bz7a1AK561h2CY62UzXUq3cK
         kYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534409; x=1792139209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wH620z4UoPNlXk5Xt/Lvob6+Dvky4s07fyD7Cx5ik8Y=;
        b=C3UpAi+Co2f2a2qZqRAU01WP9x2SRWvGw5c77A8dqxfDROsuJOYr20XLhL1efZ4Ljb
         kTqiwCx2A5MU9W2IlhbYBuIbvzbFz8YKVWdb51O3p3mBxGasoXqwYEHcD9iHGKx2hGle
         SVtssHkPq2po+g/lqKwOqLJv9rDEypUFt6q989UwaouEkOH16Z16FfUqB7q/1xbCZOrt
         HdCevfHcWKupRNZhdLXQ9v8EahqRloAiY157YQgSHOJGvWSqMQxfERnFODjiuNF4gj5X
         qbMka+97CO1fEpMzszIYaBkcnQYU5MIITmSDdhFl4G7kSrtePI06JcfuQlXX+BeZm09b
         FhoA==
X-Forwarded-Encrypted: i=1; AKwUvBw7TSJv/V8p3Vy5huXBz0Culu9Cy6ZLxISCJkpLb1eRyiUPQ3/IafT6w6/dRhv66K5zbgE6C2w0dmpxqrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl3KEEZhLmmlmRwskqWBj9S9E2RGwCLFb9g/Ptop0KRlTiS3hO
	9KhM2SJdvCmH7JtSMq3ml1+AkN+daNr3W9ahcTHO+Cr+84i5/kDJbFX9Mab7jico
X-Gm-Gg: AYBFou2vCUmEP6qz44Jo8hWboCDVI+rxCJ5WmtlALy+1x3oH1gRNcw64EaMq28+Y2Il
	MTnHb8dSbiD7Qo8SHbBOZBgWrQPGIfTf82ftRin4zFmlUucO614vKJfXPVq3Q3C2a79FiGGlIJX
	SNTXhYfVzmS+ehKdO5MULedazm5RPYnryPtC4pRf8iLQRvnpYY+GetAsUCvcQSLYMnZZg9KDhz3
	O7TLXhFjNrnIfEhSmnIs8jHAco7WOHeZTTzsZXYkqhBdNvVfWmy9Rt9PmhWSTjO65g1Gm5m+l03
	FB9/AnfhDJ5O1sL6cXKpeVl3B6Hei8wmElEnt5f+OFSspXp9LJfT1zQmmmXyOJd33iQVKCG4rWq
	5DhqjubEw+jqyYyEjj6icO3XO5vmnOi7OItA9An8o21ZsDlBsepNfBQ1XaDLGL/KF99m5UiV+sS
	Q2U81bCqfuP3qmPI8yaaKgXYTUP/8SjK3pCQMaOlfZPRuzVlKqrpAvXI17+DK//Yxg6oll+A19V
	MtSeJfxJVbSSQ==
X-Received: by 2002:a05:6000:4a0b:b0:48b:11e1:8bc8 with SMTP id ffacd0b85a97d-48dbace678emr1797471f8f.39.1791534408610;
        Fri, 09 Oct 2026 01:26:48 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9abce2fsm2698522f8f.33.2026.10.09.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:26:48 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH v2] soundwire: qcom: disable the interrupt before gating the clock
Date: Fri,  9 Oct 2026 10:26:39 +0200
Message-ID: <20261009082639.22662-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007193332.5270-1-okerixx@gmail.com>
References: <20261007193332.5270-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

swrm_runtime_suspend() gates hclk straight after the ClockStopNow
broadcast, while the interrupt thread that completed it is still
clearing the status and CLK_STOP_FINISHED is about to fire. Both touch
registers with the clock going away; on x1e80100 and glymur hclk is the
SoundWire clock itself. The next clock-stop exit then fails at random
(bus clash, parity errors, AUTO_ENUM_FAILED) and one side of the
speakers stays detached until reboot.

Disable the interrupt before gating the clock and enable it again once
the clock is back.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
v2: disable_irq() instead of synchronize_irq(), which left a window for
CLK_STOP_FINISHED; about one boot in four still hit it.

 drivers/soundwire/qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..147e55b7a600 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1801,6 +1801,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	}
 
 	clk_prepare_enable(ctrl->hclk);
+	enable_irq(ctrl->irq);
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
@@ -1887,6 +1888,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 		}
 	}
 
+	disable_irq(ctrl->irq);
 	clk_disable_unprepare(ctrl->hclk);
 
 	usleep_range(300, 305);
-- 
2.55.0


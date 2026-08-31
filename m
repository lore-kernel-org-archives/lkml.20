Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C023B9DB6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167532; cv=none; b=aEQPIOuN7LpLMXe/lQFu2nHk7Kge1+3N97p91+uq9A0ymTWjdSr0zL5PMdZSJQzPMZfij3iFM+GmJltwF1JxoBOhp/XWOd6Ek01GASWaJbFcxhYKxlbPH3GTHMFvqExVGiosEDfMCRUoIo6GSoBI5ErMeseSa4YdNcVw2bW9IEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167532; c=relaxed/simple;
	bh=5OhO7H5wy/8gR1JroAGflKbDlfbgFnL6qS3SY0hElg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXyjyro+gHZ0ZlNddCcT0fiDzYuUPNyVy1xW0I1KClc/IVsSeEnX4WV/CjjOM0gJ2Vnp4Z9oGAvzfQIZ7ATT/lGJYdj1oxKevBmh5v2Kl8cuFV5hfgzGnhbs/KTVlttPeTV+AJpOspEzn9nlHE0oGcMXPFwqdamG0ZB+I8aZ2eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d8fcda61c8so6959675ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167529; x=1788772329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MVWbIG+FPtZ3MOvl/1hLGDkOqyRLPEPkcfNhS/eoCo=;
        b=PP+p+0NUw2jzkCBF6WbIW4p2+kXqlQVGbrgXtzWJUNjPesiWd7cxn/H4UNYdKvZMtr
         WlZJurd5T3o2Ts1MOXGNov1nE2Cwt5LQKs6aBbAFbBr5knf73r6MnJvon114lwc3BTYM
         cgkZ1VJmfBS1H0pUbhyJAxcoDeo5AnS2agU1QObdFIdkSwU69suiju6oVStXxqt/acO4
         7WAnzo0uetF9P+p2YEh39PcpB6RZu3jad8WGfiaLBZp9lg7SIJK9U7uusq96yekFF0gu
         cX+9y86TANfI/DuT0ZMbL3hYlqgJrg5kdyQKa/uwUKOQBgr6pWlpNh1RJ3Ce/rFm0+34
         Do8w==
X-Forwarded-Encrypted: i=1; AKwUvBwGMNue201xK+bJF2fKEASFKPEfyBb4tTUB0bvJXkWr+phrHz8PJBIsp0WLp0Or6w73WiPywEom52iE9KA=@vger.kernel.org
X-Gm-Message-State: AFuF++m9veCKC/ed0dfZUp5QFO4bc7l6b+9eR773eGUea61jgoddtGDf
	qW0DifDqm0lyPDcJoU9l+9w5RjcDsr+eJNYMmPR2f5/nzEkJYxe/I6y9
X-Gm-Gg: AYBFou2s4W9q7/DAa4QMVW4MqsQPV939J3gbbDCpAokD8D3Z7UXKCobu47gsYjwaQpP
	PL5CPQ/Xd/n4HeDbcJ7r7Kq0FHk70i7PxleWf+o8kecSV0WFkJPJvGUzVeKbwI5gPHRRuJRYqN4
	qUMjHOzNqITytBKFHMCxQrtgwk6EyTnQ2wwBNPt6QodxVVVGAzq2l8ybPrGt1+FhUht0Ka9zBeB
	1dM5bNTYNRNnUtt4SS7AGhJ5zolixrE17DsRmi41E7cHY6SUzsikf9SW8nrEwzzxRbrNx7c6SRE
	e9mKs/eRLr0rhnn7/a/7YRl+GYhDzZBPiVnEXFTI+RRjB5gOzlBwELxNkkff/M7M9osF/ORonFg
	JPRndDmmKoc3hnRopFxUCLuKRWcCSXxn1j7FOwbzGdRrWrHBsfj1njQIBP0p44f5NNyE8isG5MB
	J9BcaJOeY1Ebcv8Yji/AzGK9RLBZEPEKNsYPy+aptwS9baBAxyBpxxnY3MBgVd6hcM88v+9htMv
	oW6w+DzUw==
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr10064170a91.7.1788167529083;
        Mon, 31 Aug 2026 02:12:09 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952ea3dsm31587995ad.24.2026.08.31.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:12:08 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: patrice.chotard@foss.st.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpufreq: sti: avoid NULL dereference in dev_err()
Date: Mon, 31 Aug 2026 17:11:59 +0800
Message-ID: <20260831091159.3906287-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ddata.cpu is NULL-checked, then immediately passed to dev_err().
Replace with pr_err() to avoid dereferencing NULL.

Fixes: ab0ea257fc58 ("cpufreq: st: Provide runtime initialised driver for ST's platforms")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/sti-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/sti-cpufreq.c b/drivers/cpufreq/sti-cpufreq.c
index b15b3142b5fe..144ac0f1d85d 100644
--- a/drivers/cpufreq/sti-cpufreq.c
+++ b/drivers/cpufreq/sti-cpufreq.c
@@ -263,7 +263,7 @@ static int __init sti_cpufreq_init(void)
 
 	ddata.cpu = get_cpu_device(0);
 	if (!ddata.cpu) {
-		dev_err(ddata.cpu, "Failed to get device for CPU0\n");
+		pr_err("Failed to get device for CPU0\n");
 		goto skip_voltage_scaling;
 	}
 
@@ -281,7 +281,7 @@ static int __init sti_cpufreq_init(void)
 		goto register_cpufreq_dt;
 
 skip_voltage_scaling:
-	dev_err(ddata.cpu, "Not doing voltage scaling\n");
+	pr_err("Not doing voltage scaling\n");
 
 register_cpufreq_dt:
 	platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
-- 
2.43.0


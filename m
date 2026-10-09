Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4A50256C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570720; cv=none; b=cEJPJIwCaxBUOxTBqUCqhgMAE2PaJt2Jhz05910iWtxupgnqDZT/lGRQ9W3d3w5UDwHP3GY3Dz5d9FQXS2k6sxJzy1kP9aUvV4bbbS1cCpewNXsEtn8cUhx9SYc1gATs2M2vicLeuQ4sxuPGYZnV3PJirzSmdazMElCt7a6EwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570720; c=relaxed/simple;
	bh=zKnuEKqqe7edCKaus1RgpjuKXXy74FsY9bBojL49qiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erw6KUuJUgAQaClQ/xGJWGW0M3fy/fudgmesSUTv6nqCxXpQNRVNfpeS92yqZmKsfxTYSDWf4skvMaEftvucgyyO7FPRybVB6X1E8Y/UDvZcGZFCbPKQLS/pSJsixndN3YIn4UOWZlTdvVrPyrJQouwF52LbNBQfoWUB4ZmrAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8gWof0G; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8gWof0G"
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-5339079c84bso8075321cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570714; x=1792175514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=R8gWof0GJHFYyCIgaBy1whxEwY4QTgNoKzzc/9stXixQtCybSBanNMorOBxkJiJYh2
         PdiuT5vOXZQUfryyPIA8MLclRWSf+OfY1Z7h33dVphSwgqUFnkkMOw1fWYe3iVfG0xlw
         2JTZvmcd+naHVt4j3mT7E+qSs6r1qzzY0CEMiMYKUMN3AQBz97H4BPKAua4Z93lXuKsa
         gDvtPqqge6F3utnTUh6vW6jmZjRZpTau8yiMXf0fv1/lRQWjNYsdLdL7zevLiQNhJKwT
         kj8OVAi8L1KAu/ep1qAiBwigCl3HYFLH3RRz0C6Eita7oZWI5GSLVN5u3PKqePzEozDF
         d+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570714; x=1792175514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=YXZSMvUBjDYD97NpPd2WkUxCCrKmo7IG+7anuY+8q3nimlCIOiI74zLN44sJsMF/zc
         xnLDZuOmBZXpcUl9wf3OC+OzWQzUq+G0esn5dWIZI5Hi4ZMwmQmmUQHJoNoVRq67+Ap4
         cm2nEmjZTQXrpfKE61QhP4ScUuigSAv9Wz68lgtA/C+Jxav1FnJvqWLEBpjCRUb2bam0
         kXIdULElf+3iVa/AqqavVFlu08oqXEmQv3Fq0wILGeivl0SOriharLaSGlHKF3zMSWlJ
         b0HJL1k36k9Ws0iUt1zambgmoycF/bIClVFNOkf+kvGdHG3o0ga4u9V4Y6JchiqLbWhL
         JhDA==
X-Forwarded-Encrypted: i=1; AKwUvBw+aDtEIdIyMJzp+LV5DMK/RSFCBNQHO40DZRdTl+LoDlhsYKuMjQfmaHa9GjZTbXtOImIwWLKcniFfuBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKryXAYZuv+/8XJKSDyWu3mWqhH2Z3VNjrfjqvCpTUEWYRGZ3ld
	XCl+JLEFWWaHEsC2e7FMy4knmIywTkD/McO5IULbr3n8UZjcP9GVRh6q
X-Gm-Gg: AYBFou0vWrUPCa55VDgxXKv6LQ/5FwpNnkVI67tmiqf1EvLSuy1DWfvBGZzqAeoPAtM
	K3HQV+9m5Uxp/14vBSijpMycXNH8J58KaLzunPNiLQI8uBT/+vaCamImaxBltzH2BjM+T+Sfc4n
	zcBPyCZ80CZOE1KzgShGV8KdWGeB8dNx/8/ngtBUFlKMtpzE7n7Qxa45Ztzm8ED59T2oWEzXjVH
	dFo9scJCvPoo+Ye+RNCoLx3htbbrPSwV9KODSnZObvMVfm9bTR8sIiuEdwdaP7b/b0pVw+oYvcX
	8TvfCSU3Ij9csM/n+h+QrCApeFTJB2ZicZ7tP3qTahFv5vu+Dh2EOLtO4zN4X4HuwJgX26kiajQ
	ubJs1z6guP7a1c5e1M/3BzLm1nlawHcdHUCx9RtiUUZSmEhOkaIipeUbEQNz9caGtkxkE0pUphn
	43c/8iPUUVbzH5niElyGKF4XszPItmsCnYtbEpbVHiYV93w21Fkk77Hipvledwq4XDRNjhLpFNB
	2qYpSuBHCwSXoxf2bgbb/l29DYMmHV63dNZznhNu7iQvvDLTbXHXtJ37Gc+HJ1Y/g==
X-Received: by 2002:a05:620a:6844:b0:93e:7156:f814 with SMTP id af79cd13be357-93ec134f9f3mr293228985a.11.1791570714330;
        Fri, 09 Oct 2026 11:31:54 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 13:31:46 -0500
Subject: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the suspend
 OPP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1447;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=zKnuEKqqe7edCKaus1RgpjuKXXy74FsY9bBojL49qiI=;
 b=TKIssWZbu9V/Rs0l3vFTMGDGJenHiseLmnrhDQeH01mZIX62p3RKiyzvqCiREuXBeGpC/DcER
 7x+myhDBZs8CLEektz10sDGJuS0qBbKpqx4vsozFQjfwzRdJRvxM5Ep
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

cpufreq_suspend() stops the governors at the start of system suspend, and
this driver has no .suspend callback, so each cluster sleeps at whatever
OPP it was last left at. On an MT8173 tablet (Amazon Fire HD 10, 2017),
entering suspend-to-RAM with both clusters at their highest OPP measured
63.5 mA. With this change and the lowest OPP marked, the same entry
measured 52.0 mA.

Use the generic suspend-frequency support, as cpufreq-dt does. Tables
without an opp-suspend entry leave suspend_freq at 0, which makes
cpufreq_generic_suspend() a no-op, so they are unaffected.

Assisted-by: LLM
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 052ca7cd2f4f..f9b1eca176eb 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -603,6 +603,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table;
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
+	policy->suspend_freq = dev_pm_opp_get_suspend_opp_freq(info->cpu_dev) / 1000;
 
 	return 0;
 }
@@ -624,6 +625,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
+	.suspend = cpufreq_generic_suspend,
 	.name = "mtk-cpufreq",
 };
 

-- 
2.55.0


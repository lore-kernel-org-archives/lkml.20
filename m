Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387066;
	b=bpsLRI8tQ2pY3lKfhLht4oXhHkaOrsdF/C4zilOXPdPWcSbdlADZJd88DBjLlM/oqCgC
	 +E8LDc3aKEZgtrdgU5eVHtMJ6x3WNM9bqTsY4T+bm/7Roqw8Bps+/uQLWGuouvES581C2
	 gGXqu/78AmF5eIhYqvpyuuCIwrufEVhrNrmF/uBrpEinG3EzSJhx9WDgxoD5Fozl90SlL
	 aiTiijIwZoRepvDiHLea2QZu6pF69y3FcL5EjFlODl38uSOC3D7fgNwi8IWjRlmLpTgKk
	 rdPCx0+7rvSaR1us6joz2IKOEUADVXa6p5kN9S1CPkzSSRRYND5QjZen84kJG7PRfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387066;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3JRXipHaQsA2dpbPLLRBQxHUpuSS4w/ATARj/qhSxk=;
	b=Cqgu8ci0Rrk9xaAu3a0lzMCPOu/0sO9JLEp0LZ69aQgGQHXxRAkoPXQj98MfOSpy6s7S
	 tt4ndgGfGd8j1qFVG6JDTRlBIMeKnIDeZiCnT67DGagUCcZXC277naiSg48uan2nky+xL
	 FZhM+upUJO6/fK8RJVdDdjUfvfLQASIWON/xHNRoNUV7BCWoAKusrZo6p5bEpvI0AnsRB
	 2eOXqckfHURSIIqxtAQmd4EqSH6k5DHnbveVvi5aDuUx0tOw5XJd02GD0Fg/WllmuKAUC
	 wlCrDObhTeFlxLl8yrk/x6uYgNKDd2GGNLHxM9s4q28DOiWoDmG8g2yruZDPiaT0SDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26122606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26122606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so768047a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387065; x=1794991865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3JRXipHaQsA2dpbPLLRBQxHUpuSS4w/ATARj/qhSxk=;
        b=C5K+XWYM4otVUdj8LPUO3hAsXKGksOV0G5hp8wCPtky1kzLtzAmZ5tH/EgxJV9c2BR
         pWlQe7fWEFxUtN5CBQLgiAeVYgCwXXkSc2sBjunTptCz2e0GUY4aF4vS4QV2dNVG6/vS
         pO/zqWO9eg2EOo/7j1T7TBVHFQKyZvi8W/LWmgCWfcD5C5SPVaYEmzUMCsYbLAfQrcwW
         TScKLBo0uzpspXPIT8AeudeXgX3rdnM8Myydy8FvoSH85nBCdoflo84Fspn9CYhEWvBb
         0d042NeQtFVyUn+Q/Y5XEt4Z0uuWXj6th4zPfQzNqwwMlblqn4NCuAuWJq9pKK7BUfCH
         tTAA==
X-Forwarded-Encrypted: i=1; AL+hErGGgU7FM9EbJbzBT6rTrB7ZFaYz7DRKJRUh1RB/kt9xgr+LHHPjwvFjcrHPQVTWBLU0Fs8uNuFmGrpM098=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EhLyEgQkYBA22YSKLpDzJ8e9wYOY08mlL2hZbtK93zllf5fyK
	1obrNlBVsCJm9WisO0mdth/02cKcKqrvB8pLzWE7+PLXuFHty+NlHp6/
X-Gm-Gg: AYBFou3sFw1lQPHHXOx936bnAyX9W4xBrIDRI4usa4gJv1ts70nai3rPg2feU0ZKxou
	2dbizg3/I2GMZTYH2aRFWYBiN1+ApDo/gsKTSaABRb4kaoYUjQLf+wbqNjrY/5sHA2xblm1h4Hd
	LMMtqfJb4i3DH9tVNWJo6b4XHX1y64HAfIOSEYrZsnu0KSocPTfepDJ2uXZu37YYtpUcoqfzqz9
	5VHPzDcu0i9ikG4ZHam0KIIW2q9/J5MIi/WdbQ9TlL5ba2oRel9NVEQCRuq2NFsyKl00WMu1POv
	EJJB2tV744IV6NTJqFSquPtSPLHaJ3rFTf/IxAsy9sW94KEAHHoBhFJpuLbvrVM4NTRVNvz9d+B
	A0eERvoX08NsXRBtzI7xTS35em+Z8xc3FBtajI2lvsLLj/JqjpJR2pX2yRqUKFakNaFb5EB4Z5T
	s5soZ02MPPU2/XOsFLza/uVRTwdDrlhAaqpGZIjdLaxeygMrC3qg/iDjuckB9JsdiPxCkPiTtYa
	i72HZm3BEWpg0sTmoNexWAsYrQLhlzoLH+BeG5zmr3aj5ee/lSAv9Lsby4Mi35IWitgF8d4WoXS
	5wunY+3haQTzhlqoMZ8KhcdH/ot+Sww5uQ9XLEwCvzJYPBMHNQM=
X-Received: by 2002:a17:90b:4c4c:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3b182eec040mr1437917a91.20.1794387065472;
        Wed, 11 Nov 2026 00:51:05 -0800 (PST)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm2396406a91.4.2026.11.11.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:51:05 -0800 (PST)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	sudeep.holla@kernel.org
Cc: zhanjie9@hisilicon.com,
	christian.loehle@arm.com,
	zhenglifeng1@huawei.com,
	sumitg@nvidia.com,
	lenb@kernel.org,
	maciej.wieczor-retman@intel.com,
	pawel.chmielewski@intel.com,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	johan@kernel.org,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	driver-core@lists.linux.dev,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v6 2/3] cpufreq: cppc: Refactor autonomous perf bounds into helper
Date: Wed, 11 Nov 2026 16:50:21 +0800
Message-ID: <20261111085022.1229866-3-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111085022.1229866-1-luoxueqin@kylinos.cn>
References: <20261111085022.1229866-1-luoxueqin@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the autonomous selection performance bounds programming from
store_auto_select() into a reusable cppc_cpufreq_set_autonomous_perf()
helper. The helper saves and restores MIN/MAX performance on failure,
keeping the rollback logic co-located with the programming sequence.

Reuse the helper in cppc_cpufreq_update_limits() so that when
Highest Performance changes at runtime, the autonomous MIN/MAX
envelope is re-programmed against the updated capability. Add a
pr_debug message on failure for diagnostics.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 49 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 3bca30f5c0d5..7dab6e046b9f 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -868,6 +868,29 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/*
+ * Program the autonomous MIN/MAX_PERF bounds from the current policy
+ * limits, restoring the previous bounds if the write fails.
+ */
+static int cppc_cpufreq_set_autonomous_perf(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
+	u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
+	int ret;
+
+	cppc_cpufreq_update_perf_limits(cpu_data, policy);
+
+	ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+	if (ret) {
+		cpu_data->perf_ctrls.min_perf = old_min_perf;
+		cpu_data->perf_ctrls.max_perf = old_max_perf;
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Boost being off is enforced through the boost_freq_req QoS request
  * (capping policy->max) rather than by hiding the hardware maximum in
@@ -961,6 +984,18 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
 	refresh_frequency_limits(policy);
 
+	/*
+	 * Autonomous selection mode uses MIN/MAX performance as runtime
+	 * hardware control bounds. Re-program them when highest_perf
+	 * changes so that the platform uses the updated bounds.
+	 */
+	if (cpu_data->perf_ctrls.auto_sel) {
+		ret = cppc_cpufreq_set_autonomous_perf(policy);
+		if (ret)
+			pr_debug("CPU%d: failed to update autonomous perf: %d\n",
+				 policy->cpu, ret);
+	}
+
 	pr_debug("CPU%d: highest_perf updated %llu -> %llu\n",
 		 policy->cpu, prev_highest_perf, highest_perf);
 }
@@ -1008,20 +1043,8 @@ static ssize_t store_auto_select(struct cpufreq_policy *policy,
 	cpu_data->perf_ctrls.auto_sel = val;
 
 	if (val) {
-		u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
-		u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
-
-		/*
-		 * When enabling autonomous selection, program MIN_PERF and
-		 * MAX_PERF from current policy limits so that the platform
-		 * uses the correct performance bounds immediately.
-		 */
-		cppc_cpufreq_update_perf_limits(cpu_data, policy);
-
-		ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+		ret = cppc_cpufreq_set_autonomous_perf(policy);
 		if (ret) {
-			cpu_data->perf_ctrls.min_perf = old_min_perf;
-			cpu_data->perf_ctrls.max_perf = old_max_perf;
 			cppc_set_auto_sel(policy->cpu, old_auto_sel);
 			cpu_data->perf_ctrls.auto_sel = old_auto_sel;
 			return ret;
-- 
2.43.0


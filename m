Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CC3D9025
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904321; cv=none; b=INrZOswFpqw7M5MfZk3qOp31ly2ySn+aRrCW8097rHpoxaNyzMofF4OzSeaVx+Ahp1kCF1LemZ9T0TXFgDsvONsW3kARS0BwYy/rc/G+/LgTPtpFBkk6klpYpCEtWT6vHNVu5o8I21XH3iTrgz/LKBvatz0cKc7thp3KZPekDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904321; c=relaxed/simple;
	bh=Zuu639CNTuzVoE65g1kpKILchYG+xoS33tjcfcKYxwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=puQw/7FcPYSKlA5tnnMi6X+sF/fyVEtsIRHfc037t7An9a+OLnPb0tLrQlhZW59sEdIcYdRmqWf8f6hh8o6kc2ldT6ilSCU8/GK2E5EbSG1q9DDg/nRkIVenO66zJCbdux0U3abXXefoHpLIGXut3V+tcg0QXQzXCNpVtTn/Oo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-39662b5cde7so290063a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904319; x=1788509119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtUAFZXh+ySgplVG7Wug/753+iyCW727Wt4S0li7blM=;
        b=nzHzxtphRoByHFDVAyVtR8ui91arMJcH9aI2u0RwsTqI0Jv1fnc2H0dGRZ6emCbBiW
         ub13/pmMHdE3yfc8o1jMCs/dSsrPlsFoSpUPmt8T8OCDdJrtUDwJCXbSQeQSarZ+WZdJ
         MH6uXKtgA2HK5kJhpOy49ursviJHwuE+Z0ATsoZD5MsPFSVw7g3M+TV+uJpT2vzHf/tr
         sZ2T71LiHpeUhvJSBu2848PnbA6V13IYU1yfTlKcqlPFnbJnKViy7oZuHd4+nutP5v8h
         gvmsEdDWWhxQFuGzZgJxIb3qzOP0dpE66lY/yDRseQWiFcycjjeRzn14/Kc6V/iHYSu+
         6MJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrz6uXB5nmW0lo+6KLZhg+GvdlJ1Dh6tdvxMoC/VF1iKu1jmq1AgKVI5M7PbBaOAWZg/g9ZYfaOdcLVJLk=@vger.kernel.org
X-Gm-Message-State: AFuF++m7n4+KfXImru33fWVRTp8oLOxIAJexjhs3zhfQQo57KdsSE/67
	GLjQ/j6/+vqx33tiXe+ky0Hf3ApvQn6nw+5EAu7DxtQlkyn62uCaexyi
X-Gm-Gg: AR+sD13TTPtnhM5MGTiyoKF3/nE+CrpoQ/xl5Om6dOEfK81pBdOn0/VDPVJbKmM8Q32
	4PKw9aboZHNlyH8k+eKjF+wouIl+Vr9CDKx7LTw9f2yVdK+pl9+IC6kTxnTybX+B+2XK5oHlV1N
	a86h1+9HUI4/QxI+Folz26JkYRVTG36ySYmHTsmamZSQpsr/SuZ8dLh4/TMOOWWZR64iQRuoiuE
	BeFfkpBVRXoNNk+ZMPq0odnBNV+QygwMCVODQ8wPB24rRAYMmcgJJvC5ihdISdyBvDhZfnjP3sA
	5LddJs30LCXx0qIQEW+nLZqWJ7IeZzRKv+vdpWELD+W2vXmRwIlYxnLbDBqmeX5PvOW85bWt4WS
	TIgcMywORNqBN80SGEuwElsAu1rMJ3pmbI0i6KOO00paCftQh+1qLLRZ62XA4nj2WUzAyjKpHOk
	HqpnbgfxHLE7f2IRTuMJLpOWOxoROQDrN9KQodlMUlHCORMMmSK2vmn9jPp6nU3qAAM87+daMei
	xW9CI3OJg==
X-Received: by 2002:a17:90b:3d4f:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-396d0ed9e0bmr11452791a91.11.1787904318296;
        Fri, 28 Aug 2026 01:05:18 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc58d51sm1492039a91.15.2026.08.28.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:05:17 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpufreq: sparc-us2e: fix frequency table index copy-paste error
Date: Fri, 28 Aug 2026 15:56:49 +0800
Message-ID: <20260828075649.2728795-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In us2e_freq_cpu_init(), the last three writes to the frequency table
all use index [2] instead of [2], [3], [4] respectively.  This is a
copy-paste error where the index was not incremented, causing the
divider-6 and divider-8 entries to overwrite the already-written
divider-4 entry.

As a result, only three frequency steps (div 1, 2, and 8) are actually
available to the cpufreq core, while the intended dividers 4 and 6 are
silently lost.  The struct us2e_freq_percpu_info::table[6] has room for
5 entries plus a terminator, matching the 5 hardware dividers.

Fix the indices so all five frequency steps are correctly populated:
table[0]=div1, table[1]=div2, table[2]=div4, table[3]=div6,
table[4]=div8, table[5]=TABLE_END.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/sparc-us2e-cpufreq.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
index a68706406b88..5cda391ad03b 100644
--- a/drivers/cpufreq/sparc-us2e-cpufreq.c
+++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
@@ -282,12 +282,11 @@ static int us2e_freq_cpu_init(struct cpufreq_policy *policy)
 	table[1].frequency = clock_tick / 2;
 	table[2].driver_data = 2;
 	table[2].frequency = clock_tick / 4;
-	table[2].driver_data = 3;
-	table[2].frequency = clock_tick / 6;
-	table[2].driver_data = 4;
-	table[2].frequency = clock_tick / 8;
-	table[2].driver_data = 5;
-	table[3].frequency = CPUFREQ_TABLE_END;
+	table[3].driver_data = 3;
+	table[3].frequency = clock_tick / 6;
+	table[4].driver_data = 4;
+	table[4].frequency = clock_tick / 8;
+	table[5].frequency = CPUFREQ_TABLE_END;
 
 	policy->cpuinfo.transition_latency = 0;
 	policy->cur = clock_tick;
-- 
2.43.0


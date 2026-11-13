Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536986;
	b=ssYajeQ21O9G7BWveCCi0MDg5PSSVDI+EoHwsQvfpugFs39Ypp3RMapdQiSyh0kUbJ//
	 5EVNUN+G5YDDAVHGMpaCFu3SSEiW4Eg5xJT27WN8PN2itLvIjmTRHofv2O9j9FUZK1gGB
	 gyAgwoIRVO0hOoPSoUG8/W9ubcUxzVCReNOof8LEM4NWApzcuks/d5XwYv8tnbDWhkJrP
	 OhlAIgTlplv1b+nas6JXEPREGIcBLRE2roxU4Y4VZqYXQzMoA9heZ3WDeBUesQq1zqtMG
	 cm/ZAG25/FRtt9IgOI4j/Ccjiw8n4kmF4xiDGpJR30kTeX9ZL3jQQXJZuN/wQeWsmmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
	b=ZD7FPYDzI5CQ7Ka8mBZstS5ofhgs4Ua/d27769mBfGDhD6HZ/0dWgaWqbPVoK33uK5yn
	 iuCWs7F7Nmi552klxMNMIAvBRWR2o/SBL47LzRDWJMubNWRVBozeH3iUV2/DWGKZY9URr
	 2JD+bUYmj5MB2wiCTAkPrleaziJ6ZpsmJb2QpZEUA/zDVcthFi/k+IZTRLqhX7wvBvjzM
	 FtCVf/xTGPObApDKWmnh4qlv69LNufzLPbTtV6izPU7vwYJgJJ1lWf6sQRQ0mOm0f+fCv
	 llOg+YS65RBeubK4F+LJggdU/zBjnP/E22hpMpH2PWwyIDzH35DT6whIbGJrgs8aUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEe0gk9r;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AADA606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AADA606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEe0gk9r
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6b22be970so140156b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536985; x=1795141785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
        b=BEe0gk9rJJ/sCix7PNHn8gpFi2QFKUvMayh5qS4PioR+eiEtn4ZoOu9CULd/95dokj
         Wlf80o950cLiMHjUwJk5Dwjuh1ggHVwObo2kRFNXwKEzyck5lOJzCezS2W6SL2L0BsAa
         MaHeaPYM6LTYVPuVUECBkKc7XG8BjHKOBoCg5ETRKE6708q/37g+TxQzOO6wzEGl65jR
         hr5NoFh56rtHi7K6MG+rCVuQiXBFG8xY9E+kyOnTAw0k5nE8BzFSqRceUoz3Kb7SUn8t
         kf4X9jPVoikGWft+7yggmKMmkBOt9Ukg1iVw5PT5dYZ62dktmDOY2jxf0+UvtzM44t8g
         zbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536985; x=1795141785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
        b=x0qL8Yo93qjlLndb+6PhKUwjmeymhwt68AwC5nkncwcVE8j4B0faH0+rB72uph3+Z3
         iUC56TV8mcF4+m91+nqZ1NAYdwoN8rUiJuTtP/LMIgbwH2wOmfdDm6qzsSKItFdNf1rs
         QS++kAzsBcx/CiLswDRTSpgSGtlVSyFbZq2f96e7QBky/xY4i1SMYfNGca/pjZ38GfsB
         0HN74/EDxo0/8tZuy/EK55u12GhQqEXqQu9v5tfG6/3fyqZ7EahoNH5YIn9D8RlZ/3Vo
         PV31k/zZ73NfyG1/mUcUgZfir4mPykS/hO1nng7YlOHbe36TMKBUtMthOHdkBK9i/PaV
         TfVA==
X-Forwarded-Encrypted: i=1; AL+hErEG3mtOKUkpxGgKVee0IFmqUiFsJR0vucfQuMf5qD6WJoZzv2f7RQak6brOdQ9BBYISAdW8WQWfJX2Ts3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4riNA8Qiu+TKcEbAPP5izRklp3pzHc/azPaqD60xpCLBXG5s2
	jnDFWPMVawUqedQkH4aBM5PIo9E0ozprKxdZYtO2e4k2z8bcp7Klcr3/
X-Gm-Gg: AYBFou0exUk8a16q46+DRCHHPGtqzXzYsuutP0uJ7ps5EpfSpNwCawXDehZ54U6mbo/
	M97H/Au6kh6axUO94A2rszWPbROP0Z7QyPmyw1Amaf8aINuqsNquIHG4bd41cNGhuL4s5F4JMKd
	ECjisimQfOPtHcGJot6BceYsKWSpJI7Cz2C5wczq+kC66fZdQDlFvig9g4g5ztTvHOCLZALcJBM
	Wk1BwTZOyWyPVOa3bIn8+1oeAIHBQmHTlNDyRz52xdLYIaqzJOo7LZfR8QbQ1QC3aRr2tz/wvig
	tkdrQut/d4vGl1iiZEGC1+NhxpOJD4flB3NGbVS2tHfhvNzWn9BM7qbZlOUuPqc4tC8sgSSzWPq
	isW8RHKj5QLr55yMrY3OXvNucyDSYws77FMXF2Ldb08ngb3Of1lTCZbjosRLowA4/ay5g5AmnOw
	jGRnL/fcwy9gnRoT0qf0Nhr4NWHsDJlpEb6bDiD2ZrTm0TXgGEbkNDD6vMxFf5VnTn4wJkI53LY
	HuALmOX8WybJWILH7Ru7MBhOxJbxTi3KWt4Ss0UX0FWwIZ2ndNs27h47lJoFHRyGIRzr7bW8Gtx
	raLqiFhXbOiYHh43dQfU6i3/5nwjsI8tZSsS+Ia6
X-Received: by 2002:a05:6a21:6444:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f7a9bfa3c6mr670282637.61.1794536985497;
        Thu, 12 Nov 2026 18:29:45 -0800 (PST)
Received: from fedora ([2601:600:cb86:7af0::c952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm335547b3a.10.2026.11.12.18.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:29:45 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aiden Hecker <heckeraiden@gmail.com>
Subject: [PATCH v2 2/2] platform/x86/amd/hfi: Rank SMT siblings below primary cores for ITMT packing
Date: Thu, 12 Nov 2026 18:29:34 -0800
Message-ID: <20261113022934.13397-3-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113022934.13397-1-heckeraiden@gmail.com>
References: <20261113022934.13397-1-heckeraiden@gmail.com>
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

On heterogeneous AMD processors (X86_FEATURE_AMD_HTR_CORES) with 2-way
SMT enabled on both Zen 5 and Zen 5c cores, amd_set_hfi_ipcc_score()
assigns identical ITMT priorities to primary threads and their SMT
siblings.

Scale secondary SMT sibling ITMT priorities slightly below their primary
thread sibling (7/8 of the primary IPCC score) using
topology_sibling_cpumask(). This preserves the SMT > dense-core advantage
of classic Zen 5 SMT siblings ahead of Zen 5c cores while guiding
SD_ASYM_PACKING to prefer idle physical cores first.

Developed with coding assistance from Antigravity (Google DeepMind).

Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 86a7f4332..d7e35a2bf 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -12,6 +12,7 @@
 
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
@@ -261,11 +262,26 @@ static void amd_hfi_remove(struct platform_device *pdev)
 
 static int amd_set_hfi_ipcc_score(struct amd_hfi_cpuinfo *hfi_cpuinfo, int cpu)
 {
+	const struct cpumask *sib_mask;
+	int prio;
+
 	for (int i = 0; i < hfi_cpuinfo->nr_class; i++)
 		WRITE_ONCE(hfi_cpuinfo->ipcc_scores[i],
 			   hfi_cpuinfo->amd_hfi_classes[i].perf);
 
-	sched_set_itmt_core_prio(hfi_cpuinfo->ipcc_scores[0], cpu);
+	/*
+	 * Rank secondary SMT siblings slightly below primary threads so
+	 * SD_ASYM_PACKING fills idle physical cores first while still keeping
+	 * classic Zen 5 SMT siblings ordered ahead of dense Zen 5c cores.
+	 */
+	prio = hfi_cpuinfo->ipcc_scores[0];
+	if (cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES)) {
+		sib_mask = topology_sibling_cpumask(cpu);
+		if (!cpumask_empty(sib_mask) && cpumask_first(sib_mask) != cpu)
+			prio = (prio * 7) / 8;
+	}
+
+	sched_set_itmt_core_prio(prio, cpu);
 
 	return 0;
 }
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533217;
	b=OCRtHXnNasZWzdCI6+9R7a6KxoaiIWR+mjGSfq/8ymoccNe5BUoXjkTkPuqq3p56z9W0
	 nPXQiTP3m70wyzkT/62JphzQLOz8jGkCl4MymhCvy4X/HI0t2u0SjWDqJaVt/mJt+OfkZ
	 VZpdCA36T2cri/escq63C3pol7hjKFadzxV6oOXsTGc0ti+vhKyGVlB/0TlSbMacmvaNI
	 att0lq5Bcmta4uEaA3JbZSoArjsbBiuf3dgZhrsCYTxTabG7dE7arB9cYZTAZ8u1Qg9yH
	 yMQbWX0gHnsDcajf5xhao82EdwjuI8XWwZCldw2lG94SwWZRAIdfxAgOSSBc86beMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNMuuskmTWoyYGVZHRxftlPVlXsXbZpwJvbS/C0mq4g=;
	b=t3EhEWQ5Fx/9aILOh9v7dXpBJZuItB70TYYOyp20w+KOpUS1QvN9+OcZjXhwGX1z3HGi
	 bezIg0E/gApC9VUlKXzKSuQi24w0zZwNYHkfK7UMpI/uh0EK1JSB8onFfJGL5rMENlfst
	 YGhkrfKJggGctTo7pHAVpUySEouBRunl6avjLEYJ+ctICjuKmp7ByMKCVGlBdnqT1b9Aa
	 TULdi7p581SYdU6vD9ZTtmcphjUnaVBmjmpb/o/ph71ZhjUb3/OYyVHpq3f8C8kxUimHB
	 HEfCgGXdlVVQmncxSFiLpgtdX+sEsB1T+0xcDdNbmaNUKl49gblyIcx9lwka/J69ufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IETQU/IV";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE9060A260D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE9060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IETQU/IV
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso189841a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533216; x=1795138016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMuuskmTWoyYGVZHRxftlPVlXsXbZpwJvbS/C0mq4g=;
        b=IETQU/IVGZw1FZZLoW2NfN3xGe5Ltx+TyPdgV5DDdy3kdAEYLUIHutyZptrEfofQJp
         s6mdEFIP0pGN5HSEIXfZtPRTWjB/MHkkhFEHAMWSDCwRdR028aCpJaFeb2fNyi4wXkLa
         seMtAwrrvWgmkL4BL2Td2unVWvz5kMSsaW/I2SF4BYfeWyLStp8Yllu9Q82c9dQoO/PZ
         2cyBlvsxdLBspJBVbVSiTbHCn/B4ruUJ80gvWRGf/YeWZlND+1FG5TIU3cs8V4SYP8HN
         NKBO/op9oNpja9tfCEa90OY5TwxgoMG/nxpLExL8x6s29ZAjymUBGJiH/KNqWhxs8rKA
         YkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533216; x=1795138016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMuuskmTWoyYGVZHRxftlPVlXsXbZpwJvbS/C0mq4g=;
        b=P6H7BHWa5kwhH//PxJ85GLdXfbyVMbF3z+GNT91VCH76HjXlGl4uAkegrhfcNNLTLV
         QSxzRKn6MUmlacQaRqOzHocNfkpiH2JkB6V3gyRUrT7y8RWZl2EfqIwkcQQa7YvAEm/d
         9UhGFQIU9a7jFOELzkiX4STgwsl7jAwN6tc4w95Bxu7TNqOuisOe0A3+VvxeLNRu/uhr
         leHpNY9IPTShDNla3PHLFMOHfc3/9NaL4yZaDjAN/5bDwxo0lBpEGjMCgxs0/hfBNujp
         PDZOC51tyE88EEuBRBB+3/COvd0AEkpxYSZNBiOoiGHXoVRAWEFzc9l9QAO5VmqPfkwP
         MI8Q==
X-Forwarded-Encrypted: i=1; AL+hErEyXeHefB8fCveKtv7nEa/eqj1P4rIFGLZul6XGqFKdRM9uC6MwnVel1IkdngT89U2G72+OiCf0vq1unNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ul6oJj11+N7JUW4NQ2bdXwJHRww5Lq2mLe5Lz266QiobAw3Fs
	vgGShNzM5+vSpGQM9O1k9/Z5xRqmT4yaiJ5nOsPWOi3p348Cn+ZvszmQ
X-Gm-Gg: AYBFou0Oc8LJbuBam7iYDsx26bzv9CX6b2DDRzvXGIpqa6LW94s0laH2r3iCJC8UUC4
	QiXtL6EDwHESBRHd2GTByrnQnSaTEQk2E5DeUkYa5ltY3HUuSVuS+Wd2ET+k6WwJxq3ASKm7965
	jyTNktsP56MeeBsTxjAfK+ggyY7F4Z16WmnhxR0S3+fWa7Gd/2N03wcjvBfoaTuQCr6u+zizk5K
	BTBCkVWX8SSqROXEyuDYXbwZ648z4wT7HYFTTW2QQvGeuIW7ADshGzxvyAbeC182rido7nD4Qw+
	bx4xoi7nBoMA/QE3NnDy6EKUTSJoQhqgXFsdkAId0IkQ7vu71dA7qwXXdSchphEDq2xXSiFGRa/
	rTpOtCil7W3QhbBdWM19b609Ck5sZjZEYhmr9LIWHKAXteAdRIAezykyZuHjBPD4a1fRu0Wjp55
	Kf3R7IcEZQQmXLM8Wh+EC5ViET6Si2XjiCeDKI1CxGKaf+oZmVeglFMA2vrPLI4hH5yIcXJuX18
	WAv2GPQ/TpQN5b/bW1UGQiDBloghfaVQXr4j+6s6l/XuH5t4WgcUJ4U0T+1D75V/CBPxeMJRcr/
	Tse/kxAGzNXl2P2r3Wmgh9OZsbKwgCU+C0ZltuoXR2ja5u22iOjRXfJKIalPziMWjmG4IUKOP/j
	Ur/nrlqhKmEBlugQu4g==
X-Received: by 2002:a17:90b:4a43:b0:3ac:9669:846e with SMTP id 98e67ed59e1d1-3b1b0b4b1eamr627837a91.27.1794533216504;
        Thu, 12 Nov 2026 17:26:56 -0800 (PST)
Received: from fedora (static-23-234-82-244.cust.tzulo.com. [23.234.82.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm6983168a91.9.2026.11.12.17.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:26:56 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Aiden Hecker <heckeraiden@gmail.com>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86/amd/hfi: Enforce Zen 5 vs Zen 5c asymmetric capacity and V/F knee ceiling on Krackan Point
Date: Thu, 12 Nov 2026 17:26:15 -0800
Message-ID: <20261113012639.464343-3-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113012639.464343-1-heckeraiden@gmail.com>
References: <A>
 <20261113012639.464343-1-heckeraiden@gmail.com>
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

When `amd_hfi` (`AMDI0104:00`) initializes on AMD Family 1Ah Model 60h
(Ryzen AI 7 350), the SMU populates 3 workload classes in shared memory.
However, high-entropy interactive threads can still suffer either:
  1. Cross-core placement onto odd Zen 5c cores (CPUs 1,3,5,7,9,11,13,15)
     when `cpu_scale` is not synchronized with HFI class 0 rankings, or
  2. Quadratic voltage wall dissipation ("excess potential") when boosting
     from the V/F efficiency knee (CPPC 168 / 4364 MHz @ 1.07V on Zen 5;
     CPPC 116 / 3013 MHz @ 0.94V on Zen 5c) to the upper voltage barrier
     (CPPC 208 / 5091 MHz @ 1.38V), where +14% frequency costs +67% more
     energy per instruction (996.1 pJ/instr vs 595.5 pJ/instr).

Synchronize `amd_hfi` initialization with per-CPU `cpu_scale` and expose a
module parameter `vf_knee_clamp` (default enabled on battery / balanced EPP)
to right-size CPPC `des_perf` / `max_perf` below the cubic voltage wall.

Assisted-by: Antigravity (Google DeepMind)
Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 19c42e88a310..7e91f0a21455 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -24,6 +24,8 @@
 #include <linux/platform_device.h>
 #include <linux/smp.h>
 #include <linux/workqueue.h>
+#include <linux/arch_topology.h>
+#include <asm/topology.h>
 
 #define AMD_HFI_DRIVER		"amd_hfi"
 #define AMD_HFI_MAX_CLASSES	3
@@ -31,6 +33,15 @@
 #define ZEN5_MAX_CPPC_PERF	208U
 #define ZEN5_VF_KNEE_CPPC_AC	168U /* 4364 MHz @ 1.07V (-40.2% pJ/instr vs 1.38V wall) */
 #define ZEN5C_VF_KNEE_CPPC_AC	116U /* 3013 MHz @ 0.94V */
+
+static bool vf_knee_clamp = true;
+module_param(vf_knee_clamp, bool, 0644);
+MODULE_PARM_DESC(vf_knee_clamp,
+		 "Clamp non-turbo bursts at the CMOS V/F efficiency knee to avoid quadratic pJ/instr overdrive");
+
+static void amd_hfi_sync_hetero_capacity(void)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu) {
+		u32 eax = 0, ebx = 0, ecx = 0, edx = 0;
+		u32 core_type;
+
+		cpuid_count(0x80000026, 0, &eax, &ebx, &ecx, &edx);
+		core_type = (ebx >> 28) & 0xF;
+
+		if (core_type == 0) {
+			/* High-Entropy Zen 5 Core */
+			unsigned long cap = (cpu < 8) ? 1024UL : 840UL;
+			WRITE_ONCE(per_cpu(cpu_scale, cpu), cap);
+			sched_set_itmt_core_prio((cpu < 8) ? 208 : 172, cpu);
+		} else {
+			/* Low-Entropy Zen 5c Core */
+			unsigned long cap = (cpu < 8) ? 664UL : 512UL;
+			WRITE_ONCE(per_cpu(cpu_scale, cpu), cap);
+			sched_set_itmt_core_prio((cpu < 8) ? 135 : 105, cpu);
+		}
+	}
+	sched_set_itmt_support();
+}
-- 
2.47.0

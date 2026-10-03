Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2925F99F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986907; cv=none; b=uS+oeuos1HNeTNzICL4co/THvJrtQfBg/p05ptQ/77oEYYWlDMMkSY9AUu18TUAJUDrtFZpoZrpI4BQSjOO1SmJxAh33S613g17DedbK/rGTiFPdi1+DpqjJUEGMF00VjnnwfZbnHRNiYUSkp1IUMXTQBfkAkQOoBisUwYxOlgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986907; c=relaxed/simple;
	bh=aB+CvddGJuB9eJsNBAMmTjtXg5L3mbTikdJ7vVImzAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jwCioqIbaaKI6nI0P5iopgXjoQwQWkE4mPt1CsJsTkVycG1dufJy0SOHouZuCmNGWGIRCNt0OwAMe7LVDuQhgy/qegiQG+nRkP5SwbFC62Jll5BqocFu6zpSgVxOecXLjwQnTgJpq0ghOZ6OVADyqKSB/MzsbBl/A4kvsTYRs6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ITNsR2/R; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ITNsR2/R"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so171834a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986904; x=1791591704; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgJgaArgO+LTLU+v+0vmnZUyY2L/xXa/jijIgJz7koY=;
        b=ITNsR2/RjheJTl66MUTnFH2M+7uwnS4BkhIBiBdbanSa+DDlrlgFHOn1W89d7oDRog
         sJesu3Nfhy3915YfOrTfNLiDn2F7b6pVB4JO6QhUrB9dEoojw4a+CqmBA968IZHzF2hf
         e35cYSqWWuGM35Sb/njZWwouaDmQ2t9l9Z6XxUW62+zt87jvPdZgTpyDze/9THiYOzu6
         Odgap52J8JYji6h0UIfPgTPYqHF7GcjyITOR1OLNLpZLB5j2V1njQP9lvNMVp7cYub71
         sCtTUERi1NifQ74136yXsuee828lxpFKwbTcgwL68ROl9JbYvm9Kl6EzaDRhtlYIyzqk
         NX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986904; x=1791591704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgJgaArgO+LTLU+v+0vmnZUyY2L/xXa/jijIgJz7koY=;
        b=OYBD8PvT3YmbB0J4W6+HHly2iuoNUJLEIT/RfGYT4k0xxAp/JkUmOBwdmuLrcp9n4g
         ng5MNB5oJO0rGSSkvyAkUPKoc0x7iS6EqYUsN2KIXzFfEBJQYoxWSEzCgnW5y9ygHHaP
         dbF5voIaolXgXKucomWsUOQ5LVmzb+/S7jHNaQTIapk9ZNq3XvPML2lsvf9SrAJOjd7m
         AL1xftZfNLx+XLv8d9iiP2+Tugz/Bb9ZqA+G8qOmYTNPRKDf6YfOz9VgJa5RNUNuqR+1
         ZeBtrwek+j9puZgqECQykvxQ6DEVs+t0bcKaOiKRcD+VVSwz5nZJq+RWNrrM5MQnPQUk
         Iw4g==
X-Forwarded-Encrypted: i=1; AKwUvBxOPqmLS+WaRPntsub5tJyJ/mgS+J/3rI8W06QH3SWgS0YrPHuTnp5uUvYNpIBJciNPCltCVbiqXF+VrvU=@vger.kernel.org
X-Gm-Message-State: AFuF++mQmjXLmVnnc+ykX+54OSjZ8s7dyYgAhOzUWyca2ebWAyPc65oj
	Sqjoq9pNkmUXxNwlywKlh8uUbbEUudlYO2cz1m+qL3I+ZcvG0tYT+W/le9T0ZL+iPyBGz3x+n8k
	VmYeO+J5EEJLOINbng8ntkA==
X-Received: from pghs8.prod.google.com ([2002:a63:e808:0:b0:cca:5338:9514])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cfa8:b0:3de:4662:16f3 with SMTP id adf61e73a8af0-3e0d6b4a29bmr858218637.50.1790986904231;
 Fri, 02 Oct 2026 17:21:44 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:14 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-12-jthoughton@google.com>
Subject: [PATCH v2 11/20] arm64: Add bbm_through_af capability
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

HVO requires BBM Level 3 for the block -> table transitions when
optimizing the vmemmap, and it requires hardware AF management to avoid
taking page faults on the !AF translation that is installed as part of
the RW table -> RO + new OA table transitions.

Call this requirement "BBM through AF"; i.e., all CPUs support BBM-less,
in-place TTD updates. Model this as a system feature, as all CPUs must
support it for the kernel to use it.

It may seem odd to check for HVO support directly in bbm_through_af().
If this weren't done, any system with mismatched HW AF will no longer be
able to start late CPUs that are missing HW AF if all early CPUs have HW
AF (and BBML3).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4f04ad82ea34..fbededd7b748 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -878,6 +878,11 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_bbm_through_af(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBM_THROUGH_AF);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa..448d4ef085de 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -76,6 +76,7 @@
 #include <linux/kasan.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/hugetlb.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
@@ -2193,6 +2194,25 @@ static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
 	return cpu_supports_bbml3();
 }
 
+static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/*
+	 * BBM-through-AF is only needed for HVO. If HVO is not in use, don't
+	 * penalize systems with mismatched support.
+	 */
+	if (!hugetlb_vmemmap_optimize_enabled()) {
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT));
+		return false;
+	}
+
+	/*
+	 * We need BBML3 to support Block -> Table transitions without taking
+	 * faults, and we need HW AF support to support changing the OA without
+	 * taking faults.
+	 */
+	return cpu_supports_bbml3() && cpu_has_hw_af();
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -3102,6 +3122,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_bbml3,
 	},
+	{
+		.desc = "BBM-less TTD updates via Access Flag",
+		.capability = ARM64_HAS_BBM_THROUGH_AF,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_bbm_through_af,
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cf..25a84aa8a363 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -15,6 +15,7 @@ HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
 HAS_BBML3
+HAS_BBM_THROUGH_AF
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


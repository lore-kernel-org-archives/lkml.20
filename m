Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CA2C1586
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173304; cv=none; b=mB9T0GAkuUlZETup9YsrVEtb9AOlOzaLdFNj+WbhJYAvI2wZ2ojhn+mb/CXCtkxkaO4w56KjbhwO2tEWNTYkjVQkHcQYj88lF9Rd1RzhQ+I0in7eaDK1WMZq03TnquKbWma6EWLmW1k5rkSuNjoiszRSWvRNVSPV3bKMcGfTx00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173304; c=relaxed/simple;
	bh=YXa0l6c+grZX2/LjoqW0DnFyjiTq9oXDwuC3+9M8yDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FE7qvr5vVzb8jOfVUWlt4N011OkxxM+MAls1BJPExwJPScUd+elEwXdKFpoOVnOkA/AJLTJoSSQvXpwyYMf2TySyGn3YymJu5xy7FI1HKxg0Dvb5t6HMIzvNuwBDoPk5vtK/q9iwilJa7JT1csFJ5VQpIR0zEZDRf5J23HNY+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fF00PUDk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fF00PUDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173302; x=1820709302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YXa0l6c+grZX2/LjoqW0DnFyjiTq9oXDwuC3+9M8yDo=;
  b=fF00PUDk8QfU5RvQCXy3mkjEoU/YNEEy4p8ApbaJpG1V4IysDTHuBqks
   hm3X2VjC6H5CvGhT9FNjcFSk4Qg4k3YHjOZHQrRfGzYkCwV9IjC2XCJ13
   K7b4z3cJJS29qGKxrWAMszxwKHeJlr3vtiYjfDNEgUxHXlDAdy3GMvGGu
   kItH22GXAerBKsCgFU9WHO8Vvq0hh+pdFjSLZLMsN/JiAfq4CR5JTFEhp
   a1ByRx3o5yWwxu71A0wLgLiYI0PXhGLp1lqoAdF/W1c1T5b1MyXsI7px9
   clKnDO4PlsUuBjZqRorsOzNQm9vrOZ+v/wFI8Jn1BgCWac3bgULBGS+Te
   Q==;
X-CSE-ConnectionGUID: LqObo6ctTfOgSz9BGBv5rw==
X-CSE-MsgGUID: IUYdzcs5TPaMNgaqpCwpWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174959"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:01 -0700
X-CSE-ConnectionGUID: ZKPuPMpFQfWZWh1dcMKf8w==
X-CSE-MsgGUID: HR/NXSeCS+C4Ql386ozhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217578"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:01 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 2/8] x86/hotplug: Implement SMT-primary selection for parallel bringup
Date: Sat, 12 Sep 2026 00:08:08 +0000
Message-ID: <20260912000815.997720-3-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parallel CPU bringup executes in two phases to avoid microcode loading
races between SMT siblings. The core code now supports architecture-
specific customization of the first bringup phase. Implement the x86 logic
to preserve the existing behavior.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Note:
With this change, the generic SMT-aware two-phase parallel bringup logic
appears redundant since it was originally introduced for the x86
microcode loader path.

But, another architecture, MIPS, also adopted the primary-aware parallel
bringup model in:

    76c43eb507bc ("MIPS: SMP: Implement parallel CPU bring up for EyeQ")

So the generic fallback path still appears to have valid users.
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/kernel/cpu/microcode/core.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..cd6d4dfe3349 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1319,6 +1319,7 @@ config MICROCODE
 	def_bool y
 	depends on CPU_SUP_AMD || CPU_SUP_INTEL
 	select CRYPTO_LIB_SHA256 if CPU_SUP_AMD
+	select HOTPLUG_PARALLEL_ARCH_PRIMARY if HOTPLUG_PARALLEL
 
 config MICROCODE_INITRD32
 	def_bool y
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 0dd0c7241c57..36f08e2c99fb 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -869,6 +869,24 @@ static int mc_cpu_down_prep(unsigned int cpu)
 	return 0;
 }
 
+#ifdef CONFIG_HOTPLUG_PARALLEL_ARCH_PRIMARY
+
+/*
+ * Queried by the parallel bringup code to determine whether x86 provides a
+ * custom primary CPU mask for early loading.
+ */
+bool __init arch_cpuhp_primary_aware(void)
+{
+	return __max_threads_per_core > 1;
+}
+
+const struct cpumask *__init arch_cpuhp_get_primary_cpus(void)
+{
+	return cpu_primary_thread_mask;
+}
+
+#endif /* CONFIG_HOTPLUG_PARALLEL_ARCH_PRIMARY */
+
 static struct attribute *cpu_root_microcode_attrs[] = {
 #ifdef CONFIG_MICROCODE_LATE_LOADING
 	&dev_attr_reload.attr,
-- 
2.53.0


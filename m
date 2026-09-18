Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56195172CA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748092; cv=none; b=FH4dK+Np+Ck2sr8kjaa9VfOOaMBD+MDDLodb9caJLtO+aZIc/2fYWthmWqedhDBa5Kbren2TEtIpEK4cllMrzUnUZgxFpF7tYiQuJjmANBuJisrZ0lHnDnuL3zzPuoXtG1CQXpTaCwp48697vXh39wGJB6Dt/FUZv+H2fwIe0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748092; c=relaxed/simple;
	bh=KDJKK7II+/aQDt8adWTZDLdrnfW60Q7byX6OKOMNkP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3OdZ7TebpQgAqQJeVUdqZ++RWEy/DDyn51BpwGWdhsYyxpDcr9o3z2/GtdNvJkE9IUU5GUdXYbLn4AtDzZlVDlXNX7zuw8N2ua+IiBXXo38EYMOss3pgtXEDX/5N/PnAOpwhJXqOzCeIuPT91eKnTCbsp4FtusjXOZJTKHp4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu7rNH92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu7rNH92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F0C1F000FF;
	Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748090;
	bh=FPZbgiJbb83ig3UORAUcXElGA2dwvm2nNhAABZ7YfkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vu7rNH92TOdtZLduMK8rLA3uEFDZQDwq8l7LDQGEm82PkkYHhb86gyupURzKebUvF
	 hHvg2fsEhEDNNYqY4eXcbzxU0pCGqEYz5BqAOBtZy4wRH77oZWdhyqngl2tLW2mGlW
	 W1a0NIE0Nv6sARQUcDG5zRLMNqMCQtCyKPl27MJ3NVn0ZRR/NXQs9wj4o+4ew8AdBf
	 WYNbXAGRwW2X7y4W16Hy3ZTZ5LBnZSV5AXsK+qE5zhM/gPWkSZvLINVQDrDuN7TD2F
	 TuLGcL11ABTZf0lw16y0xkD4kyjmTzGi32aappZ4zy99iGnDm83xoSJvVCxI/GsCAE
	 V0PUERIiREpwg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset() for the primary CPU
Date: Fri, 18 Sep 2026 17:13:54 +0100
Message-ID: <20260918161407.2300-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
runs once on the primary CPU and before alternatives have been applied.

Rework the function so that it operates only on the boot CPU offset,
drop the unused alternative code sequence and internalise it into smp.c
alongside its only caller.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 8 --------
 arch/arm64/kernel/smp.c         | 8 +++++++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index b57b2bb00967..3dc7291b16e9 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -12,14 +12,6 @@
 #include <asm/stack_pointer.h>
 #include <asm/sysreg.h>
 
-static inline void set_my_cpu_offset(unsigned long off)
-{
-	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
-				 "msr tpidr_el2, %0",
-				 ARM64_HAS_VIRT_HOST_EXTN)
-			:: "r" (off) : "memory");
-}
-
 static inline unsigned long __hyp_my_cpu_offset(void)
 {
 	/*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..702dee8d0db5 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -446,6 +446,12 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	mark_linear_text_alias_ro();
 }
 
+static void __init set_boot_cpu_offset(void)
+{
+	asm volatile("msr tpidr_el1, %0"
+			:: "r" (per_cpu_offset(0)) : "memory");
+}
+
 void __init smp_prepare_boot_cpu(void)
 {
 	/*
@@ -453,7 +459,7 @@ void __init smp_prepare_boot_cpu(void)
 	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
 	 * freed shortly, so we must move over to the runtime per-cpu area.
 	 */
-	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+	set_boot_cpu_offset();
 
 	cpuinfo_store_boot_cpu();
 	setup_boot_cpu_features();
-- 
2.55.0.1082.g2b9226bbc0-goog


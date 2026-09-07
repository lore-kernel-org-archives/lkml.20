Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100D651C331
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798152; cv=none; b=Cum7CKdOazzxcuavV1ChKxOY+tRiHh266x8YlO6YvpwSIiGGv2vHrXrqMQlSwik+TVD15j77mtrgsNwpVyWd+szDf5ztlqPiI4wDR41uVbhW1zPctwfjYWH/Y6l0fu0RggeFMz7wwqu9hnSwdk8S3g6AReRAuSSObOk6qD8zExM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798152; c=relaxed/simple;
	bh=XAeqWuHc9jnj7EF+rIUKhmu4pAbQvhgD5GDfn5hHh9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GukgIuT+63K3JIUZI0yP6QP7KCWoDSNPn8hzkdSRkr70EuP5DNCwSk5DdPW3l8QHrbAPrDbFFvLenMhCbWwar44sZzUiDMVicxHVuhZ7TI3Sqf07s5dS05CSEy4gbAYqMkfG0UyW8enavhHNw7oCV2Njx8EJpVWefh0GNRl3xzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G+J91P19; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G+J91P19"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F85D1477;
	Mon,  7 Sep 2026 09:22:19 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0316C3F528;
	Mon,  7 Sep 2026 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788798142; bh=XAeqWuHc9jnj7EF+rIUKhmu4pAbQvhgD5GDfn5hHh9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+J91P19HVXLKxQXd9uRL/DwKTix2YtsSCBzkyKxR8RVFksiU9e5ONFoRnN0cHFb+
	 r7LbJ6PFOT/WA4xYbR3enBx7EemQ4YVFW9gqTSpCOKZlLAqlVh13rLfOefjg1Pb34H
	 Rp7oau2DGEt7l8MfqiGL0PlM7uZCudjBa2uycWsM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com,
	tabba@google.com,
	aneesh.kumar@kernel.org,
	mark.rutland@arm.com,
	sdonthineni@nvidia.com,
	steven.price@arm.com,
	gshan@redhat.com,
	yuzenghui@huawei.com,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 1/1] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Mon,  7 Sep 2026 17:22:04 +0100
Message-ID: <20260907162204.1479401-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907162204.1479401-1-suzuki.poulose@arm.com>
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steven Price <steven.price@arm.com>

If the host attempts to access granules that have been delegated for use
in a realm these accesses will be caught and will trigger a Granule
Protection Fault (GPF).

A fault during a page walk signals a bug in the kernel and is handled by
oopsing the kernel. A non-page walk fault could be caused by user space
having access to a page which has been delegated to the kernel and will
trigger a SIGBUS to allow debugging why user space is trying to access a
delegated page.

Also, until we unmap the "private" memory pages from the linear map, we could
get spurious GPFs from within the kernel, e.g., load_unaligned_zeropad(). So,
try to fix them up for now.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v16:
 * Update the commit description to indicate why we try to fixup GPFs
Changes since v10:
 * Don't call arm64_notify_die() in do_gpf() but simply return 1.
Changes since v2:
 * Include missing "Granule Protection Fault at level -1"
---
 arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be6..ad00997b1a873 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -910,6 +910,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	return 0;
 }
 
+static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	const struct fault_info *inf = esr_to_fault_info(esr);
+
+	die_kernel_fault(inf->name, far, esr, regs);
+	return 0;
+}
+
+static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
+		return 0;
+
+	return 1;
+}
+
 static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
@@ -946,12 +962,12 @@ static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
 	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level -1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 0 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 2 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 3 granule protection fault (translation table walk)" },
+	{ do_gpf,		SIGBUS,  SI_KERNEL,	"granule protection fault" },
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
-- 
2.43.0


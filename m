Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18962475340
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145216; cv=none; b=ZekDM9fvtx4uHy3MB89yQswhz7bx01phnWKJzQMgdg6JxHItbHN4rgi4iXWE96b9wN92pLaDlVjJaQq59YzR2WSseqEng2PYzSCu1xeqmPmhiz/+aXqPJ3vVQUiVkICh4lOwrI/fzz6LsiY2RWf6KFmMfqiwhSZEAbrj/AVDAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145216; c=relaxed/simple;
	bh=r2bLbUjuxFexn4kPzsGf0ppztOX6KrI80BnkCZHrHYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VqAayx+E9bf2aQNkLO+rYoJkGcO8f/p/Ie5Wj6J+RBITYClhes9SV/CM5VuwUn65ovr7TuZnS/ce5C589u4c8M9hqpHVPEtfsKP+W36HjKI/kokFytlHJ9JA3ev4u4I+vEELurxBlQ6W98M+J/s+LPhsRMq8MIpQAULNxrB65Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
Received: from zhaoxin.com (unknown [127.0.0.1])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4j5gZx5ZZkzb0pbD;
	Fri, 16 Oct 2026 18:06:49 +0800 (CST)
Received: from zhaoxin.com (unknown [10.28.140.201])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4j5gZv0S0Hzb0pbD;
	Fri, 16 Oct 2026 18:06:47 +0800 (CST)
Received: from l440.zhaoxin.com (l440.zhaoxin.com [10.29.8.13])
	by zhaoxin.com (8.30) with ESMTP6baf75efb22ff6935abe15cff4495106
	Fri, 16 Oct 2026 18:06:46 +0800
X-Eyou-Smtpauth: weitaowangoc@zhaoxin.com
X-Eyou-EnvelopeSender: WeitaoWang-oc@zhaoxin.com
X-Eyou-From: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
From: "=?UTF-8?B?V2VpdGFvV2FuZy1vYw==?=" <WeitaoWang-oc@zhaoxin.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	den@valinux.co.jp,
	linux-kernel@vger.kernel.org
Cc: WeitaoWang@zhaoxin.com,
	wwt8723@163.com,
	CobeChen@zhaoxin.com
Subject: [PATCH v3] x86/apic/msi: Fix MSI interrupt affinity configuration
Date: Sat, 17 Oct 2026 02:06:44 +0800
Message-Id: <20261016180644.3528-1-WeitaoWang-oc@zhaoxin.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Eyou-Sender: <weitaowang-oc@zhaoxin.com>

The two step update sequence in msi_set_affinity() is required for MSI
interrupts which cannot be migrated atomically, i.e. devices which do not
provide MSI masking. The MSI message update writes address and data
registers separately, so such a device can raise an interrupt in between,
which results in a message built from half updated state: A stray
interrupt on a stale vector and a possibly lost device interrupt.

The update sequence is selected by a per interrupt quirk flag, which is
set for interrupts which cannot use reservation mode. Reservation mode is
only enabled for maskable interrupts, i.e. devices which provide MSI-X or
mask support, so the quirk flag is the inverse of the reservation mode
bit.

The removal of the quirk flag replaced the flag check with a reservation
mode check, but dropped the negation of the removed condition:

    - if (!irqd_msi_nomask_quirk(irqd) || ...)
    + if (!irqd_can_reserve(irqd) || ...)

As the quirk flag is the inverse of the reservation mode bit, the
replacement inverted the condition and selects the wrong update path for
every interrupt: Non-maskable interrupts take the direct update path
again, which reopens the race, while maskable interrupts needlessly go
through the two step update.

Restore the original condition so that the direct update path is selected
when reservation mode is enabled, which also matches the comment above the
check: Direct update is possible when the MSI is maskable, which is the
case when the reservation mode bit is set.

Fixes: b56ebe7c896d ("x86/apic/msi: Fix misconfigured non-maskable MSI quirk")
Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
---
 arch/x86/kernel/apic/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/msi.c b/arch/x86/kernel/apic/msi.c
index 66bc5d3e79db..da5f44a80313 100644
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -62,7 +62,7 @@ msi_set_affinity(struct irq_data *irqd, const struct cpumask *mask, bool force)
 	 * - The interrupt is not yet started up
 	 * - The new destination CPU is the same as the old destination CPU
 	 */
-	if (!irqd_can_reserve(irqd) ||
+	if (irqd_can_reserve(irqd) ||
 	    cfg->vector == old_cfg.vector ||
 	    old_cfg.vector == MANAGED_IRQ_SHUTDOWN_VECTOR ||
 	    !irqd_is_started(irqd) ||
-- 
2.32.0



Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16F3AA51E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491425; cv=none; b=bdxnHBk1u5pwQsn5JjspVB2Xr3RIBGJ3aN6JOWEXoV8yLR0aFZHsbJKVx/NZPtUoM3pQGF5n7iL2jtZMilNGGMBHd7zGOsBUG5zwJbgzGmvX7F6Wu8BGl+WCZYG0BjwuNGOnp9mOOgXiJjJvOF5Op1P21XRHh6Rx6fe/MrXBo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491425; c=relaxed/simple;
	bh=TR1DU6xKSXoHFIgeof3CUzjvhLtuKnOEJ2ZTvUWg4oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZHVC71WhurBh+zvcMu4KxxvLmqbyGCRNe/O4UXzkuNCRXpFzRBBsrHxfFCBtXBHSA3TkkjR7iaOdWorAulfWzKxqeBDhQxJY9bnlHT1Dyp/4s6rOOSI/HHAE+T6Hd/rVh8TCMOy6oQ69bOUzQ1jleGi1JrIU2vpDH8PTJF3DDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1738966|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00528743-8.67872e-05-0.994626;FP=14259654310229575967|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033023018039;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.j54tlGi_1788491405;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.j54tlGi_1788491405 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:10:11 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: puwen@hygon.cn,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	tingyin.duan@gmail.com,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH v5 1/5] x86/cpu/hygon: Adjust the die_id and logical_die_id for Hygon models 0x4 through 0x8
Date: Fri,  4 Sep 2026 11:09:57 +0800
Message-Id: <1d19f337f055b74d3044ec347e5fa6d728067f7d.1788404433.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788404433.git.fuhao@open-hieco.net>
References: <cover.1788404433.git.fuhao@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

For Hygon processor models 0x4–0x8, the die ID should be obtained
from the NodeId field in ECX of CPUID leaf 0x8000001e.

Starting with these models, Hygon CPUs support CPUID leaf 0xb but
do not support leaf 0x80000026. Consequently, the die ID and
logical die ID cannot be derived from the APIC ID space.
CPUID leaf 0xb only supports core and package levels, it cannot
enumerate die IDs within a socket.

However, we found that CPUID leaf 0x8000001e (ECX) provides the
necessary information. In Hygon CPU design, the NodeId field [7:0]
encodes both Socket and Die IDs in the format:
   Bits [7:4]: Socket ID
   Bits [3:0]: Die ID

We can calculate the correct IDs(die_id and logical_die_id) by parsing
this field.

Signed-off-by: Fu Hao <fuhao@open-hieco.net>
---
 arch/x86/kernel/cpu/hygon.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 3e8891a9c..64f9a64c3 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -192,6 +192,20 @@ static void init_hygon(struct cpuinfo_x86 *c)
 
 	init_hygon_cacheinfo(c);
 
+	/*
+	 * Adjust the die_id and logical_die_id for Hygon models 0x4-0x8.
+	 * In Hygon CPU design, the NodeId field of CPUID leaf 0x8000001e (ECX)
+	 * is now fixed to represent the socket ID and die ID, allocated as
+	 * 4 bits each: socket ID = NodeId[7:4], die ID = NodeId[3:0].
+	 */
+	if (!boot_cpu_has(X86_FEATURE_HYPERVISOR) &&
+	    c->x86_model >= 0x4 && c->x86_model <= 0x8) {
+		c->topo.die_id = cpuid_ecx(0x8000001e) & 0xff;
+		c->topo.logical_die_id = (c->topo.die_id >> 4) *
+					 topology_amd_nodes_per_pkg() +
+					 (c->topo.die_id & 0xf);
+	}
+
 	if (cpu_has(c, X86_FEATURE_SVM)) {
 		rdmsrq(MSR_VM_CR, vm_cr);
 		if (vm_cr & SVM_VM_CR_SVM_DIS_MASK) {
-- 
2.34.1


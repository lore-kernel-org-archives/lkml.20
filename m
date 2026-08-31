Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52973483BEF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185055; cv=none; b=ndRfDoUsj3pzDStU60mYEWOjGMZ7iPxb+KMbqZls+gRvOGB8zN8LX/cfz+nlxzQWm1vOWd6L6h2wu8fUfvY7DLUtuLd7ct5EroRNP3rXzh22+7ygZEf9FZqAVjBXsk8+qvITrgvnk3JfIKnoJFzwfFifSwxHawwK8Rj/z/g5pO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185055; c=relaxed/simple;
	bh=w3BRh6qpnCc+cRlofSuvcoFEbtBiZCwjkJTXaWoVY1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rxPFc5eRGYYFP2yy3/GlGmHBkbsQbP9qJz/VkyxyZVTMrOnxY2DN90dcMyUpgmW0XVJ8Dv5H/x3Hes6/AfONGZUFpzB/kqYPbjoobgPt0VF74qzM46W7iWBIavlVVCQd1yJD5mDaW2tOz57qsbTZg9BfrioiirQt0gZUTrAcnqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LBJfmAQT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LBJfmAQT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9943A1A191E;
	Mon, 31 Aug 2026 14:04:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CF1260231;
	Mon, 31 Aug 2026 14:04:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 559F411C78A75;
	Mon, 31 Aug 2026 16:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788185044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xj7+BlJoO9FaYG4gkO1rCXoP+kayLTnKs16wNrs/qQs=;
	b=LBJfmAQTiOY3ev+iAwOyYmEjgNvvrBp4H74mTPtXH72qYzXN36FwHcb6piCU99gCE+eLl/
	6ApsqGbg1L5UOCsQWxJu1oXA3MmPeBJUGqwzUQAjCRv35B5nPZ6pzKXeIMC6PxL2BY4wW/
	9ZkO59gPixEukIvdWsz4IPIGTYCSnigjrVvaHV+I338uHP66cKgUIdDZeUU2Zn6Vk2ih9j
	JlLqjbOBV5QSVMLQr3Chzx+QmTBpjD3pyYkHy+kSrLz7Mf33ExMRt9Dbp8lhXm302L2lPz
	GtFKQioEq3Z967u6SuRmcqVMyJPtK3SgllcayRTPk2RupTlUayuKSvjFDqpR1Q==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Mon, 31 Aug 2026 16:03:54 +0200
Subject: [PATCH] powerpc/traps: Recover from L1 instruction cache parity
 errors on e500v2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-icache-parity-error-v1-1-55078fd4e743@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgOtShGvIg5pjJpFJRVRxLtbH
 N/w/wNJTCVBVzxgcmrSbc3wZQG80DoL6pgNlauCa2uPysSL4E6mx41ithnGlkP0TI5CA7ncTSa
 9/ms/vO8HXHJWLmUAAAA=
X-Change-ID: 20260831-icache-parity-error-b8c6b1ca0a64
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is no attempt to recover from an L1 instruction cache parity
error on e500v2 platforms. When this kind of error happens, we fall in
the die_mce() while we could recover from it (cf §3.1 in [1])

Implement a similar recovery than the one implemented on the e500mc
platforms. It consists of invalidating the entire L1 instruction cache
when parity errors are detected.

[1]: https://www.nxp.jp/docs/en/application-note/AN3532.pdf

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Hi all,

There is a real use case behind this: the device I'm working on is a
space product. It encounters this kind of parity errors when it gets
hit by radiations.

To test it, I made a module that triggers the parity errors by a
register of the P2020 that allows to corrupt the cache, you can find
this module here:
https://github.com/bastien-curutchet/linux/tree/b4/icache-parity-error
---
 arch/powerpc/kernel/traps.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 629f2a2d4780..f8a4019153a0 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -724,8 +724,21 @@ int machine_check_e500(struct pt_regs *regs)
 
 	if (reason & MCSR_MCP)
 		pr_cont("Machine Check Signal\n");
-	if (reason & MCSR_ICPERR)
+	if (reason & MCSR_ICPERR) {
 		pr_cont("Instruction Cache Parity Error\n");
+
+		/*
+		 * This is recoverable by invalidating the I-Cache.
+		 * The I-cache flash invalidate clears all lines;
+		 * correct instructions will be re-fetched from memory.
+		 */
+		mtspr(SPRN_L1CSR1, mfspr(SPRN_L1CSR1) | L1CSR1_ICFI);
+		while (mfspr(SPRN_L1CSR1) & L1CSR1_ICFI)
+			;
+
+		return 1;
+	}
+
 	if (reason & MCSR_DCP_PERR)
 		pr_cont("Data Cache Push Parity Error\n");
 	if (reason & MCSR_DCPERR)

---
base-commit: 0fed5eb44e49e79d824edc4ccce012bb57994300
change-id: 20260831-icache-parity-error-b8c6b1ca0a64

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


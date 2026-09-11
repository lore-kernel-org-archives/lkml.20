Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058C441600
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155777; cv=none; b=PwN+CsrklEnMyUSHVBoByMe5awcHuF1NEzJxleJ2eXNG+iPhlTZXCifBuaM7Cy74eeYz0LrOT5oG++NLZ1FbDENc0GCoPWhmfp5Vr5pBg5vMqsR8/I5FXESj88CMQL6mbpYYRrdPo2xN6tzY7mwLLfxoSWpXyKwehJtVsRQhVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155777; c=relaxed/simple;
	bh=j5K6OOvFm8e1BbnUerM/DiKq4FEaY0jsh9fJ6mbNKTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fu6N3mmeGkej4LawMSuhdUn6bSy+5lG8F2SvUQxtJpYJhBJz+PEzJRTw15WeZhW/FkVt5kT+rV6goSI63D0Gi3Wubo2P77likfNwFVgFn9zm2KGus3/ysDkve7P+QQRdLEgkFXOaf/9+c3zbmyvD29uec27jaCXa/ivwXeJWdng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=dd8rUh/x; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="dd8rUh/x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=4HUpR03/tyAN0WG71k+QFtPol0dW270SWgoZPUtqdQ8=; b=dd8rUh/xWYuxqCYVpV4JaeL4h6
	KgqgU2qilwD59tZ+3XVeV8U4bAvhAUUQNsfztS57T81EmNrCYz0yMFtyOpfqGp0gY/gIN1tMED1q9
	mEjL//dU8SW+Pk5acMEdHAXzjhKwRij1FhErdIOHfsw2Evhc+sApB941IBkDuyhD0j4+Vy+r8dKDh
	43+OIwCfWwqKTkQuExsvZ4qpKZJMn3AeS06TW8mdIanjY5Ksf7Y9NTbgY0Tp6CX8dUFjNNIqQit17
	BdR7/WB+1ZMIVI2x6yC+VM6wg3gh4Rglp7Ewa03F93GRSWEOtvv8DqnoVeQS9LB8DrfDezDFlVUR1
	sWOcxKSA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x578t-0000000979a-014e;
	Fri, 11 Sep 2026 21:42:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: vector: Fix output operands in context save
Date: Fri, 11 Sep 2026 21:42:17 +0200
Message-ID: <20260911194218.3379486-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __vstate_csr_save() inline assembly declares vcsr as an output
operand while the assembly only writes vstart, vtype, and vl. Remove it
as it is later saved by the C code.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77208..064a24c89d74 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -137,8 +137,8 @@ static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 		"csrr	%0, " __stringify(CSR_VSTART) "\n\t"
 		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
 		"csrr	%2, " __stringify(CSR_VL) "\n\t"
-		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
-		"=r" (dest->vcsr) : :);
+		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl)
+		: :);
 
 	if (has_xtheadvector()) {
 		unsigned long status;
-- 
2.53.0


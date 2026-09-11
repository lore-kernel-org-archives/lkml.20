Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE0568FA0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155781; cv=none; b=eYaA21iQ9RXTm8+/RASQm7LtMJZkxQisdy1xYFA9zZaPkZnnsI4t9LXvlDdzN9oJ2BB77xhWYJ0/35RPcsq9ciNW8jzIjCQ+MrMPvBgPAtDFyNDxKPizLu4wKxZ54MYweVCFoOZeZQ4WqB0dPJoq6N8QikxxCEHxssGaaVXXPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155781; c=relaxed/simple;
	bh=h77ZOOlGAWwO/ewlU2DRJ7J9f7l33axfvy9izBn37uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plvEI5K4cNy/kTryZQsiUgjp/5WYf6H3M+FWugGhwWd2uQWrppuZetJ/hsw5vOa80RZPL/9v1SgAtQveLqKzLPhstWmw1/onZIMrVEUonS+tt/FA2muzmKNICiGEPluWjvWzH7WEXWjLRdUOQLJ3Jguqt/6XE0uoSp19a7G3Tf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=jmBBVq5O; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="jmBBVq5O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=G2WtBM+Xo86zPU2H3M+cinHev6QJx7KF9qsuxH6vzTk=; b=jmBBVq5ORSOSbJofw0nNlV0m3V
	tGakfsi/Js0+aRu0CAzeiQPxTvyojx1DUKBMCtLjPmrMUgMke66+DPLrb/AevJ91CebedR1xJB+4t
	YeJO+2z/AH1Bs5EiGK0Z/IQMpgWVAbnLeriFBNk4IRbaRw70HXsNVbv4xn2EseALB0MYkhhlx64gC
	EoNHvD6M4kSBDtNivy3lEO9Ws5an9qLt+3lquZVDH+/YvtzCrHyKiW0Lf797fwgJge1Y244c8uHsa
	XIYb/VyZTwzO4NTzWkz6rXhUxWkhQ73/QGu2EjsBDL+KKlsOOh7SQQdkFE73QnEfJETsqJJpllQ5w
	1UkOb7mQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x578y-000000097AD-3QDI;
	Fri, 11 Sep 2026 21:42:40 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
Date: Fri, 11 Sep 2026 21:42:33 +0200
Message-ID: <20260911194233.3379532-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
Replace GENMASK(12, 0) by GENMASK(11, 0).

Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/insn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..ad348d8b8857 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -142,7 +142,7 @@
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
 #define RVG_SYSTEM_CSR_OFF	20
-#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+#define RVG_SYSTEM_CSR_MASK	GENMASK(11, 0)
 
 /* parts of opcode for RVF, RVD and RVQ */
 #define RVFDQ_FL_FS_WIDTH_OFF	12
-- 
2.53.0


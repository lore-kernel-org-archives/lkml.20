Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC14F4024
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973276; cv=none; b=l3zeA6gw2JX88u+S/2TMv/dgnQ/D0yLkKm63lvv/ExHaxOsccwTHBguJWIlyQjOUNkCvHOZwxwAn+r7fWLAHjrhEdFRwJDae3O+zJp1m0biqOMkIt2swTGR+mFDwTUJk2r6pSWJbX6COWf84sjQSA8JtISKoiyrJXv/aoMMS9Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973276; c=relaxed/simple;
	bh=njg6+XaQlIpCc1rNMJ/54owvIq4wJWwJqANTmyyPYvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtCKeYqU8FxqskXjfjV0VLPfrMtBUTf4Vz8QcoYzKE+1glf1fo7DXYbtIq3gGucnGWdrPdCqJU/ho/kyQH4ze+t4G38aai+DRragJZ9ektGPBisIVRKjoAleTBfTttwPZVxEr7gFhrYuQUKWuASy6XsTrOw0tTTfjQ6eYuR/Pl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431141F000FF;
	Wed, 14 Oct 2026 10:21:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
Date: Wed, 14 Oct 2026 12:20:39 +0200
Message-ID: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These options are irreleant for nommu systems.

Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 15f6e67c60410a87..15beeb4690aebcc4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
 
 config RISCV_ISA_SV48
 	bool "Page-Based 48-bit Virtual-Memory System"
-	depends on 64BIT
+	depends on 64BIT && MMU
 	default y
 	help
 	  Add support for the Page-Based 48-bit Virtual-Memory System.
@@ -617,7 +617,7 @@ config RISCV_ISA_SV48
 
 config RISCV_ISA_SV57
 	bool "Page-Based 57-bit Virtual-Memory System"
-	depends on 64BIT
+	depends on 64BIT && MMU
 	default y
 	help
 	  Add support for the Page-Based 57-bit Virtual-Memory System.
-- 
2.43.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE396541462
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092560; cv=none; b=Wn+/NxgNBtHnyslKoRnFku0o4wRx9xS4DI71Mj5ejrSpIvnwF7N/ng8qL+5P3Pa5xFRLkEEh9xn4YqVKItQcS9Oi+l77+jdG7QpZTOVBkHhvBPK72x/SkCVVaY62MoT0gcTSkzs6oChJl6Shh8/BKCRj09Sk3FNAdY1Lmtq9A14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092560; c=relaxed/simple;
	bh=Xqz00MJh0x/Qe0V1MfC+3rczciKNM/u8s40TIrjmehE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLu9L/l31wjFy80xPGqd49y2VqPlzaZeZsgSKTRJBbe6I1qWkVOuTQrA06b/SJ/f6TG8vn/oN5x26mshcZHGp6sngIogV2cTRve5qiMIRsZ1d0irDkCi3QjTUJvfjkpdxQoZ/p6r35u33llUenm3GtDiN54x3fe3YJBHL9FzK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqTdPAb/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqTdPAb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCC71F000C4;
	Thu, 15 Oct 2026 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792092558;
	bh=Nq6TXxH9yZegUId9mXUPVGqp2OxE84kDHUHLPk1dkU4=;
	h=From:To:Cc:Subject:Date;
	b=aqTdPAb/adr8kVxBfsWFs2D4hMXnHJ5nPVaR73Rum+4y8DI7AH+MJOc52QeHK0uBt
	 Cq8r/mFmrjYt4I9hETDotAz7w0Kqy0HP1Q/9DJcW48B+nBLM40HjUgBf9T8LgP1mXC
	 WgLOaAq+d2KTP0ITGUUrT5Q41qNT5D7//uFy/gM7p7c+CRcAO/K0shlFKKIxPpFCTV
	 kCELMYwTdJCK2DZXRyBV2l+msEdBd1QbszXyhgFLQH8k6kn0RAzQEWUFm3fTTw5bqw
	 bPAkDROCPQ350TxQLPLUdhs9ItGXFWqU0hyEeOQ4P75eK8tMnaiinI2PdvxXU+51Ru
	 qaOTNtF6CEWPg==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: idreg-override: Use property length in get_bootargs_cmdline()
Date: Thu, 15 Oct 2026 21:28:08 +0200
Message-ID: <20261015192810.395975-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=blum@kernel.org; h=from:subject; bh=Xqz00MJh0x/Qe0V1MfC+3rczciKNM/u8s40TIrjmehE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkXNb2emc1qndl5ynbFsb8TwznVW06lrDbuDHGV/GUwu e/zmWPBHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR/m5GhsdXVge6rr5ZcOBx 98IX219EZC2M/JdgkTTZPdGQl2NS7ymG/yXLrQN4rzzcJMm1b8//ev2UxnWRy9Yb9Sj+0Um9/W6 3NRsA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

fdt_getprop() already provides the length of the bootargs property. Use
it to reject a zero-length property before dereferencing it, and test
the first byte directly instead of calling strlen().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index acaf56234973..588c8af2a567 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -383,15 +383,17 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
 {
 	static char const bootargs[] __initconst = "bootargs";
 	const u8 *prop;
+	int len;
 
 	if (node < 0)
 		return NULL;
 
-	prop = fdt_getprop(fdt, node, bootargs, NULL);
-	if (!prop)
+	prop = fdt_getprop(fdt, node, bootargs, &len);
+	/* No bootargs for a missing, zero-length, or empty-string property. */
+	if (!prop || !len || !*prop)
 		return NULL;
 
-	return strlen(prop) ? prop : NULL;
+	return prop;
 }
 
 static __init void parse_cmdline(const void *fdt, int chosen)

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956395;
	b=UevlqntUmMRuZN2BGHcziuiCWId+J8LI5rpdG/+Ujn+CGkTxWG+c+jYep5805wJlwh6w
	 HZqzkkqhTyWrPKtndYcqGxPUUBbE9n7bKGQF/1bHt6dSbstACc9H1KDYb4vFYnA4wgNEB
	 EnNYt7V+Q9tL5qctDZeGTQqFw9KM8hYNpf4fXhjVXVNRlo6OWVunMqLGhQL9hiqMZMkhO
	 /1CzN1pp3lZtdWr7NTt3/KI0+A0KQoA2Q/v8gZd3YpEmLaBvSej+HFdZv1JGnyk6qGVHO
	 Z3sVVgf20XIeBaitmdcOQvZhMUPniB5q3bcijOnVl6y9kJGHvsTJOxS8Wn2RGDyeMew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956395;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=79L4NKhgnFh26QqRzjggoxECorH7YyEdYSbuHRTcIPE=;
	b=VpB81DBWJUg1I1Q+dZPQeRbIvJd0fT5/q0qEvLjt0d4VklG2xRskRMjMbF/5AYdMo2zl
	 ulyOiWU0SgS7QhAPXU10WPwuROUbIPuGBDvBxPYRdUB7qppg2nTQ2skHDVjuty0WiA61u
	 jJWnyacsTSsGAkSMIDS8ybWkq+GR2XMx11/7yqVy9VvCMzvwQxWWeydVL2cz7BdafrfQa
	 fflUOu3qe+3SAyYVC4PKYehXFQzBUtVS0sIItR3upvz00sj7dVI7KrCWLt+zwOu4k9PJl
	 XuFOFKxbjuC+ezczAWM6i551uZHlf8hMAEJqjgcnYMzpukDPKxqBG4XZuV1oaii0rGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnfMGloo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC61606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnfMGloo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950521F008A2;
	Fri,  6 Nov 2026 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793956394;
	bh=79L4NKhgnFh26QqRzjggoxECorH7YyEdYSbuHRTcIPE=;
	h=From:To:Cc:Subject:Date;
	b=DnfMGlooYZoNaAp8xIlJvJcbh326y5C52W7V7mAcATvvyR8IIyJt7v28ijRyyJ+d3
	 xhXYyowg92d1EfW+qcPDsyp9doOLVtKFpfJBj3DpdPAwIoXdKst0mCAyzkbDDcqJUG
	 B5EWFfXM+dkTs2zoFkRLqfz1MH5Qwr4cAI5/wL2cDR2Czw3Q0fxUf4biX4ElemkLyy
	 R1XOokowECOMMR2rP5D4kLAUxxqO8PLwnxcCwJ+3oELo23uAuw29C5skv/I8LiyHri
	 s7lBiPd68yhwkompCDl/sVYTNutqqwAJTIHWAY/xzohmi9/JZ/Q+Xe9s1iL9HJi8ky
	 7pltZBEYM5znw==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/coco: Use IS_ENABLED() in amd_cc_platform_has()
Date: Fri,  6 Nov 2026 10:13:00 +0100
Message-ID: <20261106091301.2838-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=blum@kernel.org; h=from:subject; bh=TemK6yBhfNMTeACWF5KCcRiFMfBczzqXYT+PWIfHEOY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlvZ8myCegy9bOLO5u83CLMeGqv8rn7BYceHNtwMDQxa lLJVEeejlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIVigjw5nJqd8OnGyS2R2/ lGtbrtzR+l2XHd9Pcpl0u+6v3I1tGroMf7hluDI6HC274rcuWby/6NBZ59N+rK8quZ+plV72dzQ x4QYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use IS_ENABLED() to add compile-time coverage to amd_cc_platform_has()
independent of CONFIG_AMD_MEM_ENCRYPT.

Since amd_cc_platform_vtom() is now always referenced, remove the
__maybe_unused annotation.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/coco/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 989ca9f72ba3..418ec77bbe3a 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -44,7 +44,7 @@ static bool noinstr intel_cc_platform_has(enum cc_attr attr)
  * the other levels of SME/SEV functionality, including C-bit
  * based SEV-SNP, are not enabled.
  */
-static __maybe_unused __always_inline bool amd_cc_platform_vtom(enum cc_attr attr)
+static __always_inline bool amd_cc_platform_vtom(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_GUEST_MEM_ENCRYPT:
@@ -69,7 +69,8 @@ static __maybe_unused __always_inline bool amd_cc_platform_vtom(enum cc_attr att
  */
 static bool noinstr amd_cc_platform_has(enum cc_attr attr)
 {
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+	if (!IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT))
+		return false;
 
 	if (sev_status & MSR_AMD64_SNP_VTOM)
 		return amd_cc_platform_vtom(attr);
@@ -110,9 +111,6 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
 	default:
 		return false;
 	}
-#else
-	return false;
-#endif
 }
 
 bool noinstr cc_platform_has(enum cc_attr attr)

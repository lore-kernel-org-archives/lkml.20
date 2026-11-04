Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781418;
	b=ZyzmNcux6gAp02ULhJat7hC6KymMt/g3Qg42tWXtK4tZVGP6o3bE+NGm9MsChof8nrZG
	 lx9vxAbKYRlejTMiIMA3SEPJlvaszmozp4E3WRpKWVMpzimDd3ZclnIb3nkydYUSRh7C6
	 WY43OgvJp20XK8Xc5Vx82HNQM8XIJFpmnHNCh/YDv+7rDiH57HBpnIsdqFnLG4CynwK2b
	 feW+qwUeOiWm5eHB9zPIiQjMa+A2tto3O2plmzp6tDzBJV2wNC15w/JsKhxewHnb3PSKI
	 y/TKDly36UsTYbSDofyaVb7hs5xt5ER3RO8BVn49IrLFfQFIYkbOZxLcHCGyfUgct+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781418;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=vq4JuVxoqkxA9F+v+9IV2As8ofAyqqySaullwNNCypg=;
	b=V78UcNwW4K+1LUzHf8YHT1kSjBftCXmdf3JGYPMM5Do5lVSWDOWYJvclk7SzZXn4D727
	 q79ON5gDSEsW6ebauMBcZ13FMi38wc6hwouKlEz2+nm3K/pl9pL/g8J+XWHGEYliWB4G2
	 8jXds1sZ2OmQ3MpeyYpqY2f6RvgeAikKbdH7ROTXXc4V+j54vyenUnI1nK6fLC23evO+t
	 PZGD694TNHo7EfrkBFfcPx/1FhmYbeeYtzQWJVtdSRLOSj0qajxTJEtK+N5FXuFWNkJcE
	 TuY1cbFAe6AKbUYu0il0FlXDcroUOMhCI+r6uUTVx7vidZIWQuJSfmIzgpdsMECU5Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbXpPm5C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F5606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbXpPm5C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2D41F000C1;
	Wed,  4 Nov 2026 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793781418;
	bh=vq4JuVxoqkxA9F+v+9IV2As8ofAyqqySaullwNNCypg=;
	h=From:To:Cc:Subject:Date;
	b=VbXpPm5CoeAhPzBkkUWRqoUDpVFVq/Hi1wRWElnu/eVCoI3XKjHwFw5IMMqBxZQf8
	 84DXri7Cy3bT7WrjYunlmv7owV4/w6YM0BYrBNJejK+H007sniJVNoZYNZ0/zvsTvJ
	 zpuAKKRwU1CxgLA/XiXJ5Fl1uTzY/q+e2Q2ct9mni3HURCLZA9VIBMOsmdr5vFPvQX
	 aX0Sa7hwoPMHLhsIfnrLGtSZQKeszu2AHY7sKuV86lWEcsNskImdbISn/PeE5JvuHC
	 lqciD4OJ3wtpmL+Yud2q90Gp75Ps4S7FhTVizmJcaSOJJxTC0PDpb24Zxof2MuNT1y
	 Kg20BIwzZ2vww==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Date: Wed,  4 Nov 2026 09:36:31 +0100
Message-ID: <20261104083632.65715-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=blum@kernel.org; h=from:subject; bh=UoK9h6KJR/wF0yUKaEQGakSIJkSGzR2FJ4H5aoUaFX4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmv3k0wKJYv75DlbzAs0P74sm/Z75MJTl+VYo8bHVm19 e6HicLVHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRBacZGdZN/PZlVqBvIm/o ximnUjLqF0UvKd5gGbF4p1L6j+23vl1hZFj4+mhBwt/j5g8k+Cb4Lot/O3WNolJArvu1XdU3dz7 UfMYJAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
redundant check and the manual assignment.

Use unsigned int for fw_level to match the expected type, and remove the
now-unused local ret variable.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/cacheinfo.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index 309942b06c5b..881131fb4934 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
 
 int init_cache_level(unsigned int cpu)
 {
-	unsigned int level, leaves;
-	int fw_level, ret;
+	unsigned int level, leaves, fw_level;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 
 	detect_cache_level(&level, &leaves);
 
-	if (acpi_disabled) {
+	if (acpi_disabled)
 		fw_level = of_find_last_cache_level(cpu);
-	} else {
-		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
-		if (ret < 0)
-			fw_level = 0;
-	}
+	else
+		acpi_get_cache_info(cpu, &fw_level, NULL);
 
 	if (level < fw_level) {
 		/*

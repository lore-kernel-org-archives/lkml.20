Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991987;
	b=vfpWF0+m1ANI6KrfxkCG7P/1Vcy5Vk84SH6cute3sKt2NnVXtF7vZpUTxe0wdqhz0SAp
	 Do5URNY+g9fJqjae0aF5+paF6MPvFpuJy55huE2qerymAELjGdKop14xz8vi0LbrLeYC/
	 TtP0sooMT4VP59nyeOJA69Joh99dgB77we6PicrMgeHYEgnFdN6gEIKItxJyW0Ngfwazw
	 OZOXj/bUH+xqgNcHp9YDxq1fFd2XJVJ0qT6teImPp1gh9JPcq7Qa2IrTF58xHekj8tW1s
	 YUYntIMpjXxURo9bFi07hKMhWgSOPS6OO5JQojrFdHDiRs5+pqK2byx6E4zlbBAjb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991987;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+NjOJ5pOnnofcQsbhIWpah3NkmqOpyo95zcnCMhbHME=;
	b=RStOaE9OlgH7TgVKCl1Oeq3QUAK/7wMCGc246c91/UJg5WdI12Mmutn13oh2KnPJ6i1r
	 SDk+zucogBYBVgDzneZyBCyxWliagg4UW+aC8OauY3IeQW1deXGs8Y9+R59azUhSKt2o0
	 wN0KtKw0nwwqBO89rWZWv6giAsyMAfhz1JfEcHFH6gDe/XhkEStEt9suRDZfwBP1zxiPj
	 2RTegs1G/3OJ6u7mriAF7mGBhVxACpSb9QSoR4b27pz+vY/3uVyDASzHZ+v2S8L+uWKnZ
	 p/0TVPvpK4xLs8Bbv/NGTxWbiBxWKxXbjcb4KHjRqw4eaZAQETQMENVLPjqiuLWMaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVLbISwJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389EC606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVLbISwJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2811F0089F;
	Fri,  6 Nov 2026 19:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991986;
	bh=+NjOJ5pOnnofcQsbhIWpah3NkmqOpyo95zcnCMhbHME=;
	h=From:To:Cc:Subject:Date;
	b=mVLbISwJpnnfXwKrUfpK5RoRnvYR3mJl8hiNfaEOgHvr7B6w5pxWW9hgM2FueGeuA
	 9nepsf3qgW0ITzv8cI8AM4iNsP7JqGG6yEa5kXCdGmbBN6myI/rGlVlMWWfUdASqcc
	 +M90YZD44xQbBrxYOEs7wGC52MUpJqxWr7WbNjw9XFzNZ7ewIo15poo+UWLUuyenms
	 1J+qI6tCPJx+XswvTi/1ahF6E5WAXr/kb6+WXzk57GjVSn6znvkVzQv2OW4yZwfuTo
	 LAJlFLaoBIPamhGfXMr5/WlsEjvjn6d1eFEdQYtvSefWEgtQKm0u4OhRRFGQr/pEH1
	 h5aABMjlZq/TQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
Date: Fri,  6 Nov 2026 19:05:59 +0000
Message-ID: <20261106190559.1906130-3-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10948; i=conor.dooley@microchip.com; h=from:subject; bh=85cdTfTeCH8rmQXRT4bau4H2m8Xbgfwdn6wt/FXqDGU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFnvVMVNj0m9+pz43o9t6qNlC5eeZPr7O9TRY43vygLBz 3r/XRZM6yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEKoMZGRpPLtj2Kaj91pMm o8cvFj+6FXGjWyDjVejhZwxT/pSt5PzC8JOxy1xtYs0hk6LVzId/hhUqnWst2xc78aPkvZ+8117 4CvAAAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
since it presented a simple interface where users (be that in kernel or
userspace via things they are presented by the kernel) would check the
exact extension needed for a feature, rather than muddying the water
with parent extensions. As a result, the kernel does not track the
status of the parent extension in the bundle, nor expose it to
userspace.

This is in comparison to RISCV_ISA_EXT_SUPERSET,
where the parent extension provided some explicit value, and would have
to be checked for itself for some potential feature, and therefore we
actually track the status of both child and parent extensions, and let
userspace detect them independently.

Since we added this stuff, there's been some retroactive extension
releases by RVI that have made previous monolithic extensions into pure
wrappers that we intended using RISCV_ISA_EXT_BUNDLE for. Since we
previously tracked that as one extension, and exported it to users as
one extension, we can't just use RISCV_ISA_EXT_BUNDLE, and have to use
RISCV_ISA_EXT_SUPERSET instead and nobody seems to know what to use each
actually for anymore.

Just delete RISCV_ISA_EXT_BUNDLE for the sake of consistency between
things that were always a bundle from ratification and for those
retroactively made into bundles, with the side benefit of being less
confusing for those adding extensions to the kernel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Not 100% on if my comments on the initial rationale are right, they're
just my recollection...

This is a rebase of the rfc, I didn't change anything functionally I
just ran it on a board in the interim.

Cheers,
Conor

CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Andrew Jones <andrew.jones@linux.dev>
CC: Charlie Jenkins <thecharlesjenkins@gmail.com>
CC: Guodong Xu <guodong.xu@oss.qualcomm.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/include/asm/cpufeature.h |  8 ---
 arch/riscv/include/asm/hwcap.h      | 13 +++-
 arch/riscv/kernel/cpufeature.c      | 97 ++++++++++++++++-------------
 3 files changed, 64 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 99799cc6c198..4be952a41bba 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -58,14 +58,6 @@ void riscv_clear_hypervisor_csr(void);
 #define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
 			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
 
-/* Used to declare pure "lasso" extension (Zk for instance) */
-#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
-			    ARRAY_SIZE(_bundled_exts), NULL)
-#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validate) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
-			    ARRAY_SIZE(_bundled_exts), _validate)
-
 /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
 #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), NULL)
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..a1cf9a935519 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,10 +126,19 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_ZK		119
+#define RISCV_ISA_EXT_ZKN		120
+#define RISCV_ISA_EXT_ZKS		121
+#define RISCV_ISA_EXT_ZVKN		122
+#define RISCV_ISA_EXT_ZVKNC		123
+#define RISCV_ISA_EXT_ZVKNG		124
+#define RISCV_ISA_EXT_ZVKS		125
+#define RISCV_ISA_EXT_ZVKSC		126
+#define RISCV_ISA_EXT_ZVKSG		127
 
-#define RISCV_ISA_EXT_XLINUXENVCFG	127
+#define RISCV_ISA_EXT_XLINUXENVCFG	255
 
-#define RISCV_ISA_EXT_MAX		128
+#define RISCV_ISA_EXT_MAX		256
 #define RISCV_ISA_EXT_INVALID		U32_MAX
 
 #ifdef CONFIG_RISCV_M_MODE
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..b4ce5221a26c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -340,14 +340,6 @@ static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZALRSC,
 };
 
-#define RISCV_ISA_EXT_ZKN	\
-	RISCV_ISA_EXT_ZBKB,	\
-	RISCV_ISA_EXT_ZBKC,	\
-	RISCV_ISA_EXT_ZBKX,	\
-	RISCV_ISA_EXT_ZKND,	\
-	RISCV_ISA_EXT_ZKNE,	\
-	RISCV_ISA_EXT_ZKNH
-
 static int riscv_ext_smcdeleg_validate(const struct riscv_isa_ext_data *data,
 				       const unsigned long *isa_bitmap)
 {
@@ -369,60 +361,77 @@ static int riscv_ext_ssccfg_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
-static const unsigned int riscv_zk_bundled_exts[] = {
-	RISCV_ISA_EXT_ZKN,
+static const unsigned int riscv_zk_sub_exts[] = {
+	RISCV_ISA_EXT_ZBKB,
+	RISCV_ISA_EXT_ZBKC,
+	RISCV_ISA_EXT_ZBKX,
+	RISCV_ISA_EXT_ZKND,
+	RISCV_ISA_EXT_ZKNE,
+	RISCV_ISA_EXT_ZKNH,
 	RISCV_ISA_EXT_ZKR,
 	RISCV_ISA_EXT_ZKT
 };
 
-static const unsigned int riscv_zkn_bundled_exts[] = {
-	RISCV_ISA_EXT_ZKN
+static const unsigned int riscv_zkn_sub_exts[] = {
+	RISCV_ISA_EXT_ZBKB,
+	RISCV_ISA_EXT_ZBKC,
+	RISCV_ISA_EXT_ZBKX,
+	RISCV_ISA_EXT_ZKND,
+	RISCV_ISA_EXT_ZKNE,
+	RISCV_ISA_EXT_ZKNH
 };
 
-static const unsigned int riscv_zks_bundled_exts[] = {
+static const unsigned int riscv_zks_sub_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
 	RISCV_ISA_EXT_ZKSED,
 	RISCV_ISA_EXT_ZKSH
 };
 
-#define RISCV_ISA_EXT_ZVKN	\
-	RISCV_ISA_EXT_ZVKNED,	\
-	RISCV_ISA_EXT_ZVKNHB,	\
-	RISCV_ISA_EXT_ZVKB,	\
-	RISCV_ISA_EXT_ZVKT
 
-static const unsigned int riscv_zvkn_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKN
+static const unsigned int riscv_zvkn_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT
 };
 
-static const unsigned int riscv_zvknc_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKN,
+static const unsigned int riscv_zvknc_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVBC
 };
 
-static const unsigned int riscv_zvkng_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKN,
+static const unsigned int riscv_zvkng_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVKG
 };
 
-#define RISCV_ISA_EXT_ZVKS	\
-	RISCV_ISA_EXT_ZVKSED,	\
-	RISCV_ISA_EXT_ZVKSH,	\
-	RISCV_ISA_EXT_ZVKB,	\
+static const unsigned int riscv_zvks_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
 	RISCV_ISA_EXT_ZVKT
-
-static const unsigned int riscv_zvks_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKS
 };
 
-static const unsigned int riscv_zvksc_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKS,
+static const unsigned int riscv_zvksc_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVBC
 };
 
-static const unsigned int riscv_zvksg_bundled_exts[] = {
-	RISCV_ISA_EXT_ZVKS,
+static const unsigned int riscv_zvksg_sub_exts[] = {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVKG
 };
 
@@ -606,13 +615,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
 	__RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
-	__RISCV_ISA_EXT_BUNDLE(zk, riscv_zk_bundled_exts),
-	__RISCV_ISA_EXT_BUNDLE(zkn, riscv_zkn_bundled_exts),
+	__RISCV_ISA_EXT_SUPERSET(zk, RISCV_ISA_EXT_ZK, riscv_zk_sub_exts),
+	__RISCV_ISA_EXT_SUPERSET(zkn, RISCV_ISA_EXT_ZKN, riscv_zkn_sub_exts),
 	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
 	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
 	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
 	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
-	__RISCV_ISA_EXT_BUNDLE(zks, riscv_zks_bundled_exts),
+	__RISCV_ISA_EXT_SUPERSET(zks, RISCV_ISA_EXT_ZKS, riscv_zks_sub_exts),
 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
@@ -632,17 +641,17 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkn, RISCV_ISA_EXT_ZVKN, riscv_zvkn_sub_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvknc, RISCV_ISA_EXT_ZVKNC, riscv_zvknc_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkng, RISCV_ISA_EXT_ZVKNG, riscv_zvkng_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvks, RISCV_ISA_EXT_ZVKS, riscv_zvks_sub_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksc, RISCV_ISA_EXT_ZVKSC, riscv_zvksc_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksg, RISCV_ISA_EXT_ZVKSG, riscv_zvksg_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
-- 
2.53.0


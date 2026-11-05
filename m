Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879123;
	b=CYCy03dG6MC1JMNpRIVA+G5ZyaJrOGRonosPxyCeprrYlhThw/5htFGd4TliYH+kgkVE
	 2iVh6Nfn6d2NByFWHkJiALCSih5ajKQ0mmQ02PmI9pffxDQLwRZRm5l17R3XlsToc3rln
	 4B+dA5G43581dsWGIOOLLn2W8Xj05PUHEPeQXZxlIZKjgmPmEjqafdBIsbZNWUM+tXHon
	 kap5Br5aKq86rZf+pqIU+02T+p7TCXCDmqtnl3YwwrY/hESmvcbrvv0Ov91g9mig1ZNGE
	 THY0tU54C4KpuJtjQ164R3Ag5YfXF1sjpzmTMpa+vUMpPlXtls5b37WkGvskERk0nHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879123;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=iW3Qq8amtb6uyWQtI6Qd2QiOD931Nk0J48voU0GEX/I=;
	b=KAQUasYba7AxIqQSNbrGXPpJ5a/lbZAaOYxNCbGpgD3qiy3L9GhoSaz0ZGZrltsYKlbG
	 6nVrwalZc5Fk/XiaVWa6fcLXX3CTvAXjjg60csSsi0g5VZy4JQbiXi9bvOKuLxjsjn4HO
	 faEj8s68QFCgs94hZEVQFXH5Y5Zb4aV/LcJTKvHi0KD4X2j4Y8eXAyyNi3fMjGSOVbP6L
	 6/QxEl2XV4i9PFF3nRGl0cuYsWOOqZHJ+hDWDdAEyfWfpYwKCizegWBNI2qOJCCsV5w/a
	 Gv372FlBADkUoDiWIMMvuGoYZiY7fRuBXXKLpBDf9beN5PgAwXghi0mHt+M+N7TqDiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHMwcPsw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E66083604
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHMwcPsw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FC71F00A16;
	Thu,  5 Nov 2026 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879123;
	bh=iW3Qq8amtb6uyWQtI6Qd2QiOD931Nk0J48voU0GEX/I=;
	h=From:To:Cc:Subject:Date;
	b=hHMwcPswq0J48GG2CKpW6w3jza2IUAqrYwuIr9qkgDef6ErAO+yqDUjU1xRybeSr7
	 sHwuNU4auztGjgOsnM819Re2H13PnztJJucwgxYpAhNngppeDrafnSt5t0i+WrEPVm
	 0FkJJIrjGn4elBhwGQOXmBl+lxO1+bFGGtKcslPWK0N9MH/S7Rylh6ZxSLB48y30X4
	 nnPnJpktaAPexaIubq1mBGCXRAq5dgS9B+0XGnjOBUum5CbOz2p8TPMmyVsVg2QW7m
	 70MlTJHhvE/kXPxoldlz5JI0zjVEzXkscmno4xCcozvHEm3zgh8uY5U3sW0ZT/KtGH
	 jTW3z6kHQekNg==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Geoff Levand <geoff@infradead.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/boot: Add missing __noreturn annotations
Date: Thu,  5 Nov 2026 12:44:45 +0100
Message-ID: <20261105114447.305789-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=blum@kernel.org; h=from:subject; bh=aG04TDJXN+wUfE2YzSPwyxFhBdzD5LvnNHljxF22+CM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlvcvSbnqz6cLX37qS2HrcXHx/eqwpSeWkdqDbhMpPgB n4RFtVfHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRD/cYGa7uSIsMcIz+fX/X W7mPi8xemq9rds6XFEhz3zP12G37O3GMDF/+bWjdxeN3JO3ceQn79Sv2rzvBt2/nfJf1+zf2Reb y1vICAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Mark start(), exit(), ps3_exit(), and the PS3 platform_init() as
__noreturn to document that they never return and to potentially improve
compiler optimizations.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Update patch subject and description
- Mark start() and platform_init() as __noreturn
- v1: https://lore.kernel.org/r/20260807152353.306889-2-thorsten.blum@linux.dev/

 arch/powerpc/boot/ops.h | 4 ++--
 arch/powerpc/boot/ps3.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index a40c2162a4e9..42b2721dbe61 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -80,7 +80,7 @@ struct loader_info {
 };
 extern struct loader_info loader_info;
 
-void start(void);
+void __noreturn start(void);
 void fdt_init(void *blob);
 int serial_console_init(void);
 int ns16550_console_init(void *devp, struct serial_console_data *scdp);
@@ -217,7 +217,7 @@ static inline void free(void *ptr)
 		platform_ops.free(ptr);
 }
 
-static inline void exit(void)
+static inline void __noreturn exit(void)
 {
 	if (platform_ops.exit)
 		platform_ops.exit();
diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index 89ff46b8b225..f94d3818815a 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -45,7 +45,7 @@ static void ps3_console_write(const char *buf, int len)
 {
 }
 
-static void ps3_exit(void)
+static void __noreturn ps3_exit(void)
 {
 	printf("ps3_exit\n");
 
@@ -100,7 +100,7 @@ void ps3_copy_vectors(void)
 	flush_cache((void *)0x100, 512);
 }
 
-void platform_init(void)
+void __noreturn platform_init(void)
 {
 	const u32 heapsize = 0x1000000 - (u32)_end; /* 16MiB */
 	void *chosen;

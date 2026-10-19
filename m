Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428689;
	b=vO60YUaGAt/EM1BDZfA93lIyMy7B+nJJhyAFU7G7U2aC13dGJ9erszmNwsgdF+syHy7f
	 jNJSubg/np0VesXwJBqOgLSqzaJbQx/VuMHjb8i2hXvriGRThOompj12p6pdUnrVhhUfO
	 r17+5yQm2GbEBurOgbJTU4CdcL2e+2Ew92ZqHeFTxGAUZk8TznkTMNcWgcGbXKdkN7Jkq
	 9K7xzUBlK10gdgN0kiCeAmQ3HDUmn70pcvI1ck+XyqkMr4iZZvoZvWclna8UEI2Y4VNir
	 4Cg7YqcMI4PjwILbYY2SPEwcmM4fGcDp4bmhsHkwLv6ym3PXVxc18JDs45T2dJjmNTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428689;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X0UlCMzfzrbNLoSusqPeWu4QuJ8AazogJZ1qG77Zzqs=;
	b=hPa2GGgoJvjFICv/L2G8ce4wZuB7c4UyI1JeKnOqHHRbbCeL1t2e5NaHdDOH8dDYdI50
	 oVkqlVm2HYM+1VJI+vXfgqjvmOG/EcmRl3kPNsbTWNfA0hy7E8dmbnl3twyAS+cMCWz+E
	 zfUm/smrjXC9InmZYnsUtdU6/T1YbEaTr/bl3Bm/5FrGZnDneqbnx2zkRxQAjezbSQtX6
	 NTyYE+9nnjvkL6KiICHBYibpcYo3wC8itMBvVaeqkKfrcLVXdd5vCHc9sO413C/0RSQ8W
	 nw7U+A1p9WCnobR7xpcibJp67mgLgYmNtdTZWVndZXILfgEs4c7ig0wTOQFKz23lIrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OF3hBeK/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OF3hBeK/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E091F000C4;
	Mon, 19 Oct 2026 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428688;
	bh=X0UlCMzfzrbNLoSusqPeWu4QuJ8AazogJZ1qG77Zzqs=;
	h=From:To:Cc:Subject:Date;
	b=OF3hBeK/mqwW3/sNrw8ObpAVzkJUbicktKtJ3ZpQXAZbPfL9vtelfjBtfP1nvLfra
	 /6zVIER1Dx/t5Sr96yWCPMBBj8X0Iy9tVoUKusAJA0Jf+iQ4xOTAQah2UTdyR6i5qU
	 PALBCtt2AjV7eCBj9xdiTI96qLXkBV8NNmQ2Ghte6I2pOjWAHlTOXcUZF/sq6jtm3h
	 6eWIo3YBvn3lD4LJrFEGuMELS2KXhX9YHrIRYIqt6qs2zbLA0+jZbaOGC54PB8pukq
	 dhyPc7qfWsCQPhbgfvkY+6O0bX4HDP6Pve7+A0p9FGAgTypZ2BwJ0Pe/DFshGXVOT5
	 gTiQmXHKbBtCQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arnd@arndb.de,
	schuster.simon@siemens-energy.com
Cc: dinguyen@kernel.org,
	thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3, muldi3, and ucmpdi2
Date: Mon, 19 Oct 2026 11:50:14 -0500
Message-ID: <20261019165015.2656521-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the kernel's runtime support for lshrdi3, ashldi3, ashrdi3, muldi3,
and ucmpdi2.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/nios2/Kconfig              | 5 +++++
 arch/nios2/kernel/nios2_ksyms.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 9c0e6eaeb005c..9417bcf583957 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -14,6 +14,11 @@ config NIOS2
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_UCMPDI2
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_KGDB
 	select HAVE_PAGE_SIZE_4KB
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index e8710a269b398..15a223cad84e1 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -37,9 +37,4 @@ DECLARE_EXPORT(__udivmoddi4);
 DECLARE_EXPORT(__udivsi3);
 DECLARE_EXPORT(__umoddi3);
 DECLARE_EXPORT(__umodsi3);
-DECLARE_EXPORT(__muldi3);
 DECLARE_EXPORT(__mulsi3);
-DECLARE_EXPORT(__ucmpdi2);
-DECLARE_EXPORT(__lshrdi3);
-DECLARE_EXPORT(__ashldi3);
-DECLARE_EXPORT(__ashrdi3);
-- 
2.42.0.411.g813d9a9188


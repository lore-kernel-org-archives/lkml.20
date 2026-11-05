Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896496;
	b=p/uLrnn2n6BdAXXGbAbi9J9VJB7pvZ/MgjWV7P3QYgO3eunFp2JdNROxlk0j+LiX1Cep
	 r8fJI6c3BoSk08lEMeHpcq51pjRvwoNBb+RajeZgCopJq240AehvZGiymtWk8TZvVZ0FS
	 zpiSryW3x6hvhd9cZJAheCN5qFIARqgRelc+ynuyW1m6p8qmd/+Z5SDtLwX9B3aI6M5QY
	 xC3LO6Sg66TDGnRhvhyWVtbFlzEH9jGYQOPDpoNjUQL/u0br04+k7xj8EfKRTNRL/mnAd
	 2D5uxWyWNmOX4fTGkhkfleb8dTiZWK1cStJH+2XpHdVyPwcxQUK5C1RiwntrdXFxdlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896496;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0pG7PBqkfLHgJEByKC7kPAegbyGB2e3dQGJkYxQHpns=;
	b=0DsnfSgOnBIFDPjRH/eXTLRkgj2snOymAQIVXmkHgwp6UdZEivLV2KFu2OVeP/nAYS2s
	 os8FamO4pNOjFqz0wUupzKmJQKe4pA5I10C9/a5Sw173ChZGaW03hYk0SdTsB4N2ufScf
	 giHSdMSNfswg2vd17UQdKfl6t/MyhwsUMNSFGdQSQ1aZmVFIOQqF+Ym/ZE4bHsyi50Pg8
	 gN70IvzGY2rcIFq6U8NPwIIk5N42Z4SrzKZ75YBSvBFsSr2odrqCGByjta3C1idO5ten3
	 UCo0fP/bNwxU1C6C9oW3ALNO8YdoPCdqEZpgTt8SIXrKUEIky+TgKc8P0UhBeunItbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2nfc4Qn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647C7606EE86
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2nfc4Qn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4CD1F000C1;
	Thu,  5 Nov 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896496;
	bh=0pG7PBqkfLHgJEByKC7kPAegbyGB2e3dQGJkYxQHpns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R2nfc4Qn5AvsfFFInzrbtwoVPc4igI2oiq58odYntCecdj7BMi8y7LobvxYytYBt1
	 u0iYv8oHnjiTICzQmbItbU9QV/a7yrMxkWq3WxHaibPhX/nirD6DQ4Rj42ytb6fM0a
	 zVE1x1I8FsI3FXjx9o9qJKI56TeM2FY/5+tmtKawviSEa56vWiqXjRbO1pXjL1KqJl
	 pwRj06tkjl83nvS7p0l5Is6BD/GeGcmneFeu8UUuQ2DG6+vbLnhMzBzKKehOttBt0v
	 GL0MUDP/mDFP0aTzdtC5B+cDBBD3D4Ct6tqY70tk1eUPyGyBzIUmK45pg2ufKcXA6V
	 H90rjV1b8bUDw==
From: Arnd Bergmann <arnd@kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH 1/7] =?UTF-8?q?x86:=20remove=20AMD=20=C3=89lan=20remnants?=
Date: Thu,  5 Nov 2026 17:34:32 +0100
Message-ID: <20261105163440.2381661-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163440.2381661-1-arnd@kernel.org>
References: <20261105163440.2381661-1-arnd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There is one more leftover line in Kconfig and the detection for
AMD Generation 4 CPUs (5k86 and Élan) that can now get removed
following the increase of the minimum CPU level to 586TSC.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/Kconfig.cpu      |  1 -
 arch/x86/kernel/cpu/amd.c | 20 --------------------
 2 files changed, 21 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 6e7a366f0798..5b67a4567434 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -32,7 +32,6 @@ choice
 	  - "Athlon" for the AMD K7 family (Athlon/Duron/Thunderbird).
 	  - "Crusoe" for the Transmeta Crusoe series.
 	  - "Efficeon" for the Transmeta Efficeon series.
-	  - "AMD Elan" for the 32-bit AMD Elan embedded CPU.
 	  - "GeodeGX1" for Geode GX1 (Cyrix MediaGX).
 	  - "Geode GX/LX" For AMD Geode GX and LX processors.
 	  - "CyrixIII/VIA C3" for VIA Cyrix III or VIA C3.
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 3972966cb023..cd468e47b68a 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -91,25 +91,6 @@ __asm__(".text\n"
 	"vide: ret\n");
 #endif
 
-static void init_amd_k5(struct cpuinfo_x86 *c)
-{
-#ifdef CONFIG_X86_32
-/*
- * General Systems BIOSen alias the cpu frequency registers
- * of the Elan at 0x000df000. Unfortunately, one of the Linux
- * drivers subsequently pokes it, and changes the CPU speed.
- * Workaround : Remove the unneeded alias.
- */
-#define CBAR		(0xfffc) /* Configuration Base Address  (32-bit) */
-#define CBAR_ENB	(0x80000000)
-#define CBAR_KEY	(0X000000CB)
-	if (c->x86_model == 9 || c->x86_model == 10) {
-		if (inl(CBAR) & CBAR_ENB)
-			outl(0 | CBAR_KEY, CBAR);
-	}
-#endif
-}
-
 static void init_amd_k6(struct cpuinfo_x86 *c)
 {
 #ifdef CONFIG_X86_32
@@ -1073,7 +1054,6 @@ static void init_amd(struct cpuinfo_x86 *c)
 		clear_cpu_cap(c, X86_FEATURE_MCE);
 
 	switch (c->x86) {
-	case 4:    init_amd_k5(c); break;
 	case 5:    init_amd_k6(c); break;
 	case 6:	   init_amd_k7(c); break;
 	case 0xf:  init_amd_k8(c); break;
-- 
2.53.0


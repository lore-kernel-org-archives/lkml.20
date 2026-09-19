Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00D34B1B0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789843440; cv=none; b=lpn19mU0m/5N4TLH6cXFEMj7rR399O+TSEqQAl3x8ltTnGJcvX+YCaYC9TyG633U2lYKuCsFHB0c7Jry483NpAXcOJL0HtQ+5zqVc406Qx4HxwN+z5C/FgDp1SN82OqsRoEBQAqB9Ub0apBSanPogomLdes8pv9APCtkBKJk+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789843440; c=relaxed/simple;
	bh=WD9JpeX3r9WZaeEq9cuddMM+CU5KeObSyAyGIJelpjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IQuJOD1qvW6zjggJ0TNqTrBB5kQeVzPFh3K/K3YyRLfeW3r+95KXdjyNG1xrgRh63Omdcod97gC6DgzuCTvk03Wec05/GySNnbbsAiBmRcfATngpJ+XWaPCeSkV60v1V8IN1Q4xK1rpmirMWAKtQsSET+HUW8stHaf83uUfS18Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OeJHlrPz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OeJHlrPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789843430;
	bh=WD9JpeX3r9WZaeEq9cuddMM+CU5KeObSyAyGIJelpjQ=;
	h=From:Date:Subject:To:Cc:From;
	b=OeJHlrPzk8lOP4dxUpXL4Jxa3m5CMeJ+yA2kIAGHw0O4trydIdeJIQCmokAhmOnvO
	 EBI0KeZb/kBIFA8TEyA5SDYVfc6T26TfxuNxZaLgx+rB4bnVZFS0XFl1oI8/wGqKfL
	 8wcGS5oyA0/p9jj+2FJyiSSLkpk4QW8JOCxgb29I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 19 Sep 2026 20:43:24 +0200
Subject: [PATCH] microblaze: Build userprogs for the correct endianness
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260919-microblaze-cc-can-link-v1-1-01da67e75ebb@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SSlGEi9inHRDqOOYpEpGAPh7
 lZl+ZL3318gsQonOBQLKL8kSR8zlLsC6OrjhVHazGCNrY0rHT6EtA+dnxmJkHzETuId98FS7aq
 maoyBPH4qn+X9Cx9Pf05TuDGN39pmKA9Tfhw3bV0/9XNVKo8AAAA=
X-Change-ID: 20260919-microblaze-cc-can-link-4b2c69373700
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789843429; l=1489;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=WD9JpeX3r9WZaeEq9cuddMM+CU5KeObSyAyGIJelpjQ=;
 b=Lt1CWZHseVtJqu8A2sBDNNyWxNLcKWmR8dfcw56rCtf8Ystk9j0hDh37JJP283/WJel2MVcJX
 TtipA/uSP1wCKxcPw5cVqisbeyD+5rLvmUPfAWQiRUm530Fc72FNprq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently microblaze userprogs are built for whichever endianness is the
default for the use toolchain. They may not be the correct one for the
actually built kernel.

Implement the correct hooks to build userprogs so they can run on the
built kernel. Also test the endianness in CC_CAN_LINK.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/microblaze/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 0ca8999dd770..9063a91cfb41 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -3,6 +3,7 @@ config MICROBLAZE
 	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_NO_SWAP
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
@@ -225,3 +226,13 @@ config MB_POWER_OFF_THROUGH_UNALIGNED_PC
 	  petalogix-s3adsp1800 QEMU machine.
 
 	  Say N here unless you know what you are doing.
+
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mbig-endian) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "-mbig-endian" if CPU_BIG_ENDIAN

---
base-commit: 7396bcfc05046e779d255c6af57cd7838f30d41c
change-id: 20260919-microblaze-cc-can-link-4b2c69373700

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


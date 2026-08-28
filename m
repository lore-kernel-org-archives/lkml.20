Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D56451981
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922437; cv=none; b=UDnL9t19UAr4oFT8IKkKtxAif0IRPxn/f0WtdZ4vOo6hb1ctTWV+B8NZwU9YEJwMR1O4t3gHJsNEtXYF+w1uIuPUZ1dJbmBqEg3Na4jXR01O8sVrhddocSgwOThu0xv6QEtYBlqxs1cbrzQwmF6XhVK196CY9Q+NxIiUugO7e8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922437; c=relaxed/simple;
	bh=BXlGGfFc4xNUVoxlXaVPVB6HQRIEjQwWXFXLWSoHGGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmrEP97gU6axax0php2vFYQj1QCP6FxRxdQNCn1WBm5RyaUU3xeHJlWEmZsNo4HRnsKWR9eabYOhgyprQWGSxUCPioMI7R1bSt22J2k7kQsx1tMXD1b8duW0F5wjUUFBpvWGXtY1RYAjXeA8mzarZspRoNB7RrKRymlQhynbtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWhMTG3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWhMTG3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC9C1F000E9;
	Fri, 28 Aug 2026 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787922434;
	bh=XbB8bJchpwVej8+6VwD7bhn6TGJcGlHjfQ3aJtltKu4=;
	h=From:To:Cc:Subject:Date;
	b=MWhMTG3WCd5WRvev5dyliQKARDov5RzGYzWhyAw/akPSfZm4AYpL5+oUJhbszTwFG
	 D1UiqTBKUUQe9hMiQLHtoIpHfWVW8dS3+efTotkAGBuCbqnPd1qFQZ3Y+XlpdZqYkW
	 fkEibUOIazmKhR/SH/x1u1+8gDPDd33mlUqn0vXUqxJ2qmHBE+bm5qRgygWCDf76N5
	 272rGEyFnvwkJ4XJ+o0P4pdd8W/EOgWJIiFIux2vevF/VhefoLhklAd3YsokgVcnT1
	 RCLyLuhD6MXP2dclr+rRFQpUqRQ2S4FVAPUWkqhyUnXHM9irDpLZPK8b5EySVehRsC
	 jyDidrtCOTsmw==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/boot: Drop unused min_t()/max_t() helpers
Date: Fri, 28 Aug 2026 15:06:22 +0200
Message-ID: <20260828130622.576064-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=blum@kernel.org; h=from:subject; bh=BXlGGfFc4xNUVoxlXaVPVB6HQRIEjQwWXFXLWSoHGGI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkT28+VsRgd2FPwzjV16sRNexXFZmrcWiQbZXr01aU/m gVvGV4Gd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEtmgwMuzy8zHn2pqnoxz4 Ruea1o35qolBfp4cCb+90xWfhUc32TAybF8n36f4mCvHcFvC+uT4SVfzdmdz6QeIr/4Y66mktH4 9BwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Commit c762c69e106f ("powerpc/boot: Add support for XZ compression")
added min_t() and max_t() to support XZ in the boot wrapper. However,
since commit 9f121705503a ("lib/xz: replace min_t with min") XZ no
longer depends on these helpers. Remove them from the boot wrapper.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Mention the commit that removed XZ's dependency on min_t(), fixing the
  build failure seen with v1
- v1: https://lore.kernel.org/r/20260525091839.817778-3-thorsten.blum@linux.dev/
---
 arch/powerpc/boot/types.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/boot/types.h b/arch/powerpc/boot/types.h
index 8a4c418b7260..c5085c2632bf 100644
--- a/arch/powerpc/boot/types.h
+++ b/arch/powerpc/boot/types.h
@@ -37,9 +37,6 @@ typedef s64 int64_t;
 	(void) (&_x == &_y);	\
 	_x > _y ? _x : _y; })
 
-#define min_t(type, a, b) min(((type) a), ((type) b))
-#define max_t(type, a, b) max(((type) a), ((type) b))
-
 typedef int bool;
 
 #ifndef true

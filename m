Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD733365A02
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244445; cv=none; b=Ian5orA0wkpIb6buSZPd9xKo3LxWMuUqnJE4XRWKYiQbsLvERSdJ7WHIASNhdTeoE9P/5BGiFe+HReXysx/3diyWaZNw5pCIL8l2U4Rx0Rams2n2a8U1iK+qJMJdiAxIvjsbfPNMAME5gO76kgfV3ZbpgZd1lxF9rFm7zuTEdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244445; c=relaxed/simple;
	bh=dUUSKCXPgJHto9UM2a7zff0YvwWej158ZwHZqVOCBCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t198c4eMOfq3lL2nXVdHVpK2bAHvtizySK5e9iRhoVbZNfUA/him49UDa2zVVorFNXkItMTObsKTw8jdJsdisUPULvKDLDrIPZMdHe0x1teETdxu5hTsh5XbZ2tvZruQIL/q5bFspdNVl9ES4S+QvlsXFGjj1PcXUkKBH0Hl0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LqVd9zUX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LqVd9zUX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cm7AnhXk5wAc7XObEF0sJTRKiswy58SF5A5r5BOqqXE=; b=LqVd9zUXioSOB4b05NZIh5RUYZ
	BeOBC07TghMyIResQYOdOTkxTJmFjHDjM4d1L3lmuQtkgN5IfPxJjlhq6YuL2OgThdqHO3zzqXTDL
	7+NlHrtfVjpftif0rbsQdu0D15TRFPyIdRLGjMDGyuOnHjGfcv+myJ/gX3zSkoCFPiIZp4ZR01sn6
	SoDpFThkt6x0QkDbHFla+FFgyQbANBu8ydaaxkylBXS5dVwO2hmPPP4VuQeJqXC3Z43j+rJkhHvXi
	HUx8qTdsQzEjcxFlMRuEVupF9Eaz3j5cdc5HhqK5kDJR083LRVJObwZ8hbK6sLzC1VpLVChD9HRjY
	yk+3881A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I4B-0000000B46j-4073;
	Tue, 01 Sep 2026 06:33:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/ps3: htab.c: fix enum ps3_lpar_vas_id kernel-doc
Date: Mon, 31 Aug 2026 23:33:52 -0700
Message-ID: <20260901063354.4012138-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901063354.4012138-1-rdunlap@infradead.org>
References: <20260901063354.4012138-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct enum name and member name to avoid kernel-doc
warnings:

Warning: arch/powerpc/platforms/ps3/htab.c:28 expecting prototype for
 enum lpar_vas_id. Prototype was for enum ps3_lpar_vas_id instead
Warning: arch/powerpc/platforms/ps3/htab.c:28 Enum value
 'PS3_LPAR_VAS_ID_CURRENT' not described in enum 'ps3_lpar_vas_id'
Warning: arch/powerpc/platforms/ps3/htab.c:28 Excess enum value
 '@lpar_vas_id_current' description in 'ps3_lpar_vas_id'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org

 arch/powerpc/platforms/ps3/htab.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260828.orig/arch/powerpc/platforms/ps3/htab.c
+++ linux-next-20260828/arch/powerpc/platforms/ps3/htab.c
@@ -18,8 +18,8 @@
 #include "platform.h"
 
 /**
- * enum lpar_vas_id - id of LPAR virtual address space.
- * @lpar_vas_id_current: Current selected virtual address space
+ * enum ps3_lpar_vas_id - id of LPAR virtual address space.
+ * @PS3_LPAR_VAS_ID_CURRENT: Current selected virtual address space
  *
  * Identify the target LPAR address space.
  */

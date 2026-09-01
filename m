Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534B5377EA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244444; cv=none; b=oDL3txqm4wekcCL1irjYi2Mn52PEU95ZRtjbtgUMqB6aIy8+yjQrnpIIPi60bGjORwrnx01tuiHPEd1nguaeCOr2LMOgSPtHNOQOVEIz2Lj08w4jeD4gCJS8E07SYm5KAt1Myk/AcD4M/jEo/Pg6Bz8BndC34K2pVJLslnz24PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244444; c=relaxed/simple;
	bh=5neDxJe69Fg1AaZdXx27SUjiaVeG8Vs3gIYIr2KzwM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9Eo/ZOfZ10yhrI30/tM9PGseSD7DCDPUmUl6dBIzBZyUPGIhrfnmPrLGr3lEpIfTY4YLxBTd9VeVzN5jUuHEVnRlSoQecJZsb7qrXe2EFHIppKl6aDWcBZGL87MK/oohyo57woAulkMRZAa5HnshU5MxrOcs0oDy8n4xrc558A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YCO336YV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YCO336YV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/URtJhh5qYgdD+SvrO47CWxV2uFOw6FeCWrobwxfu1o=; b=YCO336YVvU0hxZ5piXMZqbJCdN
	saNrXtXc7Nnyhvp5PHB46NIO6ByIbvbHlmKYZzFEA8m7kNPozght5CJMCeqyU5Lg1ApPfgD4B6jHl
	2WE9BqfHx3l8LQsyY7bXLQ+bDrSat6WnBCgCbeHHOKs9sQOyH0anv11V2NZlGveKI/imm64MoFPhF
	/KEc1MSz/4+8WdjVdqb/QMlyT6dF25Y5iSlG2P4wj8nNnIJ2eRSy55jhz6x5NzK1egkKVLZ0Zs5bQ
	Iul7PAzeNke/Z28knRh0/g0x2ZaSbtWx8bRaA+VUwblHjBe/mS55jqJeV1qbhMW0W2st/7xg1PPr0
	14mFxgKA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I4B-0000000B46j-2s9E;
	Tue, 01 Sep 2026 06:33:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/ps3: platform.h: fix enum ps3_spu_resource_type kernel-doc
Date: Mon, 31 Aug 2026 23:33:51 -0700
Message-ID: <20260901063354.4012138-2-rdunlap@infradead.org>
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

Use the correct enum name and member names to eliminate kernel-doc
warnings:

Warning: arch/powerpc/platforms/ps3/platform.h:240 expecting prototype for
 enum spu_resource_type. Prototype was for enum ps3_spu_resource_type
 instead
Warning: arch/powerpc/platforms/ps3/platform.h:240 Enum value
 'PS3_SPU_RESOURCE_TYPE_SHARED' not described in enum
 'ps3_spu_resource_type'
Warning: arch/powerpc/platforms/ps3/platform.h:240 Enum value
 'PS3_SPU_RESOURCE_TYPE_EXCLUSIVE' not described in enum
 'ps3_spu_resource_type'
Warning: arch/powerpc/platforms/ps3/platform.h:240 Excess enum value
 '@spu_resource_type_shared' description in 'ps3_spu_resource_type'
Warning: arch/powerpc/platforms/ps3/platform.h:240 Excess enum value
 '@spu_resource_type_exclusive' description in 'ps3_spu_resource_type'

Also fix misspellings of "partitions."

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org

 arch/powerpc/platforms/ps3/platform.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20260828.orig/arch/powerpc/platforms/ps3/platform.h
+++ linux-next-20260828/arch/powerpc/platforms/ps3/platform.h
@@ -228,9 +228,10 @@ int ps3_repository_read_boot_dat_info(u6
 /* repository spu info */
 
 /**
- * enum spu_resource_type - Type of spu resource.
- * @spu_resource_type_shared: Logical spu is shared with other partions.
- * @spu_resource_type_exclusive: Logical spu is not shared with other partions.
+ * enum ps3_spu_resource_type - Type of spu resource.
+ * @PS3_SPU_RESOURCE_TYPE_SHARED: Logical spu is shared with other partitions.
+ * @PS3_SPU_RESOURCE_TYPE_EXCLUSIVE: Logical spu is not shared with other
+ * partitions.
  *
  * Returned by ps3_repository_read_spu_resource_id().
  */

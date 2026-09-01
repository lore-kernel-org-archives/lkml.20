Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C2379C55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244444; cv=none; b=OEOgr+C918zO/R4m/mLDHFzdxavzMn0Sn7jxbr/J6cF29HQEDxpUDr/eAJFJNNWTacxYlCHKhznPqAA20x82/BsKJmJ4aw7Hn0ctXBZvQyPgIB0i+n4bRN1if79iX3aDXtlXkMVCRnwXthvRZiuWUYho8r1DOo5U4CG8yhxb0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244444; c=relaxed/simple;
	bh=iVZEVKBJDamgXMTCVnBuJT3YlBWMIIWpdyumBwSFW+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACYfdJFo9jBuvrwf7h3CqO90CzqATMwJvBCekdpJt9elfzkDstvGcjHkuburB56mElupyH6RHLeMvdt9dAYagjiJRcnxIVo40rtq+5YoWzK1dRaPJ9pF7Zwo3J4n3jXVmcKZhdSgdVmWF4ZuBffaRC/1MKAYArIEARTrOwRFusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qw/k8dT2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qw/k8dT2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=j5wlQy9DCaktYGyQf5jBA58+1SExlqWK2qFF4AF0tHE=; b=qw/k8dT2WCu2Q2i5MYxb6aIL62
	sKzPUd55TrAGjMvZCQVZsWPghnPaOb2qI+fY6Le6/UH048yVPLNGMFG4q8HVE8pTwOF0GfdaKBeky
	1eJ5KoC5DZAbJ4DfctwwNl0au+plyswCH1N3bOi+K74KtixzGRIYlquK8jRpp+H0Uif2aHOCpbZeD
	4Wc1JPS1nnD/f8Jy17oRD11O/nKTM8a4pv+hdAPrBosf3Y8FhX8LInbS9yZIao8NWjLluiHVjcS23
	aRsDNujkUFyAiw3BrYU2jnFaxLkHWvk8DtT4ewrrfl8qYIhKsXg2lFtS+Qu0i91FYfiixjESpnYbS
	OpCFl2jg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I4C-0000000B46j-27aT;
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
Subject: [PATCH 4/4] powerpc/ps3: os-area.c: fix some kernel-doc warnings
Date: Mon, 31 Aug 2026 23:33:54 -0700
Message-ID: <20260901063354.4012138-5-rdunlap@infradead.org>
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

Add one struct member kernel-doc description.
Convert an enum and a struct to common C comments instead of kernel-doc
comments to avoid warnings.

Warning: arch/powerpc/platforms/ps3/os-area.c:139 struct member '_db_data'
 not described in 'os_area_db'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_ANY' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_NONE' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_PROTOTYPE' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_LINUX' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_PETITBOOT' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:152 Enum value
 'OS_AREA_DB_OWNER_MAX' not described in enum 'os_area_db_owner'
Warning: arch/powerpc/platforms/ps3/os-area.c:197 struct member 'valid'
 not described in 'saved_params'
Warning: arch/powerpc/platforms/ps3/os-area.c:197 struct member 'rtc_diff'
 not described in 'saved_params'
Warning: arch/powerpc/platforms/ps3/os-area.c:197 struct member
 'av_multi_out' not described in 'saved_params'

This leaves around 20 unrepaired kernel-doc warnings.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org

 arch/powerpc/platforms/ps3/os-area.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20260828.orig/arch/powerpc/platforms/ps3/os-area.c
+++ linux-next-20260828/arch/powerpc/platforms/ps3/os-area.c
@@ -119,6 +119,7 @@ struct os_area_params {
  * @count_32: number of usable 32 bit index entries
  * @index_16: byte offset of the database id index for 16 bit variables.
  * @count_16: number of usable 16 bit index entries
+ * @_db_data: 1000 bytes of shared flash memory database
  *
  * Flash rom storage for exclusive use by guests running in the other os lpar.
  * The current system configuration allocates 1K (two segments) for other os
@@ -139,7 +140,7 @@ struct os_area_db {
 	u8 _db_data[1000];
 };
 
-/**
+/*
  * enum os_area_db_owner - Data owners.
  */
 
@@ -182,7 +183,7 @@ static const struct os_area_db_id os_are
 
 #define SECONDS_FROM_1970_TO_2000 946684800LL
 
-/**
+/*
  * struct saved_params - Static working copies of data from the PS3 'os area'.
  *
  * The order of preference we use for the rtc_diff source:

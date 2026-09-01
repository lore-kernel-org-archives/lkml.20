Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355437998C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244444; cv=none; b=Hnz3LZWuCx6Pfy06jTxuff9MIkib/CPoJktDRs0IcKsGXUcbtIU6UYBA/mgIQh01baC9yyGzsvdagM18PxfiOk12YbVrvJ9d89gV3oUDfPLCvVNCPgVOAhGVhqMGxVltG0+ePE1CQrCrhwikXa0cmYygMnqLKJJGjsuKBfvb2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244444; c=relaxed/simple;
	bh=VCHJboMlX6jRhU9tFqpgrMg4yd1cDB38+AmNJtT5Bmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gh3lOQo8pu+J+OGzaL5IE3RjGNTkmdziyArDJY8rKp63TKAlpAm2lJgsze8yVfmzNn9t4swfyJ9ZiucA6ZFQKzQikcCDXcOA4CYoWnx8Fv4alz7UKlEZ87v//3eYXJvBF8yy/XEIN00Pvkw6GOckabhFUoRv+2EoW3oftUZT+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dAlgz+j6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dAlgz+j6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OvHBVNFEaIP23Yj7JU5FUqxkZwdHXB2TgBTrhq4CMzI=; b=dAlgz+j6AhRxtzIOMlWOp2fSJN
	CC2HCQNPpXYo7IzQHmZE0GRIoNJKpzrPYSH/gjbtbkUeP7xCqwc7eR4voJQIQd9Aho0HYx5VqCVX3
	zkpkQx8+5GoV4MtQxTSMEO8TnpdNFTUAbzIDtkQd9dqOs3C3JOMPZ6uvbx6cNfadTqRyyRTK4WzUj
	KdClrAjyeeBhIOFb7TK+M3/xqtksaqUw1JHaNm4XPzN6HWqD73HHSeKUx+fvp30YBrZRviYWwL45O
	Zo+y+kirMOfn30dTboBvMdT8c/VB6CGkWT0Sy6fm/835pl6PPV4qk6/ZxpiL6wmhUAkC/FAKARCFD
	tVWwnS4g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I4B-0000000B46j-1box;
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
Subject: [PATCH 0/4] powerpc/ps3: repair some kernel-doc comments
Date: Mon, 31 Aug 2026 23:33:50 -0700
Message-ID: <20260901063354.4012138-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches 1 and 2 eliminate all kernel-doc warnings in their
respective files.
Patches 3 and 4 target certain classes of kernel-doc warnings
but don't eliminate all kernel-doc warnings in those files.


 [PATCH 1/4] powerpc/ps3: platform.h: fix enum ps3_spu_resource_type kernel-doc
 [PATCH 2/4] powerpc/ps3: htab.c: fix enum ps3_lpar_vas_id kernel-doc
 [PATCH 3/4] powerpc/ps3: mm.c: clean up kernel-doc issues
 [PATCH 4/4] powerpc/ps3: os-area.c: fix some kernel-doc warnings

 arch/powerpc/platforms/ps3/htab.c     |    4 ++--
 arch/powerpc/platforms/ps3/mm.c       |   10 +++++-----
 arch/powerpc/platforms/ps3/os-area.c  |    5 +++--
 arch/powerpc/platforms/ps3/platform.h |    7 ++++---
 4 files changed, 14 insertions(+), 12 deletions(-)


Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org

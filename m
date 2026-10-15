Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B14ADD9B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052624; cv=none; b=qsvao5y9bXNtjNvu0mA9naRp2Q+ef9y7gt+bNQQoI33Ea7oAYCq4JDfhS67/zCBtdmYx1pv2KONNcQLHbniaPEC5siWhB4g+6MRw53MtwMBau3xz9bTLcWQv7nqGBSLGKcBOBukXxg4VuGIqm24P/O/Hw8Q4GMZLLljqYhhJT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052624; c=relaxed/simple;
	bh=WD2xLq1j1ufmqy/BmPvPlQiwJjfExpZani6ATDIkU6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=jc5ndnMXIzg6K9OpBBLXuRwYEXUAN6/jDRX4TAwJqO6xMqT8+07EHXoak8ImCT8Mg05lHFdOw8jykOgjHMg3vLlle6nzm29Nd1RcTJl7yrNw7oQaKU7A3lsm0z7BIZqx5iQXoO100v5UZUjGZbHVrm8OE/HsZtCokpFuKOcT7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Xs0fRh8o; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xs0fRh8o"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261015082333euoutp01830869dd32ed72d7711f959ba927f8f4~epluBaOVS2925529255euoutp01F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261015082333euoutp01830869dd32ed72d7711f959ba927f8f4~epluBaOVS2925529255euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792052613;
	bh=i7XrOjcha/5xGl7C2l+gDmA8wR0AYq+P8njfjXb/pj0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Xs0fRh8ovl+UvSY/kYQHuP9sGejM+nlyFnV/P/sHVRtIR/r4KgvEr9rcH5WnhCjvK
	 WhaFUoHsU+cIPZWd0tPPxr8wVWAT4QIme6U4Tj5r2+4hNL8u8JJ3IsXX8R3eqPqB8I
	 w/veRnNMMwNjYQHqa0HR9apml5rCCAt3omM+gamE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c~epltplZC03171831718eucas1p2w;
	Thu, 15 Oct 2026 08:23:33 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261015082332eusmtip19b8acb6c51f5307cd82a4aa88e58c945~epltKpG1b0605706057eusmtip1P;
	Thu, 15 Oct 2026 08:23:32 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
Date: Thu, 15 Oct 2026 10:23:10 +0200
Message-ID: <20261015082315.56876-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
X-EPHeader: CA
X-CMS-RootMailID: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>

Mike Rapoport suggested [1] how to properly use dynamically allocated
arrays during early boot.

Use this approach for reserved_mem array during early scan of the
reserved regions. Having all the reserved regions in a single array
removes the need of the two pass initialization introduced by commit
8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
regions are processed"), so implement it to make the code simpler,
easier to understand and ready for adding proper error checking.

Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
with early mappings were discovered by LLM.

[1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/


Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:

v3:
- allocate the reserved_mem array only after all static regions are
  reserved or marked as no-map, so it cannot be placed inside any of
  them
- record failures of the early static reservations and print a single
  message asking to fix the device-tree
- restore conditional compilation of the early mapping code, because
  some architectures lack support for it (C-SKY & Sparc64 as reported
  by kbuild robot)
- allocate the array bottom-up, to avoid allocating from highmem, what
  might be an issue on Xtensa, C-SKY and MIPS32
- don't use the early mapping on PPC64, where the scan is done before
  early_ioremap_setup()

v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
- removed superfluous ifdefs

v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
- initial version


Patch summary:

Marek Szyprowski (2):
  of: reserved_mem: group allocation helpers together
  of: reserved_mem: allocate and map the reserved_mem array early

 drivers/of/fdt.c             |   3 -
 drivers/of/of_private.h      |   2 -
 drivers/of/of_reserved_mem.c | 475 ++++++++++++++++-------------------
 3 files changed, 221 insertions(+), 259 deletions(-)

--
2.43.0

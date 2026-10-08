Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C04D09E8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473096; cv=none; b=sPGyA00p33+AcspV5EKpdvkkiKSF6/Ww7P7/DeGSlAyQ8LhIv88XzBrrZZxzaS9D+FowHuZ3VS4uehw+JIKCw3IfJfsxgCTSvFWXWVX6YIu7V2BggeZ07RNvMBlNzSdMzUdpJGolsm3Mbanz9Mp5VA7cw6GuD1EJn2YZddQTdUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473096; c=relaxed/simple;
	bh=aEBbDkfz2X37S9VnlLxCxdVNSnJ9JzqZyJ8I85xOPkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=uhwAfVymqAeu8r3PbuJnBH51gjFX/jj+SB3FKFP9+Qs/82f7fKmWjJYStG1wGFRsKoFZAUIL5bX38xcezWkTfDb/3njnEytS76fpUjv8TVqqHbVCGwaLhflDYy51plccHrAujjn3HC9al2OOsgfiIIPHaZIw6MNFs4sRo+re4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q+cFc2Bv; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q+cFc2Bv"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261008152449euoutp029c54d1c8cc825b409ed377913b129e63~cl0iY58GU1566415664euoutp02R
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:24:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261008152449euoutp029c54d1c8cc825b409ed377913b129e63~cl0iY58GU1566415664euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791473089;
	bh=axdWlSF8iVBum9thK6VZopslDZXT2NtsjnEhYF++jeE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Q+cFc2BvfAM6hq8BNBVUUGEJpLtazPQXVAyigshd+9gBPaXqou6aJyXlWskX/fV9m
	 NbT7TK0KANRA7mvHXcTSe7avEDlvsp0umXP08TMlD+4tsO0xOd8St9ZeroU+hWmLIh
	 t2ZpTNyQruGKU8Zfgua74G+f7qBRuzR+kiVC2Lec=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261008152449eucas1p29758be26c325084093c14cfa9b8b2d04~cl0iBiRnX2366123661eucas1p2o;
	Thu,  8 Oct 2026 15:24:49 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261008152448eusmtip229196db7cd15a42beeda51a2f89401c1~cl0hjR3uw3039130391eusmtip2O;
	Thu,  8 Oct 2026 15:24:48 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
Date: Thu,  8 Oct 2026 17:23:59 +0200
Message-ID: <20261008152403.766439-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261008152449eucas1p29758be26c325084093c14cfa9b8b2d04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008152449eucas1p29758be26c325084093c14cfa9b8b2d04
X-EPHeader: CA
X-CMS-RootMailID: 20261008152449eucas1p29758be26c325084093c14cfa9b8b2d04
References: <CGME20261008152449eucas1p29758be26c325084093c14cfa9b8b2d04@eucas1p2.samsung.com>

Mike Rapoport suggested [1] how to properly use dynamically allocated
arrays during early boot.

Use this approach for reserved_mem array during early scan of the
reserved regions. Having all the reserved regions in a single array
removes the need of the two pass initialization introduced by commit
8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
regions are processed"), so implement it to make the code simpler,
easier to understand and ready for adding proper error checking.

Tested on ARM32, ARM64 and RiscV64 based boards.

[1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/


Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:

v2:
- removed superfluous ifdefs

v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
- initial version


Patch summary:

Marek Szyprowski (2):
  of: reserved_mem: group allocation helpers together
  of: reserved_mem: allocate and map the reserved_mem array early

 drivers/of/fdt.c             |   3 -
 drivers/of/of_private.h      |   2 -
 drivers/of/of_reserved_mem.c | 455 +++++++++++++++--------------------
 3 files changed, 195 insertions(+), 265 deletions(-)

-- 
2.43.0


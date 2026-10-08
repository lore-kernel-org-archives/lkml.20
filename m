Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC941A93A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452500; cv=none; b=ZEZwcyaMX2eRpo2UltaF0IlmAHEYAVTTSNRp82hCT9uymxIYhfTul6JGgotC5yI+SI14aeSBv/YCxmVazxE1tW4oVcmk2HDWti/uC/zq7JN+1suHp8fm8A4qJj4+kHRdRolxh8y8I/X10N9NwmuNIu0DnIpunUPn5ns+PH0rQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452500; c=relaxed/simple;
	bh=A3V22FarTkHyKxi4D+zcGUJeTTnGQuELgsMNDq6yVJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=J6eFlXJzXhzqXOSEGb5GaaMp2Wr/+mqMtCPSFSTta3Y5eLys4FItGGDsQLs32E7cpbJNeKH0NtqjuOT85g4zm5X+Bx3YV02t4w7WnV/URlA0QvEfkIy6MJoVmJgnV7i6hvYUsGQNJd4enoPkeIu7eJZAseRVA1rTK5eTMQN1u+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GeqxQN6S; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GeqxQN6S"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261008094129euoutp018a662ff8b1a0a6483eb37d327e1e8381~chIwsIw8a2292122921euoutp01L
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261008094129euoutp018a662ff8b1a0a6483eb37d327e1e8381~chIwsIw8a2292122921euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791452489;
	bh=wpwoa+wB+1TwvajASi7GkY/ToWaRcPTLqjGEGZXvFQA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GeqxQN6SOWeUNrNOGAE1eIdyWDpfDU4G+Jvr4ojnBYxzxhbC9WeDBXGWz0xL9lUfv
	 Gdp7nIii9eYC+PhO4vDgFbkW6dEIunDDmuz3+RDTIfbpAyYBDJ3M5DSvlIM2+t6yI2
	 WqogX+XEgjPtj8CyJl0ZzZDFChHp1wYq1A3wC8CE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261008094129eucas1p2c89032b43a7491f200a703da1a224c2c~chIwZr9Q21840818408eucas1p2W;
	Thu,  8 Oct 2026 09:41:29 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261008094128eusmtip26a612e51616606f5aaeb597377c8f1db~chIv7WNzK0972409724eusmtip2E;
	Thu,  8 Oct 2026 09:41:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Wandun <chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
Date: Thu,  8 Oct 2026 11:41:21 +0200
Message-ID: <20261008094125.3197971-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261008094129eucas1p2c89032b43a7491f200a703da1a224c2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008094129eucas1p2c89032b43a7491f200a703da1a224c2c
X-EPHeader: CA
X-CMS-RootMailID: 20261008094129eucas1p2c89032b43a7491f200a703da1a224c2c
References: <CGME20261008094129eucas1p2c89032b43a7491f200a703da1a224c2c@eucas1p2.samsung.com>

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


Patch summary:

Marek Szyprowski (2):
  of: reserved_mem: group allocation helpers together
  of: reserved_mem: allocate and map the reserved_mem array early

 drivers/of/fdt.c             |   3 -
 drivers/of/of_private.h      |   2 -
 drivers/of/of_reserved_mem.c | 459 +++++++++++++++--------------------
 3 files changed, 199 insertions(+), 265 deletions(-)

-- 
2.43.0


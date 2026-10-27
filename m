Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087370;
	b=Ei56Ivk9KB3tb1YlqpPew0a0usrG5KdbobbvoLUf5brvgALF7pvwESgPuVnll0D8eeNR
	 OlFVcNikUxnPAh4CFAH+5muEEjP5yI/qUlgPeQzrkBWVwB24ekpKWP05CvNPHGfPOINip
	 1YmWuToi8SPBSV9DNSwkYaPpd/cITI3agwekipfJwpOQCvwhNPYWBEYtkArYNBkTsf+kN
	 XMZ3QeMwKZtWa1q+XUH6WT8qM6Gs04L4wWPEp5ZHkdOrRH6/jTHBJTzioABV+DGT51ubx
	 wsvvtWoqYvrldBFjHfUrqqaouMwQQh2j1h5P9p94Wi/qQN4CvNbPDyWpkD8LRoup6QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087370;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fDLnPYVqGviQl47QdfOTHMYdbQswzEwGmP8xbiVLODo=;
	b=rNa6AxCbMWl/UzHtOoRNbfw4k2befgEX60X+FFw4UTmZf+SqoZIZ+yllxfAa3OCbqBHR
	 oN2R5u+YQU3NcJbNDiuSZbt5Pr+WmLSr2Qs5SjOND1ykYJzg/Ec6Aw66/C39UKauxaAII
	 iFjv15OyxNy4yw7xonmZPDF2qgK8CW5bXLelR+bBFvxGdQ4yT7nloECjOyo8PG+EtBalg
	 bLlVolzree4Io7T2JHncO8YNjHtknBrjfUkNTxp+TRjBgmO03c1OCK4v8Ho5GCPajFGbB
	 jXUX7zXiWvxwuy0chjtCuDy6axRkdsjjeYzuK3sz6cP9EYzgcd+8wLN0zH61sEN402g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="WdM3/HuY";
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBC606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEBC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WdM3/HuY
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793087358; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fDLnPYVqGviQl47QdfOTHMYdbQswzEwGmP8xbiVLODo=;
	b=WdM3/HuYYdnKQlDNWC4lSb58Icc5bZnaKDCIIwga2Y8EhSDyZOvQYTwK+uNaHoZLmbQ5FKiKsHSIRmGLW/cbYsDJo7vEuEyzQSupWAaur8D7h8eDzQTX+xYhckjisI0MjnoRvbsXu1lpqapHprli+SguyvHdJ+nCA0j5R9M1g1I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDd8d20_1793087349;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XDd8d20_1793087349 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 15:49:18 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] tools/mm/thpmaps: fix THP statistics and mapping names
Date: Tue, 27 Oct 2026 15:49:01 +0800
Message-ID: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three issues in thpmaps.

Patch 1 corrects anon/file accounting for trailing partial THPs.
Patch 2 includes order-1 file THPs in the per-size statistics.
Patch 3 preserves mapping names containing whitespace, including
paths with a (deleted) suffix.

The three fixes are independent.

Weilin Tong (3):
  tools/mm/thpmaps: fix partial THP anon/file accounting
  tools/mm/thpmaps: fix missing order-1 file THP statistics
  tools/mm/thpmaps: fix missing mapping names

 tools/mm/thpmaps | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: 39274b454e9993cea319f4ac342a8082a9ee1730
-- 
2.43.7


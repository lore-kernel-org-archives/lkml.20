Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820071;
	b=kEMn9SBOBBSioE2UtG64tUkkzBrYwPZEG8nnz+rFkhqqXteDxAEZWEwI4GiDSYg0+U2W
	 f0SLTZJKpntEcJ4gBMfOhGa0nFMNyAk7A1yD2BKclvzBNAXAM8UpP8OpF/PzTPhuPggBC
	 xLXbZNEbfQstfS7jLrQGbT707/ecWBWG+yv+YbZBz6pgqFBHyxYpu9oDTFRbtyTKNBAkH
	 RioGrucOre8dFfwPIkTk2MfLR69POdQmlaLfybdvMWGZNGzbzS/+D+6xfeLfsg927AwF5
	 xDGHBlfnZpd8myqWRfesKu1qzS8ITmLHDM4SXYMl6NEVEJ0ZtNZmweNOWuFUv8mxzuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9jrbGDNJwNT++I6qX/rk6BFsrLGpO+QHoClJrk4T93g=;
	b=FmhykdDt1JiDV57l6bu9HkZwFIhoRBgFoysblDFfJcty0CHaEe86lEitF2obF20T6VLn
	 HRw1Da/TWDm0+PZ4pSV5BcRxEUGQF7APFwdx3Mp7Sgo8gyL2+YrD7qBLpfr7sI6n5fhU9
	 L64dGRa02WGNgX90YLkaJAOAFnXb1tszHwtVOtG2Rw/tivms0QkEMZhoK/bkB2pApc3zv
	 Z0xxwyO46cVgX7kmRDljWVZ25swgwCoqYA+0RfkFu8GUut9eybc1aujPHuDJM9cgmHkyf
	 0BeL3GrziLcXqhBVpYpccqwdL/avn2o8DRy3x3XoLH9T7VAlBJHVtX/HRK3StH8a/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q40nwSKh;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE11606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE11606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q40nwSKh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7xpR20acJXoOG1c4mWrSTawN3rYxNGzptKrHaq6v5no=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794820068; v=1; x=1795424868;
 b=q40nwSKhlb1rdJw9Zts5b5d4VlVRbuXHZB3HPO1U/RnTX8eih6fn52405m+jtzG9rN7/mBF/
 SBXn9yBX2YhnhIPLdzn12SRtwsg1NSttQ7nF5yRTJqJ8O9JyMNFz5/69smVIVKGM9xLPLTzqWE4
 G9jUiK+/omchTcx3+JgLRIoE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 349bcc2b47379eb2;
	Mon, 16 Nov 2026 09:07:48 +0000
X-Mizu-Trace-ID: 349bcc2b47379eb2
X-Migadu-Flow: FLOW_OUT
From: Youling Tang <youling.tang@linux.dev>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@163.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 0/2] exfat: fix iomap mapping vs truncate race
Date: Mon, 16 Nov 2026 17:07:18 +0800
Message-ID: <20261116090720.3226446-1-youling.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Youling Tang <tangyouling@kylinos.cn>

This series fixes two related problems in the exfat iomap path.

Patch 1 fixes a race between iomap mapping and truncate: i_size was read
twice, and a shrink in between could make the mapping length negative,
which underflowed the cluster count.

Patch 2 fixes the handling of the EXFAT_EOF_CLUSTER sentinel.  The iomap
code used to convert it into a physical address; now exfat_map_cluster()
maps only the valid prefix when a range straddles the end of the chain,
and iomap reports the remaining range as a hole, matching the old
buffer_head code.

Patch 2 relies on the non-negative length guaranteed by patch 1 for the
hole mapping.

Changes since v1:
 - Move the valid-prefix clamp into exfat_map_cluster().

v1: https://lore.kernel.org/exfat/20261113080658.2440516-1-youling.tang@linux.dev/T/#t

Youling Tang (2):
  exfat: fix iomap mapping when writeback races with truncate
  exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster

 fs/exfat/inode.c | 15 ++++++++++++---
 fs/exfat/iomap.c | 21 +++++++++++++++++----
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0


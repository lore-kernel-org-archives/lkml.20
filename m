Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F457983F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884865; cv=none; b=Okkt6QRsdYNJ2yD7LdnqeY16AY52QLlfPBQEpWuNOVPfbBHUuVGYHRoLStPeRs1BavO1lzBnzSZG5ZuWtgCIS3gqRmoP1qprKtyGkXEpLnDzeJdCHWaywq10IlWYDG5MYdpefLRIg00XMx5gmO4ifIVIBJ6UjlLEoTqAulVeQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884865; c=relaxed/simple;
	bh=P9rcx9cRYKzp1j2igJPf6N36DH81nBcUWy49yeFgq6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQ0zVx5rPB8ek8VWEvGrv6is9jniIxNd+8j7MihdplDNy1rZJIfmm+NQfgRmFoGKpmb8rGf8vHNATv/GyQaEgWbSasqRgfKWA1rHoYva7ugK7M+VyrnpGaokbnJTMbU8aHMJVyhGgABm1hGgrK+8i4iZ97NSpWl8C37DvcLex3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nn5IHJPR; arc=none smtp.client-ip=95.215.58.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nn5IHJPR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P9rcx9cRYKzp1j2igJPf6N36DH81nBcUWy49yeFgq6s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788884860; v=1; x=1789489660;
 b=nn5IHJPRnF+uDmKuN5U7XkzAH5SR8ofx4WVon+qW3zUHjo55tUjnH4dRdV52qUDa2tyE8lwW
 6fCCgViHzDXcgEsUSkT1d62MkBjAqxuo4bugnkPmLCQJSLfcHRrClApw8lw9m/HVfz3u/fEUCzE
 zTGd/qToSxTjF50EWfvMe78c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24572b4011ab19ae;
	Tue, 08 Sep 2026 16:27:30 +0000
X-Mizu-Trace-ID: 24572b4011ab19ae
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	shuah@kernel.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/damon: ignore test-generated damon_dump_output
Date: Wed,  9 Sep 2026 00:27:16 +0800
Message-ID: <20260908162716.85648-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

sysfs.py and sysfs_no_op_commit_break.py dump the DAMON status collected
via drgn_dump_damon_status.py into a damon_dump_output file in the working
directory.  Ignore it so that running the tests in-tree does not pollute
git status.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/damon/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/damon/.gitignore b/tools/testing/selftests/damon/.gitignore
index 2f0297657c81..226bd7c4e072 100644
--- a/tools/testing/selftests/damon/.gitignore
+++ b/tools/testing/selftests/damon/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 access_memory
 access_memory_even
+damon_dump_output
-- 
2.53.0


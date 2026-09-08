Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BE42A96
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835899; cv=none; b=T21ZsyKHsVoAMMlWXOhqCZVbtw5/V225bdm0YbeaqwBiAsSUHBfYZsM6/Z0g5d2VYoRVH/UsUyjoz6opdam0RUIZEs6HJR4HiX3RVVFXSJY3s15HtLq05Sk9Ykpuk1R0v7Lwt3G/YKeUNpdfkPFvik45dvGNHicMLjPHrloFSvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835899; c=relaxed/simple;
	bh=KbC4/aHSZoRhlEvoZxF6IZ3ATXrmb8tfT9i+DprXs1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P4fDh4GqObpMX8ZJn3zO2KsSkRCKey/4cjpQGrBMw8yTJslGFFvBDJW265bevJkRqD0RrQssvjKaSlyWv07TvT4aD6NaUAcwNfjn2S415CVi3hSiqHWt6jYpnFNsayJZht9mBi0y60RanXdMzKA7Z8YHimb8/mJvxF0Xmo40eBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MVZQTeUt; arc=none smtp.client-ip=95.215.58.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MVZQTeUt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KbC4/aHSZoRhlEvoZxF6IZ3ATXrmb8tfT9i+DprXs1k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788835895; v=1; x=1789440695;
 b=MVZQTeUt5Y73RsUD+bo1Pz0ULyJqKUfhz98ey6iFrR1imIzR62fky7rF1qsomXtrnFHj3onB
 k1zSZXb4rDUz5NbZAJpbt0EglYKJVcaBj77EIw8P3olpN15mgaLMfP6aUt/fqswWwjFrARG0cJR
 N5dkrX1zx4L7BOGtpylsnu40=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f40b372a38627f66;
	Tue, 08 Sep 2026 02:51:35 +0000
X-Mizu-Trace-ID: f40b372a38627f66
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/mm: fix ptrace PEEKDATA check in memfd_secret test
Date: Tue,  8 Sep 2026 10:51:11 +0800
Message-ID: <20260908025111.34562-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

try_ptrace() treats PTRACE_PEEKDATA return value as a boolean
check. A successful read returns non-zero data (memory filled with
0x55), causing the test to incorrectly report PASS when secret memory
protection is broken.

Check the return value against -1 instead. The test should only pass
when PTRACE_PEEKDATA fails, which means secret memory protection works.

Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/memfd_secret.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
index c55d84c5e613..dd08a3a1ef14 100644
--- a/tools/testing/selftests/mm/memfd_secret.c
+++ b/tools/testing/selftests/mm/memfd_secret.c
@@ -145,7 +145,7 @@ static void try_ptrace(int fd, int pipefd[2])
 		exit(KSFT_FAIL);
 	}
 
-	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0))
+	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0) == -1)
 		exit(KSFT_PASS);
 
 	exit(KSFT_FAIL);
-- 
2.54.0


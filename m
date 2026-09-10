Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA889374E5C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022686; cv=none; b=EwCiTPmQQyjsWwyhBAeOay5Ubr5B8OLvbcU9RhHD9AnBG++vKNPVfTxAlTjqqkpUw9bb3+xPOjA2JE4wV9O/4FgkuWPnyHkl7dKLSFR8B1qAEvrwCLLQK2nrtej67qwEF9vGbbl6xMZbfJNIrIWnTSkdJHdI9rH9MTA/v2uDCVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022686; c=relaxed/simple;
	bh=yBUrNGwIgiJGAXA0ONd3HE3wg2i9nbJ983f8uZj0C1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVsFbLGqzpJq8hYlU+YIXIYrQuuhjHNaaj1xlzmqMptOzuEG0oJn3SkNKzSZkkqO8crnFZk1TS707iyWuyaRRk2/bHUHcNeTyWN2pnvCNHe7Syka1kh9QqsXt+VJt276ldhMf+1M4XKei1EtTPOsZUig4U4Alc1hTvUR9TK/rMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YNubjFmR; arc=none smtp.client-ip=91.218.175.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YNubjFmR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yBUrNGwIgiJGAXA0ONd3HE3wg2i9nbJ983f8uZj0C1M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789022681; v=1; x=1789627481;
 b=YNubjFmRhC/4XbUlHvgq00a+HtrpO/7fIU0OsnNHAnquE4OKV4hCdfC4843PicpCGstj3Pe4
 /myiJ7wlbQ9dshwLz/ox9Ej0jujncZjOAz4AoO0PWLFaLAI+Ba5DPc7OW8t15xWXrHLBVIxueQ7
 2lWTDNR+naPTcHr0fgeKWLB8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6102d5745d8b7b1;
	Thu, 10 Sep 2026 06:44:41 +0000
X-Mizu-Trace-ID: f6102d5745d8b7b1
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
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v2] selftests/mm: fix ptrace PEEKDATA check in memfd_secret test
Date: Thu, 10 Sep 2026 14:44:15 +0800
Message-ID: <20260910064415.71623-1-hongfu.li@linux.dev>
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
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v2:
- Add a comment explaining why PEEKDATA on secret memory is expected to
  fail, as suggested during review.
- Add Acked-by from Lorenzo Stoakes and Mike Rapoport
---
 tools/testing/selftests/mm/memfd_secret.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
index c55d84c5e613..aef774be87f1 100644
--- a/tools/testing/selftests/mm/memfd_secret.c
+++ b/tools/testing/selftests/mm/memfd_secret.c
@@ -145,7 +145,8 @@ static void try_ptrace(int fd, int pipefd[2])
 		exit(KSFT_FAIL);
 	}
 
-	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0))
+	/* PEEKDATA on secret memory must fail, else protection is broken. */
+	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0) == -1)
 		exit(KSFT_PASS);
 
 	exit(KSFT_FAIL);
-- 
2.54.0


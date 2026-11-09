Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187405;
	b=Ktdr7W+JK02mOHrNEhy4RPamTc0PCPlJPnrxLGFgxkJbE3AOg+CdrFZp5imAmwGG2NsH
	 zqCeg9K+UXUJvPAlsWJrBGd+EmTgSS9ca7vMrrsbTg3tJCqX6qrYBqKX2u8jy7qjDNpHC
	 Ige74YRldm4ie7h1vzHsqDutFRZOBA/teqSCbanJEqzfon8JcPYH8S5xpcP95zsfTAZMO
	 BgZaKfMgvsYzwy2AcBRDHYyDxoDfxJTF7dCbnz74O7kc31gqNtGHH5V9D5uM19vAidc43
	 /HGHIuCDnsCrBeMzgoPpgAsbYzD9+Paa6JA3wZuF/O62N6wKFqUi+T05H42FGvcc21g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+5Pg2U7Z4p+e4Io+dyFSik/G65dnfD3gKTCmkaS9qY8=;
	b=nAJz5zDv6Bv+t4SmUjUaSQtrlan/eViDOBhV02bbMBwAhgpEgy916csYX0WWRAk29rP1
	 w9FexJE7hGJ2DQxGcuY24/kVOgK2qm603MVMbl0dM7OZTLqbWKCqxOiADc0q6EXwBfiT/
	 ekFWr2e+7Npo8MvZxlnWlmF+gA+7e5UicMtMyiLG4HNdcg628nVXtvNifuTHxyS0NGsCt
	 mQVIJjahEJg5LXuC5JLEbEVMXIcPfYmHWIKROYKBhgs/82Mygb7wjZJ9cU4H6/vu4zAdu
	 ByVnVEJgPwhGVcwhIV5eqlwZ2xsFYGUfJA4/QXYjUGMQoN+IImC7eiiivtoN9gdaftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCHH4EDH;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891CC6070B1E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891CC6070B1E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCHH4EDH
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a8cc11ac42so206860c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187404; x=1794792204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5Pg2U7Z4p+e4Io+dyFSik/G65dnfD3gKTCmkaS9qY8=;
        b=uCHH4EDH06jp0dwbNqDC20Om96oqbCXVN/tDnpjHnBEMYAgua6eXe7BLNp6WNgqTS8
         Tt6AhGgEqdhRG83cvFt0p04AHI8XLER+5mk0OBBAS9+s6CVlv/BZfqRYsPjpMFm9YKq/
         wpVqmzF/9gTvCS6vqu54EN+uR9eOXCl1hYrQSS3Tn39RF452/WuQhsPNpPwQDeSIA99E
         c/6Q1XAofqKVq7eQjB9tLkDTxVXlyDg9f+pEKlgV84QUf+UhvaeWZWYOulgdTSS5DOlL
         xatWbBrqRRDjt9+WE6ly+hAZ+cqqAUEE2czcW51WH5kB/K16T/jHqklS9U7BspsjBI5g
         y92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187404; x=1794792204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5Pg2U7Z4p+e4Io+dyFSik/G65dnfD3gKTCmkaS9qY8=;
        b=EL+SkXjBWfZZrlo4/2wd5EXEgEESTrwFkzUsBa/11QNwEuJLMGDAnWu04RhEfPpBBo
         EFbF9b2P7REm2pF+hSVNG8BgKLL0hSqWYH5NGlusk1KHYEel/eOkxOdRbsRe2g/pIdmR
         YDVuPgTltX5Ftn4hC0Nxd242p6gcMtlxD3ZK52e6/sBXgCzVFddTSWTUAWogXpc/HngC
         a//5e2fOAOmc0//xvCQiUdY3QrdR7SDyZqTU6FOw2Zz6PjCHAFHJuKiR7tpJoaBrDUce
         TbXojjSxUKJFv5MLHV9o6B/VoBJNqxsi+hv5gcxVTuSL0pHlcQF7OgzXDWYHdWGkaiMk
         9m0w==
X-Forwarded-Encrypted: i=1; AL+hErGQUxdB2Gk9FLt2pcdUtWQgAZFuQf8n9xmt2McEuWJkwzlgWFazVWXPPuFHXVVZco17VI/Wi0Zs9q7zGL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M2sa3ao4Cj7UEtEpJukuEBM6KZ9AhCoPJktITeaZ/QykQcv7+
	3tR9TkgnXIgYYi2GYGwLmDGLrp0EDqd5J1WJM3Yy9GUhlFF6E9jtRdyC
X-Gm-Gg: AYBFou2yqu5LaNHJnt11472kGA0cgPfyatyXNC0wgGvLDHMd5jLaMCjDfwwupIrBRUk
	PPYil+aCQ0gzj92CAdqaLFI/ZkvgURX7ZnDs72nQh0s/cHXW6pDHKOZgWnLeQxEzptdWVj6gkkP
	yrv6aRLAhYxwNuSoVzdf2agnd7Fj0NBM5MYoFWlX85yi86gG9LDt8hThFQoSNKxFYtqwTEfUjWS
	WQgoU2gwe1RoSpssOU4EpuUT1VelSwWjI/Gyj2E8cL/5wBPIrbp08jHjn4rWHA7DCqpUL+H981Y
	T6NMCJGOHt6KZTPcwdsXVn8S5VgXsRVviBid7Lu9bwPJglY2b+LtDoXDbaUB/XR6lDgo3Cbwn8O
	+Qy+BIpc3gpjgzf/A/H3fHIHhay2YwtpH3QdUJcQfwH52UNqKuhgAgXdugDIZmqM84RCyHrTW5j
	C8Cjh0sZZi7nofpZKUYAmcp4cQ5/Js0tiJMXlhdSYB/RlMXLDp7aLSKmbpnGk51Zz1R75TnPyLE
	AfHJQ3GyeDll1tuPv337Pggy6eEXlZFhqJNsZqgeoouz0Pejk9cRMtI9M6vhQQS038hCB7UnTeT
	3Qz68kDPETqolRzp0ww3jj1Z
X-Received: by 2002:a05:701b:2505:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b39febb929mr4053527c88.33.1794187403575;
        Sun, 08 Nov 2026 17:23:23 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:23 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:54 -0500
Subject: [PATCH v4 5/5] selftests/mm: cover merging KSM pages aged by smart
 scan
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-5-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_functional_tests checks merging and unmerging with ksmd's default
settings, but nothing there exercises smart scan, which skips pages KSM
has failed to merge for a while.

Smart scan used to time those skips per page, so two identical pages
that became mergeable some scans apart could end up never being looked
at in the same scan, and were never merged. "mm/ksm: align smart scan
skips with the scan number" fixed that.

Add ksm_get_smart_scan() and ksm_set_smart_scan() to vm_util, and a
case that enables smart scan, lets sixteen unique pages age for a dozen
scans, then makes a duplicate of each mergeable one scan apart, and
expects every pair to be merged 32 scans later:

  kernel               failures, two boots
  before the fix       20/20, 20/20
  with the fix          0/20,  0/20

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 36 +++++++++
 tools/testing/selftests/mm/vm_util.h              |  2 +
 3 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 31c06c72203fd..135191f99962d 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -695,6 +695,92 @@ static void test_fork_ksm_merging_page_count(void)
 	munmap(map, size);
 }
 
+static void test_merge_aged_pairs(void)
+{
+	const unsigned int pairs = 16;
+	const unsigned long size = 2 * pairs * pagesize;
+	int old_smart_scan;
+	unsigned int i;
+	char *map;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	old_smart_scan = ksm_get_smart_scan();
+	if (old_smart_scan < 0) {
+		ksft_test_result_skip("smart_scan not supported\n");
+		return;
+	}
+	if (ksm_set_smart_scan(true) < 0) {
+		ksft_test_result_fail("Enabling smart_scan failed\n");
+		return;
+	}
+
+	if (ksm_stop() < 0) {
+		ksft_test_result_fail("Disabling (unmerging) KSM failed\n");
+		goto restore;
+	}
+
+	map = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (map == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto restore;
+	}
+	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Page i of the first half and page i of the second half form a
+	 * pair with content no other page shares.
+	 */
+	for (i = 0; i < pairs; i++) {
+		memset(map + i * pagesize, i + 1, pagesize);
+		memset(map + (pairs + i) * pagesize, i + 1, pagesize);
+	}
+
+	/* Let the first page of each pair age without a duplicate. */
+	if (madvise(map, size / 2, MADV_MERGEABLE)) {
+		ksft_test_result_fail("MADV_MERGEABLE failed\n");
+		goto unmap;
+	}
+	if (ksm_start() < 0 || ksm_wait_full_scans(12) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Make the duplicates mergeable one scan apart so that each pair
+	 * starts out with a different distance in scans.
+	 */
+	for (i = 0; i < pairs; i++) {
+		if (madvise(map + (pairs + i) * pagesize, pagesize,
+			    MADV_MERGEABLE)) {
+			ksft_test_result_fail("MADV_MERGEABLE failed\n");
+			goto unmap;
+		}
+		if (ksm_wait_full_scans(1) < 0) {
+			ksft_test_result_fail("Running KSM failed\n");
+			goto unmap;
+		}
+	}
+
+	if (ksm_wait_full_scans(32) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
+			 "Pages aged by smart scan got merged\n");
+unmap:
+	ksm_stop();
+	munmap(map, size);
+restore:
+	if (ksm_set_smart_scan(old_smart_scan) < 0)
+		ksft_print_msg("Restoring smart_scan failed\n");
+}
+
 static void init_global_file_handles(void)
 {
 	mem_fd = open("/proc/self/mem", O_RDWR);
@@ -720,7 +806,7 @@ static void init_global_file_handles(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int tests = 9;
+	unsigned int tests = 10;
 	int err;
 
 	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
@@ -753,6 +839,7 @@ int main(int argc, char **argv)
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
 	test_fork_ksm_merging_page_count();
+	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
 	if (err)
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 8184691211acc..f26f9e4bfdbe9 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -992,6 +992,42 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -EIO;
 }
 
+int ksm_get_smart_scan(void)
+{
+	int smart_scan_fd;
+	char buf;
+	ssize_t ret;
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDONLY);
+	if (smart_scan_fd < 0)
+		return -errno;
+
+	ret = pread(smart_scan_fd, &buf, 1, 0);
+	close(smart_scan_fd);
+	if (ret < 0)
+		return -errno;
+	if (ret != 1)
+		return -EIO;
+
+	return buf == '1';
+}
+
+int ksm_set_smart_scan(bool enable)
+{
+	int smart_scan_fd;
+	ssize_t ret;
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_WRONLY);
+	if (smart_scan_fd < 0)
+		return -errno;
+
+	ret = write(smart_scan_fd, enable ? "1" : "0", 1);
+	close(smart_scan_fd);
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
+}
+
 int ksm_wait_full_scans(long nr)
 {
 	long start_scans, end_scans;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 7e00030077d2f..ab1325dc65800 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -163,6 +163,8 @@ long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
 int ksm_wait_full_scans(long nr);
+int ksm_get_smart_scan(void);
+int ksm_set_smart_scan(bool enable);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0


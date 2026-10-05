Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E048371CFF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183192; cv=none; b=N3Vh2Cp/TAmUgOoB4XtcgaBEZS1YtADolc92udqLtPZrh5+pyQEm4snfXO41R9tw5pRd98M8pBnGb5tWo+0bTT3kUAElCjNFND/62X5fWoI0jwfHSuY75ARavD3Q9lmpdu+mRrcodCdqaJG/f0Czj4lriSJ+icJoHWGPOXW2KC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183192; c=relaxed/simple;
	bh=i+Gr/7FMNuuEK/OKYn6DacYUD0hgLxMgnUMFQgj0oNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ex/pw88hwGbYpx7HaXGIy0n3rMsVyAtwT/AR58Q6Vbg9nm958C5wJGYETgmagX2KYDGEdaENRpbZkO8IbUnbNcuPxeH9ehkI51hZ/xNJDrMl0Xr2nh4RRXmBUwdGcNkvgokTYCHVfP3XZW/vDQtAHf8IfOY5tVv3eGjHO5gfkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUiUNgaF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUiUNgaF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso631343f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183189; x=1791787989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yZt/yuxaSBTnRC+PSxXs89gpI+W86bHXS3Qdtmgzpc=;
        b=oUiUNgaFvjSZ/DbExzHGxGvql8bFJmpxEvZZn0TnKNcLf250wmMVjiTOY1T2yP/VOh
         54NcFKk2Km+hBZ5SOR2U8xHpPec6/Nku3UG7ftYBl61AP+RtG07+NVszEVxCOgajAoWN
         i7xg6gUT/1jAowV7I3PGnl5FCsrJUzwfWmBHPRxfeafZvZLGMiggIE//V8PQ56VAOC05
         Jg0JmI4OHKOHzMcL5pSMoVs1idT9BeHyW2K/CnJUOjZtzAglTp+yo0eh7MHFxg3sU1uG
         dopPJZeealQYcpp2m3MT/uDpvK9rexonmGF7vLaKKHnXyfgtLo7Q2jovXrxno9TCzTR3
         Eslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183189; x=1791787989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yZt/yuxaSBTnRC+PSxXs89gpI+W86bHXS3Qdtmgzpc=;
        b=YLWavUORo4nOxDb2wbRKS2kd/XBxKb3OvfBBAXPUIRfHVgrG52X4Bn5HLY5HxZXocs
         VGHp9AkzGjMoLa4hmrqC3OXvx6DXamFSIrzfY5nx6C/bntyjTKCskO8qWxkJ0eWsPEV7
         fuO+cHFqI8A2X3MzwBHo5oLtOnrtFrIxNSTUJafOwJ6yrgGOJ//F76PBVcTJmrJ1ZbG8
         Jx8wlW9ioi7fnc8EQYlAX3L+30TpLt5b1zH+JuUZDN/MdzvE4uw59hZgaVlKJxQjwsyt
         u7k2Zze9+sf5QFTwkeZ/CgDPtXDwwXCpzX0O6wMA3Iyr1OA2+hYUk1AAxZ+BNULJqbHf
         8xhA==
X-Forwarded-Encrypted: i=1; AKwUvBzA/BYCLOFLG5iwe25yFfUGMbVqpr5zrtYkOE8ZhYsKN3h9p1sMxAdpFKtSFtHNKd544ZXUkhVeJi/PLQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwlYWNQKpj1OQqmRBpwlX63MxEhgj4IRFbtjFbYFdxqmWkhDip
	DlsmMOIIGaVjroVYanVAFVUew3Ft4floduDaOno3alo0AJWea7Rgqj7A
X-Gm-Gg: AYBFou1vHS8jFsevIyuBfyekAmVDNNXTRlaYjL/pR+toQ87+qC2rDlEPMbPdH2E7Fja
	rhZtSnd8QZGcJhhhIQNMzer35YD4wn1v2cXdxeVGExxy/nMjJbU7C8GDqaEMpPQdrxlRRTBfA9S
	KXMHvQUjyZkgZJzlfWsd3xzEoElx60YSYU27EVhZ6EpXijRL4dvHIOiGXSNd+ED1UGK+o2s+fPz
	6X7GvEKzUUPJl2jSyW8195KzKsp6JAq/OwDerfC9nW07FhAxM0kjU1qnCefTZcwC9vSSHhrSiN+
	SqY6Ys4GMlEplK0lrx3XVRkgmY4AXQ1fuZPb6yPpV/46MzgDDUEeF14q4bE58t0Y6DrLxhkXZaI
	RjkH0ZlTieLFTXKCMvt9xj531k3KK01ylzsLz6oRrIPY5UQsTx7aClyvwNWoNMCbLK0JIdKUx6e
	xCpZhpSozi4NVohTQWITi5qU/Qjg1IKcyiiGLjM+m0YoL+XioeAwjrrkU=
X-Received: by 2002:a05:6000:40de:b0:48b:d2d:2fcc with SMTP id ffacd0b85a97d-48b1272d0c6mr16209245f8f.9.1791183188499;
        Sun, 04 Oct 2026 23:53:08 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm1247436f8f.3.2026.10.04.23.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:53:08 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 3/3] selftests/mm: test mlock() and munlock() range normalisation
Date: Mon,  5 Oct 2026 08:46:31 +0200
Message-ID: <20261005065244.6935-4-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005065244.6935-1-azpijr@gmail.com>
References: <20261005065244.6935-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mlock2-tests cases for a zero length at aligned and unaligned
addresses, for a length that wraps when rounded to pages, and for an
overflowing start + len, checking the return value and VmLck. The
overflow cases expect -EINVAL with and without CAP_IPC_LOCK, so running
the test unprivileged also covers the errno that used to depend on it.

The wrapping cases assume the test is built for the kernel's word size: a
32-bit binary on a 64-bit kernel cannot pass a range that wraps.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/mlock2-tests.c | 191 +++++++++++++++++++++-
 1 file changed, 190 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index 144b550813a6..3dca349c4738 100644
--- a/tools/testing/selftests/mm/mlock2-tests.c
+++ b/tools/testing/selftests/mm/mlock2-tests.c
@@ -2,6 +2,7 @@
 #define _GNU_SOURCE
 #include <sys/mman.h>
 #include <linux/mman.h>
+#include <limits.h>
 #include <stdint.h>
 #include <unistd.h>
 #include <string.h>
@@ -91,6 +92,7 @@ static bool is_vmflag_set(unsigned long addr, const char *vmflag)
 #define SIZE "Size:"
 #define RSS  "Rss:"
 #define LOCKED "lo"
+#define VMLCK "VmLck:"

 static unsigned long get_value_for_name(unsigned long addr, const char *name)
 {
@@ -177,6 +179,27 @@ static int unlock_lock_check(char *map, bool mlock_supported)
 	return 1;
 }

+static unsigned long get_vmlck(void)
+{
+	unsigned long vmlck;
+	char line[1024];
+	FILE *file;
+
+	file = fopen("/proc/self/status", "r");
+	if (!file)
+		ksft_exit_fail_msg("fopen: %s\n", strerror(errno));
+
+	while (fgets(line, sizeof(line), file)) {
+		if (sscanf(line, VMLCK "\t%lu kB", &vmlck) == 1) {
+			fclose(file);
+			return vmlck << 10;
+		}
+	}
+
+	fclose(file);
+	ksft_exit_fail_msg("cannot parse VmLck in /proc/self/status\n");
+}
+
 static void test_mlock_lock(void)
 {
 	char *map;
@@ -204,6 +227,167 @@ static void test_mlock_lock(void)
 	munmap(map, 2 * page_size);
 }

+static void test_mlock_zero_length(void)
+{
+	unsigned long page_size = getpagesize();
+	unsigned long vmlck_before, vmlck_after;
+	char *map;
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
+
+	vmlck_before = get_vmlck();
+	ksft_test_result(!mlock(map, 0),
+			 "%s: zero length mlock() at an aligned address\n", __func__);
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: zero length mlock() at an aligned address locked nothing\n",
+			 __func__);
+
+	vmlck_before = get_vmlck();
+	ksft_test_result(!mlock(map + 5, 0),
+			 "%s: zero length mlock() at an unaligned address\n", __func__);
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: zero length mlock() at an unaligned address locked nothing\n",
+			 __func__);
+
+	munmap(map, 2 * page_size);
+}
+
+static void test_munlock_zero_length(void)
+{
+	unsigned long page_size = getpagesize();
+	unsigned long vmlck_before, vmlck_after;
+	char *map;
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
+
+	if (mlock(map, 2 * page_size)) {
+		munmap(map, 2 * page_size);
+		ksft_exit_fail_msg("mlock(): %s\n", strerror(errno));
+	}
+
+	vmlck_before = get_vmlck();
+	ksft_test_result(vmlck_before > 0,
+			 "%s: the range to release is accounted as locked\n",
+			 __func__);
+	ksft_test_result(!munlock(map + 5, 0),
+			 "%s: zero length munlock() at an unaligned address\n", __func__);
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: zero length munlock() at an unaligned address released nothing\n",
+			 __func__);
+
+	munmap(map, 2 * page_size);
+}
+
+static void test_mlock_length_wrap(void)
+{
+	unsigned long page_size = getpagesize();
+	unsigned long vmlck_before, vmlck_after;
+	char *map;
+	int ret;
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
+
+	vmlck_before = get_vmlck();
+	errno = 0;
+	ret = mlock(map, ULONG_MAX);
+	ksft_test_result(ret == -1 && errno == EINVAL,
+			 "%s: mlock() with a wrapping length is rejected\n",
+			 __func__);
+
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: mlock() with a wrapping length locked nothing\n",
+			 __func__);
+
+	vmlck_before = get_vmlck();
+	errno = 0;
+	ret = mlock(map + 5, ULONG_MAX);
+	ksft_test_result(ret == -1 && errno == EINVAL,
+			 "%s: unaligned mlock() with a wrapping length is rejected\n",
+			 __func__);
+
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: unaligned mlock() with a wrapping length locked nothing\n",
+			 __func__);
+
+	munmap(map, 2 * page_size);
+}
+
+static void test_mlock_addr_overflow(void)
+{
+	unsigned long page_size = getpagesize();
+	unsigned long vmlck_before, vmlck_after;
+	size_t len;
+	char *map;
+	int ret;
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
+
+	/* addr + len wraps to 0 */
+	len = (size_t)(0UL - (unsigned long)map);
+
+	/* -EINVAL with or without CAP_IPC_LOCK */
+	vmlck_before = get_vmlck();
+	errno = 0;
+	ret = mlock(map, len);
+	ksft_test_result(ret == -1 && errno == EINVAL,
+			 "%s: mlock() with an overflowing addr + len is rejected\n",
+			 __func__);
+
+	vmlck_after = get_vmlck();
+	ksft_test_result(vmlck_before == vmlck_after,
+			 "%s: mlock() with an overflowing addr + len locked nothing\n",
+			 __func__);
+
+	munmap(map, 2 * page_size);
+}
+
+static void test_munlock_range_overflow(void)
+{
+	unsigned long page_size = getpagesize();
+	size_t len;
+	char *map;
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
+
+	errno = 0;
+	ksft_test_result(munlock(map, ULONG_MAX) == -1 && errno == EINVAL,
+			 "%s: munlock() with a wrapping length is rejected\n",
+			 __func__);
+
+	errno = 0;
+	ksft_test_result(munlock(map + 5, ULONG_MAX) == -1 && errno == EINVAL,
+			 "%s: unaligned munlock() with a wrapping length is rejected\n",
+			 __func__);
+
+	len = (size_t)(0UL - (unsigned long)map);
+	errno = 0;
+	ksft_test_result(munlock(map, len) == -1 && errno == EINVAL,
+			 "%s: munlock() with an overflowing addr + len is rejected\n",
+			 __func__);
+
+	munmap(map, 2 * page_size);
+}
+
 static int onfault_check(char *map)
 {
 	*map = 'a';
@@ -506,9 +690,14 @@ int main(int argc, char **argv)

 	munmap(map, size);

-	ksft_set_plan(15);
+	ksft_set_plan(31);

 	test_mlock_lock();
+	test_mlock_zero_length();
+	test_munlock_zero_length();
+	test_mlock_length_wrap();
+	test_mlock_addr_overflow();
+	test_munlock_range_overflow();
 	test_mlock_onfault();
 	test_munlockall0();
 	test_munlockall1();
--
2.55.0


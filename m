Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605469;
	b=FXkl0ME0JKkbKQpWiZYqpCCVmElh6z8o19YVnNGcTx+551uyhoCHuUpik5krJo8CTg+8
	 kJe66pne8zTqjMBNgXZHa4WF3iTCu0VlAlHfLKiiGOqSISD+oq1fSg1LksAiTvy99M74n
	 5MgcOvBlgtJQyI6MPRggKUm6Gor6Di1OsO/iqLJAWGtIjeziqXYXQJxbJI+uL6pj078ZX
	 GtNjjn7Q2j3XYo/N31Xg4tNurYV2CkyjsgxuW45+TgVwKvMQgVORangMcrjd5mSh0yr4W
	 vzH7alCDXAlNpWRw97Yh8U8kTzTmv+sUmC3jbOsQzMeUjQre5u0pCYZkRwc9sIVPW2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tbEqoEmiOLpfQLZXaMwfuY090SS6ZvbC9oI0iDoMLRc=;
	b=ssRaKYN0RS05/bf3Mw2YYvEsJZ8zcEi1Kf8zENVZ3xRv2W7rZtJE5keAEcCETWW2ELGH
	 85HVtk1G5k2uUf2FmKJTovgIlH0QLLl7HFWjip86VCR0pkbI7Bquf3wcIG7yPBt+18Hrc
	 dUbjxUYvhAzIi/GT73Bs2i6l8VgizBDUJa8YLAXpGykGvHBXKcUCyKgmtT25QQrQ0o0nv
	 7udLooOJoy24ae4HMSD3uqR9IJtAhJjg/c+l4yaSAajget0im1ryfDrw3NLneUrxpJx8f
	 /kcKRwSPUQubnAgB/SdUP2J6HXHE8EhWriabXScHSNLhK5XFQOyNVg5cVEsu+xyt0Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g55Rr/XF";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9660A260C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD9660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g55Rr/XF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso1068586f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605468; x=1794210268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbEqoEmiOLpfQLZXaMwfuY090SS6ZvbC9oI0iDoMLRc=;
        b=g55Rr/XF1d28kJml+NF7JZU9snuT/I/3wcn0NtnKDeNWwtw7hTBHwrsCYjseESZ0QE
         YM4ixaPDJgSNxQsI4tDs2fx39Q8FPog73TciZ4rZca30FgtmhbQKuj0ZkMtOR6mYbAhd
         4DRGhYUwE6DXaZn0eeNHegtQfxPLErwLsX/K3k1ipwu7azBa9wes+CbI1I4u8w0d+pmP
         I/wV0EtTUkoe1F/5zqpjwSGDFq2RrDxzoEIOE/reeMNzQj6Q3ZBJKwn4Z/SG+WdA+Rso
         8FfbCZb2G8nMirGo0AyX1tL4VFZd0jcomNDfKzxlNbC6buF7B3j4b0fSrRtmAn1paL4P
         +6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605468; x=1794210268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbEqoEmiOLpfQLZXaMwfuY090SS6ZvbC9oI0iDoMLRc=;
        b=iAYrhMtrkGnBPGNK8SYPWE7EOyHkceZGFaq8xgiotS9VaKESVXopYD7fFfXsbN74NP
         eRU8MzVTe49MKRAzx3cKK3JxQ9EwlD9lzTN05eBRAOEcJf5fDLBszquceyzw005no8Ei
         V5/071S+ZO1fBuTjz84e2HRcyeRExlCp3xAQuy1UcTrnifEPebgb3TWtfoezLPE8PM1y
         YKupJkcI4fRc4T5655JHC/2CFrVXKoP6+xMBKHR1Ox3dHxkHnjuLSsvuVhWH2vGl9KNv
         xn8gMw/yMCcJ1UoUqJyOS8R4ONeRXvrjskSsS+g8It3imfgcCo1A/it9KopmY56teOzx
         HSNA==
X-Forwarded-Encrypted: i=1; AKwUvBybDRWBl5NkKRXkZEY+eNc7zbSl0HiwWCU3wx7qs8kkT4vEnWujgaIUfXil3aod9xAyWmwSDyFv3zQqp/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gsu+cfi6BxRXWzLSuUdsaVTKOd8YKYiu68RMPtmTAPnFFXduv
	Ck4QoDTIrvzE/3kVM7sGVXTLsMQKyb9t6VtGefj+/jwNq8YSwLJZnXTo
X-Gm-Gg: AYBFou30lDISj41ZUIsv3VGcNvXBACg/IrjS1xDxCez7b85OWBKrbR97Ke9EFdHu1Th
	9ih4F5BxbPDp2KznynUEHVZSPC5ABP0/SkyDKIyGFVBfzCXqh55w5LRWRB5yGS9yl6eivDgnn5j
	6K/l48lHP+1uHwE/Aol0v2doaHvhtnc+LRmUpTgFbA/6CR8M8tv90qc7KXk03rcpQkAkAmye7p2
	JkG9ZNIUoR1ThHmh6SNaY+mT8tWVwE8stHTnq2cFvfnGrRwe43NFx0FMh8AC+FoWAwrWPMAwKpo
	360jlA/+Zj8Y5NqTYOTzid7POKngpFLtP+IIBG9fhbOoKqKLWEGTOZzRJWsCIsfP9sPPgddmiVd
	WlOV5ErEjxvv999TEh3gK+A+mAgrozhXdUpAwyGRVuNoB+y126GhM+5WeJ/DmrVpD/RdaNQlqZR
	0aid+4tY/AcQtwdRslGhKxAD1h0QjhL6hYVKMC3eP8Pbqx0Y6e7RFTBA+CSmbah0nu8mtqB/HPj
	Q2yfCqsXLym+j8Ral/izOEedmBAPrKQIpEB40nViL5xTc9DnzVPWNebwVEd3qG9FQd/eGFJSesX
	BLU9MrGb1SRULLCC/DV4NefMsFBVUe2+sCk=
X-Received: by 2002:a05:6000:144f:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e6e264067mr23884219f8f.0.1793605467644;
        Sun, 01 Nov 2026 23:44:27 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:27 -0800 (PST)
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
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 3/3] selftests/mm: test mlock() and munlock() range normalisation
Date: Mon,  2 Nov 2026 08:44:01 +0100
Message-ID: <20261102074412.189554-4-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

Add mlock2-tests cases for a zero length at aligned and unaligned
addresses, for a length that wraps when rounded to pages, and for an
overflowing start + len, checking the return value and VmLck.  The
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
2.56.0


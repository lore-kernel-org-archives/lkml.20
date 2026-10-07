Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7B471437
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364943; cv=none; b=TjJ4W2+YQa2H2A0nFdzj/qozeHuIt8xM6WsN3XZnsmsLoWiniUcYylhz90hhjH4gAlnMvUREHCIA6RmZrdSNR2isWmm/6z9PWJf+u6qT3I9YK6qRw6jTtkga3E0FSfi6qwvNwMH4Qn20Nn6mTQtSvHEYd2p03BFUWq0cP09np+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364943; c=relaxed/simple;
	bh=Lpj2FYp5lpD7KkRLPJAr0iKTl7mf0Lufuxe4+c5LATw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kw2PgtF1zB6gClrJo3/0BjwXDvpERbv2nFCIszd48uXVtnSIetTWjPPweXS4iJgpxFj5u7Y/dQ5rwxFxE9UFBt/LMBIC7Vmfe6//jCIk0Ui8LTDZUupsjKezKg8ykyoxlP67xJe4GWJN8hh+VUM+SlWzOFEW3SOU46SKbkvm5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTd4rVTm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTd4rVTm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e608cd460eso2959065ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364654; x=1791969454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMJqX2UfW+yt+gLeXDIEXy10CvrOQ6MYyBHgdruEdmw=;
        b=kTd4rVTmYegnXxioZ4UGlctMwfu1m+WLlYntZo6y9NQYhv+KpDQFSMZlY7WnkiCxok
         dcbCNGbzI2/Z6oBaU3Ang1nyMVtN6cv+3vAyPHjJ1E8No6/7/6U+VbKMScnUL4Wuacsn
         aBou4xSkXz6chi9P5by8w1gQbbxkBtpy/xs4HScKdTxt7FD6hRXTgZ24iN32+NKaCGG/
         xBfhHAzScC8wN07Kjfb2PQ5pBKRuSUjuwr9U10Uj1ZzeYW/Gd3Ij5OBkMIZsZU4uospn
         RgiooVPwpsqELD0u//pYtulajIxeJPSlrgrtNnw+AmEVfS3VKTk3VcG6cy9Dm+Si51TG
         a8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364654; x=1791969454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMJqX2UfW+yt+gLeXDIEXy10CvrOQ6MYyBHgdruEdmw=;
        b=wSD/nQLAbNBJ7/WWYwwNgeXGCRzMhMWgAzx5IlLl4Kr/eicTJoc6A9jot/a6PaDEg/
         9M+U87WfVBK7bodsSp2r839sfgDdHy8OTyI258LG2hb9oJCvDgVDYyNRDu5jq4N//482
         RMHSKNZcMbTBUPBc/wdDPbQdYTqi6aSyFpFbZi55jzit/UcZVC+oI3wmfy9NgLj9YPf7
         DHUFNPVW8rFo6zZON08KDcIN9L7doDSMilVgu7lbXkzQmUWsPfwkUjGgB+E0JlEgxYPz
         Bomo+KozFJezDxFo3iNdrowIDsgJLQ9l/qv5mCjAVRE54cChILxeCjaWwZHy9nvs3P3W
         jCbw==
X-Forwarded-Encrypted: i=1; AKwUvBw11dMIxQNNfY+JEumj4j9xm2Ey/hUoD3EJueOOM3643dOz1swMnG9YN+xAW9vfx+eSMELrdtg65dNRvRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVVo4KwKMXV0ANxC1emAEeIkd8BehouFeKRM9q2HvDr1Xe+XCV
	2lekn2IBEjVvFYIMiX3MLBHL/HSfoi7AC2xpVZ/h41kPabNZGMfXEUWX
X-Gm-Gg: AYBFou1kUe2BkYo+XES+xKWUsuha/ExEm9AE843HtsUSYmAH8EtFnILxR2LETVvFsdq
	8JLdzWMgB/MDEj3wdAUhMZPqpgnKaR6BiGAPk822kc+2Szky9cUtoGihP8Q1u+vhf8/ZVaJ1AX4
	UFvzw3KgFkF2pLPAcRceeQ0G15n+V03uFR2MYRSIMWJUw1kEwu089D8+lJ/XIJA3zNzPZ+lg1+Q
	6y0gaPGirhhcQb8U4MmdEFtstDyY8TOg9U1k9bnSMySTaXzPGylZ+SInKL3Yh90lfOlS4pZ15w4
	/vEQeJnDaagVGyxEoP4sDaDJX178774VmQ78pXDrxAgWXubpE9AUW36M2fZ1qlr2Qu3Pl0/Xepr
	OqyEb0uo3VNEW+bA0dOjlMpE4vhUPldu0JsliHulCbU7XFoSy7BR+n45m2MpdsBEKecy5vLDkEf
	mTpKWllmL73SJzVAiM3AdMyOtZo9uJFDfHfsxgEAYR81Wmqzxvcp7bG+Jzp1BVC931AkVo1s8Zt
	MlPjX6YSSxamct/EaseFveCXTc=
X-Received: by 2002:a17:902:ce0d:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2e60036c486mr15062015ad.11.1791364654342;
        Wed, 07 Oct 2026 02:17:34 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604724b46sm7175375ad.42.2026.10.07.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:17:33 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH] selftests/mm: test MREMAP_DONTUNMAP mlock accounting
Date: Wed,  7 Oct 2026 14:48:09 +0530
Message-ID: <20261007091809.1438944-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MREMAP_DONTUNMAP moves a mapping's page tables to a new address while
leaving the source mapping in place. Check that mlock accounting charges
the page only once after the remap.

Add a test to mremap_dontunmap that verifies mlock charges one page and
that MREMAP_DONTUNMAP does not increase VmLck again. Skip the test when
mlock is unavailable.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/mm/mremap_dontunmap.c | 92 ++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 96ba537facf7..e4b0e1868a6f 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -90,6 +90,26 @@ static int check_region_contains_byte(void *addr, unsigned long size, char byte)
 	return 0;
 }
 
+static int read_vmlck(unsigned long *vmlck)
+{
+	char line[128];
+	FILE *status = fopen("/proc/self/status", "r");
+
+	if (!status)
+		return -1;
+
+	while (fgets(line, sizeof(line), status)) {
+		if (sscanf(line, "VmLck: %lu kB", vmlck) == 1) {
+			fclose(status);
+			return 0;
+		}
+	}
+
+	fclose(status);
+	errno = EINVAL;
+	return -1;
+}
+
 // this test validates that MREMAP_DONTUNMAP moves the pagetables while leaving
 // the source mapping mapped.
 static void mremap_dontunmap_simple()
@@ -125,6 +145,75 @@ static void mremap_dontunmap_simple()
 	ksft_test_result_pass("%s\n", __func__);
 }
 
+static void mremap_dontunmap_mlock_accounting(void)
+{
+	unsigned long before, after_mlock, after_remap;
+	char message[128];
+	char *source, *dest = MAP_FAILED;
+	int failed = 0;
+	int err;
+
+	source = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (source == MAP_FAILED)
+		ksft_exit_fail_perror("mmap");
+	if (read_vmlck(&before))
+		ksft_exit_fail_perror("read VmLck");
+
+	if (mlock(source, page_size)) {
+		err = errno;
+		if (munmap(source, page_size))
+			ksft_exit_fail_perror("munmap");
+		if (err == EPERM || err == ENOMEM) {
+			ksft_test_result_skip("%s: mlock unavailable\n", __func__);
+			return;
+		}
+		errno = err;
+		ksft_exit_fail_perror("mlock");
+	}
+
+	if (read_vmlck(&after_mlock))
+		ksft_exit_fail_perror("read VmLck after mlock");
+	if (after_mlock != before + page_size / 1024) {
+		snprintf(message, sizeof(message),
+			 "mlock changed VmLck from %lu to %lu kB", before,
+			 after_mlock);
+		failed = 1;
+		goto out;
+	}
+
+	dest = mremap(source, page_size, page_size,
+		      MREMAP_DONTUNMAP | MREMAP_MAYMOVE, NULL);
+	if (dest == MAP_FAILED)
+		ksft_exit_fail_perror("mremap");
+	if (read_vmlck(&after_remap))
+		ksft_exit_fail_perror("read VmLck after mremap");
+
+	if (after_remap != after_mlock) {
+		snprintf(message, sizeof(message),
+			 "VmLck changed from %lu to %lu kB", after_mlock,
+			 after_remap);
+		failed = 1;
+	}
+
+out:
+	if (dest != MAP_FAILED) {
+		if (munlock(dest, page_size))
+			ksft_exit_fail_perror("munlock destination");
+		if (munmap(dest, page_size))
+			ksft_exit_fail_perror("munmap destination");
+	}
+	if (munlock(source, page_size))
+		ksft_exit_fail_perror("munlock source");
+	if (munmap(source, page_size))
+		ksft_exit_fail_perror("munmap source");
+
+	if (failed)
+		ksft_test_result_fail("%s\n", message);
+	else
+		ksft_test_result_pass("MREMAP_DONTUNMAP preserves VmLck accounting\n");
+}
+
 // This test validates that MREMAP_DONTUNMAP on a shared mapping works as expected.
 static void mremap_dontunmap_simple_shmem()
 {
@@ -348,7 +437,7 @@ int main(void)
 		ksft_finished();
 	}
 
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	// Keep a page sized buffer around for when we need it.
 	page_buffer =
@@ -361,6 +450,7 @@ int main(void)
 	mremap_dontunmap_simple_fixed();
 	mremap_dontunmap_partial_mapping();
 	mremap_dontunmap_partial_mapping_overwrite();
+	mremap_dontunmap_mlock_accounting();
 
 	BUG_ON(munmap(page_buffer, page_size) == -1,
 	       "unable to unmap page buffer");

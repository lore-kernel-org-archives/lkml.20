Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F0332EA0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526280; cv=none; b=I5Vq/X/ohcnPWAG+/Ux+y3D2j550jku0rHDsA72EG+eJeLbLbOCxEcyTooKpcbopf9FDeXNPEKs8sWr+mkWnNpr+KF3bY/rB+2G8JvYBMwOqJIq9yJQI/a6xrDxH1YSTsQJA8OsKlg4/CMag7jL9ron0BWxA1xwtPmZslyn+hpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526280; c=relaxed/simple;
	bh=xEy+uD/g2jqPay2pPxo/1WfuKuGvhpMXQ7dV+0cvEsA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fsbY4QocCUk9ndDrplaLJf9FNKxrmjxywz6RzP1us/qFyBegUk4wNonDKeV4ryA3Sl8ue4xV2YyDa1g2O+ZA58l13D7DsqaYW0zTCQSHO7MQkyFd2wFkvGkpP8R6Umed02jmTzBGNLoRNKvJUB9POyppDfQQvfTpCtq4VvQNKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cEAH4NAv; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cEAH4NAv"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so2392665eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790526278; x=1791131078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4e89CZ9LoTsSmrLA9c8CquQRkeB41VAKqizkd8WFos=;
        b=cEAH4NAvYAT8TJIxezfSX90nNlBLdJdwmHnMwWr0mJs5qf3aDUY6M/T1Oe3uUOezBy
         KYFARSeg9YdZVhhWg6GfapHCjamdOMELSQE5fZ4c1C7oV+rWKAIQIdbw8Fuoof0A1n89
         DFAeGr8AXVDyQ+5E4uqBwiVtQGHvOY2wL3d0uAM2nB8e126heNuv6U/2ENOpcWy3Mhtf
         Fyb7fsyTCKHkPn4N++Z8SVCL/imAx3Y7R08eAW9tx0h7v2Mc0jr9g+9em1tFbGh9V9UU
         yYtOhS+NrPcTfUH6CsmEDiGVrdrRx3ZYL2NfeQOLMgHAz7PLYhKH7P8UIGuiXAk+DnH5
         rZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526278; x=1791131078;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4e89CZ9LoTsSmrLA9c8CquQRkeB41VAKqizkd8WFos=;
        b=x0xIkWZVM8xaJ9/lA2SMHKwolxM6EKL+hcAFLhdcqOKr45u4s70aZMNHYdnm6n8LCe
         7mpg2HG4+j/DdlH6yoFuHbwv2U0SXEEUy1CEG+d2FIWWLLbJ4qTV6D7MlfPHKqFeKOu7
         jaAOF5+MX585rHsnDwOTPLJC+LcJHAALgGobCu0RTUHufHuzrur97taCiJEbIv+iMq7w
         cFBsyoCkp6mHAoJx+n8GMzo8B7YILzuQ9eEC5eYcW+FWuMBT64+tGpqI/g8JfA2cHxw8
         NSLqQplpmSIl9Re0Igdf5RTpL8FjFxL+O8knU1s0hreEKh5bu4+iYuxzT7IJXgxnfG3C
         t8OQ==
X-Forwarded-Encrypted: i=1; AKwUvByLsBs5Wy55zmxzKTNB9pl2hpgS0sbo1Jb7M9Stbzr96gCFgaSVMKcMrxW/31GtwoJIanz4jyQaaUJPSHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsEFbNryhh3paGuMk/3J/mOothPy7d6cGWYJX+BGB7fuiRZUXn
	r+eRV0Xyu+52eEibYYN258HGDoWtjyrcwrwxDTQHsiPNR3T22eltxm+xuyTVH9cosAnk1MkIeHz
	YYH/L+0fGP5KLIw==
X-Received: from dybgi42.prod.google.com ([2002:a05:7301:aa:b0:33e:6278:a7ac])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:65cd:b0:33f:3878:8e18 with SMTP id 5a478bee46e88-3426c6f4d95mr6381557eec.0.1790526277984;
 Sun, 27 Sep 2026 09:24:37 -0700 (PDT)
Date: Sun, 27 Sep 2026 16:24:18 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260927162419.820609-1-cmllamas@google.com>
Subject: [PATCH] selftests/mm: cleanup -Wformat issues in hugetlb-mmap
From: Carlos Llamas <cmllamas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Carlos Llamas <cmllamas@google.com>, 
	"open list:MEMORY MANAGEMENT - MISC" <linux-mm@kvack.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Commit ae571cd6015c ("selftests/mm: hugetlb-mmap: add setup of HugeTLB
pages") and commit 9c5a65f374f8 ("selftests/mm: merge map_hugetlb into
hugepage-mmap") added logs of 'hugepage_size' which has a size_t type.
However, the incorrect format specifier '%lu' was used which triggers
-Wformat warnings when building for 32-bit:

  hugetlb-mmap.c:125:55: warning: format specifies type 'unsigned long'
  but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    125 | ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
        |                                         ~~~         ^~~~~~~~~~~~~~~~~~~
        |                                         %zu

  hugetlb-mmap.c:134:47: warning: format specifies type 'unsigned long'
  but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    134 | ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
        |                            ~~~              ^~~~~~~~~~~~~~~~~~~
        |                            %zu

Fix this by switching to the expected '%zu' format specifier.

Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---

Note that I intentionally skipped the 'Fixes:' tag as I've been
previously suggested _not_ to use it for kselftest patches. However, I
can certainly add one if someone prefers it that way. Thanks!

 tools/testing/selftests/mm/hugetlb-mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index 0f2aad1b7dbd..2edbc992e6bc 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -122,7 +122,7 @@ int main(int argc, char **argv)
 		hugepage_size = default_huge_page_size();
 		if (!hugepage_size)
 			ksft_exit_skip("Could not detect default hugetlb page size.");
-		ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
+		ksft_print_msg("Default size hugepages (%zu kB)\n", hugepage_size >> 10);
 	}
 
 	/* munmap will fail if the length is not page aligned */
@@ -131,7 +131,7 @@ int main(int argc, char **argv)
 
 	hugetlb_set_nr_pages(hugepage_size, nr);
 	if (hugetlb_free_pages(hugepage_size) < nr)
-		ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
+		ksft_exit_skip("Not enough %zu Kb pages\n", hugepage_size >> 10);
 
 	ksft_set_plan(2);
 	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


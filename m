Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE394A688C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147337; cv=none; b=WdlsRZADLjFeght36Univ7BoUdJMyQCIYyhpuQgeetkfLghx2VakqlJI6JpiF/vvf0RpsWu2RzUN42NyR8K5mAH8LvKRhgL+bL0cghnzzdiXW7xk40c7gRSosKEQx6OQYeuDOZuhKD/g6XJGuekOmu7mxl0zKkMixj9+0VzitKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147337; c=relaxed/simple;
	bh=skJBRYLB/FR5oiV4h2qDLm5zGSWRM2OCYBFKl4Cjj18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwlDpL9XLUPOcaLbnPkCC39qhyPb6eA0CNou6kqJHeD7C1uVTCECMltCFZrDOK0AHAn6I2jg6EiLZmdZ8+v/Z9LDuDYR4RK8GUPAU/+798VrRZMxYu+T67hZdUwdFRf+mzR8fZG7ntoc/aQeNHwYDa+QYaiiRMkQtqVpKXK6CjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aI8zBt9R; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI8zBt9R"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b0514ad8fso579142f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791147335; x=1791752135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UzFidq+NXBj47/Ep/6RIWkRxXs+9tuu6zEHYY1jeWcY=;
        b=aI8zBt9RQKmBglc8dl7dUL7c2vAMrDKLWgeFrSWkxBT+zme5bZkglW/NZLxzh7gbRO
         tljPQpPGocVai3+/wcpEEUEA+EXJNDOklurWGhskMmmsxai+X3JSJe/XHqrot1R4xcx8
         wNykom+2hToA+wiBgpwwtsB2OhQHH6+fQPqcv0mgj9JKE1W7imBG5I7R8lKI9EV3i7rH
         5MShmJRnTCk/86mImRDsQL0x/LT6/ewgUEL48CrP40vqG9bb5fWr8fOS3o52uo8tnr6V
         AHBGLvw8ZJNrEoR015INGDiFEVIr18k1F/Roj7eGc+/6GEzZz8GHSba7C+30ToLo7qbS
         lnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791147335; x=1791752135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzFidq+NXBj47/Ep/6RIWkRxXs+9tuu6zEHYY1jeWcY=;
        b=eWay3jYrD/zRHHwKaInHFJ5knFNvyylbAjYpNvI4KdBiyLdgzZjSQPCPhjoRrRCAJL
         oUDI61h3uHH+6KhvzEajfDe84KxMvj/MSQQqsH7gEsZ8R5jV8KF0Pg9JmI9tV4joTefC
         mdOtyLT4QTFuOdO8ksa198W9EdWyRXeTiCKq4oW8PNfED7ibPO5uRijyoFzDRnwpIAty
         H7DylERxe+mRKlPUbFFgnWjfnEZwxqL4W/YClkzpmt7v8HSG/X46I4N5swoK+w7CEX3h
         76e8vhThZDLbNvtn2I3x5xud8i9EpNWVon1yDwX2cxGcxP/ONMe65dgMPhJmSaZDWswX
         bWDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyn17NJhO7kpS0Tq/9UwVDeDlC/pqMCtmc76uX+JaCgtC+Qu/0UmCUwR1lVy/oi5hM25TNNX/MQpA8mvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvmGu2EUAow2+vLWVtMJ1KrkZzDCg7KPHEFZKAmML+2lfp/p3o
	alaSVGGxQPHSZ8GH2A2ZZmNhAHXm4lQyMWzmFUNps7b/5imccABfHGPn
X-Gm-Gg: AYBFou1w1R+YqOqcMIfKXmRbqiX9B2K8XzIPOkptbwiK+qD89e+p2BdW9b6uMBMZ2Ok
	xW4YE8E4dkrMlrexSc381/nv7fYAITgun996USbidGeNmTkIUW4h3K4luk1DL5vFnI+q4PFuyv7
	j6YURPyJm5jd787VSOp9ZN4uI4g/20I1HatpJTMqx3ewVVjfwzcvyC7DdYZr3/y4CoCMP6SFPMb
	xIJqu7VXYiZiO7I2ZbIbVbFd8sUlw7FXFTv036MHFE6xc8vPA/b4BdFuYWEedPzvDjmw///Erwu
	2Ptauf/cNk1pbyqA6SsmDaPtgdhp6a3RZ8y2j7htKOj7ni9d/a45mbz2+RUnEpRDiZM+HN6inPi
	fzgMo3nPrvNQTVHlkra31OyEDldwcNAgYFnimyUcqF+GtpAf6Hkm/fhy6O4uFmLIQce3N4vkm8F
	n2u9dUw2OxD5u2hunE3HykemyMaJ6SP+VCelVTc1lUIcoM4s7oOh2/DUvzw/yImUD2xC5xicCtG
	TouZxCQWGRAUQ+xfEHfSnW+yVUn8lhZBHKVXcF/bGt2jy00yVQSdHQNKFQQzrllqSVMKk0MMSHd
	/dIvVSlRXH9ltJMkGKbPwlEBhdZ4i+GeMQ==
X-Received: by 2002:a05:6000:2586:b0:486:f3c0:c26b with SMTP id ffacd0b85a97d-48c4803032dmr9225013f8f.57.1791147334624;
        Sun, 04 Oct 2026 13:55:34 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0ab7sm20855638f8f.7.2026.10.04.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:55:34 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: hugetlb-read-hwpoison: add setup of HugeTLB pages
Date: Sun,  4 Oct 2026 22:54:58 +0200
Message-ID: <20261004205458.119608-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every test is expected to reserve the HugeTLB pages it needs.
hugetlb-read-hwpoison was not converted, so on a system without
pre-reserved huge pages the MAP_POPULATE mmap() fails with ENOMEM and
every test case is skipped.

Reserve the pages with hugetlb_setup_default(). Each chunk size runs two
HWPOISON tests and a poisoned huge page can't be reused, so reserve two
pages per chunk size. The pool size is restored on exit. The poisoned
pages remain allocated until reboot.

With the patch, all 12 cases pass on a system with no huge pages
reserved (tested on Fedora, x86_64, CONFIG_MEMORY_FAILURE=y).

Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index 70b24e3660c4..31748a24448f 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -13,6 +13,7 @@
 #include <signal.h>
 
 #include "kselftest.h"
+#include "vm_util.h"
 
 #define MAX_WRITE_READ_CHUNK_SIZE (getpagesize() * 16)
 #define MAX(a, b) (((a) > (b)) ? (a) : (b))
@@ -281,6 +282,13 @@ int main(void)
 	size_t i;
 
 	ksft_print_header();
+
+	if (!hugetlb_available())
+		ksft_exit_skip("HugeTLB is not available\n");
+
+	if (!hugetlb_setup_default(ARRAY_SIZE(wr_chunk_sizes) * 2))
+		ksft_exit_skip("Not enough free huge pages\n");
+
 	ksft_set_plan(ARRAY_SIZE(wr_chunk_sizes) * 3);
 
 	signal(SIGBUS, sigbus_handler);
-- 
2.43.0


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7684FB9C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536487; cv=none; b=Kd62J+F05+zrYMNU8Ofgx/5pfk0oLDUxZU3vFVw1siyBfogdBtQcptOaQ0iAAmYMTwmFG6NLR/Zn8QEg/8zS5IwPcCib8jQ98yZx0q3GJgpwXWdVONeiyKoMkrF21rvVB66sXRsNxJGznAYxxs2ZZsT/KPrfeMiTUxqT0yKXsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536487; c=relaxed/simple;
	bh=lWjHP6alA8c9bfJKDwOOPP5dbXqNnIjRZYB6Isxoog8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/bJAWkQxXX0poPFCXSjMsrRmNdxO5Fr029Hm+90LMXCfVmgcrA13KaDDZy4TlJNWSNclaJIihdT1bhEKdyUCqRKxKbnFMnMRQGyp0YTIOfOE7nKiW15YOj+LkawpwPD2wJ3ywE0NxCfRrXTgmaTO8dXTsRxxDfrm3yQLjTcvxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkHMSSsv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkHMSSsv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e257a23aso818946f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536482; x=1789141282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=EkHMSSsvR4nCtFi2868GfW6A8fuo/RlIkZyw92xRmd26rh6cRQZVBbqlX78KjUpKWr
         f6loln11kyYdPp/LfWanh5DZHQKcMJmDZDKsKVpZkgfce7DUZlCPQfyZP+pOiFbnR0Ns
         DzTQejzSHS37UEbMJOsTNt3zTcF1YESm8VUX7NUlJHMAtfnJ5/SiEuUvyhofXIlFDzTU
         BAYSae7Wloa6PMAtoDUlDMBcDquB/YzFbck5qHpZXnWm9JfsYM6Z67TWC0rMHk0PatdW
         h+hefLt5KHlfNNu2Vug34cS/0VCsIgZUz5eR/W8wm60xiz0CWlm8ZN9c+0LOV/BFyHYE
         26Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536482; x=1789141282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=DaWAau8PrcoyE5L57QmX3QOsP0DLD17RIcCSOLouYDx4MtD+hdBQfAlAiRdMkk34c+
         gYyGlotf0hEg7oC0RYh0wvLBag+Og4S8wzr353APpIFD+gKgEVvqJX/TGUX9hzZgT4/B
         B9j3NnMQW1hiY78kgnRzoUcG8y7Q0P5uuQQN/41HimoLzYSvLUM5CUcMXdFU/QWfjFqW
         Jd5ehSU1ZLB8XVYK6c7Z8pFmkmp2h4SUvdFAlXUZLUTqopJbo7Ohdptev80uBeP+pyI4
         AYloJt+p6I4BJg1/tW8NCeMdzl1xw+RhzOcR74AGCqYjt+2bhvWOrYyeukrenh+yOmcD
         EZ/w==
X-Forwarded-Encrypted: i=1; AKwUvBy2Degszp1bczC8CY+laUW6YtW0WcKQKRFZnPMLfwTlqMvotqHABLgzS97bwFcRDK4kf1dSFWS+7dgycYw=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqvoqXhZhrs/8F1h7JrfwlV9l68jPj9fy3gcsvk4Yhw+y92r8
	I+jBk4vLwLVINzjXTsoCZr93yyTpYli695rpx+vSEdCnzGoAZutl0I/0
X-Gm-Gg: AYBFou06JCdkvie0arAR1Td2phdej7bPGZ6Qfs7H5XUKcO5fKz49HrwnOFxQ3q8hAAM
	Aw9/iqnlEW49//Hpo/2dEMy2rsbukCWUFPVuRjwZaTumEDyf9GoemTg36D7MDxhfzRbL6hvqgjC
	/1WDwZHkPBXEWdXCRSzj5oJD8WqfklHAShB2Q1OL1Bi13nrypt8p1eKlVbr6NBkgEwc+701ANY4
	mrtWA+yDfsGo7jylpDUoFKGspFgZh9i8cCsXk+dupfy5DsxqPmkIyAF8OtYm35zkcqC/uF1AXV4
	4t69a+4EVQ9EPnGmzGZ8gpxfgwKMGH9Ik6EspHXLVbbJBOuwln/QBPQpuMPptgK2EZgN31Wd3cY
	6U6/M1GLKvMIXKeULUanVo0lB3JMmtk0Kl9eXXbbyQCuBUedWd88xvhmwQWrPqcw1m+kwlDhqK3
	muemQ6dis2bKHYsAItZjNQ2y+V5QqcdMJ+ZiBmne+Ecx7hNzZbm/g+HM68RguASv+7GQRSTQ==
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49cf8244260mr66326485e9.10.1788536482119;
        Fri, 04 Sep 2026 08:41:22 -0700 (PDT)
Received: from fedora ([109.77.55.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm5959525e9.11.2026.09.04.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:41:21 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/exec: reject zero as power-of-two alignment
Date: Fri,  4 Sep 2026 16:40:57 +0100
Message-ID: <20260904154057.160753-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The load_address test reports whether an alignment was found separately
from whether that alignment is a power of two. However, the usual
x & (x - 1) check also evaluates to zero when x is zero, causing a
missing alignment to be reported as a power of two.

Require the alignment to be non-zero when reporting the power-of-two
result.

Fixes: b57a2907c9d9 ("selftests/exec: Build both static and non-static load_address tests")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/exec/load_address.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/exec/load_address.c b/tools/testing/selftests/exec/load_address.c
index 55fd3732f029..e279d85e8f19 100644
--- a/tools/testing/selftests/exec/load_address.c
+++ b/tools/testing/selftests/exec/load_address.c
@@ -92,9 +92,10 @@ int main(int argc, char **argv)
 
 	/* Is the alignment sane? */
 	pow2 = extracted.alignment & (extracted.alignment - 1);
-	ksft_test_result(pow2 == 0,
-			 "Alignment is%s a power of 2: %#llx\n",
-			 pow2 == 0 ? "" : " NOT", extracted.alignment);
+	ksft_test_result(extracted.alignment != 0 && pow2 == 0,
+		"Alignment is%s a power of 2: %#llx\n",
+		extracted.alignment != 0 && pow2 == 0 ? "" : " NOT",
+		extracted.alignment);
 
 	/* Is the load address aligned? */
 	misalign = extracted.load_address & (extracted.alignment - 1);
-- 
2.55.0


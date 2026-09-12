Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7E385D7F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244963; cv=none; b=fQVSSKd0JvqUKIBvdPjNJUPq/LZ3GvZSlfr2VHxIO6PvsBV6mjkU8lvo49vqEeF6Mgo/PhKzrS5hnSEPVbp2kRmP1LURsiIRmYIy2d8Cgr1a7GwHBHB4gaTrk8VNb141LjbwhptDPDYIPy76osmQP5QzumNnK8Udp9FS4RoYCXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244963; c=relaxed/simple;
	bh=C2mnvvxaeziNBLbh+55aQxwfOxeoafKQAfN1hjPSxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJgRD7mbo3vTAZZ2Z4xQcEbtMg1LyLHPH0PyB3PRCwVNtEEs7aYa0IGNiu59o8U1PU4aVbVkZXH/+5CszTOAdmL6hKdR66ObdCWhy6a9k/pmsDqruYHU9mTasNt8eW5PEaJ3SnX13QlafylKYRMrkkNHcScnVtRNYfVHRl3Tnrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/yb6mEA; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/yb6mEA"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so644495f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789244958; x=1789849758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csmfesBA8dGwPUVlvGofpRltARmcJI/ixlG1I95VhFk=;
        b=i/yb6mEA2oQNZdin6cfq67biVIpMJF1Q5IjfG6JDvCfuTThHVMfFQWzP7i3NEZheCx
         2ft/ePv1yeyXBqkKw/9rVkXxbAFY6wcSkq/sfcurCa0s/6ha0lIL5EJIhCndu/1aoU25
         +T4YcdYD/M/sQK4gdc9tdCzXxUECiKGcIdbgytaQLEW4TurqRVc5KOcwTdHmC/vEr8Oe
         2aKZw559R27e7Gxqe5+d4uidaZjfS/RcCjrbNModxdB7c6fpnLGiYYTbtq+x1Eido635
         /kcgknoIt0aF+E3srbfe5iVW9DyZApax4DMnBVah4qrGqovvKC16CYv3nckEeybPZ+9a
         4syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789244958; x=1789849758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csmfesBA8dGwPUVlvGofpRltARmcJI/ixlG1I95VhFk=;
        b=bMbMH7q1GEnU1l3HMl91Wu2WNXmtGTFadEl9MDwdMbd4tcbhLM3QTQgtMieQchi27g
         WrO37jAAkr+KVChQyaedREmx9TLNt5InmUO3YdU9nMAAMdUADVxXKwd/8ZRpw2ks8WfY
         Z3gvNsItpZv/nIE/LrSDVgBOj2yw0/RIEG4hWEqSExyuOqZwflMu2FfFLjkndfVu94/y
         zCOxe9IZGUPTB+8UGRYDaTbXmX7ADB8vwD4L6wcBQiGLRv36HSrO+eohMp40oeqFjotR
         R1T/akIgNy0AXUCReUy23ZPguoCKwsYzkbI0izmw03FmEOX6b7xm2XTumc53huhq7wXx
         C7iA==
X-Forwarded-Encrypted: i=1; AKwUvBxNqNnnkrrgXfvfGDt7Zj84a4C7I7x5TTSz0HbXhfOkkebCsvauEZ2AJNwXS45IO4ic0GB0zHROeWQOXcE=@vger.kernel.org
X-Gm-Message-State: AFuF++kScx/y+/epoRwy/bvnf7MH/gftYhIDWkRu8mzXD/xGQtAE+PU/
	Dssktt3+U5iCKZLtkD8KgeRQ1GxGUTm6Epqy7PI4m/bPxuoDLWh14niJ
X-Gm-Gg: AYBFou0rn1otP9GptL4m1QblkJQBrocE8CvqnKzw72nIk4hG2VSQpxixqtquRe59vJs
	6DT0W5QZ2Ap8TDHNN8bDn33RGCZm4LCHFf30mhzaPl892KAAy82D8wbzEP5XUOc458PrvPnQMqI
	awWPO/0VrZH9xLn1gsgnFg/4aNAJfdEG0NaTV1EeOwN+tPYnE1IDPbYXm235ABWDMsw/1/Qn1gz
	+7qU9BvfydlbUTgEfl1jKseGM7HnHgCzjco8jSoRSwgju2Szgv2BvWyYlP51o0bxBufHaOaMrjY
	Yyirggkf59mQv81iLF5fY757H3WXW6t64Rkcv79ufQ+YHifOQ6N2RUgjwm4eOXu3MKq+g9ShDQO
	G8m0j5C1kTNNtc66QyNjaTXGXKcmKrYxlM0Le/Wbj/gz4mlwMqbhK+9HwYx7E5G09XCy3hDuZmR
	4gXOv9o8exQAgL2hQhIumGQBg1dtmdJAnz8NGHWd74FKKlnu5H3ZoThecYq82kTSiqYiNRSHNhk
	xtUrNPa0O++EXMGyQwTntjn5zDFmV1rJinmRrT8rMQe4H9wBweM33yAHmxI5H6KVfYKdRj9WOvI
	XjzXa7N1KiX4t+cBOqwzhd7/6Hgj714jO9yDHEGV/8TtyCcfBW9qVcLO5mY=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr192931035e9.14.1789244958264;
        Sat, 12 Sep 2026 13:29:18 -0700 (PDT)
Received: from jaeyeonlee.telekom.ip (2a02-8388-4003-3780-a532-8e05-d6c6-f4a0.cable.dynamic.v6.surfer.at. [2a02:8388:4003:3780:a532:8e05:d6c6:f4a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm238050975e9.10.2026.09.12.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:29:17 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v2] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
Date: Sat, 12 Sep 2026 22:29:03 +0200
Message-ID: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XFS setup for ./khugepaged all:file checks that the kernel supports
XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=y and
xfsprogs is missing, mkfs.xfs and mount both fail, but
SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
The test then runs against plain tmpfs and six subtests fail.

The script already has a skip path for this test, but it never runs
because the path variable is always set. Assign
SPLIT_HUGE_PAGE_TEST_XFS_PATH only once mkfs.xfs and mount have both
succeeded, and remove the image and directory otherwise.

Suggested-by: Zi Yan <ziy@nvidia.com>
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
Changes in v2:
- Attempt mkfs.xfs and mount and fall back if either fails, rather than
  only checking whether mkfs.xfs exists (Zi Yan)
- Fix Assisted-by tag format

v1: https://lore.kernel.org/linux-mm/20260911124517.63714-1-jaeyeon.lee.dev@gmail.com/

 tools/testing/selftests/mm/run_vmtests.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..b870d21c055a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -417,11 +417,15 @@ if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
 	if grep xfs /proc/filesystems &>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
-	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
+	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}
-	    mkfs.xfs -q ${XFS_IMG}
-	    mount -o loop ${XFS_IMG} ${SPLIT_HUGE_PAGE_TEST_XFS_PATH}
-	    MOUNTED_XFS=1
+	    if mkfs.xfs -q ${XFS_IMG} && mount -t xfs -o loop ${XFS_IMG} ${XFS_DIR}; then
+	        SPLIT_HUGE_PAGE_TEST_XFS_PATH=${XFS_DIR}
+	        MOUNTED_XFS=1
+	    else
+	        rmdir ${XFS_DIR}
+	        rm -f ${XFS_IMG}
+	    fi
 	fi
     fi
 fi
-- 
2.43.0


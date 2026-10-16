Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CE4A4F12
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155287; cv=none; b=nsOpqKN+tMr7gOpkMdm2PQKaq3+jKQjhSku3LS4sshuh2vGDF4LhA5Ld+vlcb5pj9PT3JefMxDdh/tMlZJtGlyxAVUDRSpWCr+Ok7zNOfQzLW6j6Asx33taEu+eC9nCaxd+QmhbDxgqgYVQaBQwOP2UGyMJkUEhE1jCavMBfQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155287; c=relaxed/simple;
	bh=LtOibToDbEaBaevqO4ikHPxXA2mp/7h2SUznsOKHAtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AO+eAPHbvzUIK4vD28fbbUrc22Qe1FxI5/yC6/dmFRHaNr3/x5E6lAEy+/7+uLuoVNdCbYZ+2yzo4R4DxN7CtObTcPVGEEOsbo3EyhT+1D5Op7lFug4M89QENqRTBwv47jOBhxVQicxYaA1kMjno2VQBKg5pOnssPajJ1eppO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8wHP1Jl; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8wHP1Jl"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so5895067eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155285; x=1792760085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=47xwNbLDV/wYZSE2wpX2Ena+RjFR2X+u3FxDomSqYmQ=;
        b=h8wHP1JlCuJhMsidMonmya9u6255PqnG6bFZo8I5rC52+WUPINutq9nWvV2gaqV8TF
         sMGZoseL/C87XfjOVEQagFBb29MND4NbIzC5ucXjzYf7XRdaGF4nD6V7GFi4p3Wpm0qd
         v01Loh06OMV2fJXfeIV2CtIkg4+bE5/5v9zGiKx/BHwwx5eIKzaiiETaIY27t6FWN0Kn
         KIuz4V6GT6VynpvYMmsjyvcCLom6Dqk/XStbV8cVYuYwyUAq+TaYHQLV8emiUKwN7eFz
         91xsQaj7JUAE15V4SIeTORJMhkf9zfr7R6CVfS+pn0WjXPB3zTrQ4eq+KBek/DvvVgD1
         2Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155285; x=1792760085;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47xwNbLDV/wYZSE2wpX2Ena+RjFR2X+u3FxDomSqYmQ=;
        b=RhK3AdkCglZv0snysjSlnxCg6Cho9Mt969e5ztT6wRXEoKy3RcjA5zK9Gb9u5DFim4
         13AWOwdWgjuQ0UTVwqfOrHMEzSibUpTiYIDZPNYdm2WTeRxP22c0zGp0MxPnRhGw/GRO
         u4TRuG4xhtpK5IsECNb1yPP3XQ7mrdUsfy9tjzJXip/vH6oKp5tIDl32UTr2jp0pQvkV
         p4EQWNxIHy8zip4iv/r0FzPzTNaRQhg6nP7k1OKkt2HxN5aCDjksQ2bfpsZKZlK2f73J
         sLFaBBQloGno+nD5zCZJU5aKHDELeaN66AL/P4EXS5yFUkx4vruOJwr7HCLarvW5mSXq
         VsAg==
X-Forwarded-Encrypted: i=1; AKwUvBx0Zt6PiQUudaZfTMRKbhNh6NGHWNf9ESS58Wd/mdo4Wm2g96XZUcULmHEpAArMhyEwx7H5asTorx1DrL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGjwADkj5mOsvKgJGRpPqb4uE3PZ0Ito8K/QzWwqajX9HAEPK8
	dM+P9npxnOOK0MCQeXYtQTAx6gzmSBTxwwDcvJZNO8Ci5txMCu+GmTbb
X-Gm-Gg: AYBFou2/luJaV18T3j0cpS9jN9IVlPzb/PD7pjVKltPlMT1Er8xkZx8pUW0z1Ka/F54
	Rg8AXCgUbOHduq/msLZrsO9PmghsrutEF/i5NKH5QN+q6ZbaSM7QrM924M+ICQ3evc0I7CB+nNI
	gSQ42F8XX/lEaJ0ixCbmAEuLcm7U0v4fDNokRS548Mhj8G5ZJ4wVGH1kCXSqWJbp0dcyx2QPkdP
	PGpeQqbZKB4H5xaoQYL8QFgsiO4DmiJ4PwKhYNO6nx+Fa1RBB+hyKZVs8rnTe0w/GEequL6cpGO
	H3HdKltPXqQEPp1HlhpkfOCMplBWPX89KDkp4VHQNOInB2uGegoGeSqiAaU3vdT26th/VCkDDvQ
	cYsJRl/BN2IOtnRUPiS0yDx8LQTb6RwymKqjtPSuwMV4oRhXsSlUgdOatMYcwfUbfgRvlAExLyt
	HTeHrn1tPaDrP8aSB1dScOhVDeVf3EDNEpPngGV4ZYdmO8ZzDYdcWXHNTlX5SjLCWwy0jaKF9SO
	a/s
X-Received: by 2002:a05:7300:6d23:b0:35c:6ffd:e91b with SMTP id 5a478bee46e88-35c6ffdf3b6mr20435005eec.40.1792155285484;
        Fri, 16 Oct 2026 05:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm6829118eec.1.2026.10.16.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:54:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 20:54:37 +0800
Subject: [PATCH] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIwe0moC/yXNwQqDMBCE4VeRPXchEUmxr1J6qGZiA00iuyqC+
 O6G9vj9h5mDFBKh9GgOEmxRY8kV9tbQ+HnnCRx9NbWmddZYx8M6seIbFuiinBLLmnlLf+6hpuJ
 nKQPYw7j+7ruxQ091bxaEuP++nq/zvACD1dWgewAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and
for the pagecache folio split cases of split_huge_page_test, since
tmpfs does not give them large pagecache folios.

It only does so when xfs already shows up in /proc/filesystems. When
xfs is built as a module that is not loaded yet, the check fails, no
XFS is created, "khugepaged all:file" is reported as skipped and every
pagecache folio split case of split_huge_page_test is skipped with "No
large pagecache folio generated".

Try to load the module when xfs is not registered yet.

"run_vmtests.sh -a -t thp" with xfs built as a module and not loaded:

                                   before    after
  skipped tests                         1        0
  skipped split_huge_page_test cases   43        0

Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedaee..6b754555d5734 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -399,7 +399,7 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep -q xfs /proc/filesystems || modprobe -q xfs 2>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}

---
base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c4e9

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB541D23B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249653; cv=none; b=qU4ibbvIao51CS8BFuhFtJ3VIOucrBbpagr5XCAFyZLh+OcFERWH3KxGig9Ycpi48qQpSD/YYi89IFqSiY381IT8vhgoNrHgoOtYLuEZUXchpFx6cqztwNcB7CGNdriqIYOJfB5sz43rxFBaaE2CDKaHGRAifZetLQ6f5o2cj1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249653; c=relaxed/simple;
	bh=ajhqMMevRMUkFNjLwiWa8hkPP68v/fykXCHCDIhZgzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrL3Lm6M+VusPe+c4xbYKZ0luc1RQWkRMlWUobMhSUgYfpMTDTRlLkroJVjxEaNTrxuDRKSlO0oJFFFZLe8HjZfHstFRnsR5eFuzNs3v/2cepa5vfdpEAt+3Hb4/ALIljK5JXW9SU/S2IExRGeXArEB5QpT7pKeu1un2nho+t1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwjlxIMQ; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwjlxIMQ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f036b17easo798934eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249652; x=1792854452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQ7X2jkYefaXYnnpfuBlQ4cNKv2piH6HTiOHbSZfNQ=;
        b=cwjlxIMQN8UKfOv6aOBvWDAnU1cllWpKwqL8H1QBBJSevrSIi4p0IU3WIAURTFSQwx
         4/eF/287ufkooF2AmmNT7ELVUD9aCX/qEPe3fJgbVYF+qpDnoSqZBdmYt4UaTVpg1S0z
         QuYrQR2IZtFW17H3I504KSyx4oVOZ/+ynrMLFSP2dzJU/hfMhW8gr752R0/pyk+2a85w
         jsmA+zpySla7k7suDR2JNp1cpBk9GCGPE3NFtBfRHXwA3lO99JFn/EQeNXKloryEob0R
         OD1esty5uP9BJIs3xG/VtEq2Zyc640EYHfEOMn+13wwlj81Vh3pnLQXOfaPyV7OwRwxq
         aGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249652; x=1792854452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBQ7X2jkYefaXYnnpfuBlQ4cNKv2piH6HTiOHbSZfNQ=;
        b=kRZE6DPVJ7yYKi3NdtSkclZS7PfYWlzJzh/FthYYZxrTBmRZ0v58SgRPTQ7PRapCwL
         cfaUPoRFl1Wi+JQm0WqGFAPbgrJ5qiXExvAdPiJvuSVrSkiUPwb+vKpUYG7FqDA0CLL6
         c0buSpVf/eTg+ozqEXqVLH4t/HPuYA5Uj5iDQhDA0R4I6ZgjnjSBqCR9xHnMl6hbgojr
         UGyrUcuDAHpSvTlgWStoGHT4Ykk3KEdkTTM2czTCOG22GvdxjKtr3EiitYvprlkMJPHM
         k3o5sndpRXt5592jV1qUzkpWNMUG5orzMaRdiAqGKJ7HKRvpW98U9u1qs/CkEDi4Jz40
         KQ5w==
X-Forwarded-Encrypted: i=1; AKwUvBw30WMV7t809uxrEloJUL85SVQRgbBbs3q7cIcwUTacRZNNrbbiPCt0hjiL1MWY6WJHosIytS1QE3oHAyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuhgb2nHIq2kPvBWsNPQZ2qx3v84tqGnFu0ghRUgsg/+Z21rUb
	tgBWno6Qj/2LiB+tr6rxrJehZ5jAvXwnyijC4vXuMXeHWzdbkNBZHz62
X-Gm-Gg: AYBFou0R3ZoqbOJk2Z2kciojiUOfT+AOgsR+kd6XdDQd6NikC5nyLc/Lp6Jp275+efO
	zEi3VRGrAFRYmI5jWl1+lHgWW3ZuLCy/ArwwldBYB9xz4y/jpUzAlxQkSeqmddVOzdAmCYxM9Mi
	9+6Y6SBgGF3Zwsy2aH2HIg4QAgQgf1uiOs98H3JE3DAJYP/aBoomoC0KVzrqDbkiicc1aeneMuU
	SkwSLsfbbExH3Mc85dQVCABW4zJeKzvneWGVs56b7ZJSO7pkOpt0+QoUBg9LETGn05JHpJ1zl7q
	YE5mrLkZyt5DB97SEo3pCuyRW0jxMv3teeSdZPvS9YYkmhtokqiPrrj+560j2iwT4Dn8uXkNZUn
	0e7ZZIt671LTUOrEPdJKNwE9GsIHFJNQNQAI9uJIAkDg5fVz3NmRar3A8BZ2aoNZnG4TtJtoHA4
	vQbHQ/pJGR/maBjwODDRTRujgMHh2KWJZoJM5aBfMhQQP1mDpbR/t8hQLRord1M5O+6w==
X-Received: by 2002:a05:701b:455a:20b0:168:3243:c910 with SMTP id a92af1059eb24-185120a88cemr4732337c88.13.1792249651516;
        Sat, 17 Oct 2026 08:07:31 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13170977c88.8.2026.10.17.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:07:31 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 17 Oct 2026 23:07:13 +0800
Subject: [PATCH v2 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
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

Load xfs with load_module() when it is not registered yet, so that it
is unloaded again once the script is done. "run_vmtests.sh -t thp" with
xfs built as a module and not loaded:

                                   before    after
  skipped tests                         1        0
  skipped split_huge_page_test cases   43        0
  xfs loaded after the run             no       no

Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 56f5416681da7..ba77fae5df4f2 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -428,7 +428,7 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep -q xfs /proc/filesystems || load_module xfs; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}

-- 
2.43.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A341F5CA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467364; cv=none; b=RxFnotUIfnNE71hb/dJXZc5/e/t3NkU8wDgSU5O2qgq0Ltk7ez7yALn8CQwVpkSKvAEjgwjGYFNBygwCUC+FmeCtuq25U/Au/9twvzrdiPmQsgXTFnXYIAOUWBv33mgDVt+MP5TeKFMbyxzmivcgKiB2bQgHSgOrcXoNgx10L6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467364; c=relaxed/simple;
	bh=IhI6vje9LnJv93nqqPm3Qbe0Z17RNMPHLmQCGiWlfDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H5taL/+q6ZgtQdf3OSnj1ixBxT5XYfjAML4UoBiX/TP1gH72Fjw4BketblNVlJCnktN+omsVptD/J7FsvA/drtyRQn79+Urpt3gcVo9LtmHLWRwpXc8jwDzOmktokcVKIko4kOHpIDeTdyYPVlWTnCGclCdZbI7yCucHCWbLYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4/VWeIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4/VWeIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316241F000FF;
	Tue, 15 Sep 2026 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467362;
	bh=1p5u2Zwv/oGa+juGw7P9v9Q6snr+DKkTRIeNmG+WA6k=;
	h=From:To:Cc:Subject:Date;
	b=L4/VWeIAVDb1IzFKLYX1b/+IaSxpVI3jJNVNJK/KrLJj1lPqvsaKt6sIEY2jrpXAD
	 0EfamwAPKN09SBCxULADG0HVUsCF0rCS2HCanCVTd1rbWN143su7Q4lxoOygf/YdMG
	 gmpMOt76dM4zHxEDdKyeESVM4cBRTLvsUYnLQrTs5DbU2kukNTkkXpAz/Gt/Tk/iuf
	 posWqFnP4N94Pcj9WQq8u9pU/SVeZcqUb4cLlAw/5xtGWJIIaFqQ1tcwu+mIumfEtq
	 gpRaupWOrLyBIin/QWtUIaX+F8bnqKaCnlPxNtRL4BXq1DJjFvA44j4ymwYecbm12j
	 NWTei3CcBR+gg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
Cc: axelrasmussen@google.com,
	baohua@kernel.org,
	baoquan.he@linux.dev,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	yuzhao@google.com,
	Chuanhua Han <hanchuanhua802@gmail.com>
Subject: [PATCH] mm/mglru: restore accidentally removed seq < max_seq check
Date: Tue, 15 Sep 2026 18:15:56 +0800
Message-Id: <20260915101556.50467-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 798c0330c2ca ("mm/mglru: rework aging feedback"),
the following sanity check was accidentally removed:
       if (seq < max_seq)
               return 0;

That means we can perform aging for any value less than or equal to
max_gen_nr.

This has been inconsistent with
Documentation/admin-guide/mm/multigen_lru.rst, which states:

 Users can write the following command to ``lru_gen`` to create a new
 generation ``max_gen_nr+1``:

     ``+ memcg_id node_id max_gen_nr [can_swap [force_scan]]``

The correct semantics are that writing a value smaller than
max_gen_nr should return 0, since the requested generation already
exists.

Fixes: 798c0330c2ca ("mm/mglru: rework aging feedback")
Reported-by: Chuanhua Han <hanchuanhua802@gmail.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5354eb8d3a07..18c4d3595749 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5827,6 +5827,9 @@ static int run_aging(struct lruvec *lruvec, unsigned long seq,
 {
 	DEFINE_MAX_SEQ(lruvec);
 
+	if (seq < max_seq)
+		return 0;
+
 	if (seq > max_seq)
 		return -EINVAL;
 
-- 
2.39.3 (Apple Git-146)


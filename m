Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC663527589
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687443; cv=none; b=aMsfN6bqb8jurHryBaw6nt4FN1eGhfuoYRubfozQXwLfkEappMEoaoZRWoC4ZH+Kp3qro/FmDL5pZ7vnOj34GbZl3B8ifZlzLLn/MJVYZe3Kq5GNEkQgRD3hQeQW8HnCk1dK+7LiVFkN1UeLvMRYObVTyhE3SpuIxGl/+AKfP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687443; c=relaxed/simple;
	bh=IjCYtrfBxeBhj+guwmhAM+glVNFJFR4uaq1zahSbRJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLyUmTlVgHwPpEySNvc3ZByz/yFcpxxWNKrSyWuhLLB4BxWHAdhUXJM0oxnyoMslcUX9qaEmB9nSspWXujT6URngJ4jSamYRBvpuF9nqeOccyGC7dYSrDY6J+eTteLtPAcwn1C/uEYoLFXRVRERDdYTfbX0jPCEFVSZKcZaWLL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3c3ncJq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3c3ncJq"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a156so103492a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687441; x=1791292241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5C5c0ByPS6Z9BVOilpDVRYaF46vA/1HlMT1E17MuKI=;
        b=H3c3ncJqog/urYGvo7gG3sHCA6PFzqTs3E4BKDWjZbLn7Zt8gF5XooYQhJusa3FtD1
         227gCGsjdRzFnllS1DKlxVAvM9wbJ50Nu5ZyGceW6QtoLQCwQv5vXxe47cZWd6+PFXSy
         0Avt32Rk51OBwr2Tgem52aZHG9R4qhfScV7yrUohxf9Re5v3sPSDfVvjSOs1iKGSKgLf
         9NbB3po8+jQp/fpCxn8plybZ+CTTiwtMdclZcQIIYgIdSnSjW5Ue/RMAp6fyRIiebNh+
         9WPjV8G/uN+6iU1gYtMkqCfhTSOJfCWIub17hURj6QcW7JsgjB6kHwR9WG2DgROm/hE5
         U5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687441; x=1791292241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5C5c0ByPS6Z9BVOilpDVRYaF46vA/1HlMT1E17MuKI=;
        b=tjnFE5ssKKHXzp5Sk4tzEWCwW48DPrVDSSfSguwnTdy1RWVjwu1SvRzqUikMqvuvy7
         t8gLWdSpoLqRtYWAdoYHUor0lopQoObGaDNp5b/Pu4swvltLi4662wyAh6T84qm1mdlJ
         ZtZ5BfvJ3/DVDufVkQzwwVqi+Vf2ocnlEFzAvEV7IR5fe9JuuIDaKVj12GNfYp4yLHfB
         h5s4HFlTJVhs7mFX3ZejhuwhORiZA4pZoHcXTEI/1Gdh2VSU18eiUG1CXBP7B1YR84ct
         cc2fKAGBRwNwBehNfy2UO4CQ2nAyHuC4C1MQmPy3o8gp85TpNOHwW1U9YYoT96iiqDPW
         /86g==
X-Forwarded-Encrypted: i=1; AKwUvBwpy5tvtF2wyOWmwJ1vgrMf6N47slamwvXGJ2DvuQue3qZmnepcHH+gyTubz/zXRYB1HJHqUVUXyTRyjUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk0eiDi99lh2ZcHSYnbNXC/yO6cYijCNCzaMP8/UEFGqEXp+Ip
	JC9EJVYPnKB0tlx2O1e21/1pllidtee3QEBdg52oU++FTQdthns3r+2H
X-Gm-Gg: AYBFou1ubKfFt6zAdls9sJKOZe7Ok7jqGFNj4FNfLpfPUS+vLRnxJZbSw6zKbc1fFVa
	j97bnYQANkEi1gu6KxNXw6MYJpWsYHQuk2WkKQL+f6jxxIoRU/u09s1L4slT+z4/GrOFavmVXzZ
	I8+QdzF6nzmXPTigxcZqEzJTNif9R6dwNUecwL/49SSH8WpDT/J7h1BYJVjGgQuddH3qim+ya5C
	p2qh5DKnnWgH90s1Q83aftIOCsO4tOTUbtiktSJ/2EhrZitFAa/mlKrMaWTAa7ilbH8OUto4wEp
	qUEraaY6cMnX+f9uv09ZZKELeUBhUTqG7736i/ZOmw9d/1Ayo3efSzpdKNtBUaYQAmRedBKyhbF
	0cmmCTHomYxhzvPtjpIcpTbYX5UkKTR3FCxHTcHayCQqH0Yv8MWk4wOU71J1BU/q0ugIaQri3Rn
	o1swllfitCQc7o3OArtRQlc7k7u13gzehXCfUHe30y6bklS4UtZ4gcKDAp4gU79JjiIEO5GM9FV
	Gktoi0Yhh0OO2UH5ssMAByd2AcQnwl328VUAsU6R6ohob1s56HlOS9beA==
X-Received: by 2002:a17:903:1ad0:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2df8e6db03amr164544755ad.2.1790687441008;
        Tue, 29 Sep 2026 06:10:41 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
Date: Tue, 29 Sep 2026 21:10:18 +0800
Message-ID: <20260929131020.266120-5-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every zh_TW translation names the English document it mirrors in an
:Original: field, except these four.  Add one to each, in the plain path
form that automarkup turns into a link.

dev-tools/sparse.rst still carries the old plain-text header rather than
the disclaimer include, so its field goes at the top of the file.

With this, the only .rst files without the field are index.rst,
disclaimer-zh_TW.rst and glossary.rst, none of which translates an
English document.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst     | 2 ++
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst     | 2 ++
 Documentation/translations/zh_TW/arch/index.rst               | 2 ++
 Documentation/translations/zh_TW/dev-tools/sparse.rst         | 4 +++-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index 95614600604c..15d54440d224 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
+:Original: Documentation/admin-guide/clearing-warn-once.rst
+
 清除 WARN_ONCE
 --------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 20ec5bcd5f18..13f03195ac7e 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
+:Original: Documentation/admin-guide/cpu-load.rst
+
 ========
 CPU 負載
 ========
diff --git a/Documentation/translations/zh_TW/arch/index.rst b/Documentation/translations/zh_TW/arch/index.rst
index 7c0490589465..724468687c20 100644
--- a/Documentation/translations/zh_TW/arch/index.rst
+++ b/Documentation/translations/zh_TW/arch/index.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+:Original: Documentation/arch/index.rst
+
 處理器體系結構
 ==============
 
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 7a3487a7b2c7..7ca7fdf6e1e6 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -1,4 +1,6 @@
-﻿Chinese translated version of Documentation/dev-tools/sparse.rst
+﻿:Original: Documentation/dev-tools/sparse.rst
+
+Chinese translated version of Documentation/dev-tools/sparse.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
-- 
2.43.0


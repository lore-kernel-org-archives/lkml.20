Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC039902D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267438; cv=none; b=a4wHAgEIQUKeP2BnQ2qbmPFtGE4KsI/2Q+8Umz+7QxelCwrSK1M+novZL7bb4pkhkdyl9p1BVRuCCmDXILi2v3+pxJ1hE6qc2IdxYP02+mMsTKvPfq1ioYfNCaMXOieo7NkRWqhG+yweEInBMLqGlZ6uWecMN8wQq+PXBTelx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267438; c=relaxed/simple;
	bh=IZIiJRLdf7Y62rMyh6mxf3vTvBb0tPVfGN3EcD+VMpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbHmhfu1DjRVAG3UrEzfWSXalk2L4odjEjniPKrElD0/uBi2ldOb4Z3/XQwm5vrVXI3DpGVh/4g7oReQgA0mx5pyf0CFZ8B6puc64Gf6ieB8z1knvj1bxUB91DXXB5orKugmJdcCuDUi+xsKbu3ZIq5Qp6DTiVakcZSW6c9Fxq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjrnEJvv; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjrnEJvv"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso92964a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267433; x=1791872233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XGWdEYbUJd8tcJmO7sHix7Djo1stlaazK2dWhUeaRg=;
        b=mjrnEJvvh0TUv6e0ty6HR8vLYc1HSdC7yJg6jLh+h3WfKLkgpKbgVtBhaIhuWX918D
         ojZHxxdNRwvxYQHL6Avx7b6d/HQTikyo/CZyKUe44mglmMjclYHnWGFTLV0RMvfA/74X
         ZnbEFnveQjefbkez3WBhw/Ue9a5L647206i89UK9LK4ROWaXN/Jxz+LI/87wnh91tLXo
         15fqES2oAC+wYTzo5502pVVDYfL7GjanhW0+XW3TdMpQHoVFy9bS7YNh8ZhoLu7Xc4cK
         7szeehiT/uJ/UEfjWA8kcpoLtAQ3FhiOGfFTpg2VEpYTaCUk+orvGZnMKWKXwzfSxLZ0
         e8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267433; x=1791872233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XGWdEYbUJd8tcJmO7sHix7Djo1stlaazK2dWhUeaRg=;
        b=u0Knud9KEI9Lfcxc3Nt2OqtSXg0muHaD2WyyxYjQSWHcpFdtm5QGEBvlDbC/Qpr28M
         W6KTUaNXEaUxY1VREy/NjHHDPJL5wn/mhpfZAWNWG4gCx3mS+z0Z9uUjPbPukHwldUSf
         ULOaizZGWJ6kvd5Dh8cgksJKtXc01yUVYPRAoE7vpraEi2FYBrtoR6OMxn+W9UHCWbIb
         roOb5DQZVGJw9tRUUuVUHOG73LJVJmnslssoG7Kt/orXmjGv9s+qo8v9WQwCRkBJDidS
         LYulSoA+gUdKyQYB2psjv2xe+COo6vmbElT9TGO3klEbgYr23EZN6CEKtlrM1tLJvnIV
         0tTQ==
X-Forwarded-Encrypted: i=1; AKwUvByRMgCJR1CF8iVScKzlNSxWQtNXvCn9RsH5dfYxwb1R+3hVHc9cPJiOKBqIh1kYsjirAt/pwfINyc2UvbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmaDB4FlE0ceJT/W5fPOhI/8Vk6L7LobKdHbwFSGJdiKSYZHEI
	d39snLkiV0BIy/OjfUl3x7QJpcg4mykoXZ3BxVEGXCKReVB1qzxAvIDe
X-Gm-Gg: AYBFou0ykydsWgHW6FL4oFDhixWG/xLCI3/+5Us193TyWI+QzpttjY1Fc+lyb7cfLRj
	w+i3fcHc2Y8t6UXfJfPTmfkgj4/jWtG98l769bHZDDNsGB/C/dJ/uSGzRvo/hh9FY6DEu2iSgdf
	2/XgRr5ENHUUvArzZKmQUo54fhtIGRihUab0C6RCpvjt5mGTLoZOHAc0LuvsZhm6Eyvtxfk2llF
	1WWY7w/M9lUazne1LNlHyEBfRek2N5ruov3z5dPAl3K6ZaYjHG6V+GIslWRDwJxn/Ncm03OPi9c
	8gTBCxo+Yb85o1AWtOhjmnt97wFG9wy4GennLM22gQkxEhrwrpwwW1gkpuZF5gVpoZy2khA9Le7
	hjseIkyHnaOwKzejOnt5uqIifc8c15R1fewKHopFZhlOZuX094fASkKrcjOmeEw3rL+KaGhIHav
	jIE2HjALrW4bot44cEDXAjDoWH2k+kdmMTB9AkObgRbVsr8+elXiS0/47NGf9aZp8hCFtiUnFZb
	RaasggDzF1PLCZXjyOf0epOMOEOGT8tzpf0IO6LHRN6tyB04ikwk4oyjox0glcw7Wbn+VeRUjj6
	ySirfr9OuiQ6UeC26TxepneW4uA=
X-Received: by 2002:a17:90b:2e49:b0:3a0:c3d4:f3b2 with SMTP id 98e67ed59e1d1-3a873729daemr295202a91.56.1791267433227;
        Mon, 05 Oct 2026 23:17:13 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:12 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 3/3] Docs/admin-guide/mm/damon/usage: Fix incorrect option syntax in perf example
Date: Tue,  6 Oct 2026 14:15:49 +0800
Message-Id: <20261006061549.627-4-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006061549.627-1-adrianhuang0701@gmail.com>
References: <20261006061549.627-1-adrianhuang0701@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kill command in the DAMON documentation uses an incorrect
option syntax in the perf example.

Use kill -9 instead of kill 9 to correctly send SIGKILL to
the perf process.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 Documentation/admin-guide/mm/damon/usage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 3d43954c7046..bd687d89ea4c 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -749,7 +749,7 @@ show results using tracepoint supporting tools like ``perf``.  For example::
     # echo on > kdamonds/0/state
     # perf record -e damon:damon_aggregated &
     # sleep 5
-    # kill 9 $(pidof perf)
+    # kill -9 $(pidof perf)
     # echo off > kdamonds/0/state
     # perf script
     kdamond.0 46568 [027] 79357.842179: damon:damon_aggregated: target_id=0 nr_regions=11 122509119488-135708762112: 0 864
-- 
2.43.0


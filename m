Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650569;
	b=N1ZKNDmyhPuWiA5f3b8pki1/ckjbbPjDIgf5aNgq3N+M5wYVNNKqpdULjXA9Z97f5xM9
	 AE2Mv7EV3eYcg4nxbiifQJgRziAQhjTw3pKcelw3aHy5WUSieG0XmmCJ3d6UMdNP3Ywii
	 54pDeFDNyKEGbN1aUKgiZAi3KCgDJHqxT209vAs1vwmNTJ5DwaTRS0LuQeEwLito86hlA
	 6knn6V0Mswybk2wFNWzOUoR2o9jyiWSH2M7c9qYqQZ9EjWRPI6RA4+XXXFJ0vj1x0V4ea
	 PuxR5d6tIHaxkxGGPBEhj+VcEmx7dXS45fECWJDzz6ANTJ2MTZWOAhGC/n2Nq7SB0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LTcIwHCkV7H2yPlaX3buDu6FTvh743aqgH51nE4exbo=;
	b=G6BFdExSjY2s88LonRTZWYBfXw7NxuDRQcLftuTjPmVzs0s5skjbh/ZTzAtywBhO8tBF
	 HqCbh50XBh15j73/YxXbRwAUnaME0Q/l18ZtwGNHdSOiBJi+2qaEq65+q4aXeD14gr6xg
	 mJWx7xgCs/OeCzbe+q2GOUYB7XBI9YstKn8V3CE+mDvZkio6gIWa2TGgQd5UBOYeWGMpC
	 9dR1G2QKW5HapKDk4DrIqvLQeGJCO9tASfDm3z6gHvupeH+MR87kidEPkQORZheW7/Dkq
	 HkAuz8G0VpMWXGjG/V7G8U0ujqamjnyPnb2w85fbYmNzvEuSrj8NHu1D1gsxx8D8ptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RA7ykCoi;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E77606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E77606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RA7ykCoi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso9974145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792650568; x=1793255368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTcIwHCkV7H2yPlaX3buDu6FTvh743aqgH51nE4exbo=;
        b=RA7ykCoio66j97+Kbw8fQLwbcwqAiyXhRXtE9pOh4FG1DP6wph0NkMPtZHyOpqVMCQ
         Z/kebvp7c/Jq5gOPyOpuuRB64ZAX+iU3+yF+p8sjbL6suX4K5HYLIEWmOR32nI9V0nah
         vIMGg7ARyS4Swa4P4a3Zs6Qstd0K0qvULJ07sAr+Cn5Xu1CONlwNtgZkKyeeTc86bGVW
         0gi4d9vyj6AptkcJvn0QGJgwMeBIxt/is7ieJdnCFDCY7vCAbdMfNHW20ICNH3Qe80kW
         ccyZS8XggWVrA12NVP5yOPqNFK8XHorF0MhAbpUWj5cSPRUbgVN0/ZHfag6NXg9xrMOh
         zTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650568; x=1793255368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTcIwHCkV7H2yPlaX3buDu6FTvh743aqgH51nE4exbo=;
        b=vSI3V2kfctcWiNu9FM8gWKQx8214PvIUcHQ1CwknyssJhMwQOk2sljDQ4Lw/BgREcO
         WK3TTiVVr+963LQPS2eqkXktctDfeXBU8tKHgpyU3JfAOlUqktPmoKhw/9cZE/MfelGi
         FEuCUwax8LER+xDMXaZN9TEwY6+piyCY2OISqLbco4EqPVM535423CnVzQ8NAw5lUsfM
         BZoZpOs2KLr90h+Hi7/zRuQo53R2ReZ6Z6VEMPKXU9dr2SKMmxUDSddu99Ep5khuhFCc
         dojKgVJEoGchlmd/pYjHUDSB5/twV4Khu/TQ+irATZ1bE10gUBMYisHnxwBKD4nK3ufn
         99gw==
X-Forwarded-Encrypted: i=1; AKwUvBw6PojQEGa7CRihdOmyCyDGQJxHy1KKRhedU9TsB6Tfz1kRCvxqvL+aLyBdD8BgyXFL3L3eN2T5JBPW53A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWriU6C4g3tJTVRrkSjrdwzGY8bBJ/GZeyw3yI1MGLc/abiiNp
	1iU92oIDqFQEWptvBSPH45cv67L4Ei/G9Nsi8O3QlgD2nUzGlDeD2gZ0
X-Gm-Gg: AYBFou2+NICiun2cIqG+TQDoSXJvCfbyCVQ1GGxc4Rp+KCy8T7tjsnFDB9zBQXna0rV
	PyGov3Kl1NjTyOykU+JetsLD11bSYTASggLCUG4KcwsC/3u0oY/iQpr84Jk8uwyBjzlhwtSd37k
	yl2ELYbSg+XujC+hlvplY+8x2YxP5G/uO1gUPPUYSGvtI2CZuB8IQy2ZdwtrvUjLnI7YCPN2KOQ
	En7V8XQ8O3YBYjXGOaupWl3FRz273Ujpoqv+4rNwzM1TGo9U/54OsC+0h/b8tqNBPAhaK2PSvKe
	aG/Q84k55W46ZSWRAzb0VALvPkTdEmuw1Z2P5DhmnmumXCyW4vAh1QB9hruJaQV9FxtlejrfhX4
	4XcYBJ8RLCpO6Ml4VAYq0f8FxALvD9SHOQzMYR7c497RAe/W2bpAUU1XP0USybvu9yAKNYY68r7
	M0TWPd40SNX1Turg/uK+4MogBBqIA2JMlDhC5+3InDhyC2lmUXfIJ7WdSkTQWTyZSKgJAkzg8s3
	VODvmZXfe8qeFgr+Gin5LS204B79mcZmKaK4DeF3fo5etVsR4tNzsTIAw1s7VNzDlb5aaak
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr60022755e9.21.1792650567635;
        Wed, 21 Oct 2026 23:29:27 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:2fac:694b:933a:abb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm96216345e9.0.2026.10.21.23.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:29:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] nvmet: prevent double-free after metadata SGL allocation failure
Date: Thu, 22 Oct 2026 09:29:23 +0300
Message-ID: <20261022062923.3761399-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If metadata SGL allocation fails, nvmet_req_alloc_sgls() frees
req->sg without clearing it. The RDMA error completion path later
frees the same scatterlist again.

Use nvmet_req_free_sgls() instead so that the scatterlist pointers
and counts are cleared before response cleanup.

Fixes: c6e3f13398123 ("nvmet: add metadata support for block devices")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/nvme/target/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 07a74c2e1f58..8032924e657f 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1359,7 +1359,7 @@ int nvmet_req_alloc_sgls(struct nvmet_req *req)
 
 	return 0;
 out_free:
-	sgl_free(req->sg);
+	nvmet_req_free_sgls(req);
 out:
 	return -ENOMEM;
 }

base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.43.0


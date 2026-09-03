Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0A419302
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430697; cv=none; b=B6pn9cswrJeieFVyHqtm8WEmfOT/rStexob0n6ORdRYFZWlqenMscLUCqrRmlGsh+rMWqE5bESjBy8eN+QU545itKXop87wGj1owD16wofUckMC2w3cbCIMrhV/R9BlYStc5mYN0uJO7aDTit/ohfhUl6/MpoYXHS04KnwV9Bk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430697; c=relaxed/simple;
	bh=nkJijpibfrqgdl3VNlBSmGDYeRp7RjJg/vx3pVX/fCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4lmNrfc7xfycpquZiCo0EzVImV88TC0W239d1cgrdcIyLyMkDrky9t0/8aBQnfjWlUoOcK2A4F0xcwwkezahrqQDTbn+VKyeao2GRi6wQNaP3WI8JyEh7QqXQO1lwPC385h9C9MuqaeXvayHERCH0gQJZitaW99PluEaW/+fiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWJkcBAs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWJkcBAs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so1807001b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788430687; x=1789035487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7T99HEkan7KgLe3r/HM6KiSk1eXB+cQcUYwvOC4cMw=;
        b=HWJkcBAsu95hlx2pBvbtSGuHrlLwVhkwVTvnpFTRZxufDMpanXCylGnqjUV72Ee4Kx
         IHupsghYfZk45lzWRZD1Byx6LgtUt+0WqAhutEVksnDn5Z9Tp7mYOFRznLWnL+XdNRR2
         pYK8XYrKdtb+hG+RWWZ6LZxYLyyIVdCNxmrDF7uX6ZGYJi2NrvJ+zoY5SUi9Dy8AVOru
         wlRBwGU2gO1f3lZ7ErbWvUJXEe6es2P/BLdmJz5toMVBdTI9A3pjDeJsmhTqCzoKZ50s
         IlZ7XBXI0tEAOyeEFYeIM35BH8vth/209X0x0DQfCHVmtxMw2MB8sJtMlAqKCiVC1+KR
         dZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430687; x=1789035487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7T99HEkan7KgLe3r/HM6KiSk1eXB+cQcUYwvOC4cMw=;
        b=ev2YkTfIgCGMcJOGId8u82tYxxLqpwwxhkhlFCjRurQh6XSRkirojsYPmMllbBy797
         F0eRdMbTW1HCxksHC73B27dH8Q7kCR7F8JPomeWB3hWZGuDOEG+n4+0K9Z7PM8f4ugIl
         iIbWs4Yd3OtNVEgh49htXcePfB+99Y+zebi0Hbye7schPG2N+Yw6O4ZSqbodIwuge9Db
         IYrpux1CewKy30NpUa3a5qrFriCa8sv4jbzi9ul8WTb/IwXhex/75cqggho79vh2J8dt
         woq5IZaUEtGPrZeT3LfJhitvLq5yJ9mSVC/9WxgQ4coTkxOfl4RZmE5Pfrw39hGJJGF9
         /wdA==
X-Forwarded-Encrypted: i=1; AKwUvBymvJmmmWQOck4WsaC6SI73LhHxDJUFiStn6mCwVXju2a8We0yG9cs2DF3g6hTE0JsugOBI9NiTPAuiB2o=@vger.kernel.org
X-Gm-Message-State: AFuF++lBXO2vy9gSSIu8Nnz3xL0g9A67IoTxA/gsCKj5yr/3wjdfuXZg
	pKiS7N9ve1LoEsKQJdRrO1A1+S4EjrGoqkVRM9hIMT14BrV+gDomaMgryiPhxYXH
X-Gm-Gg: AYBFou0zN2jrP40fR2lvCzDejnkhVj6QWCm790hfwre+yWbrUDy1IyNfPlQasvERv45
	7CL5qTW8E3oHgwIGRHxmhyx/xz3GbYzU6hLL1DM3xiwttiWTkvWAddXCfgghbqFYc+5tFkPZ9V4
	Or+HvYBSQGf0NqalejdZfXRHy101lPwg8TgcdNdjN2UEnWvXMaG4Pyr8ZKX0AqMjQQkk3N3U4Z4
	PE+pTkHzGpmhUW0FtR2L7f9Ux6ZNfz8Hnbjca7GXK+oFTUH1FnH2bTrL3xE/hQibLVzdkHeAG0K
	gp2utAvGH39hKTLRV4N3fUQzYLTs5/XJlJNaTVwHn8U6EECwzsyHyJcoDNMkLBLqLfmbUrQERnj
	3Z+ogMW/OWVKD8gQvmEP8EnjVqGTk2t0A92mlIsatQgtG5FU5kuAZbL1fef/vIlzjV4S2WLdQxL
	9VusidtyGyAeN6jsQVB4aEs2G6V4uUhFbQW5WYnx1PKdnmaX5CFWradHCpcOezh1vblv3riKhKk
	kMO2Q==
X-Received: by 2002:a05:6a21:3393:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3d9ad570762mr15626344637.2.1788430686494;
        Thu, 03 Sep 2026 03:18:06 -0700 (PDT)
Received: from Default ([2409:40f4:101d:3568:cc14:1945:50bb:8f16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534cd65sm6078036eec.6.2026.09.03.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:18:05 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jgg@ziepe.ca
Cc: leon@kernel.org,
	kees@kernel.org,
	Tatyana.E.Nikolova@intel.com,
	roland@purestorage.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	larrystevenwise@gmail.com,
	pj.waskiewicz@solidfire.com,
	jeffinphilip14@gmail.com,
	syzbot+bd317784d628820741b5@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] RDMA/core: fix refcount bug in iwpm_get_nlmsg_request()
Date: Thu,  3 Sep 2026 15:47:42 +0530
Message-ID: <20260903101742.214304-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902085213.145312-1-jeffinphilip14@gmail.com>
References: <20260902085213.145312-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iwpm_get_nlmsg_request() initializes refcount _after_ list_add_tail()
making it accessible to global list where another CPU can kref_get()
on nlmsg_request causing a refcount "addition on 0" bug. Fix this
by initializing kref _before_ list_add_tail() so refcount for
nlmsg_request can be incremented/decremented normally. In addition,
also initialize every field before list_add_tail().

Reported-by: syzbot+bd317784d628820741b5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bd317784d628820741b5
Fixes: 30dc5e63d6a5 ("RDMA/core: Add support for iWARP Port Mapper user space service")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changelog:
   Changes in v2:
      Add list_add_tail() last after initializing every field as per Leon Romanovsky's
   suggestion.
---
 drivers/infiniband/core/iwpm_util.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/core/iwpm_util.c b/drivers/infiniband/core/iwpm_util.c
index 5d07c5756987..51af8c1c49f9 100644
--- a/drivers/infiniband/core/iwpm_util.c
+++ b/drivers/infiniband/core/iwpm_util.c
@@ -313,19 +313,20 @@ struct iwpm_nlmsg_request *iwpm_get_nlmsg_request(__u32 nlmsg_seq,
 	nlmsg_request = kzalloc_obj(struct iwpm_nlmsg_request, gfp);
 	if (!nlmsg_request)
 		return NULL;
+
 	kref_init(&nlmsg_request->kref);
 	kref_get(&nlmsg_request->kref);
-
-	spin_lock_irqsave(&iwpm_nlmsg_req_lock, flags);
-	list_add_tail(&nlmsg_request->inprocess_list, &iwpm_nlmsg_req_list);
-	spin_unlock_irqrestore(&iwpm_nlmsg_req_lock, flags);
-
 	nlmsg_request->nlmsg_seq = nlmsg_seq;
 	nlmsg_request->nl_client = nl_client;
 	nlmsg_request->request_done = 0;
 	nlmsg_request->err_code = 0;
 	sema_init(&nlmsg_request->sem, 1);
 	down(&nlmsg_request->sem);
+
+	spin_lock_irqsave(&iwpm_nlmsg_req_lock, flags);
+	list_add_tail(&nlmsg_request->inprocess_list, &iwpm_nlmsg_req_list);
+	spin_unlock_irqrestore(&iwpm_nlmsg_req_lock, flags);
+
 	return nlmsg_request;
 }
 
-- 
2.55.0


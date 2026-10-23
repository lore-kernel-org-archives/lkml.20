Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783516;
	b=lDGU1Ce8TRDGkJgo3630Ay8A3GNZ92tO7c0YJm70kphZyKCMFBzDqb7z8TszuccZp4Q5
	 zqO+jzJf5qsLeYhm3nYpk59RJL5fW2FIvxFp0mbAcwltSSiKox0ni/BdSH7y8iy3eLfyz
	 yatd0kOXuRd5tFsDa/VjcWvueqB0YldsnymXRGNppmntcgdHDvBvdYhhu1X8A9QaYvnE5
	 mZgcuJE77Sum21b77m0Lr64NeqKw4RMVTc3RIFHic0WXFbBZiKDQL541fMZPIg8/a9MeI
	 2PlVPgwYxPKnlZV5Oz/jXvzgGi/BxsA+NjQ1f5Ie1LLJKFGFDd/pecIe0Fqi4MMtaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oGW63mO5SvhKxHF/FfNpWKu1NPhp9bwy3WqXJsLfK7o=;
	b=QpRdhSNQ/Yd/huxlklLy8ho8TdYKfvxDw67LhBlDSODRFXf9Bh3ccNlKo/dgTQ169KpR
	 Ll/hO5TXBQeeh+Sv7Hefh0ZWMctlyNMQ66KcEYdMknuGaPYeq7jK0WeT9SL7MyG8y+908
	 DxCZmaY8Q/Vdns+1Rx2NSgrh1frfAe6j85NojJ+zMF2TBlb8nsFKgygmUychdpObAXtqf
	 RL2daJGbzHQe39tblubtaTJ6mfYRqF28TjsA6sbQFdMI4RQ+PS2LIcnfIw8Q6vIhKeO9t
	 njZPA8he9rg092J+gEtJmaHLrFv+TwLaoM90C2oLemFhKF7HPHH/94SWRHTXMWCEzmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bCPSuJt8;
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bCPSuJt8
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b0a195dbcso128787f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783514; x=1793388314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGW63mO5SvhKxHF/FfNpWKu1NPhp9bwy3WqXJsLfK7o=;
        b=bCPSuJt8o7R3/iFQ8u1K/2H091zqiwd6etYriejb2OE3nLVFjN7PWBCbErrdJh5DpM
         IFXrUgAJKVOp3eKoI61FP3JV0HHGAJuzlqphz9IOxKVQ/DuREA7m09SWrG4sbkRqluzY
         M6QQw40fPN/UbFsN9ML1iQtqJFWo8HczLgWACvcdJLMD9F9BEjwxfkMMG6SR139fkCiT
         oFp6jIjph8Ipue0WkkTu8pmlcqEUv+urVWnWq0ByBYauJu0XMz8mh6mydZTbcZHIXH5e
         6586wBPdPkWNXUcUVkDeenf6nkyjMLs5mLqK0UbkKqovfvjcN7VF10Gbgetivimk5qZ+
         8dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783514; x=1793388314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGW63mO5SvhKxHF/FfNpWKu1NPhp9bwy3WqXJsLfK7o=;
        b=pM9mrvQdjH9eDQezSgpKTc+NMXRF2Eu5OwPXnYYS3wSJ9CPTODCOMzbA8AnSAUPKi8
         GDsaJBMhL3jec6pjA6IO5fHVUQXLBI4YzjTLL2HI+sF5XN3vNFbN0jkCqo9MahTxJbE7
         dEV0Kish2wqBgRP50hitGzDI25GZCK9h9W/tL3PTH6xSnaj/+AihTL9IIe+zT+pRY0Bc
         jcC4NpcROh1mA8RKH1gtVprmq0FMbo8NO4uspuI1arz/5fT6mG4SHd3Cq+t9mZ9jhmwL
         kOm5iF/CT0si+nJX2lYs6aTR9jSahzQvtgqY/Z1ciZyoV+8UZWnvQm9pdiJitAovPUwP
         e3Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwr1mola0M0CHEpPABHAsug7BEmy7h9tgiaJjS3kF2gUyjIE4a2HsDwPEm8e4ElQ/hiBJwN/4rX3kAkI00=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo2UOTVITas0MvUBR8X2tH76gILPn8oyT6DEGCk5/xccXt+Opv
	0wzRrjblClZo5e4dKCnvMuEv4EL0FV9Xv9emoofYcuIvLmAMewAxKAr9
X-Gm-Gg: AYBFou0wDhBQZUSLRCUonftqDZ9BMEjctYX4avyS/sEKMST0M5y4oEe9Aun/f1DVI+m
	EL2LiPbLRMqRJqHAlyacLbPyC4QV+N9Vq52HsNE1l8Z4uX+5VxkmDCYk5MNzvLOLIqumLkNw7q4
	9QV39IREU3Hv8kr/xPCdUyGeQWxSlN9MBCBPq+i1TJ1qd1yG6DoAfNm5eiDwxWv0rP06dwrJoKU
	hnk5IdSjG696zu3z1KQAegszvCT+HRU7unsVcu9ccMbgWufIpm28DH9DUq53Bb9fxlIhZqaWL77
	RmVzcgFH8dvyrAnquLR9jqjzJP3Yc/EQ63ktit0MNvG6vOLdq6T429JVuH51e2U7m4zn+8AmbNm
	mzQbb/FFI6nNicBBMJ3HLHWazeLLYZY6fH2Qf3anYtLnnqHTBZw0mGzccpSsMhycKt745O8ym59
	19+qqLfOKIWTce3Ox3NYtJIQKEExkrpzP2CcusptKtRv9KULfBOwUgQ1MK78wlIY0uI68cZuz4y
	bRAq677QrbAK8AZeMkjxQ0/ERxJjl/C3+gN+KeCMid+TQtGPayj1DOXAeX9aR0TWIFcuMs=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr52662775e9.17.1792783513937;
        Fri, 23 Oct 2026 12:25:13 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.207.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm3720225e9.3.2026.10.23.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:25:13 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: jgg@ziepe.ca,
	leon@kernel.org
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/mthca: Fix off-by-one in mthca_map_user_db()
Date: Fri, 23 Oct 2026 22:23:48 +0300
Message-ID: <20261023192348.11070-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
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

db_tab->page[] has uarc_size / MTHCA_ICM_PAGE_SIZE elements, so valid
doorbell indices are in the range [0, uarc_size / 8 - 1]. Allowing
index == uarc_size / 8 results in an out-of-bounds access at
db_tab->page[npages]. Use '>=' instead of '>' in the bounds check.

Fixes: 56483ec1b702 ("[PATCH] IB uverbs: add mthca user doorbell record support")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/hw/mthca/mthca_memfree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniband/hw/mthca/mthca_memfree.c
index 9c5eb03f354d..39d82dc73807 100644
--- a/drivers/infiniband/hw/mthca/mthca_memfree.c
+++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
@@ -453,7 +453,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
 	if (!mthca_is_memfree(dev))
 		return 0;
 
-	if (index < 0 || index > dev->uar_table.uarc_size / 8)
+	if (index < 0 || index >= dev->uar_table.uarc_size / 8)
 		return -EINVAL;
 
 	mutex_lock(&db_tab->mutex);
-- 
2.53.0


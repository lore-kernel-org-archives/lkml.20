Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739433;
	b=qvDL8CXWdupL8Ig7lBq0+kDkk/G4RZ69/QuAorc8/+zrZlebV8MNcYtToSXpHhSy/OLO
	 RbANsPv7q2+kui6qZGXR3Qbe9bVKvGdq0DrD0Crny8v3Dsxt4sysUb1No0VqyvRaoN+Yx
	 TqZuH7J/jO4jeKHpDL/eILDXSkowtKZcvgYMGhuBIHfPadGvOuYaBd50RX+TsYa009C6J
	 6p+Cof9UEp0U33XpfgqbrDNp0Z5Ev7HNZ+5tAyOR14enjZdZ88slv+II75Zp5biblXvGZ
	 ip+Rpiz62LNK172ILBj7Xn+UgLhs+tMeaauB6Zs1D+c0fiXJPSYWIyCajUtuiixw9Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gR98zScnjm/gYsm/UQkLfN437d1nEwodIPcR62cdEAY=;
	b=t5NOUBmMRCAsFKdLlmvUX13CWzVC7Mfa4+L/6K/PruSDRJPlN978f2Mr0U3yF2LLVjY+
	 YqFqoNTSfR4+k4mJCTCi/wGDoDItBZ79n7aNYgGu1z/u5tMNUKqWy90fIN8HJzIAJIa2G
	 EtI22gg9Q3ckxkDAAbu+m/INS7ddfsoRhZmcxe6Z2UsY6q2ZdJQ0lr7j8EzNjrd19r+ZP
	 WPJ6D2fL1kQynpzNN9jzgAhIvm41oIfF7uiDitXpP6g99AIvSWSWUAISV4bOSg0jV8dsF
	 pk1gHBsXH0nZfWd0nBMscA26MVvTVJQhY4/9IMez2uZ5RBP7nQ9mOfnVcSXDLL7mTGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdFqRhdu;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAD606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EAD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdFqRhdu
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso1343913eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739432; x=1795344232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gR98zScnjm/gYsm/UQkLfN437d1nEwodIPcR62cdEAY=;
        b=NdFqRhduX6BNlveJdrkI0f+skJdQO3Mz4A/PGgmAI8KhFYI3nwjNGAbKhAjnkVlI10
         qQLpjIbrRLeM3/QUr2XaLU2q+w4mQFAuv5XghsgdnbxDm2DslEv3bWpH0A1UlO/kYsV5
         C67A6BXAPVkLd842HlisOcslrvlHgtwQcIadrW4RTgGrj6/096PT+Duwd8Z86ecU5IbP
         2Mdly9ye2KtyRiKV7UMw7vcbhymtI89GaK+KCWyMwHG0DbVlJ6uGW6NMBtzh7UFiPM99
         L1VlFEi9PiyAY/qXgcN7NTpRDvraJE6GFkETmov2MutAA5dy+AgQZ9vAOyAqzcHjfqtq
         7PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739432; x=1795344232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gR98zScnjm/gYsm/UQkLfN437d1nEwodIPcR62cdEAY=;
        b=Uue/0peikevXQX4eQCJCmLmCXnVS27XLQ7QjjY0uTQV8d8hJj9hS4cQG3bNJ6rHkfz
         i6LaYHsgW5X+aprkLOBv4mtYOKO+qE2XKoDN1fRV06Wkc0bzqaAFD6JQcOoL0Jr8BZCx
         awBk6a3jQEpakMHanRS3EnMBuBuDw3R1vNfqovpAkxLRX+wutDIaxkFnQOULbJ/KSavO
         dwwmqDSV23DqXMVVObmlKsk/TqOn9w96a/xzrtXyQekA/Akuo8dV4ZG3G+w8JItQWE/U
         Ec3qztjBG/+x1YF3MPDkNLhfsY82KFudH5tR6sDJvxuGJ9+qiPNSBKgJHf0C8rUn/G3e
         /Otw==
X-Forwarded-Encrypted: i=1; AL+hErEtxfmwF6ftfhxcY95vOghHJts3FjCVwgD45dRFHxlM1uaWJUg4luxXDnL7emfT7QK8aY5Lz8eTK7u2FGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WAZNcIImIuMYbGAFZfUwzMopZTcYKy7v+X5n46G9V+sxeojmV
	40tBjBg4eVJPREvtN8kFW6/B2iErnXFz6qSkRZZJn3VyvEtrOe0V2kiA
X-Gm-Gg: AYBFou1vqYvZ1bCAObr3T2xe55931KaY6kfJ6vS62dOfs9zSQ1j29cP1lNetQXi3zZL
	Wg/X9m5c70/5dcW9Y9ssfsmk5fURDxucbuh/wbnefNRmbhTT6xLNvyaU3/jXMB5gsZ2Q4hluv/H
	RVz2wgH+GN7cGw1zSXhXB9+ixE1yjUmPVwdf6XPCIf2yp0kThct8S2iT6rYHOWX4dWqqWMQzRMl
	kdmasV77Ybo0bl89cmbpjLgBSMuKLwXM7o4EugoYLSORBYP7CK+mPLJFDbHWlIh7QBPrhto5W/e
	kIVWogvTh6qaH7m1uo7uXToAiRH2K81zG3ylcfG2DbWBUKj6VK+EaSBbJUd7oa2CBt2XeRnC54R
	E70UQ7dbf7Jbn7UAJOWNUN+Ma59/9H+hB+Q4yqebred9nTAvH9EKXgGqZrTmbSCsF6wrZ5/wTC5
	+zAnBnzgAOL1+wQd7KGGY4rXLHw8LPQ1AdCn3mk0IpD0RFO+pZ+u9J4h9D6cvusomWOowocslqR
	zokj2441+Q6BTWdtWkDvUj9Hb5w+CTn4wFPKoa4ZATy5TsjInjBx9v0DsM3aYbkJM2qcEzRfd82
	TJfp+rIcuYT9bnMQCwKRg7GxeSGTyHvX1y+FCNQFcSBa6DVgG6QtunlEY+FXZPHogwVoRgnwOO3
	PB1Ex4BrqcPR4JctpHSvurV3SPCo4dTPBlHeAjA==
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr10510136c88.11.1794739431638;
        Sun, 15 Nov 2026 02:43:51 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm32935341c88.3.2026.11.15.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:43:51 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: leon@kernel.org
Cc: jgg@ziepe.ca,
	maorg@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] RDMA/mlx5: Check the DM type before mapping a MEMIC operation
Date: Sun, 15 Nov 2026 10:43:42 +0000
Message-ID: <20261115104342.56112-1-dennylin0707@gmail.com>
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

MLX5_IB_METHOD_DM_MAP_OP_ADDR accepts a handle to any DM object and
converts it with to_memic() without checking the DM type. The handle can
refer to a SW ICM object, which is a struct mlx5_ib_dm_icm and is
smaller than struct mlx5_ib_dm_memic.

The handler then uses the ops_xa_lock, ops and ref members, which are
all located past the end of the mlx5_ib_dm_icm allocation, so it locks
and modifies memory that belongs to other slab objects.

Return -EOPNOTSUPP for DM objects that are not MEMIC, as
MLX5_IB_METHOD_DM_QUERY already does.

Fixes: cea85fa5dbc2 ("RDMA/mlx5: Add support in MEMIC operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/infiniband/hw/mlx5/dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/hw/mlx5/dm.c b/drivers/infiniband/hw/mlx5/dm.c
index 7a6fe4fea3e2..16e42fd6c802 100644
--- a/drivers/infiniband/hw/mlx5/dm.c
+++ b/drivers/infiniband/hw/mlx5/dm.c
@@ -213,6 +213,9 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_DM_MAP_OP_ADDR)(
 	int err;
 	u8 op;
 
+	if (dm->base.type != MLX5_IB_UAPI_DM_TYPE_MEMIC)
+		return -EOPNOTSUPP;
+
 	err = uverbs_copy_from(&op, attrs, MLX5_IB_ATTR_DM_MAP_OP_ADDR_REQ_OP);
 	if (err)
 		return err;
-- 
2.43.0

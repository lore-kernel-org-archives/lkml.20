Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025F3ADB92
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335015; cv=none; b=nk2Tb9sCkmLkzYzkBAU2ws5zHP69h+F+KtYViGvJ4Lo1b7OLF7faQrScl4jxUz6jEwhQXj/DBFQzvaY4UHoZrHdGsF8+Wd+WYELFueAz6vYTShnwqFoMrNfw/xG0hU2TKUwaE9TZlwCdUteXWT+iLEgSc1Z0t31rJMAr9o6Fey4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335015; c=relaxed/simple;
	bh=6yHE6qnIZGNtF1BcbMyPdKNzgBe3P3tTSjHV99FAJpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PO6Il8LAisxzQL+iM5YBgxC3Sb+b+4Hc945ydqtuY00LjdD+s6H3G6vcEbL/4Cei/+IrTn4sae4Z1l7T7wpjNeOceKBRR3QbVn1/ecJmAXz1vlyvCZi5sHP5gR9Kmf6ytM5uNlK5xuCMMAfYc5STGTXQbwf3gF8lh/Ptgao16F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRohAXav; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRohAXav"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48ded18b8d9so620075f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335012; x=1792939812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eYVYY73yC/D0v/KcDNwhtZQIc+QCqPcBhpHmMy9LfI=;
        b=TRohAXavpTd4RILfZfOOAng2sbXqGXk+fLQ9JDD41VnBbXRYS0RsQgwHkXOJn+4328
         gDsRJNDv7aZbxocx2F7H5XWip6X5Nmv4X08QaOhJKCplg1a+1vjHZzxqJzWbP4wuixzT
         sxoI1h4Y4rRc0WOKsHJ0xku40igxFTrI4/8obSQgKtnW6rMV3bp2KQTWhwYJNedy9qE7
         PTXVg47ppghRU7bxdapvxjPz0LjVmv0jC9lbOKuhNZcT7K1Ck8B6lLD7cTnbAuTgIZ0p
         5BNgtBahc4LTBcjI/JHOK4GXILDSkQLzKAQxZ59P5bI3qBvNkp4SHEL/UVWbiNERRanI
         fL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335012; x=1792939812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eYVYY73yC/D0v/KcDNwhtZQIc+QCqPcBhpHmMy9LfI=;
        b=KlWOIcdOZM3m+iUOs7K2A8b+RrTpFOAs6609Pb8AM0NQ0EQ3pn7r622PFa3MTRSF12
         SDuYS+d2hOogSnZO7C8AAmXoFfMqBh6VBEdtGlN7E+My7xUN+YaTzsuIDuMM7y58TnkZ
         pyE/eD8wNs8KUj6X8tgN+nkFz/1+RKb7BDpyN3wmatENB+yw0g4UsAhPG/jfXpHyrqhK
         kPSfBnpIk1pMMafBtm9dJJyryW9Iho0WSRDREaAnZO+DJ0kta30VFYuofUBZT/Zb4fJn
         2BbT4gfsmSQOauaSDxwwpPcfieHRyCtXGBuQoy3JJBRbzGLXhEyEcn5iiTTUBt5I6TfJ
         v66Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjGsIkerIZeIY5/J7RobMdmwODH7VKy6M+bEmyns6GzVeH+AuSnlk+7LpuRNN8bJV61ywgZktjOi6yhhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNl5IMBxsUbRw4Fk9M54RLSghT99XfLd9Mm3t+6peIxoPOTeFK
	689l9uLJmrW41ds8RdynkCnOO1qqwQmFJAfN3A1FKjb9mk9qtg7hwY2W
X-Gm-Gg: AYBFou0RtTVWZ3OcxoaQ1una15l41JipwZUUhVs9hbrgMTp+VSUEwozeY/b6lnCy8pM
	Vp9p0DbSOafvqfdjhw2tdyyDOi/4pd47O5BbCFdy0mQCRYoocPXjfowirhQbGN2dycrWPAyUe6G
	RcusUl+sqLNF85B0NfhrZAQ0VYrW0rEWVJ65KQX9seFI1YHaLYolfCpfNxG1h33oIiYyEywPWOk
	yHEJiqXgVQrXJ3Or5IMiOoNYrVjo0JxTQRFN/S+raIa70t96pvd353qLJJtS1FNUYe42vH39NFa
	jHENH4XGBfkToUfC6sx/vVx2if6aEU+Xoi4PBa+rb3S/GNIbXqFgAki9Q+6iHYmJHF7x9M/zkjP
	NCfjMgznHuZVc7tbJM4qZEtFVm6FA9JA1sFLZp3zxb5HvbEcTCduUDeszUxa/1s2fkRcZ03fb3m
	twEebchG55uYCnvjCBbLjxxfG5jjRljimHdJZKKJCb1gMTAmBAAgyiJrPGETXR41jLLKdXP+P7X
	nJL0pUvzt4zog==
X-Received: by 2002:a05:6000:200e:b0:48e:e9e:129 with SMTP id ffacd0b85a97d-48e0e9e0142mr4734499f8f.29.1792335011724;
        Sun, 18 Oct 2026 07:50:11 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm19281899f8f.8.2026.10.18.07.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:50:09 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mark Bloch <mbloch@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/mlx5: Validate priority in STEERING_ANCHOR_CREATE handler
Date: Sun, 18 Oct 2026 17:49:07 +0300
Message-ID: <20261018144907.20123-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MLX5_IB_METHOD_STEERING_ANCHOR_CREATE, the user-supplied u16 priority
is passed directly to _get_flow_table() without an upper bound check.
This can lead to out-of-bounds array accesses on dev->flow_db priority
tables.

Check that priority does not exceed MLX5_IB_FLOW_LAST_PRIO before calling
_get_flow_table(), matching the existing validation in raw_fs_rule_add()
and mlx5_ib_create_flow().

Fixes: 0c6ab0ca9a66 ("RDMA/mlx5: Expose steering anchor to userspace")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/infiniband/hw/mlx5/fs.c:2013 _get_flow_table() error: buffer overflow 'dev->flow_db->fdb' 16 <= u16max user_rl='0-u16max'

 drivers/infiniband/hw/mlx5/fs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/hw/mlx5/fs.c b/drivers/infiniband/hw/mlx5/fs.c
index e63fdb4bc3e3..bc2c15c7172b 100644
--- a/drivers/infiniband/hw/mlx5/fs.c
+++ b/drivers/infiniband/hw/mlx5/fs.c
@@ -3014,6 +3014,9 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_STEERING_ANCHOR_CREATE)(
 	if (err)
 		return err;
 
+	if (priority > MLX5_IB_FLOW_LAST_PRIO)
+		return -EINVAL;
+
 	obj = kzalloc_obj(*obj);
 	if (!obj)
 		return -ENOMEM;
-- 
2.53.0


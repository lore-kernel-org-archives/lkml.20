Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552045;
	b=qPpY9Gu5qPl8LZs8eOsqNPYFbDejvdvlHt7uLeE4rxhSMqegYh3dzaFW5e45UOdCxCtb
	 oR8OmrGXWU2Rnq9FGfh0ZkWkOxU/vnRZ0pwe9JGY4UvkWnIrQ2RiaWySEP2QCiN2pOEKp
	 F6nAzGxd0gHGfGhOdQ39l079J0cyKd8WFaeQSOH6QlNy8WI6QSrJZw6GF2Lj0JV1jdPgI
	 IK5p+dm6jFlhNVZIpZK3zn+Co1JHnPEf1EQYgDbED4fS2hZBkf/za6DmxDN4THjGFZoWC
	 ITc8K0wcWLzeMZDwLS5kOxyHjVSm6F4aVHurdkkrdxdj9vJNjY+l0vIOIpeuWkuiQ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552045;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rWcH7O1dVVpCue3OT6GAmSMPhUAxqwVm/mnSp190qbM=;
	b=iZRxisvjzshxxtPvxCtBJjr9Ss/36+AatD4NdRKz7d6Y/g8MJrvHikcvPWU8x/qenf12
	 3f1crRABnmtGvDroAEBB33w1HhpvlCJB30FsmpOOi6kkeSI4tvAEtfHrreftpJ7c9Nznp
	 dKVcFrsDKrm/FqksZQFgbi3Tei+OpvMXRMwj0uqAkVgd+qFumOKuslVJtlM2YPKvC1DlH
	 uvAj0idlHZyBRx3cwKcmScbi38g8tU0euDLsani/FQ979uLtOZ+P9kNsH+TddA5IIv1iM
	 K+yCbFVDSOurQd9cr1sHkBH/7lETNsHVAdMTjd8efQAcPVv6D4lQhhK2HlACbe3oKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=SNQx+er9;
	arc=none smtp.remote-ip=162.62.58.216
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62804606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62804606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=SNQx+er9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792552019; bh=rWcH7O1dVVpCue3OT6GAmSMPhUAxqwVm/mnSp190qbM=;
	h=From:To:Cc:Subject:Date;
	b=SNQx+er99IIDDcEur2HnBm8cqmH3L3didtpjNAoWXVsz+XWlaNLZOJRAg+TxA63cr
	 wQYF8w4RbcYk4eWaD/7gzAXO10lqS4ORfBwZj2CAEmz0NifM3q1sdwZSUlrp0aqtrx
	 TYaK7iATmIU5lqfNnv7B1Mm1DfGC8eJrhv6eBWR0=
Received: from Liujunyuan.. ([58.19.27.181])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 1982A857; Wed, 21 Oct 2026 11:06:24 +0800
X-QQ-mid: xmsmtpt1792551984tbwbf64nv
Message-ID: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>
X-QQ-XMAILINFO: MIB/1UGyXKa7bSKZDGWaPw28EBP1PVpkBDI8rxOixBAyfMaWvlwCOd5+7TC+Pk
	 UdhoaUNWyzc4s5y4BmugnUvlV7r1Fk3e3lQ6UxCPc6CwtIIMK2ZsIq9RqtxDiU7ps101DH8UD74t
	 YxIVAr/kbWpruJOiTK43ZUFx/L0F7ki7NJd3neb+UmcuOQo7ZV7l1PdMCCZ5bDvZpiqteh46ULd9
	 9/vr4hlzqgVULAlHlx8+05gxYYxRPE9VOrnoZqEEooWn98SAmtLsDgAdZJOemIEtc7NqYn0xDJgz
	 kLEZ78gxONO3ZuZR/qsZpcE9GkGZUwUDm3eKEWtaVt9NRzmmuJ8tzDRzfnZB9koe/KDe7p0TC+Kv
	 Sr/yMMheZu2mYrapsPj3tzSfwpF7KxTOOzNrNjbUtCgBq9VcWetCKsEv1FS9+RpBYZjvursC6KKA
	 TZgsZMGuaoUw8zlWgxqYyWYMuV2jvOsNgDvlJ/wpWqWG3ZBfHtmVE+mrAdgVZNNRnRSD4HsNeP32
	 YBWz/8PGPvPzuLDRZtO0wBsOmqtDiqgTzuwgPZ5bLjEahlSkBqezdazi+JdZ+Cp7MLlfZOQwaKoS
	 VL+L/iEPK4gJC0R9UPPklzjiQBEFXNUwsRIKWd/exMxk0M/+A0zcbScucgwNnWXx/ULvfvTpTsrc
	 6z2RcHcSdG0HExM6//1V3D9eSW5juDMrDqG0kVhJh/IDMam/2lWZr90HpAnqEDTxxWj24Gkaymg2
	 NikRpj4xX9K3yj7/kfm6vY/7Y2h/a9KzarY2gcwsjqmRPZkLqAoNtz1rxSRZkJn1My5wHGGLRY1G
	 6dRZ+A9kDASomvVB8+cg/hHiwd1T07ubut3FzA/CUydLP1fHS+fZTAeovDge6u0l4zYaoA5a+rPN
	 4G1IKiPKT7ikQkY4437BGCy3in/ekYjpS4KJzgO7E1jkmSOtKo/8iQb+IbxkhNfmJj5tDbx21c//
	 5GHlL0cTVzjelMyZSNgkZGzGtttGVlmDGwqqX6FJhac9eEYUVUqDqBj4pluaHd2nske+Fxe5U=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: LiuJunyuan <2058432396@qq.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	LiuJunyuan <2058432396@qq.com>
Subject: [PATCH] staging: vme_user: fix crcsr_bus assignment on allocation failure
Date: Wed, 21 Oct 2026 11:02:22 +0800
X-OQ-MSGID: <20261021030222.10552-1-2058432396@qq.com>
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

Assign bridge->crcsr_bus only after bridge->crcsr_kernel has been
successfully allocated.

Signed-off-by: LiuJunyuan <2058432396@qq.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 434cf760ade6..5a4e61d20479 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1029,9 +1029,9 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
 
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
-	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 	if (!bridge->crcsr_kernel)
 		return -ENOMEM;
+	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 
 	vstat = fake_slot_get(fake_bridge);
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328421;
	b=oJgLK52df0xZyJ8QC5MNpntD7IDbO/gRoYGS9k8KBQ882XRW3NMItkFoTPTOwwc12GgG
	 4Lk7sJQk3ZqB3jlO3prYKEapFAY+Ch6lBK8AhXbN2gwZtzvdBwWvf6NduoQmnJrCDakEf
	 Bp9K3djF0OoqIJ/wXJlspbqgecUzUQW+kdsiOKBePN26pd9nc+ws9BbHUVXiY5qphwOYI
	 +dbHxeZR0ef/5OcY5ocsyH6+8XKT9ogXGkyj79pKBs5HFiWdt9R/y4OCLko4PAsmRjX97
	 TqeFzRR3WO/852BRiSP0tSYL0uv2noveRX4ZGxYPViSCy8VEXhmBEvk7hPMQMhUrLYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328421;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=NvRhXH7HKV88EBv71IIq9LzujvgT/YulSYrfZRm/5GI=;
	b=rSlxKisy8g3WiBpA5d6LTmWBZwYZYOKrRynWfmgFqtYOPPSC2oBx6iswA+WAXjwd6fp+
	 fvy0MrPDjmehh3cr+veQZ9ZtmV+RZ/w+ZMoto4wUBL2UB7fSNFs/wFP3+nvhZZ+Z5F6fk
	 sztHLwnJDX4m+db9/bR5v1+e5yHNlSQ+x9K0fnAmi4//7H8ZtXOxHDXWPJgdZyyE9EIAk
	 cUfWehCJYBuNagZk3jWakXSiJN9WwL5u14qxwp2Y+ezu/Jg51e+YZbGlbr04e/Hkg99Rz
	 JwUkzBLwoc7Z997F1jctNWxWIrauvpVRWN/glkK8i0D/FaJNcX1BneDzhBS72GOsYYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=VeanQ9xW;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82187606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82187606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=VeanQ9xW
X-UUID: 26ad4ae0d40c11f18dc8c9802ae25ab1-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NvRhXH7HKV88EBv71IIq9LzujvgT/YulSYrfZRm/5GI=;
	b=VeanQ9xWaNCpwsyEq+G8aF7+Z6ySo4WbXAZqjVg2mtF0NbVQFNYPw7AqiIim6h0I/i/54cIjK6ajW9M7pdhaICziJBN6cfDzKztsWj7Zv2tB0fUiVAn7OLzlylxkxtT9iYbL5etK0J10n9eEb9FqrhacYpj0+b3063hwMLZwhYo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:790ccb93-d07d-4cbd-afbe-a3dbedd5c358,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:39802fbb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26ad4ae0d40c11f18dc8c9802ae25ab1-20261030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 75411125; Fri, 30 Oct 2026 10:46:47 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 10:46:46 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 30 Oct 2026 10:46:46 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <srini@kernel.org>
CC: <gregkh@linuxfoundation.org>, <ansuelsmth@gmail.com>,
	<linux-kernel@vger.kernel.org>, <lei.dong@airoha.com>, Zhengping Zhang
	<zhengping.zhang@airoha.com>
Subject: [PATCH] nvmem: airoha-smc-efuses: Fix the SMC function ID for eFuse read
Date: Fri, 30 Oct 2026 10:46:00 +0800
Message-ID: <20261030024601.678699-1-zhengping.zhang@airoha.com>
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
Content-Type: text/plain
X-MTK: N

The Airoha firmware uses SMC function ID 0x82000005 for the eFuse
word-read service. The driver currently uses 0x82000001, which does
not select this service and prevents eFuse read from working
correctly.

Use the correct function ID and rename the constant to
AIROHA_SMC_EFUSE_READ_WORD_FID to make the selected operation explicit.

Fixes: b7846af2e6ca ("nvmem: airoha: Add support for SMC eFUSE")

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/nvmem/airoha-smc-efuses.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/airoha-smc-efuses.c b/drivers/nvmem/airoha-smc-efuses.c
index e56a99f4aa1f9..7988b2520ffd0 100644
--- a/drivers/nvmem/airoha-smc-efuses.c
+++ b/drivers/nvmem/airoha-smc-efuses.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 
-#define AIROHA_SMC_EFUSE_FID		0x82000001
+#define AIROHA_SMC_EFUSE_READ_WORD_FID	0x82000005
 #define AIROHA_SMC_EFUSE_SUB_ID_READ	0x44414552
 
 #define AIROHA_EFUSE_CELLS		64
@@ -35,7 +35,7 @@ static int airoha_efuse_reg_read(void *context, unsigned int offset,
 	struct airoha_efuse_bank_priv *priv = context;
 	struct arm_smccc_res res;
 
-	arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
+	arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_READ_WORD_FID,
 			     AIROHA_SMC_EFUSE_SUB_ID_READ,
 			     priv->bank_index, offset, 0, 0, 0, 0, &res);
 
-- 
2.43.0


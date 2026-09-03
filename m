Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404A348477
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416475; cv=none; b=GkqCIacDIwIEOCt1IRhu6C1jPo9m6HKq042BBVdctny7A5p10VNMDnAp3APuPziBm2GnveBc9mbGwAGKSSSPA0b5rcCZn73iF42Px2vbPFzardWOTqfZQ7ZaNHG0lhrDtoJo83S3cSIHnUsujiZ+r1ltT+QCcP8bOiTsKuVGUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416475; c=relaxed/simple;
	bh=sPNZr/SDHALOIqUyylV3jnL1kuZgieKBXpL0YnXf6dU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enOSxWnErdhqFYVXB6Gq2FjBDMnG7NJYEgbncPrBL6QV38iLdHSnm8mdKPqghsW6Dr7/NNNspf+ezCHy82iEkln/xfEoe1DE6bfRJViT7zRFa+yXDf8DzRSweUWhVIBvit1ZEoPSx8a5pbw9gw0vhZAs7f33XswOiYyBPZls9EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dyDMGbzC; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dyDMGbzC"
X-UUID: a4da8a92a75f11f1b1788b6acf885367-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a6pfM6xEo4INvwse6gyrlBAaMdMxHVhvCkb2KpLjGTA=;
	b=dyDMGbzChpduyyp3hgO9YdMkrIkQrIfRXn+9v8DU5lf8VMm6AQsV3dlE2iAFOn6LqEAiaJ5uYtsMnZpNi1NmxWSYpNuXUe64xdudGcQYOsDzFssscNXDj37a/WB2G0/IGaCmMBE/KVsnKOjippN0OgrKX9P5GfjoLMyrM7Bcsds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:edc1a5b4-1d86-409d-9198-18c6d7251014,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:fe4bc50b-079b-435d-86f5-6a8271106506,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4da8a92a75f11f1b1788b6acf885367-20260903
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 371201752; Thu, 03 Sep 2026 14:21:05 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:04 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 1/2] regulator: core: Export helpers used by regulator couplers
Date: Thu, 3 Sep 2026 14:20:46 +0800
Message-ID: <20260903062056.1024263-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

regulator_check_voltage(), regulator_check_consumers(),
regulator_do_balance_voltage() and regulator_coupler_register() are
already declared in include/linux/regulator/coupler.h for regulator
coupler implementations to use, but none of them is exported. That
limits couplers to being built into the kernel.

Export them so that coupler drivers can be built as loadable modules.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/regulator/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..6b7e613fbaaa 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -462,6 +462,7 @@ int regulator_check_voltage(struct regulator_dev *rdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_check_voltage);
 
 /* return 0 if the state is valid */
 static int regulator_check_states(suspend_state_t state)
@@ -502,6 +503,7 @@ int regulator_check_consumers(struct regulator_dev *rdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_check_consumers);
 
 /* current constraint check */
 static int regulator_check_current_limit(struct regulator_dev *rdev,
@@ -4468,6 +4470,7 @@ int regulator_do_balance_voltage(struct regulator_dev *rdev,
 out:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(regulator_do_balance_voltage);
 
 static int regulator_balance_voltage(struct regulator_dev *rdev,
 				     suspend_state_t state)
@@ -5797,6 +5800,7 @@ int regulator_coupler_register(struct regulator_coupler *coupler)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_coupler_register);
 
 static struct regulator_coupler *
 regulator_find_coupler(struct regulator_dev *rdev)
-- 
2.45.2


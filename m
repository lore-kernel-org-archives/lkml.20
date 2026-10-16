Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4D457E69;
	Fri, 16 Oct 2026 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154445; cv=none; b=UwVmslr8VWuryr/9NO8ycWSEgwAXg7/ou0HQKxwj2Z7tDDn6IbiWDdtQe9vPDrM+KsuOIGpQY6YaUYLFNCif4dhimTaX4BzvpCLqy+W86DJPcHd85nVPw1ZL3EJIro1y45vj8GuyZ2I0LS7XEz8OOLtH3f1dXQW/i0pml98FAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154445; c=relaxed/simple;
	bh=Rvqrdb2ofcwB2EJjccJS1nLv7vgFMUGw4eL38H+gEf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=enAIK5tZu5udplNTM1POvOOeFzG4kScOyYd9Sd5+JNV6jtRR93vCwZVuAWXMctZpmWLaIfWVEbhZjEnC9/wMsp3Fgt0wPhIvqRkW7OQxSBcuKbx43JDbN8irRm6clzOJWtkQL8bZpd5t+vSNMQVzeSQkUmnf3MPMk8invaA4h+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c7c8545ac95e11f19a56ed5b684f684d-20261016
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a8d27ad0-b595-4877-a169-b5651be8f3e0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:8a5d8300199168ef2f05bcec1f57be1a,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c7c8545ac95e11f19a56ed5b684f684d-20261016
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1892087705; Fri, 16 Oct 2026 20:40:34 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: szymon785@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Alpha 17 C7VF
Date: Fri, 16 Oct 2026 20:40:30 +0800
Message-Id: <20261016124030.664895-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMIC does not work on the MSI Alpha 17 C7VF because the ACP6x
machine driver lacks a matching DMI quirk. Add the DMI entry so the
driver binds correctly and the DMIC is functional.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222112
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 64a50fd5ab9c..41f8c0885865 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -535,6 +535,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 C7VF"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alpha 17 C7VF"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1


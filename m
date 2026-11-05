Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860368;
	b=qeU61Tus/hTlOSUqx+9umyHSpFlFGupIsL+clgStZ1YYBmyrqK2xLNC9PNk0O8m6rfSR
	 XJGZTpP6NbFV0WlnfAePiqVvCaye2fyAW8ZGgRJm7Ui5u3oURa5bwueArnNo0d5BItXdD
	 byhSThFmlG8IwfbxxsYdA6GtaC8vGPxhzIyMiSjHpbTk5XhxbWA3H/tsZ4wcXlRE+3cLh
	 GfQPjMxRH8ZBeb8RCg+fxgdoTNsjYKNb7ANaM/xmGjqkUrNfxnyCT/IHtKNkUZoy6AGkE
	 fluo/OlHbUuY9+kX2CMmnRW6tHlbWbdcrK1qL6ooxVekt6V1d38phtu3FRXF06TaDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860368;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vw4k1uG3PqokN+/rrLT2QBAsrUBD5moce8iwaWvFhJs=;
	b=P0IRJQZQoPbl1FRk9WINM4RUvjlp6IUL2xRrTNweJ4lQ2L/M6kRqsy8zokr35B8uVYAL
	 zRBZH1gmMzzmgwf0H5sR/7f9SR5L4Prm4Ptkso2phmQ5sajkMza7FBk4MxJ2klhR49YeW
	 0zwAc+MMl5IdiDQ34iufl/wxBYZFrQJbxYFCcRZz3wT9Dawjq0ucnknibVM5YS9so1p7r
	 AdrWHw6/WAduH2SYGfkte6bq6ajLit4Ndfoyzyj76mQ53zSZitXKIqX+DPGOgz6+H+jRi
	 0MBEzPUFcUEwm5i8BUCLtwsY/ToOmD4ryyBcdtq1Q639I/Ru0Yx4r5F/8ruBZscl9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44910606A31B;
	Thu,  5 Nov 2026 06:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44910606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b12e1bf6d8e211f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:283f13fd-9348-4473-b1ce-7c9ff762ee07,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:1bcc947f3b98471679f819873e55c4fa,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b12e1bf6d8e211f19a56ed5b684f684d-20261105
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1610478598; Thu, 05 Nov 2026 14:32:37 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
Date: Thu,  5 Nov 2026 14:32:30 +0800
Message-Id: <20261105063230.353658-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

The ASUS TUF Gaming A16 FA607NUQ has an internal DMIC array connected
to the AMD ACP 6.x PDM interface, but its BIOS does not configure the
_WOV ACPI method correctly -- it returns 0, causing the driver to
return -ENODEV before the DMI quirk table is consulted.

Add a DMI entry for the ASUS TUF Gaming A16 FA607NUQ. After applying
this fix, the internal DMIC is detected and captured from correctly
on the affected machine.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222214
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 8363dabc7eea..fdeaedcfb178 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP 255R 15.6 inch G10 Notebook PC"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
+		}
+	},
 	{}
 };
 
-- 
2.25.1


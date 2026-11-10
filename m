Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279170;
	b=UJiSc4xw/JWAqHPW06zN1qOayxTINfCD/aUo3JJ59oFZRZe5IulGCdEwtVPQ2Dd8mSJN
	 /dpNF+WL+ltne4WhhlPy2cpmhvBwV27t9ySz+fCcXBQQFyLojNllS+Effnl/iDJgzghSn
	 bYxkzmAHhJKoDZHjjyPOXWyOK3tCnkFHiqMWO3UIIl5V1EiKKDwNOfjkEe4lm/lSSyiHe
	 F3+IBJthslMuOX/zYLQrM9Z9Tyms9fEsK2FchLgQCJoqNrJTrCMG+7zaIIThyslgEN2qQ
	 04Z79F5NtSJuETFccuJiLXSIb2PUc+v4QpoENGPICKdKizL0ga/4fu90xGvC3SDN8Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279170;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/OEyTMCovgqBPEWFhNHogwKOonGrCtBiqR8NpYfRMdo=;
	b=F3RuSYeL58YQrpMbT6DRjFZy5JVVraUbRhcHMhPJISRPvsQbobYwEnARwOIiNhz6nYJq
	 4yFWcyF83jDI4HL4SHfLixJkmUFgQhKQCA/Q/MZSEAv0jx/r+nfYa7SIPTKimAai1RiOx
	 l+f7eLZHnfbYQGD4t8xagLUEOEcApNZP6mtNUcQf/wacs27cCrLLVEhhfC9qrWpwxshLv
	 dxKtix2eOtqcogg4tXnTKCed/3OqNqb+x/XbtUFwUb32f4nWXXOwT6UB158iuTobV7Xrx
	 XNO3fic1nIUK4tO2QU5i0Y1/p21tTVH0Lj3zW8ZSSHuXOMwxe4DJU10YLyxJEg8VsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195D60A2608;
	Tue, 10 Nov 2026 02:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3195D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cb7dd956dcb111f19a56ed5b684f684d-20261110
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cb760835-4813-425a-b558-c00962044b5c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:048ee0ca726674d8bea87591866013a8,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb7dd956dcb111f19a56ed5b684f684d-20261110
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1999451693; Tue, 10 Nov 2026 10:52:40 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN515-46
Date: Tue, 10 Nov 2026 10:52:36 +0800
Message-Id: <20261110025236.206625-1-zhangheng@kylinos.cn>
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

Add a DMI match entry so the ACP6x sound card is selected on the
Acer Nitro AN515-46.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222239
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7ab48e3629be..667a49a1c642 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -661,6 +661,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFA16-41"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-46"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1

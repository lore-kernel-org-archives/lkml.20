Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013710;
	b=fXP2kX8gTr3YxCygx1/Y3NNhm72npkACX5H8vypuRdwl8vNbcbflDPDzxUAgUFAbILSB
	 aiIoU3eIISTsWOXYJ3XozpNr/I1eEkJrwuBFVSCRswCY6gfxMx5TGzPZF4a0pGlk/83x4
	 2BBiywY9KY4T5RnAlbeF8JzaLu8vcmf0x3QY908cXGpOscpFhZUcHpt70gIXXaeBf6szD
	 pK287dfeEmzfl03PI+BUkWsuBWOaNPGavCfnL+c/+xsKob0RmggNDCygslCH8JUYL+Dp4
	 eEPWWWPRgQZsxJA8YoXuF3FUPpvj67BrGOan7EkR4owgPAl03KGHbGs3uXckCuTEUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013710;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mV7/MeB1Aho580PREtL9g5FwnCExmyIgXEya6KMhy1c=;
	b=nS5sjoSKa8b7DrfybyIMEWqS1mffdq4L1uk56Rw3lNk8Ww0dQpyqyFusSp7yVkhhAzHh
	 ma0JmGtG0M3JpNWbQNQ9RBxCtD80c48KlLdMtgY589VUdhqJ7+Y1hJo3BumJuL7WSe51r
	 LSOwDRAG7IfebvgcBBI0o8UCTaJiU0vEz69Jpit7o7qEX1WITEF7hv/O9coi9LldSE2zu
	 aHCATCugHFfrcwBY9eRR7mCGGIG8BJC8Np9etH+Ox7E0hhJ0HEBx6DorEWw6udiOJmZD+
	 soQLID4kzGh10L/oFZlzc/zvGaxb/UOYO0OFgTaBWCtuvryatB9LXnWY1qjJU/5JsWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED5606A31B;
	Mon, 26 Oct 2026 11:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00ED5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6ae72ae4d12f11f19a56ed5b684f684d-20261026
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:22396f8f-2b6f-4574-bdb8-41287a0ff13c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:aa414c3e58dfe0158390e013fd2bdc29,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ae72ae4d12f11f19a56ed5b684f684d-20261026
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 743732191; Mon, 26 Oct 2026 19:21:41 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Juan Benedict Tanoto <juan.tanoto12345@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx
Date: Mon, 26 Oct 2026 19:21:37 +0800
Message-Id: <20261026112137.257723-1-zhangheng@kylinos.cn>
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

Add a DMI quirk for the HP Laptop 14-em0xxx fixing the issue where
the internal microphone was not detected.

Tested-by: Juan Benedict Tanoto <juan.tanoto12345@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222184
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 41f8c0885865..ae26524453e8 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -759,6 +759,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8DC2"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1


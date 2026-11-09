Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191199;
	b=G/zZB0X1PmuOAHKgVrYbJIJqqAkD+e08NYh9dwI+pk8AE+CfM7ypiNZCh/7B1eeMKHbE
	 wsB2RjvWLfZD+0vV2ZE2aiSrQLyr5C1Mn9zCWU4bVw0V3QLvk4hKr4dvo5V7UBohnMTbC
	 s6Z1KvOH9ChQZZ7IjDYSKCQPvHg6PIlySy+wqNeHc/2mYBzw4m2UyE8+JPII5IOSJBxof
	 FrxmLrLgz3zD4HVnEU2zIdNtZzAp+5vIdduLUmX+ofgoZODPpkigpz7buvQD4T0M8rfgZ
	 S+6xMqrHBWZ7HzJrkl3wQGNQxW7r2CEhXOyurZNSzH4IkJi8+YUNsJpcw8lsNMz6pUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191199;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Zy/RC4lAx43l7TDSbmhI2sXhtaCVsaQqXrNhbQ6tmA=;
	b=bY3Y430I5sEe6w1TSgLxwIngsBRAwpM8Lu6j02fJ7pLmPPZGfIO+rIZRaPpofOmteJ8U
	 VHyBG2xZfE6aCeTwkj4Ft984/BpNONaBOFFOJC0E9fmSoL+Ns4gFCLulp2jJcWhYQBhq5
	 l6tUjkIk7PA46Aer6Ww3uSII48oQJoHwvof1ImHoUSUoSAMq0sjicxv+3kRqTpSLI3HUs
	 xAQZCeB02ZLLi9c09Buri2PRyCMUsu4/lg0RcORNONXMF1ma94wYQF6/PAQ+oiD7Ha3cn
	 SS98kBaEyzVDJHrrmDi58qaMAiPjl+Dnt4FRdcpEJq8Vj6IvhXMlMT9vTRXDIdhAjnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3F606A31C;
	Mon,  9 Nov 2026 02:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f9cb23d6dbe411f19a56ed5b684f684d-20261109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e35f15cf-2e60-416b-b3d4-db39dda5f912,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:d78624c7af529be3f32ebe99657ac05c,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f9cb23d6dbe411f19a56ed5b684f684d-20261109
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1676675537; Mon, 09 Nov 2026 10:26:31 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table
Date: Mon,  9 Nov 2026 10:26:21 +0800
Message-Id: <20261109022621.56376-1-zhangheng@kylinos.cn>
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

The internal DMIC on this ACP 7.0 laptop ("83Q6") captures a constant
minimum sample value with no signal. Add the DMI entry so the ACP70
ACPI flag override is applied.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222230
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2fb9789cac0a..cadbf2f18e6e 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -65,6 +65,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
 		},
 	},
+	{
+		/* Lenovo Legion 5 15AGP11 (ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83Q6"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
-- 
2.25.1


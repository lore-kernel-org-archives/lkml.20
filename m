Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757070;
	b=GY+uvquPFUxbuK1xSR2/iQHFrxtTTxeZhBnMhbjPa1kmOLRdq3pOEOvTwb8yplQm5AAy
	 H0toDrZ1LGQJ6Sbn8dFA2c58naOFzch4GVac1eW+og2uQ+QzYGA10PePHuyVgozmXL+4z
	 UoIobe3nyAuXIwEKjF4GBR2qCbBDkfccdJF0vm21rxySNr5XdD/Xm2dx8dxtB8MuYxEb7
	 omRE6oMSDdPFL7E6Ra6kf0w0WNXfwYqs7h1xbiSH0vLCjvWZ4qlNcPIMjaUzYqcjTPI0f
	 PeN2Ves3dWnHnMwOIzj1hFoHZGiisCzCb9pnjEsF9G5KTIUxP231ES5lNCDSVUrdPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757070;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFq08CsAFVhSn1eWQAB3dasJVn0D2xjTVXuGTr24SJY=;
	b=CrKujtkKsbO+gGB6NTD3GQan1NbHoP/6YZME1ewOmiHwVUg7XWed4xoQ9bMgudtYmvMH
	 ENsYdq9swHYpUp1oBouHQXFbPKSiBAYUSvG40CL+LITeHvVpITesBoU8aQQaH68Rlr9x1
	 3CSkWX0HCUUD1e94cCgCbJfKxRx6BbAVzY7MiSB8GTptjVknxRNLY2/1wOZ0EagSxNamU
	 Jrc6dsLZ6w9YDnK44RAhXeJ8grZHXZDzoURFMvV9/pk5ehIYFWtPON9bny65fopubnMV4
	 j1FKSOOAEVAh7tXdHVnC6v1V1nn/s71WqN0JnRRx/INUCzFRPHI7NIB0A/N3f2B4Pfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1A606A31B;
	Wed,  4 Nov 2026 01:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C1A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 309188d4d7f211f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5a3d2273-7069-40cf-aed0-21ea1ad4d9bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f4c7383558f645e3733a1ecab93ba228,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 309188d4d7f211f19a56ed5b684f684d-20261104
X-User: weilixiang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <weilixiang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 488411259; Wed, 04 Nov 2026 09:51:02 +0800
From: Wei Lixiang <weilixiang@kylinos.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: drop duplicated DMI quirk entries
Date: Wed,  4 Nov 2026 09:50:58 +0800
Message-Id: <20261104015058.6-1-weilixiang@kylinos.cn>
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

Two entries of yc_acp_quirk_table[] are present twice, so the second
copy of each can never match: dmi_first_match() returns the first hit
and the rest of the table is only walked when that lookup fails.

The LENOVO/21D0 entry was added twice in October 2022, once for the
ThinkBook 14/16 Gen 4+ ARA (a450b5c87392) and again ten days later for
the ThinkBook 14+ 2022 (a75481fa00cc).

The ASUSTeK/BM1403CDA entry was added for the ExpertBook BM1403CDA
(f200b2f9a810) and then duplicated when that fix was merged into the
development branch by commit 5a306bef5988 ("ASoC: Merge up fixes"),
which kept both copies while resolving the conflict.

Removing the redundant copies keeps the table easy to audit when new
quirks are added; the set of matched machines is unchanged.

Signed-off-by: Wei Lixiang <weilixiang@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index ae26524453e8..034957508e51 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -87,13 +87,6 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
 		}
 	},
-	{
-		.driver_data = &acp6x_card,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
-		}
-	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
@@ -878,13 +871,6 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "BM1403CDA"),
 		}
 	},
-	{
-		.driver_data = &acp6x_card,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_BOARD_NAME, "BM1403CDA"),
-		}
-	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1


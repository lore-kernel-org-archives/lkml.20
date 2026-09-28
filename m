Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2C378D8E;
	Mon, 28 Sep 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584792; cv=none; b=OEeuZRLPzTxDAxCLOgK+/1xZ5cGY3Wl9jdwmIh65T5zYiLCofwv1nD/yV26GmkqQ5Y50P7Hkh5HtbSNEPIOy8j00ev+2YASOVDgRTXo/LHwr8c/SbS0GiTMfcH3ooyj2zuB5Y9zgjbJnxcum3Ey2oSBDnnzVDQ+5bmGmkqKloZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584792; c=relaxed/simple;
	bh=1xnERwE9TK4HH+IruY5QOKspVKv5OXmmy3ph2xgi6mM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aZHKgTi1o9ngu89VhLOCM7M2j2MT4y/ZI66M9QTucIqJMnCkZGWrl8gOlxOsEGJMQ9SIztBesQ3REH4j3wGtLpBxAdXHqMqd7nI3Tpl00ha9WqxZwb8L/TofmKo7taaL/aNlmUwfmpLlsitgH0sWWvujHJM4C1E/0xeHuOI+iAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 215ab04ebb1811f19a56ed5b684f684d-20260928
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7c959737-4ef0-4eed-ab4c-a822ceb3710b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:baccfe0a4343388518fbc40423ffa7b2,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 215ab04ebb1811f19a56ed5b684f684d-20260928
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 712790177; Mon, 28 Sep 2026 16:39:33 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Jannick Tobler <business@jtobler.net>
Subject: [PATCH] ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA
Date: Mon, 28 Sep 2026 16:39:25 +0800
Message-Id: <20260928083925.266471-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ASUS Zenbook S14 UM5406GA (Strix Point, ACP 7.0) to
acp70_acpi_flag_override_table so that the broken BIOS
acp-audio-config-flag is ignored and the default SoundWire
enumeration path is used. Without this, no ASoC machine driver
matches and internal speakers/mic fail to probe.

Reported-by: Jannick Tobler <business@jtobler.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222009
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2d50be8190c1..687ef50fe079 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -63,6 +63,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
 		},
 	},
+	{
+		/* ASUS Zenbook S14 UM5406GA (Strix Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S14 UM5406GA"),
+		},
+	},
 	{
 		/* HP OmniBook X Flip 14-kc0xxx (Strix Point, ACP 7.2) */
 		.matches = {
-- 
2.25.1


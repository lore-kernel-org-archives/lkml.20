Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860333;
	b=hbh03fUju4ASch9WDaz7UUAjJGHU6xgnrBWWuN7w4tN058MYBmFLv+xHQiAZHYYtiuRK
	 J3dv4OFkcNMwmp5hTzu3mtYpzmu4tl4um22vaQwdDtzV6nmaHGGqta0e6IMCh7DHiiI+n
	 8Hvgg7L8klimxFNMDtwYB0Uk0wQ2nlTm4kjte6Z/jSz4wk8p8r+A9+JhVxTxkQojmsisn
	 gKBBxFBYFxKMwimYhkLJMHyLIrl65zL4jFGuj9NnVY+XtENyFTLpM6bmfAa3oDp+hG+lS
	 0oA49DjYUIAjH/YcSqMXZnV3Eo4Eao5b5bC2mwHPGw3yQtF14GcYa0wSrUPjQEJ9pcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860333;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NMc4YBNqqNl/f5QyAxzKJtl9UUfUND1Mckv/e/eHgt0=;
	b=Vc/WSlGN/VB7T0WEL0tPEvE5XRuOs/HleMAupV5nJ5lWWHeFbU3hjEK1/7NjkA7Nl6fv
	 t8/QwqSJaXI5PTmUpa5Je08dKi1B0yJm28VNh5yyRv/s6AHaBpKktPvC0I5M2R9GKROe6
	 W9sy1fg7lXmfI5POBKEN6RVLgvR3Hq3X2Tbi0o1kUpuQBLs/7LQtUPOM4sErGV+Dm1nk6
	 rHo6iGT7rK5H0+Fs4xn1yZSyW/GrUIbqJR6o0eyjfR0xaN/ulvARf+SZud3Ns0twOmACd
	 hBFA2Ps3SF1Iv145iuAVt5UpeZgko4rYEkv582fpnr5TFLFiGo2Fs3/6GbDYtY5uMXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC9606A31B;
	Thu,  5 Nov 2026 06:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9ccd4a4cd8e211f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c472277c-37bb-4f69-a75c-650787c10c7e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:6ae8fd732662dd474c64bf48ab8defdf,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ccd4a4cd8e211f19a56ed5b684f684d-20261105
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1484795416; Thu, 05 Nov 2026 14:32:03 +0800
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
Subject: [PATCH 1/2] ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0
Date: Thu,  5 Nov 2026 14:31:52 +0800
Message-Id: <20261105063153.353012-1-zhangheng@kylinos.cn>
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

Not all BIOS implementations report _WOV correctly. The DMI quirk
table already serves as a fallback for machines with broken ACPI
values (the _WOV read-failure path already falls through to it).
Extend the same fallback to the _WOV=0 case so that DMI overrides
can take effect for machines whose BIOS reports _WOV incorrectly.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4908f4cc147a..8363dabc7eea 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -1000,7 +1000,7 @@ static int acp6x_probe(struct platform_device *pdev)
 	if (!ACPI_FAILURE(ret)) {
 		wov_en = dmic_status;
 		if (!wov_en)
-			return -ENODEV;
+			goto check_dmi_entry;
 	} else {
 		/* Incase of ACPI method read failure then jump to check_dmi_entry */
 		goto check_dmi_entry;
-- 
2.25.1


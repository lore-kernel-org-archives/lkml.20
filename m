Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843680;
	b=cY59a2EH02kQyExb4TuqV5J8Lmxm55FnmlJCfOQtbE+M2YfkW5IxHdo3Qofa/U0duw6y
	 fThqoQvyK/i5eAWA0QcVYbcEsImCTyaZwT+ZS09HqDWb/+IcQ3/1ZB+Qez2pt/sd99RPp
	 LfahxnQ6WEe+RUw1Tpfey2eqc97v6lHrOyL6lFrswjtyinceAmHmpMFGce03aTEcWk+uQ
	 NbV37UQy14ZEmsmUStG8GyZmzOm6/iRqfy0224BIta5Ks6ZZYn3OegK39BUwU6EK67oB6
	 Qvvn266vRMB9LgRn8X5cw7hQBhdk1Qx/8b4hd6UL8WWb3rNrD41s/ZDTWdzm0NFFUFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843680;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XxRP13dGcpVE2cDdV6wEdjTnMpQWMb8nL3PqzXA+z30=;
	b=WglJnKEvtlvrXnldkNR67nzxbQatkM9ZBBNr8EcyyB8ziIlbsH9IF1tyf+/FAuchaxb2
	 g/7/fblw9tWVcHJZm8JRabdZEGFZCea9FFB8FfDlHs0T4+T0X4a2nOk6IaGIW8IBQv+4Q
	 l5mLeRFcg9VSscpP28VE8bhl8r6BfsUXvdEjcqxJP3O9gpXE/IcZMYTWJw3lN1T4VjJvi
	 LUWoXE1ALPMessudQ7J1UBtIZRfrquXDtm2R0E0vjiFlO1lxm8oH08tBP9F5MPgmhlZ98
	 HDEhv2oWe7xy5nkLpEcltDzT9VX+wsl8Bir5upij3HDprTG6b1cm+nMfpy87YCxiXFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70CE606A32F;
	Thu,  5 Nov 2026 01:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70CE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d85db7eed8bb11f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:54723363-0613-475a-af1b-1cd8b0d41fce,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:7db8b62,CLOUDID:6ee543506b639fa71f765a834994d833,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:2,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d85db7eed8bb11f19a56ed5b684f684d-20261105
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2014278102; Thu, 05 Nov 2026 09:54:32 +0800
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
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
Date: Thu,  5 Nov 2026 09:54:28 +0800
Message-Id: <20261105015428.54091-1-zhangheng@kylinos.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS TUF Gaming A16 FA607NUQ has an internal DMIC array connected
to the AMD ACP 6.x PDM interface, but its BIOS does not configure the
_WOV ACPI method correctly — it returns 0, causing the driver to
return -ENODEV before the DMI quirk table is consulted.

Not all BIOS implementations report _WOV correctly. The DMI quirk
table already serves as a fallback for machines with broken ACPI
values (the _WOV read-failure path already falls through to it).
Extend the same fallback to the _WOV=0 case so that DMI overrides
can take effect for machines whose BIOS reports _WOV incorrectly.

Add a DMI entry for the ASUS TUF Gaming A16 FA607NUQ. After applying
this fix, the internal DMIC is detected and captured from correctly
on the affected machine.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222214
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4908f4cc147a..fdeaedcfb178 100644
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
 
@@ -1000,7 +1007,7 @@ static int acp6x_probe(struct platform_device *pdev)
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


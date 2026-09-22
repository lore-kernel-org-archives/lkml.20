Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2062C08D0;
	Tue, 22 Sep 2026 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080263; cv=none; b=cbn0N1w/P5Dx2Cc+n+FtVg+NIDSX1pz5x+0hIxvbJYvGozr66OdBdwvGQ9uB3LkRmc+jKoutyVRv3pV5WYJAJepxpMZdVP6eei4wzYsKMRwTgHL7144OZpyClEH71u+omU2vF30qKci9ey93qtKzaF9WjyvPSSUMzDXxMh/dYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080263; c=relaxed/simple;
	bh=+zubclXXzv5dDxzs7ePA6amqnQVwWQGXkHQqEjlO//4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YIK+8BAb8309F98hq4jg/OiOcGp+aw1zLTofDsxUjs0bTkCrbQQMyRnkuQIJ5DamaUHBpUkOo/7KLijEvkyCjAAo1VKl6GZm64vWGg9dcKDlUw7fLpkKSigxCa3cU596ZotVCK4OObnqfKKIzGcexn/ySYPzK80CtGVos2sXJzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 72d994f8b68111f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:37410444-193a-429f-b98a-3072450753d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f1e7d2dbc855937939474a80473932a6,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 72d994f8b68111f19a56ed5b684f684d-20260922
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1203561736; Tue, 22 Sep 2026 20:30:51 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Mikail <mikailb1998@gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9
Date: Tue, 22 Sep 2026 20:30:29 +0800
Message-Id: <20260922123029.534152-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Pro 7 14ASP9 (83HN) has no digital microphone on the ACP
PDM interface; all internal mics are wired to the Realtek ALC287 codec.
Add 83HN to acp70_acpi_flag_override_table to prevent the legacy ACP
driver from binding and exposing a non-functional PDM capture device,
consistent with the sibling 83W5/83V9 entries.

Reported-by: Mikail <mikailb1998@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221886
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2d50be8190c1..4d8f86aa3d16 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -51,6 +51,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83V9"),
 		},
 	},
+	{
+		/* Lenovo Yoga Pro 7 14ASP9 (Strix Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
-- 
2.25.1


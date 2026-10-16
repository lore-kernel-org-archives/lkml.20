Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0584A4839;
	Fri, 16 Oct 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155755; cv=none; b=uH1LRBAWD+VLBFa74UE/YDkcDXR/fOBIYmbH/CgMLh118pDov59uXgNTVWpvqX/xVRffuFCU51qCBruwKfqgrkToDqC0b52MBGcSEY18UlbZ8DtdJXkAx9iRn2G1OloOAImbD9Vsg6s1qIgnb4uZSBbXkMw2Sdyo0YToKtQNrhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155755; c=relaxed/simple;
	bh=6651gH2+QOfa/SeEEinrKiLEsLBPK1uyjzlaZImrFuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgzBoCpaNYT9Mp2YQP1PLPshwZW8Ti3PvypvoHofpvjTAzHTnl0PbkJ65QPAxutUdDi9rRdX8FAycUXgvYebqa7wIHs3/vZWC5pKtJVXrfA8wkC55rCHVny0XVvkZdQOZy6bLQUsVia3nm+xQqcY7VmLW0qhE++282+J0BxasKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d44f0da6c96111f19a56ed5b684f684d-20261016
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b0677e61-49fb-4b07-9c14-7e65dd3b9bbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:c3899cb0f2e45b50089dcc3001392ff8,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d44f0da6c96111f19a56ed5b684f684d-20261016
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1413765501; Fri, 16 Oct 2026 21:02:23 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	lethiebaut2@gmail.com,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda: cs35l41: Add support for HP OmniBook 7 14-hg0xxx
Date: Fri, 16 Oct 2026 21:02:19 +0800
Message-Id: <20261016130219.690074-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OmniBook 7 14-hg0xxx (SSID 103C8F07) uses two CS35L41
amplifiers connected via I2C. The left speaker works, but the right
speaker is silent because the cs35l41-hda driver fails to probe with
-EINVAL:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property cirrus,dev-index: -22
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform not supported
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: probe with driver cs35l41-hda failed with error -22

Add the missing SSID entry to the CS35L41 configuration and property
tables, using the generic DSD configuration and the same parameters as
other HP laptops (e.g. 103C8CDE). This allows both amplifiers to probe
and restores the right speaker.

Tested on HP OmniBook 7 14-hg0xxx (SSID 103C8F07).

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222124
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 272421d1bc8b..0be0ab47bd94 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -541,6 +542,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8F07", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.25.1


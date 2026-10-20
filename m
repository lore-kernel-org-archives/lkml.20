Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487414;
	b=SZH2Bpg4qiSMPfnbLi0otn8Q9fzgy3+W9mDg4Zkri0DOUeWaNq6yaSVpAzWWZXotohNQ
	 lBJ8WrtptTX0FWwzc30e/q0qHH/0eqb+z/7Hpg3GblIwitxrHvCT2qsY7dBx7GZaADQPP
	 OpA0XWgFAAKxZWsWV5ikpoFQFLLgKEx+uWkmzDeyGWcAa2kEj4vukACgDj/2k68IGfqUn
	 UuKuU2sU2csnJ/EZb3TrtZPx60SRBOCUuSLAbPp/XSaRGqj2kzYI93duKeeefyIr3o2Hq
	 PgTMaIe+MMhyw/h8md/neNE7sbJpDQBEGi2klrXPpavOjXUqlddh9Pj7MYIX0AqFcaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487414;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BbfbbBkGHHJ9xJbKeZMyOFLrS6C9DUiYcTXqWzeBXR0=;
	b=g9DBAtQs+/Win0YCvDBNiRGTAgCXTmUOGrpNzpbj983Rp58aTJHeQAjlpLbo7WHI7agJ
	 N2PkymbGAdhXlTZ2qcOn15Qr9kNT6Mu2YK1cpjHSxCguhpjeJ2OAJeL299+EBhMAiwYNM
	 NTlY4BJyojIT5H3vhZWDzHkIZsr5ZloEV++8gaYMlgW+3CQrbo5ugpx1YiFDbVjrsRp/5
	 /JMpruESh2Wlh45a4f1+3apD2VRrQnLUscckJzF+IkWd1UCS8Y6KDaSBLnRo3iyFPf1ev
	 ujxHnHvASIeumyielaHWtDr0dqaU4jBzM/4L6W68LexCixyqwZ+rE3ttQSHGaBU2vQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2712606A32F;
	Tue, 20 Oct 2026 09:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2712606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 09363d3acc6611f19a56ed5b684f684d-20261020
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:616e850c-312c-475a-9778-2a1feee7c7c7,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:616e850c-312c-475a-9778-2a1feee7c7c7,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:3a5630fd8d96709ee450f45365b885da,BulkI
	D:2610201710079SN48DAU,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09363d3acc6611f19a56ed5b684f684d-20261020
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(223.104.132.233)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 975866426; Tue, 20 Oct 2026 17:10:03 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: wangyan01@kylinos.cn,
	runyu.xiao@seu.edu.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mtpav: restore negation dropped in guard() conversion
Date: Tue, 20 Oct 2026 17:09:59 +0800
Message-Id: <20261020090959.570101-1-wangyan01@kylinos.cn>
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

commit 316e0074ecdc ("ALSA: mtpav: Use guard() for spin locks")
claims to be "Merely code refactoring, and no behavior change", but
it accidentally dropped the "!" from

        if (! (portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED))

in snd_mtpav_output_trigger().

Restore the negation.

Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
---
 sound/drivers/mtpav.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 1ed6d4f0cb62..288a873a27e6 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -443,7 +443,7 @@ static void snd_mtpav_output_trigger(struct snd_rawmidi_substream *substream, in
 
 	scoped_guard(spinlock_irqsave, &mtp_card->spinlock) {
 		if (up) {
-			if ((portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED)) {
+			if (!(portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED)) {
 				if (mtp_card->istimer++ == 0)
 					snd_mtpav_add_output_timer(mtp_card);
 				portp->mode |= MTPAV_MODE_OUTPUT_TRIGGERED;
-- 
2.25.1


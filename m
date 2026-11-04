Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779013;
	b=aCFXRuYLNDDuH+wu0CrLimdDNHmCSVhn7vwk1oVOJg3D5tqs4PtxtkjEm0fpY9DTiihw
	 eScc3pJs8mF04MGLcTO8WUPsxEjLahGbHukVKOy3EG1bLGR1MPV79pkx7mH4g2YjfvpUp
	 dnbAFEfFoYgjLRJ9CLfQpgmg35TlDwrlsf/3uPGRXKQj+ctzCuj6E9c+L41Tl+x6DvlkB
	 ZlOuYX5CIMF0npu/Cl5VcZZCaXSMKOVKu1IDLLr2Duy4PUOe4Jkrn8VuLoF1R4aN9BrvF
	 J4cn48GEfwj2N83Sy6X5L4Ma0OaU7CLia8OUVs0JuDnG2e35ZtWUXO1rmerfJZe8dpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779013;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2uOYWGt4AO3+u8u+kd0zrEytZb9XowJ07OqUMUTGZZg=;
	b=WPzZWVRbMqA/njfAFQc/k62216FPRqut/xwbh0RBtidhNmbIRJi+m/6rZsvXGTAeGTMf
	 RkA+PVGrgoxgLRJxG4ywfDSlrEnQUfQ8ZuJDd6u7lNwKF+67vTgx4SMIZoWZbeD362LRI
	 M4c1sw4tPfubUjlUFwkXnlMhu82lofT2dbaaLdcgpORTWZOflgyhRNQjzIdQCPQ9ohyrw
	 kuC4f6OkZZnJWG4GBl5suGVSvktRrX/bQEIue5sAieRL0PbIF0sC1W7NTHrk7KQk679GL
	 pBtCVESVMvcE3wNhfYqJH9yK3AxdaogaazRlf7D21FuoctefJspsXU5fow56rSUjePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B2606A31B;
	Wed,  4 Nov 2026 07:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 486e9bb2d82511f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4077d316-8174-4c66-9782-bfd9944b7806,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:0d7082b4cebb77ea3168c59fb2ef3cce,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:1|-1
	00,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 486e9bb2d82511f19a56ed5b684f684d-20261104
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1742231886; Wed, 04 Nov 2026 15:56:46 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: mixer: oss: Fix uninitialized index in recsrc ioctls
Date: Wed,  4 Nov 2026 15:56:42 +0800
Message-Id: <20261104075642.1790966-1-songxiebing@kylinos.cn>
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

From: Bob Song <songxiebing@kylinos.cn>

snd_mixer_oss_get_recsrc2() returns success without setting active_index
when the current Capture Source does not match any OSS mixer slot.
snd_mixer_oss_get_recsrc() then uses that uninitialized index for
"1 << index", and snd_mixer_oss_set_recsrc() does the same while ignoring
the callback's return value.

Make get_recsrc2() return -ENOENT if no slot matches, only use the
returned index in set_recsrc() when the lookup succeeds, and initialize
the index variables as a defensive measure.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/core/oss/mixer_oss.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index c533d767c29a..6c8ca1d320ac 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -185,7 +185,7 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 		return -EIO;
 	guard(mutex)(&mixer->reg_mutex);
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
-		unsigned int index;
+		unsigned int index = 0;
 		result = mixer->get_recsrc(fmixer, &index);
 		if (result < 0)
 			return result;
@@ -212,7 +212,7 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 	struct snd_mixer_oss *mixer = fmixer->mixer;
 	struct snd_mixer_oss_slot *pslot;
 	int chn, active;
-	unsigned int index;
+	unsigned int index = 0;
 	int result = 0;
 
 	if (mixer == NULL)
@@ -222,8 +222,8 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 		if (recsrc & ~mixer->oss_recsrc)
 			recsrc &= ~mixer->oss_recsrc;
 		mixer->put_recsrc(fmixer, ffz(~recsrc));
-		mixer->get_recsrc(fmixer, &index);
-		result = 1 << index;
+		if (mixer->get_recsrc(fmixer, &index) == 0)
+			result = 1 << index;
 	}
 	for (chn = 0; chn < 31; chn++) {
 		pslot = &mixer->slots[chn];
@@ -826,6 +826,8 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 			break;
 		}
 	}
+	if (idx == 32)
+		return -ENOENT;
 	return 0;
 }
 
-- 
2.25.1


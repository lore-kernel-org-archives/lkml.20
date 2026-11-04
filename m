Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786681;
	b=tlzkL3VGLUX/+wz7PE53vftFYLPLjJaC8p29e7/Nd7j3m0ht7lH/Dt1RgVrpOlrg30J/
	 MLf40c2z+beSmMsv3DJwOHwdo2lYb1idLT/NyGWzd0w50bjDncWqsWI/9dyGFVY0L8yv7
	 7tnMwhmmJojoxzHOFqH3ig4JtJbkmE3MhKMn6Hmf0fgXZWK8CRu1XiD1b+MajFXfdM3gE
	 7d/E3tBVJJ3M1WLzvWFIM+JrC7vzhP98c3oQDlhbAyNbK4ulCosVhJeKmVSNz+HW3EUdr
	 6LkzPjoMLne95Ct/VxcYow9MUdKzX5S/gGygxIwI/4vOAPRY4MqKDizoS3SSp7eUhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786681;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X2YcMacOcjzPS0GlpoVpvScSeS4KZiM7nQdD5L8h3+s=;
	b=FvjqM+/EghheNQZsDK9G2ynPwStH199Y/3ndIpyIG8IXbNJ6YdeuIen3wRW6J06fnwXE
	 uG6/YTnRniae5/9+hMZSwmj799RrNGlSHTbfEiDeK2eoFm9yf3DiZTMtsZjT/5HMhBZLf
	 ogU5LrkFzjaPJ3gHngzFIjH48hlBA/5AuV9RwC2JhXmm0WHEhTeRnkSsvRx7W+TWUencM
	 bRScJH6N3Qq9jItq/bFUXXhVnOw8p/uwtRbeoZnwMh4JeNeSAmFn4+gy6Tb8JQhfv1ntJ
	 aZnkEa+NCauhM/KDCfiNiKBEF4cHlXS07Tq8GRKrc8aRYxpbPVyv6ASoBZiD/MK4jgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCD606A330;
	Wed,  4 Nov 2026 10:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDCD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2315b582d83711f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e12af42e-2952-4434-80b0-8a1aad725eaf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:60ebbdf5f69c456dccecd96b875fa386,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2315b582d83711f19a56ed5b684f684d-20261104
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 674114473; Wed, 04 Nov 2026 18:04:34 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Catalonia_State <alejandrolibre@disroot.org>
Subject: [PATCH 3/3] ALSA: hda/realtek: Fix pop noise on ASUS PRIME B650M-K
Date: Wed,  4 Nov 2026 18:04:27 +0800
Message-Id: <20261104100427.474270-3-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104100427.474270-1-zhangheng@kylinos.cn>
References: <20261104100427.474270-1-zhangheng@kylinos.cn>
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

The ASUS PRIME B650M-K motherboard with the ALC897 codec produces a
loud "pop" noise from the audio outputs when the driver initializes
the codec during boot.

Add a specific fixup to toggle the EAPD pin (disable, wait 200ms,
then re-enable) during the initialization phase to eliminate the pop.

Tested-by: Catalonia_State  <alejandrolibre@disroot.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222096
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc662.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index c1c7277b6754..a0efd4596c88 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -284,6 +284,21 @@ static void alc662_fixup_csl_amp(struct hda_codec *codec,
 	}
 }
 
+static void alc897_fixup_asus_b650m_depop(struct hda_codec *codec,
+					  const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_auto_setup_eapd(codec, false);
+	snd_hda_codec_write(codec, 0x1b, 0,
+			    AC_VERB_SET_EAPD_BTLENABLE, 0);
+	msleep(200);
+	alc_auto_setup_eapd(codec, true);
+	snd_hda_codec_write(codec, 0x1b, 0,
+			    AC_VERB_SET_EAPD_BTLENABLE, 2);
+}
+
 enum {
 	ALC662_FIXUP_ASPIRE,
 	ALC662_FIXUP_LED_GPIO1,
@@ -345,6 +360,7 @@ enum {
 	ALC662_FIXUP_CSL_GPIO,
 	ALC897_FIXUP_BEELINK_SER6_AMP,
 	ALC897_FIXUP_LIMIT_LINEIN_BOOST,
+	ALC897_FIXUP_ASUS_B650M_DEPOP,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -810,6 +826,10 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc897_fixup_limit_linein_boost,
 	},
+	[ALC897_FIXUP_ASUS_B650M_DEPOP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc897_fixup_asus_b650m_depop,
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -858,6 +878,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1b73, "ASUS N55SF", ALC662_FIXUP_BASS_16),
 	SND_PCI_QUIRK(0x1043, 0x1bf3, "ASUS N76VZ", ALC662_FIXUP_BASS_MODE4_CHMAP),
 	SND_PCI_QUIRK(0x1043, 0x8469, "ASUS mobo", ALC662_FIXUP_NO_JACK_DETECT),
+	SND_PCI_QUIRK(0x1043, 0x87fb, "ASUS PRIME B650M-K", ALC897_FIXUP_ASUS_B650M_DEPOP),
 	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
 	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
-- 
2.25.1


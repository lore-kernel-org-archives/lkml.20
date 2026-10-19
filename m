Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.198.250.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434759;
	b=Em4nZIQcqGq7erckwBt0SwOfzy1SOogrImnPaR4XGxnPkYG/YDXAzjp7EXm6tDgtd5Mr
	 aBa11MmA9v8wSyD7lj2jFzvERyq4OhojB9XQyS2J5gBKej5kUCp+S6uUauoyxftlaAeyC
	 0YjMgwX/sFHA4I44CqZGTrI7aChcWHL422fN7ytEwrJhbq+zAn/BumiVpUqbkoqIO3EDh
	 fK3bpoay0qWBxyV8gFogvwNfr8CABH4KqXH0BvPTETYyxGiNFm4qnU3GrgWdFD1+MO8Bw
	 CIIkMMyBgxKE5K3Pk2Tf5BJZTcD6XC7WxQGFKaK+cIyq4HTxDCqQCKVpnjUIvfeuu4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434759;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=Hyt2fg/Hk15Ve83GgRKZEhYllu1OCjdckB6+Dctq/7c=;
	b=AUdfPdm1RAy1aNYo+8PNAm/WQL4gFguTTa/0d/iiaYACQRLn4wH80GN2UMNy+LdaiC68
	 54EB55r/pQYCNX1UQCVytXJN2DbgixUswxb/5orvZlbf4sU24AcWlm+n8UbtVvIwGGAak
	 ZdS/VlN6HvjCzYTkXI1ZJ+lMxpUFi1fZT8C3RTzNRaFybhWC7AkDc0rpId6AGO2xRj05z
	 Pgm/oI1zGy08l65NnuJT6sMV1SR7g0Y3NyJjMpAQNsZRvXdvlbXiLhBhDCVQTf5ffjflx
	 LEdZNtl3zCZ4+qZeUl9r07foi2w2y6bF7Uh4xNMVRSfv3vg++D//RM1Bttcu9TPKJbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wscag1bG;
	arc=none smtp.remote-ip=91.198.250.236
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25CB606A31A;
	Mon, 19 Oct 2026 18:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wscag1bG
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4j7kg14xQxzMlLq;
	Mon, 19 Oct 2026 20:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792434749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hyt2fg/Hk15Ve83GgRKZEhYllu1OCjdckB6+Dctq/7c=;
	b=Wscag1bGIIDf3/ugAXdbL18Xzw0wIQcfMcc6TM7DfR006ylScqWKgasJZAPfDYQS1cV7wC
	FexZKWrttAmphhXVdSbiCaTYVQcc4o1Q78h8eb2P2cWTeRS1dmM50CCGy2QWxq8xiiVGC0
	e+6PP6J0B9QZ0gFqXKfekED6Q3APevjtAKehSP8ko6uCS52WhfIvb7riwRvfs7TPrS6yz9
	f6rvSq6tV7D6NEsVhWRml/+u3orEWLKV+302ThK0QTQNf51gqEuNJKFX6r+u4gDfxXv/lg
	Mf9uidu4PUtHNCrAoPVeyIUDoq1Q9ZUxSsuuYdWUvZwkNLheTl16o5xK1vHZgQ==
From: Nika Sommer <nika.sommer@mailbox.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nika.sommer@mailbox.org
Subject: [PATCH] ALSA: hda/realtek: Enable jack detection on Minisforum AI X1
Date: Mon, 19 Oct 2026 20:32:26 +0200
Message-ID: <20261019183226.64985-1-nika.sommer@mailbox.org>
X-Mailer: git-send-email 2.54.0
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
X-MBO-RS-ID: d60f58cf2de22c32a82
X-MBO-RS-META: z4uyi6b96u4awstb78dwk85nbkqmzimr

The firmware of the Minisforum AI X1 leaves the headphone jack detector
reset bit asserted on its ALC245 codec. As a result, pin sense on NID 0x21
always reports the jack as absent.

Enable the existing fixup ALC245_FIXUP_MINISFORUM_JACK_DETECT from
commit 6bd8a57c044f ("ALSA: hda/realtek: Enable jack detection on Minisforum AI X1 Pro")
to the Minisforum AI X1, which requires the same workaround.

Tested on a Minisforum AI X1 (AMD Ryzen 7 255),
using NixOS 26.11.20261014.55bfb4d and kernel 7.2.10.

Signed-off-by: Nika Sommer <nika.sommer@mailbox.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926c..9eac55ee5e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8404,6 +8404,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xb020, "Minisforum AI X1 Pro",
 		      ALC245_FIXUP_MINISFORUM_JACK_DETECT),
+	SND_PCI_QUIRK(0x1f4c, 0xb022, "Minisforum AI X1", ALC245_FIXUP_MINISFORUM_JACK_DETECT),
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.54.0


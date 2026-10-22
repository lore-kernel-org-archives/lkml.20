Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637876;
	b=foWcsvSZiL3/l1HJDw4sspg05BnvYUxLQZMBTaz7vSkdtSwl88yfEZKGvItCjj3k97rU
	 kpz+g29wEI1h1485nB7F97ourEJ7Frv9f3aayy1+IqLf6klFkie7gSzpuGoB8267XhMa6
	 WL6BnwU5azyPVK4DeIeJFEXqwxEJ+JSBi3vi6vS4vcXf2Rjh7Oa16M63xSZ3UT4142R64
	 DuW27iG50BX4WOxzm8G7NlhsbbjuVKgsv2PNGjqBbuhvzpSu19JrWAcFpWo60DZ1cEnT1
	 /wKe1/feBA2ZGN5xUgvClFCkUBMRAJQ8ZhUO9Ae8lW7izeANgvxH8pnvThrXljvqO2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637876;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=stzr48u29auLJlOXX0oPfnmnOtlWuZ7svkzgFr8tnNc=;
	b=Bgsl3EUIxpHavhVyluxOn/G9Bf9NTLRN87zxKB/JumZqW9Wx1zQtFTmD58DWsE2vXAZY
	 /ppedXehkQfBclCiog5DciPVv2mojVP1GJ3xQw/YSHrPNpoZvFZk4lh+dWxvI2pgf+fhy
	 I4fR2FxmWdF0BQHurTgQVDm4+I1AbprvJv4fGc8gOfGyLu+kSPbTJKcbRv88WPdh3c/qV
	 IBqURPgOGB7RM43hppuHvl2HXL0/XiiYdTpIKUUAeGw19vXpAlkxpwLYLUhYmob9u9U2S
	 tFhtuamPSlmm+II6hYBlrFYFhePLLfWVpphM/LKoQMostOcDs8fJkYKGZJV0oRGM0WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD667606A31E;
	Thu, 22 Oct 2026 02:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD667606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5cb89fcacdc411f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8b50ae8a-ebbe-42b1-8861-6254e9406f48,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:bdf4605fa5b0c9d93ccacefb27d3bfa9,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5cb89fcacdc411f19a56ed5b684f684d-20261022
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 971522160; Thu, 22 Oct 2026 10:57:47 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
Date: Thu, 22 Oct 2026 10:57:43 +0800
Message-Id: <20261022025743.520258-1-songxiebing@kylinos.cn>
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

The generic parser names the capture-source selector "Capture Source" when a
single ADC is used, and "Input Source" when multiple ADCs are handled
(including the dynamic ADC switching case).  Commit 624d914d091a
("ALSA: hda - Use "Capture Source" for single sources") introduced this
split to keep the nicer name for the common single-ADC case, because
"Capture Source" doesn't work well with the alsa-lib simple-mixer
abstraction when multiple instances are present.

However, alsa-lib expands a control named "Capture Source" into one
simple-mixer element per enum item (an exclusive capture switch per input),
so there is no enumerated simple-mixer element named "Capture Source" for
userspace to look up.  PulseAudio's ALSA backend resolves its input-source
element by name via snd_mixer_find_selem() and therefore cannot find the
selector, leaving the capture source uncontrollable on such single-ADC
systems.

"Input Source" is mapped by alsa-lib to a single enumerated element and
works for both the single- and multi-ADC cases.  Use it unconditionally.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/generic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 6120f797b45a..75b6e2749157 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -3748,9 +3748,7 @@ static int create_capture_mixers(struct hda_codec *codec)
 
 	if (!spec->auto_mic && imux->num_items > 1) {
 		struct snd_kcontrol_new *knew;
-		const char *name;
-		name = nums > 1 ? "Input Source" : "Capture Source";
-		knew = snd_hda_gen_add_kctl(spec, name, &cap_src_temp);
+		knew = snd_hda_gen_add_kctl(spec, "Input Source", &cap_src_temp);
 		if (!knew)
 			return -ENOMEM;
 		knew->count = nums;
-- 
2.25.1


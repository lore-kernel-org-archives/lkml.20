Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401812;
	b=TyrG2aj+cFlHiLg1Yi5MySD4Kar5ij8Cxyqq3q2TGYojpnARDxXv//O1zKstTycfh3lt
	 rtuBEJTBJ+mUgEpTaDKYpW9I1BKMo1D3LLOZ3DngXcjMd3Kjzlgzint8BNVb601OSS4n/
	 sk3MpzTW/NOQIYjWPN30m2lUJo8WIEQgwRmdRHV0gAAufxppUlfYq1C87HuOvDb83ExFi
	 JYTTS2SkL0g+xX4wktHAscJsHitUru3TQ1vaUz+rzHVaHdwYNgiI+gBVPUvy4luf/PyeB
	 o/zi+PQOH0UNOhLDQU1xnfTWudYUhuUqGABXmdDQq/DDKEG0z5gx/0U+VhbYQnY37vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401812;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kQuLm2GSZanDzJQHz8hVGRV3EilfPxe3tA1ZktCyWds=;
	b=OtIeTsIXGpQUZHsw/MO5DQGmz5AK04QAfRlBsl0Xn1EvF87qkaFXWhHLRMFqg+47DMgF
	 tZIu/sAWbRjHmT6mwpWB7QjzIJvLPIiC9nMI3YDwGu/xC3R9kWZqEraop1pBmYwyoFBXO
	 OHyI+htDFmoxFkM17Jy99lpGtLW9UJDTYcSYlnI7ToQWdcEgVhTuWlbtktqYOCHnu0riR
	 6semjBiolwPbTayrGkWvN0IBXB/b+s3MsD+F+m2pXUo7cpuuFCKOf0PinWSQhhL0pAe9m
	 7V/fQWEAaIIQaH557SxzEr1frfIGL5n0ncv9YAdfIU2SkT5VUrvtNKbtTJfDUz8+64g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C988606A31C;
	Wed, 11 Nov 2026 12:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 581e9d14ddcf11f19a56ed5b684f684d-20261111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bcb93d10-3a6c-4beb-8c34-5eafc1376293,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:ce4e2207df1264bbae1f97dcb536cf0b,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 581e9d14ddcf11f19a56ed5b684f684d-20261111
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 148736116; Wed, 11 Nov 2026 20:56:43 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Samuele Carli <carlisamuele@csspace.net>
Subject: [PATCH 1/4] ALSA: hda: cs35l41: Add support for ASUS ZenBook Pro Duo UX582ZM
Date: Wed, 11 Nov 2026 20:56:34 +0800
Message-Id: <20261111125637.1046581-1-zhangheng@kylinos.cn>
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

ASUS ZenBook Pro Duo UX582ZM (SSID 10431A8F) has two SPI CS35L41 amps
but no _DSD for SPK1, causing -EINVAL on probe.  It matches
104316A3/10431DA2; add the missing config and prop-model entries.

Reported-by: Samuele Carli <carlisamuele@csspace.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221981
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index a2e6b3024820..ab909218d0db 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -116,6 +116,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431A8F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "10431B93", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -587,6 +588,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "104318D3", generic_dsd_config },
 	{ "CSC3551", "10431A63", missing_speaker_id_gpio2 },
 	{ "CSC3551", "10431A83", generic_dsd_config },
+	{ "CSC3551", "10431A8F", generic_dsd_config },
 	{ "CSC3551", "10431B93", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
 	{ "CSC3551", "10431CAF", generic_dsd_config },
-- 
2.25.1


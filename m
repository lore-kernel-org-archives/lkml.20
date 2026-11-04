Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807579;
	b=th5hXiMhZJnF8qHPXUcSoLQ4/xDu5vGRxCXiqKY5WXmRs1PSp/gAzWxCQ1YP1zk5DgyA
	 eFbCrMqAfgiVWfaqqyozzxawwG0u2q+72fsg/U12YzyQRDia805FX1ERiNHhuFiyBJLxi
	 WAYECagwNE0h+731DDhLacQWumfhi2IYv+Mvj/iofpzwlGg25QA85KEVlfR24VLITWwPP
	 ZbvR1Xls9PJMxnRsPJAjYI/OP+GPqZONrijCQI2Patz93k1id0mtMIVQeNsaMmGfXcLzI
	 6sp67IDtsvy1+MuiDgzWuhmW3DcVCTb2pmXDU3HSls009VrUmDbQgIWX8wU/y2pyJEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
	b=5Ywb9Ovk+QqXzmeWdabN8Khf2Zi5BySQtueqEzHuhFe22tPE6Q+yxAcuMn2Ax1f6AmCT
	 gJiL1SRPK5+ny23d54SHrB9TQtKqctZtVuCMnsdm92BnlF/APE9Xs4dV8ARgIHBFo7SBS
	 UYWV6WMkOMZyqRXEB3eaz6tXpI7S5xGB2pVDc+exsbwEryOGu2pMuVFq41A5AERr5C2sZ
	 qVxWyU+OK8e2T4A9HJEoe3Uxiw+cN466zrE7zdnB2Jqv+5eYp30i9CtX/itm+6coGR6dL
	 Ba34nqaaWKWIpIvqiUotbhA9rc8nsmW9Zfgyrp4QPVkd4qWNdunTYDiyOEFWw7iKg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtcVyquT;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993DF606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 993DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtcVyquT
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so1186378c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807578; x=1794412378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
        b=CtcVyquTr6+N4YxeNE1icUlUuYpEut71zh0KAiG08MvRYHh/zx7H0AQyGO3ldl9y2L
         sjMk39AQ6lmdSlyRTof8FI/kdkmNkcssQ4e18jjMK/K2JwZh9amyOUfPoh6qyJXXnT1M
         x9SjMbl3R/aWlP3hJZNzx6J6yEe0qXgk2AfYBvYSY8F2pZntcARNWOXNDRZu5VjCP560
         HsR9SsDo3cxyd2W7srhAU11cYP9M1DU6LeA/qRSbW78sq09Ygy9P8JpyVwIYr8ce58Au
         G3bXbagR8ons26Yovp7je3Rsfhsp84q2aBFrxRsJ1rcl8kblC9E15lrTk2pRFB2YhtXN
         z9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807578; x=1794412378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
        b=olKLlZvKk8tGmYTtmdeSk9r3KyyFmJqeW+ZthhWT01ILELJ8SNsik95S8K/LWe1l7v
         QpIa7x8DL4cH8HjY32zLA8nROxoEEd1GtQwCesSgbZ0vrK41GsnITVW43AbnmJQ2uBOL
         hdminHPrs8INoSsCg8xnf9f7k5bIlefRvUapw5czrfj6g9LwjrfR3JnD7Rzy09Tat67L
         vSpYrGTXut4SMnAmHDV3ORRLHnesEr5KqiBHxXLpNGo6RkinLRcbyT5my52kv9Ujo/DM
         CPiyizuJfme9up0tY8CEM3XQB6h1JRPC5L6UolgB8OcBd8lPGRs1LHgXsmnmhNS62KPj
         vGaw==
X-Forwarded-Encrypted: i=1; AKwUvBxNkub4roMOATfBE5YFrnHrPX2XhfC1UQNQOd0fFZYOYK8A3RofQSceuQSroXwwqZtuwB43Q4Qh22t/mtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sW2MqB3oU5U5DnMp2VRFsBw0KORJlREp1mVvEh/TfpEu32sEu
	hND+IZBTMcK1IOrRJP1CaU3fyQusxT0QVUyZNgMyMFcYRkguqK8RYVWMApYA3w==
X-Gm-Gg: AYBFou0HLVEL49SAtDRRiK4W/nU7r9NurBe5NTKJ8PZglgC8v+j780Raom9OOHFp0EY
	X4GGihnbaKV3Q0RswcK2UMx9quFAFxT8N+GDUj7G/c72XnjKp9DRznIbdIIJQ0ivWX9nNeeW+hG
	/weucXRrh8w5KdnLXgNYs4O+TsHPG8nmg0i5YlnD3bizp9d6pfL/pdZv1IG8DmClXc/eeGKwPrh
	nx3Q/eKwu5pNjunF6sEwjWmPEmuAZsdo2ySylTILKW4vcxwPw5sZJ9Xjsee14YKm4pChGnuFlAD
	Bqj/DpMkJEthzCIEZSHe+Y1jje5xsKycRoy/wO7cx7qNwgpGd8xqicZquzurTu96A9wTJE/ihPZ
	PILVmsoOE/AZMKbhtmuHmw4/PD0EnwQ2aD7Xo9feeLJUnYgcafrDrSHc4xlPPAZX5zL3B33KVzg
	t6t+kOfQ2fOa325erQQgokV7AfUiui6zPllf8eKVgBuOMui2XupCleCSgOBvtN4jPkXCz0EH+gD
	rYJK6nR2dDN1gVto8GwErHnNwRDCgz7GOdWAsyIYric6Ww+wLtKQEIS+MP977pbtMlYmdpku05l
	yl1Y4KLS6OA1AbbiH4yAv9tvOjeYl9eAskkR8E0Zh0BnhaV7UVk=
X-Received: by 2002:a05:7301:786:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-36c9fa51d40mr4982176eec.23.1793807577494;
        Wed, 04 Nov 2026 07:52:57 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm11038595eec.23.2026.11.04.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:52:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Validate device type for dynamic minors
Date: Wed,  4 Nov 2026 15:52:05 +0000
Message-ID: <20261104155205.3378-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Reject unsupported device types when allocating dynamic minors.

This prevents invalid device types from being registered and
avoids unnecessarily consuming available minor numbers.

Return -EINVAL for unsupported device types.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/sound.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..32637c40df05 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -184,6 +184,18 @@ static int snd_find_free_minor(int type, struct snd_card *card, int dev)
 	if (type == SNDRV_DEVICE_TYPE_TIMER)
 		return SNDRV_MINOR_TIMER;
 
+	switch (type) {
+	case SNDRV_DEVICE_TYPE_CONTROL:
+	case SNDRV_DEVICE_TYPE_HWDEP:
+	case SNDRV_DEVICE_TYPE_RAWMIDI:
+	case SNDRV_DEVICE_TYPE_PCM_PLAYBACK:
+	case SNDRV_DEVICE_TYPE_PCM_CAPTURE:
+	case SNDRV_DEVICE_TYPE_COMPRESS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	for (minor = 0; minor < ARRAY_SIZE(snd_minors); ++minor) {
 		/* skip static minors still used for module auto loading */
 		if (SNDRV_MINOR_DEVICE(minor) == SNDRV_MINOR_CONTROL)
-- 
2.55.0


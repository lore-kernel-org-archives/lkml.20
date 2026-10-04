Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87693F65EA
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139601; cv=none; b=eNz2nGs1ygUL8Nm9k/fME4CVs276gPPxqNMEuDXDa1otzew3VxgBjA+bxpnX+g4UI5FzhpGEZISQ7MN9PfuisAcVt3Uymv2a1a1KGhC80AhrSn8uC6K+KzjACGdJmY7JdFgYBiI0Z0sctGqvkeVK2Mr/SXB96kOlVJALBh3TVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139601; c=relaxed/simple;
	bh=ZEhDPZo7Pi9t2F29hIlWPWIq/RNbNj79JGslseqy9NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm/I2UjA1NFAsKn409bqAJ51V+D2qb85eXgMrMYTIu4UyOoDj5gYoRp8fcyP99SWDxPzAJQLbU7gPg2upUklVjHZ+C1c2xYIcdWYl1qmZZjl66jSDA8fDuMlL5CxptK/iFHcCpXC0VH/c9zkbex+yanblK4Z8bbmqPczRP0CFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VITKVTdR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VITKVTdR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso471195f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139598; x=1791744398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaKQNPs1qaiOc1buy/JrU9ZbzGwKfhNY3I1FClEqH18=;
        b=VITKVTdRfGf4qwlCNzWbGS7Df67MlJXxrazzg11XpxlO0JD2+SHVUr5k+mzfh+LtIF
         QD3zubNTjlI4gpTaZOg/3KO+47yz7veliM8TfozruRggD1/fntLZTLNbXyZnRd3Munem
         IZBEfrSPQ81yZwLdBvqbP/y7AYl5lXDBcS8upifD7pL7mYItr7/vGYldd+HcnkwFwkQV
         kWeryncVTpIu7wA2M7QzfG/pGzp2KLpcwo4E/Kytm2xxNHboE3VSeqK7Z0wz2MVGbWr1
         oC8Vr7UcSNI23Xob1zv/e52ZRXUVZcShC188X6JQxdG1mMXdMHZx1apbC7HtAJh5OuHf
         46SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139598; x=1791744398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaKQNPs1qaiOc1buy/JrU9ZbzGwKfhNY3I1FClEqH18=;
        b=a5JSGOVlB+apnFkw7ChDCDnVaAx5VuhvipmQAf+X5QHAWOpy4PrHoVcSpPAKBek1M7
         29vekcRJeJ44V6dCM2pq6HeGR4MFSQVO2xPFTo5EolwrVRZK6hNkYfOkOEKs1SHTXTUW
         GCHGXUis1lLEDrvantexB59rInRPnCcaqcgTlTREiKJDyc2HAyk2ZtXw77hYcZFxZsGn
         Q24pDvicUUV7eOYhe4Hl3rFdw5OvZ7iCH3B7GJeYEZmXlN5f02P6RFc8LYH8OWhlYy7z
         1yj7KRcVK71/xyJJqRSojvtLIQI5bbTPPFmaBdjPid7wwZZXgnR0VrCPaTOypsR/XSHL
         AWSw==
X-Forwarded-Encrypted: i=1; AKwUvBzpjoggJCnsN8uFPd/noHu5nwssJjXwfFkU8p35CCzlRZ4qbpi9tvMLUjrhu4V44ewEmDKue1zkCQz0hpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqu8ClPcGRcRfwwrBgYG4H0L8v/oxbZFUTpl14ixwi6bY1kjhf
	m4tpesrMyAA7mGwjQp3mm8G4VP0DG2lQh+jsSA4v7fJjsV9iSEu/VJRM
X-Gm-Gg: AYBFou3fJnhVzyDTktysgi7o5DUwUsAq+EJg/pCKS5EVoregMcouvFnfMSMe+7wDC7q
	x1FCBOrf1bDi05EA8ZY2GBIA0GSd6Nqi97lTJGto4fKHQwiNFYU7z6co52gwNvyel+7jBQZsMCW
	Ir62+2l49EqWVV68RW77NOyiRYOshO7GmaE9eQjDjAyaA0LqDe6JN9ApbWXx5nvSzJFB1dR0Fg7
	m4YF3EEW82JN7y0rPqDaINgfg3m564F8gVgmvb0cLIIhku9Z9DhsmeI82oK1Sit96bVn/XgvlJP
	btAhW8SsL6R7MKxzx4WmV3msBXRTMAsMTQOUEoT6l6GRRwSjaqfPfySc5rDMnzX/iP8r34Yc/tx
	sKVeVI0LPV4mEhDdG8/TOQgt3qAwcWVsI/PtpNB7r+ptDHCpvDY6eJAHbmq1ULFEivY8g8tsOlI
	ztL5SRLV5EHEokW5D2y8aZQfzxJH1/9fpVXWjsP1t9j+D36k+awbh92x5MlU+ZHirCcJ4nawmqb
	0L8oQSOXDcnUtCDRgwBf6grzfMk2MaaRxugPF8NHT+pi9kyjkrpIsoPGxZgFTVReVuxdqp4mCpk
	7PKS
X-Received: by 2002:a05:6000:98d:b0:488:7f8b:b4b with SMTP id ffacd0b85a97d-48b12736b30mr16063188f8f.26.1791139597622;
        Sun, 04 Oct 2026 11:46:37 -0700 (PDT)
Received: from jjj-x570pro4 ([2a01:e0a:9d5:4a60:d60f:fd1a:fad6:a587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c57d927cdsm4988765f8f.6.2026.10.04.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:46:37 -0700 (PDT)
From: Justin Bacle <justin.bacle@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Bacle <justin.bacle@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
Date: Sun,  4 Oct 2026 20:44:45 +0200
Message-ID: <20261004184618.56779-1-justin.bacle@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Justin Bacle <justin.bacle@gmail.com>
---
 sound/usb/quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6176acc04..9a5ea295e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2332,6 +2332,21 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  int stream)
 {
 	switch (chip->usb_id) {
+	case USB_ID(0x0499, 0x5500): /* Yamaha 01V96i */
+		/*
+		 * The 01V96i declares its audio streaming interfaces as
+		 * vendor-specific (class 0xff) and provides no class-specific
+		 * endpoint descriptor.  parse_uac_endpoint_attributes() therefore
+		 * returns no attributes, and the driver never issues the SET_CUR
+		 * sampling-frequency request the hardware needs to engage its USB
+		 * stream: playback and capture PCMs report RUNNING, but the desk
+		 * passes no audio.
+		 *
+		 * Force the attribute on so the stream is initialised the same way
+		 * the Windows driver does it.
+		 */
+		fp->attributes |= UAC_EP_CS_ATTR_SAMPLE_RATE;
+		break;
 	case USB_ID(0x0a92, 0x0053): /* AudioTrak Optoplay */
 		/* Optoplay sets the sample rate attribute although
 		 * it seems not supporting it in fact.
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638434;
	b=VGtrPHTJJIE03BOPhDni245zAckvYlJEk4/NJNlxyH+Ib+B0S9s82eOJjYsro6CCf8bX
	 gocXzX9vRbukEcAjbg8W4BOqpDdsAtdz6rOTPWYBShVllQyEvfnPB8yf9qgzKmUok+5ik
	 RN8ntGm1PoTnXNHNowTy14yP3FGQcyRcDvyrQXxN+wkH91gnutqSFo66/dTkvsQsAk5Kt
	 DVz6PLSz6UytWvbD/p73QpRGSeL3tWXoilNDPjYeSFhc4rU7JohT3bgpxBNlqYpgxitYe
	 iF4S6ZF8C+EJqakS+zumH+qXchfy5Rjm301JjeWwbW6zcPKYqw6RVyk0zfOji/vUENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6P4yu7uY1XHER0rpA+7RszULXr82chqbIS0XERr58wE=;
	b=hHgf9MzeN0p3b3j4Vrjpvf6PcdHY3227Kepmt452+nxeSOJs/JM/IqJlonmu0T8AUsZH
	 U41sOTuoKEm5DEsQBcS90FWMkXusp32RT9qc5hQsuqXjmuPG/qYU1e7nFX0SH/VBoM7Mf
	 GNPFtDhGA8pk4QRJerFutxM/2Kxf+ARVJDfwaoblBbP0oUG2BOJB9sgqpFFsL8IaXWwQ/
	 DDnTU8a5Cw2BJ+GdxD4RzRnFhGAHNdDSdWdmo4Fky7uNmfSryXTkT0HJE5bIxIfqe8d1I
	 5VwgI76PDrJH4ZqiWLG+qzjZhwfKrJVwX5+gVcy49C00KbLfP1hZonEzfJz0XPrGHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWyRE4g7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA56079933
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCA56079933
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWyRE4g7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2796965f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638432; x=1794243232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6P4yu7uY1XHER0rpA+7RszULXr82chqbIS0XERr58wE=;
        b=lWyRE4g7MbcJRQSiaYnWMAmAuyAnyx/GKHZArn2tjAiM3GzrvoRlTxM7e5TRa4Z7Ua
         BDFqZCmdiyoUVa90o4mRx77A0KzOovn3vqutBnD/62HMDst3YvjH/jBYcWjBQCYOlXuY
         JrdEHXaFqMPlceLcz3vsAc8QVWl+mtJ83ZtH5G8YifLOJLXAncAC3zi9zpz2PFmudjjM
         M1i+5w/nnzj49wYGiyB4Cb6b2OaZzwVN3PK/0nLRo941gW5K5dJ7aC6LT6Qq2Gx7L2aC
         R79KLyzJuim3LXD0tHtXbYgsk2B+Yerh05QdxBnyVp8XjsDGyMJWmI+w4RFHhX8hqmwF
         qJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638432; x=1794243232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6P4yu7uY1XHER0rpA+7RszULXr82chqbIS0XERr58wE=;
        b=p3F0i+CrRglWm+qWlfy3/Ub/1ybHEMkJN/ykliIYSOAOAXasJv/fELsu1ptdpZzmM2
         /5hW4VLmfs6jhMcsmpF2SqOSCFI3Hiek2hIpH1wEhqu1ATp7HF0znE3M9TGhqXOw/u3d
         g7jlq8gn6dHYRZEfMRg6vuHwJzLBa6BQtLHLCdGZlOyuBUd62YvhRiXOtkN0FO12iGbC
         rIV6Hy2Xol/gcvd6+nMTjA0yeZ87IwH3Gf5YGCZJMo9Gtgj9qVD+dTJ28oCJLoR5gSkh
         3AgtIa7n1/iGw7QVMtcASgebPmtXTb+3WpO9w3kK5mdNzuyIHwKGskUomHpmmpEXis3D
         PDFg==
X-Forwarded-Encrypted: i=1; AKwUvBymObM0w2mCw9XeDH2HmqrYOSG4u9HiBQyPpkduEHX37fMNAxgYb7oHpcbHW57+H1FnhHiglnwmAh3EGyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/96xkij5Bd95ddmCV0mXXMh9M+CZF4kmdMMO8LZM6YXdacsrVt
	KfybDwKBHfgx540utQiSg1CBZU3e9ul7hrVOYkiD4hjmeSTvvDEjGsk=
X-Gm-Gg: AYBFou0SlAVMpujO1vfWuxMjofesECVgJcACm5T5ENUYqGvaMXEgZ/HVluacGEM9aLu
	mS1qa2eVSjDwWDFprSHVytSi36CASQneQdmBiXGTgHbfRuAS+xTDj8PYZu+V8J+T4GzIn3P0bYH
	MiSpJTRJBDXL/a7eCTCVqnyb7Bw+l+XE/PFw8Zm4AIsO7r0dyCPFiu4JTTynZLM5AZXg6GkwkkE
	SlQWq5gMdOel66d7mhwdglAVW5jh3jGlrPhHRXCiEoUPJoNnx+g2+P1a64qo+lboeQaDfMYFtla
	O6Xlnh9QAV1nk9ACQ2ip6vRWueaidKY/r2Fcbw8UUwMbKw+9TG7xtFQjuBkSz28zzB9nMNEv3gU
	rs164eHi/3XRpaK1btxoLYGZ7Tud/QFGvyTc08Ct0gvGCtWSd2AKfApr4mHnymGyVbtai3tFW4d
	/RC6Acrlbwt3lmBwz611B60Ztl/WCi+gh2HuvJjOgxbkzRg1KajvqKaKkgCKdB6DL4IogKcJIWT
	+DmJ8plf9eaJLYyXUxkmQ/sfmiIP1ygnuYLme44+iNnz7rXNNLrk4yeKyjLkndbDcSRlwxzhw==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr22387436f8f.17.1793638431954;
        Mon, 02 Nov 2026 08:53:51 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:50 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Date: Mon,  2 Nov 2026 16:53:40 +0000
Message-ID: <20261102165340.1558853-5-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102165340.1558853-1-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Cancel mic_work before and after jackdet_bootstrap because the two can
re-arm each other: wm1811_mic_work() can re-arm jackdet_bootstrap
through the DAPM power-up chain (force-enabling MICBIAS2 triggers
clk_sys_event which queues jackdet_bootstrap), and
wm1811_jackdet_bootstrap() detects a jack and ultimately queues
mic_work.  The second mic_work cancel catches any re-arm from a
jackdet_bootstrap handler that was in flight during the first cancel.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v6:
- Add comments clarifying why mic_work is cancelled twice, per
  Charles Keepax review.  No functional change.

 sound/soc/codecs/wm8994.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 6b91e02f130b3..6a790479c8a7e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4595,6 +4595,14 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	/* Catch mic_work re-armed by jackdet_bootstrap running concurrently. */
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4636,6 +4644,14 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	/* Catch mic_work re-armed by jackdet_bootstrap running concurrently. */
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3


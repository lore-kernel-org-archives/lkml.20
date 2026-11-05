Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888641;
	b=nf8Dq/4sA4p9/Y+5798SJudJhnMH8cR4Dj8PAY0/liACnrLjzB+USGRfILT8N4JL+eRZ
	 jahCyPwj3DRHTBzWTm0Q5IdXxTimLuF35CAH4iWs6hG3KffHtE+4lT53h3Ts0p88DVP4Y
	 2ETRYaqhNEoeL5W62Ybaw73vWDfrWuk+wtpwXpXSSoJJ5UygCkLQ/azRftdKcAuT5GGLw
	 ct5G6NpzrT03J1eA80VlzQKsmfkLtNpWwFYSuDZCPuhg9XPYGOFE7bRymmc96FlDnmVaA
	 zq+j20N19ftT8a430H0wKj7rKtfhoQexq+6SSe72GDopwZtBraJpaA6Do0rw9NB02FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
	b=Tv6wfVdQvHOSlxViAQOT2x2zjv4nhQX+3tNrgD/CjYzaTuTVThR5JUhQH70L01MXI010
	 FVOufLFLUz+7x8x/zXZTxgLBkvclLnINYJslozuYYlXJaP3/yNrPJbcfBM/nrT3SXQlMO
	 EBwXtrwFz39K8xWobTYQnDEzoJqLSqcmkHoH0GUnYFNaN2n9l602UkuilCS+7O/aBnQ/L
	 JZ/msO2JObI4kOxDkPo7UTNC0M+AjhkWjSiyofA7PeLx4B8gk/kOQCSxLhtJDz1vged9C
	 Y6ptOmRhDrtu8XqAVgm0C7AP0JL3pe11g9Lry26RH+dBPIhqB/dAaCLu4mAxUMX7eXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y04u5yar;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED25606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y04u5yar
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b1ce85287aso1689308c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888640; x=1794493440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
        b=y04u5yar+ota9q8u5eNlPttlns6OnFMRw1W5d6Vv5vcJIs7lArjDZIxxvflGcbsLCU
         d4EYFzzR1zTkec9q1Nc0gtR08+VdSxlB3Obapafg46lFbzC8eymdFCzPD8B9e+WDIkZy
         O+u6Hsc4aV7tyXs6rvd0tZ0vi6HaoKoS5D1UkTmxSZoR500AsKJ8IB6lcbe7DXZ1LDz4
         hTzjHU2eAIJOor1hYDb5KRS8mBd5FQFQi6VylEyJWU8dOyyEtluM19MI4i8VCsTXfVEk
         +y5hdeOAsYDR4lpYCwUavYc/PlMr011Ng1i3RJ1HcSAI640+mVY7T5sfeyWOjxHfkL6j
         mRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888640; x=1794493440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
        b=164skjjwqYVpZBrz27BLCQsDtBKlbMw1NU3hBb8KenvIZXVRZhXR+vTLQKKhOj2snr
         UJSMbK1S+tBCHJTWZAB/nheoHkW0yOoqnNaJjC46Ib1oEIjEpTEVJiHflpBuRDNru1Si
         H1mU0Wm1jY4gbEH/xP+XA5vfw+lpPtFUkUxa9IG75wDm8KdNw+0QCeZTMfzb6v7n1tcr
         huoDs47j9tpXBID5dalEWjgT7IVCAvPO4I9ynoF+XH62+cQ8NFyKw1p3jRM9hVYIXvdA
         6F2G1cbR0K+xeJlQ+cuiV7uAiQgOzV6dRY4mdLoz8hCphQgoUl3Q2TlSetGlW8w+jgWb
         j/kA==
X-Gm-Message-State: APuU4Z8NCA3onJrgNTPAHWv/yLC73PAwjrd675AJM1SIphUraoX14q+s
	bmvxRlOOuzqgR8vavO6ToqNgFOrWImTkA9b96pZI8QVx+shCuaPdun01
X-Gm-Gg: AYBFou26lUrSWmkwyRGi6RWOsuQIX+69MjLviM/hFcRlJ1ghXp12YKkp2aTMCREBoEK
	6dKvDjWrge3RYyAKEdzkHgNLrwxKe8EQ1tAwlZRKWs84UDtbX514jNMPArDuuF+RNiewXmU0XsB
	gX2LyZVEzjh8UmmXw3EPQuxAH9VnXZGiS0k7fLQ2rb5EuGkWiI0xFNNOgGhT5yZs7Ro5uwLmn/M
	+CTtnUphS5pSOYaqsSbNdNqv0Sz8IjymB3+uNlgb7jeLU3UvvUWo+7XPWP/DcuWRBweRXPxNLlj
	BaKjQjPYnNMviT0Ib1hKYHQbFEj/Ot7bmTwbzARrnS2FktsxDV9Zt6DT6hqdS0SorJR6CbEm4hy
	IZhf79/ZW5dxW2ihQqdCJOJsfT9OcuTaAAtym48JHZkysD2wx71W9kj41wLHwHfcADV/G694AeT
	F5g9pTmjTwCtLtDxmP5dt/vLMIfgJDinuVlSGCa1uDI475H//IqvEZXQ8VwvWE3VgeNuh3TagM+
	KYro6TpxNSF212DVO1b+d7CFNkZdoLoT+dgRhJ5Zec+6pwq4INr5nXCQWS0RUT2oTT2m3NRDzml
	PB8+J2nuhDd4zA+beN03zv82fshvNdnOKouzpUzA7J2IHno12cQ=
X-Received: by 2002:a05:7022:f50c:b0:143:297c:276c with SMTP id a92af1059eb24-1aed79b3c1emr21779081c88.33.1793888628767;
        Thu, 05 Nov 2026 06:23:48 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm16467801c88.23.2026.11.05.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:23:48 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Thu,  5 Nov 2026 14:22:26 +0000
Message-ID: <20261105142226.3079-1-sreekuttan2156239@gmail.com>
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

linear_transfer() checks the available frame count only for
the first destination channel.

Check the available frame count of all source and destination
channels before converting samples.

Use the smallest available frame count to make sure that
conversion does not read or write beyond the channel buffers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
  Add missing mailing-list recipients

 sound/core/oss/linear.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/linear.c b/sound/core/oss/linear.c
index 6e51cfdca238..7765ac0ec400 100644
--- a/sound/core/oss/linear.c
+++ b/sound/core/oss/linear.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/time.h>
+#include <linux/minmax.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include "pcm_plugin.h"
@@ -75,6 +76,8 @@ static snd_pcm_sframes_t linear_transfer(struct snd_pcm_plugin *plugin,
 			       struct snd_pcm_plugin_channel *dst_channels,
 			       snd_pcm_uframes_t frames)
 {
+	unsigned int channel;
+
 	if (snd_BUG_ON(!plugin || !src_channels || !dst_channels))
 		return -ENXIO;
 	if (frames == 0)
@@ -92,8 +95,12 @@ static snd_pcm_sframes_t linear_transfer(struct snd_pcm_plugin *plugin,
 		}
 	}
 #endif
-	if (frames > dst_channels[0].frames)
-		frames = dst_channels[0].frames;
+	for (channel = 0; channel < plugin->src_format.channels; channel++) {
+		frames = min(frames, src_channels[channel].frames);
+
+		frames = min(frames, dst_channels[channel].frames);
+	}
+
 	convert(plugin, src_channels, dst_channels, frames);
 	return frames;
 }
-- 
2.55.0


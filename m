Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638432;
	b=21lCRYmKrMQ3cDjDFV6jP8ieky0NR7ri0UCiIoEktziaVrcf/sobq+QvfMM8F8895d9z
	 r/sWc7ARRB78Eg1K9Q1i+mUbjNGSjETP2A6/UqfGBg9AaOISg172Wnjm2eddlfkw8Z2fN
	 aPPIFHhSPU+x52Wv+Gw7RssB7HlzlqdWW6uzCJ+eucbZ6nSJTp4pkXF7DCzVHU5U2e5/3
	 a9e2JXKr0Vr3xj6/PPOKc/Pz8l6ILAVv8yma2OzVjscIAFTYkZ5pIlYw5cLheyDTZUK3C
	 pwluFqqWDiBRw0T+uoh75VxC11rknd39V3VYuPuDPRKsAUcI4LyASpmW6Ys8MEv1A3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
	b=lcdNxIR1VOI5WyZsNWeBx9HEtxva2k7Y+JptcFZVt24oq7YAvoddhaNiCe8D2ckrzqa9
	 smpWv5AFo4Xl+Ntw3j37DkRZk5qZym9+HMffgi3TyAqGnZj+NYwMbCzPXyqyGFKG48B0E
	 ZK1HzQgGVn9s6wXg5bsl55QaH67WdJc2vpQuAceAw/Gak+wb/3lQCoAcTQRl5+pORl0wP
	 X80Aaefg3ddM09uejgeUnulZ21awi5R+MV7kJC29/Yc0yQm75b+2chSwKKJkVW5PyVWaG
	 SeHnhUtDAH1gwC7cQWgD/lw+2G5DDFcnTYaDUFT402DHLTWrPNZqdmp0/RSa+KUNbRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWGSDNLL;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1F607991E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF1F607991E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWGSDNLL
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2278286f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638430; x=1794243230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
        b=NWGSDNLLPH+2cxYHnjacGqyQ2u8p5nMXfGILetA9gvSqfFXJVOIuVfB0WLP7qg567z
         ZK6WfmQ6c4giLDzbEFKOsAX3ZfZfXQ0uG7JFqklr5F85wOi+G4YXUrwzA7ij2/US6TWM
         PQknLieXayUVHYyTtjIN5RwuO2iqB3dQF0wyAjtXqKvz94EA7Avg6pO1wG69RsZFnI1l
         Z+tFOgU0UEHZFep040jTC5Fo33ePSGa2kqi714wQYOzJM1924OENq0Ew3vGM8d5WtYB2
         bGzDOGBJ6aJYWEdUHhupISXNA8jlUV+JeEH7RIrud3dMFPry1OB0AVeDbiFDfVNMN8tY
         gIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638430; x=1794243230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
        b=oFfafNyCT9xrqBM2YNNVgd6EfHI4w1ntAlgtaEl20j7GAglnAnbotjMYnitwwzC1qB
         sMIXrwbydKa60xpYfwvsHEycQdAtGn3XPF/MNQgnikykIIHTozdmwiO15jN3Iw8mS4/p
         wPzhXy4pj2tWzyaezxjXiQ2W8jwPmEHv9QQKAm4YOwt8Rq2qNqAKnzUNTqKzTNJLc0dY
         +f1QRKQ7L87AC6xbgchTjx4OnmvX6OekbQU9vkHS4hN+k5MGb+6Mx9zy1DEfbm85b9QL
         KXz464WszsxIheK95LuNNETN5G1RdO0EfbSJNpom02GRzyoNS9tWBAHnfAh1DPbHfyuY
         jTUw==
X-Forwarded-Encrypted: i=1; AKwUvBwnfYKdR/DpZIOw1rH9g2TzzMI2krYhUSX6YAroGBV6V39YbTW6kmqPaXhrAd28OYkgIOVMI44lLtBgiY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sYq5e09ElPMsLJNfXJNMTW40azwPRhGkZWzJFn0Ae7W+pSTPD
	1DQeTnx9p/CFEZmxnLLFl/xoaEp4uSUkNkofavaqPPYt93e1n2Y5LzA=
X-Gm-Gg: AYBFou0BW3OlIIQkbMjgCeqVuj1ejOUviZ6mqhgho6UI0lE8CxVRa8d2jv2rqQw3ndd
	NYIFqxQXttnE0p04DaEU3ye02YjMAYmwG1lsagGgCmtPGTcChIDcQWl6t/bejvSJHQ4cwiHdyrB
	os8+A4Qexn4g8eL5H0sK9bnefMP2RA6bjUDeFxW+AOSACfwOgRmvszDdrLYN5yOPad++QfW2w+/
	bsi9ulDne0JkorOyt0OsWSnyVIVtEqQf2bKKPrOq78Fe1Q9W767U9Pc4Ih9A2Wq6XtWwHKg71RH
	JJ0BW57AmlMaiM6HAM/WOIIPJTteZIb/WPZFQRFbOcx0RJWLTUNgxR2trIyeEYBOLmHaIc5pNvA
	fI9P4GVt3DieamEJbGc5JQTPsaOvRoUJ/Uz3bjtZKBTNT1DxHvelo8ubEHXoDQyrnvr8WEIq5Ib
	oLbS5xi16HCT3Gqth1gbQwJVX6k3p15WUoxzRsb2oQCigVpma5uTNX3lIzr1K/9Vxto5SYE34Hz
	Ca1f9oE5Sk7yS6zAGXjJrHZGw1CW4DJAtj6RnZltmYYEwKByYPUCdToH0AmacPvIzhPemVg8A==
X-Received: by 2002:a05:6000:4202:b0:48e:6159:8274 with SMTP id ffacd0b85a97d-48e6e4f500cmr23446011f8f.27.1793638430339;
        Mon, 02 Nov 2026 08:53:50 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:49 -0800 (PST)
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
Subject: [PATCH v6 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Mon,  2 Nov 2026 16:53:39 +0000
Message-ID: <20261102165340.1558853-4-tristmd@gmail.com>
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

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work.

Free the IRQ first so that the threaded handler cannot schedule new
work, then cancel any residual queued work synchronously.  This
ordering prevents the race where the handler fires between a cancel
and the free_irq, re-arming the work after it was drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3


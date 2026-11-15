Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743031;
	b=YkzAS1VROyaKpMZQzqZSY1GeUeb2MKygh/Hsd0k0mMK9OMj3yBfmgbbGX0ENtMH7ng7k
	 x8zKAXogjqlVvq1tGtwDj7kpB/eXEsikxR8fSHYK+iYGIZu6F8Y0iyB6DKCtc7fxFzpnB
	 Gns7+9bvsgbYnDwl89L86orGoe76aqnj7qh4AbC7c2Ultybog7Llm+ZpIzUcXvXdfZREE
	 JA+8jY9S8MT/Wc5AC5Rc+366UtN//meBpK8s0CpmpLMtKqfRTW8OouCmp2E80GtAiTJ35
	 bq1Ng+UuRU6KUhT7Ywlv+sNC7pT1HHEyrsYCO0AXgndD0X6Nwfo1rnLYGl6kzhmk8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
	b=o8Rk0bLKIUlM+Dihs8dSFwqPcRzp7hspDQrSwmH5pphoGR5EN6isKvkFczI7ifq3sOVQ
	 J/fHDK7FlovlGHYA8ssmxEKN3InZlWjSFSfGPJnkuJ8+twNQ0WHb36g0w+uJmTxIJQJlG
	 kYzn+Aj7Yqad9pKR98cUvVTbrM9nXElgyGxie0GyEjGFBolgn91NVhsUMA0fq+/H3DFuP
	 2y8wPOnowBHEiv6OGpQpQbFv7R9Ncd/rI5QLTSGjZOT8L1fHjArjF/9McL4iESBkOAaW5
	 ZwVlNo1CP85fNlpF0bM3iqRYova4raJnAOTpI6huDRIGF9Z1lhxM8Z3K3gnK0RC7O9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN570IeF;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D0606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN570IeF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3304174eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743030; x=1795347830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
        b=xN570IeFdWn17Jz1ucA2i/9F+gQiXj7aaQUpaqDnL9XQIsspqpYcM/RplzDeh3Yjat
         fo8Z6vJPuYY41XePwu22ZRxRWDOyPOh7tdXSv64yd07M3L+vShJaiTIWa5XhPPKq+rEu
         2T/VYl0fZO3Cfhi5YOvdkE/WzzRY3DRD48gsEC+ZiruDpiBKwHdq+xe1Qq/9sc1sziva
         H0HH5xu8TpeRKXNwIKywb5muv1IekvrX8Alh49G/FHWeDJSv7UZltMCtZdu66oRnMQkh
         d6ZJcrHyMJUD7ja4h/GP2eLF8h/BonpP8w/DdQfXT8ndEDbYkiLENtKusVaz99GNhUQC
         JjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743030; x=1795347830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
        b=F53kOn1bXS+vXEg/MENC2tP4+FQTeauxUt000+AqdsJ44XgXUtmZWPGMnU9fkW/TWf
         26QE7DgBqHkUwJkK8tR1ERNnjW2W6Af4jbIYovtINguqJqTDRGPNIWb1JyOBVHrUef5d
         +v1KEqXBiGkGB6Lx7n2ouigMsIkCga1uLiRZcWc8jeJXPT2zWAWL6jrvbo4uO4oq+xHt
         Nz6Wuk8FpA8fv8q2oiZASJ9CSexNP8RIRlR/jPeV1cz7ypXdmLCDDdKSsIhLitVuyO03
         BTqxay6Avo42QjfGyhOvqKSJV+CmpUVU35TL0PRcLz5lB5WrnEw5OJSg1+uu2R5zpN4c
         S37w==
X-Gm-Message-State: APuU4Z+/TJPjMOjb7MeM3i0ZAgrNVLFGipWp+wkkEP6FXN0XZBTV29Ww
	UglgjwZy1IDcVJkiVDHxGCbQf2cCqNbt+ixrXXZa06oehRDb4kXryGCT
X-Gm-Gg: AYBFou2BoSky4agN/a+5gC2FTILIesYT0F3D9/wZvFEA8gosxovmcP4wGbJ2ZeWEjPn
	uUbaI6ilNoM2oFYAkI4wwkgRL134bUpmmehgNnq9SDKU6rAOoUqURQkR4G5OKdjtwT3g7WhImpE
	1a1VPaty9l1SlZpaYyvYx/ijtvuXg9vpHCW3SRexiBVgD+20eG5UrnFQh6jxl50EfLNe6vx3USe
	dkhzQqNbk0XAzkfMMyeongj9gbqwUrYPMN3ZezisTJZpNirlmqPnmk9Vqylh5QyiZCgTy8cUm0k
	+7UEepQqLVE6CV9IDLhBY4x8mP4gts/NOHBWMvlJHdEusbeq8KOWkBSlW8kxvZsdxORrXVD+Niw
	C3JSjECDh99TMbpMo1oqu9EDqsb9lR1aIDWZnstJXMU6tiLHOIqRbIRXpRVScEifcIOIoGjvp0G
	3XvWhoIA8LvaeHeMQtD4X7MpHR+Rpz9aIlTxUF1F8iCa2LzhLzEFbs/HIqVfQiqlmFryFTeq2BG
	ZqUqHW5W0Qf2+koD+0yaj5yH5bZ7sK1UtoSMDZE70koqAbcLfkNygX6pr8kz7H0T9/8SwNG7oyq
	QWghoZ1UI/jkUT8LzX1xApmNqUVAf3zDVV9xo1bnYgzzVszVj2IN
X-Received: by 2002:a05:7301:da09:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37967506836mr7857848eec.14.1794743029961;
        Sun, 15 Nov 2026 03:43:49 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm35852392eec.18.2026.11.15.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:43:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: jack: Fix jack control cleanup on error paths
Date: Sun, 15 Nov 2026 11:43:15 +0000
Message-ID: <20261115114315.3679-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
References: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
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

snd_jack_new() creates an ALSA jack control before allocating
the jack structure.

If a later allocation or device registration fails, the
function returns without removing the previously created
control. This leaves the control attached to the sound card
and can cause invalid list operations during card teardown.

Initialize the control list in snd_jack_kctl_new() so that
the private_free callback can safely remove the list entry.

Route all failure paths in snd_jack_new() through common
cleanup labels to remove the control and free allocated
resources.

Fixes: 4e3f0dc65883 ("ALSA: jack: extend snd_jack_new to support phantom jack")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Initialize the jack control list to prevent invalid list operations during cleanup.
 - Handle cleanup of the jack control on all error paths in "snd_jack_new()".

 sound/core/jack.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index af2dc2cfbe19..c35a92390527 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -487,6 +487,7 @@ static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const cha
 
 	jack_kctl->kctl = kctl;
 	jack_kctl->mask_bits = mask;
+	INIT_LIST_HEAD(&jack_kctl->list);
 
 	kctl->private_data = jack_kctl;
 	kctl->private_free = snd_jack_kctl_private_free;
@@ -555,13 +556,15 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	}
 
 	jack = kzalloc_obj(struct snd_jack);
-	if (jack == NULL)
-		return -ENOMEM;
+	if (!jack) {
+		err = -ENOMEM;
+		goto fail_kctl;
+	}
 
 	jack->id = kstrdup(id, GFP_KERNEL);
 	if (jack->id == NULL) {
-		kfree(jack);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto fail_jack;
 	}
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
@@ -607,8 +610,13 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	input_free_device(jack->input_dev);
 #endif
+fail_jack:
 	kfree(jack->id);
 	kfree(jack);
+fail_kctl:
+	if (jack_kctl)
+		snd_ctl_remove(card, jack_kctl->kctl);
+
 	return err;
 }
 EXPORT_SYMBOL(snd_jack_new);
-- 
2.55.0


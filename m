Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758712;
	b=pI1D8NhIRiyZvXsnDmaNy8zqLy9yA1VRPXsVuuyB2zFK8uCrLMtsoHj6sLAQo/Mr/vbF
	 qH21UtLqo4GLPYuWVkJrHJ/9FDRfEYvORfH7JgTUm7VcTN4I+RMO5gbF8ROnHnhGLLKOS
	 WEPa7HxLIfcMMXpl1tzreS2CUPq4gHclb5kheuQfhdGSElGMMoQQ3/MXF34l2KXHubwvk
	 y1SFB5e24qVla0HEpJ5Vy2vU92r2XoM0BAc7u4plweGz/PHm97JUvBmw2atq6+pPncUDJ
	 8G5g5ujvhdswLvgus+I9PUXQXHwOCA9csirWy5mP18oWYMOjmJZQZAmg8F+OUghrUgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=mUUjlDQ6KRWVJ146VWzH5DGB3Fwa336Oy5ggBN4FqdeZFECzmEEhfQ/e6S/rNkdUqyEl
	 DVuNBJl3ZuT8wi+kGUTKLQo14ZTaWunCSAi/TxVsPVqWaHvZUKXiMiDk5AwTkueaKJVoD
	 h3oT62xso6QEvYjK73MAndDh1jEUc3VcV+qq7TEp3uKBk1IUk+rK5kI/p/xtFP0LjmOP9
	 OeStXwQLHDP83+grFNao6XuH4V5SaqHK0evbK5r8gvyKJFCo9fjTLsXp6EUglX7Hhs08B
	 S29ZA53ciIXPu39vamqRV0Bjdb0oEzoeh9nIWq2NCYTZ/NQWg1PvhgWO8B0P0to6DwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25616606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25616606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so82661a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758711; x=1794363511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=fPfguUdMhbE579afw7yvV4+5C0l4YkdVCezy50lqJ0iQ/c10n0crJQydMDdQ93YdzH
         Iv7TgDYD2qXMxVRm/6uCQT87M9RwTy3+4rPplgTAXu95H3uW3PUbcS70zfto+9fYZUst
         x8eeJ87DA4sH60YA8TxfT6VHk13q22eTmqeIzrHgzUi/yTo+qAfVkqG/r+WoW/81j/6/
         X3/NY8ARdg6ierQwH7LCjtTKMg5tk/NI9Aj1asEALgqePbUk2rGy3nmKA2VaLdgKa0y5
         /So8iMX7tR7xqhtBawjU92z/S81f4Xl+KR3TaSqnwjUreR89mmXNmV4olGRd21FeUJn0
         qAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758711; x=1794363511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=t7YaYiypu44BTllSBk/hms5EhBIciWTsQFCVGE4BGp+7PiH9/ki5QQVrptd23Q0Mq7
         SMqOe4RypbNgalrQK3TPKuevkFUCHou7FYg/CSJpd1+PMl4b4RtLk3tgwzu5Vb8mpEiD
         QMliabjX1SC9vWN8fN5/UyugkEeoN4VT8iHEObVJpKqRU7em7MhtkXDDYUAy4w9sBdMo
         FkLs3apqSHSQviE9Oqu7YFCdagVLmEcMfrVB3lQAxWu/OCTvOmgux0pNs6yutg4vxgf8
         QXR2ur4wVeVe9G5QOrnMyW0QJgZ/TQ/JoyyrfDr8lxuF8qLTtPsxn8rsYVr6odmScUh2
         AsgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRtvxaBO5a83U5mG+Tx6hgboG1zEXYeSAvbSNyznGvAFrlh7mq4ZcVTREVR08iMXNl7DyjaG3CHDOp3nI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8epOuNlc8twAUIiRvrBz6CCxzmmDr7HiscXP8s/ntMJPK9ta5U
	+BV942jRcBGSHC/fCgtV78lrliATUs3jfinO0CA8Z+/tNNMIchx5+B/p
X-Gm-Gg: AYBFou2GX1IoVxXq8tVtbEFx4VZq4macCKlDs07srvesRV15osWkkM/sZK6aK1+E/Bp
	6o9OOcsa1+9434n7qwYbzVUewDd2KIqwcSgQMqYfL13+np65fyxMN666GLYPNFqCdWSZIyPEWob
	QtyA1v0AnX6/zTp65OlBEEUgXyEbByru0HFt2pI89CIgEaV2a0Z7eAEkvFSvcANC8cG4Szem0yU
	36MUtI60oXQUrs7OUtrNuSWuy1xewlGeuzooPiAbtvjgbrfJP98UcQgJcO0OzN5PGpxC2Vrgl9C
	gCVM6oo41bvraKzVOfE8r9ICS4RyboAdve4GmtQpZDu/vzEQagpfLujF+x619S8CRiPOEI0+1jf
	nbOxNn+XNqogW1B+OEBaJUh6zyRy0HV1pc34e0bo0sdHH6FY20mR+/2JDbEeDDlNjxPeaEhuyom
	DGh9TRIp8xsjKYi4w8X8zaVbl7FOjjiLDphGVzOAGQpj46pGpn7hQX5KE6xE5xwttOjD1t3Ex9Q
	EFd4LwcUinLnOkpkqf9O+sZJDnByPfIN95QD/d+b/zwoDY/rNe1GzskqMJFx9JLEGq/us23I6pe
	TxrSHBhARcXWj1cgmaU2YRLYuY4MkHcmWzBJU/iR91M7zYzBmYAIbhjd/kuDVPLgemF2UOmoygD
	kEe3tmei92EI67PJXiohUBWR4z84QkCJ0st1MMfhNLY8ja1A=
X-Received: by 2002:a17:90b:2692:b0:3ac:92bb:cabf with SMTP id 98e67ed59e1d1-3ae6efb54ecmr11165443a91.18.1793758711475;
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v14 11/12] ALSA: virtio: prioritize staged capture period work
Date: Wed,  4 Nov 2026 11:17:44 +0900
Message-ID: <20261104021745.57733-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

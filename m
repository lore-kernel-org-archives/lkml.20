Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461748;
	b=cMOUqxiKkGN+C3tWqdohivGG9NSmOR17R/oMj6yQfxMlPuEMnU2Qoy/J2WgzHmIeRSqm
	 Y/7ZP3ugFboRNFQUusMijrmpybWuk2jXjAXcjx6ATHyojItekpV/olgX/etC9AwQpiKt8
	 GQ+83vUE0ae4+WVcWh9RkiI1pU/cE+h0EpfHRgKPMriRNf6iYRy6kBZ4/le48cs0aXVVf
	 RnPqTlE0viUY/EL1CcvEh6sSQlyJxuzQp7H1nrOtUoE3E7RVmxuEQcETxRrLpWm4i9cIC
	 mK0Z7lroyyVfB6TJMfcKLvYzwAjGG76d1/Wpd3PijrfltidVSACZ7JLnKo634akRYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=sOBlE3TlpNHvSkgQJzhB7wdTLLPG3KAQjuZYuJzP1ccXgBVnUUykMcOBpgnkp9iXJSTe
	 toVnnQWdqCBg+V6vVYxfWMnU2aICT3Ax1lBAx8kQAXqIXQgN/1TPyLrvqwVOjEDl36xAY
	 jw3HMnUhlvKD7WlpNzTinwyCNLY7vf82sb14+uV6Fgd9UYNd7hMMdPLEFZX1uVVTw2v0y
	 c4GaZWFAHnWsiun2UnDvgjoaHNup1coTdG6r/WvodRL/WPmIFuwfFQXmS1bw3nI8dSAGx
	 BRj/2W6/6VTkgZBQdh8VJGPn9nXlOcpcAcAS1faXr59ZNMw1gaa6mRckji/0zuJzF5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mMcXtp/s";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FE60A260C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F00FE60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMcXtp/s
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so5277427c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461747; x=1795066547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mMcXtp/smF2zc1bvpl7H3x9+N+w3QIgeSfhjTlJ+T/6oLoBVEdxdUugW6RpiSYdK1l
         K9VVP1aLlnBenyyfrP/mBAWG8vp/tuZZ3awdZZ0zC01dhXncU70kXwqv7+/uvbsF4k9/
         pE7EB1AD2mJ6+15sIaWoDmT35fjMmWNxFV36pY18f29vigDTivdLFpHoM1fhww6hndVJ
         hrzNBEKNyoWmiry78vTUBcnoI2dgTc9a4tQ7Fu08/giW8ikPtX6qm6PoBf2n1CAkZn4F
         XJIeQWS/nkaV2DcOofeNbTnVOICBUKIWcWelCnCMryerRYpiS69uaA7ZbKtIYnhfGvZS
         JBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461747; x=1795066547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mi/J1JwBq9/KgcoC0+j3txqdJ4O24a12JlaQpn52FFdkVaoxzNLT0vL5MdSPBi5ZWs
         S+06fSFasFpsw4J9aAVpaqqq/q1y1/b9NM44bCpSyjRmHBEbhztXp8jVdx1vghFn5DvE
         M7nt+vV+LFgtcEtI5c6+Ig/JPjR0VBQyTjopk8iOoIoy2MpraorPNJgaacuI/gzoddxL
         scOKa4zbwmAg8t+FYQasob8YD5pe9zX3RpKUrLHzoGalYwa7m/imP3Hbs/326kZbXxGa
         KN623IhzAF2sYKKAba6wW0LnBaOTDkVVfhdNKzs5gwqI66k8WuWqsQMmMqsi7wYkm5Zh
         pZvA==
X-Forwarded-Encrypted: i=1; AL+hErFUBKKLiwMViMFQ+zCSMBjseg/D7WvXRxpyH0MsYZixViSfwmOqKUZd8rk2OqgKIrqNL7rW1D6mvTAXM0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e1injQm+8FfH2wH+ZXUKsNknF9nfFhJW6LWfT44q7Hgo2jO2C
	IAXXOlGS23HC6hl4yEZoNL6ulvGi4LEiPCuZcRtPj0u6LwLk8pkcmVhr
X-Gm-Gg: AYBFou01HKjLpTnHk4YUkz8nMmDUDs/1GVkJvOVT8Gip7GN2aciz0m9shj28+ghhBIA
	fb36FPuU6A+2H88vc/0v5+hdVFdkPmjI7V7lsEHEDcovaD2TwrlQPAq3jEkfA9lVTj5rJCiHtU3
	Zqv2Wj1GMWKd5+/A8M3EaS5H1QJmZzRDd0j6Uka8wlbHIlmNdAXfku0Su1QKPIg8soXLKf1EMzh
	0tIi8ukkS+DwcKc5CcgB2YOR/RZCx2dyErbg26gkIC8NxbKK8lJ6tAaJwRTHJo9BRisbw0usq2A
	aj+VRhw98Sp4dV359hC/ObsiqpilTjbRMf4bOvN3/P1/VvrRyCrgTjhqdYguOgRHNG0q993Qxb6
	SoEfOC8oekiwYCGFWIcy1axZxZhjTYmdUaBBVkVEuluuDwYJMaoOi++ForKfKXQcckh+2/xnAkP
	1SZ+83LvhJoCM40YksZZGkOMhJwVyZ5P7wWeuqmtnQgA5eP3Lz1UoAA0mKkuSFaNmeVYNohGxqc
	CJ6Rqi2LfGV8qYoCHkzIVLSTG5X0As0Mb2JrMlFnzEc474qLcZWJ72Fgi/3yUldfMjuqftPixwv
	VvNJjgX6wCa9UOvFRPEk0mnX5WrOU+Y/XHXZU7aK7EAy1iuRHqgj7S+PwVfajEG+tcT/eV5Te4r
	B8F+eCq8Aegd//BVoy4OjXmhfVf14+Wf4sbIX6M6WM4q18h8=
X-Received: by 2002:a05:7022:7e09:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b3c0392172mr4615594c88.38.1794461747161;
        Wed, 11 Nov 2026 21:35:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:46 -0800 (PST)
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
Subject: [PATCH v29 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 14:34:44 +0900
Message-ID: <20261112053446.73504-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;

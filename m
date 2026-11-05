Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837402;
	b=AQSNKPfMSh5GhHAtvyjJ0C7MhiQPnFPtVO6mLoF2z1hpBGyploOmTyavNC3Qf+hckM/B
	 rW3/DVw1MGUaMb3FMYqW7zOsIXHn9BdoMhmN5IvidNIcBRi6PlD+WMxVH/U8X8Px23sBS
	 zzlu3lftJNfi2AwZfgZb8NHBG2W8zwXGD3SdwHOGIH3hcUuK1tYXEGxU3MDeA/6veF3z9
	 +BRUsUd6ATTH7syHCi6FIteuRnIzxadTORPb68GffZSB/JJyRyBQNsPy5rXYlWWq7lyzx
	 +/ZDq8V5K+ZxTbuo4aN0WIp0z+Ix1tWNj+FmwAg3thmm9gIKADAA37hsbxKzMInajUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=2q+lymEPAeMAQsS1EhDxCimXJ3DHth/bhh+U0yCldw81MOEnRKeC25aTeGwnGUE4tvie
	 JjgHE+VJ/4r7A2ujWznZAlmBTHmYIPTVbBTypCxuL8oS5Qe6axU1Tok1U+uuQhjJHKj+X
	 JaS8BdHhoRUVU2AOUYsP+OPZgiJCP4N1OqGoBwuLncu8tjUfHMiQqL4UH2eLvg1vOnG28
	 YQ7RXknMWSyycruJQjwYBGFfMMXOAgGq8X8Udb3m/lDWkBl/hEqyVtttdOkpc3UbZgXoM
	 Oe8oGG9Qnyo3wjTDrvGvkxY2Q63yz5NRES6McWak2JzmIeF+qCRJggwSRsf9kmQyWsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HxnZ8/7F";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129C6083612
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E129C6083612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxnZ8/7F
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so746073a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837401; x=1794442201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=HxnZ8/7FBdaSWNp7GT45T8W1pLVEHmGpuH1QAxCdBljbCMJST9iYBS6OXkICqek1fl
         QFLpgpHuBISFlZebkeCS+cS40q0JeS95x88/tZUmvmR+WTaNa2alR07V40ENRkpOH2tz
         BZNRxzAcWaMECNzYIKjLQnawfhQczbDFkIZdtKNRYtFInKia93FqH1QpG3VutIYZurST
         ebTLRYQge/XT+vSR6pQHfusvI/Hnrq1ycMbysLxpT2BMcSL8Ga4gNsPSunlNJQBZ8+vY
         FhvcAS4exNamcD5Or+wRla9UL8GM6UXRJJwImt1bE48YsyBQGow74Es9x5NFmUqtkXUY
         7XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837401; x=1794442201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=mKfGEJ0k0NBJi6jxPoc8eybB+mHGZXcOpBp4xgxZXKKLl86zkxirGDWIJ+P4jSeMqf
         Fz/DPAm/x+BiEliKronUYbiB4AlelgIEY1mnYEEQSJINGb/38VtUulYFMy3kmXyNb6Eg
         ImYq+R/yAUtLpzr0Lq5ygAWwJQqX1dee7pwMe7pdfgDAxuMFskuk69vkcbfjPC8d28Dq
         RlNrX7OcivCcCVkjayLHOW2u8Xg2nibEyMzMtJIV1j5slCndTPomXm0N0e14JR7IrRR0
         VzxmiNC0JXjCtzVUrJ/4MyXzsX8Udha2MrfFygMgreo1EgCsGRncyGDjCmnQOJgKCPCY
         HZ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuaiyD7rsBlL9AJ1L1F5VT3Rco0d3FL40rO0jrhQXPAXzKyE3Sr3FJQrOZ4cqmdB565BfPD6jsqEhFTlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qfPdcnCdRYV9oNQ7V4PNgg5j4gUq97aHKkYNfNWs98TYFzHDu
	WvJ1Q1JoRjv6o4FmOhsurh3JYuV9BeH5S5taUsRqX1UpRPWN0jYlXKSV
X-Gm-Gg: AYBFou3wCX9YIntIQbYgIlULume7MOZMt+DiWnc734Z/Ip0gpd8P6y0Zi3XR8Ef4T91
	+WV/8SYRsgXCelFkENNdLxWz2OEvt46cKh5x/Vvrpq68pYMv0zlYc9Qucqwx0GF1qLDe2a/YO1r
	bgsCUxEkb4SPS6URuFODjkIMtiYA554OQEQazffiVTGLrry04oBbKT1RrfPoI/kNszK/al1dVDx
	HdwSIi17DHx+cnf/lkhLySib9jf0huBu6Ld/dS/rhuvIls1PRE+R4I75SgR4jG7/4ujtX7l9leK
	fHh1wr4idyQ/QSyKOC4GZjoHf0njKES/mCgQrDE2ghzoLiHqGwaaWqTa9VF+SVNgPsP1eOqFrb/
	3LWTd7rYnBJ5gAEG9pS6x2xCnguJu6WKLmQjxfrBZjUNAwxcYxcGu5dGPiOCdzPjPqWyA8VE8/R
	iuSiO2AoIGy4ltqxBEGM/212FPpNqAwLU6NjsbkwcOTTNq7wX3NJU279Tpu6PHQ7KJYnKs7O0g5
	s8og/lU9nqe1q5KO32/DMuUmc9cYpkL3f/Ia5/YEAPGsa82peOiBvSjZjvmxtBvIKgQck++PxnK
	+g2igBJGQuCBT1QhNp/m0OJ3ehgumDAX1sws2H1sv/Z3Xx9nyDG1LFUat8CDNmgKWhzi3yR5iKt
	D39mUupH9zbUPw4+bF3G14ALfAG0xlGqPZAkTJbBIddiecdo=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr15687754a91.10.1793837401292;
        Wed, 04 Nov 2026 16:10:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:00 -0800 (PST)
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
Subject: [PATCH v15 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 09:09:14 +0900
Message-ID: <20261105000915.15177-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930008;
	b=QARijLpLJkbvHpS0KudfbMiTACCOS9UEbiZTjjA6Ie/Trc2F/KBADex6rif0MUTKtWYX
	 JWumn+kvDK+4kZ+1LUqL8Ug71kY57dGYSWJy0m4Q6TGyp6W0HDtwKqMSAVOZO7Ro5urkJ
	 MeRh3U8dY7vgKUsT8ej2V9TV1v9EjOiIw3iUU3SlmeHqAXPXplSinLrBn0Lt0acSAUp5u
	 FLgaasZE0UHdrOnXXxaMNOBZktpR8186R3bqRlk39hhmNnFkKq7yMtoOKbE+TWJZsZ8EB
	 M0NnRG44m3bunEtrCywyNLftz2PlfFZCCB8k/eXzi/yF1lNW49f4UkRc3K8Hh5A6fuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
	b=aQBlK5kEgPp9HyW0TOxlaMNyVyN6GZctMT6hg8CFm0Cz4umxs18YdA8omaq55jbIn4hU
	 At3lmd9RnORqyCcQZ/KptLv2ZA3rvskqIW/ePlRdpuxJuTL+rMgSkyEL2e4aRd+BKhHYQ
	 jjfhw//SPMk9B6n+7gQyfl5z0InhIp80b9kz4TtS29V1vN6Ooyqb/jPkwdxOjYbKrNWGI
	 LuZMMyxrKXWAbAVTy7PAJYJlXMWSyTrEjt8UROq9VaXSMKBIzt5Agq4+6fFbL92Wblc1Z
	 IjOj2Ny3WPkhAarvo/nGCke91sOeIA2tElLaTg6qwYoqbEMbHHJJKI4kQQglt8XCutw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qnui/jmQ";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnui/jmQ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso28413eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930006; x=1795534806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
        b=qnui/jmQ7ZBK2yUhzkT7buTqD6BP6tFQgtLPtN1Dzk4Zd7TJuQ+gsudAo4zOzJp5Sx
         hNZl5Ruen+SJ5tBnYnNGrDLqdMOeDZNDMpmcMTg4wsMoMsxwrfRJxxkqdP1qPJQidMPw
         9/wkIZHk7+IqkVBVFuDgCUyaPrWJ8FsdKMAbgUH+1gnRvlCOFqEZvhXD9aciHr/isyJz
         KaTxc8bOR9OHVjNgH8TOyTM+KZ2otNUsnG/L6Xl5HYpLduTi/3LCMfzrGvEXqiQhGU3e
         gK+gMIBC1/Pdl3YscP/oMH0SD7SEw015l1JAjoXWMyF4HEPbGlsqxw1POjINuyUwS/1D
         icdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930006; x=1795534806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Unj9HOPE9r4xn1Fl/kApFZLZDm7bfKMcYAzdh+ABMHA=;
        b=zobHNlJvdiAopbzu41COI4A3IODYLnGE5ZEHi3CnuoCUzKNaxJ7JuRVEjNXIeSjhFs
         qMlm4HTzFOuzlp4qYT+mk+H1vrX+e92VQiR7J8WqgwEhTHU2VLIUplCn4Dlmi9/GptdB
         84C9L8KDWzitNa6oRcXzhaqXzGqxFaR0NMwjcJwTbdVxo0kk4VRL+trsTEHuYPogtvCS
         64FyZyDEQRam0RoF25V4EdjxElwJsD+y4HZ5vQD2L/Karkch4gtjJ16BiAlf+XioYfkF
         AEGvlh9kINf4i57sZgpuMo6fC2UL9u87VrIX1ILqDhNTUGDuYsGjuHra6SMRTXlDX5gj
         vvrQ==
X-Gm-Message-State: APuU4Z9AKL45SWjdf98SMsO7jtq0UD00w7ZeNbthly8hWl5gL8bZJpXg
	lrfmCb6fm60Wjz8WqVfxaBxoJtZGppRTJUqXPE8va0E0E/g93L4u9QuB
X-Gm-Gg: AZFdTZfnmWzkfgjyugqHmAuunps8yDQbCMFv7IasmYGSYNyJSzyJJ3g5P/KcW5r1CaO
	6myo1TvCgDcqpVtPqWuc+gdK1aUvle0eJ/qrCjNo9aINPt9S1tBAgpvqnBknq8GVaordOdBYt8Y
	OqrsDPSdVXXTNmOG3EVtETpKpfP+NI7UmcaD2kklVE7P+21Td2pHYnk/fZSJ1oIDrdXxzCo5MA+
	1l6AcqVTdsF7m86sO1WOEsa2N51zsOAMnyeAgab8LWVRwgMjofnv8JUnqkAr+YSs4/7Y5cFVE2c
	BZ/WHkXgPiRO+CO0X+ALsUn4gbR/odydwdOhzexSlG7Dj27WuHGI1C3KmSWc3S/NiemViBko4SA
	tF6ymk0dduJog/BIHC583XJ8Sso5PMtuFvadK7sfpC1BWLYPhXMV/VSmV85W8/pwcWwSvbiB2Xo
	/k5DQ09wyRDfM1SdUbspWbbZ/9L5K0KEIA9ra2yo6ZmJs+Cw36VLnw8PEN3tVSmj4sKnAtxMBOJ
	jzns6JhEfqHNGSIXsZHj513KpCri+gChrbUkkD/gubtKDCsZFhYaGcFYuUuOtYyPZuiXNh1KKES
	wNM5uNk6rsQP4JD9IzMVc+UdF8ol3ly+67ebqX2NbWuelBZfM1Q=
X-Received: by 2002:a05:7300:e10f:b0:381:ccd2:f6be with SMTP id 5a478bee46e88-381ccd303d5mr2073471eec.21.1794930006414;
        Tue, 17 Nov 2026 07:40:06 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm6542980eec.13.2026.11.17.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:40:06 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 15:39:31 +0000
Message-ID: <20261117153931.2784-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0zxzyt.wl-tiwai@suse.de>
References: <87se0zxzyt.wl-tiwai@suse.de>
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

Ensure card indices are within the valid range before accessing
the card array or lock bitmap in snd_card_ref() and
snd_card_locked().

This prevents out-of-range indices from causing invalid memory
accesses in these lookup helpers. It also protects against
invalid indices passed by existing or future callers.

Warn about invalid card indices and return NULL from
snd_card_ref() and 0 from snd_card_locked() when an
invalid card index is supplied.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add WARN_ON() to report invalid card indices, as suggested by Takashi Iwai.

 sound/core/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..343c06d714c2 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -384,6 +384,9 @@ struct snd_card *snd_card_ref(int idx)
 {
 	struct snd_card *card;
 
+	if (WARN_ON(idx < 0 || idx >= SNDRV_CARDS))
+		return NULL;
+
 	guard(mutex)(&snd_card_mutex);
 	card = snd_cards[idx];
 	if (card)
@@ -395,6 +398,9 @@ EXPORT_SYMBOL_GPL(snd_card_ref);
 /* return non-zero if a card is already locked */
 int snd_card_locked(int card)
 {
+	if (WARN_ON(card < 0 || card >= SNDRV_CARDS))
+		return 0;
+
 	guard(mutex)(&snd_card_mutex);
 	return test_bit(card, snd_cards_lock);
 }
-- 
2.55.0


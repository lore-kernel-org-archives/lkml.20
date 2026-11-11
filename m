Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384394;
	b=0mY9dsY+U5WahbJ3sRSnFQ8onEAtZwK2h7Y62IiZUCOzV4itGZFdLbygDGIbumkRsMGA
	 Nm0e0WC5v7iICOPR3EtxnHbAIddSwr5q85GDHDRjmN9np0YjvMcUqYKRRUJjxbml34jtY
	 fcDUeSQwlvJDfwcTq+TDJ7ilLC2utEQ6UV47Jdv3pArd7g0LuFIGQIvVC0i++J1McIEUQ
	 zaGFc1vlAKafjarMw5/Xbl+148ffAQAg/k6tHMH8/oOuMTBrJ5ZqkwlBcnTr6tEDLLuh/
	 AwUqFYUcXY7CdgL1Zcov7AsRqcJ/qLY9J8ZLptdwTsaQrmPAqlBSUEHoVpCTxJLgjMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
	b=vpNu8FaB9ZwmOlgPIsRatobmG5Iz2QG4gHrwKMt2HdhYp+7Cr1ZCVJ9OkLo8hv6nmhH2
	 huRh7enOLmwK9PARoZ2ycslOQTA1qR5NsRz0SQ8ql1xzLkHzQaYHMUbgC2MTJXDmUrNLk
	 B091zFp/gpxwUi290DB0TK61v98IH2YMfmY8vffGoHcfp4189BGCsUK/8kPSyCXG7NjxU
	 IJVzvUC+r9Jz0thz9DCwyoLOo3gDc0vgurom1hiFogv+lfz9UHZpyLaursiZu4JQuPBM8
	 ARj/pWHgqqEzyCicB5608J+EqPXwQQ6hslw5Va1BbGlFvAbR1LYbzdV9qGSPm+gq2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB660A382D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEB660A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1721315a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384392; x=1794989192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=bMMqwkz15zAsCxFpsBJFK8CPiZ34UgVDGidaLnh1/POTCZVEOPzM1KZIFlcipqjLQ4
         CVWJHKqlMv3I89aAIh+S4MIwrG2kjrztSuw2NStDAxQufH4CejuPqxndHwUSHEzJcT8t
         yPwouLN6/mCABSWxNqbEbrnZxb+kuXoazui66u4gHIP15xw61h/0GHM1jHouqRIz88Ui
         AU3YhpRHSvtnH4UA3xiP1a+FpJXRNUGyGrWgcBEpIDyn2IeWqJy9c4nlOR3h9GkGlTYU
         v1/nW+B7Gx3q5d62y2JBHL1cjf8I9aX3Yz4cBFe8e+neGeQ4ehw11rKuhdNCicF2J3OA
         TpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384392; x=1794989192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=p7ru08XmWXGba+JKlNQ8wCOAqc3BZOdijaqov/WIu1bW+filwFjyLzDSB5EF1EyZvv
         fbXdtLGf0syev56WXimKQadhnh9TnRylM0yKJirtFrEG+svjzHKhwqDRnEtpu/3QpoZ5
         2S2fbkF5QUjMOnwSJ/RbWx3KTqLNHap/4ohhE/CGG3Y39diWYmlqCVJQff+H+qOEdepd
         OW9N10WpPbSsGSobzlKRL+13jgigq4kHEGBPZLS8Cf8GMSxpJuBXAcekXIeP/ux2Ldv8
         A0YHx63FsHn6Q4byKFxJFtoBCoC/J+KNkqtQEUtMcZ76W8URF88YamKiwBHzFyhNZiwA
         FMoA==
X-Forwarded-Encrypted: i=1; AL+hErFuu/QL43YrIOzyMb5vyfor71lkS7FU0ZUTIj7CMgv+LhQ16HMWXjUCyg2sYK9eScNv5bKs/v7cVW+k/7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yjwRSo52qEsoK4nXSTS1+MprFdT+jtoHo+mybtABoKDlVfNU4
	kjMWn3XgJnsZyFyCxmza1sSbRkG4zQwctJrkkKNmwh1qyBj8qAXAtMmlmpZq6ZJAig==
X-Gm-Gg: AYBFou1xSNtHXBYjYQBtca/lcwBDenSeLSvsfNjar2P7X2Adb6DZnAOpcxg35U/txIx
	0EJQxo8OnaLdjZgTMJNdft1GnHlh1Yjx1P6BEP/+EUZzEkLB9jFyQ6h3+NPhwRfgS3yNTbseZ/s
	L4smtaNPA3BvsYU8YjAZkfkgSme+4qi/oRVR+6hzhe6FStiEifykKVYiZjr/Aniuz553hlAPV+U
	CSSyfHwz3qhgUdeOcBcQQZl3R34dNaVKqudo+Fd5ykZFb945uTPFMgTHvfnSnmMscRsAlk01L5/
	ggEzWvgdZVDZ/6Lrd4baLuL92h03lQb+KZu/mxNf5MY848HnZ2Xc0SebjLTgf5LjZ87QvWE3exz
	BYx4TcVP40AAluD2IdMvICW/4x5b2Z6uZi7aJi/GitKmMfJcCt6NY8Bg1utwKVAIeRG5Q4DgfPD
	SL8yQft7Yst3jPkmvpxbRRi3R4o9jUxhUdgh6aMLR9wQCHVlTwoff8YPVyOMIEskX+KK9qAoCFX
	Tnr+g/N7vaRz4xnFwL/IhqpqfK+OXp1QRPoW/E//CMjCC14Bomprmltl8Pd6/8AZ6zZifqi0kUf
	sSgZ236N0MPICILofA/94RxU1Jsch+sP7U6h+CTba4S9Leaj4hoMp/j8v2TwEgNqxi0JIr2IoKv
	M6saeHmgV7xwocYXpALcmhO2mYUBeoM9kxwjmexZp8tDOgiWrJsXBk+AJgCTQNgebmjjueEy8uP
	fvy+QWBYJqfZ/2IrtcoGX/Un/Eednphjy1TzDMimLaYDw4IyjLg4D9PnQCSRx1t/Ly6v9QkMYDx
	Mf/xo8UkotK9J6mQwAmue6wQctKjeXwhywoLPfGUU6nfzF+oqpHTPzCuyoxI3kS72he44cuNUg9
	b5ZUgyfX1J5t51UGLHM=
X-Received: by 2002:a05:6402:440d:b0:6b5:76fb:98d6 with SMTP id 4fb4d7f45d1cf-6b7777011b3mr1253468a12.21.1794384392040;
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:24 +0100
Message-ID: <20261111080624.244291-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080624.244291-1-julius@bairaktaris.de>
References: <20261111080624.244291-1-julius@bairaktaris.de>
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

q6asm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6asm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6asm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: a08cd56a4524 ("ASoC: q6asm-dai: add support to copy callback")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048c368..1cd99a1d5b516 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -897,6 +897,9 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0


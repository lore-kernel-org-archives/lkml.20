Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384392;
	b=TRLdYWBvGZxxwcy6vt6nIMygYwFKU7sSv+VJQiTaBsgxe4PCEXSZV5SL0bCwHTzkkAR3
	 wCZo4NDwn2Y79StU+OglSsl2hJFqrLYLllG/yfO4sn1k4AOq0TgwN3v3TMrngfBl5t2Xi
	 LQXycdzDcdkX01HH8aVZG7QE5TWDNPRtPaPzgTqA8ijPPrRn9WRGowR3Ktkt9tLcF+eEK
	 VxTwgAFwA08WBLLW8LehfhUBlZcBZ0qpbNtt1t2au6G2YBnlxPXwXUaj5p/G6awhSrf0N
	 8ptgt97Qn1liwmxedtmzZWnCz+yMSX5t+9LD8fzFPPftjUQFtCznW+h6eUBHzszyNbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
	b=jLNiDRxnBGblG5kg9U6uzxVD2f2vEvsrLS11roT683EXDcE6bOssKJ/RFDNMmA7cckmF
	 J9XjWF4u0AoMHi9hHLAlzDPIC+YAy04stxc8twaKhk0QvhCP7kPM7Iju3JUX5VNdhFOft
	 4VVT3z19eDV+EzHpPtD7gV8UXbzq1x4OA7NplPWZzvaDdSEe1t67gq/TAKaFyVvww517g
	 qBbrUA1t/HHyozlMgkYEciIfJGQPIlk8Gfq7XCM/wjVyTZQj/+hcPzLPA19UQCeSLWs+u
	 smyHe0VYJTr9jvL6O/bdDItjbpPOl41FaGIDVnHggpuargiqFjAU6NHaNoxDImwuddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5A60A3814
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B5A60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4657213a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384390; x=1794989190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=mCt2JvyhLbIgpcDDRzYJMS/AVmNFEiu4KU+zCdVMvmuuRbKRK9epQhkcBsuUpfxDku
         Jl2L/qrw8crgiZXeHafeJ5vX+QL6NhB/HdVNPVl/HKAqBtQjQcisV9PtXjjPwzs+6l46
         pTTPCwYWrmThkGPUqw0iD/F+Hxmncx1huTBboJhQGIrVCKPn/H6lD1NbnWV2CnOx/DOp
         GYnIAF6ZszzfgUiMPIR9qgbsH6E+VlmQFixUIWgIeDFYra9fPHC4yqK9I8UXp+jQzK+U
         UTcqxm5jaAR+EY/PspK+eyYnhc3tRPSFzxZC3NXOCRb+w/9vCvBvfTu1i21fBHDouQ5o
         kS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384390; x=1794989190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=iEwZGEfU6Tf/gg+48Kj/1Zx/+XL0yFcRTyJq5fwUSSK9zMeZ0XGq5RGaiJ4N6XLLuB
         4sMCpNHfEtONyiz7vod1mbH/nYGPde4KWtl0Y4+ooSOf3ey7EwsApS5yByVguJR/JUAy
         Pfd66aZ+X63O+0hspKaREQMVDJZ3TQjMhLpMKiLCSiLbGDVuwlXc4apf1SvPwk5mMoqP
         iZ+SkQnQSxkRSVsMsiJy4f2Pc26bw6pZRxARUPlQ7zDqAlQCdo86rkkMcZadQYwNAc6t
         GGWvE5IO37NvVsz8Gk5m/9NiB9WJbu9+PVCidVP/nuwq5oiealTq16N8G3uvrHDvf3A0
         i83w==
X-Forwarded-Encrypted: i=1; AL+hErGcY8ignD/7Q1xl5xEUlteQnafegOgL+S/yMxX8giw0PVirkJPC6ZkWQQQydHkqA0s2B3CO3nIxd9R2usg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GvgoxNRNvpHNa48Bb367Pl6L4PnyA0UDZjWqUuR0E68jxYpoW
	3TBJXMuWuunpzLvCMPVT7LxydVLFoDYspAo209n6PF8SISMUnDiW6Xd8QgkVIQg0Yg==
X-Gm-Gg: AYBFou1+qXYTTk74ySohJj17SfUQH2BeYP+LsIY4anAdnEeNN2dQNcCvZCb4OMiBAXl
	SHWuZjrz00LkItPsQ5laYCUyoD/D2jqA3Mv/zE8Wt/KNoy1qfzWlrEnO4N37lZUiQOEzTqXvvqI
	yQw3PvTKMa/M6liq6Zs1N35cheqNRkrm82gyDLwqe9adP34VamVmHlvQHGo7sdgGzhEDv+Ac6Gb
	7A1wcRjeuaUquMMHGnyYGubj/GTgaHW6HYHeuMmufTThX6YVov1zxUkKg6LlpqzVeRiDuktnI7N
	UmIOoLtl6L5E3kqAIsIPB0tV9faoDCyc6mF8/1DXKJLJcoXuSjEvr1QIFIqjzxjkYqjd6VFtci6
	Zz4w8DcWEoGNnu5YVqLhkuZlq0SGKaX99Oh1ouL2evl7tQf/c41uXkyZ5xR+LHwphXh9CRVijSY
	GBl6/kJD7Axnjfmm8SR4t5N0ERjwvihEVsg6C1kPQwtZu+n9NyIdGy5oYqDxPJhU3Cjic7nePS/
	J4bWhVMT9JOvpncBdZOXEED7eVdCt2/23GvWmo/AHmlUgMDTtjAOCwosbl3vjWf6B7JTgCsx2Ko
	bFauSzv96GpxvEehaiHKp2bGtSZqjVpLZOrH+8CO5NbFTWbX/l+Yq7nUXMhrHr5J9YZ7DqJ8pf3
	HkqaZpgH8hqnzBzIUVu1DTws3SCg+bt+HFG/wBkPi0/w00IawAwm8fhH1MP2chEZHb4KrN1Wq3V
	ENSIlauM+QLdlPucis41MFcwYxxcnSrTUGsfTG6bh4VC6ZXMJ6j5VNyY3Qfw0/f2S8+28vnrB4c
	gn9hWndCDrqKlKvmE9ntlDrDGg26kAwgb4cNeHaeRC0C9QyArRw0gfliazBi3KZQIdb65fuDyH2
	YzlfCcjkNZXXV1ax+5Q=
X-Received: by 2002:aa7:c0d5:0:b0:6b3:d0a0:39c9 with SMTP id 4fb4d7f45d1cf-6b7773e790fmr851218a12.6.1794384390543;
        Wed, 11 Nov 2026 00:06:30 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:29 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:23 +0100
Message-ID: <20261111080624.244291-2-julius@bairaktaris.de>
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

q6apm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6apm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6apm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: c317d148a2b0 ("ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9ff..80b837992b429 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -990,6 +990,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	if (!pdata)
 		return -EINVAL;
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0


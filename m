Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384390;
	b=uNsnE0UM/6q3T6Inw9nl91d/gM7M5oz9L5vXk1BkjZl6ovyAgzQDwfgfz9plknJ0yUiK
	 dSb/xVSyuxTVCjjnMrTXOhZpKmhFu3tO58+R6wiPzgYNeddUdg/rH4GmdlgGZqZQyoZek
	 1q3B3rzAQaT7LKi9thGmXkedwCFSJ4X/Kt4tLxOyw3x4csM5Gd5lmf5axoC5lvpNRS+6s
	 0/zGpEEOttT1Dc05EdtYdy8woCX+uWm2J62FJmXKkDcYEqu2EysNCeqfJvls3/WUOdjBB
	 IDSQqXuuu2V43lilkwxoFZDnDB7ZVBdl1OZupxmdDrGKFcKbcCvzeILD3uIhAIja7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
	b=hWfeuCVStvkxQGMaAlACl30y+plTABsNRCP6Uycme8Eh3V0KO8MMav2RQT9WtFnWG2XW
	 P8lqpujFGy0rc+c2rtDjG1KlwZoB5gg8SH15XcrmQsMMoeOMaTizM9gSNdCdGo3+YLiXa
	 +BZaBsh8JJ1I6xDlY5YkABxkWIsztdZRVVs/ZEMCXQFwxS4QD1+WGH3kEeW0z9s1YbebI
	 L8fbmL2yCEFKtwlarM4s4V8cLmWlD1Zv7PRQzP446vNz9PMTybkQ5RNM+wuFteqHTJBDn
	 O6y5A+l3zFbM0I6gjCG8W/OY2q8CMNCJ5saMHAAvotaHy7ZSsOHM8gtndAzYytGc49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD660A2600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CD660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3436579a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384388; x=1794989188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=b2ri6zZLq3enGxYL08H8xb/TtOdSWDeVZMx4/rE2VCBd4WTVa3wcVPgS/v4aGiZnQk
         +mM8g76WGQl+uZWm1oNQj8NQ82MIsYZmwB05aik8TWMl2eLTuOCEVoY9lvhNy8LGp3RM
         oohwhC9bspeoCfvbLQxFtk8cdyJb0o8+WDxalC69Tkf4YCheOx/Rhumow4Fdl2ENJa5H
         m/NbPYnlWmtUwfc7zKJxYcaTOP4VugExQjHrbaxbvdG6JlFqD2AMtWpRySWr4XEuWiac
         wXFCaMGqRvL3WacMtZX3XcCYZ2HX+F19B2ZAOoTftBANgUK3wbYwGooVcF0/ETOsKnFB
         y3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384388; x=1794989188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=y3n41/veUqWLXdoS5k/7PqlZQAKOcBXufGeQOHsvgzvf5V4mP9QCPQBef86M44yTaN
         EHC7I9Z6UY6zzwEOFJBzJlHadRPe8Ae3/RMN8JHbi3ovHhI6zfaexkR8KQvPzIBKgl+d
         yUnDDec3Rn5p8mCyOefCkBfxDXctBKwWENPG/E6uGSyh6tSoXkNsmZtkaCA4086AACd0
         y3mNMpsI+nzHiZlZDTh8dibS7WbTbf74+TPOTcM9siOtDivRqRFuthTQdAIaZlmEOXMp
         WhrP6ulrNwf4oS7A8irbPbO+HqwHUhT7xhNnS2Z9+G+u8dJatLjMVw7zWFg2g2rxxdiy
         mEng==
X-Forwarded-Encrypted: i=1; AL+hErGXtOkEc6OSYOFEQAUWBZqdGGKvJkcydp3n0kz4ykHdowV5/N5kxKxhobJ8ETmxPClD+rayfu79gSWwGQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wST2kR1SbGFQu8oKsJul2N99P9aHPoB+cNF/dVHhNiDyUP6rA
	jg+jOl3irrTf6U+kKqsirV+iBFT0Ruliu/dFmamTthvYQcOUs+rWz1dBrzqEjAjX/w==
X-Gm-Gg: AYBFou1kNEw5Qq1pM0jDwdHXrY9FtBQeEbYEaFNHVsjuR/FJmWfUBvGNVc+AHiwlk+8
	P2Ll7ucvA6/oXk/1F3MPKpf3ksU6IH7wTr4MlrqNGkFHn48kejf6o1d461AAgmpqAc9J7yILSmT
	uCWRGk7Q6HfTaQTXWYe+xObZgPJ4C/SZpwlg9KPyYGOFqIx9dvr0HRG9fP8h0U8z2CGbypEjydf
	Znr1rhFKJE2m3n7kcQI30SEEzRqkzx+QZrWoMPF45aaKaxo3nPKEaFH1+TKFGvxO+a42UhF7bhe
	l6/2NDVx3NmwUO1FdNSzxndzMi7lx9yRW8mQvHwksZLKHtnYGjA5rhjJ6LL4VwD8GAmFe8UBfmv
	9JZiFAuTDgytbXFfEfFxjnu2BPpXgdxGEGne7nl7mVDQEo6CzQATpmFFkpVgVXCRZLOmoSGSVWZ
	6gZVgY3fJYrVLhjXlf8dd2JttrEdqGw397bWo3+LC/65Hi6zPdyyO4AULj8D0Mx+s8tJ2Yycv/V
	EWGVnZ5jlAIJwcDqUZcRKFiIVeYGeJoEF7jGhIt7ZYscCwauxzY20VXio+Z8cTe9RErHh9mHvYN
	typbcaGn5UONc9q5AUqBnhDHVsOT6JZXsGwYc/AYsNh90rEMiAYbq2ZULx9xJb7zFuvzhAsndWO
	HxzwY40EdM6i5sxrxP+K9IO0wuPnTA2W80ePHUQmOpKQs6tBPS5O9BJB6v8XgKgl5KuvCeZvcXw
	YbE1c974pxhIFkDxLFBfzb55mJeRanXNGyxcXBmMpLgOBS45YILKHwuNIpiJM7oLxlXjGPJ+TGn
	F1D7dY11W3W9rM0YBN3XcIO2Ej9V6K1pH9EOAo3hEn18dXor7ktZQS7XMPRxRVHNyfW3jpFzmtx
	hUYbkba8cyVmztIuneE=
X-Received: by 2002:a05:6402:1ecf:b0:6b3:c0f2:eccc with SMTP id 4fb4d7f45d1cf-6b77780edc7mr1263629a12.27.1794384388193;
        Wed, 11 Nov 2026 00:06:28 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:27 -0800 (PST)
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
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: bound the compress ring by the DMA buffer
Date: Wed, 11 Nov 2026 09:06:22 +0100
Message-ID: <20261111080624.244291-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

q6apm-dai and q6asm-dai allocate a fixed 8 MiB DMA buffer when a
compress stream opens and take the ring geometry from
SNDRV_COMPRESS_SET_PARAMS without comparing it to that buffer. Their
copy callbacks place each write() at the stream position modulo the
ring size, so a user who can open the compress node and asks for a
larger ring makes write() copy data of their choice past the buffer.
Each patch rejects such a ring in set_params.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA
    buffer
  ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA
    buffer

 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 2 files changed, 6 insertions(+)


base-commit: 20f1752b9241d300b42cd45a07e22d063bccba45
-- 
2.53.0


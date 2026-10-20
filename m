Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540307;
	b=TVgJS37xmZm4daLTmp4FWfAFRvuM8kp58iAw/PAgF1TM88spz+qswu5PcLLd3KX6gCkv
	 ezr2CPrePtUXKNLDgNdnyKasqZRWzikrEa1cCBr2+fUPlbIx1vQIJnJiX7M6Zrga0jh8Z
	 TOUTLpdyU7DTn7iqptYO+sr4TEBwiTzRreji+U2vxJac6UB9lJ0FX4alqAioY3zDSC8rC
	 Mpqm5xbTZSFkhHKgJgijftTYqo9WEiluvEbp0KpGu/HcGZA6qsf5+jFO0JVCVMiftXl9H
	 dFHPRwrXsNf2+wSgJ5ERs3vOvAjKDvPZkNemO2MZpGyZjQ4CEFhF2OHCXzLNauiPE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
	b=XAemx04XwtEEPEAfib/06gzC0GpJs2R995R44pcKMTUl1/nxeMoe2pj7huyVccb0za/C
	 Kg0Yq7wA5v3/1R0n4bp5254c3WRgM0bQofCGH3W620Eu9FvruPv5toJblTFJhi5P72dun
	 K2isAnP+S7impIfpZ/MRGy5q9hGFyyvJFtsL3P+Cj+fPdiEzotySdlaHUTctH2nr77YSi
	 rjFSDdeh0Hfka3X0qVkUMeLrhZzOjkKAcvTsngLw/bgTAROdOc1hl1s7yeMyumdnz7ywp
	 kJHpHu5qMg/ww00aepSEzg9SH98zZiP0+xCj0DQIiuYiOM8ysjJ2Dt81bbnxDhoJkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fepyxWRg;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EC606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0EC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fepyxWRg
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso186731e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540306; x=1793145106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
        b=fepyxWRgJcSdVl6zjdX6AmtGxYkz+a9yM9MW2XFX8lVagULItZJyVBsM3QX+e3dOKZ
         AmUAzMrU3FDN49gvwuvc0zqNFSOjXrftQBKKd+LtrwJLTmlvWMzog3xVdPUxpzOqTbwU
         XEXRf9PoGLbyLix6wibqY7PG9bYppYfT9DsWxtC0TGeUUw8/ugbtWG8fDXtl8HLJ8TsO
         4pKrUvMXm7ZC2hisqIqUarbKgy5uQd6rMVFRUVxY5zekcYnO3TE1bM6YCX5NHLdmAaj5
         7dQJdSmRIgjNVlmR8toWT7xh2ShbXOVsdCUzkoBptfnWCh/sx8DE/XeX2CetjRkOT+he
         oIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540306; x=1793145106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
        b=QPetgsXAq4EshjM/ZzozlT8zH0ekiB1kaEHq8xxmI6yr9Rtbed+Zd8JCoguiOxvUXN
         e3BtuGlszrMsoVpB16RlIblSi7jsqr1CkihEoA0eVgdBPLoleSv3S3enVVjOMzYZyhzo
         qFrw4v0vDUuYFBQkTCY/HFQ7bkHcLAJmzaQbgBNNdVYqO/Tl73pro1385QAQajqu+qKD
         szvj5hLACOcpNv4VR/Na5mqTmjZfTLSK9jFoINypdl2jOvDvZbd+zZ177dmXuJJN+pA5
         zp9U2wxwjKl8O8eEWDIAgt0doNBsmx/9qQ3Wu9oxSQ654qhUeD3jVcHIkjU5sXkul3+3
         +ILg==
X-Gm-Message-State: AFq9FYIaYcbIBbg0+AEyvkw7K2XxV8Wnq87CflvvSDURG06SQj1FZD4a
	yWyrziOoTWphaE2wHzKJmV7/Ffk7aRooSd7+BVjFigejohrDiyfQo/Sw
X-Gm-Gg: AYBFou29axtXOKoblMQjKfbt+CKhR0ukNKiyiuqwst7A+xqAWat/JvTiGcWbF2VG5Y1
	19Bmytsx+H1HwnjuwQ5+FhwSdE+x7+Y6lpKHX0VlaUIN0EP4xm5apX+LDO2j0F1wb8J+YAoMvrf
	P/YlCiwZ0nIICmnhfl6J3oNs9AHJxewPVvE6hso0Ejrb0oVthXmSzwmMVMzuQVyD8wHJ1eiB8e8
	w8ecIUplble3LM/LyJB9p4VBlAgQJJfUoAbcbBqxCPv/MAuOsuoSqDzydfbHUhvKuTp3lz19Fcv
	UYywL0TcPuYVEFVMCyP6Cd6mb5Mq/SW3SToe+G+0ZmvS3/zo/WD2CalFYUxntPBPIoHXqRrsoEG
	vNguMz/H24Ht7CLS3P/dKk1c0fDtE5sUiAI2yhgdJBndLQzd3a802GSnxzLCLZvHdplblDp9F2U
	7E0uBWHRdoZO1WOm2bUUETbDp2G83kgpBNXhxp0vhcr5BQW3axaRJeMJJsZCPKdc7/V/USoWN/Y
	fTOHSF0tiRlNqHOayWROLKZTl1ol2L4fBm5sA==
X-Received: by 2002:a05:6122:8f8d:b0:5ea:c984:5ad4 with SMTP id 71dfb90a1353d-5eaebc1b88cmr122893e0c.2.1792540306067;
        Tue, 20 Oct 2026 16:51:46 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:51:45 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 0/2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Tue, 20 Oct 2026 20:49:25 -0300
Message-ID: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes platform profile handling on the TIMI Redmi Book Pro 14
2022 (TM2107), using the quirks infrastructure from Mingyou Chen's v12
series:

https://lore.kernel.org/all/20261012133648.132363-1-qby140326@gmail.com/

Both patches apply on top of all six patches of that series. The first
fixes the response payload copy size, as pointed out by Chris. The second
adds the TM2107 profile mapping and response-layout quirks.

Changes in v3:
- Rebase onto Mingyou Chen's complete v12 series.
- Reuse the existing quirks infrastructure instead of introducing
  separate response handling and profile tables.
- Add the payload copy fix as a separate patch.

Tested profile switching on physical TM2107 hardware.

This is my first submission using a dependent patch series.
Please let me know if I missed anything.

TuteMthCD (2):
  platform/x86: bitland-mifs-wmi: Fix response payload copy size
  platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling

 drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)


-- 
2.56.0


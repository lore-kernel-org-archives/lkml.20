Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964632;
	b=NpkGYIVHXCkfV0q3j2FiBcCPCSD55+n2Mhay7ZV8w1JJnmQjKP6nzXN6kSokg1BYqcao
	 kFr763c9u12nruvgZIjdIrw0AXMuECvW8XmlVyeBv1DMrY/XqAKJ404DYWPVAqQOMSc4G
	 cDkiX56neKjDi/BCYJq/iXmcZs/U1WJGf7RUTYBhF8iZFCiLLqt2T1E5+lR8PvbYk78aS
	 ZVf5doeU9vjZTQVKXoh7RCcmXd7MLpETNXP3x6sPiPWRt5uOst9yau6YT57crY3kPLm3Y
	 NMVR0RKmakbowPlpbLeXr9DI+P71geDbK9WAPu1EF2ZkowgC/FygldufSfYk6n8rbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
	b=IVj4g6W5HsjhI/7gbWYMJtGSj+Do3cimYsZp+cA0KIz+yNm0BdBmOZIO7o84bKsdNuDk
	 VOVDWsvkD9P6Ua1OGQTlxhYIwjVhtwX4wZXI5HfR0tJ71x2nSCAZ62ekWDiPZuRTBRGQ5
	 6PZaekusc5FEAQM/JzPlTZ1P8Kcs/faJ5CXlMjwf3QTE0fa6JeDBtX2bm5PB5cekVon9U
	 upRKJEKxapbBmKyr/cfa07AhqTiqRFURpRH7FqqdhHTuyVNu6Rg+sJa58FaHmq55zWV7j
	 ZCBTl/30s68dRLkfIjXh6lCL+UI1QbQmJLpKIsCCAEnSabPtSWzdxP1P1wwUrCpyBlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxFYnAYy;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676A606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9676A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxFYnAYy
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso350976a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964631; x=1794569431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
        b=lxFYnAYyNDcW3fSzyyCufVKkDdVXqCzjBDNr8z/M254zshsejxv33zEJ+F3HoFchfz
         4Amh3eMBOdtNyHqHpJEry2UPggAof5Rm6ixdXYjYJEj/QY/WuNx0Mk7uhLGKnoELE3Fh
         hl60RpqlQNMAesSB1bD9GCUhYREbX5zhB71MPegIvAb4fJeLYclZZZrVQqo3G4NBIghU
         I/oKtZ4CHFOUTNZj4/aATCR79O6GXE/piw2mTGeJ4d4ac8dlbicBImu//PAZ7q7O/ijI
         ROjVKiZiVX0O02NO3c+gdpaFaK1l2vPFOB1DdbUAfW55HmneCjAcSrffAZj/5YCdkga7
         pJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964631; x=1794569431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
        b=z6RmnfpEWi9iraU9zh6LljQgj5gY0R9hce2AJkPMijXDv8RfwJkNAE7zLl4ld5IOdU
         Hhy+YF/0PVIhWwaKCyBCV3rqG+xpEdlcVMA4lqZi0v8n6TUntJ6/vwLL4Ixm8bsQpfmg
         DedKGQ6I5XWF1uqEr0x89z81Sz1+qwPqFNdlZX8nMBop+Lm3Q8BcauUv9Gqr++eSSC//
         Oo63ixzDWIyEd6MAjIo1/u54SlNivA3j0esaVOPhX5h7ENzUwxineFABmYGLZTX9wehG
         eX3NK2ed60+FM9XotfGoFt6KTqTyxvNK9Wnx4b+8wq94BreriGqWYOkgXP7bxhL9FQEH
         eeZg==
X-Forwarded-Encrypted: i=1; AL+hErHKWIdcaxndM22iPbkC7ek89OtaDzArIQMTZHO05dq32gwGGmtSH4SPYJsgaH64f5y0EN4wUulIvqvJwvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WvdpzQTDw9Vc9pVVPn61o8RFaJdGd4bgxbucAE2tBLLLHmyzf
	hOTYWHJeGQxQZlKCF08rc6iYkrM7fAdpITUk1t7DJVmKXtHMmadCp0PY
X-Gm-Gg: AYBFou0FmeLfOjFQ80gd3h4F5N09LwaWbRuqO26aLnf5VoCTvCAlBEW+9gpJ2zBD0yy
	5uCIX7aTtSGpVUSk9sa+P7/eGKIuz91U+m3IozwNAm4btys4akdz4pQFIFxD+CoRSYtAQUDX5FU
	C6uZ0ZKBdXt7NZqZHYKSabxK0w3bGra+BumnabrijQNlM0Z7/MFUgsxBMHDSfjVOTWvqs/LivTs
	8BGwJxeK06anN+lP2fUMc1+PP4fIAz6z91gisjtms6Py/R1uBdhWZ/ZXB7QN4k2m4YPPTC8qS2j
	hyd4238qgHRX7hWrVijZgANawabbn5kRRH4ZOtYIBs93yYgtnPJEXewTKpHJpELpLTYKYsWsY8P
	Pi2Fm2F7GC+zRa5H+3FuyuXdJFaWJOlyFjVnf4zSlo5aqzQ/kOW9cG0C1QVvIPalL66FPJ7idcc
	B/Q1Sd6YctHvW2xFhcfg8otuWBNswRozmT4qFxc2wAyGIj7js6jhv4UlIX4nWeDuKZ/r74TD20+
	H3St5bnD5NsotEzwyjzfAXiW32HfiSd7KvEe8cgaZmlyqqewOA6YEzOau2MenSiTsDtYJST4NbY
	QGmCndRSGOxOAGdX7al9bLA4OXIvFUnBIAKVh2yj75Rlx4RbP3sMxhwssV5Ss7it/m+2Jnz25b/
	wxCIgYcXMHhFHgHN7dOQKMof2toxrCmue2I6vfClUhpSh
X-Received: by 2002:a17:90b:1a82:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b0db6ebd46mr2073524a91.26.1793964630960;
        Fri, 06 Nov 2026 03:30:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Fri,  6 Nov 2026 18:29:38 +0700
Message-ID: <20261106112940.53550-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
is one serial data line carrying a left/right pair, so the maximum
number of audio channels is 2 * (N + 1).

The current code uses 1 << (N + 1), which only produces the correct
result for N < 2. For N >= 2, it overestimates the maximum number of
audio channels.

Use 2 * (N + 1) for both playback and capture.

Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 6dc84c55db0f..0de7bcb2d0c5 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -605,7 +605,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->playback.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->playback.channels_max =
-				1 << (COMP1_TX_CHANNELS(comp1) + 1);
+				2 * (COMP1_TX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->playback.formats = formats[idx];
 		dw_i2s_dai->playback.rates = rates;
 	}
@@ -619,7 +619,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->capture.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->capture.channels_max =
-				1 << (COMP1_RX_CHANNELS(comp1) + 1);
+				2 * (COMP1_RX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->capture.formats = formats[idx];
 		dw_i2s_dai->capture.rates = rates;
 	}
-- 
2.43.0


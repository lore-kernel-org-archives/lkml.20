Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304571;
	b=3GimpawSc/hxtxg0mYxD+387Gb/y4AW8gwIqLhRnhxqtqZuGGAnVJfAzDMPjwbTCgK5S
	 b6Vs2Xtq2oVB0JDgbpBBfWTaRajtqg548RPRoetjbP0xUvEKaX1JTwzPH62tVrEV1+AnB
	 MuFAGteVWK+YujfYjV/KffafHNlzV3JBxWas1rY3tBk/vWm6EdsSAV6WfM8IsC1kmSJLD
	 FoJYMQRj5rLT4jD85zJGr7j18q1zH5svzixNfEOHsDMlcS78RRdPnXWtQQ5meNdkq8Io6
	 8hSaslpDDYD97mmaCwYpXAJvtVCplIzV6xypZwFe0u4rIiu0t1LaBZcSHkQY/ijnBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
	b=Aa0CrR+TMqAtQI/Wb6MLNiiuYvLE5FPpekKERucQMDqcd2X4JmeLQJie5C2phpVtva5U
	 SvXM4SFR6pb/m8C+lgdTPiIP2GXmYWGLFSntWdn9E8si3YrM8ea0JTiwwyt154KEUgQYd
	 BQlfxj1r3bCsGimype5ZqC+MkrTGmNxQJi8Hv/Pgbl4Y2Te6rYZxkHV+YTnm0cnyeXUtj
	 PPYlya/uxp/g+5Mgu+BkQoHebbDkth7RHis4UqX8a5SD7PGjXISvDSz0BD3RSgz1VolHu
	 zH4s1pIOYdVvNUcK0pj1r+k/RvyaB4sHH1dLL1uhrAdYWblx5+UlLXXmAEBSTJHngEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HipcaoUQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BC606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HipcaoUQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3596245eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304570; x=1794909370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=HipcaoUQg0pdDvcbtAXJBoPA32Fo2G+7P+Qt9wzwiOElVHvFFn4SltuB/XsXbCe6//
         Efb2bL/d7cEDCPkoovWwVLnbdDQUsVFkh+k0Mwe7KSKL+3AqwN2pHc7m7fpCOj65ZNzf
         +eCW7i9YbK1dilJwdSBnX9VHeIcSM5CKyRWoYy1m9h0K7OTJ+KykVz+TU6RwX4MGCKEn
         9FzIZQ3UNTJJ+Qj/k1rvzHCxYyo862hWqQOv3MnjMFwl7TQDZ7oIFImgoaiybqliYHnu
         LnDfCywsmj5txM6hfVUM2aTERhQWgD7TkVhSda2feVR+Qlnur4Nc5yJWR3NLn8LHsui2
         UxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304570; x=1794909370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=p3jpiyzw37qI2E8sGi9u7d/kHoTpMfTpCtkfLGJMZ1DvqfJW9gOP8vZiZyMNBMSp9s
         IY1y7y1/E3vzu7q/Xz2K7TnsxchipviHakbWj3CKwtEGNtajTBWBXCn5iSGh8iLHOITk
         Ga8c6GdgKAl6APm4qeotZeDvBw51T7k9/UtRfGtu9Hp3CAcXsYuNb0lv+l4RyH9GzzZb
         cfij5mjy1BaKxOOq5uAjyHP3oEypnAN03yTxsg/m+mQ41BwOahjK9lZGidI8dkU0NBJj
         ISFpCL3NwPKGpUjrziLTV+IvOWyvMqL1u8O5xzBxx7baavY27tSUWh7LWUyaIAtDgzO4
         xKAg==
X-Forwarded-Encrypted: i=1; AL+hErEiO+ewo4FrrI5mnQQtrTx0TL27hMkKoFg8AqDIao4NTel3cCJ/OGsZ1q5xKs8hqxaHL4PjzrYDLrytQqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N5TnBozX1xwyrGT12l003xVon7tX+CjLW++3JVKPnC95TxAU/
	xWKT1eSMsDHh3ZEJSdn1bTCer90Fb64KBJGMnMUqp0fe2G1iX2bV4S0p
X-Gm-Gg: AYBFou0eQzQaYzzbc4jV0e9FzNeswzQeo13ugdrbONBs+Y8ZU6g3iEuaGq8sx1Iey/3
	AdTHh6Ro62WfehoJNcOnKtO5+YXyMSbOjzZ1/NhBo8+gX90FHNBeCHHRHK0P5SZFBxRMqpxKUGX
	ewXV14SxP4Kfwf8yCe7qRyEoNB08E1hMCyGaS1ZDYny9JmyUpNy9hqndquL8QJl9oYj/GPahbY0
	zsWvE1Y9De+tGMzATedS7p2I7K0DBoLTKfn2zgaHfjkGM7zCab1AtLRtypXmTkqe9DzjfsKFa8S
	r0Pe/rLlnWV612ejHyOMzdjm0ttQ2ZfQye/qOdBwHfYc379g094g8VanjigIxxuYjyMdwjDd1Uf
	cU7cWixoTp3VaJuQIkFTZu7f5Rlpa5nBSv6hs5LdTQ2+I3GHmqjuYNQfvokE6AEFe7ew72ecjxr
	UpyUO4BX3DNCWiaCS7PKbsriVUOGwiSlvBNrIEdFMtLmPRuBUmV612I7x4tbmDkOVurFmGc5drw
	97IjNhW8G2C//C8V/CYRLlnkSvEzmWS3yrwLYffDVRXZdTTLYM/Wjgrcg3nJqcwpJOahhFpFAaR
	3kBnffuNuzzX6lyiRkLzAr3mgrgoKn9XlEN9k+qZfL2xmujYz/kqaONtZHe5735Y+eGH3AdHeEG
	Met4cCt8QIfJTyYOlssBEJ0IteTJwKtW8pLJ/qUtWQ48Hwhlg5uxuuRWP8BK0EV+0ww==
X-Received: by 2002:a05:7022:7f01:b0:1b0:c224:5bdc with SMTP id a92af1059eb24-1b3b5fd1a6bmr2337472c88.14.1794304569837;
        Tue, 10 Nov 2026 01:56:09 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:55:55 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Tue, 10 Nov 2026 16:55:20 +0700
Message-ID: <20261110095525.504660-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the indentation fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..1f4d06a82333 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -332,6 +332,9 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 		} else {
 			u32 bitclk = config->sample_rate *
 					config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0


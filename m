Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964621;
	b=31u9n6+fCcVF/7PWkz+rNegJMlXpfurtsskIA32ARmvgDjIaOkawklj7U3r/ZF+6RslZ
	 w34JGTRWaMx/4L0Fngbo5Swrs0Vvbb7gOU5zMYqfo2JO8ftetFiuZR+M5Jr4z/kN17yb6
	 M61KhNbpWo0AwyDZeB7fW+FEiQmlUDd5p8pqglMzMSqgs1/26AUPzqfp96awN0Bkd9JkY
	 7PZqO1SBp4+ZSuuFI405XuKB+9pmtcXU+pLFEDlugMxUi/a+tWD72RhybEiGYOC0zMRtd
	 9ke4HBQ9lJEcYZ5yfMHW+pYyigw+DKOP+efH9L+a+CbnR72D93LhaUq87oaH7fxsSaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
	b=BNDUT+tc4sHvwiaarqVNUF+cdMB2AZTf0WCuEUHPTQQVupV5MYG0p50vx777ZAWi/iv/
	 WYOgS+ISUqiYibVeBMG5QkfqPcUahP0FHyULT9zAAUg+myzAsWlVPgWq5O3LJe2vvPuNY
	 4JT49vnlbRn2vPVQg+6pKucDI/fFJfchOI/eDJg8SMzt2wrpcqJxN8AYQxZNIbBgTMb3x
	 jl5JZJW0Y5J6IcIHRXiWMJCxxemIyHaXrf88Mnb/hfCZBnmB+PtZmZb47ZQeNF4lPAS3A
	 9hDmbx1NdAnSMg9lLEu/GzKN8baP6542ansAWpygwzpTfRzkd22MveUsBSEjACEgrJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeAMtGwp;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1DD606EE8D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1DD606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeAMtGwp
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso278215a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964621; x=1794569421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
        b=EeAMtGwpBQE/MsPSHuBjd9rK5sedGjxaK+JplNCLQAs5sGBpNugqDUU9nMf+BhoRg7
         dw7B0flZSomIHxRDI3rDFlUtyTMuoLwpevBUEIdQioa3SCHvu38VdMy8isA8W2H8gs+u
         jjCEs30gHTFzZi4gVCwNkqQ501deMFPGumG+vZy04cMS7J85QDN0FdFYGBKgjTATHiCO
         L9lY8VXCeHpt9fTfoaHj121VqhTUDnaLAxhSywnWcHkLeFX4Fmoh/9Ayd7G3wJBVu5PH
         qv0eyPQqXcVcW+dDfRkitc5nZHNg/nwq2lKny/PjTeualUp98k9+u8x9EPAeFzCdqtX7
         itMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964621; x=1794569421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
        b=2OvE5nxiX0kZ+sjUCtpOnXkdttdKeiACegUIORuHjDxRuafylc/CPC9Vdz/QcTKXQB
         fAkIaKN5gnfzXCUVXLFIZU7EcLySkMIJ2sPCcOpinktvul+TxMkVZQl8o6pqMtwjgg6S
         9wtUjoJznb3WnaK8tr1sKMfwtS2Xd+opaYie3lSUySGfik92GtZBqNsr4WwqzRsH9BcC
         ntxorKTycfFx3NNmpseSwlPDPRWiL1FeQsxryBKSBL/p5TzCq/+mZvOERkEeOn5AbqAV
         TGBpiw+JveLAi+1eOe1RRK5KXJpzHfANv3GC/gEZGE70uQKSS4EBYITRLg0caTl5NlUh
         pvbA==
X-Forwarded-Encrypted: i=1; AL+hErEqoL+bPUJxkbOyzYgMRkuNSeKkvQj7bzwYXjxc/aPPtjGymIr8ZBmaFvKwxC6DjSVuj8d41F466mV6Xkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQKjCEMH7nbU/CdvWSow/A+yDWZqcMifvp8+xLIXkAxFnv+8M
	amqr3yVkkvZYwVfwMp3Lrs7pRvK119+XJ5BtPe4piDZDMvma+tlvkJpJ
X-Gm-Gg: AYBFou1e0hfFvYLe71ec+2ppCzUNSyeoGGve+RmRy/5OPiwY6MIRQRFEtt20f+YhqwW
	H4tiKCnkhcYDOHGS/cpNwBBzS+AigLgcnUDq6og2mjEmb5/3MuNNPwql0264YxdYO52/gsSDOAn
	DDg/b5zxHJS3RBMcyevVeC7w/rO9j1qj+JWIs7titD1RjAHR8tF/pOW1AWEQtDFPrDmUK9HHHgd
	MecfqOdUe7zt/advoK+iWm5s01j/oGzKyaKm6vCQjTlyYG1SxqSXVeHLQo0wJrGy/PY4EK2dFzk
	CpPacKYMU7Y3BOXe8jWPdtPCjrG5gjbDTk9lQQa9Krs88mZsVs65MTC4tCZgFVIJM2+GLsrk5Kd
	WP8YM+5AnZaSvQZCNWJXULRlutr2sjb5WbWpxd6kVxh68xGCpqgmzhdI2YUL1nulqJSOhzDg/Dy
	qEJ+sYazWimd4J8+6H5gdTWq58GrPYt6iAmZebRCRcriVWo5WOir93qo1L6IRIpVAgIzqf7qA0/
	HeSJPEKHGPH7gmwV8dzerOsZSMPixh5IvI8Ya/l7vN15IctFOeDYRfwbzPTc2e1yJ8MyMmNe8u5
	RKkqm7+uvz0LYAzPaUVI8mI0DMRUScPjt2XOND8UwgbOIvR9e4Wk6AqXFaZfv693MJKdogQUqha
	PSxoJzQz6L7r3zy+vgJL29318jleKyVss6fIEZJDwZ+Em
X-Received: by 2002:a17:90b:5545:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b0db6eb3a2mr2106117a91.47.1793964620615;
        Fri, 06 Nov 2026 03:30:20 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:20 -0800 (PST)
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
Subject: [PATCH 1/5] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Fri,  6 Nov 2026 18:29:36 +0700
Message-ID: <20261106112940.53550-2-phucduc.bui@gmail.com>
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

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..9007ba1157ac 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -331,7 +331,10 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 		} else {
 			u32 bitclk = config->sample_rate *
-					config->data_width * 2;
+				     config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0


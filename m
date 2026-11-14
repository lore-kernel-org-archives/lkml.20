Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614550;
	b=d2hPBN560lIr2VGK6Xi/M5XFOqnY+Z5P9zkNt+F4Sq3b0uXVNx5/SKIzEEqhssY6wJ0a
	 WMlXZ1w6Rk0tQJvi3B7uFoYJyxurIjlsu/wnROn2lTxVkuUaS+bkDQe6s8g/K9JHaab94
	 PAyq5XG06jmhb32VIa/yjgsK4CYqLwID+VxLw+MSHUlFAEmHtCEwpnCPnxF/svIpikhJU
	 Gyyp+jndbvpcLLZSPcmSuXRbeg1DvMPESkexoDCxLi7Pc46GHjuSPB0BfDb5hyEixXQSh
	 c5VdHmfQGEaEDaTRKTR78yGWzTu+pVODZLL8rk4YIknWb5GrwEEJ1WebL2wac6pmcgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8lrVpRwH1SeTUg4RP8YGcWrdy+NFCUl+Hj58HDsxC1g=;
	b=iz7hYfHZLJ8XKU50yI02IIXIl1HMN+V9RbrGUHyGqMOT+0DZtwkB5AT+C8kN1OboCdsS
	 wvjguIEc/uJBNrCIVaVLS8DSh7/qyEf5lnG1YzL+j4HWz87rHyYaaiHnFkY38O3jpKEiy
	 TIfSn7HQdLMkzKFUQei/6IDpw/PZgiqf7U5rFEFqzO2ZzKchduutUFOza4zDPJTWm4KbV
	 /x2pWAoPK0WL2DVn5/b3BOURC8f2m+KQUu06807ZeDYowjMnZTjedlnaw13Jtx3arpQOB
	 YuXmKeMYl7i9rJlWpdh9TkEva/lIjKeVaJdIPvpIn86xAjLVBlvNee3MXo0Esv2dwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsCEFiPa;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EEF606A893
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EEF606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsCEFiPa
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso2083116eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614549; x=1795219349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lrVpRwH1SeTUg4RP8YGcWrdy+NFCUl+Hj58HDsxC1g=;
        b=IsCEFiParBLx0Mp5+uTGHZif0x9sISDjqiW20rSEn/+dj0tWesVoWF9A7YhZMB7rAz
         Z/tfEzU7GuLMW6WiKN284owZONH4T9RpCxlGDBvA6BvGY7No2W2gGLaKHqMbqsbJ8Dyh
         RwJKE3LwC8zxs+n/KYLORnoKl7uMc5EdHzeOKtdgX8XZOh2+TVMcbWsdL0h/vWvuTITj
         ZQinhgqmxoZ0Ig+HH2EucvilFBrehVRpEcT6Fg0fx8KK4X4E/li29R7tdaV5vWWCagUf
         F9oQ/GR9dmGsZGu3JyNsXVI0vyyVnm0+OkIen3lHnLWf8RIZa/d23S1SOw/fbgPdinOn
         Nbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614549; x=1795219349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lrVpRwH1SeTUg4RP8YGcWrdy+NFCUl+Hj58HDsxC1g=;
        b=hv5mfhaWiAZjiXFjrIsU7y6/m0VNaNMZL2Kb8HufV9zTO9ytrViBmHr28EE1l+YQVQ
         DlK780fkj5loeO24/qC4VYxR9L0XElQCCz7N9g8PzVdCI4oE/GoS6XLXStpp+tOCtOde
         pB+t9d8rgfTZXb4mSI0qPPDWyE9/JI6YtKZqatkZlOSvb+dYRO3TvluEOJCX7RTgA3Rx
         T3h2ML3JDb2lof1PELmF3Tw+2ytHKFcWkND4w2DKlQkcMvUZ9q7la9RwBw1qfsef+iT8
         6tZZF5Gp1D1c2jP7R1vUqwzfxoW21wCvigq/NwCcL+5EIvJIsChYmP/NByOybHklKqQu
         Agww==
X-Forwarded-Encrypted: i=1; AL+hErG7rYmlPiK+OFFXE4wWw2uBr2HUbgcb/mw2DNEzsmexvpqdcB/BqO5BwwggxUASkXD7sXg3DdD2lI3OaAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B84dmpoSz2IYCp7Dfvqujr4+tewWwykpQ3oNjyJyMyEHcuqUa
	gQWhd06DZGj4XF9YA5ycw7EyIH+gBYhSVBlR1b84MFzGwuxlpHnwkYM2Vb/MjAXa
X-Gm-Gg: AYBFou1unYiLDQbhZ+UoJzssfqfYXpd3IPZ3Dm3HD8w0onTXiFJei7yG7TSJ4ARJyC1
	ARvBQvMeLQrc/o4lwGkx9SiQVaAZKe/MSzYpyHr2tFYxNHTExMTianPUUdCzqqd1fNhRJFFg4NS
	PClyMN+90SZfNh2ZzMdlUcGlJuKq5Txk83ePbP6n5eu35s3PB+UdXElzA2r9h7SMjrLz3AOCXk5
	pegK6+tFSs0Id3XPeyZPRmEwvaEZVBr2wLXoySI9IcqjM904a9f+i5hGyaS0USTdpbotOHL8E8f
	2qUbtxeFTOrJp0Bi8FtzPzyMxqM8qQIe5cnlo4lYaXGSBwUSwlG5HHg+NGoQSbeLbunXPu1kHZ4
	Eu1Km4xDxlXw+OZ5btUvDvaxQigfard5VMlnLdxoC0E+cWqJs58P17JIwFkcb3i7YbwnnmYXgFx
	s1NUCGagCTWwFQQJjWqq+4nNdNEDUjFG9DmUuS4fwA38CLpQeClDEKINRhrPCVAnNOOCF+9vdlx
	zqyKAsNnBzczYuh/NX8Jf0Vy9+Hl8tb7CxTi7iNB1nUmDL/5VpLnBugZJSX35BUJfStcH3pa0Gm
	KWMZL7w4CjzPa7Ox1FNLPWQpS7KQQwQaOkjO8L0a6Wqtprx+VK5U4+UvtgisUHXOJD2cnyyrIda
	CN5mYFHVN4WsUyJqZ
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr3639036eec.1.1794614548709;
        Fri, 13 Nov 2026 16:02:28 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm11309849eec.23.2026.11.13.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:02:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: tsc2007 - drop redundant error message on IRQ request failure
Date: Fri, 13 Nov 2026 16:02:20 -0800
Message-ID: <20261114000220.1280581-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
References: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
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

devm_request_threaded_irq() already logs an error message when
requesting the interrupt fails, so the additional dev_err() call in
tsc2007_input_configure() is redundant. Remove it.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index d55034914808..3597f71f6c33 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -276,10 +276,8 @@ static int tsc2007_input_configure(struct tsc2007 *ts)
 					NULL, tsc2007_soft_irq,
 					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					dev->driver->name, ts);
-	if (err) {
-		dev_err(dev, "Failed to request irq %d: %d\n", ts->irq, err);
+	if (err)
 		return err;
-	}
 
 	err = input_register_device(input_dev);
 	if (err) {
-- 
2.56.0.679.gc527c65306-goog


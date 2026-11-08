Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142145;
	b=AVI6d9gZO5rHzNfSaPYED1fns7Tk7IhpzQr6ei7IhEocp+j5ghQC0SMhXJQJqhFOQcgF
	 NnHnL2Ay00f0+F8fv2UeuEmxAFfxUYgwO0dnCpUAMEGGALb8wsBUPXHJOo2uoKW08VcTw
	 0f2eEjY/EUlq+MoVSzNoxTTpLZznSP4iyUrJ6FE+yxm1BSAXlp2m6S2eXrvbV2V86KNWl
	 OuTXBucoGyG0GcZsauSXduxyQq8I75Gonv04tLWu36nBCIJYeQ9T0kw6bwxWKvpY+Ludm
	 AKolamSxw9kzfFKNk8Vi8i4I2FsFb3MG7iAaTrV6NgNHrtZwR6mXDJfJXyw3QMAb0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
	b=uJhAHSLADdftxXTsMathZOP6x0zlQTVplNVQFgCDYru4xDyNtdcv1SP7+H9XQ4aFcubW
	 wQdApbpE2z5PzB8mWbbgPk+VIZVOB2XrF8RjoZIg/uUlkpiSgJwnGN0KiLHkMsfJOMdFi
	 Q7zhNQj3ABMuEhKrf/Xr5tVVHEkwLAD5PcYi9JDSmqatrcGirjfHZ2Wm8fW+UcwBK7smc
	 Iqs522edlhYrObII9nwprtWFL6S15+Z7oQhsBza+oUxiXV9RJ96nPS80dPZYmijZ0PEHw
	 Xot1bE7C7s+3GZo+Zf79PsYWaLGEP9b/qDam2y88tOtTko6jbpBi8xi5enNeoQJIeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/GnyyAp";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC99606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC99606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/GnyyAp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so39780eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142144; x=1794746944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
        b=F/GnyyApRoO10GDbYSp2nCwlsjiU42Ry7MGZ6FP6d3OCb+QemBT8q7Mns7xk3h0/WF
         n16lmhb84ECKt+cqa2lrpTo4xPBuxtEGOG6fBQTaGuMGSaRXxA4Mz8H49kr45Tsy/YBT
         kEovkWomHHnNSAGRPGW58/W7VH61cUw2xGhHwLbUu4bgJpsIIQ1vzOsOVdCCxjo0loIc
         4K4DR/XKtCI98o4i2ZseI4m/Q5v0wwbe3H2WmbYn1bI7g8wl5+BZkYnIaxYCyxS3daJA
         1FUowjkuZlFjCB6A41HS8rSObJZy4ElP0Ks51XFiA41JVBpZzh0hVnJmibsUekvELwZR
         qSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142144; x=1794746944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
        b=H+EIJ7X1TbTBHUJf1rKApBy/G3bjVn2sUyqr0uQKjExsYp+Zz+h1GD+gYEgXw75g7a
         kI9KdwH0c++lwK0NVZcbZ2CXDL+e1IJjnSU9TperOkaQYU1+DRAx1JVTSZ2LN/OPZvVt
         M6ULCrEAPoNJz2TvyDwCWYNTYFBkTvk3Om6vNI9jwBPPsJw9j46OO2vJQamr7S7ZiLY5
         PIQH95Td2MA/n+nSvbsSCtPgTmytCJVFRft8/KgFrw2cIebn4g1MQtE4Pk3z6fAeiGtT
         xsf+DZk+eOOwqU13cgR4oaK7f1Efaf78xT6ySC2tgeOkPCWgS7qoAvpONjUYEDpyBGW7
         Q7yw==
X-Gm-Message-State: APuU4Z+niCx6J1nfCoqTVBVI57cE0wNpal0HuwVt8LVl0oEGZo3wRZlC
	iXtjzpAQnuNyBy2Dc9DKFbplp1wwLMxTMR0ep5O7IOLI8aLLAsebB68+
X-Gm-Gg: AYBFou3G0hrhuK4oBcyuSzrdfvXM1MYhy3hl1XnrysSlf2rQBbMQEDTLefNuSmu1328
	iB4/meRgELDfbEyq7zBhIf1JiiNgaVTRV7EudJIDkR3Vhimxdd+rbe0SRGyL7MGignWw1uTXbTs
	hG3ISCN5w1BzwuP4M4HagKZ6T/E+VBE/3/buiHkauQEErjr5zvI556h+dguyZO7TL1KZMeDVX6a
	e5rLzOWVlQDJcx1ZNMjpm3wzThmlHGI7kpVESjjedJh1cU0Gt6pHJkNbWeOmyhsfQ7Bzn1Sl7QI
	PwbY958JWWlXUTD6CLXxtU0WDu44rpWHEf3uNJ5lBDwLjOoiY1081nKSk7IIX9jafJLpPaentjF
	bmZ1pMboBFSE7+CcaYgxa/D70XvGcaWMJf4rYuIcSKlHnVNbsOJ6d8a+IW+zcw33pokluXQDXAa
	9VFxOwCenYo382n8j5lxIWxRFHsd41KVQmG6iXxTTPJcQxDuEGEuAeRDeZW/iEp+IcuHYg+i0Rs
	tYKLFDv7ODOBTDfzvs/m+wEHXXHi6WyswINHGuNcjLS20kDhbeSRhk1HC+ZSy30fwqLhgqlA0VC
	uwBTnhiNtixh/7Bf2q59I1ZGaWqkAd8ZhelJ4IajhlJJsZhUXtQEx+P/yFx9hfxXvrFEkEcl
X-Received: by 2002:a05:7300:51f4:b0:36a:37:1404 with SMTP id 5a478bee46e88-37256decec0mr2836795eec.13.1794142143927;
        Sun, 08 Nov 2026 04:49:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372631df629sm5431728eec.1.2026.11.08.04.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: [PATCH v3] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 12:48:32 +0000
Message-ID: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zevjwmrf.wl-tiwai@suse.de>
References: <87zevjwmrf.wl-tiwai@suse.de>
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

parse_uint() passes the remaining input string to kstrtoull().

When the input contains comma-separated fields, the string
contains both the numeric value and the following fields.

For example, with:

device=1,subdevice=0,name=Master

kstrtoull() receives "1,subdevice=0,name=Master" and fails
to parse the numeric value.

Stop parsing at the next comma and pass only the numeric
field to kstrtouint().

This allows numeric fields to be parsed correctly in
comma-separated input.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - No code changes. Retain the v2 implementation after
   comparing the alternative approaches.
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..3f54af2cb505 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -458,11 +458,19 @@ static char *find_eos(char *s)
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = s;
+	char delimiter;
+
+	while (*end && *end != ',')
+		end++;
+
+	delimiter = *end;
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+
+	return delimiter ? end + 1 : end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
-- 
2.55.0


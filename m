Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982280;
	b=qx44JnO5VrIy2u27barPmWvjDelSeGhLOKv5wrgbxULH9KDXzIYby+Pe1m6ae2cy7eEI
	 0kwxfeyvPDTT2zIEz8cCmAcyMEUQZ+eWq1Bj5hTlGDXAJ3DIoX7HttN1IpCnv8ER2nS3K
	 tmBunNYorbZEIaZ80r0e7UDvpP6fZEp0SzOOFNI7Xgi3IGR3FZ8d6go5rGs23q+cwDWsL
	 zCkjVqq7WUDU6QutN9HvXJvgSBfoeGgcAxBhq0V7fgNV55/dD599BjT1kjEiLFlxqYfQ5
	 rWSxjVHy+mNftngYgobkKc58Va1jFIfw3ZJYPG5sooqiq95k0ITNZfispFucTxY34fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
	b=buWdmvfldLPiOWoC0TAylw9BFeiyO+gOBazzCxhwO3v5z5t31TrbEj+5j1fU/TQLpsyb
	 vpZcOJmnRgkOlFaG+aE4Z1oE2bCw5g+lep/fsB1Rl5GfP2tBmSoCeBBBs4aJln7v1TyFM
	 v/sqU/N8RK87g5yu7wBCSWAFeOxxyYwycw3moZ/beedDjFI5S0KJNZPqYLf8AFdaLE65E
	 oAJauIrHg0zGTbOk1zlHPEpqi1gKCuv+VZSA6wBNOjW2g3hEoblSw+tJOQM75rYdWEtU4
	 Tsac/i3isCaD8Oppe6DUYUO00UsadleW6Uz/Kv6//6FGtRyHsTWPNkHmKdGSOXehDzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho7rc495;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4BD606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho7rc495
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so1495641c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982279; x=1794587079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
        b=Ho7rc495MHCfYbk7wHBKEoHA7l1caWmwiri26PQPjAfL/FllBg0xjV/SkONrXq/pjh
         wI6QRDbPYPZvOQb1uapbRLWTSWRdJsNuOB6A4ZFuIvRXRvDEqQgtUYp9J9w/rS9XlOAy
         mlceQsdoxBngN/NavCejH23hxFM9V+9FyTcfRexgiX0s9HNYvobTLqpzFKtZ4kCX3NK+
         T8UyUHvtUl82WNJ098naz201l03upatpYTXL6qCXFUr113dcthiRoil+ewbjOiJjytBD
         /H8vZwXW3yh5PUafAwMUYusSviNTRrS6haIxSsQRs/asvzxqBeBYMFUUBSKU0YnynT+L
         AXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982279; x=1794587079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
        b=sITvCHPMrTExbJ7nKdrCR3FwLrjxHwNnvV+U0fEhJdrwUC9IQ3Wy/EAtbbfUg5b7lS
         MjEQP2FM1zJA0LykRYblDoF98gYqTqM280sIGB5vTtszgWwdhVMTXDlqSQWIOotbZgrF
         G6Xcms7IWKXkTeJ/4UFRrpjtz4vBYMp1LCWo9YbuxJXInWFordKKz0l7F+9zrKeukqsc
         jA7r2XimSsw5ZQRbX6L6ZL7HcFBlonVUeu/V++GyHnFrTV1UJk5cUyzb2/SyBsr670Jw
         GBUearHoEtP9xEhaUOCyRI2CoDUWigjzMpO674CTG2aXbva3hzTi8eyUrUz/jnnazNT1
         qilw==
X-Gm-Message-State: APuU4Z9vxhieu3Hm+d+rjdoys8LIRcsuDG1HmFVJV+JvcdCdySv+Ibsg
	9reT1BACfik+MzXkmboMhBgkUwKeSx+frlLWepm4Al59xMvp4X2O5Uhc
X-Gm-Gg: AYBFou1y2VD9GxgQUK01mtkX2dudiNIt7fu6lTjiz38z8HWdKP+/LPOHz+2/NmtrbjQ
	5HjaYqnsDdBylWfLb2PH6P3/rrEXNk9FpEA7QrRiP+1Ts4befdbynQKbomEzi4u3R+S6W+UaG8Q
	nIm0pJ5m0JRW6uEx5bOYesSGWnOruO+Jc4zKiZVhj2UzVwKlET5IMdxfWvHMUum7hfAqJ7Q/pj3
	EkkscKEWj8IFfdBi8WEjM0Ame+F94XpFBysjnIXgM6vwuj81wP18+na5cjcDKzqNA7zMzRQDPDH
	YT3HYFbVrE9jCdL476EoogbmdyHZC18DgRjZAcWgBnT98CZQAViSjBOD2LP4WUurxkQiZks+pyO
	w2lvBtHqgO66sw/GJa7IfV5laddvWVCF9T7i7ofGu136QeuPxNRYY8rPeYhATrff+qllzi/OZ+6
	O9DVGPy6xjUPrJlkQA1Wphu4P9M6+8u0i3Wf7fkmpt7giz/SNFkNpoGjCPG3Q6XSpc94gLB/jxw
	OSLC6Ohcrpd3y+MAJUiR1fPuLSEGzJskp9JInvWVGhKMprFJMDvfz7uJnenFDlql7wyNpunmvFm
	/gxYiQbMIHTW1w8HFRz+qZ/nRKA5rzry+ke1RstS3clXTe0Ftzdd4Uab7J8g7YS09cThqsxMuA=
	=
X-Received: by 2002:a05:7022:1081:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b25d318451mr3525212c88.17.1793982279059;
        Fri, 06 Nov 2026 08:24:39 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm7109605c88.1.2026.11.06.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:24:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Fri,  6 Nov 2026 16:23:57 +0000
Message-ID: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
References: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
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


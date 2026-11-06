Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979987;
	b=a28+7hSNsSArFanEsFE7kF/mubP/B2iBExF4aA6tNmO9Sce10FsNQWV1P3AGM/JBwPxs
	 kOosWUBNk5mxBC85LqEpIz1OvOXkunprL4z7jSQjargXKoT5Eabvza5HL3GEr6SgsS6wZ
	 n7iFDPH3oiv+NKbL6OkFWZXfHUioptXHRpCaD3MVEL9ELDwmfdbQ6MbdBNakqPvqUkgwh
	 Q2IdgBeY1xTpUNwFdIuCX+hlrYwR7qDzwsRFEuUCloY7l/s9uCajSRbejlVMyY230xoDi
	 3Yvl93TPm4/T1uSWjMcIuWf0uXTJWA7G03I/LsHPOill7QFkPmHpIqoY8253YmI3yMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
	b=kaQ3lum1adfeheVWLPiA3rmJb6BxirzRPlYJt0CUVZ3bHSuGJM7woy747mgqmeoTtHya
	 QLkCRjHmpRcZ/PaMSAzhm6jcqJ6e4/F/nZETk50QpO4p7kF/8I1pX9bjTi5A8QzqehpQs
	 huKegN9Ihgy6eyH2+6QachxtmdnADMOAMYmiTCY24mB0XStAaIOKrmlZnpnMT1UqlMGPQ
	 dMhnxfBMKELZNDk4MeAab08QJKKuc77P2pvy7+vfNsrDC3bf2mrpFpcL0JCERV6ti0m0O
	 xrnpEm7e1iR3Z55+CuGYs3wuIS93bwCh4tTYtTv4qWMBo7PuPD1Tv8Qnd4N27J1Gc2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH4lMIqR;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA01606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA01606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH4lMIqR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2416330eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979986; x=1794584786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
        b=AH4lMIqRxrK9Yn++ZiOYG1DE1mNzprHV45udIJT55Vcmm6lON0UnsdB+dzhrgv7yIN
         eG4YlbXSMNvbmYqOmTM8gUXlQbU7YRIy6U0KMRJ9fdgJwp05cu61cG65mjrba8x+Ioab
         9TiGsqLfKuTAhAwW8U0Qh36agKSxfrNRd33x6ezr0KKEnnRODRIK8uUeh5FIJZgLO0jo
         5ovRpmwK3G9Fq9KmN0HhGfN0/tVyczwDwsEPO38cBnjBbNt0LCcnimVoVI6FAk6fEr0s
         U8XSZ+oR1qjRLDf0UggeSISoRxe8ImIUEkvzE/fZVygaENJwXXJLwyNK8kIXsRdpus0D
         WSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979986; x=1794584786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
        b=ojdrM/AzVHi7qyt4r8/YeQ7gTXM/riXeoacO8gCdn15HgROOn5yTBWOww4HXFczoT6
         GQxZ2XUhvkJAhT/IlDZBXvWmTBzcvCsppStGHnxQwml7jwIig2fBLhp/U1fVduPfdLxU
         amSfOV4JYZzNTkI1sixhetywO78Q6jMcsq1Z3O/7xEf0tH4EwLsG6oywkhQHpmEB38eN
         /jaZ0g6FTFTomVus6Pkg0QkNBBnPz1z1Nv+JcIhQv4+qrEu3h0o+q8w/LrlDBBt9Fgfd
         s+3H8lA0o9TrPvdHURAhsvbA2oC1eTpKJeLcDZXd+Dd6Z0VyznSOsu+J3yjeBMkmoCKM
         Vu3A==
X-Gm-Message-State: APuU4Z9aWwhJZM3N+DOyvUbm6cSvfYGJc1xWgv8lOsw5mxGNlNm3S8+1
	7vteHBWoWbEMXNPJycEIYcKJ5yhZnEyxa7q8bouFFmNTXP93G9t8hVAy
X-Gm-Gg: AYBFou05FXPke5RFWy11OE6/icEiZcFyz9y7DZYCTHoT7jJR+9KylPf/pBwIpPqFYYc
	rgTd97q/cE89PpYSKaYAnBeWhG6eIZPbZqkOmovbG4fel9yg0qxtqSxgb/6jfCL7e3KysyzEC78
	L6qf0QWvP7k4yQuFvcfLi2Yex1sa8YzEqXML5LQX1tsUuP9iZ1YQoWTkfAYPxdvthKCUi/RPzx3
	R8SgLbOPy1AVIRee9viHwyDfl4ZlYIzqHtwy/0rTUXp3J27D2buPt6JtBuqqFrFCeYs471L3Urq
	kQQuSPiUBSTxGEAW/reMg+od2yjyXTLTfGv5UqxWvQCtEytHvN3ttRpnd/seTw/V64CroKfSS1R
	sarJRFPkI6GuRI87blFAK2/04cfM7AuvES0b0qg2eDVNCuhjisAQFFM6cbBqJqLQCPOGHphq788
	FBrYdG48YZQjJ19/G/FjU1RK+L8G8N3JKd5FHN5/yJGcL4EJskY5Av739gFQKdy3cI6D/ZQ2msp
	UDcu0+qx71kDqlOg6cYscJd+mn4tJFGVKGqAOryl9MZSMlQiGv2Z8zecpo7YS952Lq9FCMiNi9r
	oo7B8dIBtUrRWFFmR7sFUWKGzxYppyEwX7O4DQXbasF1zgDLyWxZ
X-Received: by 2002:a05:7301:db84:b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36f76425c51mr3566033eec.17.1793979986027;
        Fri, 06 Nov 2026 07:46:26 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faaa8f1e9sm7029182eec.28.2026.11.06.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:46:25 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Fix parsing of numeric fields
Date: Fri,  6 Nov 2026 15:45:45 +0000
Message-ID: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
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


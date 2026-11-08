Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110420;
	b=IJYg+Gr3G3JckUPCklTq1c0rHjPgMOkB5mc2KKRz3Ns9Tz1IyJ148JdYCCBqTKE67/xO
	 UZTKTA0SiFXpQGGyCK6mPy6+DTFXT+/t1C6LXiTiDlGkB+824aGYnzoFef77//GzE0sh/
	 PKv0NujO2/wFHBdufrdGKCMCjUBG483fLD0UOxNT3G+DOa6oChBQhkedTit9/+BhbFLqB
	 EsJ5KcVUYnTA0C03W4IDBj02cUQFZV5+Eb/EPpjyvzTJsxjc1t5awsZjW85ss3oAC0O3a
	 8eiovQ5XbXMzzu1Vx3GC+asRb8fLETxXGkZ58XG/T8i3ge7zLqMY1Vqe3gWBQuvSAbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
	b=EfrEkKYyck0Duq0EaKGoZ0CCA+X5qh8XLPCaUY+ecuOgGsP2BiNCX5qfzqz6I8oRHlFI
	 RzgPTCUQKOzvlRNV/1mjZUNoWyXpigyenudYsF42KqW+j4IWln5Cm6obSqE1tWVci8/O2
	 ml38csKa+E5VWGDDsDSgPWFJacG2ndBbtECC5w1joFgj0jO0neVl3SWfMw06+ZxBDPL+B
	 W74t+mmE8vOb+/9u7k3W73IK+P8cq65RZRN67Flri1zsV7DDRuNiRQBymWsRww0gQnnpO
	 dE8ppdZ57Ucefq/+sJ9nZhkEGBtMCz9IeIcMqw42eRi+nBmMgHiFKPWjNrSwn4aZFww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbci8Mdy;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B64606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B64606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbci8Mdy
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1833705e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110419; x=1794715219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
        b=Jbci8MdyDs7lvP0iWjUnTWleyq227tvKbfMkxpoFnHFQtYGZdk/g+ayOvqRwkKuEmU
         XUWVyBexBNKiir6fQT+eEDXF4wJVGEigCcr3PwfW6zGhyTrhqmy4dcwPKMLVqXdEZw8J
         beRgT4GvQzD9aEMdkTOuXelzaeHrZYgqEwxkWt8gVyX2qrKP6TbbweLXttYQLAQm+fVT
         LpQ/mTO63hqbCbb8cTGfMovVxJXSem3VnFPL4VmGlZ3EAO0ML9385pWXkAzxBom8a7qu
         UIHV9Bu1o8ixAEnGOpi48G1e2wPm27j63oGa7ouylS8URrEWlGFIfcG4YsqrR1H6eeGg
         ZZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110419; x=1794715219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
        b=RyyRB556OCurrBJbEAECttlLcBe9AmHqi0iYUL98Rxqcvx3vjiRhDsmbBqktQczarn
         S8kKfvC6ZHPvNxXGM2gIH3Ws8+YJRyWfX5KRCGF+xVB1iiZBHKV/n20e6LWsbPWwVN+m
         BaKVw49tvm357VC5Pef59x/+02e4NTs2OROoe4wVeZyBX2Hk/UyAEPeHqcNzcLoo5jJk
         o4aMv+I0ebMGdqY5C9t1TUabTIiS3/P8In8iYk+iD8wVkaQWrggTbh1ZNfgVZp2FIhbK
         wz6HL6/XH8jGoqW9fGQhGJA2rw0Q2nxYGQO0KGMU6HfVhTyy1O/OLdngNWImGidfB3Q7
         HRoQ==
X-Forwarded-Encrypted: i=1; AL+hErFD/ddKHrV+ziQ/8J7Jw86crcNtiARUyWjqV9MSynBnrvv2wdLsUdSnBcT+RvWukzxbkW2JJ2+xVm0IKc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87aGFtE759bdcTNafKeFcEdlaG4fZ5jjU/7jfobEAuW4J42tkQ
	qiyeg3LLUnGOrlBIerd8TEKdFbSSaSGzXc4F5UF+6ujvAGuOlAdVGIgS
X-Gm-Gg: AYBFou0u/pbfvqGF2cBcZSSW1dJlbgLvKbaYCjJtvOOD/QOYy0q9uFxawyvRSnYQo8j
	4k0/yecEj6oPq++mePz5MfWkwvvM+iQiWZPiT3w2h4G3LzlYF71X2m5w3yEptDW2FOx71iM666g
	YKb0a8vt4XWMyIFGbEsDXbPN4X9rECPjz4xlMvFsAevZseewjjIZ+zORcZFQEYAa6rrxCysFfly
	RmByVCzWgypC11eJNDoDdYNfxZvbhzldWwxUL3hGXNZLloVULIt1xGSYKzmQFJGjBSu1q0qziX3
	KBlBN3+jqOvDmRZEltL9/O7x9o9mArXrCkLuD5DXGDWSjoNGJxb16otkksfa4McTXYrFV+fztpb
	+lLsS62jG1GcGRgX9jR5QCaM/kCudosoz377Zx4pcbSDMWxWNYfLoSj76zfG9VY5I0bUXovz0oJ
	1F8sfIRsrWqTOF5NSm1GuJ8tVr49iabNM2HOz9U+W2kYubuimXSGV0mHC/pmVLxX2hjOSK2TNRQ
	PgwgG+VgarQKDyFpkzX5k+ggZWUJJ2i2YGbv0my/TgWm0iXr0TyA6hSfGAAfb3hfYtjEMVZgihv
	IDIPxPe96bVRKA6kHUEm/6H91M21y2eM+OLqS4mlymbwNT/TRQ7D4YuDb1ScvA==
X-Received: by 2002:a5d:64e3:0:b0:48d:f02e:f7cc with SMTP id ffacd0b85a97d-4958a7c6923mr1114269f8f.24.1794110418848;
        Sat, 07 Nov 2026 20:00:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:55 +0000
Subject: [PATCH 3/3] hwmon: (max31760) Report 0 RPM before the first fan
 speed measurement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=976;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=FxbsRDhsAQeAHLIgbcYP9LMu4jEFLcLLaEvT3bHxu9Y=;
 b=wERcTEyMpU2gPovn1JsT0bI0NE5XWiD3a7OxYeL/AYkHtOSIaWXEhy1+V3BnrtT8iQxUQv3nl
 2QSLWq023ovDB2M9l5j7nqaWTYZxYQkEYIc8Y0FRvIl4XHkJcCmWvYx
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The tachometer count registers initialize to 0 until the first
measurement cycle completes after power-on. To prevent division by
zero, tach_to_rpm() clamped tach == 0 to 1, causing it to compute
and report 3,000,000 RPM (60 * 100000 / 1 / 2).

Return 0 RPM when tach == 0 instead.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index e967555a21af..896bd0326b8c 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -68,8 +68,9 @@ static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
 
 static int tach_to_rpm(u16 tach)
 {
+	/* The count is 0 until the first measurement */
 	if (tach == 0)
-		tach = 1;
+		return 0;
 
 	return 60 * 100000 / tach / 2;
 }

-- 
2.55.0


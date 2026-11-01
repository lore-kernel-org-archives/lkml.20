Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542558;
	b=QHFnEQG9W3a/bC5SZN8xa3c3cD2TT65rgQ4/4QtWKw2tBkvbTiVsD54KxDiOHw+zKg0o
	 9ytn9w/p6/egBLWJ77goyrjBtUnyV80t7RfIBZ1osDzPEBfLoCk79gx0Sb0xjkawV9Cdb
	 0gmUK4hq5UdkDg2NiXkwz6sa84qs1Qth3x7R3S97g516bMxxofItp+TodiW5fDVFXue50
	 dWnuFJ4oKJBAGdTnVl65SLdwmd/cYcx/7QnZqvnGx7MTZfpSiO2m1jM2OzKaANADxgyNg
	 Elz7xVtAAYHCYIhb3MI3xz/n5Qd3lmyuI34x9CSkcs/DLLcB783YlMh5efQqbmLEmmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=769hpgxROXRAK1CXpDQbulFxjVtDdn47pUvYZPyRQCA=;
	b=kH3qxd+widR/YGlh/N1Y5k5p4ge2jcxMzAnVyPnQ6P9aE/kFyFsmnyrjjgEXWpoU0xCr
	 H5HlXHV0ZU7FqGBEjtxRGsTlDMaoM1WEMiXc5pc2dmLMQJyiwJG5wJfpK+49/k6B6vLs8
	 L8+KeEU8Ulk3QRgYkgfVNo/VrVnV8IK8HseLyuNOPOcX6kmmf+PU+K2KJBGrtqmkOX1VO
	 nPM7+4GOW2OahOA9vVVyHYgMj9gvLFkzKhjBSuwsp2nMvp+0NgIioQzd2zhYocn93EjJv
	 Dbw8L2uM6ZBsjocA0z5hpsumyD4Z0EVDKYJhTTkL1qGJoOmNzY9YC8PI1PFmHlNGRBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULMoVwFg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9281A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULMoVwFg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13635395e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542556; x=1794147356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=769hpgxROXRAK1CXpDQbulFxjVtDdn47pUvYZPyRQCA=;
        b=ULMoVwFgpt0s7xOu5ZTRKirGX36QMF41yZki+Xb0lQzC/yxeDiVJqIIDlKYGdOQu6W
         KZPmT/TpnEdPTfOQFj7GltR5ip9TRh1mX84ZDbm9FaWkr6DVhk8gNmY7m75GG+GBQpHm
         PfkvzAdDwGM1QDofc2Vcg+06KHnu6YjSHXs+c5t4ZpV14WIo8cYBG6YEBPDQRkze91dd
         hx51tpm0UbFdBbzMUPVA4PQyAqDoyur0loyqE7P7vNWx01SZEOcUyUeRP3KBCLaUdHKh
         xPaq2dKfLjTjqBb6uG/luocpRMWuF2EdSIm0PdRBHChFZWatdSpmU5xYcwaOsnC+59VU
         5M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542556; x=1794147356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=769hpgxROXRAK1CXpDQbulFxjVtDdn47pUvYZPyRQCA=;
        b=rSElfyjhg4D5S/WFDLK3OXjifGyQvt4H3Y0g6btdmiufDG8vo9g4qm1825KY3pmcY8
         yQPwRphsy+W1vaQPntppE2xV3vSEcWxiLnRsnv5rfhowbMb6LFXJueolhMmxZ/yaD/KQ
         K1SAbEz3gaKU09WsNKDWCGTUt9jLt2MQVhiJr6v7ktA4wTPon1Jg6Z5Nffvg26qwT3Xn
         SQOY8gqEdyM6DvWihIZLm0HuUmrarTstF01V1hDfegBROTt2IFroc0WkcopEYsUfsJMU
         ULoq1P3LBd5V8intg4K9BDtSY237xYL2X4CSuuKZWToN9PdWL116OCRX6GSzahSHvcz5
         hHvw==
X-Forwarded-Encrypted: i=1; AKwUvBy1KLRat4tflvkhLEKgDxq/yU+hzBT+5I+beX4BswQvbmAS3v9TWGkvhFw/AS+uSsovzUaOz/PSYewrxp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLulMrtQkO1f+DO15aDOw6XPbhSF/GiZ5u6rqzm84HR04O1LAN/
	qQVYYNnwBp2XOY1T/vfIuP6FpOP43T9mYYJ5L1hicUJAsO3N7ECVoy3thOuSxQ==
X-Gm-Gg: AYBFou2tSr+Lwx0zfTpoPeT+VVF87AShmThfBb1zDf/U2MTfnZV7JfDqP9T6LoEh73o
	AxJibIPjrM5is2+MlsFe8K3sU35xGZuX+1kN6MgFUAumpqL+B+aVuZ6w5/+SLphaRNsef/tdVts
	XQK7+55ItCPFLMMaqbZBSri3VCK0CY7KmJ9oqyS9qpKPxOxc/Gje86eqGamGpzeKAudIDyn90ey
	Z/3Y5k75E1QdXtdmOfj6MQiKZi+rBfI46QuDJnScXcMXgwjD12dOtkW7fXFxItFaQ/SulnDgRBb
	NbLpU6FE+GzR9/rdzyMYK4PVxgjofgqwuGWe2rLMKyWZI3HKYiZ0c72+HUefXbNU9VmnvEOqSR+
	Wm7izoWXkyQ9pNCEsPxE53Jp0vKJR4IfmnrVxAFAqBoGe4Sax16ICj03Zc/RYfZAzyrvFZ+cB/r
	g1A6sifVTlUEeu4qCnIgRNOuT7nc1Y/riUnYcW3Y4GplUmuJXT1dZW9lYZMYAp0Jqa6ZyPTvYlx
	OT13lzq+GY/BtPVMEyTEVETFDIWvEeO6vJcMhHIAWletQuvYkROdvDcwtQsrBlhXWHV1TDdpdfN
	jFfKF4/cgVUzl8i3aIlP/+Qavsgrps0qu7vkkvNfzPQ11QwKZXrmRFY80Q==
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr172059335e9.34.1793542555903;
        Sun, 01 Nov 2026 06:15:55 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:9c55:89d4:b00d:2bbe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm185124735e9.0.2026.11.01.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:55 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] hrtimer: Retrigger local timers after clock changes
Date: Sun,  1 Nov 2026 16:15:53 +0200
Message-ID: <20261101141552.644764-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

clock_was_set() selects CPUs whose hrtimer deadlines move earlier
after a clock change. smp_call_function_many() excludes the calling
CPU even when it is in the mask, leaving its clock event programmed
for the old deadline. An overdue realtime timer can then expire
only when a later event triggers timer handling.

Use on_each_cpu_mask() to retrigger the local CPU when selected,
without interrupting CPUs with unaffected deadlines.

Fixes: 81d741d3460c ("hrtimer: Avoid unnecessary SMP function calls in clock_was_set()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/hrtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 17dd38a6cee7..3133d7403a74 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1000,7 +1000,7 @@ void clock_was_set(unsigned int bases)
 				cpumask_set_cpu(cpu, mask);
 		}
 		scoped_guard(preempt)
-			smp_call_function_many(mask, retrigger_next_event, NULL, 1);
+			on_each_cpu_mask(mask, retrigger_next_event, NULL, 1);
 	}
 	free_cpumask_var(mask);
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0


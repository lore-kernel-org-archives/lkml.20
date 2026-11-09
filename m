Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239111;
	b=29PrN4Z1yza62sNShwDMgVn5mIKsnQjWkzjc9hhbmKVCwIwR+GtTJI7EE8QKzoDP7LsW
	 af+8EmW8KHnWb9F3gvF0IPkroI0H9e1VLspv5DgDplKkVl1D29X78GS0BqhVOrlunxwCi
	 +HTYayQAA7HruOXRtAohGZts7J7g6THqEVwJoIcXDpxVqZTKobGOhxw9bjRqSakYRaRko
	 56v2MoB9uMmKjgIwttyIFHFo1LOtHpoNufpWM22fsbsbYzsDnBwvdc20hEVzqUwwprWEN
	 B4BqpTwP05qZg03TZPi559Yo4TSVHO3GjfelAjDnk8fn4EAl8AX8AwWQ7NRTpYnO9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
	b=4PG9LPjQhAGsz3g1kA3KHfl18hqovt3lHSsEGSUP0l9FXuZyhJRgIS2ltQkBVAlD6i2X
	 LWZUCB3r9fDRPEyf5C5FNBruTbqXvHJi5p86mXbnxBZLU/jzR6kNFpNuFeOVnbQANBfGy
	 hWuxV2UgENIf5e6KdLku9YqxVeyUlKRekG+cWJueMROWJe2BigHdw/VXNijCzkj7bflyY
	 dN7i2PAFk+y2Fr9aPIDlaqE5567C7hZbdIYxkW31GfvaWJCOfjpQOQRkAamDrplJXEu2D
	 6seahpawsaA9YF4BlJcRGr2BNW5pYLDaBpq33rbn9f3o5xWIKAfC39HxOfCOsmkIbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxMiVwrH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DE606EEB4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2DE606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxMiVwrH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15097055e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239109; x=1794843909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=kxMiVwrHgthmZG5BwH+M8Z/aD7QF/ofqnxPCU+Eu92AUH+c1cK1DpdSeAK9TAJjwY7
         7sMjuNWTQasTENCjxM9bbsMcrlKik0NA8N58kzbdqCDhjyYsCLaXuP1yUnfNSwLsKlNd
         SJRfy3RU0210TAvojGoZsNPp2KPGZo2KkKeUW+v/fGCcHXnsYXukEjDSOmVpTMf7vXgl
         eEBAXoLRpUc0/SCthO7tczp3MpGejFcn7R1po7DtzPz+OftVLFE74NloYZvexw8zkUrs
         BKwkaQJtXXb7QQWmnIEKRf+4OjzMuXTStte2OfYkD0sfJyPqwg8kR1+wDRV1UOu0xm74
         NTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239109; x=1794843909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=qZ8yZGr4Pn2oqCa24PVx5VF1uGrV/vrVgShwZosGfqdy587hNK0zsCYCrEHkdEbNcf
         U3VpSLGVweHrW1wpymtTfZMQIFmHKuk6rqFt6H1bKXR0dHCPRtCs0cbPs/Pv+8EUla9s
         58JytaT85hyAtLY7Zy3Z3a3r0XeXcLRzRS88D2USGZaZa3fmZXJKVHMRPAgZUEvKJBKl
         n4m8LvkWCUlXcef6BCj/WO6ILAOVrhfJoApygkQsgg4efcSTX9ZYK8rVkDYtPSrGU8ss
         zLlV97xTIevfTYSSw23lPyIVb6QCpZu2N1lQ0v3mfx/bKwyHbMtmpBVntUbQhCMQ1krr
         X4bw==
X-Forwarded-Encrypted: i=1; AL+hErGqLWEVmvwM9NPZ/DWy5qeOVwpPuNXfUlyGj4+XsQ3Kt3oRQ+bzZJP16Rx2kbgTXiVDpBqXrVJKRWkM/Us=@vger.kernel.org
X-Gm-Message-State: APuU4Z97z2sKAvVa4Mxew11e24qdEqlDSvzjO64kt7pmPR4xPTLTyFeD
	mVh02NrjPZOqsOeCjyGx4/I4B7tuWyA7khFf8Dk6ESIOQBIqPttBFjeP
X-Gm-Gg: AYBFou2C+QbTgLiLjS2JmaMl7x3rCqMpfn7yU2+X6lSgP3axGjXrkQ2mKUW7LhI5AHp
	HIAPsmaAWsgCYzYktOkWti9YFxpaLX153f1WZm9DoD10R3qQlzbYHHvvOGbbjUWqXhTena0v9sU
	XiJERSqwdhwC4JmGleEAQKeURql/jvbSCLJzuDbyw8VIuhs5i5/gDnTADP8FK7VhKV24DeGMh7D
	QpPsJzB4CRvIHbG6abLWwsWQZs/cK4OgM7y4Uk9PNu1+EtRsBZvw1iFKqeCJ3pREHk+qNTfnN3e
	LS4Lkd9qXN8v8/XqWchz7TUI3BV/5cxbawktZOMKICnjAzRuIFP3N4BwtHD25gpe7+ry+eHaSO/
	4KmRxECXFtvh4rDLRJ14jZ93StXGYA+mzskfVRz8/GxN9TnYCAXggtvHfvLYj639DZ7G5ngU5yQ
	NbBqcqgTtMI+AVe0g495wZY1BIuRzUIr6RQsKaCE2+VnXbzkpOF7kG4CPkxKVkQlKToEOjd8p1N
	ScolpVBgQ6tiQ3mDxYV6do0vRIAjY4x8h3FKILiqJKPoUqc4bD7WzsFX2j2mpcLx/PPVNIw7wsV
	yenmdlqUWvmXhykQVJRaepYoY68V99nEJg==
X-Received: by 2002:a05:600c:1d08:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4b960d9b26amr81779735e9.7.1794239108805;
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Mon,  9 Nov 2026 15:45:00 +0000
Message-ID: <20261109154501.63762-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0


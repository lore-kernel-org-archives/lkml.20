Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131819;
	b=eX6rx+8iaS2Q3FTlrdquCrf894Q2Ku3N4Mi5VjyhFkAl7CqxqNx/TKN7c0q4WhXNydTV
	 c2GfbIFbjbXq29SRROu0V/ibKOtLr/w8k6OGpQ3byuM9ah22OkDZSEIj8oTGu+G1pT7gT
	 58Kx+kGBIGGbzCJ43M6XsolPIZ0EZeKcZy58wLJmhzI+71cdVBOzmf2cQs9P6ToqtY9a5
	 vMyvyK6PMwlsRdhISy4JrJ0MBQLUlN17TS9G4Umx1QRwRrverd9SS7sr2W3adc8SCS9OH
	 ZKPUGRIIaO10ZtTWLZ0RsxHmmxabSQynMjTcVJHNpDntM8+XjKXSXZVywc6oJHONH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
	b=Kj4uLEogLcwbQJ/6zgtUJSBFEDIJuaDHM1ohFSYWmjUCHU1OdHuGF6O3tCs8c5COgcqN
	 DBMEjwdU4OR/pNefy0bsqckybBGQmopOPn7/HyArBC1G3rK9m5bw319FGcg7dU9ZAzPC4
	 yLpFM89MR5l8G3oiUGlqr56P7EWUHeWbkL/ao+zy4bkIPRpLyPegbKzq5RCjI9S1TIcTr
	 jHLlZYEZZWDLuULP0Tus7fiechDEkUvBPYZp6YvO1Gyq8Cqzc86DNaCNgg/5hzrz7u4xZ
	 tKqlkyGxYcW7OsytHf8udDSmeS8rGyf0lQYYSdgZ35TdW9E/kUstA5SvRclQ9FwMOiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYkyBMq+;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAF606D81B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CAF606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYkyBMq+
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c247f6687dcso2135366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131812; x=1794736612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=GYkyBMq+6hTJRlLurayvRtFWq7BfTfJF1QfRO3MxS2NamxdMZ/inCuUjbY2WId5SFi
         xJk8YxMKzUk/2a6NpGDpAOB1lJ3cWsZNtXkDiLN2ciBgFXZxUlGcfBwIdjyX0xuJRbE9
         tDqTxXp0xJ1kOb2LT51BtjB4fQKs7QiAXIzAAYHLzIbIxLV6w2EPAaeyecmNXUQ+7ajM
         xaOb0h8qy6OKl4hVp1A2z2zFjrjoXtO6R3Z7l0MPC7K1uTAWSnnaPHM5isVd4wRU4ABq
         ZSwQBY4/NxAWtGVF/a3mt569V8rXGz3kOqkRmhlnW4HK8pLKNpUEn6NxrJACfHGddNlU
         BXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131812; x=1794736612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=nczdjAvuESnnWyRJp674/sn/8kJecbtTg8TS/TvqyvgwVNW/tYFfs7/1W2AypRO5j8
         +p2z1kBRbeCe2SBhpn1wcOhuNmG6fuwas5uBO32Fe0FrGkdaA5J9scq82tYlmsBZ8SRA
         rB45+DJOnAT+8RtUuHYYnoTWtMq+IVNBaUAT1O19X0cBRFbHLPwO8b2lyXKEQf/5z8zx
         RA2P0PPNQzWEMicijihajWhNyb9YpDdsRS8++hg3bfhirs/eSOaGdKGTf3pan7qBxJwW
         oY2ZUxprYcWqnzlI5IgVYsCNYgoWT7sU4w2NPt+cSycgU6FEAOTI2JdGwkNGkrHvnnjX
         1oEg==
X-Gm-Message-State: APuU4Z9sV0kwzS7yIzhWMFQuX4+wNuRh0c/CRnFGA1LrRr93u8K8YfqH
	XHcN5Fj890yIuywo0r7RvoSnzLnToW5OCdCff28UfwPQ1pTag/c+HBI/tVD1Ug==
X-Gm-Gg: AYBFou0P3wXqwLTOwvMyMW/l3V4I7ZiOgn/XyDQDJfYirOqTMP6EcZe4jqLcA4O9w4Q
	FXxnib83BeVw9BltL+y9ekmTigduNauAxlZef88Iq7Aln02pq582qjnEGRTtmn9T5HUiTbxrU0w
	AzCXbQKHMrd84GeWL44+5sqh2D96KsgV6q2i7pMPaS7FgQ5NV7B1UwVvR3iVRWJv9/ko0dNuin4
	krpsNANVGe4V0PhGEJ5MAPH+rKHnEIbuMhNdGiBe4xf4zcDIVeiNy0tMu1E7ssEPoiD4NSXwWqT
	A3evR9XyYuc1hKGa0ixllyQFQvf6LbbiKtJlhafJqXxpbXSVSqOstos1/KHWmyC6fkQWtRF4pWS
	OaYE9EEuQ6CC7QDR2QUjlGIIAo9bJ+Te+K5I19f4ltDFOg30maIuDBRImJDYngQiPI4cOY/IkYc
	ZeHZ3iY7wnBXS1u4cVu4YpOVz45EOSv9WN+H4rPqL+j0vxvum+ni/1uBC/QNN5zcVDyTonD6piJ
	Pf06Z7I4QIPGUqfKoB/EpLKxbVeQr6VyCTEeZhb7c5g28Es/CP+woXVTLoI6Fos3lEHAnWh63mz
	/cH90+FarFA0wQe0mJK6CwM50zhu3yqQWv8NVlYEPBfi9thuubRgLtaQU0mjvskGWipkKkdjI6S
	GdM7LdDUwMA==
X-Received: by 2002:a17:907:2d0e:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c4d6d7d7a0amr75803866b.35.1794131812255;
        Sun, 08 Nov 2026 01:56:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 4/4] mfd: max8907: Add ADC cell
Date: Sun,  8 Nov 2026 11:56:34 +0200
Message-ID: <20261108095634.100517-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 86579729111ee..f6b584b002e02 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0


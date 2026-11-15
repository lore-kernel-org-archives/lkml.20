Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733899;
	b=g/Pb4dOsHYDtYRtoluzBTnVK+kcrKCvjtnb5LY9kbOvypvjdIPFcRsIRIeqSHqA2/fX0
	 ZZ+6+2WzznD91ZBmk6kWyiFJk0WYcsHFoXvqI7iRbDEZzBBrE8lGN9SFqYks14a/LajJ0
	 DWy6EjKH0JbEnz80vNsdyElaPSk5l2SbqYDIs8pcCETLYupaCQGdPm9HJ/L6HwMdB1OPQ
	 8OpSCxGS3KxYLEhMHiwTkaYhj3Rak7y5mLx9TREZtkAN4YAnlAfqa/7T3QYpYKOudxdRJ
	 awb5HUQSISJbfOAl1Ko3ewQ7YCuFyzztLWZjvJjL7lqFbIjNslRNRGWgoPaThApdQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
	b=H6c6Nu4DgtYy1CAUodf4sL/tLvDrZrq/LxBrRm7KeTpeSSnByLnVX20cZLB91f7ag5p3
	 WDMkDnwKn33R91tDIU0yxLPFsnZTFmGpa5v0i9HBonC858NX4UhmxGLwJJQmPLtlL/La8
	 JLX0w5wTD5tT8kbLxxRhvtVxfviur3kCmmMa4ecc1eq/u2RrvM+5y92urB8XTn2zv4Z2D
	 ilQ/GeN5VUvxpqSBm8HTu/bDgMCm4N8pQ8GqYhbfbIgt3tmEkt3sZoGkTbWtkoWVdTWXy
	 P9A7N56WR4wGQ3Tfvw2pdrkBZbtCOncUkVYOAA27q1cz7Y/2r8A367eKFUYph5zQoaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2A9FU46;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B04606A880
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B04606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2A9FU46
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e30c26a4so480499066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733898; x=1795338698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=a2A9FU46G+YiztCbvxrFji+SXnIeWoZe5W8H+k3kUQ/qCHq4YhLKHZwlVzkXq8280U
         IzF0NuXMD5lXnmObxGmcMI/x/hCT6srMphYqu+k0ksoKEa3JysO06aYhsnEpihXcxEUV
         AG49snclUtE0sPUtYP16iCpRIs8IrDC4UHZYC0mn/4ctNphzJFHeww94U77LCOqWH8vZ
         UwKMOem6ay7imGpw+AVFsZlHetX1a8Hv+s5JcrUsWOfXhjhtJJIG2biWL/wpuwnEEfEy
         xHXbp0GkHCWddGBgMnnFLhS3zfkyxUMI19a9qoGAgqFcp7Wyl426+sP5BPywD7QUYaVp
         okRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733898; x=1795338698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=f0TPxYaFgXJIjyiifbLRP1QcGL/E+FbpLfxoYeJ2A3ez4TSVQV0Xwy4RStYZ9PZ6KH
         N4r0N6h1YTxdJOfO+KH4G8hb1Wsv2x29QBnonyVACvtlraczMdhrf7Z2IKO9dPqaaEr2
         L2EFlbMm7umwY3PzmjlQ6W+LJNxCOs58bb2dW+C2ncRzBcWLUK5Fgknsfu/X+211Pftx
         z2bUFRwpS9ar6RM40ZDve3NsgJvAaB0YNWRpfhbEEEt1FikbPja30cEZeCMCYN8qD2EV
         9LnYMc4urhu0fx8RL/a3RrSOxUuxNgM3udIML3yYeU60rFJFeV7dtJxNPjQmNFnKQnEs
         XaFg==
X-Gm-Message-State: APuU4Z8QXUFA1twpuvQJyGyrAyTmTrLM/uegGYI/7VEJ8J+4CWvT6s0S
	KLSTyQJTlPRZX5oEO8FM2M6De4wE1bg9qZ1ffpvB/QCGyebksd+OWXOK
X-Gm-Gg: AYBFou191gKCHiP4wgMpKeDSAw9Y+AhfkXvscbxog78HFHw5DynT6URoIEYIK4WDBjS
	Iut2EvlQT8+3OhaksCAzsnMbCTF2CXRF+Zw1XsUfxQ7nmlQZiHmxJQAmgE9c48B4urutrf9do+G
	yIcz9Yx82NHfS8V2TIWGc2VOcTpgusEO97t3fnUz/dANZZv8EQEpk2uIRPudL38arjturQG7luf
	bhVQYv4X+wUqO7O0kDXG6TH8s//4eCQSxOE+1zD9WmIBgPMFGMqVJmz/WL940ofzpVRt8m5ph7o
	tS24TB1p1gXUmBBl1UoHZvRUuijqSiBzSSkZsJ1svG4Uq8U52y+TSnUkcVflVm/cj5kXh2xd3kw
	jHYoxxDfFL0Sckb0fD+np+4HlKeHDyhcVff90smA+gnX2M+MFO0YFvlQwLY2pd7NfegVik4q4GH
	Rsk8q5gmjrrgisN0r//F7ZgbK9RnhBiLInMR1UPvDfitfRfmC5jHrxHxB7dXKzU1+YdBWj814X7
	129PdxKL9r/svjVCQqJRZn/ZK3jERrsEZd1kiCZoIdoHR5iTjmMwrwQDQDRbZMxVNnpJb0mKHvg
	KFf2mx6VK1RJknmKcF+F0VQ0J53RBSBWUCY6JSwuUqZVUHS/gpu3ndEZiz3gLqu9KkYq0YV1d9x
	Wm8n2juGH4w==
X-Received: by 2002:a17:907:3f8d:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c50963bba0cmr735412066b.20.1794733897981;
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
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
Subject: [PATCH v2 4/4] mfd: max8907: Add ADC cell
Date: Sun, 15 Nov 2026 11:11:20 +0200
Message-ID: <20261115091120.108684-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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
index 2aaea750d1690..2d94248011915 100644
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


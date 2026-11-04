Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801310;
	b=bguu+0pyKDenpkdQ4etfFCLW+9cXz6bzkvozOLCme/f95ZMaXsn8YWloIVBam5zSUpcF
	 ZWIqEj51HmbSjNOzO52T+taWy3FsS9l6/DnlSPOcG+bZg4gq/rjqGNBSerORs37r/G4bg
	 nGZSE/HJOZidx5VGduZD5M74jaE8s+7cVMi0Sj8Auk/swQtWr6vQnNzOc6/3g9CT4SmRT
	 44blXpz3eOYOcHVKoEuz165N+zxYL61lgisw/sJ57j2yMGm8iL1hzmp3SD28hi00/axfQ
	 dO6IXv6Qg+p0qf/hFjHMxsaHjhvmN60xmXz2Iicmy3WhMBrDeyyikm6DUpBGGdqLCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dWwYy9yOUtMM9FKrkdi2HNFhdL0N+OVbqHHFpRUCaAo=;
	b=K6ejDxFv1cVe3OC8cBwg8Ks9QHovN9enf1kQa3eAHG96KxvaKWiR2G56ltjlVfuyh4s/
	 w4P/f2cSrhuWHDNDRuUXT7hojt88tmL9VnFq5zyrQH2Tb5PeI4zGhwTgSMNrev+aT8GOG
	 tBhq81deV1n3BjAXNk7jkunwh39cMZ4+q6ON7U3Q+tEK321dEyAiBPnLUPweeRyXOtPhc
	 TywNtIk9mxiZzA2NKYvuA9r+rMe+bZx9k6cUdiH/xTFuP28XMclpQs8dtqAdtGSEHN73b
	 igrM+9MMpca9QshWfnSZuFwC0hp1JxD3JkXKyViPH/QZLYfYIUtJimtqO5e1sgucTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1iJhxYi;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F5606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314F5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1iJhxYi
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso371277b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801309; x=1794406109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWwYy9yOUtMM9FKrkdi2HNFhdL0N+OVbqHHFpRUCaAo=;
        b=q1iJhxYi15RMQdoeJ+jJvEo/uA+nv7K6gF7LiPYuGUstobJKghqUzgOqOWqc+FL69i
         4XWTRMg456PKmjmM5qKW84a9CrVkbUFMeyk3Ge1TlcCPL9pFgo9B8WVUROrLIhz2tVPj
         Mrw4Zb/e5oU77YR8k2yvNHa18WP/j7Fwthi/aJ+eKK9wb5yRe/WYsiws6lTf1TPr0lH6
         y2v/4ufwKEmTc1vhTKzBgmunVLVo1R/briGCeFK8vBsabFqwX2xAdMbcSyHwc+fQopIR
         4s3WlGizhh+4L9ioIwaWxb8AupG+GqtZagWqjydS7MFSuoCTycyvpLjGfLscUepuGOKC
         Johg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801309; x=1794406109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWwYy9yOUtMM9FKrkdi2HNFhdL0N+OVbqHHFpRUCaAo=;
        b=GDJZpZaIniHDmHsMP0FzDW9rjNt1/5Ol7MKnbLMlSs1+DCxXl4j2PgA0AsthoouhYX
         JAjOUX1GZx8nocva042RU3E4DliYjGic4Alny6v587kDPHvkAl8jtOtVb0sdEgZqTU4Z
         OVZm3Vy5MGtxdjFIO5gGCvdbNzHH1ER2FxyRPAM9koBc338bQTtcDwerVrbzUlLwdsZ3
         CgStpoOppH6ddkOEPuVfz+dEQKgenu9FgMn5SdLpnOnmjT1eDY6luBDIUGqpCjVGGYCF
         ujpC9jhirboyqxuapOJX22JdBKfwMRXnSmTaevyLZ7OGnDYtFW4BOt7KLWAUGHFfyge2
         kXCA==
X-Forwarded-Encrypted: i=1; AKwUvBwCjlJw3pFq4pCLOKLuqy7a1ciZtbqtFXOeXdxbF3RBWe3aAyJAnquJSX/W0nE4dnpXWAEZqE/GtswmDss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eCSrgzeQAB3RX7teynlHEUxgd7xBJU34Cy3xrjZiEtvAQLHrY
	221exqNM1YDNLFkkXXsI1jEMrsCm7rwYzC+vzdV37FmKwpLXGJLEbqy/
X-Gm-Gg: AYBFou1L7F5eBVCbdRWdRIllBfFVC8bihEKfeS8fCLBfVaSOSND5gIDcVNjBW7IfzSq
	emFEc21b3BzyTXJdty6qyGJrYOunbVXgXsYFznxGU05v8KEQhhIPM0H4Zrac5X4FPtNWWC5n6Fh
	PfEqJXRvszD13y2N4UBGZzixFsHnuqSI3sHuyfT/stQdUWKIHk208Z1s4h+ogCqjd2rRA9om4LF
	pFmiMaeFWz3hIGCD7cD6z1DKA8bTXHnSIvYafF48hZ5wgFdkiENh880/n9g7hZ3wS79K+7tqfUY
	qN9Y/w4RwrE0oBXwlefjE7p8pDUVMAZ0nDmQJsEkur2WtrHaSzNsvLsSs75R5Tr7PNv9plKT2t5
	LEm87CmfORjz45SyC5LbyCBacJN/6Rnb6n3q7AKD+ag183BfyzW+7Eme1NxkTfmz6uSpOsJPGUn
	FvdzqVAdangCvt8KROxemx3QLIH//vmLd8zUz0owOd+6hBJwrRWQ4W0q82DBfkUocW9kCNr0wQ4
	yCQjdLpKtART6v2P90XDqzsSvxT8fTmVpu7djEjyyQvIDWZ0d4xLQ0Ryyq1SLA5BHGdOVCZwksv
	XQLNuwaXy3uwPZLog6IafiqVAOGePxNCIIPMSE8C3z7wSqRTtJFI0X5ZbQ0B/x4iyAlDHi9i2z7
	Fa6lgy9uPbWp52X4LzyFQS2M=
X-Received: by 2002:a05:6a00:3d04:b0:8a0:5d6f:8a5b with SMTP id d2e1a72fcca58-8a9bfddfbcdmr13245493b3a.50.1793801309436;
        Wed, 04 Nov 2026 06:08:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.167.147.108])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b09ba508fasm990259b3a.48.2026.11.04.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:08:29 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Nov 2026 22:08:12 +0800
Subject: [PATCH 3/3] spi: ti-qspi: Correct runtime PM error message
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
Message-Id: <20261104-ti-qspi-v1-3-c286943c22c3@gmail.com>
References: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
In-Reply-To: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
To: Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Sourav Poddar <sourav.poddar@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801296; l=728;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=mlxKx0GdG0RFl4NpxWtZoGjus73/eWTJRgYdr2YGhH4=;
 b=7R9FtVIsPVOYT/0WyJbN8HNnDVWe0J6QpiVy4H/kA7NtNIAcsrbC+hnDFjEE/m93f/c6sgEi3
 SwbxyeFzO0qC0/uKR8Lvb886Ozjwi+qUw0q5jv3xRVw2PY9rbP6YLKr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Update the error message to name pm_runtime_resume_and_get() instead
of the previously used pm_runtime_get_sync().

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-ti-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 2026fbcbeb90..c9fc0bf4b8fc 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -154,7 +154,7 @@ static int ti_qspi_setup(struct spi_device *spi)
 
 	ret = pm_runtime_resume_and_get(qspi->dev);
 	if (ret < 0) {
-		dev_err(qspi->dev, "pm_runtime_get_sync() failed\n");
+		dev_err(qspi->dev, "pm_runtime_resume_and_get() failed\n");
 		return ret;
 	}
 

-- 
2.53.0


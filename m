Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623279;
	b=Qv0stMxU010Pa6mRjhHDpZ5UY5612yVLF/1YmEZh1p7514hDYG8puWuDa1g233FkZLmc
	 WdKNZZAQasT7XgirI+zbLzWnh7GpVhlhcLYYYqSc9my/naB0HMMj+TYSQGc7Cr8+zsj+8
	 hb90BzHE44SDmIZ69+SvBvPIc7zXibQAXBiLjHP5jbE7bYHUNX5tDSIvr3Rr+YGqviNxZ
	 KrybPB+bVl6usTq8meO9+pvt2UiGEzeIae9KRjd5oRuHz3ECa1U4CP2T0qS4Vth9p/faw
	 XfL/8lsUpGUAffbpV7zaWIwvLw93fnHhGK0mjvI3JvFUuURHDGBXlMGyetrdeGdvapg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x7MyieQXbBbx4Xn5YipQkBiUdTpW0l+4A4LlRi8x/Iw=;
	b=0BTXs1k4fAcp9rxd0dAZ01FKaj8Nb9yCjpDFqn7hAB9/uKI3Pk/cl8X+yDoJUidLocmO
	 xthNLAxv+HHj0xrVO1A8L3Jv6Hp6PlhEwqM3qXAkASJmJZQ2EvaFSyjRwrxuYitBR+dfG
	 HItS23O86T2Y6l186i8BDiaJIPfEDKYa8g7lG1YRCe7XnwIVUSRrvDvdxvWXdGva7JHdQ
	 k4bGqqEKtvE5x7MnDHimkcadbXheLtsDMGSg7EuWsjg/czycI3ZcC9PnLkprk3N1BEYFK
	 KUeW005jVBvGuEkXwa2l3+KcVKYDovTPnK2bo+uYKQwUZJLRTtQabPxFnB4wVsHlHLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBdUgxA1;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBdUgxA1
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so2364423eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623278; x=1793228078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7MyieQXbBbx4Xn5YipQkBiUdTpW0l+4A4LlRi8x/Iw=;
        b=CBdUgxA1QC/+MlRdYyQ57PEEqWsDnPwgCiASzIPjVnvMS7nIJIVFIVTHXQS5IcTB45
         HHD/HydzPIUD+9nlsDMhIRczbD1qH/TmyuIn+D5dlL2HVPq4GL6AMJ4+utIVU8ecjdzH
         LlCGMZtvUPzEKjOV94R7zG15odG8K29B79STt9MaZGfaiaYv+wuariW1bSh4JWBrLWhA
         cwsbNWZwMeDOcOSztnptVRZ8KTXBzf+yEqfVW3bP3FfrkjFiGtPUKR286BdTb2FK0P+t
         Pj/s2PAcYCYKLt/Gu7Y3eAFWXtSuFubPOfDQt6F62KB+GzgNjtF0LZAeTfu2EblX2NBD
         Kx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623278; x=1793228078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7MyieQXbBbx4Xn5YipQkBiUdTpW0l+4A4LlRi8x/Iw=;
        b=1QqESz46F98LIkzTJfI2XcY3SoZzyfUJ1wTj730nk7gnM0XCZ7FepifrwiDNyu1wpO
         PrjgBiKewdzgfiSIfrgE9e5icMAU2t5lWOEkX55XROpidW3g9oJgKmLnNerCyrVt9PK1
         LYLyE9Fd+MlnvYkURPAekZFfulPNj/sBdnch+bF0QQYIQpS4vowdlA4S62cxmMOW2uxq
         O//29pgl/vJQ1fe+LoPiI+ipArb3P2Zeg2+VMhTahmDGLaP0BkGyIFe8gdb1iaPzwqKw
         PuXPZi+BZbs/UlKKUsIk7lLNciaf6kTEce9id3TG6+uDUro228dOf16l5pjU2qAG7iGp
         auhA==
X-Forwarded-Encrypted: i=1; AKwUvByY4CftPgBQR73ydvNIDd/924VzJv8MxSVqDxdgJtoMob6616cMzdBuV79MotJ3oLsUPrfu+KYfAokONvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGPvLcrM+e40abCEqwX7/ID2aSfLyU3ijgGrWxDvXei0n/0daJ
	c256fMbCqUp2gOVH8l2dNI7LbvfMplxesfDi/vhXfHTlcTUgPzOSQJ0a
X-Gm-Gg: AYBFou1yNuzaoq093cuJNIQmxIaD87KmlQ24Vs2NnXplp+CUi+Ci+sv4uSN0lCkmGfX
	uVFDAIiR6eVnasNJZIWAGmZI0xL2fZiT/dYi6qOdV9dw1CmNZxOO4FtAHS0Kxq/VMt4bqy1wVAI
	EoQ7fX+kHTY+gbQaaUbF/me8hOLoyKoudyZvRGKhmgsodFgfUkQlEyRXpfCzcFYqjy+LKN3BuBl
	ryn4dMlqxZl5e+6bjBy/qI8QddMshZj6Q8dkvQogfGiKnpgBXPN4fLAtTUxQKrQo2p9rRZDdTCK
	iFoEJ8M92KWdw6YRHjwhZu2D3Q2NDE5FL4cINKWmamttVepiXKerhjg6OUBoCtM+fx1LaBbMqdt
	tRVHZ7+4mGy/BrC6pi2jnhwLAEKXPnecbnqKWxEuPiwKMileOso5ROlXWsAndWHEj9Pl8bFbKMi
	XcwFAY8yxGsW90gt3IYZG4UG9SAQbnGG3AaujH/yp2Iz0kgLDDhmsfx6WdAmfthifE72G9FnmAF
	qu4isGPDAsaRG6aSFONGZgNYeazw06bmeQQ9RWemLjE5MBLwCy2DhccBDyjLgmo/KwvgrdeO85u
	r3msMjBh7d14L8cbuzJLFhbQ/Ze7mrbYE/fA5fjYYsx5xJ6HkvgbgaUhAGuUyD+3fpZyyA8yoI7
	5ID/yOP7Z3KQ=
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr4690949eec.27.1792623278344;
        Wed, 21 Oct 2026 15:54:38 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm11859529eec.25.2026.10.21.15.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:37 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: mcp3564: reject devices without match data
Date: Thu, 22 Oct 2026 04:24:28 +0530
Message-ID: <20261021225431.627718-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver identifies the chip by reading its ID registers. If that
fails, e.g. for a newer part number, it falls back to the match data
provided by the device tree.

spi_get_device_match_data() returns NULL when the device is bound with
the "spi: override" property, as in that case no match data is set and
the device name doesn't match any of the entries of the driver's id
table.

The driver dereferences the returned pointer without checking it, which
leads to a NULL pointer dereference and a kernel oops.

Return -ENODATA if no match data is available, like the other IIO SPI
drivers do.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/mcp3564.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/adc/mcp3564.c b/drivers/iio/adc/mcp3564.c
index 259ac4ebdedf..91796a47e412 100644
--- a/drivers/iio/adc/mcp3564.c
+++ b/drivers/iio/adc/mcp3564.c
@@ -1204,6 +1204,9 @@ static int mcp3564_config(struct iio_dev *indio_dev, bool *use_internal_vref_att
 		 * try using fallback compatible in device tree to deal with some newer part number.
 		 */
 		adc->chip_info = spi_get_device_match_data(adc->spi);
+		if (!adc->chip_info)
+			return -ENODATA;
+
 		adc->have_vref = adc->chip_info->have_vref;
 	} else {
 		adc->chip_info = &mcp3564_chip_infos_tbl[ids];

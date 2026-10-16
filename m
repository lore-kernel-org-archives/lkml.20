Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A741DDF0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151183; cv=none; b=EHgSPjWMGlK3Uf4UvhllBufNJP0WeP8cQ5MB/SL2KxO/klo0nIaHsMiJ+Vr1N2LnUMZrR5XRPo4j374Wkqeh/0Z298W2XFeugT1tt90NATI6a0uZWZQQ3B4EmnMe6rXYOp5cYkSv0c00c3fiLYvnqERBhV/LWD4XNWBiwUEwslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151183; c=relaxed/simple;
	bh=XfgWy3OdAosQabJUNE32QEs/auUSjFc3Dhf5jJyET4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHcSLPxwecF/wjXRU5eVmpLTslNx6uzyqa1NamJMHuthL9OpzXbdTze/1usx6qlGiJsbENypXCHmV0z0ehAsvUAmatZiUpy5uK0SwHBJlpFsBntYAQ5KvB/1k4FQVpaBYi5AL6EpPcjqX2nimqt51AMABMYwty36FLc3dfbfZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHKSsPx+; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHKSsPx+"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so2239485eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151182; x=1792755982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2GBgJDeRRDTohR0y6CO9y/p1qH+zLQzeNlu49sshfs=;
        b=VHKSsPx+Eptqu6e0tD/px2AF39I2pXNl8E9L7pZDMpeDFXOmp+KuY6Pxu4XLSzZiDC
         I0YBlgsVZPtb6l4CLryEJ4U3UaCTqpISy7rJAQnriQjOQSZYEdgGNYmd11VFU0/bDTQt
         6KvkZWzm8v24VHhg/pkMUaIhjFrBviWqlgWaELaJZHRuLljWaRpVt9oz7dwrmP++Qhy3
         MjMrA2gHeFAyPfQNTpIUteO1V6jIATuXLZzWZ1EN1p0whVPHZWwP14j5gd5OhV6u026t
         u/WCjHDYyB1twVaDzucYkIgwBiiYT6lr1+WRdgMGvMGtKGX9jsfkzti8IXVMIQJ0rVbZ
         u81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151182; x=1792755982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2GBgJDeRRDTohR0y6CO9y/p1qH+zLQzeNlu49sshfs=;
        b=RnsRnnoQ8PyMQXGSqHZrTILm0T8CY/DBlekq5cUyl1SvW9A3SiRcP0MLNCnna5k65D
         OgjzYx4aL71/rNwd32h3h/sCgf6BC97Hjdz+wcWsMoJDbdIjqtqB47uE+ALPfpLTGMV8
         Z1CYF5cJVbTSs3Fgu05w9Gta4tsLPPHoGHZuVBvEkn/G7wlteR2lW3BhECtt+RwVb+wL
         F4TQXv3B8xs+qCWBZTPtpV8wjvg+ZvUqXQJIxUdsq1z+GD2cstWCaYFLOcU2nkyiSXqy
         V5diNSAVuBEC+5F0M6bMg2Mmxg0JKWQRTpNZIPi5AD+FT2II+dfyZKdzGND5DOCVt1ux
         WlbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq77AgcHBuxxrgj33Pl6h1WY8OGH3w3bfE/NfdGvok32SWW0A0YXhxxGulSK6mMFUq5EydhKcLrF24mWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkwVUavDhRzP+C4iIhn+QbsVEBdlCJhXL8RZOQybkKfC8AtsDy
	IfTYSYImJJK2JnRYPaD7ij//0iGI1omxqgB0A1j9op5J6PbVOvglDrbz
X-Gm-Gg: AYBFou1wAqMCDgwp5Hep2rI7u1AiVTwNysE5INGSjyFjkVXp2LNDnYnADczceuokiaM
	FBIElHFP2JBf4xhRNDMFiKBplIArIkYCReLsXlTADzC0t4EJeB9NiqqSGfO5EIDDQpKpy7gLosN
	eR51gjclDWTLjsT+1gCXF5r4o5bi3UsarRxYs3K7HpzntnS+k78xyUCdtByvQl6OcQgaIGhZ2TV
	DA6OtbdGqHYJZNJkEzJCzDLQ6KXM3+zotEaMmLTYj6gFH5FTdKUs3Ap/fU69rEyMwNyhWJ553Gb
	b7+bZfMNT1zCkI1/KwQ5KetweHoUIxTlt1mISM4OoMVL5j952tIAky4sxTXBuyYZfO/FKaGoLqU
	W7onbvfHju/rMeFRbNgzdnvmYa8CTAgMLCEg5wlWnQ3ejeb8hPmSJGpuD0838NkAPPZfAEanFeB
	BezRTKn25cFH8x6g2NdqK6RzhMQI9lwqeif08Gvm2MQ3yMbKbpkDGk6umbIRTfYAZBpFWs
X-Received: by 2002:a05:7300:fd03:b0:351:4866:255c with SMTP id 5a478bee46e88-3537e058277mr38968653eec.32.1792151181599;
        Fri, 16 Oct 2026 04:46:21 -0700 (PDT)
Received: from fedora ([117.134.210.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm7330259eec.8.2026.10.16.04.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:46:21 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 0/2] iio: accel: adis16209: add missing SPI and OF matching table
Date: Fri, 16 Oct 2026 16:45:25 +0500
Message-ID: <20261016114527.128364-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced old manual matching via MODULE_ALIAS to modern SPI matching
table.  Also added missing OF match table for DT based probe. Compatible
adi,adis16209 is already enumerated in
Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml

Shehryar Ahmad (2):
  iio: accel: adis16209: add SPI device ID table
  iio: accel: adis16209: Add OF device ID table

 drivers/iio/accel/adis16209.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.56.0


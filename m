Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79565451984
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432977; cv=none; b=YEOXxr1iM1VsJcmA8xyLNxOGEAwQxcqjuRSsutAqXDQj3uQ8TgNI2VWIpoCACLT3mMz0puh1E7Ycl8rJWTG8rSLSSY867EgNXzBi0yChi6Bjg+1YeuHN3cL3tTctK7vACSEAiBC5UKvpKMGwvaAY8iYcqyO8zrA4H8lTCiat3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432977; c=relaxed/simple;
	bh=1s2j05WGuSxdMxu0mPvRMGsuFOmVgRS1uYIlgnv5nRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sf7IOxJZEkcXKCGizUe4TsW1k7+Bshhf75c8Aj093xTPolaI0thAgm5BpvSC+aOcSqtyWAVLO6KW2KM48e0DslAlPBEx3TZq5re/REsSpw+mAutcq+jkdftyvbuJPsYc9jkcrVqf1idVGVWwfGgyvokziTwjrgihVwnsuaFrGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuAMWOFJ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuAMWOFJ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so725413f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790432975; x=1791037775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CfMv/6BkPBKZ8qC/KjQG7o9GMKGsM3AsVIzAe/BUdtM=;
        b=AuAMWOFJSdKfQxADAZ4iZ/iUZopBQMqIt3Ub+BTFjzlW+EUuXxdbeIoomIGDLpvsiH
         GRDKs9EUpPEZSMEGcsa/QzRl6AujbnW9beJrtarye/QpwdxSbpuCpW8Mud0SHmn/E2P0
         szIkK6wpn+geJuZwPulgXJeFbjqPziIr0kEITvzW8qqET9OoUBnb5Ah/5OKUeMN6eAVa
         b8yAS7eFsw0FhGtX6B1PRi59EeSPCePepOukQh5YmGP0iYNN0WSJ/bzRSTxEya6O56us
         wNxIoEy03iyVIBgS0Dab7CBeabLFSOwdeJ16Idxxfvy+3Fv3dT4aR+gnu6f0ImgEO4s6
         hMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432975; x=1791037775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfMv/6BkPBKZ8qC/KjQG7o9GMKGsM3AsVIzAe/BUdtM=;
        b=wmNOQCTck96mDKpaD56lu9+PpJ+wIXl6qI23ZHZ11HvCBy7/WdKB1Y3HXMNlQHLowv
         FdygvLOVqu+h2dfTtINNqfFUdCNVx2DV2/VOU0svPqin/oXd/JpgRSAVmTMw3HXjbnTh
         ukHaiDReculPLHO0jvLkuV7Fxtl3jG7OC9DQxRvCmGSMA5HKuYrJVEbbTjKWBdQ4wHr1
         ziqkfrpZAVQ5zCw5tQ35XoGaftZdwv/Q14N5k+1qgYqrrU/E9r1ULN9rYlqxo7f6VHCv
         213BXktOnrHVNWaT5Qxl2W3/OX7E0099VkqJFCCaNDO3uWjJ8IhGlJiRXVv7RkayZNgg
         25og==
X-Forwarded-Encrypted: i=1; AKwUvBwibv/WaKG61Im2/ShoCGWcObMajpunupTUgTl3pdM9X2n+5tC/zBmaK2yVvTaWYqk2oy2bs5u7NPXwU34=@vger.kernel.org
X-Gm-Message-State: AFuF++lA/t6KVLwXU0MwlLAYqe+tqe40JAXDoykWkP1qUC41DSDznAFm
	MztvSagoeyGX/a6BKjc7zoSz+rdTX4fW05U/9WxLeKcLVvgruM5ifFqw
X-Gm-Gg: AYBFou18qKctx9s4dEtpr/Q22hxVEindZLO1hLrzGWMboj59vmgNQTxC8GYfdwu0jFF
	P9fJmSpkXPuiM1dee9QKiCn+iHx1k2ovIht32JK/hwmWZABpcC0mXuhv+Fd6ke407B4wzN5qTty
	U1/X2iwXqoYUsIE7Wz+qxrpV1GIETRwZuMlKW0RUUa3B4cz9G303QeO65JKpRswTnbYRSMNUGHd
	7N/JifaueXN51lOLY57an8Ntz5n/3vy72Zai8zWj56jq6yDY+8e9FE+QbXvc4V0Sd0+QtPffa5G
	uKqqNhxM7Tiq3CLyjwerdZeKgzKE7XJ0op52esy4Nw2OGUOo2xLFsPSeeCSCAxQ4/bdeYF0Rxee
	hTopYZ+iRTwTN8Ngv6yODivNWSOKW1Bw1IYay8lwVgJrsLTx5P+6Wv1y6q1pguiuOiNvWFwyyyT
	vQ2MxP349D6OOIzLfY8rpmaUTL8q4n/210xPnzOJc42GJnB1G1KKEGpA3DZxUHpwi+ngGWVIaXK
	CzHzppwAro9tsHq01A=
X-Received: by 2002:a05:600c:1908:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-49fffa2221emr10341055e9.11.1790432974517;
        Sat, 26 Sep 2026 07:29:34 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm98116395e9.4.2026.09.26.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:29:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] power: supply: generic-adc-battery: Fix temperature IIO channel conversion
Date: Sat, 26 Sep 2026 17:29:04 +0300
Message-ID: <20260926142905.206215-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Temperature IIO channel data is provided in milli-degrees, while
POWER_SUPPLY_PROP_TEMP is expected to be in deci-degrees. Adjust the
existing logic to reflect this conversion properly.

Svyatoslav Ryhel (1):
  power: supply: generic-adc-battery: Fix temperature IIO channel
    conversion

 drivers/power/supply/generic-adc-battery.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.53.0


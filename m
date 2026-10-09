Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F25038F7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571296; cv=none; b=oeEDpJaaJ0IARsiaVIQsb09WSttzU4Di6ly62x3yFFpwiji2vp4Kks1BMfGXh7FlUW+R0vfmpk2TfhlB5ow43d7wZNeLFGd/Ts8Mjvj9YrCOEmbpc14XBYw/JyFFwt54d6D+aWoewuPzsaYywpNVi4ayQE6fcHtr5OkgHUsU4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571296; c=relaxed/simple;
	bh=iAJ021q/bs5girU4Voq+iEmYBqcohZHM+3dHaxUfuvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1khEDJM81KJnsbjJfqmG84956XKkE/Dkd+Iyw1QotTpJoi3qGWR+mHiK9LTtcZW3r0lL31kiQeswLRymqAx/rpxDYIHeftpcgFLUhsHXjvlkd1COeZZ54OAlsu/WmPtzHi1vntUQfAIpEPefjTivwM05kssnqJJNzEy4u1MqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2jztO4J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2jztO4J"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso1038515e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571289; x=1792176089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTvUdKlyxPMZoaLRUE1jPDlqKH8pfTCJfU7Qzdss2y8=;
        b=a2jztO4J9bkjY3PPN6GRC97WwO0LkZMuubQXqmUc5EILLcBIACv7CsVcxK1LDTXeOt
         MU1tl26mMo0MdKzjiODZpOMxBlRZyZaWKXGFoDoDyhcA2mXTRdW0WYwyBjbDBnyi1HOA
         67xNbT1FCWt18B0NwAuFTCy2NtLx+UZ7Pu7jWgS6Uenu5KgOS39zR4U4Bp0cVn3uPvI0
         6oXZ9lu9GdBh27A/bxuy8EUo7yfujuyFc4IB6gXqu3MWlYvhoc8qfKs0Cv/v6kgmnf71
         tMuiBZdwFof1PZ0wxJqrADAsPetivzawQaiikZMPTCyLxDCiYSlvb1mtGU/gL20p9h4h
         zkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571289; x=1792176089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTvUdKlyxPMZoaLRUE1jPDlqKH8pfTCJfU7Qzdss2y8=;
        b=VIZrzPfngG4thNvjpxhA7wICqIsyGVkVdQAYeqh1iAAKoEX6pY3JY7NWeU4y81U4ZL
         CMf8oGOH2mjzRaUtwwue2y9yRgnfDnCarHmNwz36EKp4urdIwTa3UKm5X1xP6dulbkhK
         x1/Gcm4znN+pie2/HKYoZIQg/pyJhQE6Nv6m4HTD4SgPmKUO4wKMuX85pFV7GWqDMM89
         K184QU8SDbTHnMzrBCvq5L8/O6xUw02u+zaFtV5bc80S3qTev39MtetyI384C9wc3u2U
         FcrVY82X0HXthZ04PGdIUZDhsmC0FPY3xhctNqsFH0WHEafL9STDqvrNbiEZp76YJ5zz
         6DUg==
X-Forwarded-Encrypted: i=1; AKwUvBz7oN9KL3zkDydmjmTGe44TSDYW06EZVCRE89rN8VvNoJOLZ88n5Q+I5Y9Mbj7OWzlV11e3D0vVw+igMfw=@vger.kernel.org
X-Gm-Message-State: AFuF++mSqttvd7waf0AEl0BWOy847kUGZvZxV2eiPNVpA2LX40EyWila
	QH6iPTlZswCkAftYGChuSXgd80UywuwrhSz4sBHqYh9uAn+k4q5rM3P/
X-Gm-Gg: AYBFou3UmfwBKoPOSi7GEkLpCrI0PhUXST2ExUlSuG4a2gCCnptUgsuUEYctPtxxfCv
	oMJg+HIuVz1eXXJQOC1cnDHxz21xuA75adw1LW/s8DY5LWzEOQ7TK4XFWXE8zRSpRZJjtMMDaFA
	pVeYQq47DHenqWmFgdm0gJGZ4orF/gJsHF5eFOe8wqQomVAPz9jQ92DKoHTJvEyk1woGJCkFugd
	6Lpo69WLzHRAx9TUmtt6jrPm1I1wRpnpdLicxw17Tdh4GCHKLzfMIxsilcJHYszdP464mnew4mX
	FDISZxhOXs6qqUn8Y5NF3MkoExUtDmaLt45pIQnUXnxrzXAfX2Ln2hljMzAufYLfS2tnfch7lll
	+YA6Tg/ME2Hz0EzRFuqf3TG5Ihf+4/bNHCTwu/iIt7Z772TR8hrbo52oFdEPV0D8bKMRKWoznjY
	Al7T5GYFFLfPuvZTqr2w67yb9noLOKSOaNO4grA6wSrDTNMtUzEfGRJPVABU9jLmhpqFIchV1Zd
	EsMtREdOaRe1O9E88N+jY4pzHRZZX/2vxwKphFFGuIB/GfkfvVp9Q6IcpHVivxSE1wDW3uhpRZv
	I7mfD31DOi4t1huRKjYNGqAv0eH3pA==
X-Received: by 2002:a05:600c:8b78:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a18e47acf5mr56899005e9.11.1791571289339;
        Fri, 09 Oct 2026 11:41:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
Date: Fri,  9 Oct 2026 19:41:14 +0100
Message-ID: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2H
SoC but varies slightly in terms of available channels and configuration
options.

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
- Returned -ENODATA in case device_get_match_data() returns NULL
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
- Updated Kconfig description
- Included array_size.h
- Dropped unnecessary extra line in rzt2h_adc_write_scale

v1: https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N
    support
  iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
  iio: adc: rzt2h: Add chip-specific configuration
  iio: adc: rzt2h: Add optional reset support
  iio: adc: rzt2h: Prepare for SoCs without sample state registers
  iio: adc: rzt2h: Prepare for SoCs with different ADC info
  iio: adc: rzt2h: Use scan type for ADC scale
  iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

 .../iio/adc/renesas,r9a09g077-adc.yaml        |  38 +-
 drivers/iio/adc/Kconfig                       |  10 +-
 drivers/iio/adc/rzt2h_adc.c                   | 325 ++++++++++++++++--
 3 files changed, 344 insertions(+), 29 deletions(-)

-- 
2.55.0


Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A355D889
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707775; cv=none; b=k2ZwtRPAVkkgaTIGbj2drf+pFhw8IZ1Sxo4pkMkAc0d6VO8N0Jglx7KXypH4hDRa933oW1ncjCenL7bcmVZ6l/P/QlrvT0Cw/zWpQGo+NouKLzp1TG0+FCVXYRdg8HEWZsbSgnOdF5XGKVBmWSX1OWonoNCpkO+KildtTFvAj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707775; c=relaxed/simple;
	bh=7IbtXTxlmArJ+BFQWMkEj7Rrtt7najQ4NMwV2C1OO6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFSiyJqZ1W9Z5wyhSR/4uaPohFs/UXoLW5kkrJaNCWcJ0gSEf9EWB58auPf5YEtVDbnX7qob+/PfufWzHeRxpUa1Wm/6p5d+EZEvT7j4vVHgqFv4Zq0ZweMg0ld7cSTR+P99wfqDgsAmOAZr7V2vheDXRAeusrqbddMTrKJpuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdvvnDxQ; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdvvnDxQ"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso21751f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707772; x=1791312572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=njjB9DtfVySoR684665xgHbK33P3Y+Sqpm+bMczxzHk=;
        b=rdvvnDxQatRyWl3gyJmmL6g/sTbxuyle62EueDS9lLkIqaixMQgWrVi5G+0rWqofvq
         j1XFBGSvWTC3sYASdbeaF4g2XC8lERlgjxqZFb+8XDkUTe8te7WM69izDEPtd/5SkVxZ
         FIlGAykF1dTYHsmCM9hJL7XhhftsLAUzpnvYZmY3+n7Zv6N92AMdIgzIX8fCyNeO9lQi
         VFR8cvNP++A6iKex86GYdkYQAab7T5ufc6ss7/d2S69IK/U/LAjfO1t6crE3v8kQvcfY
         soiwnwdTR2I28nvtVMLH5QKhMa4ixItHlz7h0f5djcK2AoWQKDaGmfl+B0wNOXz8PHvT
         qyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707772; x=1791312572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njjB9DtfVySoR684665xgHbK33P3Y+Sqpm+bMczxzHk=;
        b=IpSoT5nVzfbniibvFqhM7e/tqSexaBBaqIz6wIA5QKN6CzYTVi18bN4pdGjnVLaVU9
         shAzUr3vvRYB717qJ5p83ATCyMsjvY/bN6G88eof97uURtkR0McGWlV7farHpsvkQN9a
         sKPf0cl4nQze63I3qV/VpHKBr2RNI50p6cPb/HZccQH1HatwHXpFkiN9pKH2r4kvCRKW
         gMUTiQNVh1/Ap0voIPGNdNxM3MohoS5uLFOwK12K1IcCqhP4frPCmAFV21MZYM9GeyRR
         I2Sc9mm8O5gZABpZBOYE/fXHIC07CONLybseXYHFSbDBHaV/H875XvYdXicWcvxxbIup
         MeuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF1PWizJYQp1OS3vIxFQxtw/1ysAee7tBlcSUzR29pvYDRwZPxFX6BV4PeQFmifrxBGHZlR3GJOq10hF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1FLLfL+dh3ZSqC3WmOcl7xb9o8/PwloAn+MEW/O+YBGHfrD7G
	XLl8nxsv2HzkqpNvE1wmXuSfPsBbMSjcPemVvC7jvBkW3AUnNKTHstC9
X-Gm-Gg: AYBFou2FrDPbzdGyRp76UFJmto7Kqg7vW6IittBdKN+exnSrO7HZmTj0JRW3T6wsfCc
	xernxAEZT7DzqFaXkGIAc89vW8uzRR4qM3iLtOyuxc2keBYcczIhNfYa+Vx1NTThfTiqxlUGMWd
	Omo2fRB8UNhKXOHRlXVA6Uae8gvmBY1bXgVV2pJG4b0tWH/Ph+mUwVi0+208BIV10eQEy1kic4x
	bD1H4wBKjiTEKhuxV0RRUIaz4EruqASNiicIpTZHQ2/l7R/XIrkST+0lQkWrwnIyHgRQzDNmSjr
	dS5NtqmehjAfQZXVVXAl9Zg+6WkMahu24GnDNntvmdqCVsOOHnaxRPtO78HDWNce1Nw3UqXQyu5
	9sUE7IXhq1MyIyHTsE6sKBhu2OZvJ+rZEoIa7Eo7ZQnnkqi4PLL5sAGrzLB+NZQD/0rcVsdBh9p
	rRM/eTAgvySMfpNCcA95+ZlAU0CEDPGeDox+eNNmo+rqTjKhlNd9UH/eeTc07Mf9PGsIXUn+lop
	b2KoC0MUmsn/FlCH/X/vcCnH6erNB4=
X-Received: by 2002:a05:6000:603:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48afe9c2eaemr300741f8f.48.1790707771742;
        Tue, 29 Sep 2026 11:49:31 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:49:31 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
Date: Tue, 29 Sep 2026 21:48:57 +0300
Message-ID: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series addresses a fundamental hardware mapping error in the
ADIS16203 driver and performs a few necessary cleanups.

The ADIS16203 is a single-axis inclinometer. The current driver mistakenly
exposes two separate axes (X and Y), leaving a FIXME comment on the Y-axis.
According to the datasheet, these are actually just two different output
formats for the same axis (0 to 360 degrees, and +/- 180 degrees).

This series removes the unsupported Y-axis, fixes the inclination naming,
adds a missing SPI device ID table to ensure proper module autoloading,
and cleans up the register macros to align with kernel coding style.

Best regards,
Abdelnasser Hussein

Abdelnasser Hussein (3):
  staging: iio: accel: adis16203: fix inclination naming and remove
    unsupported Y-axis
  staging: iio: accel: adis16203: add missing spi_device_id table
  staging: iio: accel: adis16203: clean up register definitions and drop
    redundant comments

 drivers/staging/iio/accel/adis16203.c | 108 ++++++--------------------
 1 file changed, 24 insertions(+), 84 deletions(-)

-- 
2.54.0


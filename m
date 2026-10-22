Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649547;
	b=HQiPP17FmtK2vO1Kt0nQoNSlYtU82xfWItvdFzCHXNycfOqfRf4P2JbBjule4MrzRk7E
	 dPAJXTj0ymzxpev9iiXEAbyvRs1oWbQW8kEknPPxnXl9Qf852cybNvAqkvIvdorBqTi1q
	 IczZ9SLawoSsqoV/DUsOjizR//uSZ9JKLsCJlbadGtYmgdP1MZnJ2/YKRJmX6DUuUPnfi
	 jZ80p67pKecOgC9DNQD7GkB4fkBly0HzBQSF4HEVNma4CQVQV07AxXkj62jN9D4KEuylA
	 wyxfky+fw4a20Cq6S4Gew6Fq1y9/EKU4+fBgIdOQIUT8FaoZfOB7dv8SBlBhhw5CM/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
	b=DO/dptRvjFokk+f03GOOJ6C89ufr3Uihrj4bo35FEcuhHXRwk7BZsej3DLNj71UaRcZy
	 OyXrTS2sKsMhvFnRpckBgVx8Ul5cPic4tLd7JJ4gP77y0/tbx67oMpmnQCPDK/BVlOVAv
	 1ihoIj6WJFB5Os78f0FTN5ArOqVlDLxI2RzfgJFmbfFbuXSw07FHKVoTAnr6Z4curi254
	 wrjYG2iqHsBAvRgdQWCJv0eF+k/BrJfoGnlQGS3I6PbAykO8MlUYDtFDZlP6rKyTMXKcg
	 O4C+pMW7CUV+zQYUSoWM2GBfiwLUz0XnLatiBpFOIj04sgk9PcaeH+AlAogNuC6iY1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WEjfd2nM;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WEjfd2nM
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso361107f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792649545; x=1793254345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
        b=WEjfd2nMGBudUT3dmNXOoIRpZoXAimNjhvXn4cwjyjKfQNR2yXufkltVvyF0wnboaJ
         issnGpKDJ6HzdZfclQY2GqRp4/gRtewob7HY7mmKOOIbbLyktLG8FjeTyc65bY6Lf2o1
         qoIIUqBIrrBvhaPU9KS2YamLkmLG621IvR0MJevh+Wowdp/L7nD5TGSi3ytxY0P9AN8l
         T1covCMQdXiGv6JhX8yEV35s2kVBaKF+m+g/B7FD9l7+F/1LqlQXNOUpCMdi1ttyL3dt
         /AM6S4pqyKGh1dzaoMSWU+/eq+B6uz2DkS5qeRtJ2hefWCGrsuh428qXO8EL+nNCtYKA
         cd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649545; x=1793254345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
        b=baOM/5GXGL0zVLUi8IX6vl3XTk8MR6hQI9miKHOAkVjlhNaFRoN54Jaj5xfuCBtqgv
         lL3/8bKRDu7gXS3nQUIeQdVBE/TxIHvu3soAfRg1Xbfjedm0sF1ecNo+SyYXc6Ho9Mji
         oosEVQRABAXKG/7aml7pUhgiqU1SQox4debQhDpvZLyrwCONzCcP2q80fPNQlX5rNCx5
         nlbYy8+rYXedWJmLU/W+1T8AlWC0BK9OcdneaJvVF6uudPxtwWxNm8lxqnVXW7cr7o7x
         1osTDgQF4vyS8RtxjFPOogXiheVIZtMi2cn7LSH+4UGAMK9tMQYWzPICBnKMz+oAkObs
         FxVA==
X-Forwarded-Encrypted: i=1; AKwUvBy2sjQAoXcq0B7QwpXgJDy74Qrv9AVXNVh4PG+dfHQdaLMqACh94EQ37n1mdHvjLZUjRUSUIsdOSFLmybU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnxzyrem65NFKrQU4AA86wksZ8CF9ABzak5T7qD3HY0fK283IT
	EvZRZLnXyMstTz4ZJ7Bz8pH7/dT1wE5yZkODQfQDp+aUcgpk7qYWmYNF
X-Gm-Gg: AYBFou3sWAno5sRiOPfePFVzblgVDXmjun1RF/b/NCtVh0j72NF1Sr3Yv/7ho+6xsv3
	mibvGD6skTfPkTIFMNsXUtl8tjp5peumoMKhjz31kF59XUPigfWuLXq6f47Z95F85YBVhV0nSO2
	XwK3ObnsKFyKXNT1QxNeHvqUpHDK6S2RfAPnJPQWo7XxHp+Ws8+ohYzw91RZ2sGjhfGwK6z9rHh
	Fq1wfcyXySOK7aJ9poJbAyVeHYgAFvkGpYD6EiQHaoo+n4R9bYWxQGZwLDKLvtGbUDs3Oy27eXB
	HK7v3eGzMOnuozcXSNc8NSJjahTUltTd41Tuyf9sBn39gd3SCcOf1bSl8205OPDeOJXOOxKP5GV
	+JWacyrhIEKpNAV+lzQSTquzFdjpVZuKdw3kgHZo83L6wYc2+AHxoI+f5KS7j6gKSBFWSItgZer
	AIqlAFd3FlZrPVnnV/tNs+zBsSxlAjdYGwnUdbTb8A3L31BXVwxEYCoGwwybxKy4FhFXqIRwJlU
	6cBojXzBIAamA9+CUlYcSQUCamCsf3HT4Vz0KYbyawSottdeSBe5uH3ClqvGS0UPkEPoOpeih9i
	lw==
X-Received: by 2002:a05:6000:29d3:b0:48e:adc:b97d with SMTP id ffacd0b85a97d-48e2d142df6mr1820877f8f.8.1792649544694;
        Wed, 21 Oct 2026 23:12:24 -0700 (PDT)
Received: from tuxedo-os.fritz.box ([2a02:8071:b680:2840:9131:192a:9b8d:6849])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25827087sm10064063f8f.21.2026.10.21.23.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:12:24 -0700 (PDT)
From: Danny Zimmer <dzimmer50@googlemail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: quirks: add DEVICE_QUALIFIER quirk for Mobapad C2 Lite gamepad
Date: Thu, 22 Oct 2026 08:12:14 +0200
Message-ID: <20261022061214.3497578-1-dzimmer50@googlemail.com>
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

The Mobapad C2 Lite gamepad in its "Xbox 360 Controller for Windows" mode
(USB ID 2345:e06e) fails to enumerate on Linux and enters an endless
connect/reset loop. A USB trace shows the device returns its device
descriptor, but then stalls the Device_Qualifier request and stops
answering any further control transfers, so the host resets it and the
cycle repeats indefinitely.

The device works on Windows, which does not issue a Device_Qualifier
request. Setting USB_QUIRK_DEVICE_QUALIFIER so the host skips that request
lets the device enumerate normally; the configuration descriptor is then
read at its usual size without problems and the controller binds as an
xpad gamepad.

Tested on two hosts (x86_64/xhci and Raspberry Pi 3B/dwc_otg).

Signed-off-by: Danny Zimmer <dzimmer50@googlemail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f..06d15ae 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -586,6 +586,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* VIA Labs, Inc. USB2.0 Hub */
 	{ USB_DEVICE(0x2109, 0x2817), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Mobapad C2 Lite gamepad - stalls on Device_Qualifier request */
+	{ USB_DEVICE(0x2345, 0xe06e), .driver_info = USB_QUIRK_DEVICE_QUALIFIER },
+
 	/* Raydium Touchscreen */
 	{ USB_DEVICE(0x2386, 0x3114), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.43.0


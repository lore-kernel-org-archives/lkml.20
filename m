Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398132;
	b=MYHNvaCLDkMzQSJqifrSNrtTzKIHUJR+zur/wy64qv2cFaYaVF1qT0/2/LoneptXs7SE
	 CKgBZsxwMGHi8qi0dONK/Xyq60JffJX/5kXepfynQDHw2KzVIk9Kp3jc0eXaKZyoZm3+k
	 sgk07BKPMVKQ5zu94+dIncwrR6Yjsc4F2/ui6F+Vf2Qo5+2o9/pgpfbKBt2E7rRryYocS
	 P5GAoFRiTdPjEuHpKeVLKf0Fg+rt9O4/WxAaxBwLAQIHa83n/Jf7Np/pvCXmxtvWBhWnp
	 tJnxbu6WRoz1ooEVHqCc1LvVk6VfRv8lJozTe6NMdQ5AAVdl7+0bZjMCI8oBbZNSIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=;
	b=C77AMZR2T5uNFtNCUBTVRSSKOTT83M8O2ohuimlezrZGwf1TfASvYjIiX1pnhAxO1eZo
	 Rrv34xcbiX8NZTGUxZm1Cq2UY7eLGNDbe38jZFbuDqx/H/WyvTHreJcWTcJ1Ao+OKbSCF
	 C48VsXb1YbKW4PDcSAxC5XM1Xo8OLWs9IJTaRw+mIPEj8Kc8W/H/epCkRyzx6Vn0ZMcHi
	 dvLDm/cc6hxE1y4VGDUk855HZg9Va0mhSK+dK9OpDamZ+mT7JL6Aesg577nOX8gQHi9dU
	 YOeiMOMEbBd6q9r4hlF7jXb8zyWZ+Rp+rDGiJd5kTwSIPIrb7x/4uSM+qXYracnNSkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WGqc7XOc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2280B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WGqc7XOc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11035785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398122; x=1794002922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=;
        b=WGqc7XOc0E0qsd7/OwyF5TfYzrtkzudDHUIXfC3R5ZKXfviFMHazCARavIbMHu3OJD
         dFYAEoZPEsvtJcOjXNojB7QboDiA+WpiEoupeKNXCCVhruOfzLjSa4I9oT19O4MjV+Pg
         n0tT8YtK6Oc0j7j/Ba2usYKcEH9wGgtSFxyF3SgwtD2C0jQ0N1xy4q9m2Am/oyWBUZXh
         pyRvI5K2PNYmYMTMIteM6qt3R+y0Zbl5Gqak0Ao59FfwZH4w9+EBy9K2y1RFsISXJiun
         LN36Y9UJY2Y288iNhvHKaRj6CT7OSHGr5wWC6ElCAlfCTPgFfjmhaWx5P01l5e5ZKvsJ
         jjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398122; x=1794002922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=;
        b=jMNNw75UKDv/LoXqA6/h5OaJH/FKDkjzESsOMqB4lOBMenCCk1+nQQTpRhHwBQQF+s
         54wgyNCZXNCovyrV7F3esScpA+BZrB1B9SpgAAkCBdI2IgoMToKprKcS1rImRaszIpz+
         vqZLIhFoFQrHh66jGy7CQ5UoF8U4Kmh7Uz2Ix3h7DgUS7qedR4DW2PLatbHbvxCtoCV/
         3mU6X+5HGYp48pJqBlN/0uDEuFP8o0jZRFaFGxwsf+HQDXi1n10A/03x/2fQbkgxIkbT
         m1WXKlmmCzan28VUDi3Bf4ZL58MFYoJNLAeO2+qUMuwbzRYlSIIfIGxrCiHn6hiymEHr
         IAfA==
X-Forwarded-Encrypted: i=1; AKwUvBylBF37VMkKahAZo9oW5e6h2FK1ftwBPaD57zGlrOxCx0x9tRBqN8DpvvGuIy+F98V3I/aBJNM0WTf9c78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQc+/OmZHbAmbWXoInAbxYKabfVdrM4wW9mtBN21xLW1Oprz0U
	uu9XTX4xw2WiGVkuo40T8Fmg6G1pRyyuQtrOFHzvPY7LTgR63X1Y4cVagGjsbXrx
X-Gm-Gg: AYBFou3eh9bEgM+Rgw/Qkdk0TtzayTA2eGC8VHgJ/W4esyLb93Ovdnni6QUDY5/uxtp
	50HjuJ0iM7KA1MxzGfWzdurLPf1+JX2g3p/cyHnm7uRhgAARN5bzCg3vfEE2PQUGLmPECCYeyVa
	LyMSwwRd87LjxXnnjs9AfNqMtQOpV7Jdnl4kAP1xBwlMe31nAJCKs/QjHb0UOeQNXGponjaJtHu
	EUVTcPQVQAnP4TgOKFSFo7iet3ZgBhgHBw+71sFvfoRcJNW0U/ioSre/34tLhNgHR3Y8iX4jZ35
	XrbgZ3Q5alJLla+gYwhxYNGOrf81vEGGj1UsXj1gFpsQzL5bE+FJAAuCeuHag3FWWflk2KeXRcn
	c7ug90B016PebcgK87bcmfxzRC1UiZf2sIj2jrYdlcvpufE4swKKc5fqmrtVD2u0pjEQC5Spo3a
	680HVct0juO9ZAlielvsRZwPkzMsLDrPc5FBi8WBtE4x27OOPXW7svXpq/9sGYSD5jnFS9SH3C9
	RZS8s2chwaGwUukYW/bqajcmbpnRfz3sish4S93X1gUhV1R16zySvrQtk6NQfhnvwEHmZi4fltj
	1w0dW2XYPdw1TWhSJQHPw8G5R4FETcxjgWiIJBcw4yPVnpt1QwmUs5j0gUJ6aROGiJIj4d+e7gi
	NjRHYmUZi/oVVy9l2xUTmYQOiabgZexoCO8srSvLeTESE+UuFazxh9+U5Uw==
X-Received: by 2002:a05:600c:474f:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ac1793ed87mr83381555e9.24.1793398122427;
        Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 3/3] wifi: ath12k: name direct buffer ring modules 2 and 3
Date: Fri, 30 Oct 2026 23:08:24 +0100
Message-ID: <20261030220824.915760-4-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
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

Qualcomm's WMI interface definition (WMI_DMA_RING_SUPPORTED_MODULE in
fw-api wmi_unified.h) lists direct buffer ring module 2 as CV upload
and module 3 as Wi-Fi radar. QCN9274 firmware WLAN.WBE.1.6-01243
advertises module 2.

Add both to enum wmi_direct_buffer_module so their capabilities are
kept instead of skipped. No ring is set up for them; that needs the
features themselves.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759bd8..9444a1f29813 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2378,6 +2378,8 @@ enum wmi_beacon_gen_mode {
 enum wmi_direct_buffer_module {
 	WMI_DIRECT_BUF_SPECTRAL = 0,
 	WMI_DIRECT_BUF_CFR = 1,
+	WMI_DIRECT_BUF_CV_UPLOAD = 2,
+	WMI_DIRECT_BUF_WIFI_RADAR = 3,
 
 	/* keep it last */
 	WMI_DIRECT_BUF_MAX
--
2.47.0

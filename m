Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6B47142F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927532; cv=none; b=PmIYC/gf/RK0v8jzLZSKEoMaT1k0DOvrYsW3ZmBeuoMIBnlc+kGQB+of8NI9qtjkPAdDUw/IXKsGOT+rcyyH1GSKMUZttv2LbxM8GMqZw7ISpMXTLyQIsVUz5CSeFwTDwEv2JAuJzwdoLhLich7LUdLBBObw4PIxS1+1xZ5Ggmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927532; c=relaxed/simple;
	bh=dLxOYdKXvkaClOyJOYY7nRCSPbJKZs+aRfOmFRQ+mIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPGdEyiwInlNC71F0L568To/gZ8Ibmvyb+UaxCFz+GbFZSZNoeSR3XypX5OOCOdUcveNUD/0kwvuVM9rHIHT+BwzXHWL7yLK8yCSiemi8FGd+RUl+3A2qKzzIPcyEqunAmaTu60X7EVjtrUisYXUiWQ48B/ziUtjd8Ac00iyO6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euBn8KNB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euBn8KNB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so9228005e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789927529; x=1790532329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLHPUDcQhR4jS0ghRdDc7IRJPvZddsu/qB7+ubmSKgc=;
        b=euBn8KNBfTbgStF5hqzNdM0Zy/iW0mueziCA2hWydhhTafAjkueggDd+EMHeZ6NOQq
         o3w6rNyN8NYGnyfDDCX/kcQtH5E1txf0xzrrCspmD+xTGjfcfdqsVXp+Pjt+C8yTnRau
         2VfKKPfHNAOvPoJeqJTBDUffWFvAPPqQp5VSBPZnjE7Ln6B3/RYWvjYggbgxhU8y3E79
         9jCOy7WzIT6GDs2ww0dq1DmdpmRilsCdhJVR23VCKjA6gLdUwvOOR38B4FUO/xYiTLgR
         kyr23IdzUv/M1k0anrT1Glrois72AeKIIKpwj8ww3AzfuMR5P9LweFIFI/7htWlfVjhx
         H37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789927529; x=1790532329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLHPUDcQhR4jS0ghRdDc7IRJPvZddsu/qB7+ubmSKgc=;
        b=dVRQw4w7gbZc7oNFniY59abI++HdHLqdeW1gs12FYBaw5hE9bogoXFiYiGX5OsgNe5
         kVRZOjZj3Up0cSrQ7/yOM8iDiqTBPIuidzTTXNNied03Bf4QzeXeQAII+4fdZYjL73mD
         3yCvFTWswHff8iyBbOhQM0KHX2dKGVGkpnOVnMZiYnP3th+3ZMlNrDwniHptO9eiMOZa
         eIo5IQM6KQnhaPmDK5JyY7hd9klH0W6Es/MtXxk3vp9mIvSco+vXngN6vWwTHcXJQKQX
         0hb5Uxux4+kz+5db+5SrnbIudoVoFjw1Fpyr5MpmOPxyM8ATQjIDQeRU0iY45gvwE8/Z
         oAEg==
X-Forwarded-Encrypted: i=1; AKwUvBwC47XDNe33oRURi5rrHPwBfd+sXLy1nPCSVo9qQl0b8uDVo5G5Co+jzzlC6sEl6+KlULFEy+Jc3h7Ewe8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJaLYHoby5ZFe9g5mf8nLWDEeBRcgEfBgppDaoRtEl7/SjS2V+
	ZnOscgSor/MNyLK0Jg0/HeqNAGd0o+uUdYXp8yZh+ngMVXVLGvmQcImQ
X-Gm-Gg: AYBFou1Gv9wGaBXTpL+vSDv7qu3/aaHBUc57B0Y5wIpKiZbb7rVhXNFarhkxCNYB9m8
	iJLSAj2GhRUNeiv0znAebNV2rj1tjuXVgy6oriXdnWC5N5x2KpN9H6iwVfMXgZElnJu+5SRnaf5
	d+QLZ02Rgiz6h7/5xcFiZX1dhm7yJFWxmV2xNljcHGbKNXhtzIfRm86tv8hQ+b3X0NCEWUCvz6K
	4qbdM7zWlhJ1sAH0F47JaDYAJsvuEM/0daPwLzC8yXHYxKeo8sGolwehF3wBetrHL3kosvmzGLw
	E9Ca+iB2FDtp4+nu/pe8IbhJ5jjzHYlO01cXrpQzmyDre2KwZRjZqRLWv3eXaxf8q26+0sQ295n
	dMlDeXiPVBFkzbxDLTxAd0WFzh8X9Z6XK7ij7IMvuBKsi+Lo6sEUMVhWs92+cZx7twlbvALR+cZ
	cFsftdcUg9CM1JTmomAtEg6pNoU2KEHrVZF/qPnXiiseX0SToADGDNJdwgcunqZy/AuPQ3e1Zce
	EkHbHghN4CZaJqz+vTmAkJRcsr8opH2PLKhVDpU9XP54Vv4W2ugYQBaQQ7zDJBqPOhcU2x3Q+bC
	otkqQXqxw1BjUxwHzlcoY2kF+TRS+dF24AITmQgYCXUMCtYPYsdjw+lU5KwjYdvf9UZGK2dkFjP
	gLVXxHDJcXJ0SWXjAKstfL2OS5B2+2jVA5Xk=
X-Received: by 2002:a05:600c:3f06:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fc4ff42b4mr132546265e9.11.1789927529036;
        Sun, 20 Sep 2026 11:05:29 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7b9bsm164648055e9.5.2026.09.20.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:05:28 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 20 Sep 2026 20:05:26 +0200
Subject: [PATCH v9 4/5] iio: magnetometer: ak8975: add scan mask index enum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-ak8975-cleanup-v9-4-1b0f00ec19ef@gmail.com>
References: <20260920-ak8975-cleanup-v9-0-1b0f00ec19ef@gmail.com>
In-Reply-To: <20260920-ak8975-cleanup-v9-0-1b0f00ec19ef@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789927524; l=1530;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=dLxOYdKXvkaClOyJOYY7nRCSPbJKZs+aRfOmFRQ+mIo=;
 b=957w/ie6wp15m2IKWReNJXqdl264V+6m3kEKGuUYbsq6Agb5MPU27RYMGJhiCyeMLa/fu/Lc6
 V3FdLkJmOnTC2c7jxEhRlnEmStcYpd3tzZeQ0U+Ox5PQCJbAJRXnQuA
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Add an enum to explicitly define scan mask indexes for the X, Y, Z and
timestamp channels. Also, update the struct iio_chan_spec to use said
enum for the .scan_index parameter.

This prevents magic numbers from obscuring the hardware channel mapping
and improves code style.

No functional change.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/magnetometer/ak8975.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
index 42f6892f4efd..ac556644b02d 100644
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@ -237,6 +237,13 @@ enum ak_ctrl_mode {
 	MODE_END,
 };
 
+enum ak_chan_index {
+	AK8975_CHAN_X,
+	AK8975_CHAN_Y,
+	AK8975_CHAN_Z,
+	AK8975_CHAN_TS,
+};
+
 struct ak_def {
 	enum asahi_compass_chipset type;
 	long (*raw_to_gauss)(u16 data);
@@ -851,8 +858,10 @@ static const struct iio_chan_spec_ext_info ak8975_ext_info[] = {
 	}
 
 static const struct iio_chan_spec ak8975_channels[] = {
-	AK8975_CHANNEL(X, 0), AK8975_CHANNEL(Y, 1), AK8975_CHANNEL(Z, 2),
-	IIO_CHAN_SOFT_TIMESTAMP(3),
+	AK8975_CHANNEL(X, AK8975_CHAN_X),
+	AK8975_CHANNEL(Y, AK8975_CHAN_Y),
+	AK8975_CHANNEL(Z, AK8975_CHAN_Z),
+	IIO_CHAN_SOFT_TIMESTAMP(AK8975_CHAN_TS),
 };
 
 static const unsigned long ak8975_scan_masks[] = { 0x7, 0 };

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105407;
	b=s0zewYV1lxF74fZsDJ5Zno+MIfug7u5M6rP2BZq8MoIHja1q1TYigHmNqG3qcGblA4sQ
	 XqHjvxs0ZMbJ5qynRT62bZ2heM3mZYkivf7Tr1IGR4c6DYyYzURgWFJXrhONa2c+kH/Hr
	 jufvFklIqLWgcOPX2IwM24XCVA/ib8PpEzLLDf01Ayk7rhdhYyEZqZb8WaEujU77LtM9Z
	 9J5OhapULhl21mU+Wk+Ss/7pwWKMHfkbKGw4K7jtVb1WxJCUbpfJJWLWL1jjcCjvssT1r
	 UivsXKbsEYWjTkDYmByU+L0bReca8NpWBrep/V+5aRhwNbzbExhYLfPL/AXE0Hri4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
	b=aFrpIcFAawM7CKRZdquQyK/wng+tQEUCcGpMh+tHSZhJmAXcHeILPm38p/ATBLMTC0UE
	 FE9ZlWI/5yvaf9Y0W4EGu7ZTw0fR4ud2stD+5QvBJZ9UXoszcKngK8CK82BbMQq3xhc0W
	 cDYDWtNGjDya1grr9iyBBB6yaEGPm1EQXGz6z4Aq6MlflpiYwxd5FE7k3WzbRMz8b1IDf
	 Wc0nc4oIxqLhDrUvM2q4oKhbboGDdteIJE9D4NSijiYBeaaXE8POqPOd4iJZiv8be2lrh
	 FkDiziWp9jvQrawG58AjMhDefdbPIsTR8hMiD8mgU9DHQ0XTeJP7B7esh2e4Q2czl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fERYkGLO;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040C606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1040C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fERYkGLO
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so9634211fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105405; x=1793710205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=fERYkGLO7Lnu2DkX/7bn/afdYO23mp5qW9KVQlCZBoCzvajuqGp16A/e/h/SpUkTW6
         iwweSy3pejWkTe4JIJ7d/rRMtdk0WZo7r3nnujnmoq+etqZ2TGcZwdMmgQ1CcXTlaG/1
         BVwldr6P+tCD/NLU7BGX/JYjyMcnUolSSHFxg+VvGNjeSxDY1KhUazKHOYNePLjtq7nM
         0ma5UjSP4QWMJHwVCIG0bPfx8F2qGyss425ANUkTirPGVDwCuz5Qs1K+VKxCP0sksFVS
         4jnW0V+oDHX1yzOy/2/7To+LH7S4mkSnO/9rlTTPBM+5awfi3nRll+DARFWMg3L4D0gJ
         B6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105405; x=1793710205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=KuoDQNeMTxzR3V8thbSJ/nEwELr/5jCvf4FJNB5U9GkQkWATIeB38n7Mu5xqSouCb3
         xYHSvWVJJJRGlYzdijw+9Fj6Y5GLR3f3aMCO/vFHw2wyoo9lxmL7XiWQry1dkcifA6e4
         kI8s1bpwH0/e3f8dCKzSO/hvDCCWhSAjMupiaDKekzsIVF7RmY5prpk8YFf+4CiGrsVH
         aYE64jkIyPY0QQE4n9cknfqe3JQ/69HMSvlG6f5ql9sWjiVhKQklIMxViqzvj8lVH06s
         zWswabug+5GLAlQd6CPEnBA69AOtLib1gSg+7MAvQQ5jcw3Bqsy9MfRXKUC+KTmT51QH
         DJSw==
X-Forwarded-Encrypted: i=1; AKwUvBzRWpZEIIOenx76Mun0ygDYRdMbJbzroOtdvPaH874Ux3zcOpIX4wiz7uIcevHKyIhAPaQ6hPnCTElVX2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyxbTPvodEXZMonYTfoWNul1UhA1BvynU6G+EBaIB9pwYBF6/p
	I30ZpLTXyrZFz7hTD59uHtiv+0TPmpYF+9UYip+sKvFInaWLmXOsHCvw
X-Gm-Gg: AYBFou1yuFLOwLzUMqdePDVaTaOnm90Ikpdxu3Kh84J1U6YVO9T3U7gR86OZpoSVRUM
	njEGWWgwj69C7Dz9UQbA9bLFLMxWt7wHR3WwgSQpAIMuVe7GF12U9kON8sVAeBH0fI6j3snqt4e
	QRQkQ1tAJZ1G4MY80IdBcJRBys8o/9dWqWZfzfJGpJEjqzVfg7un/gG2/GiI2zvM/w8a1LpdsrA
	jON6Ru5za+AuGZzZ61adpoHotAdNxDq73v4gIi6s93/vpAN4dRBRq1ZwTMhAaMuo3w7OBZirjew
	ImgXN6MIqh6jriaQaSOvhFgFXVtaX02O8op2CXhBps17PRsBpvRsXjaGGC2VPSm7vXqOYDaZlXx
	UjJctvaf24YAGplci0clh7HuOU8TGv3jVXhB2kIeO34KqWftFgBjSRN6oMixOIgsxBdgrTqPqsg
	SGyhqF1eHal5T15EyN/5gtAvOugKoenrYM6h+KcTGYil0ARzRTYNaf7PfwI+PBwbXXfsCEZEQgY
	5vCVaaDmNev+HiIO6HV/UFyLi+A6a9g5XnpwaeJ7l6qOfNHL8Qzh1NTxp74ibFPJbgiBCJwfNMU
	y40EKNECACk2H/78B7w8uxAOisCzzE9j6n9jgHfJUbIrw90kV2XfOehLnTdOhp+C
X-Received: by 2002:a2e:a883:0:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ac908e3716mr5518161fa.5.1793105404928;
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 2/9] iio: core: annotate the conditional mode claims
Date: Tue, 27 Oct 2026 14:49:47 +0200
Message-ID: <20261027124954.110697-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
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

iio_device_claim_direct() and iio_device_try_claim_buffer_mode() hold
the mode lock only when they return true, but carry no annotation. With
context analysis on, each caller that releases the claim is reported
for releasing a lock it never took.

Mark both __cond_acquires(true, indio_dev), the token that
__iio_dev_mode_lock() acquires. Sparse no longer reads these
annotations, so drop the comment about it.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 include/linux/iio/iio.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 9b63785d5aec..ca91f5a64626 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -707,13 +707,6 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 
-/*
- * Helper functions that allow claim and release of direct mode
- * in a fashion that doesn't generate many false positives from sparse.
- * Note this must remain static inline in the header so that sparse
- * can see the __acquires() and __releases() annotations.
- */
-
 /**
  * iio_device_claim_direct() - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
@@ -726,6 +719,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +754,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
-- 
2.43.0


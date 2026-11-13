Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547539;
	b=FQ2lpVCVY3ToRn0E6aSq48iSh3ESHSKuADQkNMwsY8Gc0PWFsPf7gYKpVr0zfY+QixgM
	 q2941dltS/HqZLDfYxliEzN+NK+JXciKm/I5GpA26Zwg5lNsYMIzg1aMeKfnHA17tr84h
	 02krFtFvWjPaIy5WdybExusFbZPUYHCYC7bqu9/aiDK+qG6ZIj3xgTyWdScZOOGWSUnYU
	 Wde1oNQRqSmf2sf7jq0XbtLLNOhsRaS5DOloM/iTovpNTIQiwpuQzYklZPRTZQ3Kb7D0S
	 GbtIuvDORSSeUEAJPTC46xy8cBG9/kR0j84HRx7CVisL0Que+YldTNT3LlwjIRh2SXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1k1ZBJ5LzpgKy9mCLIxV5Gei8N0BYaOcvVjj0wNHHsk=;
	b=yYuKDJC+qIulcCrXKoiyCkp5gOp/cT4KjIfiVLBjHRyhRqg/XXDoijN9/s2EeNDRnEI7
	 X5wcsYG6CoW3CX3SBrGy4mPzB2+KxPWUmHUBJIDOtTwYzXQl2nRO7BOg6cAYudlbE2BFe
	 7tMY5K7rLkr29+aRv82j2IOsHwZKz++/kU//sLR78tZFodFOXGccwVkItHunvFb/j7FgW
	 cNcCeHwEyw32sBHQ3eZnUEFvnvpQccxnXTmpz8+uRzU/09xLrtnQVXAHfDLvv1Dp+YJkl
	 0jK1sCxz7tGWIQqCnxsocj/joe4/aueTrKXS5GvsGZ5ieUcV3EvNiDAtBCHYEvWYPnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWxBsus9;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWxBsus9
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d6554d96d3so206193137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794547538; x=1795152338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1k1ZBJ5LzpgKy9mCLIxV5Gei8N0BYaOcvVjj0wNHHsk=;
        b=HWxBsus9+TexH+K32UbY9OmVeoR4YngQfk9i27+9bKYEkT2dSGR2LDY2E1JldGlLnB
         rO59w5cdBVjtI3GY8x27Ag4xgW0uZxbx0F9WqHIssuG7EDgS8SlyDXJvCuIKjyj/uJpa
         2BIr/NCtFH4qOZaCeFusjYbQDRaT4WcoqjgmAvLW5sLOO4dBsIvs3ML5NJRG4N37ugOn
         Jj8QHPY+MiWpKT0tshbpvodJfpFQeUZasTPSiPmU7rsudju4OfFl5QGEoaHgmR/quw49
         LbkJbEAqcYIxJ5uznW6DjIlQD0zAknaqHfVlLlyswfSb38XnXDifz+Y6DE4JGniJtT/X
         Ld1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547538; x=1795152338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1k1ZBJ5LzpgKy9mCLIxV5Gei8N0BYaOcvVjj0wNHHsk=;
        b=N+VRghbTxcl6l3ljQ9gXW/seicAHKer5uisBwcObyKfsfQmMw6ImcHJhWP4k3SzH2K
         PzBXS4pF6KI7LoufQqtNkkFOmAQ0g0gJeJloHvX7tm+pmBb2ntUI8SaZUL3TkJdZmpQO
         HbTAh4S8k6wrKmO7Y/pEy2SBussg8Pw+WHYH+y0ZjQAYHYa2s3/8MwvDh5PvryE9TJYj
         Y+9Qaw3HhWGXUI+qTaQiC5v+rgMVydFyy1WinPouJa/LHvdgDpK3MXGSFPJ4YOwlY2NS
         fcK3VnwYXc7dIP0Y+HWkWBE9px3gM9YiOv4TmGszQEBoAxqt9SYn68xEHybCvv+GjOhC
         nxvg==
X-Forwarded-Encrypted: i=1; AL+hErFpx3+uhD1DhvZcLXK22VKey55DP2Kt7BA1sLQDDDFUuwbxzHk5viTGtY69vnb46S334QtsL+ov4w6Zorw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XLv0Dhgns3igIS/Da5+CwAt2BBD+Ay+NPEqsxj303r87Qf6Vz
	CqBdP2pZXrduy8lM1vAQx9OSKS9yesfZqZNPd/qmOc8z/hJ76g1holA+
X-Gm-Gg: AYBFou061CCYX9oi2zJJbq5eyjJnq3f+YKCLRJ6ZrBFu5/RvhK5VD52C/DdmSIHlpxS
	KIoFnJyZmEoIgg4jkCBt72lLxAytt9JPj0VRGfnROtM2zxUmT3vHO70xOYrv3ZFWU7XRl4jcXYV
	VJ6IX5d2aY5vAJNY718RJ2hVrtHAPfheV4yIbAckZ29nZQmk0IKy49NIYpXhdPZgMOECpUSmzBn
	V6EXLRwtV1PFSemWk1HA13csPubgKGVUYVa5LU4xF12lFKOw5JbeTz3u0vB37tBFvmWuzjFZHZ0
	ui5Dm1rkU/DD74ku2ts754HIGrtlVfzQHM7y3dEX/lWuk4ffWSjhC9hCWSWXqclULHofOTW4Blf
	D8Tj0x+lkiv6FLWS2dH981bVJCJ3eNgV9Xwhc7G1bEjTEIr7LSCX0YgBgMap+Bsi4iuFpd9zuoQ
	jcxvAenJOAcjql4ebXvXrb9DeTGcwpTMG5mRfyU8yZzYNfX5CBn8GIhP6oFP7DWyJ9QjOXRAmCl
	MsX77hcp8SGZ9ydEeTjyDhxJslQGtCm7cnMeg7w4WLdMx43i9wl9uWocWF+Z1a0dRENEBVbsTvQ
	0OwIVPM9Crebs6RSFdGcpAySE1097EZvQ94RKn4=
X-Received: by 2002:a05:6102:f0e:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d64d6c64damr508660137.13.1794547537826;
        Thu, 12 Nov 2026 21:25:37 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8425d142sm880439241.5.2026.11.12.21.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:25:36 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Subject: [PATCH 0/2] iio: fix kernel-doc warnings in public headers
Date: Thu, 12 Nov 2026 23:25:31 -0600
Message-Id: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAZMkCJeRRxsjRqUVloQQXp3i
 +Mb/n8hS1LJMJgXktyaNYYKagz4fQ6boC7VwC1bImJUjXhICnLiEj32rXedFabVWajRlWTV5x+
 OUykf6XA612AAAAA=
X-Change-ID: 20261112-iio-kernel-doc-80cb46e21fb6
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794547535; l=1005;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=EEdK5omgKBmJXs8GL9mTWLGJyllyZj125zUVxHBU0+s=;
 b=v8DmdEanPM5eRXLkQovWbiV5CIAgbSB3h1P2lBhaCeTIY0yTrnOo9JJnFS73REWTwK3Crl0ST
 +g8RSpar+UsDVA+93AMTmUotjwXugcMh/jFUf7IU8J3yJn9zUdbpbuH
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Fix two kernel-doc warnings in public IIO headers:
- Rename @consumer_channel to @name in fwnode_iio_channel_get_by_name().
- Replace repeated 'NOTE:' labels in struct iio_itime_sel_mul to avoid
  a duplicate section name warning.

Tested with ./scripts/kernel-doc, ./scripts/checkpatch.pl --strict, and
W=1 builds of drivers/iio/inkern.o and drivers/iio/industrialio-gts-helper.o.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (2):
      iio: consumers: fix kernel-doc parameter name in fwnode_iio_channel_get_by_name()
      iio: gts-helper: fix duplicate NOTE section in struct iio_itime_sel_mul

 include/linux/iio/consumer.h       | 2 +-
 include/linux/iio/iio-gts-helper.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261112-iio-kernel-doc-80cb46e21fb6

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415252;
	b=kWpZULLuGEK42xmhGHRryEtQEnvpGfo2eTRTL1O24Pq/CsNiZ8hmQD8sAUptg7cg4c1J
	 RgjQwJHJ+fmxAb0UZOFPuF80zUK3zmRzdSZIre6/OhbJP7ZPnAPBmehS/z/hpnx8Qo2wK
	 1HKfTtLe4mSfR7xKbzHCXByZBM20h7/IrvQt/x5XTEzPCFjrdg6sV47bY12D0jKDVitHk
	 nkmRSAv5b/7TsDMS9YLX2TS16Kk2F40u0mQ6b/y33WxRqBJhRAd2YzNOfuwYgJ4s2FyZG
	 BFOZd4ijKib9EzNR442LsgP3pj0pmZmiscqk2qN0TSRgHvnuBJydHM1S6psY/k6YnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ru6Wop6zD4SlcoFBcvjI3pjN1oteV3A3iUcGiS7Riek=;
	b=LZc1UAXPrB56F5r/ZNAqNour4dS1FNEpQkGW60a0mBfxDgu4C6/sNxH6VouuwlLnrwcE
	 ws9ZWfmLb7kNZNYHuibhWGBptjBjuywaaLkbE7kfaCu5dMzkP2sLC5DUeszF+7s958JWI
	 JT56dn9vvXYsgEUKp0XkgLjfdF6tA702GE1OFSsFaNfMhoQue9lTvcifKvxiXKPj/ikXq
	 jqSXXUjreQzumlmfeeLf3eXbWSk5kKLIatgef+9C1jpTQ5bTJeMV6CRmFw4RGQOWGSnjE
	 1GJRnXD4DzHb4P5RM2to34lk9plr3YVqDkgukO01BWD9QK4WQ8EQj/+wrNt9tqEbPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6+wCs4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C67606A897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C67606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6+wCs4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so3639193eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415251; x=1795020051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ru6Wop6zD4SlcoFBcvjI3pjN1oteV3A3iUcGiS7Riek=;
        b=Vh6+wCs4y17+XhlOELZAK9/7BUqo9m9pKcWAWOT2fd48lOkHy4u9qQFmjzT72OTCfL
         SA4642JaeLj05/jZr8BDvmZI35qddEw100h/rplpj1r9m9Lf460vqL4e1HyJn8E1yx+1
         I1KMJlVDC0Ci6oHbWKU5ajfWPAUjAuaWp1m9Fv9AVzszXLolfYJPK+ECxRqbyprieR8c
         vpEav7vKmSWWIMYA1S1jHLyda22Pezqhiennthcpw0B6ywEcO+UjzqSnAqesbxUgAzdz
         7k02c2pfBwMK4YY/iWg2fDoyBcKAWcGuvi/dHerg0V7/5QDXYQLL3j7MREuU3WA4tVAo
         vrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415251; x=1795020051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ru6Wop6zD4SlcoFBcvjI3pjN1oteV3A3iUcGiS7Riek=;
        b=WBYDh+2ob1ZLEqEY4XggKgAkPGaTv7Z+UZtzgEQXTKuDafo7TS7EeG//IIGoSvOw2M
         zGEUt+FbJjYS75yN3fWgaUORwTz8UQctP8LUlnHTuzLxHpEgkga4qKZ8a3WRlMB4+BzT
         jNgmU50zHfQR81PW6Dvg1JeHVxRk8G4LVvFpudnOaxnRGRHTiuAMVnPrUMtkaMgYPYVH
         qZzJYK6LD8fL4B4S1/cM+/F3bA/e5uTlu1naMKtjv/BD/oyxGMHtRvK4IuwrjsylmhwX
         ni0zf/gJLAAWLrhOw0CW+kNWr6FQuMtc7yTBBzHgYoeAikvyBlQZybxLwZ9N+ptNrb2e
         lc5Q==
X-Forwarded-Encrypted: i=1; AL+hErGQuzp9ZOGne7yl/ZXLp6aPkhPa/vlJyFyGMWpQmnvW7kgg7E56d1clrd4lns/goRaFOShnmwelGSv8Ols=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FWkzu72jz44MsecC/OuCTybSd/5bsaS94NzZwhXo8TEW3Romj
	Qd5QViJkpEsSGh8c9v3+2F6mR9KSWWyhdRAkms0N648nsOuqiu7J0u5G
X-Gm-Gg: AYBFou28mXc7D1Etx6tEWmN+4U+L3UJCKG/xdg0T62tsdPj4l6eQiheWj/0Kq99SdEP
	RARQbxce5LptTbkpLEK+N2DXmdOl/WLviOqEjs8utJn95+8t3GV5rYVbXWLzAVa6+tzp0muV2SS
	qWByXEAD3wft4SJLxUiyRzfOAFxfa6wUYnSeHbcCFbs+igbawQhCMgD6Kb+1Ebk3hCCSh1/1Q/v
	dVEB2MQ1kmMQqNaIfiimQGhanATMxulKQ1wg8CmVoixF2AAmUSrtEGGVxDxhX8y4cUA5V7zAjTS
	5XTY+SqYO1W3GatAnYf7V/X6fKmkEAik1PhYFDatfL0cPjoP7HJj5xrmNbfyarEmj/c1jweQVXt
	T+LJl4wFJIPrRSzMeplTOG0pFjUS0ujPLpcxtEwfG8Uv+YeadSiUpwNDMVm4Whw6+9TUMx9ve8j
	n+miKheFy+b0A0YEFL0iy2s5uSk5ma9pYhjuM3q875UjGjy/yUoeNB/+m0btUbckIGyLO0+vp8V
	Ji4b7Wy8Z2595GLTuuJMlD0apKi0R0WOZNfO7UpbfV+LR6UoQw0niv4SKLzLcKGK3FZxzD25Z55
	8TWPF+yU62MPmZPej7pqLWy423u87shDJTgbbKEIVeWci1Wag9D0w7Imz2MaEvxYM0jG4naM11+
	mqT395ZFXkpwpFt3Vayk8I3gjCXOk+sl2OsC2Q3R/FrxeJ6Cbd6HD2SSxTW2G1XVnYDtiCEbb+T
	peZlko6P0LYwiILxSX3c1dc6LUmMmikAQaXfzensfwDA==
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr1963858eec.15.1794415251216;
        Wed, 11 Nov 2026 08:40:51 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm19158013eec.24.2026.11.11.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:40:50 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 0/2] iio: proximity: sx9310/sx9360: reject out-of-range hardware gain values
Date: Wed, 11 Nov 2026 22:10:35 +0530
Message-ID: <20261111164041.341776-1-kapoorarnav43@gmail.com>
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

sx9310_write_gain() and sx9360_write_gain() squeeze ilog2() of any
integer into the register field. Values that don't fit wrap around,
and 0 and negative values turn into the maximum code, while the write
reports success. Reject those. One patch per driver, as the Fixes tags
differ.

Changes in v3:
- Return -ERANGE instead of -EINVAL (Andy)

Changes in v2:
- Keep rounding values between the supported gains down, instead of
  rejecting them, so the ABI doesn't change (Jonathan)
- Only reject values <= 0 and values that don't fit: FIELD_FIT() for
  sx9310 (Jonathan); sx9360 checks against the gain of 8 code, as its
  3-bit field also holds codes 4 to 7, which the driver doesn't support

v2: https://lore.kernel.org/all/20261109165200.305266-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261107111710.442318-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have SX9310 or SX9360 hardware.

Arnav Kapoor (2):
  iio: proximity: sx9310: reject out-of-range hardware gain values
  iio: proximity: sx9360: reject out-of-range hardware gain values

 drivers/iio/proximity/sx9310.c | 7 +++++++
 drivers/iio/proximity/sx9360.c | 7 +++++++
 2 files changed, 14 insertions(+)


base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0


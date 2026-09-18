Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8943FD3F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753785; cv=none; b=tGsC0/vPAg3KvESIEgsW+ARWyjAFoTHiBSNIt0uNXpf29XXIHEEkIxXH5R89ZDqbgt9UojnFkRLkcxQbywspT6wWBFWZV154GO86YSlVax6Koqm491cGfALpxrNf5MzlsueHCGbsB/ZTja8uX7EZvIfzNjtVpVD8U7Cvj8dsces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753785; c=relaxed/simple;
	bh=rx5LkplJ1EvqZTQ7W+ZQsFaH6OOcHwtKXdefdtsmBUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CAMHho4d4l15fC8MQI6caAqmWImd8rCmNv0Xx5+NkvfuwYEsQk0zvQjQP0gPJC90aHPLbZKsNgGuk/lJtY7jh7o/b0XbhbTVK7Cqr9RYWHdOXKY/Wmy2pLOP/pXyQrsht0z/jQc9xblbfjG4prhna6iEXk3QXNksREb2itndee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0XJEFK/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0XJEFK/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12913225e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753780; x=1790358580; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rf57LZWJDeznNOpWRkZKVbNmugLZiKtRUaT/BkCx1UU=;
        b=g0XJEFK/efTJ8a4/LgR9pUiNWQzcauMf0X9etTtrAbI7UG8Dk9aFHLCibh5fGT+hrI
         ncPJCB4I4xHVA73fu+3UdoxC3WpksLlFeeMvsPDmhPXvrbKq3V01jEZchv6UD0Ab8SmV
         RQHDi44vBWD/MoW+NCd3WIL3GjtJYV/vVVlBTxsRq8TnrlhO4isWCi4v9GXzTGj5iQbM
         MQDY0Yn0TTNgmF6xAithFypU3b+Rw1ezKKhW0R1M+PdLOqCO97ArP0KQaLNpdT5W6kl/
         Yh7VaAiND9JhbU93XWDf6qKjcwMdTiX1MOIOc2EnwsAbEqVd+4lIcyf+1qhphfd6ZJt8
         Xc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753780; x=1790358580;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rf57LZWJDeznNOpWRkZKVbNmugLZiKtRUaT/BkCx1UU=;
        b=1jAEbiHIQJ3WVCasDExqGY03hkfIzD6ENKwExsxJG2mnsx/wM8wePf19+2IRDEFUfZ
         dkdjfuWrLtN8z8ew9jh3GXL9qhkEE1gODpNpGzd/4tVxGC4TO+acQTj9BRZoP2BQ+5mx
         GfbQzCrXAA4k0ARYMNkXn2I2KgEFDfkNYuIMwGZV+uYvonqENWfjNrM9XJyQnYSDng0i
         AidmzmZlB8C6x+Jz0HWWOHkp+qWmuNX9sbq3ClB53ulQ2q3T2ZtjsW1yd13VaW3qdmFi
         WUdhiPgu7WhrT48avsu7+woetrlC5JOz0Wk2Cs7nKPyxOm0K9W7ik5x+4TuEc8gv9Zbo
         Hasg==
X-Forwarded-Encrypted: i=1; AKwUvBwgCzt07AomQZw3eZFWOyAjIiEACqCFTc3Qr+UVpZgmcdmSxt3gAi/1lSr3+ZLzGoZYgZM4QeoRAQnmcWA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUhNdbCFE28GbQyFjyiCw4bf9o55MYv+YdEFSGii2ThnOjHf7z
	xMq1Zz11M8egCdy7JKpFBevt9JBoCOJkzF3nS6iHJUI0gvhF7qHb6tnotmvSGjXk
X-Gm-Gg: AYBFou2RH4wwOd4OmfZmeCHk2sRavXV4cnj+LYayBpH8wFAM5UR6sNnpKSyGryGDagt
	ha6CEpFhYoCz1hyQe7/KQEzTVpA5d4XNKw4PKq/SH9sbOiG+0rNIY5HPm5glfXj8qpII8m6ZPW6
	jWp9NQy91NTJTHI7D/CRf9dR2/h+F/0y3lnNKZbiZMQZFQDygoq121qs/GroOZg3Z0oDtMPSNgC
	URPQ7NVjQ/QbAZQFMxJuga0SFmz9z4DVVUPtMQus4IgZhqwqsoLnwdfvJNV1XP659e0tEZTpHoB
	GoBTJfcZ25Xb6Hybe/BTBxUEyWOsR+WA4+mEuRtd1EmbY1iruHi/fTwGLhBzTM4P3EeXOF1O7Sd
	27Lq+K3yTqVqfzC0grgmCDIxBlS0JNX+iC5pmjTWKhX3ZbEhrEFsjPT9rQls+g90kOVuXVmgNj1
	3UB9K2KKD6pBJU/Yy3zbDJDk6NDoT77WCLNgEVnmi5kW4Oxn3KoQkxCOQPBeIG4m0DnNGW9uDWo
	gfoeVQIaKENAvtKTeUqVRPCiBSb
X-Received: by 2002:a05:600c:46c5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fc566e635mr43987565e9.7.1789753779992;
        Fri, 18 Sep 2026 10:49:39 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:39 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH v2 0/3] SSAM registry fixes for Surface Pro 11
Date: Fri, 18 Sep 2026 18:49:28 +0100
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ6CMBBFr0K6dkw7BgVX3sOwKGVaaoSSKRAJ4
 e4WvIGrycv8efNXEYk9RXHPVsE0++hDnwBPmTCt7h2BbxILlHiVBZYQJ7baEAwcQCnQzjE5PQa
 GNH0ceQHrPxRB1VJdLEp7K1Ak3cB0LJLtWf04TvWLzLj790SbzgMvR5dZ7bk/3s4KJFBtc2N02
 aDMH67T/n02oRPVtm1faELms/IAAAA=
X-Change-ID: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=1192;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=rx5LkplJ1EvqZTQ7W+ZQsFaH6OOcHwtKXdefdtsmBUE=;
 b=qB0xedgPhrEDDJm5cy3JrKD+NGTw5ixnu4k1sAug5ydIeYnL0G4Ekjdo5DQ7evd6anTNETL/e
 dAOT9IYUC0DBjPLiLd4Ig+lZyFrA51AhQGX99YSXppQWrpTpc+sH/16
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

This series brings a handful of important fixes to the Surface
System Aggregator Module client device registry for the Surface Pro 11
(Qualcomm X1):

 - An unneeded driver was removed, silencing a dmesg error.
 - Tablet mode detection fixed by replacing KIP with POS driver.
 - Performance profile and fan support added.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Changes in v2:
- Added Fixes tags to patches 1 and 2 (Ilpo Järvinen).
- Link to v1: https://patch.msgid.link/20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com

---
Dale Whinham (3):
      platform/surface: aggregator_registry: Remove sensors device for Surface Pro 11
      platform/surface: aggregator_registry: Fix tablet-mode detection on Surface Pro 11
      platform/surface: aggregator_registry: Add performance profile and fan support for Surface Pro 11

 drivers/platform/surface/surface_aggregator_registry.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 3eaac948bf4505bc7e3b12d3ccf4ad900e5df082
change-id: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782

Best regards,
--  
Dale Whinham <daleyo@gmail.com>


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D233A00C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744769; cv=none; b=i0irF1Vl9Qml/kOJcLTSKAq3XAlc+VNpJRVI1ji12rijx97GNoYB0X86rbpEVtNJVBptHKvKWIiNqrfRbV9NxeJbOh915+223q0JYLMdUUPlkN3OhoA0T/rUuTSxYwmwEh/dUkm6VGJRX3SG2jO7cJR0lVdHvKP85RTXTexe5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744769; c=relaxed/simple;
	bh=yXPQpfc9suKyLzGtUqDK1jBB7VLe8tQS9GLwAXxdCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5fBIxnEACjR3oyftTT4BsGuwYgNLw4DbyXucmLqQ8E+EDRaxGAOlURJso2biBeYAhbMCYSKbtm6zhjNQeeUZ516Y4Qmk1m7wHHKTAdVkEJ7lKLExg5mgTf8h6lvKQbRhC0jeNstUq2INAb//FA9OwYxO5yHIbRKF+WyDavZSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxQ5oVLz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxQ5oVLz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11427925e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744766; x=1792349566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=MxQ5oVLzvvMYe8921Dv+Aj4eIgD60YnftXu+cJah+y9ln+pTjJOv6Est8Jza/j5wgp
         GKbMA9hbmcDHtVEtnTNcgd55hTtDAH4Bh/Bx/1NXcMmHOYSuRcJkfhOHXQU3H9UMvxLI
         hrtcfL3nWXqnGfxqMd5z8Po4gJPx2win/9f9Zz/feob8oZjaPvpnhwbxhmC8oPGo++9W
         ifmyq2NUYNN3i5xEsgs/kukVz/RtUUzr1O1zisiGIKFxb6DZcfmVV29Fti41I+IOVHAY
         f/SH6TKpulXMFnk4j/DUPun3ZBU9atyjM32c0hXA4MsKcmfwFKrbzca/86yAJsLqspWn
         NaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744766; x=1792349566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=AehWsv/3OjAGRBsVsYbFyW7bi7Xodtoyn+La554rmMSsDBPyIqJOuoBBYEWGz7bYak
         AilzqM2pYgGkwjAjLAX1/VQYRjcSaMqCwdm0KUyJmVU09Myit2/hzPDmkZyQtKxgyq7C
         8CFkXeYAn1NlQHEwo5iMnh95Ek9rJsa1+m+LQw1fMjNpyG/A/kPoqPM1ii+Y+j8afi95
         HMZubyDFHhOdu68ydu5nCdSZMK/X7DEixtDyI6ZUBVsuiCaQH54QHK7VvGh/R3qnHQen
         lAnf+UhCgZDLVOGqjeTmVFT9gYZTCm7DLy3HxV6shHKOMtv0l3zPyOMZzZF18kB/Wm+U
         dYbg==
X-Forwarded-Encrypted: i=1; AKwUvBxpZCDHN+bKG8EuSvm418+JD70Ggf3tW2efizf6vWCirQTi/xMjiSWQqIzCwkdRVxUML/eGgtwLcIGMpI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI85OVD/Co2FPA5oWHomDIv2KdRS031Niwmafv0UoWtZHZF/MqD
	1STH2zUbIW3Soxrfi3aSCDFZZBeOuGWx4a5N3ch2gRUvKs72M0+nINY/
X-Gm-Gg: AYBFou0jfnjz8uGcE+5rFDnrTOuMn4yeMit0jUZvjG7ZTAcTX3pbMzCKPWLqUbmwLbS
	H0OYN6kmePT13wwMvQOtDVVcnhMXuuqVu/RfKvT9oMpXJZLXn0nCiWKicAdcHJN0hE1DyW9Z3Oj
	K3Rx0+CPa3s1SjPzOvKzn358QRpqt9F51vaR3rkUZcCtDiQRJr7d6a//SP0UTKd+bPEO8HbeHSV
	BL/taKLLQ9ke7579aICNTKMUpTFbY+3hcwQuW1Wpk8p0LnHyHH3nafs07itEvHQR6DTJodQEMik
	8gdnAyG7mjPGvvc8xe7fV3ScS47iBGbGsJ5BANJownaPDRuc5wMG30Al/6+rWl4XXTI5uzuWADY
	oCOT7dJJFguzEtXuc4BD0UVJgk8GUL7LklDCQPnii4ycQRLrEpH26oMLCyKX4yoVR14pb7SNiqE
	F8G/L0RyvdyzvY8pdXUUx2LyuVGRuYcEiaT5Dx2PPa52rVVffOwVUGbDCFXuLi8i1qU7LPpK8sf
	ixwZqUSs46BfXDdZcGWdD6IwFqTeu3eMG23EDjbocDvbERLiXIHFmB/T342WWinCN9/wKkFZhhV
	RmNvbRGqgxZPQYALsMRrvg==
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr139504245e9.20.1791744765625;
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 0/3] clk: add support for Airoha AN7583 clock
Date: Sun, 11 Oct 2026 20:52:34 +0200
Message-ID: <20261011185238.52229-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 257 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 346 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0


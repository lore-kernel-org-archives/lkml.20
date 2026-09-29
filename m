Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CB4F93C5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677920; cv=none; b=GUJr5C4l6mMVvV2eywK6YXLcI4OBAOxQFaEi78IFZ93IMtFc04C6bQpc6iQK1/6X36bNIwYmMrsLKO+MHyLUuVpyvYXDDX3w4cGGDWpFMFVwNKGgO9mOer5qZze6Sjd7Z/5yvQsWQG1YOoTlzFa6DMONraG1L7Pidc8k4mnDBOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677920; c=relaxed/simple;
	bh=zMJUHsucbxjq4NjtcJvy7yWjMpFJmrb96fv6o4f/j6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZbfxp6EEWAUX4hdy97AFtDuIX/sRWoM089r7OAQ+szlNGDdQ+PpscZIG6HjfgpOe3GnW1Z30CMOjp2y1LktyJVymx/VBwrO6C4OL6lHOPVL1JrgOwk9UA43E5fyNtHFtpFfigyP1CL/t33ItxnULilONiwwGZfXCz2y1yyvvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHeTbbCk; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHeTbbCk"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b1a806664so522087a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677900; x=1791282700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=nHeTbbCk7nE6C9UwCA2oW59VzTyQKrTk1TvKYGIy6kHp6hMdTq0JhaiAZH2yTjISTx
         cARBBDool2R2xHs/zhNUzrQgbFsBLBDoF8YtBWlGN50pRwpU6Oe9Y1JIiLPdwi4y1pMk
         U0fy6bFMeH+1b8pJQwWy2gnTHGja3I0xyr594pX/NZw4wvw7u+kwuW0z9PqQNiScVn5Q
         7qo9BiC+vkse0fcgEToRQfrJ7dB6zL8oIGCyqGyM3cNk/wz2r4tX5ubnqpH73wdljluS
         RVeFrwxPEclvIS0uB4dEfgBbrtHj3FIFIcpdKlYd78ZYNFgpg8URUGSWfh6S3PQnXIud
         nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677900; x=1791282700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=ydbb1IlZCxQjaDxuRlDeqNy++jOFoZobryNdNetnTjy7zhjIh5r6f/24CfwTbUzyQM
         /mO3QxYm/ciEA4eXVdj8pX//Tlnu6YCRLb82anW7VTSpIBr1KBr4le00P8LKonNCAvnl
         7D2s85fTjhnhimNK1+zIs1c7Nt0m5oHaim/mGmitxjo4kPj0Rxo3USwA/0gIzgcnsN7D
         q9ZOXSyY7NpIMD/Bnr0HhuFlAx9Qde8cjFcdpZc1bVuDs9+s9KaYsW7vjY6i+eTmp2un
         1y4QXYcs616a6t05LSNFMiOVFgTiqI0TnQqtLZSl//o0dtpO6lXhA0kXCtgl6d7agyqe
         YKnA==
X-Forwarded-Encrypted: i=1; AKwUvBzJw8//Bq0wTxuwvrLGcNcEhwg/QJz9bOOQ7YlFFRuBon60RYs4ekyAHNkVJBESNRhmtfIMt2ZG858SRJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgsU6OwPVWThwpgd3KGF44WOoAC3KNpO4aqMG30jCX5QGlRwg9
	bYQHg90QgiMawY2JwwyGtcO1b3xf/R+dJUJsUPAP2N+HwStT9fpw56xe
X-Gm-Gg: AYBFou2gK44Fkp6PDiNisV1cPZJpJipLag6LynM3f30J6qDXX5C+7v75CBfHWIMRl1s
	/5p8ESMHv6Yx9eRhBedLMQjj+AXdkQTljj+Ig9iCkHJ6wvndo8eT85acFU6e6oWICAiQhTYemHz
	Lifm/2d7ZRL3F3t32hGfMb36Kck+3f2a0zVZM7rO0yWrW8ENCb4c6zJxFTfVsFCpM4TliU6k4Ia
	08lOpfWctHWDDo/tcoWzMwbPi0yNyVNT9Rr8dI+KtgQK8CwGVTyJyurchVpf5nE4ngS0sTAYQzK
	QMZvOX4ORejtFb744OqMsRSCC3yJ2j78/v+mAxZOQpqR3Iu5rClynBesWMYgRDMZscLIy1EFFLQ
	BheH8B0EwIth9lGxAhDhXrPg/uxZrzVPp0a0TuNgn9NJZwGL6NSJeOG+Ph9SYIqQ2KobGpfUxWz
	MRzp+tJVMw70CLaza7bOQPbdxZWZ2/nr2c6UwGc8Vre9nq6PxLoA0dRLfEWHMijUOTsIfVmHnZs
	CDH9h9O6dUS0w==
X-Received: by 2002:a17:90b:2547:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-3a0b263614cmr18497504a91.5.1790677899659;
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:25 +0800
Message-ID: <20260929103053.10241-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Acer Swift SFA14-11, a laptop based on the Qualcomm
X1E78100 SoC.

The following hardware has been tested and is working:

- NVMe SSD
- WiFi and Bluetooth (UART)
- USB-A ports
- USB-C port with DP alt mode
- eDP display with PWM backlight
- HDMI (via DP bridge)
- I2C HID keyboard and touchpad
- Audio: speakers, headphone jack, DP alt mode and HDMI
- GPU and video decoding
- Battery charging

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
branch: sfa14-11-next-20260925

-- 
2.47.3


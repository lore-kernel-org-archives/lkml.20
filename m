Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBFD4F4D06
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071524; cv=none; b=ai6aGKh4ACVIfDV/QIwM6/Vvd20DncXAUPiRgVVPE/aOtqnHSAl/koeM7eyU8/DSiFwvwcc8CBcB8tSGW933QXjaMr4Q3hh6Gql4Sq0HspJbfw/OcPiok0NLuUgBs6CZWjbo7UA6bC5HkwopdKri6v/i1Jny1+838Ab171MFYxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071524; c=relaxed/simple;
	bh=ZE7nqI7ReohaMIqdHQOYLxEmwtEvbS+hkW9GmiQfECg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQVhFp7kiZOOzj8eHHhu0dTz7/tnEbbF7o1qQ4I9fXkLPIFVmDZmJhFYfr2UjNy1n637T8KP0ROr3fz6qhObGWe2EzYpl/9NEJxxPslHmC4ZOQTU0CfezJURVv7Qv7FPiaKSj9YvzLkdK7ItTxePCil3VvEQmBbdarEdMugHodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iivziHVg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iivziHVg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso310062a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071522; x=1790676322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2+Rzsvc6cT42wPihpbCzyttfrFEcFhBrHOmp0V8ZiA=;
        b=iivziHVgD5IWTAO2MO+0qIwBtuJXWx7A6lzDVKNDFAZ33ork4p1ah4qYWwWuAeMUcr
         rVejHDOak9Wg34rDqPXBVjzIlq1pxwnzJh3mU0/d83E99R+Wyc8IQ72nSqWkwlIhESIT
         DlZDr8Fe5Fb4c80jS6HJ7VUj7/b3yKs+xmfWYvo3VzLE+NehbPGjeVY6Suw7HFv38JCE
         F8/CNjK/rRpwKo7SpAXo95QUuKll3tFCSdFaOfAjFgg5u1NGpH8sD3abxMYtXgx3Ki5p
         i7LCsxZZxofFxeWkiXPmTgu06iorOx4E4BgfvSUOMgmGP46TV2axwJ7LWFZNQVrNsvf3
         xRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071522; x=1790676322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2+Rzsvc6cT42wPihpbCzyttfrFEcFhBrHOmp0V8ZiA=;
        b=oIpY5xWs7ZFQ0ezQs0vLLoK4NkFFSbf/+dRvpt0U/ZGPDwszUNl9hPj2/HMzFvaRDh
         qmREQ+1rM05ueLSbISjzQeam9h7ZAPSyancUOEGHEYgOaiVuMu4orLs1s5QC0ymETDVv
         J8SEm4yIGQDhRAt+6+yAr0Zi5iEpCRsZIBkI/99vGUQHAiZsSYufZhi0z2vQI5F7pHoj
         aCdKEsyP9aaiZdTXamEv22DSqW4aUX8oTKB7kAjVyIFkJJEg1Dll/WkjM9nRzU+wHmzt
         dbeQ7NvIsQF5TIMfpoGdLzLXf/4385FQi02/jWoiP0fPk4e0N9BQ6V2Mr+oVCwQfo7HR
         l4rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPIrMwo2hGUpiM4V4NhcbNW90sSr56Z+3MEfzebdo8uxbccQo3SqLWS6E22F3BCUgVJYou1XMNXoqvkj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nT/dnLlvhFrdwWJqSSkwD/ewxvGwSvwRvPprZoDRRxzIq6lhgy
	qjWF55jXD104j+eD/C/KMM4olOwL02D17gJQ4lUccIpqy/E15rLTVT1N
X-Gm-Gg: AYBFou0Kbj5QkLiuQI2r4Aq1hP6vo39tdHVWei+8c9+lcf1JdHDbochAmWkTWlwLgcU
	JXka+9xr0MmHA9v0SVpIJUOfbsQRLhJnUCimFEY0pRePzAJzRemxJfbmJAUK3v/KI/dzixDCeoX
	tegmq5MwVZYACe93fZ3Lf7YEUirmN62T9Bj1mKqNEBlf4SSmmDA40Qku4bGYFgq2/ls5xdzstZH
	E61g+Gp4JTRZz9HfxgqNvUajU3nUxI5Emjo+q7/uZpXHiwNCD40NvC4gszhtnkZns17zHTBlL2T
	W/xJpNBRX6TYYcw/C3qs1bdS14gAjtqIFKI6vznDvRz/p8LvnG0yJuIfSK9bg4eoFVROQhau5DL
	wYohpvxfxh6XJEuPfDDZ5CglhrBUHDeq1wATh/icG7c1BqyJDdjVPJf83ONV8dBoQY47G5ISZWA
	B+w9uuFa0jY6Ut2HBYu9/uA58Z5notVL+6i/zIa9XWR94joMtXy7w93UC4tKRXHR+ek7VkdDBJq
	LpSjY/yC6SLS89jRKSbc9Cc
X-Received: by 2002:a17:90b:2ccb:b0:39e:fbf:e7b5 with SMTP id 98e67ed59e1d1-3a073394643mr1152114a91.6.1790071522133;
        Tue, 22 Sep 2026 03:05:22 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:20 -0700 (PDT)
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
Subject: [PATCH 0/3] Add support for Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:34 +0800
Message-ID: <20260922100501.8888-1-liujianfeng1994@gmail.com>
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

Note on the compatible string: There are two names:
- Swift SFA14-11[1]
- SFA14-11[2]
from the support site of acer.com, but the UEFI firmware reports the
Product Name as SFA14-11. The compatible string follows the firmware
("acer,sfa14-11"), while the model string uses "Acer Swift SFA14-11"
for readability.

[1] https://www.acer.com/au-en/support/product-support/Swift_SFA14-11
[2] https://www.acer.com/au-en/support/product-support/SFA14-11


Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1520 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1524 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
branch: sfa14-11-next-20260921

-- 
2.47.3


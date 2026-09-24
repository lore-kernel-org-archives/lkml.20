Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2E3F7873
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238812; cv=none; b=qb77ZENzIveh2JDUYacft0e4nq5Dqzte0VJF0azd00Jg4xaELNxige5m/MVsmKgFedNaXKRUczsHofqiNPhm94kqtsgITDIpE4XL8mvdB9iq1aFSG7OzgHErHSBSwNlf83fmJUSmqXCL/V9wPfBAn329DFwzKBMFoF2MQ/dzcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238812; c=relaxed/simple;
	bh=v280c1RxbyJ9BV/xpVpTa4hpsphXrn4DypoxkbjZ5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gdnnt0TMXoPMR8ZQ+yM1hkkyA7SRzUi07IYKOkR9w/wSlO5GH58O6LXVEUkpqGVr3+lgUnQ19ENi9KIzd61EKhwlTCkC9YZf8WfKlyXm/jeDaBd6KRKZkWe9Pz1i7C0oD0hzT8qwixU/AX4q5nerXfIhzhr/GzqY2gwMZatMc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf0vILEO; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf0vILEO"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4e4979c47so93012a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238810; x=1790843610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSk5us1+Cj8LsuotFx3JDoY747soUfy3AbLSDbj7948=;
        b=Mf0vILEOmMDE8bFVtRV1bu88oFnAnyGRXQkSHprr1qji+Kfsge9Fy6CPZLf45cA41x
         8++GXIKY/eL5FLytDg3QbTgmYuYesBv0oDE8Xj8mbt/vhtdvqTgqTTU/mXeSrNIEhDsk
         GrfI9LO6V/g4sE90JEGKdKxT39vqG36hNmbFg1/wtukXcZk62ZFSDQCtfkry8omzRMug
         892SuGqzMSOonKqO7YqqgtidDmZB699bqFMQNudpKmP4D4jYxWn9Cc8uDlMTI/5B0Npf
         hek6UMfVGQSRaq/nVggchN2yzBZv/HWYQrvxBjCFa+PTb6FEIbgTjme/YGaVgO/kH4d4
         nA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238810; x=1790843610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSk5us1+Cj8LsuotFx3JDoY747soUfy3AbLSDbj7948=;
        b=MZnYrVU7ak+HCrdUEyvj5e++0lmldgcuYe6loJb9QUq6aCYk+WvdyDQ4T68MyuBZ2Z
         6V1b2j+c4KVTGLSS74iDSn7APUvehMLkjvkdYClpWidyq+GRFdLmGTx7nUaHBVR5f+tS
         Ms2HKjRiIOL52dnmKEjYuWNl9hfyGGgr8cgLuFlPGD1LSpGcnDiAgXewszdJSfGnw9td
         3om0F2afohdyH0+s1YHsTVdGWwF6FhJzARPjb0oXwaHW5NqwTEGHhDluxxlHWEnWKDGZ
         KJJ7jTOpLBeQHBPmC9uZk5vHWpobdGILMzO1LGdzS+CWG87FwSqb4Zv9PpG2qJCCLM5N
         CqyA==
X-Forwarded-Encrypted: i=1; AKwUvBxF5gj9SioSGB5rYNPmrgDLwvYoIDll3656deUoUraVGR6AZLb20NaZTS2J7PrshsZYaX/HBzz55fgXXGw=@vger.kernel.org
X-Gm-Message-State: AFuF++nlD7CocWel12BYGfCKyWyMF/XO5P/eNHMD6TGaYJ9buxaAI6L7
	O4DQZYrIHgnZn25Gh8lHfdyU4wr51cqbbGUrRvh5mSKLXVN/fFpkcvow6ys63Q==
X-Gm-Gg: AYBFou1FSYRNEE+oqkEyAWdH0rulZGBmhWPTvDgUfa5MT9UY8XaJvhM7e1NlENrs8AU
	5Q7QMa92PQf6FIqonWSqRTt2Hap9+50WBuKyVUrwEIzJsOLMB87Hbc5USzfceFUtAj6PmHTln6J
	TMm3ARc8GWRkkF6J47KfuIufhUYvPy2KjAxKyCucMDmVr4feV/yjX6hRJBcd2OFPxV1X807Zt+X
	+/A1yS36BkCl8tJw3MvhcrrvpBCwXYjD4AiHyF6GQvkJX5YInTjMcOL5bqWErTZsgRfveUJyoLR
	5TqHzVKQ9ewcMlFtwqz7WUHloWWVLojLcbmTUq1jUHdaMOcJMhrPVTXr8DG/ZsRzwo2PDXwYPGa
	GQ+IaBM4VlE2qYtqXCI+7yc1KNKQfOJM0/URZeNr7eGbFrh2qOVyH8SVtsFSHltASRc2AwzC3QX
	dY4Qfur7kinys+jGL7cRFCKY++aW7lUo5Ls5UjLfHbv58dOxvr09BP+4XqWWwZYubo2+KZjHp7x
	kK8YfcNzCwphSFfNFOPD9xy
X-Received: by 2002:a17:903:19ec:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2df7da60bd3mr24906105ad.1.1790238810313;
        Thu, 24 Sep 2026 01:33:30 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:29 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:00 +0800
Message-ID: <20260924083321.33129-1-liujianfeng1994@gmail.com>
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
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
branch: sfa14-11-next-20260921

-- 
2.47.3


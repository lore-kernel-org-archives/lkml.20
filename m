Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF74AA007
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002207; cv=none; b=EQLs6dEj+BlFjTIBwqiKsMFMHD8/ayHQjzOX47xu7Ib3SlGdouafOi+kfu4JKn/jaKQzsUWjd5g/+UoD5HO0/TdXzINCAAsgWpUOG7y30DHF6wZ/hfE2v8BmGfr8YQuSdkMje/UDonbv5YDCqM+5bZbQ+g+jJt5iIAGMEJDqJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002207; c=relaxed/simple;
	bh=MvGGZL4IS4MjWjWviaHP6B+xBpIms7EWjzyjzTLCRMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+VdE2OIV9G+JAE+G6n2KJ6Sb35qK+cOdatNk5C+e3TRiLy7hmLPOb87LUEdu0KjSIyVkcctWqEaLAu4mC90hqtiGiwmC5gnVJUeVHcWxu9rUOcoCQ52ac60JNuyh902N00YkkaP+miPLSu3sifrzbAITVyx+pBFbuYhdxxWewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibFJkjo3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibFJkjo3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so15384405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002203; x=1790607003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8M61Qqjvm/dE/aUDfnFagoCXYMpIF6uiqbbGLV3Yg4M=;
        b=ibFJkjo3rloeFPr/uQSGRzTdb2rtT3XvdwBejgVrMVEFTSiQGps+NMJ5k7Zon/iFbS
         d/rWKBmD89UZ01QNl8I9qANU4bdCFHmRJzKV6Xjy0ZRKRgFTdwvY8IHXj3OP0DkpBnfY
         Tner00BDrTu+acah+vzm2mkvTkaFfAOiUH04wbnKznoiZT0GEFuWhuWhNUTTFxPHdDm4
         duHF4De1gF4H2w6iTG0U92fS4dizHTZXAKyROVpSKQUNLxlNq4JeuPObP3TvIoSDwJ3B
         8R0PqNZk1ZaaP4lJeYj0SSIv0LFHC2b6mm919ut1cg59Yrv+cuq4hAgK+25sST20VF6x
         Aojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002203; x=1790607003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8M61Qqjvm/dE/aUDfnFagoCXYMpIF6uiqbbGLV3Yg4M=;
        b=cpMiyXXkD2p2BTJ+3oQ7GhJjn7Zt1xP97s+XdgTjZ+a5PMMQ7zgXn3OVGZgG+wCTNM
         /Ya3xj2KTpbdDlvkEBEGzfIJrlPKtfxenYVH5aa0kWciw+t9MRu2zDDqjL9j0aCkd8HA
         UZhgXpEIWRk6cEwz/g7d7eOE9IptWTY1vgjSAf19GifI54Ff8somgteEobsPyWmxN21r
         Hp+TkD0GR1aNj4P/0mdFKOUeItQQS71k9pJd7363eowgGSNoWVdv6IU9b0houVKBoBiU
         K9RyWza/Za+//r9K9+yr+K1WgHRR56Ca0OntXIqxcTTlU7PPVIa6w5fhVrDpJlu/Apqg
         m9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBz66fAElH51SohtoGg2zAyTAgYuElO93odiU0jFO/HJm+JaHGlyDryBTzztFhX0Q3BYpgJ8OsGpJ9g70Uk=@vger.kernel.org
X-Gm-Message-State: AFuF++lDpLNtddc3h/lux9fIBNF5xKtXY6CjyjDR95A5oZixT5ObbCuK
	kqzUOO3OFz9qV25b37gxX/KorPfUpa+lgwPVS7WumGPL2WK+55Sej+9O
X-Gm-Gg: AYBFou3ecMaRibfDRiJ/IuzuWW8cKDi3TRzKXkK5wDm2v3l6MxSTziuOMGZUx++08aU
	Nbn8qeO3va7REMp25nA825a8cOjQATYeCH6lbJhp/E9I9ydOccCSZXCq7IoSNL2OCYFojwGUvyS
	4lGL0ISx0w1aZjko0Tj6ftZiarvs82fjuNkv6F6KTlrKFtgOGwatN6fOGrFH8tg2+M8H7B/qXsX
	r6XbAuI9N1ss7xlRrWVRisuHuO+m82zC7cdYAWLcpGS1WZbuAl3OP5tf7kZgye7De8/vJPIgMVU
	wl3vUlf3ri2aM/WPIi2uGA+UMMtLblCQqNn/asl9N5ZR1KP97KUmSkd8NjnBj4MYpeeHMzSSfon
	fo+aKy3Ub6uLJrxRIAttSMaAwan/vw9SMBk9VTful3RuPQnGq4FCQIZo9sTdBpmxTAs5PBp/+2z
	zVQnsKcjeuK9vwFL0DaP4U0dwCIxGPsktRre33ircNTTKdYzLC1D08eQSmMn73ODYBDK1x4ERWM
	fpUBmbtSaSbceXs+wm7
X-Received: by 2002:a05:600c:3107:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fc5669346mr157236555e9.6.1790002202748;
        Mon, 21 Sep 2026 07:50:02 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:02 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/3] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Mon, 21 Sep 2026 16:49:50 +0200
Message-ID: <20260921144953.15113-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver, patch 3 adds the
node to the board.

Why one driver
--------------

The automated review of v2 asked for the hwmon part to become an
auxiliary driver under drivers/hwmon/. The hwmon channels, the LED and
the input device all sit behind one command mailbox and one interrupt,
so the driver stays in one file, like huawei-gaokun-ec,
lenovo-thinkpad-t14s and qcom-hamoa-ec next to it. It is documented
under Documentation/ABI only.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v3:
- Add the board DT node as patch 3. It was posted on its own [1], and a
  node cannot be merged before its binding (Konrad).
- Add the "Why one driver" section above.
- Patch 2: name the driver after the module, and the i2c id after the
  compatible.
- Patch 2: spell out both SCUK bits the Fn-lock toggle moves instead of
  the 0xa0/0x5f masks.
- Patch 2: return -ENODATA for a thermistor reading of 0, as probe already
  treats 0 as "not fitted".
- Patch 2: ten tries for a cell-voltage sample instead of thirty.
- Patch 2: include what is used directly, devm_mutex_init(), comment the
  mutex, fix the address in MODULE_AUTHOR, say in the commit message that
  results cannot be matched to commands.
- Link to v2: https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

Changes in v2:
- Patch 2: drop #include <linux/mod_devicetable.h>; <linux/i2c.h> already
  provides both of_device_id (via linux/of.h) and i2c_device_id (via
  linux/device-id/i2c.h), and the header is on its way out.
  Reported-by: Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>
- Patch 2: add "depends on INPUT" to EC_LENOVO_YOGA_SLIM7X_GEN11; the driver
  registers an input device unconditionally, so a config with INPUT=n did
  not link.
- Patch 1: pick up Conor Dooley's Acked-by.
- Link to v1: https://lore.kernel.org/all/20260908091752.5508-1-okerixx@gmail.com/

[1] https://lore.kernel.org/all/20260914082950.9393-1-okerixx@gmail.com/

Oleg Keri (3):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
  arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec       |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml               |  56 ++
 MAINTAINERS                                        |   8 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    |  12 +-
 drivers/platform/arm64/Kconfig                     |  23 +
 drivers/platform/arm64/Makefile                    |   1 +
 .../platform/arm64/lenovo-yoga-slim7x-gen11-ec.c   | 653 +++++++++++++++++++++
 7 files changed, 772 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0

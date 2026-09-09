Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C034A689E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997706; cv=none; b=WL1GhYmsL+yx8IH8mAV7U/6WLD6JN1tpGWehFhhyWjfomzp4Ctwm0lpdqXQqx8H+hI4awyP9DWHjOXXy73UIMAIsxDCwED+UtmA75B90gKDjWzoMDQbSYqQlKzIPRTM/5gLADo7egR4v5h6zRp/MrInPvv1SNAbISqP1xMx/W+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997706; c=relaxed/simple;
	bh=j3nXkMsJdWKehS+eBrEBhVDV+Ebh7EVLigl6HYjdVE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azzdcxHJbJVd+AVnqrw8MtJzZGqrmC9pfqwPhON1p/5Bl7DEupg918pS9L7w5qnnv4Jw6hXVHfCCxaoyppVC6EnIlmHyPR8ea2BwYzKKxwiJlGm1myW6M79i8igSJhnRbAZNEDBaPah8tf1lmSrEtO1G+wuYZ6s0BW3VP8rXxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8u+YtJf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8u+YtJf"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so1207674e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997702; x=1789602502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThT5wu/no3JecMleRY6YhnuthYVTftRYEaBVTxj8kQc=;
        b=I8u+YtJfHEfdFVcvAi8iMZb+CsaYFlyZtEj3ND96sgBd+8B2ldUPTcPzNyrLAM7i9e
         JD11H3c8vvBn39sgidPnZ8eAdT01icuPsi+RPqeAQcq+yvxV+dp/84DWjW0Q3wGezQht
         ZkMqUFSW3xuhg4knXbxfclmzO0loKE05YQK8BJrg2Y1J2Um7MrC8emTzPI4v+igNO5OT
         XJEbPmKNPdyCLTuxUQrvd/kXxI2GyY0C6QxgkaBGYVcgMmAlo2onWWVPIcylHTIimU2z
         ZrwxYNXurThhms0PaQuxOkVyThKBGrqDpU/Lgncs37n2B2S5FsY2qIlsJPoIJzxGoOdE
         83gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997702; x=1789602502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ThT5wu/no3JecMleRY6YhnuthYVTftRYEaBVTxj8kQc=;
        b=QP3LJGKqcNyi8KZ+rX208yF/CRfelhS3olQ2VcDAqla+WrlgBEEqk7M5CTXr/ysPkK
         WeK+JrTBtw7NcA5N6qpx52RtUlYD/+AkyiGxNiFCBjNqaZ7k0xJoACAtMgbl/PB+st6N
         /TQ5fsQVldq3lpGVfBHAGZhwGamOsTfOQMNuCtM2Iw4U88Aros7SLcwF62s6RWo2fHga
         34nfFbipk3ZUbKLLKoPcujqGq6ogi5gYNIeUpdrwza7Sl8KalD8n5IKS5t0BvkKRO4hV
         f8ywkQRPWt0P/hFe/DhuG8pYh4isvAazu1bChlF5W9SJVDuZO+Q9plhU1uMsyYw6cteL
         cCGg==
X-Forwarded-Encrypted: i=1; AKwUvBziifaZo2ZrhPkco2/oyvBEQYfZjyB11MPnFyqYc3MIHvnEzNCaT1SbAwKkDPYJTPx0fCYUkvJ3vwNIANA=@vger.kernel.org
X-Gm-Message-State: AFuF++leskOtxheY/1nSOtDobgQquRrxJHEVU2cgUh99VOAawlc4/woi
	LDJsf8g572KrFVMIc268V8Lu1TfZXAMjtciy6zdJRjaZsUf2hG7jJjux
X-Gm-Gg: AYBFou3UQmY42PPEkmBj5fem8qlXA3J0Rit8R9fAQTyFEfQICEVZR7Xo7mpA+iwc7Nv
	sax9sgZBoR1rOhwAOskYyigQ2NLZHGJ9K365MP3U8xpH14Wldb7QPCyXL0tZXvFCOd6U454fg8Q
	OfO/iktRyckVxgHZR1LxJwJxLJKRbB5JxXRk+12SN/wcyqaqTfD67v6JzLk8LNaPgMgFngLiBf8
	dLVugm2lWg6s7a6/d9G4BKPAsg9EErSlOdKOM+9MltpbPukMVCQtM5k9bvAO+Sl2QYsA4ypiJa9
	DVPIr41LqZ4DRs2660EynKcLW9mE3fTMlDh55CaWDNm/NmXEMf7Nn8LKm5gmHmFOtCSecGbUwHw
	iWfNLuT4h2gegWxXWjxHpTawFBzR8b0xIetO3sYRCtkRSFhFJUg0TmExCtt0fYVFy1u+qtZ+lxI
	/f+G6H3UCZmnvn76Gad4jU6Eegn8NZfT3QPg2yDArrlKHoyjj48JmC91R9Z5GS95R8ujPyJY1g4
	Z4Dh0c5ZeM886wFPc8QQqCPmveCSC3bMaXOY0/PI/8XMXw/8bw=
X-Received: by 2002:a05:6512:3f0e:b0:5b5:e86f:3550 with SMTP id 2adb3069b0e04-5b616eed114mr6055767e87.9.1788997701538;
        Wed, 09 Sep 2026 16:48:21 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:20 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 0/3] bq27xxx: support interchangeable OnePlus 6/6T fuel gauges
Date: Thu, 10 Sep 2026 02:47:41 +0300
Message-ID: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnePlus 6 and OnePlus 6T battery packs may contain either a TI bq27411
or bq27541 fuel gauge. The DTS compatible used until now selects only
the bq27411 register map, while v2 proposed selecting bq27541 for every
device. Neither static choice supports both original and replacement
battery packs.

Add a generic ti,bq27xxx compatible and have the I2C driver issue the
DeviceType control command at probe time. It selects bq27411 for
DeviceType 0x0421 and bq27541 for 0x0541.

Tested on OnePlus 6T (fajita) with DeviceType 0x0541. After installing
the kernel and rebooting, the fuel gauge reported 4.360 V, 100% state
of charge, 27.8 C, and Full status.

Changes in v3:
- Replace the static bq27541 DTS change from v2 with runtime detection
  for both bq27411 and bq27541.
- Add the generic compatible to the binding and I2C driver.
- Split the change into binding, driver, and DTS patches.

Rinat Muhamedgaliev (3):
  dt-bindings: power: supply: bq27xxx: add generic compatible
  power: supply: bq27xxx: autodetect bq27411 and bq27541
  arm64: dts: qcom: sdm845-oneplus: use generic fuel gauge compatible

 .../bindings/power/supply/bq27xxx.yaml        |  1 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  4 +-
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  2 +-
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  2 +-
 drivers/power/supply/bq27xxx_battery_i2c.c    | 39 +++++++++++++++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.55.0

Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A973E92A9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303979; cv=none; b=Q3OYadfj9rzxsHaHI+/IJLYcNEWUvEHbOV36tjNOx0yedvNkpVIpPh6y/OuUhpZMtaiSg9ZkLrH5O6w7B7eh4QIWbXmhZt0h5E89mF0g/lLR0USFEs/x1Z8Dst63ZLKQy5vV5ZKBQv6/OYiMsHuBFH9xOT4bMreysczJXwYfO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303979; c=relaxed/simple;
	bh=YbaVITUhkeDqVIioLFWBfDjSJAJ93O9p9DZUGxcH+fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2FLVOoLDM2UmyyNmrRMZZliVFPwafYOQNbjgZKI2M03JPK4kzmxpvVyRiDwjQ4yDdv7guT5gqpP1MGmdM3xeCbm/qIc+Yh9e0DifvEAFQnbGn1j/dLvYTdI5dbzd/h34aZff5kdehermlLLPzs7bC5Eo+89HZ7mxeHFXs0WfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0nUGQqQ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0nUGQqQ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso804754e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789303976; x=1789908776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSiQ4yRWCAeWevHuomAHZI5T/21V8Jw+Qsr3Wu9T7ZY=;
        b=r0nUGQqQpzaxS0W+eDSPFL2q1dco1pvvrQOOoMCl7hl6ITQu1IeY5dmAZLwFiyJEPV
         mKg35vsLls276+W/Uugi0dRl7pF1fIOgrXu7OF0PWutGtYvnBE6K70WmHSybWEnzgDS5
         NcfmRbF/j+O0gdHDvAaRc8RIZT/NERmgr4w7SGEqaPm1FuKB9ZplqkpESWkU+IbIL5zJ
         BSJdGYo5kpMJQfDglosh6Sq+6NLBe10bCNr2GWwkqkmqG9+hqZyJt0uEsA90W8FcmTAm
         BSwx3L/cw93YEtx8LOlQv10UYtproufmBk7c7tKrZ/hxDLC3KDw08QwvJUmOnnlwy1HR
         Wamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789303976; x=1789908776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSiQ4yRWCAeWevHuomAHZI5T/21V8Jw+Qsr3Wu9T7ZY=;
        b=GzDNtILTuIT60c5wwn+ULRxyL3mf+GjekcgSJgrO+DmNfbM1Va98Q3SqwE3SZ88gTT
         4G5VIwF61AbygiLRqPUmgAorUdgZHp5C7oGnloQOsjItJmV29e+vrHJowIT28PXkU1wG
         WMVVZgYYiqiTQHCyb4d9UldWoocDHtBC+7JqycHr87nC1BJzOIwe/kRR0hO3uaMUvXbz
         +Qg3CnGXqxvG0g2m5loHYZ+stbSP2BLvdWTyySjT30AbRv+a0PJDZXBvTaXpIdjktjcE
         vzlGuDMklMoGiq3UFYd+xpJ92wlNgkMeIcgigekzSxT47WLwpFsmcrFPClVS3EDKuctS
         w+ew==
X-Forwarded-Encrypted: i=1; AKwUvByBAaXEuWhDjKiecNNRtc1Mbre8vKUi1IJOEtIgxpTDzaJuAIEiu6CKQXs5JiINpU9cYxEminLDyzhNSBo=@vger.kernel.org
X-Gm-Message-State: AFuF++kO7wyN/C9fsHP7APbxUj9iyxM1XKXfnPOhahy6IyTUgYVigZRz
	yfpDFYFoI0uvQyO+ncYle1BALTiFVgOO53V1p/XnRC0wy07dEMNaXfw=
X-Gm-Gg: AYBFou3A0YOrs65+RswJINGvuDUmZiw+4J5RgoLH7yDFVVtHpM6VIwhiR4hM7NFX+Fd
	1XLTkjmzlAN5EFDsKLi+70CvCM8CTwjETgulln++Dmlw7qLDJeotAHQSyQ05+UouYez9cPyektA
	x8mozbPDQO8Y7dO6g1Bsof9J9CDB5BpFQS1UBiBIVV3NBX1G/NpNFHWQi8LizoBozJs03o5Q5VK
	uy+3MLUh6sfdL1VXLR2RBsKB1xS6cSNrJAT6QDB6icMKL7LnIFTTSvxnRpCBpQ+beUSEbsoz72+
	JTlzzynhZtZnx2cVdyclc6GkfgypT2uOtZX5ygDSVo3bgrpl2+leoUggcr/JnlBkX45AJhRlFXy
	QnFP5fDjNU4EzIyhixafQKG4gTRCyfw0L7Re51NyPs0NghQIIRcLaBm0g2XQo0Bvlph2Mii+YDE
	Yg5bXo5mregTSBiB8T6hwMEQDrjvXG5+9WmV9v3wHuSp3CbUpi+CSjtX4Mj/1WnQ==
X-Received: by 2002:a05:6512:3a96:b0:5b7:a987:d03d with SMTP id 2adb3069b0e04-5b8a8ed15damr1361837e87.21.1789303975926;
        Sun, 13 Sep 2026 05:52:55 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0469a8esm1762844e87.50.2026.09.13.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:52:55 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 0/4] thermal/drivers/airoha: Fix AN7583 mux mapping and expose all sensors
Date: Sun, 13 Sep 2026 15:52:22 +0100
Message-ID: <20260913145226.34643-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN7583 support merged for 7.3-rc1 reads the wrong mux positions: the
mux field names are swapped, and v5 of the series swapped the call
arguments to match them. Patch 1 fixes the field definitions.

Patch 2 serialises mux selection and ADC sampling.

Patches 3 and 4 add one thermal sensor cell for AN7583 and a zone per
sensor. Device trees without cells keep reading the bandgap sensor.

Tested on a Nokia XG-040G-MF (AN7583) with this driver on a 6.18 kernel
in OpenWrt. Without the series the board powers off 2.6 s into boot.
With it the three zones match direct ADC reads, and concurrent readers
during CPU frequency changes gave no failed read and no shutdown. EN7581
was tested with equivalent changes on a Nokia XG-040G-MD. Build-tested
on arm64 with W=1; the binding passes dt_binding_check.

Vitaliy Sochnev (4):
  thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
  thermal/drivers/airoha: Serialise access to the shared ADC
  dt-bindings: arm: airoha: Allow one thermal sensor cell for AN7583
  thermal/drivers/airoha: Register a thermal zone per AN7583 sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |   5 +-
 drivers/thermal/airoha_thermal.c              | 159 ++++++++++++++----
 2 files changed, 128 insertions(+), 36 deletions(-)


base-commit: 5ad0af4f4367202b1bc71813052fe39b5116cdb9
-- 
2.55.0


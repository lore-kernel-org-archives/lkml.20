Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA58361DBA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031696; cv=none; b=gg8NAQGBuUYLMMKr0ODN8kaSjbjionHn/g5HGCMK+NSvqSoIx40SFT1zLzW5R7Gz8aBSASw8pbfi29d4YnJSHTPTHhSpulq4qgKQ4Ux/Bas2KiOgAGJgD2l0OlQcnjfXhRwOkQpUHdvjXk5U9QFEBGl7iFJB6281u4+q4SwH1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031696; c=relaxed/simple;
	bh=NRKScEnPh0zPdlf0AwpfifvXkF3txZwkPfUFOR044BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q157vLInCB75TrkH4KQpYCLI9I/a8DuYECJhd2Dh9PIABp8FRy+Z7rf3d/TLI8NGf+AcaGsAi3elgNRTgo2RWoNlZctCIWD0OyiMVCTbbzF9VLKVSkwsXRqrPlJMQXpPrkyDvMKIpv2qQf7MEgBqX6ArWQjAbbnBkHHWscfuL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbGJ+MYZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbGJ+MYZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e067e908so5304603f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031693; x=1789636493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4Bwx1DhVI6FUsnbRcI8yiZi82mxSdYhwi0jzDrPMfE=;
        b=pbGJ+MYZqSXeCbCxdZoTfArzHkOBPnHCD/Cogl5BL1zpbOKh1zAAz9C1IoXQFy3f5Z
         g4970VGjUkYlUEu7ItdnWUp5SmoZNzkBCd4IY24aygYPgJ/jzNsmWQXEj7aCyFajNg5G
         +wdLTeTgQshpQcoytCRt+LooPhAmoK90Ir5pHegLYYvANY/2pzbFFJOvG3eqQgwg3LXm
         /g+PMWgYlP5nFvkAQ97Qgllg5by+weJjGWNsUEP0GtuFf0aHVLYhK9XvqJrxAOEibBoC
         1JwMPl8HExV2OO1y83oE5WtfreuFaCrqlPz6C589wqnKlaqUqVfaLFkqfr7XKpbUiElM
         qnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031693; x=1789636493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4Bwx1DhVI6FUsnbRcI8yiZi82mxSdYhwi0jzDrPMfE=;
        b=plNDpoullh7XO6AIvZNHnwv4V+sb5WPEbMFCgC5P9E1QN2/N/OIQUUh5jS9bTnOcQL
         zPMk/dCDbuSPJOab7pPc+v5A8a3ymbeQHxOpoyc1aOuQZeGyTlp8NkNPCCY0C85noXC8
         MRYIyCR/jUoMr4Q3W7yr3dZF/KcRpx5JXJvFlXcMUyrLMaSqNddwOZt/uftcjQiMnFi2
         /I51zpkUC//OroC2MqmCw2KQkitjrf047rSnOwCsctf3oLXCptrMyHTlMbSELFN8ZA3b
         7LZ6wF3iUA5pZNu0IjLA84meycaQSQSQo2vhONbhcKSoKd5E3+Z2O8yqWtrJOp49yY/M
         j3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmUJvow5+zRugYM177ykxIFubfzCF4Cdj1DEapbEFan1uojFmVmkKHX6A9csYy8bAX9nJ2nrYOfS6ConA=@vger.kernel.org
X-Gm-Message-State: AFuF++l6s9y7EJNt72HJ3E3FZyY7hu4xW86fPoOq3SkqnW6iCpN+FEf1
	hUENLQToAI0U1FWoH14yL+8d2EqK7+VpXI0CrSJr6C4PK1IDeum6Jqqj
X-Gm-Gg: AYBFou1NXogkGl1B/mlE4Yrz2GCvS+8jgXM9SES3/u2vrm7Ls8zEBQlsc7RuUMZ5wUi
	YwKXALA1wdCCHcRM0yhltp+jl5zYgQCOKj8ttdR4bN2BkLV++dK8ZS/gNG9i6C3wa3IMrV5Tv79
	NgYiwO/y92NUoZeahhQprqT/DVWTvkcGKwiQXSnhxlTKbFu3rxWU45kfS4UM0S85l7/GQuXLUdN
	BvwWDD/doOiMYbAq+r0vcZQo5B3y77v3S6UTisITlTNGB5315m0Q32TOA8QKaWIa7VmrQiGMfe1
	oijhy344ub3Tl2f0UHJ3Flm6jb4HoAwL7craFXkmETRYjD2cj0KLh44+YXI7tLA/LhSfuCR5z7C
	BpucCHJquXnNivVf/QUAJ9mzRCRwEgOzoPK+Qx1qElmRxAH8CCIl+NkzlLQxq67wJ/+PpD+MvmX
	bJcI9iKjD5hu9+Hq0KHQMuPQYI94RLUxLgb0pVtvCu810+rGLkF8ZS6W6nxHLIGvfmwHUngS6xE
	DxzT3pBmoTivw==
X-Received: by 2002:a5d:5848:0:b0:486:e37d:c58d with SMTP id ffacd0b85a97d-486e37dc646mr2555494f8f.22.1789031692803;
        Thu, 10 Sep 2026 02:14:52 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm52065435f8f.30.2026.09.10.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:14:52 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH v2 0/2] Input: add Synaptics TouchComm I2C touchscreen driver and bindings
Date: Thu, 10 Sep 2026 16:14:03 +0700
Message-ID: <20260910091405.354058-1-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds devicetree schema bindings and an input touchscreen
driver for Synaptics TouchComm (TCM) generation-1 touchscreen controllers
connected over I2C, such as the Synaptics S3908 found in the OnePlus 9RT.

The S3908 and compatible generation-1 controllers boot autonomously into
application mode directly out of their embedded flash memory. The driver
implements communication using the Synaptics TouchComm packet protocol,
retrieving device identify information and handling reports through a
threaded interrupt handler.

Features supported:
 - Multi-touch reporting using the input_mt framework (Protocol B)
 - Dynamic touch report layouts and coordinate/pressure decoding
 - Standard touchscreen properties (axis swapping/inversion)
 - Low-power wakeup gestures (double-tap to wake)
 - System suspend / resume with deep sleep transition
 - Regulator and reset GPIO lifecycle management

Changes in v2:
 - Fixed continued-read chunking in syna_recv_message(): accurately track
   stream bytes including the trailing 0x5a padding byte, request full
   64-byte I2C chunks (up to 62 stream bytes), and ensure trailing padding
   is consumed and verified even for 60-byte aligned payloads.
 - Clamped active touch object count in syna_parse_touch_report() to
   ts->max_objects and guarded offset calculations against integer overflow
   and OOB access in syna_get_bits().
 - Made regulator power management idempotent with ts->powered flag to
   prevent unbalanced regulator disable warnings during teardown if
   hardware recovery fails; power down controller and propagate error code
   on recovery failure in syna_resume().
 - Removed touchscreen-size-x / touchscreen-size-y overrides from driver
   and DT binding example, relying on native resolution reported by
   controller firmware.
 - Documented mutex locking contract on syna_exec_command().
 - Added explanatory comments for ABS_MT_PRESSURE and TOUCH_MAJOR/MINOR
   default limits.
 - Sorted TOUCHSCREEN_SYNAPTICS_TCM_I2C alphabetically in Kconfig.
 - Fixed commit title casing and checkpatch warnings.

Vsevolod Nevorotov (2):
  dt-bindings: input: touchscreen: add Synaptics S3908 controller
  Input: synaptics_tcm_i2c - add Synaptics TouchComm I2C touchscreen
    driver

 .../input/touchscreen/syna,s3908.yaml         |   69 ++
 MAINTAINERS                                   |    7 +
 drivers/input/touchscreen/Kconfig             |   15 +
 drivers/input/touchscreen/Makefile            |    1 +
 drivers/input/touchscreen/synaptics_tcm_i2c.c | 1066 +++++++++++++++++
 5 files changed, 1158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml
 create mode 100644 drivers/input/touchscreen/synaptics_tcm_i2c.c

-- 
2.55.0


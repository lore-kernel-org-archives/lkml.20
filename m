Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4C48FF74
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588616; cv=none; b=HW2Fl6A2RUKh3A2uH8zh/eqghtKkMrUBVaucGv5aKfqkBkFBUyvbfjwme31TmTDX1ecwN7P9VsPjgqPOOQhPSQ8guALWb/PIZz7QxK1OVeJ4AJZIUManQmh2MI/SrP+hdQWwJ+k5oJbLvQy/jVwKQ9YNX6d1YejxQjnZyyQo3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588616; c=relaxed/simple;
	bh=1DSWDyEjxffgue1s2uWcGzCLbLWsu01OeWPHOjHFb6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cO037jLrewZ81kHw0kTjuBOraBofGZSyxotr2q41KZ/4zxLoig+ZMSi5gOzgnXmQ8pJ5hTkLYUP6r0WCz/KBvr6KuAG8kL1WK3R6GMsfyKUxz5RCxIQoK7GwXSEYpGHx3CV1K/+RNTJfjjRpo7e9ZL7RM+w8rV8ZQhS2dkeZo/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaGhXEF+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaGhXEF+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so9478605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588613; x=1791193413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8boaKuPNh+9zMsA4O1T+2Mud6gQfFTCKzvkdhPNfUgQ=;
        b=kaGhXEF+HoOtTJDQqgspGAyXe/0vH/rXIrV6TuNmYVL6b3w5gb7/6p5bqK4UcJy0nx
         vGqCAq23xlrVQt6Y0j3Fi3yftoZ2ekmyI8Gwi8Dd3RJjQGPBDXz2J3dvbW6GPRFZ1/bn
         G3+JVLRCGUHAxmaJpRTvvZ7ncbDaZu/Uk5AzVsaLTuOAh4eN4vM6j1BzJIuCwjG04ZyI
         Q+CYIvppQ2ZxEt0pZlN+oZhxCrivVSSiiLvKdPENC7/2sR/7cdEzZB6qz/xunX0jLZku
         mDCC8XZzXtiweIqTuoW0kbcrrDexS2/4338pMhLjHvZjqs0tC70YScDfHoVBEL8TqO98
         zCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588613; x=1791193413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8boaKuPNh+9zMsA4O1T+2Mud6gQfFTCKzvkdhPNfUgQ=;
        b=1lBC2FsM3mpwlZhuUvb5OCZ7ZRpoEhuFOvoCeXSITb69LcPsyGa+rvdcds/br7xgIu
         AoGimpXaytLhG8hZ32Ji7MYaCTmGuFAl6bMg6vtGfhiVW8NYVyKXHgoDMkLBN2YUdFAP
         JW/w3cn3lOGP28s3JNyOgJIsF6XN7A8QbeVL0BYK7U9tyuHtClTR3azq52aEIpnkxwlB
         LaSAI8X1sKij2WcJf/rjBeXXTtk5YXpuIxCiNO4COAtro1Cfn0G+bytB92BLm8W7Kgc2
         AfTSM9ggSQUliEY5vJSGV1tJvHHOkElFObY+gzYg3CBdqdeP/2YCK6njJm/SYG8SZV9/
         zaJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0gJt6gMFdTkoZI0mKfHfJ6ALidcvz9+wr2YKv+SOysMq65K6zBy5IDHg5RAnkc5uxkw1S91lN2dueANw=@vger.kernel.org
X-Gm-Message-State: AFuF++lhsT2rSl+MYNmGIH2lxGIUXaeKVxV+9pgEApxs+nFMAkCEcch3
	HDEgJV2XurxHyDedKqY7f4aWj1JWKSuaZo+4FH5DvbsUBtUrG6R+PUck
X-Gm-Gg: AYBFou1kgnX6FW+d3BI99LTcxPf5qD8dXlyEaAfW4zEAQ/0QoKSdwjA3cGNWMeow6zZ
	xXduNJle2mbqoDBc8Rd5JacenQTH+VrecmxpvMzq1Q6fWuwNAc5Q5BY58W8wRfkwEy1NC/7N172
	0adg1f1es+xfgBp0W+9c/qb3e+E+5XwQRnLroWgZa/oZNGESY3dGtOcywkoihrOxs1hpabQ09mj
	5DvErqmL1kbvpVf8AAS+NLfkH816rnyVy1XeYic9HjAj0jJYAjSEYUlSwomMPFNx/iODryfCzeA
	1ZbpvRXirZzU/YSliP55zEQsIuvGprN0GhcTxSU+FX8AWms3grnwIRfLVhK9J0IC1xl++Q4TrRq
	qj6u4aSsvDuhSW9Xw+qBG7z4AJnQsjYHucg7H83ySIv1aQjjxXsZEk2EnXGS4xSJDb5fSkVM88x
	+FdKx8teLfGYWHLK2KwmGxjIkEksfig9418b/AM5D2+Qnct+EOivyKbLuO5kzRLAQrj5P+SugTK
	VBrWVoSFCoEleFn9GQq/hJYbcUXd9qca1ufsv/GExR6
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr204178585e9.8.1790588612595;
        Mon, 28 Sep 2026 02:43:32 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:32 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v2 0/4] leds: flash: LM3643 dual LED flash driver
Date: Mon, 28 Sep 2026 10:42:33 +0100
Message-ID: <20260928094302.86966-1-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a flash LED driver for the Texas Instruments
LM3643. I wrote it to support the Windows Hello NIR illuminator on my
ThinkPad X9-15 Gen 1, which has a single LED connected to both current
sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
X1 Carbon Gen 14.

On both ThinkPad models the chip is described by ACPI but has no _DSD.
The original RFC asked how to supply the missing child nodes. This
series includes DMI-matched software nodes for both laptop models.

1/4 DT binding
2/4 driver
3/4 DMI match table and values for the X1 Carbon
4/4 DMI entry for the X9-15 Gen 1

Changes in v2:
- Rebased onto leds/for-leds-next
- dt-bindings: make flash-max-microamp, led-max-microamp and
  flash-max-timeout-us required
- driver: return device to standby state when the last output is
  switched off (squashed fix provided by Ruslan Koreev)
- New 3/4: DMI mechanism and entry for the X1 Carbon developed by
  Ruslan. Plus a minor update to provide a reg property for consistency
  with the DT bindings.
- New 4/4: DMI entry for the X9-15 Gen 1 and update struct names to be
  model-specific.

v1: https://lore.kernel.org/all/20260821083620.68324-1-rillian.grant@gmail.com/

Rillian Grant (3):
  dt-bindings: leds: Document TI LM3643 dual LED flash driver
  leds: flash: Add support for the TI LM3643 dual LED flash driver
  leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen
    1

Ruslan Koreev (1):
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 .../devicetree/bindings/leds/ti,lm3643.yaml   | 129 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/flash/Kconfig                    |  12 +
 drivers/leds/flash/Makefile                   |   1 +
 drivers/leds/flash/leds-lm3643.c              | 919 ++++++++++++++++++
 5 files changed, 1068 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml
 create mode 100644 drivers/leds/flash/leds-lm3643.c


base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
-- 
2.55.0


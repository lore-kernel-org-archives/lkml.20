Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966043E0C5F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938841; cv=none; b=iQrkJe2tYNkms2Y3/5uQblIOy2hKlJcfEWphPKHiFmuG7CJ6gjmPakE3XDF+M2phwkvZKTu5dmafvTh46R0QY5tf9oQA+U0w0hUaqHXDnTjaSY+7fR8FAlGy0RqmMtYobXMdLgMoQC253sDqwLab0d4AgOKSKdrsQA+0rS1RvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938841; c=relaxed/simple;
	bh=o2jGA+oz8FAHUUGJjII1o9Dpx+I2JLINT0FHkUiHcKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCrMEmxiFKvS8e5fradcCH8xZRQid1X4wmdaL56vIODju+nP3rWBwh2RaEg6WbHEP5bmiqvsipPZvyfLL5pjhvWKwibGWNlVo0Ryucun8lqhBgZEVS/DS754NXQNwJp/eCW9ZW35L95hBH55G52gkbBO+v/nxEkDbjn4whUJLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTFA5MuV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTFA5MuV"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1005418a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938840; x=1790543640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=cTFA5MuVrIwwUpiHun3AF0v7E6G2C4VNXJNI3vjaAVvOSFmFlLXloxJj6PxGGRqIYT
         CZp4KvTeuWSInVT1j+yAvm9853t05hBoamyjW4KEfRz66TrHy97odZygbJ6pqmfghoip
         mdnppQjZ9CHodLVZFF/MELEHV8Mtc55NP1uKYBWHvpw5nVkCEiFd8PbTFP5xgIicLqhp
         TdbiYmSbjqK2YOg4YGrbmf+hjICwn16ozpBdZIfoUp335Wz1h1l+LSQkn5x3RUF41Q+z
         F8WpI713bNTrTsSgvCVSc1a8CNLnTlkDAXrRvjJpAidCF8ZlQk1ckTdNh7ThXpElJDq0
         KsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938840; x=1790543640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=n3T0mU1wePA6qcxdqsZ4S4aeLJsHgdq+ycvzilDeyy8LJ2a3rsDbbjRCXBK8mBcS+O
         lQPcVZFE5XLOsOhVRSApBcLhx59Y1UargeKgH3DQaM01lZXFQvFEZcI0xgXIRpK9P/v4
         M/oVQweq81qQDAiidezUeNAGXvdM7rQl7rsMKszW5XcCE8Ounky2iHAAv4lW/VudS9B+
         y7VKzK8xtvVnXvPx2GILlZBBbr2pzeN6fJVv+fjR6Wf8TkHOpjlQ5j9Ay4Xi9cm/ogXN
         MGZkZ9tMrk5vhI7VL5ruweLoiLDXZPwJnQZ+g/xlLnCHI+BDGHiQ485kiftoHgRzJisk
         +FFA==
X-Forwarded-Encrypted: i=1; AKwUvByrI8K/39f6+Nv142seOzbVMrAU+BeRNxaiX8iLdlZqaKNqYDUzMK+I4IM8PUUiQ8rHvbBektJcncASfVo=@vger.kernel.org
X-Gm-Message-State: AFuF++l3BR66mmFR/8GJf1sVy2rE+a5VKU6Ee50j+//NzV4zMgMTLu9d
	3pXMvaXGibRsu/olmBKe+rwBUN0UrIDPE0hdtXijJuLHZcFXR2Nsaixv
X-Gm-Gg: AYBFou04b1mPTjDfMR7Xp4hWMnaVOiFpprwsmDUVZGXVnZ+iaKVx89tQ6ekIzj4+iFG
	s0zsWQgnduUtMfnLYPeohEBRXkzbsh+R3cvO3B/bnjhjif+N+ROyf8b/iMmyBcMb7qhVMPjAzXr
	NyO6h1sNrkOnShRxp3JUtUGJcIeztlPSks8AWt8Ktf+k/7gqaVYO6w+YtIhdMkFkmp/IuQ3SoBJ
	tLZLYfnK4y6KrqcCZ0BBaRx9oHJXpRWDzNQ4GtTsBCnef9XxsrZhf6ooC0PB3Z27ib0YQHWpntP
	bi2QKX1CIKkPzxP/6H46vfEp5vI7Rn8TFKazILjnPuh7BwWA2rcByH+07rZG14sGV/mBQg8KW45
	takOO/Dn2HpJqk1RqKJrqRl3Zxwdeo78XQcQ495nxyrX2eug8hhZjjNhfKW/BALsOmbk4yXeMaU
	DbFZehJoUAWq8Kcfb0ITdnAkcLHCYcEMHFgNb+UpcUyx8I/WzKY4ZE6la/CxIPuBnuHoAjTAsLz
	PlXnnXzxy2Hrr55b0Q0+8sJ8xVrpTQYaIoBAgQFLATw6EZXU9QK4ZP03uQdjRHKTRQzhgSHdyGw
	rblgYSQT+CwCrwLG6vffhH8uqRlViLAbqc4GKXY+WAuGqToJR9RnRKlKERY=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-39e6c68fec5mr4752048a91.38.1789938839949;
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/2] usb: bcma: control VBUS via a regulator
Date: Sun, 20 Sep 2026 14:13:54 -0700
Message-ID: <20260920211356.186967-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

Rosen Penev (2):
  usb: bcma: control VBUS via a regulator instead of a GPIO
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 14 +++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 25 ++++++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 25 ++++++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 14 +++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 +++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 14 +++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 14 +++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 14 +++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 14 +++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 26 ++++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 16 ++++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 16 ++++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 26 ++++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 14 +++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 26 ++++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 26 ++++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 14 +++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 14 +++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 14 +++++-
 drivers/usb/host/bcma-hcd.c                   | 45 +++++++++++++------
 26 files changed, 422 insertions(+), 47 deletions(-)

-- 
2.55.0


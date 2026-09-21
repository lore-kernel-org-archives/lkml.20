Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C23B14DE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026898; cv=none; b=ADltMdfFZTvpMa0jtCJtPo4vUbJmfAQ5TD5V61QAKKC7R+fvcmUd46CytsnKz3n/rf00cox+yR0Da4qtU7ZwjnEJTbEg5w7J8bDmPB0476SvcCPUKel49D3HU7RI1nrWevUwUR6h6iA2kkZsY+XEIikEyz3UsklnEcTnf1HaZRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026898; c=relaxed/simple;
	bh=/RJPQUzo8Go/WWZI8LnS462v+isCtH4+yN5e8p2n4sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaX2irziAcIabQrjIX121eEr01vjWj/0QX7OrgWW/GYcTdH3KireiC8UQLv5GgLny+/NUp/9US9zTvKwDZeWrFkQXQRJ8r4iqEiRosrCQYXpseIijpEMYsL8bOOkYMHJkjUR1ZMjWaQ/tJX6LVx/IvBRmR9N0yUjuzZu3sTpGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbdOfm6B; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbdOfm6B"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso2289919a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026897; x=1790631697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=LbdOfm6BhozfuWm+UtGi2XXXTHalXtTTRHOscznmNY9hIgTJ4miOGf/I5JRYlXoalm
         LL+sEbA6+fONxp8NThITKhqk1q8tyjJ8z23BWKzS57xiJDSgsUgwQmJc6LtpUUsJUwc9
         VlbOYqpibrzVIRG4PDUl29t6uHswV5AGf/79WSgpKgByHVBGpUe1iHNrrK7MzT06WnTY
         iIYXuwPUcdtqhATIQfpkOLVotz4hig/L61rBnrlUb1rEkc4Zh1b1L3bEyOthCJyag779
         R4g7r3iSbnDxWLysuVpLtlYTUC4h/u8VW1DSBcneTWqa7mdZKqv8J61e3XKDxgcCUGtu
         aRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026897; x=1790631697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=u32WgAewv/8tpVU6K88ro6chWnGpnPhxW2d+rj5TQSFjMlXpI6MVsaNhn2wfvcJhwK
         waw3YgV0ZxnZ7zfZEla9M9Mq4/JoryBWz7VXysFjTru0oIG7iIXuVlCrCSgnkzOg1Qzh
         ZKcvaYo9qxywBto4TtoxSika4uk9dI3nGF/mGV+FPdeQxWoh5u9mALLLopukVlyYqcRk
         g5NrXt7WPL5Jmdl3+4TJsPmL9YtLBzHbZVf+z6UJ+0Vglj9lhbWfeXwFzFDS3utA3jj2
         ZiTBTfU6NKoYUZ6kJ3o58JNxykR7ti4pR07aCTx1xRu99Bx7EdlGAMfilSLi0jq2cTNi
         DcCA==
X-Forwarded-Encrypted: i=1; AKwUvBwG1S01LJStmQfZkt/aEaKCnTiekUVdR8p46b+cExPsxIq+rvbzvCcyy/+8lauNV8hWuvPNGG7XYeW4rMY=@vger.kernel.org
X-Gm-Message-State: AFuF++mP7TxVPiy2GQFsCoKmAxvAxPrLdR5Ylvkileom22S92pGLmXHT
	E+vuJC5LQvpvNDFti8KPQnvMsHNjfbsrTF1AguKb8KkWFw5redmlJEFC
X-Gm-Gg: AYBFou3JM1MBXVFEraUU6NThHRteM15PGIqi298+ibPegJCe2iXAOU4U2JJyhRr69I+
	Zxq1OuZiH1FN3JxM+FExfYeaK24b3YMqGDSvwhoXby82GdkXJH2Ia91YkRn0ky/ZKnW6pecIo1M
	663rkUico01LjCJV1YeWjdTsmgiy4Zd6eOH9T2JAObjZFKXAFokUN2xKalWJPkPuMWnj1+xeC4c
	rUfmtQELmpmqZtqnyY2Rx2BGyEXAQtzjytLavKf7ZSayHZHgryJTZsl4Yi4jidrtqb4fh09rTVL
	PmGM2de+/f43uygy28YYvHnRMURa5MNCL5bay1OfHt3SCXMZBcDCRfcHdMzX+4U+s6P2K5NYxXy
	Ns/iToXFmD80FpqLNibwKMXGE7jbJBd8Cmh154G996VoeHzUES17h8mtR7DwIzgfK4DQR+y0IsV
	V84yepnR4TgjH6H5cKp/QHv9E8ZJptjx4cua7fW8fysV8RGl11oGngcZ5ET668qBoqhxZU+aGzr
	cnUOutc8g2A5mJZ1G20RLoow428mpsv4CPjc7ZSUfZkkn1hrq9PJgR0hmPOi64L/1tfVTNuW+Pj
	cBFcmDqJEXhQJoro75pYYifHWYBsmWPc4rkhxJAULjsoXshohw==
X-Received: by 2002:a17:90b:56c5:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-39e54dc1a3emr17982461a91.33.1790026896931;
        Mon, 21 Sep 2026 14:41:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:35 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 0/2] usb: bcma: control VBUS via a regulator
Date: Mon, 21 Sep 2026 14:41:31 -0700
Message-ID: <20260921214133.16519-1-rosenp@gmail.com>
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

v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 ++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 ++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 ++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 ++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 ++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 ++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 ++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 ++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 ++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 ++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 ++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 ++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 ++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 ++++-
 drivers/usb/host/bcma-hcd.c                   | 54 +++++++++++++++----
 26 files changed, 384 insertions(+), 45 deletions(-)

-- 
2.55.0


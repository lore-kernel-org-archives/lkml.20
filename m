Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEF472076
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323388; cv=none; b=Zgvtf1fJT3JWQy3x8pVWMCMLAbA8UbKnpcokgRlyqrl8XIhd3RXmX8vLpiZbl1t2zBBIx+PYpJr5wyli+vggBLnQX5ddjlo7pl8t286p/DRdDTBlFkon3n1RiPEK5TQd7M7mP0Qh5TZnKkOfRDVw+kH13+5o5NIT+stLAMaJWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323388; c=relaxed/simple;
	bh=8IF6z+YkTpvsCKmT/hFF80C11KUezqy6SDi0dife2Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FbZ5AdEd9TGvPBjU7zgQ+9wC1gI5uM+j8rEZ3DzfL1Bl2+O8hnVrMkGhg9vztUevIoZvwZ6fO0JrTIQp/+6so7J4sEX5ZF+htespne5+0AfFLeGinb/0nMDd2VeH9WYLcxZIQVz6wr3v/edRqyVKSL1k0y4GuAsPsOFukbMKYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=G+WmFf8k; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="G+WmFf8k"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so93432666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323384; x=1790928184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=G+WmFf8kDdp4s7SBZ4deWR1hqIED5qjg5vCU5pvMtsoYOOVFncIsrWpqIlER+KHXLu
         nSp1JfHLzbwcqDKP8atHAA0gxDY7MGFx5t93v4fJgz9F2tGKntqbkp7kFNT9cE9cdA7v
         bjlPvUSsRP95xISgoXenHWayr4rPGDhsP9YW9hNn58swGQ+aeuHxWVqm7pKRtaVtfm8+
         O44ZI9XbwnKtoB8xxylZZ1UTVIiUMPQqmOSLgeaaf6JpWxm/HIEvqVsivYq0uxOYKKSg
         E23t9rQYtD9EEXf+DkSzmWDav77Tt2s3mDZ7GR/WQy0midE998x3oZmmfkePPlN6l2Qc
         QyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323384; x=1790928184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=FfjJ+X+ruXBcgAyUCc6xr1Hd9/BbkXYEahyKMsCgifsM122OJK9LCKjDOWwT/CUBOw
         pEcUuZSp2Hh/m7ZoFvSzkelkUHl1bhHHtnRAVCAD/VA2xcdpVWkm9AEClLNSONz/gyTQ
         cXZr5cWbrat8/2d1CW4q+QE8/VXkZh7iXyyPuxMesImwAeiavIcDPTdcQ1LVuqMlKAUw
         xopHKjOsZ2OpClMj4izieDJg5lWkC9SHMJv8RfGfhTvOyAXHJW7XGQ8Ueyn62tfn4X0o
         jeZAHp/dSI8ahik+MQXUU+FLYrhgX5k96hslvFZTVN6U9sbbkxPhrDDRL1GxK4B2CoSy
         uSAA==
X-Forwarded-Encrypted: i=1; AKwUvByUg5YYDfgvdEeoz3PT16DzfDhz3AlLyXQYu3DbaQCWbxa84uSqs9P+/5RnT3qO/RJ+WsCm78lIYhNMSV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lE+FLSH3FIasRBGVQLqOdVH89YC8h8c0RDWWWUkHOcpPOnNBgQ
	l727fDBDclds0JaqdQdKSsAFOHAE5FnMkVZeDtQXWI08dXYioK1M+/M/g+6mf17Jw7c=
X-Gm-Gg: AYBFou1C061YifTSPRZe0333+46JyE91VKaYb76+gJRkfPjhHurc3PNQAOEUbVcxaEJ
	vgjxCk37SktwKuOJi4q4XABlaKH4xXawd7t74bmnykmgqop+8CtYvsP9cL5trD/+5E5UH9fA91i
	TOk/xGbj+kpQBxohYY+FzEFxeUYJqMaD4eAWh+p8/Q104yvKtlYor+cbfwgyW6AEv2eCadAlQdU
	xiB0in421QeDpATAU11f56stn7+VKulV7RhNXzcmEUvXS5kHwV4mVKrKsQU7olrzLzgvanlE4Ld
	52TSy0YdcOUCXneaBnbDyrKEjmzoJg7Zp6ryeyHhQv2eRxjpQnniAmRMQMw5ALHhfAWhQIoA7al
	79FS5rQBabx+Y0oshr06MwOSUiWVAhd2yuq+yHvrrSw+0zCSUBTHin2xIVtzI4LuD/yrC308apA
	yevegbEXYg5eZ+fr3jcETw0/fqOBZJO5eUb5t1ut+0gE68Ye71DjpE/SqowowFgOlPVN2211+iU
	fvf8IZEv4dIETI3GLX0UzIyfah/a7DhFkOnv5DmywmfG46qWW+uOm7AZQ==
X-Received: by 2002:a17:907:6c17:b0:c29:f5d5:5a9d with SMTP id a640c23a62f3a-c2ac246608emr448681066b.39.1790323383296;
        Fri, 25 Sep 2026 01:03:03 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:02 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add PWM fan and WWAN overlay for Radxa ROCK 3B 
Date: Fri, 25 Sep 2026 10:02:56 +0200
Message-ID: <20260925080258.46489-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa ROCK 3B has a 2-pin fan header and an M.2 B-key slot
intended for 4G/5G modules, neither of which is currently described
in the mainline device tree.

Patch 1 adds the PWM fan and ties it to the CPU thermal zone. Patch 2
adds a device tree overlay for the B-key slot, enabling the USB 2.0
host controller serving the slot as well as its power, RESET# and
W_DISABLE1# controls.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Changes in v2:
- Move the USB host1 enablement and the WWAN slot handling into a new
  rk3568-rock-3b-wwan.dtso overlay, as the slot is not always
  populated (Jonas)
- Drop phy-supply from usb2phy1_host, as the M.2 slot has no VBUS
- Put the fan patch first, as it no longer depends on the others

v1: https://lore.kernel.org/linux-rockchip/20260924071445.441822-1-adam@wermuth.pl/

Adam Wermuth (2):
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
  arm64: dts: rockchip: Add WWAN overlay for Radxa ROCK 3B

 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3568-rock-3b-wwan.dtso     | 65 +++++++++++++++++++
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0


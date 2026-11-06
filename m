Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938295;
	b=JLrvGdTjHyr+EqR945KHZJ34HhAjjyPmQ68TBVxH8Q4fdLf4ghR4Bx23JuZZ9GUr+IqZ
	 fdnGzCxy0uQo/IdOXxikrDB/2ESvQPdtZA5ihJjl0cHpxTNXX5rHk00bgCK3ptq7JqSgs
	 PVwjLQ3ltV7dKryf/J0o/2Gw5pBQP2jm/o62CNbH3bhxRM2GWrTuvn/vujtw6Cm1/V0py
	 72h/v+BINeF0szJnXk9EQDzXbHEbzgjWpLA2t9Gkst1PlR1u/81IGujEu5reTYRro6mj0
	 jaiVxdtoAbxFT5ROHVv77adncrdQ6D5I6nQJcskUillAW28a36p2VcveMPBTsAPyj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938295;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fbk6DkOtVNpfer0G5WmCzh3Nahh3tZmIvlpCq/JTH2g=;
	b=Hz0ZRWA7pMGXxLU9OSKkReYWYyx6z/oeG1feEJwWJlHRZDvksMojUu60O3YtOH8Lhzea
	 ZFCuzEc2cmwb4dVzvFuw/F8Pzb5dhXA3upzkGzJxWO9o9rxVi3sc5Ms4yyO1x7oZt3Itd
	 TId0WWJ3joq3Ps2J6weYUB9jRZPy8F+guLW+nRG1SuXTFpnQjw2T8yeQIFhVyFr3BHGXd
	 E4FDOSV23vqc7bMQ3we0m74EoQPEkxHog4R4DhA/Wn5cKdwI/YDKRiiITv1KAQqo3/3ju
	 m5POEHH9z6CEwBawDwxxMMifWrNF+SQ3DkjypjSviKoc8/p2IuRR02MY2gN9Ac/JibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=aX4taz+s;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC46606A332;
	Fri,  6 Nov 2026 04:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC46606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=aX4taz+s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793938291; x=1794197491;
	bh=fbk6DkOtVNpfer0G5WmCzh3Nahh3tZmIvlpCq/JTH2g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aX4taz+sONttMq3YY12Pv7DNDVm+tCS0imydR+EWKGAgsy4ek9xQf2EfyOeY7CpHQ
	 1+IIAq8pjzGWweiHiWx62WmCRLzUBqGXQJmlijof4rVhCGORTg1+dGw5AeWCdBDMAi
	 MJz9CQ8LYd/vTC54j5cKZqKphgB0jGmGrmFZyPm1q8kanQmgX1Zv9EjFhIb2az2+RL
	 Ohm80ZnJpTZt84dTNBDvcuRdS0VDx60zbhy2PKTTYjFliQaOLJC04N9rzb3+6NV+SB
	 W5ewkOhMf64tpzd1b5AE1XZgjwI9ii3e29NRgXSLUHg1edrqgcFhO7iwoJfGICzctp
	 GyNdS09EAeGeQ==
Date: Fri, 06 Nov 2026 04:11:24 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20261106041116.78937-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: fdbb2db56b7eae1a3baa03bdf685700f05536a2e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
for Business (Intel Lunar Lake, IPU7), ACPI device SONY0681. Without a
driver the camera does not appear at all.

  1/3  dt-bindings: media: Add Sony IMX681        (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver  (Andre's, co-developed)
  3/3  media: ipu-bridge: Add Sony IMX681         (mine)

The driver is Andre's, reverse-engineered from I2C traces taken under
Windows.

Changes in v9
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Rebased on v7.4-rc1, where v8 no longer applied: imx576 went in next to
2/3's Makefile line. No functional change; imx681.c is byte for byte v8's.
- 2/3: the Makefile line follows imx678.
- 3/3: the bridge entry follows the IMX471 ones, in the table's order
  there. This also keeps it apart from the VD55G0 entry in [1], so the
  two series apply in either order.

All tags are kept. On v7.4-rc1, 2/3 and 3/3 build with W=3D1 and sparse
clean, alone and together with [1]; the tests below are v8's.

While this sensor streams, IPU7's CSI-2 receiver logs "Received packet is
too long" once per frame, and the frames are complete. Andre sees the same
with his downstream driver, so it does not come from this series.

Tested with v8 on the Surface Pro 11 for Business, on media next
2dcdfb625c3 with KASAN and lockdep:
- the clock is INT3472:02-clk at 19.2 MHz, with the sensor as consumer;
- v4l2-compliance 46 of 46, no warnings;
- 3844x2640 at 30.01 fps;
- the four flip states give the four Bayer orders, and EBUSY while
  streaming;
- runtime suspend after streaming, and capture after unbind and bind;
- no KASAN or lockdep report from the driver;
- W=3D1 and sparse clean, dt_binding_check clean.

[1] https://lore.kernel.org/all/20261103103235.94397-1-lsa.uz@pm.me/
v8: https://lore.kernel.org/all/20261002082537.74084-1-lsa.uz@pm.me/

Andre Gilerson (1):
  media: i2c: Add Sony IMX681 sensor driver

Sergey Lebedev (2):
  dt-bindings: media: Add Sony IMX681
  media: ipu-bridge: Add Sony IMX681

 .../bindings/media/i2c/sony,imx681.yaml       |  108 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx681.c                    | 1032 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 6 files changed, 1161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.54.0



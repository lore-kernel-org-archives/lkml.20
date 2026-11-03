Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701973;
	b=21Ds7zbpagzK58evWU6Q8M7t3wVYW3QXFnq5BLtoNrIThqG0NBBBZCGxMdz50zbgPnrV
	 M+jOg+gAUQm0r9OeYE/cSxIVXOyTd/zH1sCDaaGGK+HUMUzVeFCuFNduLQ6Z2arDC+JEW
	 ZDPUqxOa4/JRmexWQIxrEwqyNHzx372dxim7uMQtNsFRl/+zcBfY7Uv7Z49KC6talLGf2
	 0gI9sufrejODKM7O3zmZc1Zi6OqhLCQ/9pxmI51IchFcfIqd3KCtULGWCoUXx+mMC7Qaa
	 wBXJhJaXaBz0pwvHmsvp4/8gx6ma5SH4SK9mukLRrxlHDXrBJ2Xc9s6PPQ8tWL6jbrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701973;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l+qzHo5wRksBt7nGrTMUCyKL4/4CA96XgjMlVATDMkg=;
	b=OdXHRPPRWQN6FpW2z5vDSRrzDqXCVPtrc/TtSPp4wpzt9kN6Xd9r3jIFYndSmttgrJ2l
	 sY02Uf2QKx13JE4gKjoWRNMhFJ8q4XgkL4HwvHk7kg51xum92XyKLOy/yPHzXuCP1PiaP
	 bgeWi+dUUgfBpmBdU9zk+OtdBO4Zn0+g+Yu+OPcykOYaivMVdQxsVXC3nw90354Md3Aih
	 AXZ1390DRsJWCXBim1aDS+fPGrZ6zNyk9BN4TQ48j+2yw8vyysuLK42a+mA6er+v8r7YJ
	 GBz1ZI/d/nFWqdHVJ+rC9bt3zZHicvF2d0ayjbm4jfavUbCgdug2L0Fnei2k4vXDG5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4D606D804
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD4D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793701969; x=1793961169;
	bh=l+qzHo5wRksBt7nGrTMUCyKL4/4CA96XgjMlVATDMkg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YloxspSTIm37TD7mO4qlavAiCfvwduTfF2yKy81dPCoTDLNxIzHOW7FK76Q0Dq+R+
	 FItmg3wJN1IzDXDBwiV/+7mziJ0Pv4ph83aKDBrq5/t2c+CvOxBFbbmTYoW2Qjs6Hn
	 Iw6gZtvV1guEYDiFGmg87rP0qRZJzGywxf4qjUod0eiWmv76tZUE4Sw6Ka+wGijnbf
	 EDQ9l/KIxpXf5ZsgYV6HLxN7AoEQcfGDEc/ZF9jUSW26eJvdhevAqAC+0eTiV54rRm
	 FXDvKTwwopluKwvftiT03F5vWjbq+2rh/D4DnMv5oxAVxNw3xKb4tg8AIw6Hoy8Po6
	 v/cSP0Fhwl9Ag==
Date: Tue, 03 Nov 2026 10:32:42 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261103103235.94397-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: e6facd6fc030380132ad81c97d2f9ab9c4c7d10c
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

The ST VD55G0 is a 644x604 monochrome global shutter sensor. It is the
infrared camera of the Microsoft Surface Pro 11 for Business with Intel
(Lunar Lake, IPU7) and of the Surface Pro 9 (Alder Lake, IPU6), ACPI
device SMO55F0. Without a driver the camera does not appear at all.

  1/4  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  2/4  media: i2c: Add ST VD55G0 global shutter sensor driver
  3/4  media: ipu-bridge: Add ST VD55G0
  4/4  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

The driver is a port of ST's own downstream driver, firmware patch
included, as vd55g1 carries its own:
https://github.com/STMicroelectronics/vd55g0-linux-driver
Benjamin reviewed it off-list before v1; 2/4 carries his
Co-developed-by, and its clock tree is based on his.

Changes since v1:
- 1/4: the VD55G0 joins st,vd55g1.yaml instead of a file of its own,
  with its 375 MHz link-frequency minimum in an if/then, as Krzysztof
  pointed to. Benjamin's Co-developed-by went with the separate file.
- 2/4: no code change; MAINTAINERS no longer lists a binding for it.
- 4/4: the st,leds name and GPIO numbers now live in the bridge's own
  structs, as the software nodes outlive the module (Fernando). With
  v1, unloading ipu-bridge and rebinding the sensor froze the machine.
  Adds the Surface Pro 9, which strobes from the same GPIO (Fernando).
- Rebased on v7.4-rc1.

On both machines the sensor needs Hao Yao's int3472 fix: the SSDB asks
for 24 MHz, but INT3472 enables the clock at 19.2 MHz, so without it the
sensor runs at four fifths of every rate this series computes:
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
Its v2 fixes the Surface Pro 11. On the Alder Lake Surface Pro 9 the
_DSM takes 0 for 24 MHz rather than 3, as Fernando measured, so its v3
has to choose the value per platform.

On IPU6, frames come out corrupted unless a CPU latency bound is held
while streaming; that is the ISYS, not this sensor (Fernando, on v1).

v1: https://lore.kernel.org/all/20261019162722.25587-1-lsa.uz@pm.me/

Tested on the Surface Pro 11 for Business, on v7.4-rc1 with Hao Yao's
int3472 v2, D. Manresa's ipu-bridge 1/2 for the unload test, KASAN with
KASAN_VMALLOC, and lockdep, IPU7 run by the ipu6 driver:
- probe defers until ipu-bridge has made the endpoint, then binds;
- every mode runs at 59.14 fps, as the controls give, in Y8 and Y10 at
  all four sizes and in Y10 packed at full size;
- under auto exposure, exposure and the gains read back what the sensor
  applies, and carry over to manual mode;
- the illuminator through led_mode;
- v4l2-compliance 46 of 46, and 54 of 54 through the media device,
  with two warnings for the read-only crop;
- unloading the IPU stack and ipu-bridge, then unbinding and binding the
  sensor, is clean; with v1 it froze the machine;
- no KASAN, lockdep or Oops report; the only WARNING is the ipu6
  driver's lockdep_assert_held() at each stream start, as with v1;
- W=3D1 and sparse clean; dt_binding_check clean, and it refuses a VD55G0
  example at 125 MHz.
The Surface Pro 9 entry is not tested here.

Sergey Lebedev (4):
  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  media: i2c: Add ST VD55G0 global shutter sensor driver
  media: ipu-bridge: Add ST VD55G0
  media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator

 .../bindings/media/i2c/st,vd55g1.yaml         |   27 +-
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd55g0.c                    | 2434 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   70 +-
 include/media/ipu-bridge.h                    |    6 +-
 7 files changed, 2551 insertions(+), 7 deletions(-)
 create mode 100644 drivers/media/i2c/vd55g0.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.54.0



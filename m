Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427260;
	b=D4AnZZdQHTMhKzhl/pSqCAbXKD5xoco8bt9z+ruwLalJX0LzMzgzeoNmzsUWp3vqE5no
	 pDwk35tx+/bys1zwb3PKucTJKvcPX3W6t3pyG/+9RgRbWp9ycIPLMMtLO8Ace75CbmSYt
	 M+mAcvu1xqufFgUL/z1YkUc+wxJDp8CMufCLiPJ3bNQwC/jkiutpbaLA+fYQ549DXrAC5
	 g2/ttVz+HCw8E3Iry6TdcAMlZz3BMr+AyYtANf4P3F//KjntOLQz3zHlvJI39gahe+YB6
	 /S0E2BgviUeN0kY5Cc9HjLqDU1xx2oiBEMS1N7/ezvxu3vRKnKrXWPDT4gcR9aWZ6rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427260;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XzJIx3DKBPW8ioP+twDgC+hjPzW1KDk3SxwK4PeZ9DE=;
	b=2AcrHcwttpbeySIRpQ6W/OIQQO9RinQNmkDAtc5MX1lOb9rUUub0bzB8n3zrriZh6Q2N
	 EmTR/uzFH3fEUGNCptdv2sCgOdoSEWAiMd9PEdVtXqljJgVfjKKsuLlHdaMtJ10bv3Tyc
	 6kSNKfUPK4F2P4eFZzdp/Bnh9yNvaXHYRspmpTDW6MYpXJ39JoJ2hKU5B+dFplD1NhD7t
	 lyOqXfxb0pJFXEL+T7F7jz+Hz2OBQk3TDGotDglFfnB8FZFBfBwMGGCCGBnq/82GzP+gu
	 FNJIOScuhQ8zOO89C+ejyTiuZgab5h+4uSePpJ3bBn3mr0VJapS/UGhTMrCk0dg0qHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=afqOlhzk;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC06606A322;
	Mon, 19 Oct 2026 16:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC06606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=afqOlhzk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792427257; x=1792686457;
	bh=XzJIx3DKBPW8ioP+twDgC+hjPzW1KDk3SxwK4PeZ9DE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=afqOlhzkKGePHF7I+Q9LCdDGSS+RFul4D13Nv98vPHENA8ap3hChARuM+yUqW1IpI
	 PGbMJ7nCT3DWFpPyN97EnF+gybc8gR/UitnMjYIqqnzVHjuxBhS7mmOP66KTfRmIn/
	 bJ9/e3UhKzb8XaeYVda8qsiNuqE3I5/sfm+HRUkZTo56dWsKy91k0ZytNZJXNajeag
	 SmLfxkYf0FQjoOe6Qy1haW4y17OZnjlaK6nRcNjXGgbNdsyvQTJsNouMR6XxXSfY99
	 r0jC1qDmWui98t2g1c5VNjr0T8E6I1XGfR0qx2YYutJmU3XTCBZFt6MWBrs4s2j7An
	 BrCpbC1bX18Gg==
Date: Mon, 19 Oct 2026 16:27:29 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261019162722.25587-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: c7a59949b7a189926db7fd3543cc356befdd2039
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
(Lunar Lake, IPU7), ACPI device SMO55F0, and other machines use it under
the same ID. Without a driver the camera does not appear at all.

  1/4  dt-bindings: media: i2c: Add ST VD55G0 camera sensor
  2/4  media: i2c: Add ST VD55G0 global shutter sensor driver
  3/4  media: ipu-bridge: Add ST VD55G0
  4/4  media: ipu-bridge: Add the Surface Pro 11 infrared illuminator

The driver is a port of ST's own downstream driver, firmware patch
included, as vd55g1 carries its own:
https://github.com/STMicroelectronics/vd55g0-linux-driver

Benjamin reviewed every version of it off-list and ran the previous one
on a Raspberry Pi 5; 1/4 and 2/4 carry his Co-developed-by, and the clock
tree in 2/4 is based on his. Peter Marshall's series adds the VD55G0 to
vd55g1 instead, and Benjamin preferred a separate driver:
https://lore.kernel.org/all/0bb08d07-bd06-4adb-851b-6b45d296b328@foss.st.co=
m/
Peter's series also adds SMO55F0 to ipu-bridge, at a link frequency this
driver refuses from a 24 MHz clock; 3/4 says why it uses 396 MHz.

4/4 gives the sensor st,leds from a DMI match, as this machine's ACPI
tables do not say which sensor GPIO drives the illuminator. Sakari
preferred this in ipu-bridge to a quirk in the sensor driver:
https://lore.kernel.org/all/arY4HDSQZYAGJwYR@kekkonen.localdomain/

On this machine the sensor needs Hao Yao's int3472 fix, reviewed and
waiting for its v3:
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
The SSDB asks for 24 MHz, but INT3472 enables the clock at 19.2 MHz, so
without the fix the sensor runs at four fifths of every rate this series
computes, its MIPI output below the 750 Mbps minimum.

While it streams, the IPU7 CSI-2 receiver logs "Received packet is too
long" in Y10 at 644x604 and Y8 at 640x480, though not in Y8 at 644x604 or
320x240, and the frames are complete. With the staging ipu7 driver, the
machine's two other cameras, an IMX681 and an OV13858, log it too, so it
does not look specific to this sensor.

Tested on the Surface Pro 11 for Business, on media next d7e7bca7169 with
Hao Yao's int3472 v2, KASAN and lockdep, IPU7 run by the ipu6 driver:
- probe defers until ipu-bridge has made the endpoint, then binds;
- every mode runs at 59.14 fps, as the controls give;
- Y8 and Y10 at all four sizes, and Y10 packed at full size;
- exposure, gains, flips and test patterns, vertical blanking changed
  during a stream, set_fmt refused while streaming, runtime suspend after
  it;
- under auto exposure, exposure and the gains read back the values the
  sensor applies, as its registers show, and carry over to manual mode;
- the illuminator through led_mode, on and off during a stream;
- v4l2-compliance 46 of 46, and 54 of 54 through the media device, with
  two warnings for the read-only crop;
- no KASAN report, and no lockdep report from vd55g0; the ipu6 driver's
  lockdep_assert_held(&stream->mutex) in ipu6_isys_buffer_list_get()
  fires at every stream start, from ipu6_isys_csi2_enable_streams();
- W=3D1 and sparse clean, dt_binding_check clean.

Sergey Lebedev (4):
  dt-bindings: media: i2c: Add ST VD55G0 camera sensor
  media: i2c: Add ST VD55G0 global shutter sensor driver
  media: ipu-bridge: Add ST VD55G0
  media: ipu-bridge: Add the Surface Pro 11 infrared illuminator

 .../bindings/media/i2c/st,vd55g0.yaml         |  137 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd55g0.c                    | 2434 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   62 +-
 include/media/ipu-bridge.h                    |    2 +-
 7 files changed, 2654 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd55g0.y=
aml
 create mode 100644 drivers/media/i2c/vd55g0.c


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.54.0



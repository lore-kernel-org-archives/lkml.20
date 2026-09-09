Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17857364940;
	Wed,  9 Sep 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975777; cv=none; b=k6B4yz/ox3i9IUrFMRRlMIAQ/PDnox8CJstL8Zm6yZ1EZfjfWLx+JEfs0qrKdvbWVarIpJ+VNOK2F/c/0zTgz/V4/0COFhqmdselpZdI8JdJs+MrRetQSrWkIb30tmz37ffqxwq54ve6+Xeu0QcXH8rg83nAagJS1xHjDM5nQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975777; c=relaxed/simple;
	bh=fFT/O0T1JxApXw60wkG0sWmGhdB+/4tt7YtR9kLb3E4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G44Dqo5fWHQ4/jsiDIG/OFt9bAXFsWEZD6PzilULgo3IJZvE2S3VBIuQzFn+F9R2di7Hqj2F813zlbQi4j3ZiwJ8LSXXBx7WtTImS6foQ+4Q0nj7bDVAQ0bNHVPUF9nRcR+F4AA+FdgEa0ttiLu956ENFV3/U1w+JDItGg6qok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mP9ST8Ua; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mP9ST8Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788975772; x=1789234972;
	bh=EdUUZ4T4dOpJ+h6sWCjYXYysUiQE8gNL1TQqutWVrH0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mP9ST8UaYjotFjQR4VCmgaxTs7qpAySj/4sGQ0QiGVb7nVNFipptoYKJlyXylm0nC
	 1Dr7or7iAzBQiwTiMPk+QZ1eo5uBojPKdJ4O46xhuVIKqUddtYV1m7c4brio5Wk9RB
	 FxBsa4n77pQfGZwDGTAEMNDSQSn5Ypp3vOklxRUSyoT9mfdFT8cPYmvJKxHalGVe+U
	 faCw0rSdVgCSOwdI/5+/SoTwY3FgYYUsZqeiQ3q7QRJXHJvBFkWULO2Sn3Md0hY0pH
	 Wt6kEy+DWB4zScp20QehD6XrAW06qAZDXhM1P8/XrKZ/KDdLWgWMvH6/7YSNzGtM/j
	 atap1iGHvtxIw==
Date: Wed, 09 Sep 2026 17:42:46 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: Add support for the Sony IMX681
Message-ID: <20260909174240.80023-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: c97c4f885912dfa030e08134eb65ae63147cb574
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11 f=
or
Business (Intel Lunar Lake, IPU7), enumerated as ACPI device SONY0681. With=
out
a driver the camera does not appear at all.

  1/3  dt-bindings: media: Add Sony IMX681            (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver      (Andre Gilerson's)
  3/3  media: ipu-bridge: Add Sony IMX681             (mine)

The driver is Andre's work, reverse-engineered from I2C traces taken under
Windows. I am carrying the submission, not the code: his Signed-off-by is o=
n
2/3 with mine beneath it as the person passing it on. He is away until 28
September, so replies to review in the next few weeks will come from me. I =
have
the hardware and the instrumentation is scripted, so anything you want meas=
ured
I can measure.

Where the numbers come from
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The parts taken from traces are labelled as such and not dressed up.
imx681_init_regs[] is 21 register writes whose individual meaning is not kn=
own.

What is derived is written down. The link frequency comes from the PLL
configuration visible in the same traces - 19.2 MHz EXCK, PLL2_MUL 303,
PLL2_PRE_DIV 3, giving 1939.2 MHz on the bus and therefore 969.6 MHz per la=
ne -
and the pixel rate follows from that, the lane count and the bit depth. The
gain law and the black level were measured against the sensor rather than r=
ead
off a datasheet, because there is no public datasheet for this part.

Three things we know are arguable, raised here rather than left for review
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

V4L2_CID_ANALOGUE_GAIN advertises 0..1020, which under the 1024/(1024-code)
law reads as up to 256x, while the analogue stage stops at code 960. Above =
that
the driver makes up the difference digitally, so the total gain still follo=
ws
the formula and an AGC's arithmetic is correct - it is buying noise instead=
 of
exposure at the top of the range. Splitting it between ANALOGUE_GAIN and
DIGITAL_GAIN is the obvious alternative. Andre has not given a view on that=
 one,
so if you want it, I will prepare it and put it to him rather than answer f=
or
him - which may mean it waits for his return at the end of September.

The chip-ID read is a single cci_read with no retry. This machine has faile=
d it
twice, once as 0x0081 and once as 0x0000 against 0x0681 - a sensor answerin=
g
before it is ready. A retry absorbs that without inventing a longer reset d=
elay.
Andre would rather land the driver as written and add this afterwards, and =
I
have kept it that way rather than editing his patch.

It may not be this sensor's fault: the ov13858 on the same board has now
returned a wrong chip id once too, 0x1000 against 0xd855, reading it the sa=
me
unretried way. Two events are not a conclusion, but a retry is cheap.

The input clock rate is read and logged but never checked against the 19.2 =
MHz
the register sequence assumes. Same disposition: a follow-up, not a silent =
edit.

Testing
=3D=3D=3D=3D=3D=3D=3D

On a Surface Pro 11, front camera, with all three patches applied - and on =
a
kernel built from this base, not backported into a distro one:

  # uname -r
  7.3.0-rc1-imx681-medianext+
  # dmesg
  intel-ipu7 0000:00:05.0: Found supported sensor SONY0681:00 (\_SB.PC00.I2=
C5.CAMF)
  imx681 i2c-SONY0681:00: IMX681 probed successfully: 3844x2640 @ 969600000=
 Hz link freq
  intel_ipu7_isys.isys intel_ipu7.isys.40: bind imx681 3-0010 nlanes is 2 p=
ort is 2

The first of those lines is 3/3 doing its job: without the ipu-bridge entry=
 the
IPU does not recognise SONY0681 and nothing binds. No errors or warnings fr=
om
the driver at all.

  streams                  3844x2640 SGRBG10, 30.01 fps
  brightness vs gain       10.4 / 13.1 / 20.0 / 47.0 for codes 0 / 300 / 70=
0 / 960

The second line is there because a mean brightness on its own cannot tell a
dark room from a dead pipeline. Driving the gain and watching the frames fo=
llow
it settles that; the captured frames are a recognisable room, right way up.=
 The
same sweep on a 7.0.0 kernel with the same driver source gives 11.8 / 14.7 =
/
22.7 / 52.8 - the difference is the room, an hour later.

  checkpatch --strict      clean on 2/3 and 3/3; on 1/3 only "does MAINTAIN=
ERS
                           need updating?", which 2/3 answers
  make dt_binding_check    passes, example extracted and compiled
  build, W=3D1               imx681.o and ipu-bridge.o, no warnings

Based on media/next at f9536a8065 ("media: ipu-bridge: Add support addition=
al
link frequency").

German reported this HID as a bug on this list on 3 September and has had n=
o
reply since; he is on Cc here. He reaches IPU7 through the staging driver r=
ather
than ipu-bridge, so if this goes anywhere there is a second machine on a se=
cond
path ready to try it.

  https://lore.kernel.org/linux-media/20260903080854.16266-1-germanpapulind=
ez@gmail.com/

Andre Gilerson (1):
  media: i2c: Add Sony IMX681 sensor driver

Sergey Lebedev (2):
  dt-bindings: media: Add Sony IMX681
  media: ipu-bridge: Add Sony IMX681

 .../bindings/media/i2c/sony,imx681.yaml       | 107 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx681.c                    | 900 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 6 files changed, 1028 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c

--=20
2.53.0



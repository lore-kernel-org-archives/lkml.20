Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D119566C6A;
	Wed, 23 Sep 2026 19:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192307; cv=none; b=iAopKzKlTFMNGisG2KhicVQexw9gu5h29TWi57gICzoqeMNb3i50xjrk6l1ffPgBFytEtVLV9RXLs35zLhdsbI24OcllGus70ahBkV3W81gH5Lzkl5s0Mzt+I2cg2W+m02UkhoFdQbSwwM4x9cXfs7OTZrm8yW9Iy2jBL0KCWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192307; c=relaxed/simple;
	bh=BsVuZG2c0C92SgB1NvIbQETdqp6iPstt+5m3J+PF/V0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gIii2OUkRQ4T4RMFFsXkyuLfmbWDHzFM+QHY2JstH6yHV0N8QPocw9AKcToG+mRjcklKLJ69ZKeUaBpVcBSebLEGvSIlHIzBFKGXEJS8DJ/DaFP2LmhoNbeuJEBmjWjdH3gCNhJgtNVErTFT8nONVWHdLdPHCkJA+8dNlgD4yZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aUFKbE68; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aUFKbE68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790192303; x=1790451503;
	bh=ZodIG2fPXJElfR7q3j6yicmN2/cFeHNbtwStwyUSoFE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aUFKbE68Ao3hzzmi0PYQLwo1ct902DcyaMSeJtALMLGhIXWTfXGbT+RS1m7irime0
	 fJUs6P79QFexJEPoPsXX7iO9/mqDLYm/S6iQcIck2HHhrqbdOjxjeb2g2e7V1QUcNZ
	 LBoChmhzxHpeEQozoh/LO4GOLNI3Bp625KuJoKRQjLlvuhdKT7K0ysgKHuGLICYhT4
	 vHweAoePBRhkcM5Vd98ORlow2K0qwSFAjz6wwvdAyIzX0P5iT1Jl/ViVrgPLqh4mBG
	 ULqAJt1NA7hfEWzx4roT7xB+XU0cfAE3Qc3ICUfF3gVm8jkaZkkMraI2qs+gmmH24t
	 bFTxyBQ4jocig==
Date: Wed, 23 Sep 2026 19:38:15 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20260923193805.83998-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 22dfcc20cebb33191449d07f72a4c9ae15ad9c38
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
Business (Intel Lunar Lake, IPU7), ACPI device SONY0681. Without a driver t=
he
camera does not appear at all.

  1/3  dt-bindings: media: Add Sony IMX681            (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver      (Andre Gilerson's)
  3/3  media: ipu-bridge: Add Sony IMX681             (mine)

The driver is Andre's work, reverse-engineered from I2C traces taken under
Windows. I am carrying the submission, not the code.

Changes in v6
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Sakari Ailus's review of v5 2/3, all of it bar two points I have answered i=
n
that thread instead of applying.

The pixel rate is measured now, not computed. He saw that the part runs two
PLLs, so a rate taken from the CSI-2 link describes the wrong clock: the ol=
d
value implied 16.16 fps against a cover claiming thirty. The sensor times a=
t
29.95 fps, which at LINE_LENGTH_PCK x FRAME_LENGTH_LINES is 720,000,000.
Deriving it from the video-timing PLL instead does not work either: its
dividers are at the CCS addresses without the CCS meaning, and the formula
gives 180 MHz for a part running at thirty frames a second. So v6 carries
the measurement, and a comment saying why there is no formula.

The CCS registers are named for what ccs-regs.h calls them, which turned up
two more partial writes: 0x0307 is the low byte of the 16-bit PLL_MULTIPLIE=
R
and 0x030d the low byte of OP_PRE_PLL_CLK_DIV, each right only while its hi=
gh
byte held the reset value - the same fault the crop registers had in v5. Bo=
th
are written whole now, after reading them back to confirm nothing moves.
imx681_init_regs[] keeps only what is the vendor's.

Blanking, orientation and the first exposure come from controls rather than
that list: HBLANK and VBLANK give line and frame length, both flips drive
IMAGE_ORIENTATION and the media bus code. Group hold is gone - it wrapped
single-register writes and bought nothing. The exposure maximum is a margin
below the frame length, so a dynamic frame length works. The rest follows h=
is
list: the runtime-PM shape in probe and remove, endpoint parsing by id, the
debug prints, the error paths.

2/3's commit message was rewritten to describe the patch; what it used to
carry is here.

Two changes are not from that review. Both are things the driver told
userspace that were not true, and both were found by asking the part.

imx681_get_selection() answered all four targets with the same rectangle at
the origin, while the init sequence puts the window at (100, 256) - which
became obvious once the CCS registers were named. The part settles it:
X_ADDR_MIN, X_ADDR_MAX, Y_ADDR_MIN and Y_ADDR_MAX read 8, 4039, 64 and 3087=
,
so 4032x3024 of readable array at (8, 64) with the 3844x2640 window inside
it. CROP and CROP_DEFAULT now report the window, CROP_BOUNDS the readable
area, and NATIVE_SIZE the smallest rectangle containing that, since what li=
es
beyond is undocumented. libcamera stops defaulting PixelArraySize and
PixelArrayActiveAreas as a result.

And the test-pattern menu offered two modes that cannot work. "Solid Colour=
"
shows TEST_DATA_RED and its three neighbours, which reset to zero and which
nothing ever wrote, so the mode could only ever produce a black frame; the
four V4L2_CID_TEST_PATTERN_* controls are added, defaulting to white as
imx219 does, and the mode now shows what it is asked for. PN9 produced a
black frame where modes 2 and 3 produced their patterns, and
TEST_PATTERN_CAPABILITY reads zero on this part so it cannot be asked, so
that entry is dropped rather than advertised.

Checked
=3D=3D=3D=3D=3D=3D=3D

Built into a kernel from this series and booted on the machine. 2/3's
imx681.c and the file that built the running module hash to the same bytes.
That kernel also carries the vd55g0 and ov13858 work in flight on this list=
,
so the numbers below come from a build with all of it in - and imx681.c in
that build is byte for byte what 2/3 adds.

  v4l2-compliance 1.32.0 on the sensor subdev:
  Total for device /dev/v4l-subdev5: 46, Succeeded: 46, Failed: 0, Warnings=
: 0

400 frames at 29.97 fps, and the sensor's own eight-bar test pattern reads
mean 124.1 of 255 with eleven distinct values across a row. A live frame
takes longer than that to arrive: from a cold boot the exposure starts at
the minimum, and libcamera's generic AGC needs about four hundred frames to
open up - at three hundred it is still at exposure 136 of 3173 and the fram=
e
is black. After that it renders as the room. Runtime PM reads suspended wit=
h
usage 0 after probe, active with usage 1 while streaming, and back after.

checkpatch --strict, sparse and W=3D1 are clean on 2/3 and 3/3; 1/3's only
warning asks whether MAINTAINERS needs updating, which 2/3 does.

Also built with KASAN, PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and DEBUG_OBJECTS
and exercised on that kernel: compliance again 46 of 46, then streaming,
start and stop four times over, every control including the new ones,
unbind and rebind, and an s2idle suspend and resume with a capture after
it. No splat from this driver in any of it. The one the boot does produce
is a circular locking dependency in iwlmld's thermal zone, which is not
ours.

The three control laws came off the Windows traces and had never been
checked against the part, so they were measured on it - raw V4L2 off the
ISYS node with the IPA out of the way, since libcamera's AGC otherwise
overwrites exposure and gain. Analogue gain follows 1024/(1024-code) to
within 0.5% over eleven codes, and code 960, the cap, is 16.008x. Digital
gain follows value/256 to within 0.5% from 1x to 16x. Exposure fits
0.043814 x lines + 0.045, an intercept worth 0.10% of the signal at a
thousand lines, with residuals inside 0.14% from 400 lines upward.

Limitations: one machine, one sensor sample, one mode
(3844x2640, SRGGB10 by default and following the flips, 969.6 MHz per lane)=
,
dummy dvdd and dovdd from INT3472 so the fatal regulator path is reasoned
rather than exercised, and no IVSC HID present.

Still open: Andre Gilerson's ack on the binding, which Krzysztof asked for =
and
which is properly his. He is back from 28 September and is on Cc.

Based on media/next at aedd77ea8168 ("media: qcom: camss: use
fwnode_graph_for_each_endpoint_scoped() to simplify code"), still the tip o=
f
that branch today.

Andre Gilerson (1):
  media: i2c: Add Sony IMX681 sensor driver

Sergey Lebedev (2):
  dt-bindings: media: Add Sony IMX681
  media: ipu-bridge: Add Sony IMX681

 .../bindings/media/i2c/sony,imx681.yaml       |  107 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx681.c                    | 1003 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 6 files changed, 1130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c

--=20
2.54.0 (Apple Git-157)



Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58B3C5526
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982808; cv=none; b=ejF8LhRKM7QPq43jDEnFRG385fhul3YmhoipoCHD1zpn6o3PpnlA7sTT5xpZMQptzyBU/xFqobo2dMnhIF0RqKVMLbx5xCMwLjjgnjjIAb8ntIQWnD1SGrWNxl6vWbiyYRL6q1eDeSv7gXRMcoMF6yBL3pIgiIPrWS+hxjfvHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982808; c=relaxed/simple;
	bh=BqTVC+2NJgTOBW0WvRDghGThhCsf6n0NP+V2BqL+k8I=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QEKKWEI1MCEM+BJH9PBKi4Wwdl3yl1cri3jcgiwnL+6AiySmtB9RqNs6pTpuBpBVvPMPkF3lWQnbKg+XmT/cQsfTpCm2FyvqiAXR+taSuFssvly7QrTNIEkaYgmse9XqFQOhF1Ib42QwmeAs4CXYsaXRO4cwL75sJmxFnxWfk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Vs3BBJ1p; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Vs3BBJ1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788982802; x=1789242002;
	bh=QGIavc0LdC45DI5TyU+Rq/ccfcsHauGUoUCtBcOAasc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vs3BBJ1pPF9k5Zt7PJdV8nUkd1NoR3feGpF3I9OPp00xQBFLhYRJ17DZZnCu/RyTE
	 OSXhZZJsp037j8bzg10PxV+q+tRR4XmaG6EFPAnvkiVIrRVRBMyIhKRhPno3kObKez
	 wme1aSXHpgi1nSnoWk9qo0vjnBOzbShFNNh5mgsdeS/YiC7XT6K9WVuyu6pOqWOhdt
	 CgcQn7vKW4FIhi/E+AxQkXFvSA1B23+NK7ISPjFpjgsAz8Dge3J0IzHpFpr7XB3xOF
	 7j1heCvzh3mSJv/KWVFELQbCffmnKj4x8CsD0CUWvWNa9hWbZ/nNKpDLLaCGwW02Pb
	 KR6yvE2nWB3uw==
Date: Wed, 09 Sep 2026 19:39:58 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: Add support for the Sony IMX681
Message-ID: <20260909193953.86192-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6225c62cdb01c4bc07c79f2f6d4829ba94e3d726
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
a driver the camera does not appear at all - not as a degraded device, not =
at
all.

  1/3  dt-bindings: media: Add Sony IMX681            (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver      (Andre Gilerson's)
  3/3  media: ipu-bridge: Add Sony IMX681             (mine)

The driver is Andre's work, reverse-engineered from I2C traces taken under
Windows. I am carrying the submission, not the code: his Signed-off-by is o=
n
2/3 with mine beneath it as the person passing it on. He is away until 28
September, so replies to review in the next few weeks will come from me. I =
have
the hardware, the instrumentation is scripted, and I would rather measure w=
hat
you ask for than argue about it.

Changes in v2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

An automated review of 2/3 was posted into the v1 thread. It raised five
things; four are real and are fixed below. The fifth, a claimed NULL-state
dereference in imx681_set_pad_format(), I do not accept: the core reaches
.set_fmt through v4l2_subdev_call_state_active(), which always supplies a
state, and imx415, imx355, ov02c10 and ov08x40 all dereference it unchecked
too. My full answer to the review is here:

  https://patch.msgid.link/20260909193627.85987-1-lsa.uz@pm.me

Two of the four are mechanical - 2 and 3 below. The other two are not: 1
reverses something the author wrote deliberately, and 4 is the question thi=
s
cover put to you in v1. I have decided both rather than holding the series
until he is back, and said why, so that review has something to argue with
instead of an open question.

1. devm_regulator_bulk_get() failure is now fatal, via dev_err_probe().

   v1 logged a dev_dbg and continued, and imx681_power_on() then called
   regulator_bulk_enable() on an array nothing had filled in. That is worse
   than it sounds: _regulator_bulk_get() unwinds with regulator_put() and
   leaves the pointers where they are, so a get that fails partway puts fre=
ed
   regulators into supplies[] rather than NULLs.

   This reverses a deliberate choice - the code carried the author's commen=
t
   "Continue without regulators - INT3472 may handle power" - so the reason=
ing
   is worth stating. The get does not fail for supplies the firmware leaves
   undescribed; it hands out dummies, which is what this machine shows for
   dvdd and dovdd. A real failure is therefore exceptional, and the likely =
one
   is -EPROBE_DEFER, which is what dev_err_probe() exists to handle. Andre =
can
   overrule me when he is back on the 28th.

2. pm_runtime_get_if_active() is tested against all three of its return val=
ues.

   v1 wrote "if (!pm_runtime_get_if_active(dev))", which reads -EINVAL as
   success, touches the sensor over I2C and then pm_runtime_put()s a refere=
nce
   it never took. The kerneldoc is explicit that on -EINVAL "the usage_coun=
t
   will remain unmodified".

   Beyond this driver, and offered rather than assumed: the same "!" form i=
s in
   gc05a2, gc08a3, imx283, lm3560, og0ve1b and ov6211. Everywhere else in t=
he
   tree that I looked - i915, xe, ipa, ivpu, arm-smmu - it is tested as "> =
0"
   or "<=3D 0". If a cleanup for drivers/media/i2c is wanted I will send on=
e
   separately; it is not in this series.

3. pm_runtime_put_noidle() added on the probe error path, which otherwise
   called pm_runtime_set_suspended() while still holding the reference take=
n by
   pm_runtime_get_noresume().

4. V4L2_CID_ANALOGUE_GAIN no longer advertises or applies digital gain.

   v1 advertised 0..1020 and made up everything above code 960 by writing
   IMX681_REG_DIGITAL_GAIN - the register V4L2_CID_DIGITAL_GAIN also writes=
.
   The clash is not limited to that top end, though, and that is what made =
it
   easy to miss: the analogue handler wrote the digital register on *every*
   call, putting back the 1.0x it had initialised the local to whenever the
   requested code was at or below 960. So setting digital gain to 4x and th=
en
   moving analogue gain anywhere at all silently reset it, with no error an=
d
   with the DIGITAL_GAIN control still reporting 4x.

   Clustering the two controls would have stopped them overwriting each oth=
er.
   I did not do that, because it would then need an invented rule for what =
a
   user means by analogue 1020 together with digital 2x, and there is no ho=
nest
   answer: they are two names for one register. Removing the overlap answer=
s the
   clash and the range question together, which is why they turned out to b=
e one
   question rather than two.

   So ANALOGUE_GAIN is now 0..960 - 1x to 16x, what the analogue stage actu=
ally
   does - and DIGITAL_GAIN owns 0x020E alone. The driver's own define admit=
ted
   the problem: IMX681_ANA_GAIN_MAX carried the comment "combined
   analog+digital", and V4L2 has no control for combined gain. 256x is stil=
l
   reachable, as 16x analogue times 16x digital, which is what the hardware=
 was
   doing all along; the difference is that userspace can now see which half=
 is
   which, and an AE loop that prefers analogue gain in order not to amplify
   noise gets what it asks for. Nothing is broken by narrowing the range,
   because the driver has never been upstream.

Link to v1: https://patch.msgid.link/20260909174240.80023-1-lsa.uz@pm.me

Where the numbers come from
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The parts taken from traces are labelled as such and not dressed up.
imx681_init_regs[] is 21 register writes whose individual meaning is not kn=
own.
Twenty-one, not a thousand-line table, which is the one mercy of this senso=
r.

What is derived is written down. The link frequency comes from the PLL
configuration visible in the same traces - 19.2 MHz EXCK, PLL2_MUL 303,
PLL2_PRE_DIV 3, giving 1939.2 MHz on the bus and therefore 969.6 MHz per la=
ne -
and the pixel rate follows from that, the lane count and the bit depth. The
gain law and the black level were measured against the sensor rather than r=
ead
off a datasheet, because there is no public datasheet for this part.

Still open, and still Andre's to decide
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The chip-ID read is a single cci_read with no retry. This machine has faile=
d it
twice, once as 0x0081 and once as 0x0000 against 0x0681 - a sensor answerin=
g
before it is ready. A retry absorbs that without inventing a longer reset d=
elay.
Andre would rather land the driver as written and add this afterwards, and =
I
have kept it that way. Unlike the four above, this is not a bug anyone has
reported against the code; it is an improvement he has already deferred.

Worth saying because it may not be this sensor's fault: the ov13858 on the =
same
machine has now returned a wrong chip id once as well, 0x1000 against 0xd85=
5,
and it reads its id the same unretried way. Two sensors, one board. I would=
 not
draw a conclusion from two events, but a retry looks cheap either way.

The input clock rate is read and logged but never checked against the 19.2 =
MHz
the register sequence assumes. Same disposition: a follow-up, not a silent =
edit.

And one that is open in a different sense: 2/3 adds a MAINTAINERS entry nam=
ing
Andre as M:, which is the convention for a driver's author but is also an
obligation he has not been asked about, since he is away. It is in the seri=
es
because a new driver with no maintainer entry is worse. If he would rather =
it
named me, or both of us, that is a v3 change and I have put it to him.

Testing
=3D=3D=3D=3D=3D=3D=3D

On a Surface Pro 11, front camera, all three patches applied, on a kernel b=
uilt
from this base rather than backported into a distro one:

  # uname -r
  7.3.0-rc1-imx681-medianext+
  # dmesg
  intel-ipu7 0000:00:05.0: Found supported sensor SONY0681:00 (\_SB.PC00.I2=
C5.CAMF)
  imx681 i2c-SONY0681:00: supply dvdd not found, using dummy regulator
  imx681 i2c-SONY0681:00: supply dovdd not found, using dummy regulator
  imx681 i2c-SONY0681:00: IMX681 probed successfully: 3844x2640 @ 969600000=
 Hz link freq
  intel_ipu7_isys.isys intel_ipu7.isys.40: bind imx681 3-0010 nlanes is 2 p=
ort is 2

The two dummy-regulator lines are there deliberately. They are the evidence=
 for
change 1: the get succeeds and hands out dummies for the supplies this firm=
ware
does not describe, and probe still completes with the failure now fatal. Ha=
d
that reasoning been wrong, the camera would not have come up at all.

  streams                  3844x2640 SGRBG10, 30.01 fps
  analogue gain sweep      65.0 / 65.5 / 67.7 / 84.2 mean, codes 0/300/700/=
960
                           (a dark room at midnight; the pedestal is near 6=
4)

Change 4 was measured rather than argued, by reading register 0x020E over i=
2c
while the sensor streams. The stream has to be running: at stream start
__v4l2_ctrl_handler_setup() applies every control in creation order, analog=
ue
before digital, so digital always wins and the clash is invisible. It bites=
 a
live AE loop, which is the case that matters.

                                        v1 module      v2 module
  start                                 0x0100         0x0100
  after digital_gain =3D 4x               0x0400         0x0400
  after analogue_gain 500 -> 700        0x0100  <--    0x0400
  DIGITAL_GAIN control reads            1024           1024

The last row is the point: the control reports 4x in both columns, and in v=
1
the register disagrees with it and nothing says so. Both modules were built
from the same tree and swapped with rmmod/insmod, so the driver is the only
difference between them.

  checkpatch --strict      clean on 2/3 and 3/3; on 1/3 only "does MAINTAIN=
ERS
                           need updating?", which 2/3 answers
  make dt_binding_check    passes - CHKDT, LINT, STYLE, and the example
                           extracted and compiled
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
 drivers/media/i2c/imx681.c                    | 880 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 6 files changed, 1008 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c

--=20
2.53.0



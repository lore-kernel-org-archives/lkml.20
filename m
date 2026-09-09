Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29D408629;
	Wed,  9 Sep 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986267; cv=none; b=D8zBCVyqBUWgRCqTX5KR4C0z/u+58Neze5ucOBLuYs7KuEIKz9j6cMg9QqQPbreZlODXKEHZdUmsrt7WHwaeJctPHQTpZtISpm1Db36lH7e6ydFszO6BUzrNQsNGcmKespQ9SFdXiPtBouRMm7uu6Ldr3u8rIVFoI/cHv/nVcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986267; c=relaxed/simple;
	bh=1o0PPGeDyu1U8H9g46qiOTbW1876QRAUBi0dC2eQkao=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m9D/FB6jKbvTddVCG4Y+kU0ikSC/EsDmDR4QMS9Sbo5kXleCW58EbqboZGUkQqNvDktiKUBvKBzDDNL+32xT/ofPNt8SvgyUUf9xzkfTZDQsV+7qdFcn3lkJAXDp4ISTvGfadlxsybvM8GNri3qzNu8VGodMY//zjbDcKkzlssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SEhYd+19; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SEhYd+19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788986249; x=1789245449;
	bh=Astlchi2n6MolW2YL+DVW6AKlw8t1Xhyqc7Nvl/DWbQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SEhYd+192P4M2NuXk1eFNzAtzXxwYOUXj2hRBpTxfwOS4Ip6sH9SvZbRqLh0srwkl
	 Hz+KgMXj2TO7pjTRH+JZNwdBX60hVnZAQS1miehrPSC+hpsEYQggVmHOcs+WCDM0qo
	 v+qBxzX+PY9APbRg9mPGA1f/aZHZlvrcyw3WLHsxErl7Su92Mk893BuYu+/IcYN5lH
	 NnpFUKNPcCEjmvZDK2Hf01iQrqPSryCyBBvaPFPbRZCx4JSAwW+CeqEJ+BL1Rmc4TF
	 RCzcu4H5g/a8QR0HFT/gluneaMYOuKHTSARkItHtQ8c2dFjcTi/c0f6HbGJIMi4fNn
	 ucH3SCjV/3/AA==
Date: Wed, 09 Sep 2026 20:37:24 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] media: Add support for the Sony IMX681
Message-ID: <20260909203717.90605-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b4e2f3a5a80ce74a68583ef21368196d771c2707
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

Changes in v3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

One fix, and a retraction that matters more than the fix.

The automated review of v2 caught a regression I introduced between v1 and =
v2,
and it is right. v1 tested pm_runtime_get_if_active() with "!", which I cal=
led
a bug - it reads -EINVAL as success and then puts a reference it never took=
.
v2 changed it to "<=3D 0", which fixes that and breaks something v1 had rig=
ht:
without CONFIG_PM the helper returns -EINVAL unconditionally,

  static inline int pm_runtime_get_if_active(struct device *dev)
  {
          return -EINVAL;
  }

so "<=3D 0" drops every control write - exposure, gain, blanking, test patt=
ern -
silently. With no runtime PM the sensor is powered from probe and never
suspended, so those writes still have to go out.

v3 uses the shape ov64a40 already has, which is the only fully correct call=
er
of this helper in drivers/media/i2c:

        pm_status =3D pm_runtime_get_if_active(imx681->dev);
        if (!pm_status)
                return 0;
        ...
        if (pm_status > 0)
                pm_runtime_put(imx681->dev);

0 skips, 1 applies and puts, -EINVAL applies and does not put. Ten lines
changed, six of them comment. 1/3 and 3/3 are byte-identical to v2.

Withdrawing an offer made in the v2 cover letter. It said the "!" form is i=
n
gc05a2, gc08a3, imx283, lm3560, og0ve1b and ov6211 and offered a cleanup
converting them. Please do not take that up: converting them to "<=3D 0" wo=
uld
break all six exactly as it broke this driver. If a cleanup is still wanted=
 it
should take ov64a40's shape, and I will send one only if a maintainer asks.

The reasoning behind that offer was wrong in a way worth naming, because it=
 is
easy to repeat. I compared against i915, xe, ipa, ivpu and arm-smmu, which =
do
test "> 0" or "<=3D 0" - but they sit where CONFIG_PM is effectively mandat=
ory,
so the third return never reaches them. drivers/media/i2c has no such
guarantee. I also read ov64a40 at the time, wrote it down as a variant of t=
he
same thing, and did not look at its second half.

Blast radius of the v2 defect, since it is fair to ask: nil in practice, an=
d
not to my credit. v2 was on the list for four hours and applied nowhere, an=
d on
x86 with suspend PM_SLEEP is def_bool y and selects PM, so every machine th=
is
sensor exists on forces CONFIG_PM on and could not have hit it. The real
exposure was the cleanup offer, which pointed at six drivers that ship. Tha=
t is
why it is retracted at the top of this list rather than the bottom.

My full answer to the v2 review, which also carries a report against
ipu-bridge that the same run raised and that is not this series' to fix:

  https://patch.msgid.link/20260909203527.90372-1-lsa.uz@pm.me

Link to v2: https://patch.msgid.link/20260909193953.86192-1-lsa.uz@pm.me
Link to v1: https://patch.msgid.link/20260909174240.80023-1-lsa.uz@pm.me

The four fixes v2 introduced, carried into v3 unchanged
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

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

Testing, and what it does not reach
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

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

                                        before         after
  start                                 0x0100         0x0100
  after digital_gain =3D 4x               0x0400         0x0400
  after analogue_gain 500 -> 700        0x0100  <--    0x0400
  DIGITAL_GAIN control reads            1024           1024

The last row is the point: the control reports 4x in both columns, and befo=
re
the fix the register disagrees with it and nothing says so. Both modules we=
re
built from the same tree and swapped with rmmod/insmod, so the driver is th=
e
only difference between them. v3 carries this code unchanged from v2 and wa=
s
re-measured on the hardware after the PM change above, with the same result=
.

  checkpatch --strict      clean on 2/3 and 3/3; on 1/3 only "does MAINTAIN=
ERS
                           need updating?", which 2/3 answers
  make dt_binding_check    passes - CHKDT, LINT, STYLE, and the example
                           extracted and compiled
  build, W=3D1               imx681.o and ipu-bridge.o, no warnings

And what it does not reach, set out because v2 was caught by exactly the ga=
p
rather than by anything in the list above:

  build configurations     CONFIG_PM is y here and cannot be turned off - o=
n
                           x86 with suspend, PM_SLEEP is def_bool y and sel=
ects
                           it. So the !CONFIG_PM path is read rather than
                           compiled, and that is precisely what let v2 thro=
ugh.
                           If anyone has a config where this driver builds =
with
                           PM off, that is the build I would most like a re=
port
                           from.

  error paths              The regulator get succeeds here because INT3472
                           hands out dummies for dvdd and dovdd, so the fat=
al
                           path under 1 is reasoned rather than exercised. =
The
                           same holds for the probe unwind under 3.

  IVSC                     None of INTC1059, INTC1095, INTC100A, INTC10CF,
                           INTC10DE, INTC10E0 or INTC10E1 is present here, =
so
                           sensor->csi_dev is NULL and ipu-bridge never ent=
ers
                           its IVSC paths. That is why the review's finding
                           against ipu-bridge is reported in the answer
                           linked above rather than patched in this series.

  one machine, one part    One Surface Pro 11 and one sensor sample. German
                           Papulindez has the same HID on another machine, =
but
                           reaches IPU7 through the staging driver, so that=
 is
                           a second path rather than a second test of this =
one.

  one mode                 3844x2640 SGRBG10 at 969.6 MHz per lane is the o=
nly
                           configuration the driver has, and the only one
                           measured.

  no sanitiser run         Not built with KASAN or lockdep. That is a kerne=
l
                           rebuild here rather than a problem, so ask if it
                           would help.

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
 drivers/media/i2c/imx681.c                    | 884 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 6 files changed, 1012 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c

--=20
2.53.0



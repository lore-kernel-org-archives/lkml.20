Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39801F94F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976059; cv=none; b=WzP1oF+BWQZ0emSNlXSrJdEYzL8dvISuR1pc2LuAPQcleMrzo4+gJtyTNPy34s+Vx9nVfloGD57VpBxux44RGGQqsmtWdXCMS3f9DcULZD299PvOw+X6Uea7FHKryR7pnDiyLgy/KCI5nHm1tUfyd7nLwzojl9x6fsc21P0HmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976059; c=relaxed/simple;
	bh=UVE7R9BB99XXJOqEeXYlbB1DFFirdbSX88LtuA3dPWA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kci088OgzQv3MFeX1NnA0OiTE0W1cX08FosLIHZS3lmXoUNw8mRpNGHzzsGtik08lqWD6P2MsMeGcHK53y1kfwvG3KbyAFkCrixYprA8t6OJR15ZTQLg0uNkuZVIaQAP6qU3lYZtCG8Q0vpuWEhRZWzHDwS1Yb0Gb7FXeUnOJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TI3qO780; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TI3qO780"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789976048; x=1790235248;
	bh=9r3qo3RhW1eT6npY6O91FnLiaqgITql2u6tc4bU4a1o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TI3qO780+896QkaRcWVu+n6mwn/ISxwXax7O2mqBo25mKCvCDTvemoTXTYgdHNP7t
	 1B2pNEuQr/gw+hG05yZ88evybtY/pLzvpgOWUo4GdvbsA2uH82huoJd08S/B3FJ9Hh
	 F/kH1D5RdQsmtWRrl4oIAFZsE9TFcQYQyFzDo66FAGJW7yaOX3nJ4bdwkad0HZLR8z
	 2tBHbh1MsW/lcrZ72J7DpSoGtQB+xLsEt7xTalNgiakVhN5ixnXCEFahGUDD2Bu/kR
	 QvtCkFD2vTxvvw81dMDQ9QdeukYfAfWrDshDae9U65SG5IIjSh/Yi+yDq7lLB110Yp
	 Zj5dNaJV0IgYg==
Date: Mon, 21 Sep 2026 07:34:02 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20260921073352.86357-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5085e3fc67cf7216ef12953b6bcbbeb01184b320
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
2/3 with mine beneath it as the person passing it on.

Changes in v4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

All three are Krzysztof Kozlowski's, from his review of v3 on 11 September.

  - MAINTAINERS: the T: line is gone. He is right that neither Andre nor I
    have commit rights to that tree, and the line was ours rather than his =
-
    the MAINTAINERS hunk went in with v2.

  - dev_err() followed by a return is now dev_err_probe(). He flagged one
    site, at the CCI init. The same shape was in twelve others on the probe
    path, so all thirteen are converted rather than only the one he quoted.
    Seven further sites are left alone, in imx681_start_streaming(),
    imx681_stop_streaming() and imx681_power_on(): dev_err_probe() is wrong
    outside probe, and power_on() is reached from runtime-PM resume as well
    as from probe, so it is not a probe path even though probe calls it.

  - The clock-rate dev_dbg is gone. clk_summary says it.

Nothing else changed. No behaviour changes except that the converted sites
now return the error through dev_err_probe() instead of beside it.

Trailers, and a correction I owe
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Krzysztof's Reviewed-by is on 1/3, and on 1/3 only.

German Pablo Lindo's Tested-by is on 2/3 and never on 1/3, per Krzysztof's
"Just remember that Tested-by does not apply here".

The correction, in the open because the error was: the v3 cover letter call=
ed
the tester by a surname I had taken from his email address rather than from
him. It was wrong. His name is German Pablo Lindo, and the Tested-by below =
is
his own wording.

Andre, and why this goes out before your ack
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Krzysztof asked that Andre ack the binding, since it names him as maintaine=
r.
That is properly his and he is away until 28 September, so this version doe=
s
not have it.

It goes now anyway, for a reason that is about the tags rather than about
impatience: patchwork.linuxtv.org populates its tags field for nobody on th=
is
instance - not for our two patches and not for four accepted ones I checked
against today - so a maintainer applying from patchwork picks up neither
trailer.
They exist in the lore archive and in these commit messages, and nowhere el=
se.
A v4 is the only thing that carries them.

Andre - the ack is yours whenever you are back, and nothing here needs it i=
n
order to be read or reviewed.

Not addressed by this version: nobody has commented on 2/3 or 3/3 yet, and
the mirroring question raised against v3 is still open with Sakari, Dan and
Hans. If any of that lands, it lands in v5.

Checked
=3D=3D=3D=3D=3D=3D=3D

checkpatch --strict, sparse and W=3D1 are all clean on 2/3 and 3/3. 1/3's o=
nly
checkpatch warning asks whether MAINTAINERS needs updating, which 2/3 does.

Built and run on the machine rather than only compiled: the driver probes,
ipu-bridge binds it at 3844x2640 over two lanes at 969.6 MHz per lane, and
captured frames render as a coherent image rather than as noise.

Limitations
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  error paths       The regulator get succeeds here because INT3472 hands o=
ut
                    dummies for dvdd and dovdd, so the fatal path is reason=
ed
                    rather than exercised.

  IVSC              None of the IVSC HIDs is present on this machine, so
                    sensor->csi_dev is NULL and ipu-bridge never enters tho=
se
                    paths.

  one machine       One Surface Pro 11 and one sensor sample. German has th=
e
                    same HID on another machine but reaches IPU7 through th=
e
                    staging driver, which is a second path rather than a
                    second test of this one.

  one mode          3844x2640 SGRBG10 at 969.6 MHz per lane is the only
                    configuration the driver has, and the only one measured=
.

  no sanitisers     Not built with KASAN or lockdep. That is a kernel rebui=
ld
                    here rather than a problem, so ask if it would help.

Based on media/next at aedd77ea8168 ("media: qcom: camss: use
fwnode_graph_for_each_endpoint_scoped() to simplify code"). That branch
rewinds - v3's declared base is no longer in it either - so if this does no=
t
apply where you are, say so and I will rebase rather than guess.

German reported this HID as a bug on this list on 3 September and has had n=
o
reply since; he is on Cc here.

  https://lore.kernel.org/linux-media/20260903080854.16266-1-germanpapulind=
ez@gmail.com/
--=20
2.54.0 (Apple Git-157)



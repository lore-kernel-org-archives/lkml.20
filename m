Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A02D38DC6A;
	Mon, 21 Sep 2026 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018705; cv=none; b=i1lZEymhS+REt/EpMAhYbQGFoUoQU3R3iFXPxPTRuxT+ryr/fAQqGnXTjjbIoGGU3FwKm8uJMO9Wn95/riDjQhiOg2lpOr0noHKWahBcIkG4kEuIrPBzHIJq/twg2ja/hNfw6P912POmmx8COl9PuoZF6lN6FwxsuDgl+pWQZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018705; c=relaxed/simple;
	bh=YucqmQD/5Jw59EGiRAHG4TFrZYbjMFzVQnAlU5rRlRM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ksQuvH488EWqgPDjsCMMfDstw1Q5sOKnalyVGQ9UK168vn83nefMaNLgbpism29s9+kgAV7dKBxQsD6DU8NdyJrtBSSkld7AXOAcuh2rOwv3sHedYWb+GhwNM7VihyZaGAQYLtA5llq80jUF98hicF/HqjwDRMEWa8sZZwO5yLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DRc9mlBq; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DRc9mlBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790018700; x=1790277900;
	bh=UfT15pxyhQZE4mBwaA4YhWwD0H4lAWvf6BjvcRrseMY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DRc9mlBqHucDNk8pkGKarTfSnn/nEBah41dPY0zQ9m6t/8mx2Of6ueqCDYXzItp3m
	 4nW8Q/chavZIg1cebjgoNn2Pn+sPbG+yIW+Sh9t2nxXFlztGW5nBndciGv2Eu4jQ+Z
	 c9GyONMioGnSf8z0Z7vFvH6gWdlf93AbI/XH1BunKS2pS01J29o1NeQ1aBVQbQkj2m
	 gJlnQF5QW10El71llvG3RQilnKWk43aW1mcXdrk9c79+v18UCuryFGPuWdPdWvKlyf
	 N/aQHZWa3XnAtYSVSNoJ33IVNnVUup6j7msBUhsXXnkiy1Kirn0tPx1v6vrJG/5YZs
	 AoiRRFCkCM44A==
Date: Mon, 21 Sep 2026 19:24:56 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20260921192450.21811-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cc6155ce82d042d3b5a33ba0bce6177eac449ceb
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

Changes in v5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v4 does not compile on aedd77ea8168, the base it declares. .set_fmt and
.get_selection gained a const v4l2_subdev_client_info *ci argument between
b38d06ad1e13 and that commit; v4 was rebased across the window and 2/3 was
carried unchanged. v5 adds the argument, two lines, and differs from v4 in
nothing else. Krzysztof's Reviewed-by on 1/3 and German's Tested-by on 2/3
stand.

It took building the series to see it: git apply reports no offset on v4
even now, and checkpatch passes it.

Checked
=3D=3D=3D=3D=3D=3D=3D

Built into a kernel from this series and booted on the machine. 2/3's
imx681.c and the file that built the running module hash to the same bytes.

  intel-ipu7: Found supported sensor SONY0681:00 (\_SB.PC00.I2C5.CAMF)

  v4l2-compliance 1.32.0 on the sensor subdev:
  Total for device /dev/v4l-subdev5: 46, Succeeded: 46, Failed: 0, Warnings=
: 0

checkpatch --strict, sparse and W=3D1 are clean on 2/3 and 3/3; 1/3's only
warning asks whether MAINTAINERS needs updating, which 2/3 does.

v4's limitations are unchanged and still hold: one machine, one sensor
sample, one mode (3844x2640 SGRBG10 at 969.6 MHz per lane), dummy dvdd and
dovdd from INT3472 so the fatal regulator path is reasoned rather than
exercised, no IVSC HID present, and no KASAN or lockdep build.

Still open, as in v4: Andre's ack on the binding, which Krzysztof asked for
and which is properly Andre's. And the mirroring question raised against v3=
.

Based on media/next at aedd77ea8168 ("media: qcom: camss: use
fwnode_graph_for_each_endpoint_scoped() to simplify code"). That branch
rewinds, so if this does not apply where you are, say so and I will rebase =
-
and build it afterwards this time.

German reported this HID as a bug on this list on 3 September and has had n=
o
reply since; he is on Cc here.

  https://lore.kernel.org/linux-media/20260903080854.16266-1-germanpapulind=
ez@gmail.com/
--=20
2.54.0 (Apple Git-157)


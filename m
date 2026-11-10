Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306374;
	b=ROhl8zYxCoREpDlDPMEUvvuXHATwmnG8QT5I04GHw74VzurgB9lo2+28MK6Tadf56b68
	 UNenx97gpHZrb+5OxKYl4W4qi1/WcJOOgOYFuxRJtY0N9vMXV14UdDESDHAhNH9Nq6Y+P
	 f2wXWStzG8FidgzrvOj+HGayb/a7HbwuiOSFU+0qvdTVIQknKyLS9IKU2ijmpYa9vAZbX
	 rlfZEF8Chx4BfFPVr9pwo3Rnlnhgtj6Fll0vXHiXITxlvzONe8lOts1sP8VkylZ32t38p
	 h/ET+rDDp9cXldEy7Zd0Mor1QKiPR5AMXZ4dkptlp4CrpEQENqAtoRPsPgpmuliihVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306374;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=Lq98gZEUvynNdhHX4cS6E3yjCJLKeQZtaO5ImnntvbA=;
	b=ZyRVvkg+JHBlcpKoapb8KNQ6AzXTEuqIuNgcKp/8BBwXqdp9y9ziRv9UQ1vMXkuTNWPl
	 6LrnzvBq7tBhwie+VV5GlFgwliDIDGNtvlpVLWAeGIajk/uR/QsD3TaRxnPrzOvouiwPH
	 8elYNv/WdCBBrcR33iXyzgfCT2nepvKD9SnrbJ3WOjbXfvurl7HWaWtrVcaaG1E9F27U0
	 gZ7Mx3fAW2DP5cW9kzMGSu3KOaIBzU+hlvH8T5ZOOczP6PWoS2wRT6/ZKOo2MMw4lX4l+
	 zJBQeyDXM8njqrNnrUbJ2/30011Xb3GGDc4xyVLzV0SDf3hZpPm7/mmn5fVEYUcJaPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B974606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B974606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.116])
	by APP-03 (Coremail) with SMTP id rQCowACneZoy8fJqw328AA--.5138S2;
	Tue, 10 Nov 2026 18:25:55 +0800 (CST)
Message-ID: <b6c373ecdf61b0f4465faf492542b446723d74c6.camel@iscas.ac.cn>
Subject: Re: =?gb2312?Q?=BB=D8=B8=B4=3A?= [PATCH v1] drm/verisilicon: add
 StarFive PCIe-attached DC8000 driver
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Shanlong Li <shanlong.li@starfivetech.com>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Tue, 10 Nov 2026 18:25:54 +0800
In-Reply-To: <BJSPR01MB067525562C88433473E9A2EB92722@BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn>
References: <20261030061521.4117-1-shanlong.li@starfivetech.com>
	 <2e87dbc38ef1486ad301e2e6acb07f57dcf8dd30.camel@iscas.ac.cn>
	 <BJSPR01MB067525562C88433473E9A2EB92722@BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowACneZoy8fJqw328AA--.5138S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF13CF4rXFyxCFWrXFyxKrg_yoW3KFyDpF
	W8tFWYyrWDCr4IqrW2qF1jyFy5C3Z7J3yfur47Jw17u39FvryqqryYvrWF9asrXr4xWr1I
	vrsY9r47uF12yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5k9NDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-10=E4=BA=8C=E7=9A=84 10:04 +0000=EF=BC=8CShanlong Li=E5=
=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B410=E6=9C=8830=E6=97=
=A5 15:11
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Shanlong Li <shanlong.li@starfivetech.com>=
; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>;
> > Thomas Zimmermann <tzimmermann@suse.de>
> > =E6=8A=84=E9=80=81: David Airlie <airlied@gmail.com>; Simona Vetter
> > <simona@ffwll.ch>;
> > linux-kernel@vger.kernel.org; Mason Huo
> > <mason.huo@starfivetech.com>;
> > Changhuang Liang <changhuang.liang@starfivetech.com>
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v1] drm/verisilicon: add StarFive PCIe-a=
ttached
> > DC8000 driver
> >=20
> > =E5=9C=A8 2026-10-30=E4=BA=94=E7=9A=84 14:15 +0800=EF=BC=8Cshanlong.li=
=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Shanlong Li <shanlong.li@starfivetech.com>
> > >=20
> > > StarFive BMC SoCs contain a Verisilicon DC8000 display controller
> >=20
> > So you really downgraded from DC8200 to DC8000 in a new SoC?
> Yes. This is a BMC SoC it only needs one output for the host console
> / remote
> KVM and a single-pipeline DC8000 was chosen instead of the DC8200.
> >=20
> > BTW DC8000 support is being done by Joey Lu, in the form of MA35D1
> > DCUltraLite support (it has the same register layout and basic
> > functionality as
> > the DC8000 controller I seen on Eswin EIC7700).
> Thanks for the pointer, I was not aware of that series. So I need
> rebase
> on top of it instead of carrying my own DC8000 register code?
> If that's the case, where can I view his current submission? I will
> adapt my DC driver based on his modifications.
> BTW i need to wait until his upstream work is completed before I can
> submit my next version?
> >=20
> > > which
> > > is exposed to the host over PCIe, much like the VGA of ASPEED
> > > BMCs.
> > > The
> > > host owns the display pipeline (primary, overlay and cursor
> > > planes,
> > > CRTC, gamma), scans out of the PCIe memory BAR of the device and
> > > relays EDID, hotplug, mode and pixel clock requests to the BMC
> > > firmware through a mailbox located in the CSR BAR.
> > >=20
> > > The DC8000 and the two-pipeline DC8200 served by the existing
> > > verisilicon-dc platform driver share a common register layout,
> > > but the
> > > PCIe variant needs a different GEM backend (VRAM/TTM instead of
> > > GEM
> >=20
> > Adding a PCIe glue for dedicated IP cores is always a challenge in
> > drivers/gpu/drm.
> >=20
> > It might be interesting to thinking of different practices,
> > although creating yet
> > another DRM driver with another GEM backend seems to be a choice.
> >=20
> > > DMA), a BMC-backed virtual connector instead of OF graph bridges
> > > and
> >=20
> > I wonder whether DRM bridge facility could be used inside a PCI
> > device
> > -- one of the DRM drivers with me as a reviewer (drm/loongson)
> > suffers from a
> > similar (but more severe) problem. On that device, the DRM driver
> > should
> > enumerate external I2C-controller bridges via its DDC bus from the
> > information
> > of their proprietary VBIOS.
> >=20
> Yes, I think it fits, the OF graph is only how vs_bridge.c discovers
> its next bridge.
> On the PCI device the topology is fixed, so the PCI front end can
> hand vs_bridge_init() the
> downstream bridge directly.
> Our case is simpler than the drm/loongson one you describe: there is
> no
> external I2C transmitter to discover, the firmware behind the mailbox
> is
> the only "bridge", so no VBIOS or I2C enumeration is needed.

BTW I wonder how the "virtual connector" thing coexist with a real
display connector.

What output interface is configured by this driver? DPI/DP (DP is a bus
type called by Verisilicon, not related to DisplayPort) or a writeback
to memory?

The VCE thing looks quite confusing, it seems to be only sending the
main plane instead of fully composited display content (with multiple
planes)? Have you checked that hardware overlay / cursor is working
with it?

In addition, I wonder whether the connector should be advertised as a
DisplayPort one instead of a Virtual one. On my PC with AST2500, the
display connector is advertised as a VGA one (even when I didn't plug
in any VGA cable because I added an extra graphics card for desktop
usage).

>=20
> > However, even in a worst situation, it would be just a new
> > vs_bridge.c variant
> > combining the output programming logic of the DC and on-chip
> > display bridges
> > into one source file.
> >=20
> > > a
> > > different plane set with scaling, blending, gamma and de-gamma.
> > > Keep
> > > the two front ends separate: the SoC platform driver stays where
> > > it is
> > > and the PCIe driver goes into a new pci sub-directory. Each is
> > > selectable through its own Kconfig symbol, so a kernel can be
> > > built
> > > for either or both platforms, and the two drivers do not share
> > > any
> > > global symbol so they can also both be built in.
> > >=20
> > > Signed-off-by: Shanlong Li <shanlong.li@starfivetech.com>
> > > ---
> > > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 7 +
> > > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> > > =C2=A0drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 30 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 6 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_crtc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 393 +++++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_crtc.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 65 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 895 +++++++++++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 138 ++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c=C2=A0=C2=A0 | 1502
> > > ++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h=C2=A0=C2=A0 |=C2=A0 =
426 +++++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_drv.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 264 +++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_drv.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 79 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_plane.c=C2=A0=C2=A0 |=C2=A0 =
379 +++++
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_plane.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0 62 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_type.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 70 +
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_virtual.c |=C2=A0 531 ++++++=
+
> > > =C2=A0drivers/gpu/drm/verisilicon/pci/vs_virtual.h |=C2=A0=C2=A0 47 +
> > > =C2=A019 files changed, 4899 insertions(+)
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/Kconfig
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/Makefile
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h
> >=20
> > Anyway, it looks that you're just adding a dedicated driver without
> > reusing the
> > current code, and your driver even contains the badly written,
> > magic number
> > flooded code from Verisilicon.=20
> Yes, it derived from the vendor code, May I ask which specific "magic
> number" are,
> Is it something like the " horKernel[]" ?=20

Nearly every register field isn't documented in the vendor code. Things
like horKernel isn't so bad, but the register fields are bad.

And even if this copy of code is properly written, it's still code
duplication unwanted by the mainline Linux.

Thanks,
Icenowy

> I will make adjustments based on joye hu's revisions.=C2=A0 Maybe Try to
> provide an explanation,
> Or drop it
> >=20
> > Don't forget that your former workmate, Keith Zhao, worked for
> > months on this
> > bad driver and still failed to get it upstreamed.
> >=20
> > NAK on this.
> >=20
> > Thanks,
> > Icenowy
> >=20
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_type.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.h
>=20
> Thanks,
> Shanlong.li


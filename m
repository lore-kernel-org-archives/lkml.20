Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344252;
	b=uNTTrYdeaixH3Pcgz58T4uTaRBDI37Gmy2DvfjHaPUvmmFniXhi8ZjV0PLrgn7ntaN96
	 4eiZmLLE8lpGim5+kUGFhArMYySvdIPrLALkcP7D0ycCdTwEUjrScvZ0RfcA4MNgGPEyt
	 amdoMWfn0PhOumsxYL0t7QUvna5jtJrOjNPFSDS7cggyADlDq/C9gM5+kRIq2ZewblUC+
	 dNq4XeVjVTBaSF8yNaZfGxxcyHod/HMf4vDX9q7YG8YrzfFKhFv4ldbv9Seimjy+Hhqrj
	 g7qn2F58MxKs40D5RQaOaJ9FmohDe+S8VuYkiQWKnw/rGYU18HNL5cpgbbwaY4KmMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344252;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=obYTaMm/9e9xOflZfsnh0/wdp9btRIjQKn7aNZfC8jA=;
	b=UvvD2sSIiv8DTin9aADAqTCLAWVxiVm0WW+ozJkqGqlmUrCYAwzi/t4Pv0a7sSvQB9tS
	 gAMLjuNc4NBPtBsxz8p70p08Kn+GfS7k/zt8Y1nN7RxJihtrvVH16+mqYIENaNZgWli5h
	 uSRpWzy07V3xuNkMlKKC4A6MM7iJhz3dFtHKUmORMF0ofx25EGb0lmBaQl9iDrU2KQcjJ
	 J3/oyvqwDO+QWFT5W1YctiHp1okexlsfff55UPs1QHGsA5Exl9TdLazKpF2mVYuUPVk4v
	 dqOoBlsWrknURuuEe+q+e4qVOjcPApWxImzzcQQChP0qKHNJ8Alnse9eeXwf5tdJDGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF8D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowADHk0HrQuRqq_wBDA--.339S2;
	Fri, 30 Oct 2026 15:10:36 +0800 (CST)
Message-ID: <2e87dbc38ef1486ad301e2e6acb07f57dcf8dd30.camel@iscas.ac.cn>
Subject: Re: [PATCH v1] drm/verisilicon: add StarFive PCIe-attached DC8000
 driver
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: "shanlong.li" <shanlong.li@starfivetech.com>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-kernel@vger.kernel.org, Mason Huo <mason.huo@starfivetech.com>, 
 ChangHuang Liang <changhuang.liang@starfivetech.com>
Date: Fri, 30 Oct 2026 15:10:35 +0800
In-Reply-To: <20261030061521.4117-1-shanlong.li@starfivetech.com>
References: <20261030061521.4117-1-shanlong.li@starfivetech.com>
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
X-CM-TRANSID:rQCowADHk0HrQuRqq_wBDA--.339S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWfGw45Kr17CFyruFW3Jrb_yoW7Wr1DpF
	48trW8ArWUJF4SqrW7J3W8KFy5A3Z7Ja1fWr47Aanruw12vryqqry5XrWF9asrXr4xXr1I
	qrWv9r47uFy2yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU56yI5UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-10-30=E4=BA=94=E7=9A=84 14:15 +0800=EF=BC=8Cshanlong.li=E5=
=86=99=E9=81=93=EF=BC=9A
> From: Shanlong Li <shanlong.li@starfivetech.com>
>=20
> StarFive BMC SoCs contain a Verisilicon DC8000 display controller

So you really downgraded from DC8200 to DC8000 in a new SoC?

BTW DC8000 support is being done by Joey Lu, in the form of MA35D1
DCUltraLite support (it has the same register layout and basic
functionality as the DC8000 controller I seen on Eswin EIC7700).

> which
> is exposed to the host over PCIe, much like the VGA of ASPEED BMCs.
> The
> host owns the display pipeline (primary, overlay and cursor planes,
> CRTC, gamma), scans out of the PCIe memory BAR of the device and
> relays
> EDID, hotplug, mode and pixel clock requests to the BMC firmware
> through
> a mailbox located in the CSR BAR.
>=20
> The DC8000 and the two-pipeline DC8200 served by the existing
> verisilicon-dc platform driver share a common register layout, but
> the
> PCIe variant needs a different GEM backend (VRAM/TTM instead of GEM

Adding a PCIe glue for dedicated IP cores is always a challenge in
drivers/gpu/drm.

It might be interesting to thinking of different practices, although
creating yet another DRM driver with another GEM backend seems to be a
choice.

> DMA), a BMC-backed virtual connector instead of OF graph bridges and

I wonder whether DRM bridge facility could be used inside a PCI device
-- one of the DRM drivers with me as a reviewer (drm/loongson) suffers
from a similar (but more severe) problem. On that device, the DRM
driver should enumerate external I2C-controller bridges via its DDC bus
from the information of their proprietary VBIOS.

However, even in a worst situation, it would be just a new vs_bridge.c
variant combining the output programming logic of the DC and on-chip
display bridges into one source file.

> a
> different plane set with scaling, blending, gamma and de-gamma. Keep
> the
> two front ends separate: the SoC platform driver stays where it is
> and
> the PCIe driver goes into a new pci sub-directory. Each is
> selectable through its own Kconfig symbol, so a kernel can be built
> for
> either or both platforms, and the two drivers do not share any global
> symbol so they can also both be built in.
>=20
> Signed-off-by: Shanlong Li <shanlong.li@starfivetech.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 7 +
> =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 30 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_crtc.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 393 +++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_crtc.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 65 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 895 +++++++++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 138 ++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c=C2=A0=C2=A0 | 1502
> ++++++++++++++++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h=C2=A0=C2=A0 |=C2=A0 426 =
+++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_drv.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 264 +++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 79 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_plane.c=C2=A0=C2=A0 |=C2=A0 379 =
+++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_plane.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 62 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_type.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 70 +
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_virtual.c |=C2=A0 531 +++++++
> =C2=A0drivers/gpu/drm/verisilicon/pci/vs_virtual.h |=C2=A0=C2=A0 47 +
> =C2=A019 files changed, 4899 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/Kconfig
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.h
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.h
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h

Anyway, it looks that you're just adding a dedicated driver without
reusing the current code, and your driver even contains the badly
written, magic number flooded code from Verisilicon.

Don't forget that your former workmate, Keith Zhao, worked for months
on this bad driver and still failed to get it upstreamed.

NAK on this.

Thanks,
Icenowy

> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.h
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.h
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_type.h
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.c
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.h


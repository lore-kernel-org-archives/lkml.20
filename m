Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1A2941A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159837; cv=pass; b=V8hnU81URF7SmDvu7jCtqc8JrBnKvH+JRza4r4vXBz/XSx9HJ3jJdMgonv3TTJyT+MAlCUAslvNZAw1GRiMJDyOY1TW0bBGQ65LeZzdjMCRD/Gqv1C7qTSrzsAMwd89e6ExEQmewEx1H0MHzZviPRicRMrU8zznK8TtEmWw8W78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159837; c=relaxed/simple;
	bh=0BE+dmVmXkFgYYDKS56uE9rGx92Afk5IK7Am6Q8j+xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buqyCwkf0LeeUExmEE2ktfLmj736hsI5xpTPBj1FCefDaFE2xZMKbIcQrbHA75+9sref9PjAror2MvWV0W2pFdkxSrt9922eJT+MiUsbMqeCFo5lk00eaG9Jg2buPARilm4lfyvmyUyUgiuDVj5xZP7dbMOUCpgrtTd26FIm80I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYur3Bm1; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYur3Bm1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so2479159e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159834; cv=none;
        d=google.com; s=arc-20260327;
        b=MOAwq7oJXbCWAPle1r2UCUBBuG7MhZLaL1pMqF5w+xP3OC2CUntmVEzba8XbvVDTpJ
         DwfeBfWJSP4JFTrfd+I6fUv24XTlAdNPr6NRPMRpISBE6uyKd/tjH1M2c3myBCXoK1xA
         SxgCK6+1zw73RoTO5OoCUH6Dq6EpWG+sDdAgYcaVIJDzHWssbaljrJdvfQ0LGZNepNBE
         4YuvXn8UTPGlOrNnV52YwIGeYTDSO0wyBuZhciY6ZJEoNGejZo2st9Y9XQdBLiMPJ6L6
         4vh3QrV20+Ib6BteBlJ0znYgIJMqwAVhgXZ3ld26DOz1cwz2nBUnw1on5HaFyylaFvHU
         qUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=deOLXjvMZIXVeNANpLpVuO42of2g4qJoxwxhsXOLKno=;
        fh=Xr/K1IsgunDXlImipVZ3bPYZ171+RPnsbEzxzdrlHz4=;
        b=k1Bqch9V0+5+5UCJSslhzsEDe5BRsJhg0/tYj33KE8us/jlpmKamP00ivZpTZgO293
         OB9b/k9cNizQgsurd2ECw/8+1uJmnqSgP57taQCdOrwnGE3p8ga86mWGyADDVAyH5cgZ
         PB3OOoYnHSFutPYdyuX37cWr32QJxWLQ5dn3KOXsduNsBlqLVWxlIIZ1ExRJtRJIPxqj
         94/UHIXUY63L1UBii9zHd5QKN2mjPFaaKF0oaOV2uGA1WCOWy6opD4+6i3s91Dv6SKHv
         vCXaKZMJHmVuqyYd1M3XNQZpKLhO54n0tl1V+Vy0r1vKRQ9UQ94/69OWBuImZzJzTfdj
         TXbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788159834; x=1788764634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=deOLXjvMZIXVeNANpLpVuO42of2g4qJoxwxhsXOLKno=;
        b=mYur3Bm13RjuRWyCU/XB3bcup6MYfZq6Nl9+B8P0/mlrwc37YoP5PHrYMLErLOT2n8
         FAU5ikeVLj/0aths0bZpWhP8LI2R+OfbNrvUqjLVCz+biWqZ8LcVaw4yw0+jrNgr9nMJ
         RBukMTiWPG4AF4tJaqhTIBkYbcpio55O0F6FzgYWIkX9MYxb/CweVdIdFhoNAn1IWuPZ
         0o/x3c6XcTP8mvUTA63bxC2zKZ9WV6WSdU/CbL+dny2OmE1hoz2Y7rGaygXRW3/bAXrU
         pVZaGCsTuU7+2yywS6kE8rHCKjj3tIA42NWnOQvkT1hqQTqGd+xSsyeDsd+b/49r0Vj3
         0tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788159834; x=1788764634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deOLXjvMZIXVeNANpLpVuO42of2g4qJoxwxhsXOLKno=;
        b=ZAwmlbsbb1/ZWHEAVNyodLRIt9NFP7Rh8FjWovsc3jje1wqNiF0wmBtsuOQITz1eI9
         y9/q8YxxlaWTffSFT3NPssgab9oAk8XKQcafQTWT2bbaLOPP55n9ot5zcrAUhdZ1kAlE
         DeflDS33xA9BCkAzG8YOEQu5RpnKruXt9gceAUYf0YyB/x6kFwsaEx32zl7MQ8ogVGVJ
         OJxX5gC38Z+FZRJ+uARVOh8v3vl6bk++IGM3MgB1/tJAb3Av03KyUs1OI/GBedUEd/JH
         KYSSXZKRzdecnf+8MPP5Q2oeV72NnCkACppzDlFc46INewm2N7T7o3jvsCS6I54fYYHx
         uu2g==
X-Forwarded-Encrypted: i=1; AKwUvBx3EuOZ9ZqT7YFv6ALOfektm+lIZAnKritja7SoOvRndjbTpizkuitx9ORQ6kmPivmEE2SwiPGwfaKkTQE=@vger.kernel.org
X-Gm-Message-State: AFuF++mvyNZDqWNAQHZ/ZnKXXRyOFPasWqiDnmXdxZeR3O0588SbVFWM
	z+g0jG1Gee0uNu1adc3e7S9BZJGsIfdnuVNZMakRzjAHdohN/VeeV9ckwj7Da9MmVDKW1lEsv/W
	skjmnou7VqGonGK3+RdjuzX2VvhUhGJ/wTkAr
X-Gm-Gg: AYBFou24tdgRbL2K+r+3Ca3BSsadmAdDDw01w34q/baZSXjPihMy126U6H8O1NL8CqI
	yK1AlUR1I4aApnfOiGUPeS5Ve6yY0w0Eu+EmuOvonVqdEqjnO5LjRNo/sGUiv+Z3fVA13TvWdOd
	OBPvQk1lx/bnQjFGmaT3YUg0gNDtwP9vtqRFPvJenHgaE1Snq7lIt8ifsSW2/3Z18XeGcwqPPic
	gLNcgooWO73QXwc2Qp4kxvD4Vbk6wXRhUMnAAGsKgb82xxuJM8KhuZSKBxUzs9mkZy7RBVjEt77
	2GLp6ZF9LyUQxX97vdKreVSPTNnAUg65IyTqH/iw9lU=
X-Received: by 2002:a05:6512:3050:b0:5ae:bbd3:27e3 with SMTP id
 2adb3069b0e04-5b5e689fb05mr7608311e87.5.1788159833464; Mon, 31 Aug 2026
 00:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuE1bHr84n5LKcj02HmMR5XefPtvQ-UEJAx7+UKfYvRgS0eDg@mail.gmail.com>
 <12744a63-ac8e-4808-a559-f78fede30a40@amd.com>
In-Reply-To: <12744a63-ac8e-4808-a559-f78fede30a40@amd.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Mon, 31 Aug 2026 10:03:26 +0300
X-Gm-Features: AcwNN1XPOHnRAmLFiBiL9XpPMa9FXyfskqPKL5CI85UY29DSgAOGnONBrwV4igc
Message-ID: <CAMuE1bHhsLnAOHkD85wrsJzZRvcZ4ib1fSfkcm_RYESRp+5_0g@mail.gmail.com>
Subject: Re: [RFC] ptp: ocp: exposing the TimeCard X2 AXI Ethernet port -
 which approach?
To: "Gupta, Suraj" <suraj.gupta2@amd.com>
Cc: Netdev <netdev@vger.kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:05=E2=80=AFPM Gupta, Suraj <suraj.gupta2@amd.com>=
 wrote:
>
> Hi Maimon,
>
> On 8/20/2026 8:31 PM, Sagi Maimon wrote:
> > Hi,
> >
> > Before posting patches I would like to check which of two approaches yo=
u would
> > prefer, since they differ a lot in how much code lands and where.
> >
> > The ADVA TimeCard X2 is a PCIe card whose FPGA image contains a Xilinx =
AXI
> > Ethernet MAC and an AXI DMA engine alongside the timing blocks ptp_ocp =
already
> > supports. We want to expose that Ethernet port as a netdevice.
> >
>
> Is AXI Ethernet being used for 1588 timestamping here?
>

No. The AXI Ethernet is a plain data path on this card. It does no 1588
timestamping, and this series neither adds nor touches any timestamping
support in axienet. It could be added later, as separate work.

> Could you please share the role of axienet in the TimeCard architecture,
> including:
>
> - Which timestamping device/IP is used

The FPGA clock/ToD block on the ptp_ocp side, disciplined by GNSS and the
local oscillator, not by network packets. That block is the PHC that
ptp_ocp registers. The MAC and AXI DMA sit at a separate register window
with no timestamp unit between them.

> - How timestamps are generated and handled

Not on this path at all -- there is no timestamp unit on the Ethernet
datapath to generate them.

> - How the driver interacts with the timestamping mechanism
>

It doesn't, and there is nothing in axienet for it to use: no
.get_ts_info, no .ndo_hwtstamp_get/set, and axienet_ioctl() only
forwards to phylink_mii_ioctl(). I mention this explicitly because the
Xilinx vendor tree's axienet does carry a hwtstamp/TSU path -- we are
not using, porting or touching it.

The scope here is only to expose the existing Ethernet port as a
netdevice by reusing the in-tree driver, rather than duplicating the MAC
and DMA logic inside ptp_ocp.

Thanks,
Sagi

> Regards,
> Suraj
>
> > Approach A - let xilinx_axienet drive it.
> >
> > ptp_ocp creates a platform device describing the two register windows a=
nd the
> > three MSI-X vectors, and xilinx_axienet binds to it. This is what ptp_o=
cp
> > already does for the Xilinx SPI and I2C cores on the same card, see
> > ptp_ocp_i2c_bus() and ptp_ocp_register_spi().
> >
> > There is no device tree, so a software node stands in for one: "phy-mod=
e"
> > replaces a phy-handle, since the MAC is wired to the fabric internally =
with no
> > MDIO and no PHY, and a "fixed-link" child node pins the link at 1 Gbit/=
s full
> > duplex.
> >
> > This needs two things from xilinx_axienet:
> >
> >    1. Read its configuration through the generic device property API in=
stead of
> >       the OF-specific one, so it can be described by a software node. O=
n a
> >       device-tree system dev_fwnode() resolves to the OF fwnode and the=
 reads
> >       land in the same OF code as today, so this is a no-op for existin=
g users.
> >       It is also in line with the wider move from of_* to
> >       device_property_*/fwnode_*.
> >
> >    2. A dma_dev in struct axienet_local. Descriptors and buffers must b=
e mapped
> >       against the device that masters the bus, which for a platform dev=
ice
> >       created by a PCIe parent is that parent - a platform device does =
not
> >       inherit its parent's DMA ops or IOMMU domain. For every existing =
user
> >       dma_dev would equal dev, so no behavioural change.
> >
> > That comes to about 50 changed lines in xilinx_axienet and about 180 ne=
w lines
> > in ptp_ocp.
> >
> > Approach B - a separate driver under drivers/ptp.
> >
> > Reimplement the descriptor rings, NAPI and ethtool support against the =
same IP,
> > roughly 2500 lines, and share xilinx_axienet's register definitions out=
 of
> > drivers/net/ethernet/xilinx/.
> >
> > We have both working. Approach A is tested on 7.0.0-rc1 with the card:
> >
> >    xilinx_axienet xilinx_axienet.512 eth0: configuring for
> > fixed/internal link mode
> >    xilinx_axienet xilinx_axienet.512 eth0: Link is Up - 1Gbps/Full -
> > flow control off
> >
> > ping at 0% loss, a 90 s bulk TCP transfer moving ~9000 packets each way=
 with
> > zero errors and no TX timeouts, ethtool -S/-g/-c/-a all working, and cl=
ean
> > module unload and reload.
> >
> > We would much rather do A than maintain a duplicate of an existing driv=
er, so
> > the questions are:
> >
> >    1. Is instantiating xilinx_axienet from a PCIe parent as a platform =
device
> >       acceptable, or would you prefer the driver split so the device ca=
n be
> >       created on the auxiliary bus? The platform device route keeps the=
 change
> >       to xilinx_axienet small and matches what ptp_ocp already does for=
 the SPI
> >       and I2C cores, but auxiliary bus is the more usual choice for sub=
-devices
> >       of a PCIe function and would make the DMA parent explicit.
> >
> >    2. For the dma_dev, we currently infer it by testing whether the par=
ent is a
> >       PCI device. That is concise but implicit; we are happy to pass it=
 in
> >       explicitly if you would prefer it were not inferred.
> >
> > I can post the series straight away if you would rather look at the cod=
e.
> >
> > Thanks,
> > Sagi Maimon
>

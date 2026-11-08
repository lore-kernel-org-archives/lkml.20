Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156954;
	b=AalwjJQMQ8qpGnGf0N4+3sEtnDta7NoLAzHjh9vXRepMRYvDU3KTz0bqXbWe24eJAxFD
	 9UwcPeNoj/CQWCK/tZY1ah18/sEMZsIM4rfcq95ZC4bOur+z9wOLpYbJGDtY1pUcboVlL
	 23YL8vO9gJg7h8V5nLAD2MrX2uz4d8eO+fU+wy2ygsJ1TFqQLSJXrOu+XZwzxbabX+I5i
	 IMSj8Dezzp2iu0+jTw5HIQtYHjV9alKjYKpTG62b6R42YVxJQwR+zH3BqHptse+Hin7Dn
	 nmmvCGz/8RIEacDA1rIgJ9wBkBZ4BCEFHb9Jgr8nWlUS+P62kyPhoa3NKpQwg+4NZ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156954;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=5clIn+ab69f599ujad42Koar5tkf18xn+pTKzRnZxkc=;
	b=eGY34n5zLh7p1Hnx2nfxAxnDgwA4l2ool9Nu9WLBG0O3skErdGQlfnmSDEieOBRnkqn6
	 goQapLvnPs8jhHF+j3bdqkx9q/qND22wt6XS3IirpQyyphlTLeRHkZOY6r+UnNJRdt9ym
	 TYWTv79iZEIliVf4B3D1K2+3CvTPMzI2dShVOliKM9qqjJZRflfnriY11Wg0LR+OC6Cut
	 UXW+4Ie2YIjsAi6Oc2th1bu0uE+PAs6n4ND64Gv2ZQYw4TWAuPS/dG6LXZl22ouB8bNZ2
	 DjudK4wVOJNwipXircga6KmU6jv8cEF1eSNJgK3MDHtSdC3SMpjHmOrAVLrOCpGxQ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsqPxGrV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hbCm5wxD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24D606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B24D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsqPxGrV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hbCm5wxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794156952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5clIn+ab69f599ujad42Koar5tkf18xn+pTKzRnZxkc=;
	b=NsqPxGrVQJsYLfFXHR9KSa8uhJNA17swjEhsNA1CCPBbXMBO0Kt0V6EHAv9zU1dFifl8KH
	xvzy8GjxfuJbMdWoNc2Lp2UYAaJsdvyG79qJM2QeN029X9eYFV5u2MIcVvUKad1x2b2jpi
	fwhcWkQbbe3auJo7cfGqtYU4wLah06A=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-52BHIMp5NZ2RSQpZ7G0YSA-1; Sun, 08 Nov 2026 11:55:51 -0500
X-MC-Unique: 52BHIMp5NZ2RSQpZ7G0YSA-1
X-Mimecast-MFC-AGG-ID: 52BHIMp5NZ2RSQpZ7G0YSA_1794156951
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso56007185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794156951; x=1794761751; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5clIn+ab69f599ujad42Koar5tkf18xn+pTKzRnZxkc=;
        b=hbCm5wxDrXfgqKa/QGGbAD1Qh4yBpwoRN64DpO4NVqJuHJ37RMZ7hwhnwHznKIFoGN
         dGWC96rX4gO9cjy4Ir/IoPDkS7fviQvS91g3nROM8W5uH1dwBWkqn8b2TSu5ZdnEdC/H
         SgVk58mU+awxkC4GAUDfVamnbBfQ+x9+LZ5lBI7AHE7s+faNvrlzgsaOE8RiyhCiZRaL
         7xyW1hVETqvC9Q1hPkrn+9fD2cPH+z8REN8K1bnt75CNniVaEm9cFTjBZVwtAfdjpfSN
         i0Mdz/U9DFu/15BzcXjFijypIRZpRmpe1KXh3ggLcT+Tj8W2GlFBsvTNdkusO25w8EvZ
         Jepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156951; x=1794761751;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5clIn+ab69f599ujad42Koar5tkf18xn+pTKzRnZxkc=;
        b=bn+TU449bd+c4OYzadHyUFpxZwMZSQ00FhGJV0NSRkuK1x1GjIb73iPoJ+T/TvBZyz
         9XxmIqrjBiiG+XjO/SIAFn7hx5fz136lWlHftXXrlQxnX3znnvIp9tUFuwT6N951/ULU
         MyRmpqYmh2Bmz6wus65mx9o33ETi7j/ypzlvxFkCd2E/VpZaLAeC+ZK/dsgQFgC0puI2
         X8Lbhr49VhdyGIl+Us5hImT25LX9vPGnfL3LXcuz0MVeOLNmJ6nZPQj33kx2A8/lNDL9
         /rqATSQ3ktUMZ2y+H60DqknPlZmJt/aODQJ7yMRQM8Z3Q/ncrAryxn039I/VUjQAiH3D
         uhOQ==
X-Forwarded-Encrypted: i=1; AL+hErGVVT8Cu+HMB9zZJ0fSRfHw0gx1eMb03QpO5QIgjdXokmQ+Ot5BYVSRbdfSWX/2ZyeaKarQ4lHLAe8d5eE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Num31FIqgv+8zU5If0H8kxAEMLJ/ue9ur/7Ia798vktLPYR9
	r8Qr6870MrX9nCmDGzBRbRfGiYhSqNvYI5sOsxy/6kIBOrpv8xVQhlJiPzBn+kl0bhoEwb6+8WC
	RI4YY0H4Hw8ucEuYNgUS/CyKhuFEExEOwNXUik2vYlTLKiutiF/fUZYRP6YUx0rHaZw==
X-Gm-Gg: AYBFou2IgXRoUyB31SaHxmE22oABT6nHsbGdd1mzQUnBCLUJxRhBPFCDWVHvO2/amTI
	dg9lZaXvo25i8oXjvHGuA0U9HRy8EcSf4x56bJZehNr+tZLbyusoL5mxdx3CFJt89hE+/AGHiGl
	ZLjg4fXURNi4PYLITFL0th5a+wR+gVPLTjfSbaOYNyN4LTZoDrZmUmRnRAYTKob0tgvUmWhH8SC
	GjEbRTSJTiekNbZjGAybMCdHGh2bEpzSMx29vB1I7JbEnTO85rFX5+FL3dxkBOuofu7fp4OhO8T
	TdrK2ijrSfX8U2LhKJLNkp7y4Ba3wpcp5pvPH9dJ5PHETgdCfPWcU6+JVYRwExEBLfR84B5Eejm
	k3655QdWa1HmXogz2v/Lvo0p8HoVgkJf5WLydt+Jx98Zce7II9PI0USY4FJ5ggMXNw2cy/xzfQe
	pgkn4arZ4L6P5f3o0/C29OVK4eO7DU2eVgtVFU8e8G9yCIFouPhxxRR0gBGubekEAgyWtlag==
X-Received: by 2002:a05:620a:1724:b0:93f:1789:8359 with SMTP id af79cd13be357-94604dd4bc2mr725762985a.31.1794156950621;
        Sun, 08 Nov 2026 08:55:50 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:93f:1789:8359 with SMTP id af79cd13be357-94604dd4bc2mr725760485a.31.1794156950063;
        Sun, 08 Nov 2026 08:55:50 -0800 (PST)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782ccaea3sm250464985a.4.2026.11.08.08.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:55:49 -0800 (PST)
Message-ID: <b6b39c415514de821d8a71cefda41f3d4f53405a.camel@redhat.com>
Subject: Re: [RFC PATCH] scsi: qla2xxx: Use the real INTx pin for the port
 number on Hyper-V guests
From: Laurence Oberman <loberman@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, "njavali@marvell.com"	
 <njavali@marvell.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>,  "wei.liu@kernel.org"	 <wei.liu@kernel.org>,
 Mukesh R <mrathor@linux.microsoft.com>
Cc: "GR-QLogic-Storage-Upstream@marvell.com"
	 <GR-QLogic-Storage-Upstream@marvell.com>, 
 "James.Bottomley@HansenPartnership.com"
	 <James.Bottomley@HansenPartnership.com>, "haiyangz@microsoft.com"
	 <haiyangz@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>, 
 "sbhat@linux.ibm.com"
	 <sbhat@linux.ibm.com>, "kmahlkuc@linux.ibm.com" <kmahlkuc@linux.ibm.com>, 
 "linux-scsi@vger.kernel.org"
	 <linux-scsi@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
	 <linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Sun, 08 Nov 2026 11:55:47 -0500
In-Reply-To: <080f3cc7097c9a8191e4fa2f03ff2d67d0640f40.camel@redhat.com>
References: <20261104222541.2675051-1-loberman@redhat.com>
		 <MN2PR02MB68634FAAFE0BA7C4DB3153D9D4772@MN2PR02MB6863.namprd02.prod.outlook.com>
	 <080f3cc7097c9a8191e4fa2f03ff2d67d0640f40.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 10:14 -0500, Laurence Oberman wrote:
> On Thu, 2026-11-05 at 00:46 +0000, Michael Kelley wrote:
> > From: Laurence Oberman <loberman@redhat.com> Sent: Wednesday,
> > November 4, 2026 2:26 PM
> > >=20
> > > qla2x00_set_isp_flags() derives the physical port number from
> > > PCI_INTERRUPT_PIN, and the port number selects the per-port VPD,
> > > NVRAM,
> > > NPIV and FCP priority flash regions.
> > >=20
> > > On Hyper-V guests, pci-hyperv returns 0 for byte and word reads
> > > of
> > > PCI_INTERRUPT_PIN since commit fea93a3e5d5e ("PCI: hv: Return
> > > zero,
> > > not
> > > garbage, when reading PCI_INTERRUPT_PIN"). Commit 7268e509b43a
> > > ("scsi:
> > > qla2xxx: Handle INTx not connected while passing through") then
> > > falls
> > > back to PCI_FUNC(). With Discrete Device Assignment (DDA), each
> > > function
> > > of a multi-port HBA is presented as function 0 in its own PCI
> > > domain, so
> > > every port gets port_no 0. All ports read port 0's NVRAM, pass
> > > the
> > > checksum and register the same WWPN, and nothing is logged.
> > >=20
> > > Without that commit, port_no underflows to 255, no flash region
> > > is
> > > selected and every port fails with "Inconsistent NVRAM checksum"
> > > and
> > > falls back to the default WWPN.
> > >=20
> > > pci-hyperv only zeroes byte and word accesses within 0x3c-0x3d. A
> > > dword
> > > read at PCI_INTERRUPT_LINE reaches the device's config space and
> > > returns
> > > the real pin in bits 15:8. On Hyper-V guests, use that when the
> > > byte
> > > read returns 0, and warn if the pin is still 0 so that duplicate
> > > WWPNs
> > > are not silent. Bare metal, KVM/vfio and other hypervisors are
> > > unchanged.
> >=20
> > There's a patch in flight [1] that kills the behavior that your
> > patch
> > takes
> > advantage of. I don't have knowledge of the full details that
> > motivated [1],
> > so maybe Mukesh Rathor or Wei Liu can add some info, as well as
> > comment on the validity of what you are observing as a possible
> > work-around to the qla2xxx problem.
> >=20
> > Michael
> >=20
> > [1]
> > https://lore.kernel.org/linux-hyperv/20260913232255.2801797-1-wei.liu@k=
ernel.org/
> >=20
> > >=20
> > > Tested with an equivalent change on a RHEL 9 (5.14-based) guest
> > > with a
> > > dual-port QLE2692 (ISP2261) assigned through DDA (Hyper-V host
> > > 10.0.17763):
> > >=20
> > > =C2=A0 before: both ports "Inconsistent NVRAM checksum=3D0xffffffc0
> > > id=3DNGKP",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 both WWPN 0x21=
0000e08b1c5586
> > > =C2=A0 after:=C2=A0 port_no 1 and 0, NVRAM valid, WWPN 0x210034800d70=
65bd
> > > and
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x210034800d70=
65bc, fabric login and FC-NVMe localport
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 registration o=
n both ports
> > >=20
> > > Also tested on bare metal (ISP2031): the new path is not taken
> > > and
> > > port
> > > numbers and WWPNs are unchanged.
> > >=20
> > > Signed-off-by: Laurence Oberman <loberman@redhat.com>
> > > ---
> > > RFC: this relies on pci-hyperv not virtualizing dword reads at
> > > 0x3c,
> > > which is an implementation detail rather than an interface. It is
> > > posted
> > > as the smallest working fix and to start the discussion. Feedback
> > > wanted
> > > on cleaner alternatives:
> > >=20
> > > =C2=A0- Hyper-V (linux-hyperv): could pci-hyperv expose the real
> > > =C2=A0=C2=A0 PCI_INTERRUPT_PIN, or provide the physical function numb=
er,
> > > for
> > > DDA
> > > =C2=A0=C2=A0 devices? Some drivers use the pin for port identity, not=
 only
> > > for
> > > =C2=A0=C2=A0 interrupt routing.
> > >=20
> > > =C2=A0- Marvell: is there a firmware or register source for the
> > > physical
> > > =C2=A0=C2=A0 port that does not depend on PCI config space? CSRX_FUNC=
TION
> > > in
> > > =C2=A0=C2=A0 ctrl_status is a single bit and would not cover quad-por=
t
> > > =C2=A0=C2=A0 27xx/28xx/29xx.
> > >=20
> > > =C2=A0- The check is x86-only (hypervisor_is_type()). pci-hyperv also
> > > =C2=A0=C2=A0 supports arm64 guests; a better way to detect a pci-hype=
rv bus
> > > is
> > > =C2=A0=C2=A0 welcome.
> > >=20
> > > This has not yet been tested on a 7.3 kernel in the DDA guest;
> > > testing
> > > was on a RHEL 9.8 backport. The upstream behaviour without this
> > > patch
> > > (duplicate WWPNs with no warning) follows from the code and has
> > > not
> > > yet
> > > been reproduced on 7.3.
> > >=20
> > > =C2=A0drivers/scsi/qla2xxx/qla_os.c | 40
> > > ++++++++++++++++++++++++++++++++++-
> > > =C2=A01 file changed, 39 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/scsi/qla2xxx/qla_os.c
> > > b/drivers/scsi/qla2xxx/qla_os.c
> > > index 3c412c7fb6fe..4180d3f15231 100644
> > > --- a/drivers/scsi/qla2xxx/qla_os.c
> > > +++ b/drivers/scsi/qla2xxx/qla_os.c
> > > @@ -24,6 +24,10 @@
> > > =C2=A0#include <scsi/scsi_transport.h>
> > > =C2=A0#include <scsi/scsi_transport_fc.h>
> > >=20
> > > +#ifdef CONFIG_X86
> > > +#include <asm/hypervisor.h>
> > > +#endif
> > > +
> > > =C2=A0#include "qla_target.h"
> > >=20
> > > =C2=A0/*
> > > @@ -2704,6 +2708,40 @@ static struct isp_operations
> > > qla29xx_isp_ops
> > > =3D {
> > > =C2=A0	.initialize_adapter	=3D qla2x00_initialize_adapter,
> > > =C2=A0};
> > >=20
> > > +/*
> > > + * Read the INTx pin used to derive the physical port number.
> > > + *
> > > + * pci-hyperv hard-wires byte and word reads of
> > > PCI_INTERRUPT_PIN
> > > to zero.
> > > + * With Hyper-V Discrete Device Assignment every function is
> > > also
> > > presented
> > > + * as function 0 in its own PCI domain, so the PCI_FUNC()
> > > fallback
> > > gives
> > > + * port 0 for every port and they all report port 0's WWPN. A
> > > dword read at
> > > + * PCI_INTERRUPT_LINE is not virtualized by pci-hyperv and
> > > returns
> > > the
> > > + * device's pin in bits 15:8, so use that on Hyper-V guests.
> > > + */
> > > +static u8
> > > +qla2x00_get_intx_pin(struct qla_hw_data *ha)
> > > +{
> > > +	u8 pin;
> > > +
> > > +	pci_read_config_byte(ha->pdev, PCI_INTERRUPT_PIN, &pin);
> > > +#ifdef CONFIG_X86
> > > +	if (!pin && hypervisor_is_type(X86_HYPER_MS_HYPERV)) {
> > > +		u32 val =3D 0;
> > > +
> > > +		pci_read_config_dword(ha->pdev,
> > > PCI_INTERRUPT_LINE, &val);
> > > +		pin =3D (val >> 8) & 0xff;
> > > +		if (pin)
> > > +			ql_log_pci(ql_log_info, ha->pdev,
> > > 0xffff,
> > > +				=C2=A0=C2=A0 "Hyper-V: INTx pin reads 0,
> > > config dword 0x%08x
> > > gives pin %u.\n",
> > > +				=C2=A0=C2=A0 val, pin);
> > > +		else
> > > +			ql_log_pci(ql_log_warn, ha->pdev,
> > > 0xffff,
> > > +				=C2=A0=C2=A0 "Hyper-V: unable to determine
> > > physical port, ports
> > > may report duplicate WWPNs.\n");
> > > +	}
> > > +#endif
> > > +	return pin;
> > > +}
> > > +
> > > =C2=A0static inline void
> > > =C2=A0qla2x00_set_isp_flags(struct qla_hw_data *ha)
> > > =C2=A0{
> > > @@ -2887,7 +2925,7 @@ qla2x00_set_isp_flags(struct qla_hw_data
> > > *ha)
> > > =C2=A0		ha->port_no =3D ha->portnum & 1;
> > > =C2=A0	else {
> > > =C2=A0		/* Get adapter physical port no from interrupt
> > > pin
> > > register. */
> > > -		pci_read_config_byte(ha->pdev,
> > > PCI_INTERRUPT_PIN,
> > > &ha->port_no);
> > > +		ha->port_no =3D qla2x00_get_intx_pin(ha);
> > > =C2=A0		if (ha->port_no =3D=3D 0) {
> > > =C2=A0			/* None of INT[A|B|C|D] may be
> > > virtualized
> > > by vfio */
> > > =C2=A0			ha->port_no =3D PCI_FUNC(ha->pdev->devfn);
> > > --
> > > 2.56.0
> > >=20
> Hello Michael,
>=20
> Thanks very much for the information. I will follow the thread.=C2=A0
> Our main pressing issue is any guest on HYPER-V with DDA moving to
> RHEL9 from RHEL8 loses functionality for the pass-through qla2xxx
> ports
>=20
> Regards
> Laurence
Hi Michael,

Thanks, that settles it. With "PCI: hv: hardwire PCI_INTERRUPT_PIN to
0"
any read covering 0x3d returns 0, so qla2xxx cannot use the pin under
DDA at all. Please consider this RFC withdrawn.

The qla2xxx problem itself remains. The driver uses the pin, not for
interrupts, but as its only indication of which physical port a
function
is on. That selects the per-port VPD, NVRAM, NPIV and FCP priority
flash
regions. Under DDA each function is presented as function 0 in its own
domain, so PCI_FUNC() cannot tell the ports apart either, and every
port
of a dual-port QLE2692 comes up with port 0's WWPN.

Wei, Mukesh: if there is a supported way for a guest to learn the
physical function of a DDA-assigned device, qla2xxx could use it.
Otherwise I think this has to be solved in the driver.

Nilesh: on the same guest, the -1015 mailbox dump logged by the Marvell
out-of-tree driver at init differs between the two ports only in
mb[15]:

  pin A port: mb[8-15] 0003h 0001h 0001h 0001h f080h 0000h 0008h 0000h
  pin B port: mb[8-15] 0003h 0001h 0001h 0001h f080h 0000h 0008h 4001h

Is that firmware reporting the physical function? If so, and if it is
available on ISP25xx/27xx/28xx/29xx before the flash regions are
selected, it would give qla2xxx a port number that does not depend on
PCI config space, under any hypervisor. I am happy to test a patch on
the customer's DDA guest.

Thanks,
Laurence


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064447;
	b=AZTxj3A5rZTlWx99e1AJQ0Xr8/wnjF0WVs1qoOHMBsvski5KK7QCPd3HA3fO77nuKTV4
	 7EeaHYFrgwYNSBAU9xnDFQf4akdnictYT3qPd2DZRRBNZSs0R7Xh9SmwY7yDAbsl3sQkv
	 ApCwd9a6X5hz0so+eEWFXswALLR+vibdnoAVqnXaunlCL1clhwDX8i6dGugGd8DHGzfZh
	 eVnOUutJKtwS1+3OL/p5yp2zRo18k0rNA5YAHDvs0u65ZDvVd9vkRFVqdGuNY2j5BVaC+
	 rmn3DzMDsJmbbsAP2CUWvFIRhgelAlPFAeaygEX3igeBAvb8ESalz5U7zOjuIWUU3Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064447;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=cbWwAcQq4uRDikoBSCyhCaJCcw0pytPybYrMp+gi6BY=;
	b=bJ0Ci7e+viwO7io5BFv32KCVOba9oOaRceOSj4pV0Aer/FcknbAz0Alrq7fxsCvN4RPE
	 etkzM2pjreXHlqbjQN0ImU1WWMF3I/X7YVqGLDJe6StSmCtaDldMJ4BjA3H0th8tUrDpw
	 CfknfasRlW11ITM+YPo0t6rWgzp4ZXZXnNYE0IwaT1sgAO2k4P2Oz6pPdIJ9WzH40fpR7
	 7J7wxp3GkXT6KVW8gbyUnPjgNzMpY/lho42K0vaE89dgWwlWf2hXf+asj4l/pNWbuH3fk
	 N2hKQXH8eyC7CqP4c5eZVho9v10WE9gpnhca9u6DVlaVtbwJYxOprISpWpak5oaQ9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="isoiA/1M";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BNGhKGvB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77769606EEB5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77769606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isoiA/1M;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BNGhKGvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794064445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbWwAcQq4uRDikoBSCyhCaJCcw0pytPybYrMp+gi6BY=;
	b=isoiA/1MqNm7NIIxWctRGfrrIp2yFjOXgZ/eql11LDg7cvACtO0LYoo2kfq9hFgZ9HjsrB
	wrfsF7L7UXJFXd3U8gpPNAQtFTXsTHOJDL/v1uDjM3tR8RckoTvT0LbMN2MHYWkBZGmAdi
	zEd589+3+C9XKc7/8OYisBTtW/e2pgc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-ocGzVKZEOrmAS_sKgp9cDA-1; Sat, 07 Nov 2026 10:14:04 -0500
X-MC-Unique: ocGzVKZEOrmAS_sKgp9cDA-1
X-Mimecast-MFC-AGG-ID: ocGzVKZEOrmAS_sKgp9cDA_1794064443
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so39044871cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794064443; x=1794669243; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cbWwAcQq4uRDikoBSCyhCaJCcw0pytPybYrMp+gi6BY=;
        b=BNGhKGvBDH/eOwWGXi7JOM7zNagjpt537akmEhO87/lJZ72KDbFlCMkAhV0gSDbtAl
         MF390plYheI3/LFt86NbYLD1Gi6di/f9Ph/WkZGyeVCNHe1LGQ9ON0tMrDxoPc8zV6XT
         HIvf688FdFvydUO9ePGNSh09XzNrryrrz9Snb0saqBX9Wt5xFZ275qtRFxSfH1MuRP2r
         bn/0RTXTA3HpizEcTN/H8XwuDg/zw0PhWK8qvnn6xFG5qxU58/fJZJQqPYRvXfb9l8/N
         vM/OYjVOXKUq+E04GrQrfmNEDkaqNEC5FLbrUwQxrcE0HhtpkKZmq31luGUmeLz6bOIQ
         9L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064443; x=1794669243;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbWwAcQq4uRDikoBSCyhCaJCcw0pytPybYrMp+gi6BY=;
        b=utvlj8J0qp7FcWODsFRkbinThULnaX9vZ5DdbueZfXiFYeLyhl9Rp+Tw7DwANeDCSN
         HHUFSpA0J6kCWkNz/8aC8dlaHw3bCGcABUZObwRxvZcfJF2ZyuOzI/Oijjbl0VjAf+Xy
         FChKHYbHLkFWC2mC8z/i1HUVvWikjbmkHYVx1yO0CBmaJ4iZtSgfsOcCv5G+eYRlMbnI
         0M30Qu81RoLKLJolF1U2Ve4P0vnCgy/ywleflrt0MLhORml2s4sTXdFRlT1jjPWc1Tsr
         TgEXPGBoWL9AZ4zCcAGqWeRqErdEXatetwu6Cktyys7rTR2NCvvgHZF11vQNRYKl9wie
         5G7w==
X-Forwarded-Encrypted: i=1; AKwUvByMR+ZREmkD9xK3didUZlYHAiFnEof+BW/6t0gmpllDIrHLXyJ62vkAfyCefoCaOxmyFoIildogNKwhdmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OQkAvJZUIH9/+15BbQn5Bnv1s/zHKhKwyPP8QGJRyv8mvk1PT
	DSwPP2b5YuciARNDAPHjENYeWbYAPAeIri/U1x8zeOdJYIJl5I/EmCpjLRKTeOxYRj/mmDfjjrq
	WBtgeWB6E5K48oVOPiqo8vkvUGH0CNa0NrsWO1H10fq9cwQ/Y8eAxVnaiyKt3CPpkXQ==
X-Gm-Gg: AYBFou04/LuOevt2DoOE6IURpQY8Dk49+GyyKzJ07nmxpuNvI8MDQiKoRR39wtOgBXH
	wuZ8QzA7XQ/rug1TWwkCCGjE0VJkzWZw1dhCWGQnnkKd/2ftaUFoPvzaNYdeJ7FLKh2J+eEKsZ1
	O9OkgC8ELEe8TfUJEIw33iztLKWZfb6025LyOtSkeB44vM5TXSQoMXpv3f7FoqQD5znqtjndKjV
	2TYpyiFhpqFv/zC/CVoV4gceHEt/nofyYcdYnDlkZ5nDDIuntaTkmQqbkXNu2zFUUiMAxOJoZjj
	uDaMVDBAKEwUR42fYMiT8mi6dW05o6KfA9HjBBu32FdlfxZGyEJjIrgMgdJF6YdCvuf54zmPQ+b
	sIY15GOE6bj8i+A5jj/yn7Pp82AW2oPFuBZfM1gtztF6nCYk0La4EYsOoliefUW/Aq631aZUt64
	g62C8k6NPGX8xBkM2BHTAX1trXxx8b8YOhSXMJiC682/ud6oKpO1+I3BOEzag+7aNrW2glwg==
X-Received: by 2002:a05:622a:9017:b0:54f:863d:92c0 with SMTP id d75a77b69052e-54f863d9456mr34737101cf.65.1794064443252;
        Sat, 07 Nov 2026 07:14:03 -0800 (PST)
X-Received: by 2002:a05:622a:9017:b0:54f:863d:92c0 with SMTP id d75a77b69052e-54f863d9456mr34736571cf.65.1794064442628;
        Sat, 07 Nov 2026 07:14:02 -0800 (PST)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a9csm48127661cf.11.2026.11.07.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:14:01 -0800 (PST)
Message-ID: <080f3cc7097c9a8191e4fa2f03ff2d67d0640f40.camel@redhat.com>
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
Date: Sat, 07 Nov 2026 10:14:00 -0500
In-Reply-To: <MN2PR02MB68634FAAFE0BA7C4DB3153D9D4772@MN2PR02MB6863.namprd02.prod.outlook.com>
References: <20261104222541.2675051-1-loberman@redhat.com>
	 <MN2PR02MB68634FAAFE0BA7C4DB3153D9D4772@MN2PR02MB6863.namprd02.prod.outlook.com>
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

On Thu, 2026-11-05 at 00:46 +0000, Michael Kelley wrote:
> From: Laurence Oberman <loberman@redhat.com> Sent: Wednesday,
> November 4, 2026 2:26 PM
> >=20
> > qla2x00_set_isp_flags() derives the physical port number from
> > PCI_INTERRUPT_PIN, and the port number selects the per-port VPD,
> > NVRAM,
> > NPIV and FCP priority flash regions.
> >=20
> > On Hyper-V guests, pci-hyperv returns 0 for byte and word reads of
> > PCI_INTERRUPT_PIN since commit fea93a3e5d5e ("PCI: hv: Return zero,
> > not
> > garbage, when reading PCI_INTERRUPT_PIN"). Commit 7268e509b43a
> > ("scsi:
> > qla2xxx: Handle INTx not connected while passing through") then
> > falls
> > back to PCI_FUNC(). With Discrete Device Assignment (DDA), each
> > function
> > of a multi-port HBA is presented as function 0 in its own PCI
> > domain, so
> > every port gets port_no 0. All ports read port 0's NVRAM, pass the
> > checksum and register the same WWPN, and nothing is logged.
> >=20
> > Without that commit, port_no underflows to 255, no flash region is
> > selected and every port fails with "Inconsistent NVRAM checksum"
> > and
> > falls back to the default WWPN.
> >=20
> > pci-hyperv only zeroes byte and word accesses within 0x3c-0x3d. A
> > dword
> > read at PCI_INTERRUPT_LINE reaches the device's config space and
> > returns
> > the real pin in bits 15:8. On Hyper-V guests, use that when the
> > byte
> > read returns 0, and warn if the pin is still 0 so that duplicate
> > WWPNs
> > are not silent. Bare metal, KVM/vfio and other hypervisors are
> > unchanged.
>=20
> There's a patch in flight [1] that kills the behavior that your patch
> takes
> advantage of. I don't have knowledge of the full details that
> motivated [1],
> so maybe Mukesh Rathor or Wei Liu can add some info, as well as
> comment on the validity of what you are observing as a possible
> work-around to the qla2xxx problem.
>=20
> Michael
>=20
> [1]
> https://lore.kernel.org/linux-hyperv/20260913232255.2801797-1-wei.liu@ker=
nel.org/
>=20
> >=20
> > Tested with an equivalent change on a RHEL 9 (5.14-based) guest
> > with a
> > dual-port QLE2692 (ISP2261) assigned through DDA (Hyper-V host
> > 10.0.17763):
> >=20
> > =C2=A0 before: both ports "Inconsistent NVRAM checksum=3D0xffffffc0
> > id=3DNGKP",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 both WWPN 0x2100=
00e08b1c5586
> > =C2=A0 after:=C2=A0 port_no 1 and 0, NVRAM valid, WWPN 0x210034800d7065=
bd and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x210034800d7065=
bc, fabric login and FC-NVMe localport
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 registration on =
both ports
> >=20
> > Also tested on bare metal (ISP2031): the new path is not taken and
> > port
> > numbers and WWPNs are unchanged.
> >=20
> > Signed-off-by: Laurence Oberman <loberman@redhat.com>
> > ---
> > RFC: this relies on pci-hyperv not virtualizing dword reads at
> > 0x3c,
> > which is an implementation detail rather than an interface. It is
> > posted
> > as the smallest working fix and to start the discussion. Feedback
> > wanted
> > on cleaner alternatives:
> >=20
> > =C2=A0- Hyper-V (linux-hyperv): could pci-hyperv expose the real
> > =C2=A0=C2=A0 PCI_INTERRUPT_PIN, or provide the physical function number=
, for
> > DDA
> > =C2=A0=C2=A0 devices? Some drivers use the pin for port identity, not o=
nly
> > for
> > =C2=A0=C2=A0 interrupt routing.
> >=20
> > =C2=A0- Marvell: is there a firmware or register source for the physica=
l
> > =C2=A0=C2=A0 port that does not depend on PCI config space? CSRX_FUNCTI=
ON in
> > =C2=A0=C2=A0 ctrl_status is a single bit and would not cover quad-port
> > =C2=A0=C2=A0 27xx/28xx/29xx.
> >=20
> > =C2=A0- The check is x86-only (hypervisor_is_type()). pci-hyperv also
> > =C2=A0=C2=A0 supports arm64 guests; a better way to detect a pci-hyperv=
 bus
> > is
> > =C2=A0=C2=A0 welcome.
> >=20
> > This has not yet been tested on a 7.3 kernel in the DDA guest;
> > testing
> > was on a RHEL 9.8 backport. The upstream behaviour without this
> > patch
> > (duplicate WWPNs with no warning) follows from the code and has not
> > yet
> > been reproduced on 7.3.
> >=20
> > =C2=A0drivers/scsi/qla2xxx/qla_os.c | 40
> > ++++++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 39 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/scsi/qla2xxx/qla_os.c
> > b/drivers/scsi/qla2xxx/qla_os.c
> > index 3c412c7fb6fe..4180d3f15231 100644
> > --- a/drivers/scsi/qla2xxx/qla_os.c
> > +++ b/drivers/scsi/qla2xxx/qla_os.c
> > @@ -24,6 +24,10 @@
> > =C2=A0#include <scsi/scsi_transport.h>
> > =C2=A0#include <scsi/scsi_transport_fc.h>
> >=20
> > +#ifdef CONFIG_X86
> > +#include <asm/hypervisor.h>
> > +#endif
> > +
> > =C2=A0#include "qla_target.h"
> >=20
> > =C2=A0/*
> > @@ -2704,6 +2708,40 @@ static struct isp_operations qla29xx_isp_ops
> > =3D {
> > =C2=A0	.initialize_adapter	=3D qla2x00_initialize_adapter,
> > =C2=A0};
> >=20
> > +/*
> > + * Read the INTx pin used to derive the physical port number.
> > + *
> > + * pci-hyperv hard-wires byte and word reads of PCI_INTERRUPT_PIN
> > to zero.
> > + * With Hyper-V Discrete Device Assignment every function is also
> > presented
> > + * as function 0 in its own PCI domain, so the PCI_FUNC() fallback
> > gives
> > + * port 0 for every port and they all report port 0's WWPN. A
> > dword read at
> > + * PCI_INTERRUPT_LINE is not virtualized by pci-hyperv and returns
> > the
> > + * device's pin in bits 15:8, so use that on Hyper-V guests.
> > + */
> > +static u8
> > +qla2x00_get_intx_pin(struct qla_hw_data *ha)
> > +{
> > +	u8 pin;
> > +
> > +	pci_read_config_byte(ha->pdev, PCI_INTERRUPT_PIN, &pin);
> > +#ifdef CONFIG_X86
> > +	if (!pin && hypervisor_is_type(X86_HYPER_MS_HYPERV)) {
> > +		u32 val =3D 0;
> > +
> > +		pci_read_config_dword(ha->pdev,
> > PCI_INTERRUPT_LINE, &val);
> > +		pin =3D (val >> 8) & 0xff;
> > +		if (pin)
> > +			ql_log_pci(ql_log_info, ha->pdev, 0xffff,
> > +				=C2=A0=C2=A0 "Hyper-V: INTx pin reads 0,
> > config dword 0x%08x
> > gives pin %u.\n",
> > +				=C2=A0=C2=A0 val, pin);
> > +		else
> > +			ql_log_pci(ql_log_warn, ha->pdev, 0xffff,
> > +				=C2=A0=C2=A0 "Hyper-V: unable to determine
> > physical port, ports
> > may report duplicate WWPNs.\n");
> > +	}
> > +#endif
> > +	return pin;
> > +}
> > +
> > =C2=A0static inline void
> > =C2=A0qla2x00_set_isp_flags(struct qla_hw_data *ha)
> > =C2=A0{
> > @@ -2887,7 +2925,7 @@ qla2x00_set_isp_flags(struct qla_hw_data *ha)
> > =C2=A0		ha->port_no =3D ha->portnum & 1;
> > =C2=A0	else {
> > =C2=A0		/* Get adapter physical port no from interrupt pin
> > register. */
> > -		pci_read_config_byte(ha->pdev, PCI_INTERRUPT_PIN,
> > &ha->port_no);
> > +		ha->port_no =3D qla2x00_get_intx_pin(ha);
> > =C2=A0		if (ha->port_no =3D=3D 0) {
> > =C2=A0			/* None of INT[A|B|C|D] may be virtualized
> > by vfio */
> > =C2=A0			ha->port_no =3D PCI_FUNC(ha->pdev->devfn);
> > --
> > 2.56.0
> >=20
Hello Michael,

Thanks very much for the information. I will follow the thread.=C2=A0
Our main pressing issue is any guest on HYPER-V with DDA moving to
RHEL9 from RHEL8 loses functionality for the pass-through qla2xxx ports

Regards
Laurence


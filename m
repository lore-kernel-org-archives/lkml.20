Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793289935;
	b=Y1A5uCZQ74NxRX6v4E1Gs+gCAke++Puqs9ZNtaSjhwv1EC3Wx21So2HGUm3mOIrxDKWW
	 QE8fzPbIej8II2cSvWD4W/dp2wm/aZQd7hpb4ykHE/JimatTAwiodTsPQAxNefu3Sde9T
	 8wmRYRAXA3DTizvx0ffOhUpXZjpEBHYqMIRWCCVIUrYJPz0ZJiysq+cmZjOaia0WI96oU
	 1WzYuFuCyN6IBmR6RXd7Bjm5Vvdl++frkbbx49tygZanhqOolu/5Nd01p0B8NhYS/Q47v
	 WTngdbyYt6uQM8dw5kX8ouKlOIeGcsNUDCFnd/rsrPg99UjY43NsTD4sAXmtEk+px8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0JXYX5EZ25gVw84vUFaQsahBWpllYocPrdhCQ3cIQzo=;
	b=CZ5cYjfVp3WiA9UOzQ0yTxOI8riV0JPIdedp+R5GJPaeLai15dIBQzAwGuOWH0My8gz7
	 /E4WjzwG2kPFoD4A1WRpaTFaNdCTstwq0w13wi6j5csLzZhnQdof4LT9TC+dQz/Ah37mU
	 10X/eesV1SHOEbbiyuqCNsVRHvjTBUQ5ixsUDh6Hx+4Y4sF9aEzaHcAfinnlEAfgeAYIL
	 Wp9GytzNkuxT4FJAcMCro8XPFAkpFqZo4sR8bmQVOGRuZGK9zAjzAX2hk0r6UdS6ayTQ1
	 f3Zg4FMAA8NZhdrWpzXdUZorXFEKG3T8tKQjuZVi2wTWn35us/pIXxx26Ye9t6FBNMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ2xobcJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7EF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ2xobcJ
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea63087d6eso2254925ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793289934; cv=none;
        d=google.com; s=arc-20260327;
        b=sh9S8WJqditVRL7RRk860UYyj6h8mdrDv+pwGDwj2qsJ5+wQt6/L5QdL9IwvzSzmpY
         7wi/LzcE/qOqGM3M7SOKpL4baFvfbNdpO9oPcuQS5Zelab4yNna0shEnAOiPaiAcCNG9
         JPDfXciWIt7UxtsDlcZrWaAfHf+p7vhaSAr3J2ex57P9PSJcM9GwBKkXzLwD6t8g6aVk
         ijvi0G7nwXq+aoBWEdHmGPkRR/KNeMJc4HGZOu8EokSuyQvYQEd7tpiEbqxcS2FBtj8F
         HfuR2+Yil1mjn2FO4dSZUKlfZDN63MDu5dkqQgc0lkCy9sHmCQ/IUwpZtX28GRfIV1Ui
         83yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0JXYX5EZ25gVw84vUFaQsahBWpllYocPrdhCQ3cIQzo=;
        fh=XbOSVZFB5cyINLsQzDQETbX0Px3ANjbyCt5LhZOC3v4=;
        b=f+6TYHe2DoCoW5J/LLeiqVoPfrLQUSR1h7F/VZ3AF2R3jXxbIfyHTbjdGw7KVcTJLz
         yhesWqMUHRXx16cRoDbBTgmmzUCcpdkJGIs6hmtbZK7QD85U+oQiSSiixwMiav0VyEC3
         80AaXhVRcWn+LERwlFNthOZgcIcy/LRLGrfzbnjy1l/kBJVUo2VRrF4Qi/XixKGKvtky
         /2zmiwysQpMe6wQImMBxp7Yqa62HW2OgCjNBs6hfHzRf1zRQVJScC1DSWe8Uoj3fmlB6
         cWBF1CrOQ4BxttWj7JycxlVtDStuI624fNO+NdVpvXLtTSTVef85GDpJeVoTleH/sRDs
         lBEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289934; x=1793894734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JXYX5EZ25gVw84vUFaQsahBWpllYocPrdhCQ3cIQzo=;
        b=zQ2xobcJc2WCeB4yrnqPsFba6JAqAxmbplihqRAZVzOx3p6GYApbNdp6xWFacITZc+
         uwpUIiLzmiOyKFfoT//wUpMH1wleyUVBDH+pvUP6p7Es9PfbA9zl6fl7XItOMNqk6IQh
         2rExyyBIl60B2AnEp0071wn7v+hFF5fai30eee/ahUfCPbbGLLYdXTOFLdsiN+JWRXYa
         jJ6nIuukOfywIlaXJ3BU2IUS/z6uIGwDtqUocn1ncWqiGpajme+zq0JGiFwsd6XhTUnY
         uuNE8Xh1I1hrvJ2qTH20vUb5F7KQ8fwfgegS6y3RIq9eAkYuzVhm5sGnoPAY4PY6FMfU
         KVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289934; x=1793894734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JXYX5EZ25gVw84vUFaQsahBWpllYocPrdhCQ3cIQzo=;
        b=g9b8wRBVORfXAj323g7WGVC4BqFGuuG6qOHlNc6LuHXDh3mLVweitE3aTqsDAZD2iA
         NNEXXObAiOqHrmZeNCrhh55V53EoLX161/kFMZf2tz02gpzO8dMN8Q9KBMjrlcyQmOVK
         yi3ixVce5BiaZ1B2s6i7vEWzi0tC9y6meISvDJxd2YgQmGq5G5BYQvwzSmTd9CrC3A9E
         +aBaHQX7fuLQ27VEcA+i/yduMA+wEn0JQOtTcBSUpAZs0qpMwAj/YNKkz8V3PjTeZ7jO
         BOKQ1SNVoVoEAayBsdeK3sasc6BqjuRJhAWD2IPRyJF5eXYnjwGb6R/R2HMsTAa4o/3Z
         K3dg==
X-Forwarded-Encrypted: i=1; AKwUvBw97YPDGQ+InLjpZoAiofJBJv4+eRhNbvT/hoRusPWQU2PLg3LgS++XMIliI6xdrvptlu5D8OO96s8BAig=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiz+QB1/IRb+P1Mec9cUh4UZcBi/75JLKVZuPQiyEgAu83Lbpr
	P51Fn0gRjeUjSX2MxYHRmNj5iTY6z/MibJChjl8U9WNWJbLMcKjenvtUqV6BVaAGbR4xJVa9duM
	LYjZZ1YhXli+Y8VWpKnxlKbvEfWymGSY=
X-Gm-Gg: AYBFou0/RquIBNadM5zfrpOoZ52DNtuXzjB1SZyqqYa3yTlSrcUg+cOTP/Yt8799tvO
	Mj6pkRSyju7ir8k9BE13WWKCa4AbaKVdF+R1dpAHOX6Vnd+L0nn9Y/eRFrA0ti9+6EUtXvnNcNJ
	Hi1Sjx8j4hPcpGuJyUFXEjaYcp3YXrllwojLSrQMhTUVrRy8q0liUsLPCwQNz61jf8IEoqr7BU1
	bsjEsjXxJ4+xIYmI/vcraJw/D4FwjS8g2V7w88MwtkEyRdERiCudBgKD6La6HCDnVjYVj7C5Pr/
	mHXCFbMvCzXGTWNTCrQCfVmZ2PFD14kiWJHF40bGbfLcI1oFdGt6IHSu0vsL/uDY99QPbSqGfhU
	yv6xbGT/c2KIoqDxsuxvw623uc56+wd/mIAGDYU/L/oIXMEDgR6J3engCg+2z8iGNhk58d21W/D
	mkRv4dd6KSMMNH9Om5IScZh1U=
X-Received: by 2002:a17:903:2f0c:b0:2df:8909:f719 with SMTP id
 d9443c01a7336-2eb004ec779mr101640265ad.3.1793289933884; Thu, 29 Oct 2026
 09:05:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029151422.56791-1-mike@fireburn.co.uk> <20261029151422.56791-2-mike@fireburn.co.uk>
 <06b18cb4-cd1d-48b8-8944-dd1139ad18ad@kernel.org>
In-Reply-To: <06b18cb4-cd1d-48b8-8944-dd1139ad18ad@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 12:05:21 -0400
X-Gm-Features: AclHuK_SzmCZ77Ax6albOg9ENipNfBXsoIiRBPAplK8_vOS9447MyCGtIC5RQss
Message-ID: <CADnq5_PbewORwc3Wsqw3VQESz3RNAKJy+KdnWHx9J1rKg35-Hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: runtime resume dGPU on ACPI notify from
 its own node
To: Mario Limonciello <superm1@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, amd-gfx@lists.freedesktop.org, 
	alexander.deucher@amd.com, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:26=E2=80=AFAM Mario Limonciello <superm1@kernel.=
org> wrote:
>
> On 10/29/26 10:14, Mike Lothian wrote:
> > On BOCO platforms the SBIOS can signal a display hotplug on a powered
> > off dGPU by notifying the dGPU's ACPI node. On the ASUS ROG Strix G513Q=
Y
> > the USB-C DP alt mode lanes are driven by the Navi 22, and the CPM
> > D3cold table handles the HPD GPE with only:
> >
> >    Method (_L05) { Notify (\_SB.PCI0.GPP0.VGA, 0x81) }
> >
> > Nothing in Linux listens on that node: ATIF is bound to the iGPU and th=
e
> > dGPU node is not an ACPI video bus. If the dGPU is in D3cold when a doc=
k
> > is attached it stays off, no hotplug reaches userspace, the external
> > displays stay dark, and the level-triggered GPE keeps firing until the
> > dock is removed.
> >
> > Install an ACPI device notify handler on the dGPU's companion when BOCO
> > is used, and request a runtime resume on 0x81. Runtime resume already
> > re-detects all links and sends a hotplug event, so the new displays are
> > picked up; the device autosuspends again if nothing is enabled.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 31 +++++++++++++++++++++++=
+
> >   2 files changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu.h
> > index 7974f9b7944f..deb63122828d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -641,6 +641,7 @@ struct amdgpu_device {
> >       bool                            need_swiotlb;
> >       bool                            accel_working;
> >       struct notifier_block           acpi_nb;
> > +     bool                            acpi_dgpu_notify;
> >       struct notifier_block           pm_nb;
> >       struct amdgpu_i2c_chan          *i2c_bus[AMDGPU_MAX_I2C_BUS];
> >       struct debugfs_blob_wrapper debugfs_vbios_blob;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_acpi.c
> > index 7f5abb03be1b..a4041f90b374 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -1280,6 +1280,23 @@ static int amdgpu_acpi_event(struct notifier_blo=
ck *nb,
> >       return amdgpu_atif_handler(adev, entry);
> >   }
> >
> > +/*
> > + * On BOCO platforms the SBIOS signals display hotplug on a powered-of=
f dGPU
>
> Although your system is a BOCO platform; I do think this same thing for
> this signaling to wakeup could apply to a BACO system too.
>

I would doubt it.  In the BOCO case, the OEM has a mux on the HPD pins
and redirects them to the EC when the dGPU is powered off.  For BACO,
in most cases that is just PCIe add in board so there is no way to
redirect the HPD pins.

@Mike Lothian does your system have ATIF?  This is already code to
handle this.  It sounds like it's just registering the wrong ACPI
node.  You should be able to use the existing handler.

Alex

> > + * (e.g. USB-C DP alt mode HPD wired to the dGPU) with Notify(<dGPU>, =
0x81)
> > + * on the dGPU's own ACPI node. Nothing else listens there, so wake th=
e
> > + * device; runtime resume re-detects all links and sends a hotplug eve=
nt.
> > + */
> > +static void amdgpu_acpi_dgpu_notify(acpi_handle handle, u32 event, voi=
d *data)
> > +{
> > +     struct amdgpu_device *adev =3D data;
> > +
> > +     if (event !=3D ACPI_VIDEO_NOTIFY_PROBE)
> > +             return;
> > +
> > +     dev_dbg(adev->dev, "ACPI notify 0x%x, requesting runtime resume\n=
", event);
> > +     pm_request_resume(adev->dev);
> > +}
> > +
> >   /* Call all ACPI methods here */
> >   /**
> >    * amdgpu_acpi_init - init driver acpi support
> > @@ -1325,6 +1342,14 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
> >       adev->acpi_nb.notifier_call =3D amdgpu_acpi_event;
> >       register_acpi_notifier(&adev->acpi_nb);
> >
> > +     if (!(adev->flags & AMD_IS_APU) && ACPI_COMPANION(adev->dev) &&
> > +         adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_BOCO)
>
> I'd install the notifier for BACO as well.
> > +             adev->acpi_dgpu_notify =3D
> > +                     !acpi_dev_install_notify_handler(ACPI_COMPANION(a=
dev->dev),
> > +                                                      ACPI_DEVICE_NOTI=
FY,
> > +                                                      amdgpu_acpi_dgpu=
_notify,
> > +                                                      adev);
> > +
> >       return 0;
> >   }
> >
> > @@ -1344,6 +1369,12 @@ void amdgpu_acpi_get_backlight_caps(struct amdgp=
u_dm_backlight_caps *caps)
> >    */
> >   void amdgpu_acpi_fini(struct amdgpu_device *adev)
> >   {
> > +     if (adev->acpi_dgpu_notify) {
> > +             acpi_dev_remove_notify_handler(ACPI_COMPANION(adev->dev),
> > +                                            ACPI_DEVICE_NOTIFY,
> > +                                            amdgpu_acpi_dgpu_notify);
> > +             adev->acpi_dgpu_notify =3D false;
> > +     }
> >       unregister_acpi_notifier(&adev->acpi_nb);
> >   }
> >
>

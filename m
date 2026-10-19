Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25684F3ECD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412796; cv=pass; b=mKP4JMXDBmHurWaynt9cOsf2lA1/8MLmG5C+91pb9yzBKKOYGjCeghjQbBqC5EFhM6mK3gbIHZIwRzESiscQiCbDE/UI0jDo1S1STUkrHy5JeLYNQGtG34IFa6EuLmbyEbK3VpV24baJva7AuPLCFForcJtgzMBcSCDN6In/gfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412796; c=relaxed/simple;
	bh=Qyaw4WaZyQRRV/Cc2XdlJP27n/ju5hKMwRZCMx1IgrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFwS7i4LajGezkzVqnk5h6FhouN7SUx5/1HWtm/LmfNbkPE7Eu5t8JOv9QrpcTz0LSjUQrJ7jvSVfXjHnnEyz94S2XAl3TRj3n+8i0U0ft+dt3yQALLlc60IBt1OGM3hHKqqPqh3qYJchRzqbqsccA5hVyXg2t9mxnn0zIYqwfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=Xh6hcOND; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="Xh6hcOND"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso731307e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412786; cv=none;
        d=google.com; s=arc-20260327;
        b=NZu/w1kyZCPEw5wzaGsNtAO+xfWRvRSzoFEYXtvveaONL7kcbt1DfqYQYaDdogd2Ia
         iGPAAXXrzCu4BBVaq00OIBlNQsAL7Jm4+fWGKQxoynfXhwypupgaERLV/QPGYAmz7ibA
         rQ5AfAkdbBJJPi6fwjSzD1R8u//W6u+Gxp97YHq6crB1B8ZnvYpaPUdIWFVfa62Moypq
         vnlqA+8nN+rZx4Rmyo4nSHSslX/o0eUvIL7mTQsFIs5UCMj/VKSB8bD1p8PVPUc1B+kV
         Ad4hsq2gAZn7Oo7R50HrrfwNyTaBDZcuop0Syk0m/+yfrnws2SHUNA0gfkolNl5fqLpz
         oA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        fh=KOKGY03aTejKXpW3OrimcGdPaB3pHxyyrIGglY8ZGc0=;
        b=dzthBW+9r9he6JxQT09f2UWJc6QCIa1RhvX+TWPmfjy/kkLW/SWyg30jCQY82fyToP
         6Jmg568JqB0OjS0889MLmzqYZBOg7Go0q6DCzetPizTXUtbBSNV5y/pE6znaqv6JbIdX
         8t3o5GLOATLPMTb5QTAKlUVFby9LvTbr+YPEtFPyJbeUF3LvXnn2Qmg54TV3fHp80+GF
         4vdWHEyDpfAwARP/UeUpbgab5sdumoZKtW76oYKH8EQ+PqwXljb83HrNNrptCQuKfnY4
         z/sOZGxSF63teCms4ClAG582l9/edOAlId6lZF7XLtFed6jxYTXdFjA/pOBNxyQcxbMg
         oTtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792412786; x=1793017586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=Xh6hcONDQrCIQw1D3jpxTmBxrXHCClzUiOLL3X/2YhSkyGUXc1fCi/pM0gLhXa11c4
         P5pSaOwzvXVVOSzUPLS9y4deF9p2i3yw4tJ3JH74R0K6w7ycMi6eVVfBhgURZcWLyhmu
         0Wo/UxFuWMSxnmiaMmbo8NreqJc777FPDkftCqu0wc6AUki7r0XsaI7bdLDiZVIEaVPa
         49U0/Vf8d3w12jGPyKSQSVFHC9Ra5kgKC3GZDB/vVivFaKTGOKT5sWuDt/JgSDK+4eoy
         uETzK+T4SC3warb3CqTgXPPJOPXuucr8+KDu6AsV6vZGiCEbxnE+I9GT32Og2cNAAbd5
         qcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412786; x=1793017586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=munPPvNJkKzt4dRfLsr5TvWJ2JVzPDSCv53mtrUwk0yk4qNPOeT8OyY72zTqtgYuSh
         hov7sYPV4dpCGsTlcKb3rONjcRPeAjBs32uxeGdC5wrMXjjGrQVvUKEcpNxK/AdOy6Ah
         rsgRfcViZ9ImLzovQBdQUw7fwXNLew1NCpGrrMwSqB1XMcSqPCY9xV+Aq3n2Wkr3HVyP
         3vzKFuvrwZANIzpaUl9mXCmBfFnGCUmd4Yqb5Zs35K3+FJka+VIDAZHgn++7MPRKvKqG
         bsLKe05zHBEUgTfLzQ4bwzkK/LISSZkp3Wi9aMi61LDrVngGicZfPJcj6+tvlc61TdOH
         edfw==
X-Forwarded-Encrypted: i=1; AKwUvByVzi5QgA/cgMGYET7mgmVw1pxy+tWXL12fLacmurUPtqlYtBfBCLsW/GTKWQVu5HLUXcJCMVZVqPUh1Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYKem7Xvu244wKUfqfnfiJt+7Xgh8/H6JJ70Kc8UvkZNkegM2zBY
	C1qrFtvPQj37Ukf3zoE8M7vmnMyxtlWEAFbs8TtyWqrm6RlNDGYev+yBc0jD6XE7Yv8NbpOj+Yv
	EDxnjYKVdjq/QFKcvK3ZYmKKxd7wQ+dAj5Jm6nELVFg==
X-Gm-Gg: AYBFou0FDsBJ8XmkkEKE7gb125KLpi0AVKL/nEsnWiNLiELnieS//fhn64VYiRMFGsL
	pxBcwwlcBNRi+HQhMnPAFinDTSWt7kUb721tLTcW5e6gFLyFnoQK7Z1kN9MPhyH3A8EGmEazSMX
	x/AFrYvi7cMiMilfTYaxLfLOSTxw/EkTns7flH+RUq/VoikFLskjPy5iUz7tbB4k0n1431/TXbT
	bjc6uk3K8HW59tMMlMQcYBUDEoFqdFJT/hYgoNE0SRzSs4KkgrhhCtc1RmSIKIFLXkmuWkycHce
	j2jfIc2nsaTXpY+M6/2QXz9vA+Q4fwczGWTYNMn6ffpEOiVRAAFdwznLF4zJZb5Ed9BRyDrEjsl
	YBZt36nG+ng==
X-Received: by 2002:a05:6512:3d17:b0:5be:41a5:d9ed with SMTP id
 2adb3069b0e04-5be47936d9dmr3010694e87.37.1792412786489; Mon, 19 Oct 2026
 05:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
 <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
In-Reply-To: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 19 Oct 2026 14:26:15 +0200
X-Gm-Features: AclHuK93P2jPD4PyUwT4dOLVOgxbBF4VVZAqE1H94JjIS4xMMkZCEQTzudX9ZIs
Message-ID: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com>=
 wrote:

> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
> thinks seem not to be working with that interface.
>
> Im trying to debug what happens in that condition; I will need a couple
> of days I guess. So far, this is what I could check.
>
> Any feedback on the test or debugging would be appreciated.

Hi Gaston,
Thanks for digging into this.

The patch only changes when the VCHIQ bus and driver are registered during
boot. So it's enough to check these two cases to validate the patch:
- without my patch: dmesg shows the "unable to register with bus_type
  'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
- with my patch: the error is gone and bcm2835_hdmi is present in
  /proc/asound/cards.

(Since the Pi Zero has no Headphones jack, you need to test both cases with
snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never s=
hows
up, even when everything works.)

Could you check these two cases?


Testing that you can hear the sound going through bcm2835-audio is a full
functional test that goes even further than the patch: it does not only tes=
t
bus registration but also that the audio driver is working.

On my side, without vc4-drm, I can successfully hear sound through both bcm=
2835
Headphones and bcm2835 HDMI:

  # aplay -l
  **** List of PLAYBACK Hardware Devices ****
  card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
  [...]
  card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
  [...]
  card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
Headphones [bcm2835 Headphones]
  [...]

  # speaker-test -D plughw:0,0 # (HDMI)

  # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)


If you still want to output sound through bcm2835_hdmi (optional):

There can only be one owner of the HDMI port: either the firmware or the
kernel.
When the Raspberry Pi boots, the firmware first owns the HDMI and displays =
a
rainbow splash. Then it launches Linux.

There are 2 ways for the kernel to deal with the video output:

1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controller
   from the firmware and handles everything itself (this is your case).
2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), the
   kernel leaves the HDMI to the firmware and just writes pixels to a
memory area
   (the framebuffer) set up by the firmware.

I get a similar problem on my side when sending sound through bcm2835_hdmi =
with
vc4-drm loaded: my screen shuts down (but the kernel is still alive).
It most likely comes from the firmware and the kernel both trying to drive =
the
same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and the
firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to to=
uch
it.

A simple way to output sound through bcm2835_hdmi is to not use the vc4-drm
driver at all, and use simple-framebuffer if you still want a display.

To remove vc4-drm:
- Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or blackli=
st the
  module.
- Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-km=
s-v3d).

To enable simple-framebuffer, use one of the two configs:

  CONFIG_DRM=3Dy
  CONFIG_DRM_SIMPLEDRM=3Dy
  CONFIG_DRM_FBDEV_EMULATION=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

or, the older way:

  CONFIG_FB=3Dy
  CONFIG_FB_SIMPLE=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

(FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are only
needed to see the boot messages on the screen, with console=3Dtty1 on the c=
ommand
line.)

If you have remote access to your Pi Zero (either through network+SSH or
through serial console), you actually don't even need the simple-framebuffe=
r:
you can just remove vc4-drm, and let the firmware display its rainbow splas=
h on
the HDMI port.
Then you can login to your Pi Zero through SSH for example and launch
speaker-test.
As long as the HDMI video output is active, it's enough for the sound to be
able to go through, even if the image was not drawn by Linux.

But again, this full functional test is optional.

Regards,
Martin

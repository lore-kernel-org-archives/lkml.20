Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D04A7C84
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579763; cv=pass; b=qkMD2Y1IhdOIRGiX2PJBSWf+6fkXhYZR6lOlwFoDng4GRjYs3PGR6JIA1CJqgcTbfz3TpUUZQZm6JBga32/LcqE5hYiSaAd/d8ATjpO1RbgbCYZbgnqNijtJQCswpIZIPZvZYg8DWAZIcNmGC2k43KIyfKyEIGenua9lpMYVhho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579763; c=relaxed/simple;
	bh=SxMiluOD0uK5+ILAX1qVVq9oZ2A/QJmNeyQU2dGZ29c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+1//jdze/c56Dr4qW0fzhknN4v3tg+Ok2yNiEI6ARgUwYbKAdd3q/TC8bAJADK6nwVr8JgxDYpKs+d2gSPyAwrWSnoJwbIbTzSBQSB240LbQmDkrZYdr4PXM9/fP5SOuBiiUEUwhRCvgoMp1wzbGvyYFfAWkrrnl432Wsn2Wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5sU7hQ3; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5sU7hQ3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so172868666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789579760; cv=none;
        d=google.com; s=arc-20260327;
        b=l7tuS+87IQ3MlvOW59M24J/qCnuYt4mRn+Wo2IiuCU72uC+f9XUvlc5MU5rk+UzAbu
         cDRbu3zRuY8VGqNbz5wRaF1pNeSUgWliBtPC2za69T9E9WsK8gIFfDMMXk4ZyvOHtHDa
         K02QNaEiKjLQ0wl4nhSGg61R+tgLpg/gycT9rJE2ZWk0+yz/n5nUMF336t96UWVl/enf
         PjGBx6+z3v9/oF/n9tcKh9ppzumzOBMbdKQogp/uUfbW7KaSItkuTKdYQ04iqgbX344P
         BtDvMesSXt6mM3nzv4XUtt2OUeyD39yQrMf+JXejsCma9Fry+nlMhID9g0LMFaMf86pi
         +8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        fh=Bl0lV7ngNEGozbcwGGqT1qhT1y9q0/S/+Gg/SrJrLv8=;
        b=lJXa3b3GJfG9IzCF8Fw77yhclueQZZEugmM8/z8X10aZLCdqzEb/MrqMSebIlNSScY
         XmiLgAcrybQ2t5PrZJhCRWbd3f/GQwAU5qjtaxpaMkAhzNWji+5OPtaNkbYQXR1Wl6gc
         j2R+fAg9pDiJFFntvheEpEyrUitkEo0Qz+OQ9pINLvmmVVoYktBwR64r4mMT3FjGfQQz
         N47/WBkYQStvA8NqUtqVf8+cQu1ny47YN5wp45QpQBJrKQH9CAw2wnQ2dSJ8S32+lyUW
         X2OkiauGwk1IMUAtNfSKmJJEQh8pnZCJZP3A4epAPsoMvitE+K10JMFpUyC8iKzSPqqb
         czYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789579760; x=1790184560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        b=b5sU7hQ3GCD+ocTbm7CUFqMmSychwuLnFWguz1+RZbFsQl/y5MDpcVHlzcgYO9LRmL
         RqIatYKNkjEwDKwPPXokqZsxaYStOVConRKHo0U8JUApcmsEhDzupfQl/7nTuWPIPbbP
         wPZxEMhOz2eHoW6H2C5sSSjnfSvlnvIPmK0AOuQtEmrTn6f9W3ZSPblh5vp3EL7gCa3I
         sfP1FoeMbJUw31985PL3cjYAj1/gnl9LKmKW2XInqYtfEjRg3wLkK3bcCsAEJyJ0kNeg
         AHVq0lXDrFj77SZWwkfkPqG8IeMB2aI3Dk9wtEbza3c63y9jpC8ZtWwpR5VP5kFXoOI/
         bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789579760; x=1790184560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        b=raoFlnR6nM7v3ewRTIYl7blF7uU7/vmwK9NMjrxpuAxImG3utyQMsFaYAY5QMJ+uzy
         nHTwpZ4pTN79BrfZ1vcSG2yc/hwlUbI+HhE+PPMa+gK/nwHexDO8G7ndBnzs7FKu0RjC
         WXGAbGSDYYngKdL0057rEWlkzUarl1UJ0LKAoaVtZbnczw5LMlwBbswrOh3S2vxFWZtZ
         NlOoOgwkPWAsnsCJng889hU0KGfhUn7HL31MQudP00PRhz6MKaFyjD0gkeYX+WalTmVP
         qiiJKlJ19qYuHdgBoMNX4Vwc7/vXxGnCWA6C7XwfGH2ZAPEVJxf264mzb0sEy792ton4
         lK8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9ftH7745BFNMK6tNtLjl+5X5XD0E2JM52tQwOzvW3xb7Wv1ca7KaA7NI7x6Sj6RiHoElTpV1QwfCgzuc=@vger.kernel.org
X-Gm-Message-State: AFuF++l4vArtlEKjYx9RMc/XXafAu/voQ1GOvyTQquFaKiea1+WuKhH0
	hYXE/sytAXuBQjWsve/beLbnqe5K0e1Okknaxi/BGL8yNVHHyE368mlB+YUtAKpIa36F52e6f95
	6ljsVWg8LfW0bKZ0CwtLRKKMn1Sw/mICaBrbY22pV
X-Gm-Gg: AYBFou3SH+Box8clAOgGWTYlM5jY8E0kA33nMD4eQPwVWv+9B/Vze5pk8popFP3kFzD
	FShhxHl2rBo20sF84S4/FAvswaDohNlesoxy8SaigM2IDdS/EaGc6TJ+W7oSrcqL2oCxVpNH+a/
	yDXGgx9R/sZtOetUpEogTi4ko7yK0wjDOrsrjkLGso403RG/MeSU08PpF/IUBcLFd2ZgJ8RgZyw
	DAJz7ei8Uq1yrImCq2Y3qu+G6JeK56tBqn0QBF3HSh6oK9Q41MBtuVBz/0e3TRpPJt2e7MXgBUg
	OOJSWJtFWgHKTWliEbE7wFWepOorMxF6dmaX4ORGsh1C0fpFFNR4N5kd3To3XtiqovfBGogjqOT
	6nvt9pF02ejnYGlk1UvmD
X-Received: by 2002:a17:906:c114:b0:c29:52dd:317c with SMTP id
 a640c23a62f3a-c29e52ff5aamr253749566b.30.1789579759601; Wed, 16 Sep 2026
 10:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-4-dmatlack@google.com>
 <e099cbaf-3185-4c39-ae36-7f0e074ebff7@linux.dev>
In-Reply-To: <e099cbaf-3185-4c39-ae36-7f0e074ebff7@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Wed, 16 Sep 2026 10:28:52 -0700
X-Gm-Features: AcwNN1X8OtlPLlB_fEFGTTxlBHL1RWBLk55_RIeZg7bMhopD1i4pmTuVWaDvZaI
Message-ID: <CALzav=eX0gVrbWCnYGwfqPHUkoVxqdr2nw3Tx6Aqze0XOcuwzA@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:31=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
> =E5=9C=A8 2026/7/28 15:09, David Matlack =E5=86=99=E9=81=93:

> > CONFIG_64BIT is now required to enable CONFIG_PCI_LIVEUPDATE so that th=
e
> > domain and bdf can be guaranteed to fit in an unsigned long and be used
> > as the xarray key.

> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > index 3781e2b5f095..8af20f558086 100644
> > --- a/drivers/pci/Kconfig
> > +++ b/drivers/pci/Kconfig
> > @@ -273,7 +273,7 @@ config VGA_ARB_MAX_GPUS
> >
> >   config PCI_LIVEUPDATE
> >       bool "PCI Live Update Support"
> > -     depends on PCI && LIVEUPDATE
> > +     depends on PCI && LIVEUPDATE && 64BIT
>
> One question about adding 64BIT to the dependency:
>
> As I understand it, enabling CONFIG_64BIT essentially means that we are
> building a 64-bit kernel, and a 32-bit architecture cannot normally
> enable CONFIG_64BIT.
>
> If that is the case, would depends on 64BIT be necessary here? Or is PCI
> Live Update already inherently restricted to 64-bit architectures by the
> existing LIVEUPDATE/architecture configuration, so that this dependency
> would be redundant?
>
> If this problem has already discussed, I am very sorry about this.

The necessity is that the PCI core needs to store more than 32-bits in
the unsigned long xarray key (see the snippet above). The dependency
on CONFIG_64BIT ensures that unsigned long is big enough. We could
probably remove the dependency but I would rather wait until someone
with a 32-bit build has a real use-case for using PCI_LIVEUPDATE
before putting any effort into it.

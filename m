Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852205;
	b=A3C0vch8FY6I6mlH6muxSwquALN3G+16M2RnerPHJQ3/dSqfXUSmTLZAuxVibVJHFv1C
	 /iX90igStLQRYGx5872wInl0GTHfK4F8IlXgCYq10CHuo1o+Z1PxQUwhFeKSyMNLxcWNX
	 K3k54iDQMNKYJQh/JxXHxsjJYQ3WIfL8PmhO12sKZZy3PADdidgkTrmZ0cvDbpkAKRsd5
	 wCAAylIerUbUBW35q7Zw6NFBa0qOKF+VXbobI4N1o/nBYazqPS1fBcKPxyiHHlNIBIqTA
	 VjttqgMtff8AGqXLreu/uYjFBc/jxapwxk2mifxJtVWP5xZB4VSH8kpFi/AXNR0qwEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
	b=Ic4EVwHUwVbq9DMTVzRMAZmMWrIdPHsXYKtKwkB75hmC/AAnylT6BbqZ2fe0iX/WQlt2
	 OUQrASshqE75G3G8Gxz4UswTaMe4x9gigeoRlTg2fcso1cih3awVjM19V5NBBO2tvT0XS
	 ZpxU3LIkkIdePdX9fKKfQ2qhBHvGrn5ZKQHm8X0m3hYMyPU2hbWWnBhN1DAdbprIA+Lbd
	 AIiNVagwy6u6EarC9t0D6u51wVSwv0j7x8v5KltkJ/MVMZIuu3MGZUGXAeQ+JmNvrUkYw
	 va/gPc0O0SZa1VrwseBgrKYf6vhiJOCB7FVa0LbQE1hgYUaf7Ri8Arj5L9/4hmgkxwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD5jCwnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251E7606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251E7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD5jCwnG
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d581da0aaso453781066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:03:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852203; cv=none;
        d=google.com; s=arc-20260327;
        b=gcJnbjB2NssDwcNpJh+ZbwfeqIqs+L4P4HIcWXx0FfBVRCT/Y+gSNWd73d7RE36L6g
         280x9qfPYkuUyE4m9dPRHtErNfUKm2/HRF4oEpc4ZaVasXHdJA160qvk1ZFy9EcJRu20
         4iolS0Kv77+8AtZin3lQL3r83BGEipdea+7E2Rh+znN0lJ73QXGrBEWjuft8sMxyohJR
         Q5tqQ1QMX0jHQR2NA+dZ3ZhbKakQfYs670r/pKwU56T5qjflGYIMYv/h8oBGgnYXLBec
         Ls1RUzcJbRjQ2nVD0vZapKVJJVEyAYIzHHyMKlPKzugBdMh6YaAW0iQ6DuTgemvqMCVT
         uZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        fh=JFHoKKr2Ir7oMyI60KzSTOEG/l0pYL7zY53RRg2RzuQ=;
        b=ZNnJsRNxJFKRgLOwvPBGHLG3CRhgLX4ZDOUctzu8Fi+9f/M2Aj0dKAKCmgbgDahn0g
         ctrSWKrtrxZhd8oeonvXwA8twHTRvRUMqqxfBbrHux66n4JZR0FdFzC1Mk11+NLf2Oue
         DgHbkaXzWKXpBTBYVADD3MqBmX2sLFEb7z+dFaDNCCEn+K92c7BoA6zO1Cn+l+sPB/qi
         qARDfJEH7Crr82Z6dLnJW4QiDvxEB8bsTyAwrCCEn/Slmg9YX7m6kwkijpBhv2rDLNMF
         oM45JUjEsoLkFkTY4cSoXFwj2lDOp2Ek22rckqwO8CF2snPXx+AALNvJDPFnOzNDvjAs
         kP9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794852203; x=1795457003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=hD5jCwnGpTvZNYaAr2+aCoE6cb7zi0fesWLJtmKfjHp/JQ/kaIWWIrz6e09KboJAb1
         22Gj7G2b351eZKv4rCg7O3GyMG1MtGoWN6xg7EU2eQrnCKJD+f8uRHwt83vpvd9hqvPB
         j53rMQM4o3q7Rg1hd8Jp/uyfVa3Rs7TKp1FVmCxM7aw8dB5JXvPGM+7605iLxZWFOQVr
         Hzz/427CEAuvdW4FK5liL8c7JyBMf3Wp6j0Smxe/NQ/y2H4En7HwyLYAEmh4P9ItT+s3
         3VFwCqZ15r0ILkjB9apt8n5E5rVNDQGKIc+1yYF4pQP8Uw+CYIUALhII1lJTfuUwpnZm
         RlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852203; x=1795457003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=OWezQbthzCmFuXqz/JZpSdhF0umPkIRzfBhappVnn8kYJeccnTSyTTMOQ+Ysqn1tmG
         4l+0C2erIqeKwjzzlZW2ZXUV1W9AmfEpL8dkBge+kZyIHOuOwT3zBzXHKYyoHinBZSbm
         CDQCQKh0ADdOjF9fQwC+DzZi/xCEYyTY+ksHXqq3Ydah13Gyw42x+iIL7tskyGPAL3Z4
         bJsKwADkfd8pYhF3nIMTor4c+h5zmg0LDTnl6I/HV+FcwKwaegP+xceKJIY2MVZsTUbj
         H4Ls3wIB6xMXHSTkwWSKLG4g+DtZV7+1CGQG1GQdzd+mpXWabaD0wgrSnuFcih5laudU
         WSBQ==
X-Forwarded-Encrypted: i=1; AL+hErEGfZIox0SbUyvUnCKBs8bkt8k5W2NntFQeCAMw/mXzseqje8eujsNlc2rYMvD/r13p0RY/sL9etpFbi1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NjCaIrdv3Vb/+hDlXu1Qeba4U1PMn6/xYPfrsq/eCkMGQA2pT
	vReDIsqBPHJ800hYsRWyRuKWJbUgjAKrLomSB2yPwh9Dn5FJb5vnmC6Ae75fDDkPK5PJOHGCA+e
	Ao2WSUNlBGBY5SVR6dF/8bPXAgs+hQeho0Eo/98yUw1HZYJ62BQtyUZpYh3kXUg==
X-Gm-Gg: AYBFou3VQfyOLy46ooq35VGnFecsHNgIi3036LAW8wvtzEaGZ3Sv/eD4+rlD7I1W5yF
	dWogmAUJje9CAXj/e2/Ns0fCqnfiDONsLZl7zoTJdstSJkzR4pqbLrUM7YujRYlmua8ZiGHgD4J
	hMiwdDjNAL2pZofZCHf4/h4RHSWYsV/tdfQqjHuZ6dSDIBE9hiKGAEvUzC5rVtFtPicKtryetnE
	aNZviPKsssxhgCdanbAaqSFQuvwlQcUNWeWLVQJnF+5uJpftnbIqQdS8A+9mI0g3O6VSON6MaE/
	AZVPyWf2fSw7thFSA3Jl8XPQDIGgyLmgGwQ2H02+h97u2CFh5pI1kVKX7PdGdr+eZnnFSRwheA8
	AxHTDH6RrNDTgq59X54+NPSOpdA/oVwdhyRHe24MPJlndtAYTxPc+HSepTuY=
X-Received: by 2002:a17:907:ea92:b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c50963df2ccmr868161066b.40.1794852203026; Mon, 16 Nov 2026
 10:03:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com> <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com> <20261115231946.GB1239159@nvidia.com>
In-Reply-To: <20261115231946.GB1239159@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Nov 2026 10:02:56 -0800
X-Gm-Features: AclHuK98Rk-099iLtslJwrWtAxHkQR-ncmpykOH17KTcOCuNGBfykDUUL8uCEbE
Message-ID: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Mastro <amastro@fb.com>, dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:19=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> > > Hey David,
> > >
> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> > >
> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expec=
ted
> > >>     uAPI behavior?
>
> Yes. Even if we wanted to the locking is doesn't allow trying to do it
> automatically.
>
> > The way I designed the P2P selftest support requires 2 things:
> >
> >  (A) initiator: A device that has a VFIO selftests driver.
> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_=
bar()).
> >
> > So far I haven't found a single device that can do both. But you are
> > right that theoretically a single device could satisfy both
> > requirements.
>
> mlx5 can do both

Looks like GPUs and NVMe can do both as well.

How would we implement vfio_pci_find_mem_bar() for mlx5? BTW for the
target device, by "a memory BAR" I meant "a region of a memory BAR
that behaves like normal RAM". Sorry that was not clear.

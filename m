Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794499141;
	b=cUucQqdou8OL65mbM7933NnkkzmyjrzqgKxgQmMiiwtYAKeHw4g/nAyHtN9j1mom1iJ0
	 P8K14Wg5TsZ/eb8yV3JRHopdjqU5k8XsAoVdc3weovozFxWF5ghGUu3nMPYNrPRdmfSdx
	 65OjXQGgaEb0vfB6ogqSfHBmJrP9UogZr1zj7e/M9ONtB3f+XrMRcdiBVERcOg042deXH
	 LzXgEANuX1RDb/ANRp6zPPHK9lF1wNQoEwBH1QmRPEHSMORkBOs2l29EiuyF42ZtySNDY
	 +2O79DDCmAzGjp425tKYYVdTRfhaPj2kXC10HpW02XrReD4gyf8AJ74EnGkjTzVx5aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
	b=tMfdDrOz7WRcPYVFSXmBKBSYijArVnjknd8rVnlTKdC2ebEuHVoNrDR+/T/p3jIjM3t4
	 wP1GwDjUo4w20uVf5XOmqcwTZ/rMaF/dKCKvxDRqdcpV/ejuB7TkhGpJJbaggPZRSYe2d
	 6O9Tw8TFK7tgBFU8EYqnLZBCWGdb7rLwrfeh2mw1ncAqukheYO4y4KAny+6k83PSF0DGm
	 BIe/LoUqWiV6Y6US5IjuWoZM58zmRsCU8u0AjzfMDF6+AGXZDRf+0tAbC3sBuL6V1FZpR
	 DNOeTE1VN/o9yZ+nORZ2dlCsDlxeDg0Z3lmFnQc8/fPSoNDXHSfRkqWGO8eziz1EOnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku4CEMDs;
	arc=fail smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1038606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1038606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku4CEMDs
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e30c26a4so193147966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499139; cv=none;
        d=google.com; s=arc-20260327;
        b=qvDT0EgU/Q3UFpptHYeug6q0MljGt6gFTHk771iggujKQfZC1RHxXUb5yz8B7vMryy
         Ts9FMOJLm1R7gILDXJ2vEMZ/Gy5hSdf6MIsY67DbmQ0bRZtrG/FBLMKokIQG9faibqm2
         I2ZbaqnRSwzpOaEcbrx8GDQEt1sKFRlV8Me1mHj8f8Ev/2CNB6ond9gL6HtbzpZ56c68
         9FoWnhHi+i1ZFkXSNVlJ/mMACBe9s7TbtwuEAvDZ+Enlg+wBnKEFroRq3+QMAS8LGlmv
         51E7qS++n3HkpkUa024qjKiSPELE5bGmxWx8lsSpkxJOiDJT8J8GzQiafXEj88v+loDg
         cjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        fh=yp4gLGxKcYK6VtxjDp0z00d2qHrORB3mYspCjnqhy0Q=;
        b=ZFwRZb2pElNZEE8Tk3g16aiTwR6Nln7bPQOdchIQ+g6JfKLEu7Y6JffsDpoPdT4VNL
         QkUb7FhVNaLiqWvbqYaaq6v4gq5fMjLWnCfA9JtUYOyjc7pASE3cKZb0znwWdTwr100R
         uArMlod3XDL7fSY3Sk7M+1PDLtwhJyGgXKekZ6T3CHWzC7kMGj5jNqyluVHvpt67jglY
         YX2oSpkv4EV21Fy1VWxFzdffDqeYv/E65ji3ECvApV+sQkh2MYWdBmPOMq58Q1AaH5Ta
         TUjWvdFkEYDixr/+O0VEkmhlAi2m0kFEWXLBab36bhw7tUKmYytmR5GJH2HUY9NbS2dB
         +NTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499139; x=1795103939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        b=Ku4CEMDsKOxYuTHkxS9/ZHfKqGyAbdFRF2MhC+3pPVtK6HWONFWDHL0g5iHPdORXmq
         oCNp3Ku1XxNdlRsjeMWKEImwVaAdfEzOqrYLgHa918s+FR1IyQ1fmPX5yHMmwCHxBzhf
         C8I0Qvdbnem2LkbMyzKrKCl7Y2MCBgHox/1RAIyYZq3DxBL5cwjOWIAybt5G4EDXKqbz
         IcH0qvA4gzCnGPHCIZWCOFUN+Lhb6gmwwQ70/pLxaiJ6SpjrZkRCa503mcGDAryxhNXu
         CPV1l/eYc2VrMSVlZkLRDPuSigrh0dBYR7xqiJDS+5z+h+ShAd88L9C2HgrhMLu5YGw+
         kogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499139; x=1795103939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        b=jfnmdDUCS1wlnh9MhaeSKhMJ72t/h3TiSBICcgePUX0wQhPkiOcSEG3pD8FopmSwSD
         3KsOKIF9bsGB1uSyeJT1toAXnCmur/hVFJsz5MpT1+eF/rooNWQd0wWQvlDcX8Z9UzDU
         HYdgsrLQyqZBjUAkFn3v8WvuCL8qD3VO6c4PUuPjPqNySoIK/nvrLPlAw7m1qUqLKWmB
         SDopC0nxoBuz+xc9IokUgM3DkVKInpUe6L9RobgjeH509YOZeF1kOqVk4yiD0Y+Ncw2k
         QqW9NTPYH8f6cbgCdqvbpBRIC8vN2mSOTZOTH4tmTNtCb+tzIOMSLHTkytJc9tVsbHBi
         27Ug==
X-Forwarded-Encrypted: i=1; AL+hErE/AEDSvYMvvyAn3BKw02fIJTKwbD+N09wUAXoZeZMuWs6MOPP/+I6zc2x8xmL3Xd4Q6DJYz7pnFQrCTNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JgG/0zpEETzB6L6Ke+u5SkiDZ2ok/VnJa1J5f2nVz6+tod21w
	rrj6OHX19WGmKAKHTCXX8AmGmlwmM/lU0/j+GVpqWIb0fg5bP9DMvLy8b94iftW8mElc/nqEom6
	vrxeyhMFehHfmEWetLRV5COQWIGYT/Fs=
X-Gm-Gg: AYBFou34TzJk+gA+fM9FDoRhBMCrDDRm9jUGjcSw1XD//nvat/kl1KMD8N2ZgtgERde
	MiJERt4IBbAllM7b0u0LERlNfxIEtTgowriJMn7NjBIGg+6IFxIkEadL9AJ9r6g4LptudUGoSv6
	keXFDq1f0Vg82k3vBFZjQRvvDwPPtt9uE/XEzEGwgzoH8h5fqkdwSAmGSjKvG9QvyCSVNUTNvIJ
	OCW8eiATyyxcmfSb83pl9DAlOI5weu9+znLrUAdIAfkXMkfY396BD2uB2GSayQoCK858Lwstu5l
	dmIV2GRgsySIOwB5l2DW/KcBb3bJLglh8CS8MWduQ+A67+M83V92ezgdkA1F65bSxjzUsp6W2NU
	/L+QSJwJRqPl7RrvH4q7gfSWYHEqMxe+XILQhzQEN2eXH/nL+K41gDWgBz5jwSRyytq3N
X-Received: by 2002:a17:907:8e96:b0:c2e:616b:6763 with SMTP id
 a640c23a62f3a-c507b2cc1b7mr331620166b.3.1794499139114; Thu, 12 Nov 2026
 07:58:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
 <20261111172947.3579982-2-stjepan.poljak@gmail.com> <avThD0u2WQx8drWl@bywater>
In-Reply-To: <avThD0u2WQx8drWl@bywater>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Thu, 12 Nov 2026 16:58:47 +0100
X-Gm-Features: AclHuK9hu2IpdVTiqRNx47radQxfPWpOJNlyZZoNO2fwaqJTR4WiC67svYMPEKw
Message-ID: <CAKVkeTyjZmNsyT4D_evW6pikwnNEtTY66HvOi4KKwB0aY+a+XA@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio_ring: reject a split ring size that is not a
 power of two again
To: Francesco Valla <francesco@valla.it>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andy Lutomirski <luto@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

On Wed, Nov 11, 2026 at 10:51=E2=80=AFPM Francesco Valla <francesco@valla.i=
t> wrote:
>
> This is definitely and error, and should be logged as such (I know, the
> same message is printed as a warn in vring_alloc_queue_split(), but we
> have no ABI to align to here).
>
> Also, consider to adopt a message a bit more descriptive; maybe
> something like this is sufficient:
>
>    "Bad virtqueue length %u (not a power of two)\n"
>
> > +             return NULL;
> > +     }
> > +
> >       vring_init(&vring_split.vring, num, pages, vring_align);
> >       return __vring_new_virtqueue_split(index, &vring_split, vdev, wea=
k_barriers,
> >                                    context, notify, callback, name,
> >
> > base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
> > --
> > 2.53.0
> >
> >
>
> Thank you!
>
> Regards,
> Francesco
>

Agreed on both, thanks. v2 uses dev_err() with your message:
https://lore.kernel.org/r/20261112154927.4004184-1-stjepan.poljak@gmail.com

Stjepan

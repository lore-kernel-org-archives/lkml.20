Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B95F51617E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787613; cv=pass; b=gr7Tf/xFQBFiNRBH4DpbHV/d9QbU9Upl1NyyjGrB2A1zldY4mha7wsrwVNB/HJA8rzNDVXvr/VSXxIkUGBm3dwmhpdTJqYijqDRidGL5BBNCOZc9ppmPbcxnCrZ6l18bi9jibN9bH57Jfz3E+xI9DAE3wGuUXsB1Rfb+84sX3hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787613; c=relaxed/simple;
	bh=YwFLKTRtD485E9tMKuK2u3mAFkxgr0aAxTDkVA98D4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1dIRjj6i06tT8qbaP2xq2NSdu5GJ46IzSDDKhqnXi/8mO/7AVxplUw3V9RlotPui3YyNS0m/SDnT5IjsiRerGRcW2VImsA9Km3K4yYZsOPP6QXubny14C962Xz7LpVHmVIoxsD1O++K7dIM/hVJBfexALKkU2RiO+Cfp4B1mIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spahUrRI; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spahUrRI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so42129805e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787609; cv=none;
        d=google.com; s=arc-20260327;
        b=Rid1hiSGd747JdrUGR8A3AyE9k6xyFXC/1zZGh+MjlLE1c/0d6QV/dAdaKN6Vd21TD
         y22XVjXBzBi3VZoqvyVrnFzYh3SyV9TFPUJItcMIUYurNTiGQvMyaSGAlH+2EBkWo/3N
         pQlhzG8gRjUHGmlRCWZkp9HdrgmuXEdjD85of7gH6v2VC1ciEnA6Lb0ilqnQwdvXZF9X
         QTDRTwTsB7fJgVFK8Mgek7fEyz5LuEPXQhwiIY43/ngb+BVMcbBoB+Dl5WAHOnKhIuhB
         XnadKSGE8Aat0uhaE/vdJumhLMTk0HWWs+BWdwb0VJ9fpDlPNpn4yEZLETqKh3q3XJtX
         O1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        fh=ZE4fpbLNiryztT9mCLzx1AEZdDfuyy1Mmc2WHtbJI+I=;
        b=sCXthRUaHeZ5VPKd0HBBqCfSYmn0qNG5AasUakGG+omH36jggW2YFZ0CRYbFdqRRY2
         W81SJ1NaLA62fkIXOmBvlAsmgFPWSc73yGra64L8slL4FB6mK+dvrccuL5mCXQXYcfVx
         /1wGLJj/GLCSNY4NvMdL7cut3reI6xxOGdmmo2uQxgpzwiT3iVJ3v2+AWws963D/akr+
         2sWoZo6iya2amLtuz9nMw1o5yMyz+MkikNLzyMRagi/FtKrzBx9PINVRq7dcBIke98Ya
         mX78y4twTt78il/1gED8+YnyZ7PSoMxFShx7gzRmSkrtG2HrdxWcB+QP56KBbMCSvv9x
         Xx0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787609; x=1791392409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=spahUrRInjqDGGCVC2I/U7dc0ub9D2jo+Upg83f6FC+CFeNA2/k5Bk1+fJJD7FvFZx
         5ixDoCfl2yl8TVeXtKqWzfBhBkBNQNAuXT/ufFwt2Wd5jGOLOg22SWt/zgTycF1U3Mh4
         LysofWYUqZtBvTcvuzJdRdkPBj9JL/3xDEyH25hdZAG3XIope6rM/HDiqer5rXTjZVtn
         k4ZLvaF1jho5NXPSP9sKahqsdqS4eASzW3wgTvENPQHXfs+urwFvWycIPM3WLru1vUcZ
         eqjoVMg8TkAwaaHYxyepEK7itbKkk52yZjBOlJiLRiDJk/a4tWnXm6vZTialQtegKAUN
         6xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787609; x=1791392409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=TV12p2Q1NiH/mChi/fNFGWr4HuHIKehKIW5UnDkDJILg3f7Qz0z4NV1ziWM49gHSei
         c02MchB10+dAv3jXYA1NW+gACeZ9CrUozmRZm3N/nKyRa0ThDSN4Rdoal+CidHuRnzaJ
         fYMMAP2GzvrA0mra0PdvGMhjtwSvb+to1k1fl3m9tjd+nWTfmzvuKPimMGnLwGWneLXw
         cLDIVdyCLR67Wu7GgPxy1ACG++gmMLmaQ4oV6kZbim6YEVg1ZOEM/IQRGqf3aRsJ9jlo
         KTepcTigY5UMdxHTdQxcX29Vv0pXcACyksYXp9OgRuPUyObs+RA9jfc6t7tlrjOCVIxs
         4MEw==
X-Forwarded-Encrypted: i=1; AKwUvBx/ztZyCUeJQu+ePUGYDBE7o7/bwrEv8zT/Yuk1XZ3UbbDb/KexX+4iZNgqN/rUOGICJXxIpxD0EznffH4=@vger.kernel.org
X-Gm-Message-State: AFuF++nhu72bCLJ50UmUg7U185GhDb2O5TVF627yYmU95WERNDXp1Qi6
	VMhQ8nuo3BqpdH1w6vudKIqz+1vqXHYOda8l4w0phfbST6KNHUdNuhO6vBn039AnYot4kfMO5i+
	wM8KSMf+UW0i1yWRLvAmuBeP93nTIa3c=
X-Gm-Gg: AYBFou0DLopBAaudBw5Ugvp6b8oAoFlcvsQMaWVOhUGKoidjZfwylcc2b11gV7Zh6Q7
	ZwzGbb2CDFjJysZYj3t1wrIBIwUPAzMJ10QfQ952TL8/CU4208HL0lXiDtodozXg+7/wenxfv7i
	LW8d2Xo/QA2C4g1JC51pueeqp+IPMw7KlGk4QYeixS6FSh47jrWVGkXEzBtvQjCZOBue/WsVEmK
	EXtrDrWNLu8TliCKI2edCYgjFeS4T5P/On7x5qcotFkTkFjZQ8WV1dleaYngU0wvzfhpl43IU/O
	Jw+Y1YQDvSCVEoqL5Fa3QZIR6JfzL5GMubIHQw+t3JojjFPNKA95k6u91wh1sR0eulaQRpZ1ClC
	7E1cnA2/A0+ZjisTN4gfITARgXLV6nKgB95fjNZszihCpwqtOU+cY57SD5YHcRB/lJ5HkOg==
X-Received: by 2002:a05:600c:3152:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-4a01b12603amr36070955e9.31.1790787609394; Wed, 30 Sep 2026
 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVw02dIqn4M-VK@ashevche-desk.local>
In-Reply-To: <arzVw02dIqn4M-VK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:59:43 +0100
X-Gm-Features: AclHuK8eJrFqm5LeaZJBMYeX86u8m2nZ2ZLVvt1JxRR4ALOvCiQsOu3O-zn_iL8
Message-ID: <CA+V-a8uUtqBCDJC=Gy60Jx=a3au+9ZN1Dbbi6uGbzvHA3GJsXg@mail.gmail.com>
Subject: Re: [PATCH 3/8] iio: adc: rzt2h: Add chip-specific configuration
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:43PM +0100, Prabhakar wrote:
>
> > Prepare the driver for supporting SoCs with ADC IP that is similar to t=
he
> > RZ/T2H ADC but may have different channel configurations.
> >
> > Introduce chip-specific configuration for the channel template and numb=
er
> > of channels, and use it when setting up the IIO channels and DMA layout=
.
>
> ...
>
> > +struct rzt2h_adc_chip_info {
> > +     const struct iio_chan_spec *chan_template;
>
> __counted_by_ptr() ?
>
I don't think __counted_by_ptr() applies here. chan_template points to
a single struct iio_chan_spec, not to an array of num_channels
entries.

> > +     unsigned int num_channels;
> > +     u8 features;
> > +};
>
> ...
>
> > +     chip_info =3D device_get_match_data(dev);
> > +     if (!chip_info)
> > +             return -ENODEV;
>
> -ENODATA
>
Ok.

Cheers,
Prabhakar

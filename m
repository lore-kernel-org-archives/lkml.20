Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541C52F29A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694622; cv=pass; b=e9lVkgkhR6DKQWtllECV4sqhf4UKFEvQxAZCHudfTcsB8KQtv3+bgH4cTDHPxa79mZF9zU7vApjy0YZikJibggF7ViGlhHyvROeWqpwcbpIvF3ZAS9dQp5mKRUA5XP63DkMFFQ1NKKSJWYp7gIBYSdIQjhHODQUVJmf9ldTw/j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694622; c=relaxed/simple;
	bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP9mptn4Rb8IduluRjloWKckBQdd7FMargOj2rRGQP9Q/UAS8Tsu/uFQvj4cCjUuKspLugB2t4VgbBUkdJDRC+7YLHSIxv4ImDoK+NLr0h0jGTQG362jqcwbt+DKHcsXv0mgECRkQhSt/Kvp9rsefWzPTPTho4ZGTL8OHIz7bMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIPeWEBg; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIPeWEBg"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c996fd607so72487766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694598; cv=none;
        d=google.com; s=arc-20260327;
        b=FDKSH/QGUKxFr8U8NO0l3/+UpmwVNIl8d0mCi+NMCnc4NVUHezCTsyJouF0Lt0IjhT
         jnj9Z05gkp0um4NHilOmQIUqfOWnkqMbuhvrsMvFnod10pizHyhhgZ+8YLedOPDy4yuj
         g0h9DAYFb88fepcapaMyBKkaOxT4gC5mPotPyjst7qBA5rhRd8juPbBQ71p8z9GsCxcn
         bn/mMp9zCJrWtwQYjWMuTZ5POvyquiD4HlO+sAuo0DcLMQN/OBUfQ58Xz+3JfStPBej1
         PerXRAhYvCihDkvb4wKpWQhP6fG4Ry9XitRYuvPJSbEvRos1rkus5w+ns4Ft+yhuIsA5
         siwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        fh=ZSbQZ9pRsX9kdlwG3MmZTdtYVfYdz6Wi/ylT7im/nV4=;
        b=MWIoSXtFBbkS60ALbUXQwJRl3mMxdI05p58A7fZV1aKTB7Z9p0cDSExn683np+CI4j
         n+mOknBhROM00mKZtqX9r4rymrKFgQ40l1CBw436Hh58W6ra2olzS6q4nSA8P801+MdK
         XyabxXa9z1VG/9d1ERSiBswNpFhxowP/hMtGF7oYJJiorbnXcW2Ot3931ZPDzJ6JHJML
         FCXjRYJfxC2GIxwhEbgCM7ZduYOVHn5S51VxfBgMd32YPpyQ4bAPJ595JBNMl3jDFDRF
         oUJWMWLU07wEbyosXfa32IPhaOdhX3TFARf1I3f8vNkaWjCKb4hgz5CwL9LlZ1459CfH
         829Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694598; x=1791299398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        b=aIPeWEBgP286Rd74WS1MS0k2k0axHU93D4S5YwQ35ftA0rS8n8niYzEr9Va7j0q9AZ
         OakfyR80ILYi4aCN6Cxlu0rtkzbhtQqWfRxStVcJ6pjO5y8D0UPNL85Rr9VBawj8lBKu
         tJYiOhL1SO1MM72rX+m2i03YIEV9Th1EovuWubYPZwTfhvXuTJJBG1BbAN3/YWxYsIvK
         PxANBhrfcHJUMATdJ8JPMp3NRVFuLoXshj4MSlNzrzsGaKVpPEHtSfk+QYww6P3x3I7X
         rGWBwM5cvQQy7MY0Tl32ThOaHCaOHMhzcQJRs+ZqJJF+UcZz7jKmui5yrlh/2y0Eqtus
         v6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694598; x=1791299398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        b=CVU9OsVYjStIpsKJ1LrJTQ+jz0PJ7pGGDyU4OGFx7Vccc/VhxbY4St0UhW7RPIjlAi
         88AqTMAk4ik74kECO3g+eWtRw/HeIRfLF+Ad7gR2Cel0zJIh9VAeEPYABcyKb6gFAXDG
         8kaVCUPP7pZBIwruGgv5l0yCmxyNMdfHeMM5d4G9lvJmFuuDfAoHhpjdKTgWEvEy2bp9
         H7ElYj9On+9vlbpLhCFNfYO4+Bbw+ge77U5z6ZidAyfRQicQwDGda3Cdj9eoyWQZnwxl
         6Vk6U+oKim1GprRiHlZPG5KTGzmI/1P0TsFvmKadtuz+694bFLCn6UTpl9+/7IgIc4wF
         o1hA==
X-Forwarded-Encrypted: i=1; AKwUvBx0DaXX4ZmPICFu4yY5G8GM6cmzGLakdeBmBEtn2LtoiUmBkTjlT/F2Pq9cw7UFzGGpLs2o9bL7GeskJPI=@vger.kernel.org
X-Gm-Message-State: AFuF++nLLJTyWK5zkwM3C4XMJFjluUd2ut4WgzjQ1ByBAxJcT9ku+MEJ
	3vcMqnnddXbCxAd1TXH8ioGSdC3JfJij1TKJTd1VO6MeHZDtXAzpChyFcVedquaG84atYWlWrU1
	PF7PVT7BOJh5XU7/vJGCaZWJjkwFj058=
X-Gm-Gg: AYBFou3DkA2svN4lFa3kp1bTZfPYmT/IdbnzEvyeo/qc4zm4tvNkGF208PUCRyWqTjP
	5jtCqAViEq4auCwbkeXsd3JheHjJ2lnxsUkCP7aqtQYZPzB2P8SeVUyXIEEmKtCa7jUAClab8bj
	r+jx/mgkilFV/nTnxVdb1eB1yItxoEVptZUJ346U5a1PLasBNwk0GVI1ikOamkS7aDXuuWYwI3i
	bnZmxk74CIW9hbBJrYY8/EDyNt/MwWO8W7fP0ztvfz4/D7Tmdxjeszi0TrIse10llrWBHX3JfCl
	9sUPkEQqq9x2JQxjrM0Dhw4kJimbbjPWFksxSwaTywOD/wu/c1IqWtl7Fk1bKpfv6Es9a1iKNgf
	tBTs6lREUFaJ27umttzuxxtBNT5YGII3GfOQ2NaeOrVROCkkq9mZJrJwfajElR/gnhIwnC857AV
	2Yt0T9iWfh61L3LyjVdplNp1EMx2Cx78+eNLaUrqYy
X-Received: by 2002:a17:907:7b91:b0:c25:f7db:4be9 with SMTP id
 a640c23a62f3a-c2df4bbd66emr249698566b.15.1790694597369; Tue, 29 Sep 2026
 08:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
 <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com> <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
In-Reply-To: <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 18:09:20 +0300
X-Gm-Features: AclHuK_ig44-8Lba6xzn4qrUSgfy0bItWFvk8zB9-j3BWSCRSS_99NXNM3MtxkQ
Message-ID: <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Tue, Sep 29, 2026 at 3:31=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

> > > > Just send it now, in any case my series is blocked as I have not se=
en
> > > > a consensus on what to do. Or do we? Bart, Sakari?
> > >
> > > If I didn't make myself clear: I would love it if there was a single =
source
> > > of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO d=
rivers
> > > even if they have additional reviewers. I'd also love for them to liv=
e in
> > > a single subdirectory at drivers/gpio/intel/. Otherwise, it's still c=
haos like
> > > right now, just worse.
> > >
> > > This is in line with pinctrl vendor directories. I also don't see a r=
eason for
> > > moving Kconfig options into their own vendor submenus if we keep the =
top-level
> > > entries sorted by driver type.
> >
> > So, as of now it doesn't seem like an agreement among all parties. My
> > opinion is that it's good to have PMIC be separated from the other
> > code, although I don't know if the camera PMIC GPIO driver that is
> > used with IPUx is good to go under the intel/pmic subfolder. I also
> > believe that camera related drivers are the best to be handled by the
> > media tree (as it's done, exempli gratia, for int3472).
> >
> > At the end of the day you will have a single PR from me, but it won't
> > include camera stuff unless Sakari agrees to send a PR to me (which I
> > think won't be the case).
>
> I thought we agreed usbio would be moved out of drivers/gpio/ and into
> media? That leaves intel/pmic as the only subdirectory IIUC.

Hmm... I cited the int3472 MAINTAINERS record to point exactly on the
variant where it's left under drivers/gpio. Also IIUC Hans' opinion is
that GPIO drivers even being USB GPIO expanders for camera are still
GPIOs.


--=20
With Best Regards,
Andy Shevchenko

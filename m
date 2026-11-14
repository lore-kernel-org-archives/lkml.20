Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794667515;
	b=3JN4mtge8bV0NZE0FK7BvP2tnlTSVKTFlfLTs40SpOXDO5cIeqfZIKLCfH3k/2y5uLsL
	 AZ0SY9w2dQbmpaYT5sk+nRI1furCiIZYepqXpVdMraS2GMyX++E0+KixSD6WTof8P5NgV
	 Vwi0gvNIUiJhkph7z2TpRvt/KsiPNeEzE2yOG3AhKq4x1xTGPIjswCmjL5Q51tEBJke+c
	 OJCQ2oUGiJpfXk/YH/CSD4q+0GkwJH24sK+ZNn6eQbOTo6oBYNWceMfEvPzn9WNzueM8Z
	 EZkybQ35KdclXHRNVeENFiZufjd0Xq0gDy62JFEy0ij21M9t3EoRvt2aSE+C4xbeyjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
	b=HxYrByWFT9IA5vOsta7xzS8rpLBPG4nXLqfhfAk/MWVunPAXpcajihPxapxxzX8jVZO+
	 ckiOD+1Fdg7j8ah/sDig5T/h64Dct1Ou4izXVXvGEMJ2Enq6rtxz7q6pKfKZlfHixU7uZ
	 fznVpobGVhevchsIkNiDytLuCM+CZNOKYQR8Fn3hn4F5Ilvv3lh7gtqncdSRACAlY3Jbv
	 eJ5T4asnwR3RzNFx038Gx3Qc3VGVg3VVqbUGZXBUEgKM7oNqCpFJxop/yJi17VGyEpIE1
	 GsghjiaF1hQpU/My0vfVQqXUMcq+wwdYKueiMH9hjQcjsi1dfVoMjoYyFsoiCyWCSzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWnMxepI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E133606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E133606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWnMxepI
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so1887852eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794667514; cv=none;
        d=google.com; s=arc-20260327;
        b=bxOyXw1reduVB1aDOINOBAvGtrYIC+lZI59i82ej5NV6p7WcfqaL8c6lNfeYL/G8Rg
         TXanpkMi5zpZ7dtabbpml0dTE7Qg8/UBtErBCAYshQvLVCGFKKI/zIHemRBnyN6Cow5d
         gFFC4Yzz5EqOSPndIKUEKMKrVX7Zwxj5FMa8lrFaSfywNgnRW1aT7kAeoPeaQP4eeMBK
         rSAAoeXZmRNAugcg8z0pJukk2gBgANVmsuvBerFZ5JeIuhlGhhElBGCPxdQfGVpC2q4/
         o+jQQtmX9Z/IGyCRGLK4rcTKRCvp2eCSqlg/Rg5bRwEEKeWy2mVPa4/m+1UeyCoCcIM2
         Suog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        fh=DYsXYu563U6YwEHxog2XQlUP+fWtHqVs55/3TKmFWGo=;
        b=k4tH9t+st/jYUctfmoBQVS3d8OQz/jPXmuWyub+aMJdTSxpFTFe00n0X8bN6kjQ8d1
         oGlsVap+lYDo7iG32YcLj5/3h9JrwfrgCU/xo+FwN8rCxvKW5+quTbyK/BSyzDDxRbHp
         ChDd37iNDDUVs2fdvvY0TgPaFja8QYfoW4VJOpsbbJpFI1uZwIX86+715lKcOFvCHXfG
         LS34dBUgh5ACYISZUA1RG5+oOYHePFCnykU3/mFpwg26cNYrPfYNhBpq6PtYGdYWEny4
         13bSzo1Gklwlr0GoQc00w4UO9Sr1Hy5gyehLJjBZBS8N6ectgUybC17T7ixqXSuGSGu8
         o6zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667514; x=1795272314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=VWnMxepIxhJfUqyZ91Md3j8tCzMbWsFJYzY+qoeWDv874H54yJllbiHo3X4LcMf9bF
         a7sAuAM2r4ldJ//2C2kQxsmcMTluww2tYeWFj9F4B7Gm4Yw0TRIG/em9N8Hntyat5W9s
         6+7iXV+/P1khaxucf3UcN+XJRL2GcG6PHfmqDS6EfNRYbazxK7aAZVtfVdZjgZ/ZpxPn
         x4gpoVJepbRDfJrqLMO2Tr45fubzF/BkR7LMMUfaGqtQ2Wii6RIP/BMpGesAvo5qWo3q
         6h+ak/DvPX9WjypzcHk7vt1tkMQWOqi0Y1MieyPDEyC4RxpJvFwnt3PMDYinJRRust52
         NHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667514; x=1795272314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=EE07dY2FtcJOMoQiDYbW/h+O2LeOz9uAb19uV8h7mWiQP5gVaRXViGmf8wlkL5jHV8
         MqyQOwNsH8TmGT1YhzW6D/29C8vH59t+HyuHczUFCNt24TqKxKNYpBw4nE+J62ejNPeX
         ebCoUE23ic3ON4xJv0fNcdZjOfHLH2T9w8GE0gJauE/yCgt1RuxMcfYiHm1WXUIuf8IP
         +AITE9tV086tZHt/b17kWB3jCQeNtMuwGnZeSWekSk3BmBz3Hd8mo4mw8EYXJEV9IyqQ
         GdfrqfhP+YTJYUxRU0E4rhx/9Jxg7SMtFFM5MKezII0QQb3PDHhMkqsbFAlPBFv/Ujae
         tN6Q==
X-Forwarded-Encrypted: i=1; AL+hErFB3uGYF4n7KOdUd5rmuj/UWAsVnQ2+q6a2t/hK2e05PEdeDyOOoi+pjVi4z4eIaDdv4+ZbY4XzQ4ibL04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VIrKuzqGiYvWnTjgYhSpe0XXjeLbR+NFY3WYelICJKDaMaSF7
	vAxLnOo+cIji4G35W+H7E3auvzMfa8Xi/zK4SlW30O/MLyOornrQIFrUHKLHjDFADnZ/B19BYjr
	qtNRNt/1rR7GXPKxoGpuSMji1EbPqVXU=
X-Gm-Gg: AYBFou3sOmA/rmmokpInJEMPnIonz2bOfyUtdnvUiuCGd+ZsEbF+ubm8gKlLt6kxmpm
	jQYVr1wAYUSPHjtJEWWIfy4vqArRlVL/ZJkP6sasxYYlWCY0+1vXEnPtdGhhAUeWaDi0jvvSl7e
	uRY+jfKJBwWBiPupkwi7JBqpMv70KXwfHLqyXKNj37XdiHj48J3pkS8xsj6CbjCKvkZfbW1sjWI
	Ax9isGOLsVvae6BZXWqRwdbUdWz1VP7h/Cv1Dr3gIh/9ackBX3XzVVxYkSnFI2kx4RlbZrgoT8d
	iW7yKuKX8H3NX0abrm2Mr4ElRjGeOtKBIeol08WxkbHFX4Qtx6Wy0P3QuU/aWB0KEvKU6Y/ap09
	gssP9W5hC2QNiN5N3BbLdGBZKlVNarr5Jvhc0EoM5PiArM7GynLbk1yrelz2FULFkx6DzUlffz6
	7Pz0hUpfjgRQu35fUdAHF9sYjplmlK2Q==
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id
 5a478bee46e88-377e093db88mr8125743eec.4.1794667514069; Sat, 14 Nov 2026
 06:45:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local> <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
In-Reply-To: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 14 Nov 2026 16:45:02 +0200
X-Gm-Features: AclHuK9Q2MT7WzTqFgmyb8uGWfov9bVv3FDtVPr7EAhs0HUduJChL9YtHwu65_c
Message-ID: <CAPVz0n1UG6L8divtcXgg7mfS7C3bO9tKv9d-Xh6VbyayG7p8-w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:=
04 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> > >
> > > kernel test robot noticed the following build errors:
> >
> > ...
> >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > WARNING: modpost: vmlinux: section mismatch in reference: trace_initc=
all_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: =
.init.data)
> > > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xpro=
d_64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init=
.data)
> > > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_chan=
nel_from_si' undefined!
> >
> > Forgot to import namespace?
> >
>
> It is not exported in the core
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/iio/industrialio-core.c?h=3Dnext-20261109#n319
>

Should I export it? Do you have any suggestions?

> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

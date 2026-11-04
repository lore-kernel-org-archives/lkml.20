Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829204;
	b=5CUrd0lETpmnxYbScBl4AWuzgyT5DsstbIpERBeu/kc9TkaRVzDbCymhIqh68Csrv9N+
	 9j8lKrGMTMR5Y1gBHuF6Ekunfa5O0gfj3KnPp5mtKirz2FARkfLbp1yI6C6ymmZB/vzm8
	 alhgsNjs9hMfy94Mud365tCRgOv9YcyDDIZWU/l67UtnK+mTkURsHpGXS79J2i28+oc2j
	 vv6CkqSHUq2UseWyOD/AnDtLQN6yVjXmco4bsA4uT7lHhDBG4GJsujZgzhLctpEjpQsIv
	 mFA4uTps03fMozQWCEMwSZPYGD1JQRS1rgTnxtMo5zXT4wuwygKOklFW1biDU5diVag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AOYXXvAeGQUSKg94QWzYjLTLmtv76jOGX9YU9MzItx4=;
	b=vNgiObULlp708P1av5mNsA6bDhAKZn+juVWOG0u4Hb24+SjK1MM92zNkfOoR7nkWQ4Id
	 4kzTkS9PD4dKHzYSqbi0aehIOJm6GFakKhVzJofVJlxK8J1PUtDhU9bNZD4R263LaeqAP
	 gB386EdvxPof/aGZRFiWHtEomLDKSr3CuZY/MvEFVmoHN/tzHV5izLQcystIGRx+lZBuM
	 TZj3KIBUKR94whyi6cCWH1Pl2lPyPEOcJorwouKaIaSLYnRZL8u/6I84W2F0FzVe70T1s
	 nIGl9ZFuvYLCuHbdjbsuCd0p0x5MqIlC6WNV3crdEqxvsrAyah8ZFyYr1KzpNltRhpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bamA3br8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A7D60709B9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A7D60709B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bamA3br8
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1812908a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793829202; cv=none;
        d=google.com; s=arc-20260327;
        b=ilijb+Sdv+xRnbwAq1b49j0plmQ06A0uzijcxZ/tn/y3WDLWzc61Bii/xeC9pRmZE9
         /eHcnsvfEXzs/vYhROkMoRfyczUlbK8KM0rvCrQX/ITDO9WIrQoMyAFcOIkJItX2cPp+
         0Hrs1hrcwrTFo3tqeH9XvL+EMfHv/r3Wdg6JhYV8Hr/tMwesGd8X8saWkhYRexBqk9Lw
         lz6oiSSDKARJFIVAR1J/rcyIcV2+qMQ69Zeb75B7myCIqZ42/XLCaYtERc3lfF9600hE
         56ixWkUh0WUJgWiAJniGifo3oDSthQBPw5cMrIx9TIZJc+BoAxvvETkW/TpLzP/VFYif
         SB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOYXXvAeGQUSKg94QWzYjLTLmtv76jOGX9YU9MzItx4=;
        fh=aLwfUfsgVDVevPflncbPb6toBrnP7Z55quVSAQuSkEs=;
        b=qS0kmSQBCySFG2ZNYpaRtOE4aKBxn1D90zSrjPZA36JB+s4rsqIyq1/TG89vUZmr8Z
         /rL6kOub/oWFw1pR/rWSfsYoxpLMpXTRB35YsOxNkg8AI+tNaBdeYEwVu0tGGqMEvgOh
         I5+oDU0xS//8DHEImG4ExnFowEUA76seg9+/Z+4Z0wXVymgvv3B10XvgKRNLomtwwwUR
         QCkYIrwPnH2+oFUtXQqn+g1roHa4cZsu7eJNbgSFf4ZN9KCygDdWYlBeAge9oxl8YVH2
         oay9ltdKsXDbNuYK0IkMvlNSPHPTXpE/29ZfrvS8t+7WBc2JjBGUXaqGxELgcw+IEJ2u
         xu4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793829202; x=1794434002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYXXvAeGQUSKg94QWzYjLTLmtv76jOGX9YU9MzItx4=;
        b=bamA3br8KDTbvywqdajYdKQeU2Q0Q5xSyV+xuTyzLibivC8phcrB2NT3GerDpLF06u
         fqQeI1zr/5yHRg2BNn8Hj+pX2edIs3lB1sdlqY9VnATMYVwF8xt3XvxuNflT8sPB9Own
         bMfHRGF6+/nt6hwNOVJrtVEF+MncUKKGoJBo/R97MgbqRdlijQB3X/+DH0RMCMlJQkfK
         Dx2VgzxCVR5rJNV9B3C/fzg2+hw4mtC9w+/g3S3L7NYD0baFc2GETAp2pMqPPtQMXiAo
         9wPmE+0x8+II7ffunnqNh3NsFRTzCYcs+Kv88l+o67ABDSwjeUbyeVpAdrB71SFC+wY7
         gXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829202; x=1794434002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYXXvAeGQUSKg94QWzYjLTLmtv76jOGX9YU9MzItx4=;
        b=F9smBrOXqM6JvdSjLOehKOFKXoYMOngMiPPn4SK4JFi2MKcTVv0RlV7v4ggyBGW7SI
         XnhBXqycF2DSU/iTQOE7fwPA6OvFuBAcSuQNdOX2nLsym9pkQDCVDf1h9bN3rTZj6Izt
         eMGdK86MjgezCg0CkeVLtfkcaLBHM0oNCdHH+W051p9YSFAfCDpDgG3o7k/Fyqv8Jxdd
         NOur9I0Q+aaBW3W5s3P8ztobQi8YMY83p5Bqk2ZZIHqzlqjzRL2z9210ktlfZv9edoDR
         3UlCDP6vQfj+iAzpdCNiqdjvOAt8C9Qy/AW159Edbkes91NTmWcDpaOmA+iAtNy9UOhv
         Nezg==
X-Forwarded-Encrypted: i=1; AKwUvBzxipoA0EFkDtJ1eJ/OZpu2DaIcYaNRhldPrbia9at8VwNj97/mIOrOdz45dCno+Obf5o3n1gzuf2f5xGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mg/RLutcB9nal2vblDf5MGVYaEc5szfjlWDHPA4tPjZZiVdu1
	WZXuzOjZB8fepPoEHGo5WD9e/o3iHURqx1AA6Jz9LPmyGCph85/UeDBQ5l9O3YtoykcK7oMi5rI
	Hwf9+uY4adXaJAA0YjpM4r4Iwp/vinqbAa9VLnMYIyOBvYMCNwFPx
X-Gm-Gg: AYBFou35Y3UGvNUH123VQQsZ3f4zncy5wg2w+W0pj+K6rreWjC2PGK7LXHDBp9QNil3
	8PsSG5kkyktqOw7YNeh7gPGRoaJjkcjlCVdxgshMsrnZ6ch7fIoRCrjFfyyIMJZUqFCB+lxfRf8
	0POIvnwQ2RPlVt5UYpqSHphtc1xPDzvq2nBAWg5CrK4toD0Zaqx2NmrRksJKn8NTywxSHBMJyo/
	HkigfRB230XmnlTvSTv+fg1DJczbW7ESU5CrUXRO82jgYh11BjOUTzHVgsqbuESn7RpHgo37m46
	b/6nsYd6CBx3zWCaXeD58J10KPOW8uImHWUcjxybZ93wOBYUY3RDwsaoEV8vx/a+3mzTnuLBuun
	Xdoyu6Zg5V3tfi4q2iYfwGmH8TE4p7gDGqjyXUjCId52yImSu2aLIPzPJ83Dis1sKDBLg
X-Received: by 2002:a05:6402:324c:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b4d4877be2mr10211433a12.23.1793829201753; Wed, 04 Nov 2026
 13:53:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104162352.140836-3-blum@kernel.org> <179382570401.2089669.6201187990672133004.b4-review@b4>
 <34a03ed8-5b75-49b5-bfd5-e5cdf48dbfd4@app.fastmail.com>
In-Reply-To: <34a03ed8-5b75-49b5-bfd5-e5cdf48dbfd4@app.fastmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 4 Nov 2026 16:52:44 -0500
X-Gm-Features: AclHuK-s-sl_kRxXOrDtbT9-CufQHmeS1snyHVWmWxn4YyNWTQWbPewzEi16i1s
Message-ID: <CA+CK2bD4s_qn7Scat_B9vya+BoqkJdNTy=iYY4JoHNAzY9YaoA@mail.gmail.com>
Subject: Re: [PATCH v2] kho: Remove redundant 0x prefixes
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thorsten Blum <blum@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Changyuan Lyu <changyuanl@google.com>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 4, 2026, at 21:55, Pasha Tatashin wrote:
> >> The %pa format specifier already includes the 0x prefix. Remove the
> >> redundant prefixes to avoid printing 0x0x.
> >>
> >> Use phys_addr_t for size to match the expected type.
> >>
> >> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> >> Signed-off-by: Thorsten Blum <blum@kernel.org>
> >>
> >> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/ke=
xec_handover.c
> >> index 6f1f55fe3181..6a7600a0a7d5 100644
> >> --- a/kernel/liveupdate/kexec_handover.c
> >> +++ b/kernel/liveupdate/kexec_handover.c
> >> @@ -2010,16 +2010,16 @@ void __init kho_populate(phys_addr_t fdt_phys,=
 u64 fdt_len,
> >>       */
> >>      for (int i =3D 0; i < bootmem_cnt; i++) {
> >>              struct kho_bootmem *area =3D &bootmem[i];
> >> -            u64 size =3D area->size;
> >> +            phys_addr_t size =3D area->size;
> >
> > I am not sure; having a variable size of type phys_addr_t looks strange
> > to me. Furthermore, KHO only works on 64-bit platforms because of how
> > our radix tree is designed, and we do not plan to add support for 32-bi=
t
> > systems.
> >
> > I would keep u64, or if using %pa for u64 is still an eyesore, use
> > 0x%llx for the size field.
>
> area->size is also a phys_addr_t, so using a local variable of the
> same type makes sense for consistency.

True, that makes sense.

Thanks,
Pasha

>
>       Arnd

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792632406;
	b=NzjYziTv3urhfkKGq0Wr6wzYlhXTD2DrKaoFtK4fPhHm2sQR0dl8KO58fzmAsxr5oiKD
	 VClxo7tQZTt5CpMMS0STgxqqcHFhOmKnicapFhq8hIts/YXF/fDZpw0/9xWUh+VQoHRW4
	 Zi87Vap854rJT9cjbnFueJMQF5WMRqMJKIwd2dLM08H/FmMJ30U6iu6LhOyY5BCWsensU
	 JrsyWji/enWNEpZlT2aMZF4Pqj2yAZt5RxiuOttWNAHMIE94rWK0TFrIUreJAvfhaPLGh
	 aaoCXY65oW8vjjuDTUcSrxM4H2imp7+S5G+qByKmUPbJOjjM36iWeqQiD+9RIJy71iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792632406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o28ydFuUHHD4c/U0AkyEgOljfI5EK57zWWg+tuRSc8Y=;
	b=DDkO20udVh8Ku+3DC8sVGkoZa2zG/CL30NaHlRdF0lXZHM5uLVYrMZNy6OYxRAfH5LE7
	 NDifiylsjRhuNhB3JQbh9XvwGORgaBr/xDc4EEmU2qyKeollGEw8bFhHt2HMXwVpFAjwZ
	 KzjJ7tTkfhKnc4HlpUc45/ZylHFYz48jOKhS+scpoWLePzgel0lGaU9FEoxhLdTV4C5Ie
	 i2H08CXxpTfddW+OxYRzORbpcFZLB41XZVe5KvMcsVbScZEB6fwy80+sLxTG11wBioAiv
	 7QcvESjSxN8Tm9Cn7ApOqMGG0aYCkPUDGLtwMYpKlQ1JpQkokq5BOacNWiKAwCRxfOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UjasCW3N;
	arc=fail smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38704606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38704606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UjasCW3N
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2022184a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792632405; cv=none;
        d=google.com; s=arc-20260327;
        b=Ze/KOquvW7VBQiuZ6c1x6AcZUC/B9o2khhrC0eIoVbUJlnOWDZutsiKnON0UgphMEV
         M5rg3Sjt2OYJkdbbIo5Kscx6zdtfvu/tmGzSg/purOf9kZXQ+dCfrfieYsJEOxfxZqq0
         A8nHhKrEU2Dg9Bq9KZhhPMcUbnP0x/fEGXD+R+ON72HXDn8JUraI+y8ttjX7SZKd4pcT
         egJTnNK+XomnPtkfEKBNnJXiRJM+EsUcY4qhb4ZtSGvoN4biXo5vYXjT3BFhOwlfL/tY
         heAPwvpbMyys07AWZy3RAheWFKqENdY4mfSjA8ntP2kXmifnJKZDPF9s2AgGwacHJq8h
         kzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o28ydFuUHHD4c/U0AkyEgOljfI5EK57zWWg+tuRSc8Y=;
        fh=WWEs/jRNtdeowSJo419gUY4jeSMiwlPierWSzu6GQ2A=;
        b=p1pPr44grUBQYfZi0lfm2sd5QhtfGAPsMD/sgjpupdW7ojE/JAdU7Aops8Qxza62Cw
         HaXI6JEH0VfylWn1/5Sqr1aUMlCG56yuH+UFGVNvufz3SdPaqUMsbM3aDD5R/8pUlUiH
         TzotbOLYvBlJn967f2JHwIpieF9mvGQ4jZf2Jh2VZE1BsWKVt3QQ8PoHqwNVa3l087KG
         8z7U/4BFjOl8E/6MulXxTVKHwtrW3WB0WrNeA5H83VSyIVuUHSCDIHkK4iLqoX5pwLKC
         5U8K0MQmQdAM8M3zTgMLml0pJk0gJrpz2EDwTqHFb4djjQ+oRwjWcjO0BeKtK7QxVlCA
         locg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792632405; x=1793237205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o28ydFuUHHD4c/U0AkyEgOljfI5EK57zWWg+tuRSc8Y=;
        b=UjasCW3NpozzrrA3uptNAoyxN3DqKW8HmkXQNxzRnN/JTz/QnCPODSFsuQp+CU15iz
         1LkOjKGsHN11814MpjY+/WDEGC7whEmqGfcFHZilFU92hVZmd0P/jDJQsz1R1tiY1v22
         QEJjzFYaVhhlpS7AL3b9a9Eh15m7QtFtTO0PXMi0cpCfJWXwrmO20D3TU8B5QgOQt69/
         SNKIxNxzV23JLqHMuIqF+Rxhbp4ACGvPlVLutcB6tch3U6K8bn3cBIdJedvQXqJoWms3
         LTcsARGJuNIIBF49+wPKcY+NHi+T9ZqJmZfG7n2YznT0MSfnTRXZ9Wu7/w8UUAK2YMpN
         qYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792632405; x=1793237205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o28ydFuUHHD4c/U0AkyEgOljfI5EK57zWWg+tuRSc8Y=;
        b=l3Btm1EoUGsTvRGL1EzC0eAF7hezbi+ais2PeISV93pIUF1USqneNyTloK+csUMl9A
         jEJciaQkrJeqMcfRuQviYvYC5kJyMB7A/RR+WMVRXWet/1EOXVuMYK70oL3L6zA6LhDo
         w/8aG93T0kylzoTjUhzG3G3BLQntc9l0e35q4ZKv2UqL/jEgvgd6XBjgi1okfe77vD9D
         oa3THlVEmcerWQrzqKHIRZ0+ikk/VqqelUQ0haTzVTupUTogJTR5tU6IfMwB4OiHIu7x
         lde2uWW28YOamToZKBt788DCFJt5CqXkb+Tsz6OJlP0nCs/rWVweGCuGShAtcWCrNGin
         M2Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwMI7MZY+j6F/i4bicRgDoahF6iQS3qohfEUSnDFN5B7/V/gFkeQhc4IwWRfodb6QVccWpmjrbTnYunz2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi5M9rvT+zblQO3zj1SvLi8vIwjljZhepZLYhLtr4mexEPRRKC
	x/8v85RNMZgfIhb8ZKX2p/IpCG5QboIB2iiLLChzOmSbi5CUi1cHPU4z5jE+SyYFxrv25L4JASM
	hQkVv5kAWDIsa4wrB0nzz4dUbao4k7oJr8nDpKrSrVg==
X-Gm-Gg: AYBFou3P/SfKUZL7ah1MHpXEIV3ZnAP+w/mZ6rChiOfaX3GYGmGwzYP94iRA2Xxi0R2
	j+2x0Il82vQnoNIYpjKh6zPVP82LnSYsIbNN9fx92Gjag16cxUcnCZoSNGkN0uAKv63o8lhg2XC
	WyAy1V1Fx156s8KwKSJtOdJNfArhgyTqojyHcBqLV3M9FzrBeWnp0c5yJj2JMJIHaey7U0lPfMb
	REXGsO24EAZcvWakI0SKHdwGlniqbrGeDHk/GAKhaR9TiKx2Qde/0bsY3ccAgRHKhCjli3fGrK2
	xQS2JQlD9z3NE5Dy2g+rbuh34NmNqvv1itxOVTrLZMfCFGV/3DdHu0ZdzUJ1PrQrTb/WT15VGeN
	UYKmrDFfuepWT2VGQ+0PgshjEm+O9jpmzwnefgt5M30Fyg6CTHCEP6kobri/z+bix5j0=
X-Received: by 2002:a05:6402:2801:b0:6b3:a1ad:ef6d with SMTP id
 4fb4d7f45d1cf-6b408dcce19mr2969744a12.6.1792632404378; Wed, 21 Oct 2026
 18:26:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com> <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com> <atlKsD-aJB3mJr2j@google.com>
In-Reply-To: <atlKsD-aJB3mJr2j@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 21:26:06 -0400
X-Gm-Features: AclHuK8Appp8OBdUFGLxu0V1hBTCm-a-9f142JZiexa4wOQOsDrRrU21F_J0R34
Message-ID: <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: David Matlack <dmatlack@google.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:28=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-21 02:50 PM, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> wrote=
:
> > > >
> > > > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> > > >
> > > > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@go=
ogle.com> wrote:
> > > > >>
> > > > >> LUO and its file handlers validate handed-over state with monoli=
thic
> > > > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a se=
rialized
> > > > >> structure, even an optional additive one, must bump the string, =
which
> > > > >> breaks live update between adjacent kernels. Replace the string =
in
> > > > >> struct luo_ser with a feature header, so that the target kernel =
can
> > > > >> accept or reject the source kernel state per feature.
> > > > >>
> > > > >> struct luo_feature_hdr is a fixed 128-byte header: the serialize=
d
> > > > >
> > > > > This patch is all wrong; 128 bytes is far too large. For every _s=
er
> > > > > struct, we only need 8 bytes instead.
> > > >
> > > > NOO, It is not. It is intended to avoid complex mess with unnecessa=
ry
> > > > over-engineering.
> >
> > 128-byte per serialized struct is not starter.
> >
> > > >
> > > > >
> > > > > The first 4 bytes are the size, and the next 4 bytes are flags (i=
.e.,
> > > > > 30 feature flags + 2 reserved bits for flags extension). The last=
 two
> > > > > bits of the flags indicate whether an extended flags field is pre=
sent.
> > > > > Each extended flags field is 8 bytes, and its last two bits indic=
ate
> > > > > that yet another extended flags field follows.
> > > >
> > > > If we will have dynamic extension of flags, Think about this.
> > >
> > > To support dynamic extensions in a backward compatible way you want
> > > something like this:
> > >
> > > struct luo_feature_hdr {
> > >    size
> > >    flags
> >
> > __u32 size
> > __u32 flags
> >
> > >    extensions  // offset of first luo_feature_extensions (or 0)
> >
> > __u64 extensions[0]  --> but the size should be specificed in
> > declaration macro that I showed in the next patch.
>
> I think you may have misunderstood what I meant. In my proposal,
> extensions is an offset to the first extension, not an array of
> extensions that immediately follow the header.
>
> If the extensions immediately follow the header, then the number of
> extensions is baked into the struct layout. Every field after them sits
> at an offset that depends on how many extensions there are. If we ever
> need one more extension, all the fields shift and old and new kernels
> can no longer read each other's struct. That is the problem Tarun

We can structure it cleanly by nesting the payload: something like
struct { struct header {...}h; struct serialize_data { ... }p; };
That way, the header can expand dynamically at the front, while all
fields inside `serialize_data` stay at fixed offsets relative to the
start
of the payload.

Since the header size is self-describing via continuation bits (e.g.,
the last two bits indicating whether another flag word follows), LUO
can
easily compute where the payload begins in the incoming blob. This
keeps the implementation simple, avoids linked lists of offsets.

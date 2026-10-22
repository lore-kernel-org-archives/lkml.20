Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792702448;
	b=iVMApOtB7saxB1eW2Sr6QkRqBXr8OzJBCCXXHQ09nRQ1F28J+nqcL/vlDe9WO/TL+khk
	 KpN9kepHTyvPA28iuDb1/RcoGDJA76Z3+sTQihDPpzfw3FPCMEUcvB0/lpk3LATxznLCc
	 mdGMzN5s0IjTzUK1jsPSaGtQ5Y0oaD3m8F7rs8j7aB2y/3NCbi9UsAtMFr8gQBEhwxStz
	 OQBMVGLhchpjtpdRKrDcMaxmRDVnoeVgXa2Cq2pkJ3nDIIpDC3ZjF2v6qvcowkS2bM7mD
	 bXdLjHEE5QdOvVqSH3sRClpP/+vDea91Pf8LeO59UDFpyjEQ9furDkEHZzNIO/+blfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q7AHGxYo2F1tyAP4/knTgDUev2PNwFvE7RNfo85FnlQ=;
	b=sYgJXDUp1+izk5zfRQZHl3b3TyAl8YEtmgxi+dpBuCJyuDpB+geI9lNX8bsay45dbKOl
	 YR8WRNImWbhFhH8Uu5rX6cqDD82jXQ1Sahs4ilgLXe9PBuLyrc+o05//2HS3U8B35lsnd
	 LMbYjwO+jVzSsbbvOXv6LKqvIPWPRcN4Fb2Cr4lVXt3BvOuhp2qIhOX4jKInEOQIMoJ7H
	 WuOsEqJI4zYNhiV62QvCHJf9wtH9DIqU3ZhOF/uzMfY8XZcVE3Lo3q9zMKJOpvOWfLVbD
	 RtfhAlsVauCfck5NU7tZScxiAAO67LMhEUf5Z4aCIaRxL+yKorEA4wJq2h/ciXUIO8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LgLPlGNx;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA9D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA9D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LgLPlGNx
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so251495a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792702446; cv=none;
        d=google.com; s=arc-20260327;
        b=UTMj5+WGZPr4Ka9rEbVpm5F++NJY4AEdcxK4ipwsXBlEiaYho01i+FOLuIxUhJbgmT
         N3vUZ0vEGO4APuEGc4Iu9SbhzNnG5k4YoKuKQ9Jc3dl2SL4QEUlZ2C+G6Ccl8/eun8ut
         Rhnf4gwXxykiddS2pZQ9Oi3L0B642D4C7neItiV1yVGACJVLvmHZ2e9kUBPuusULHXaE
         bnEF/+y2YmuZXsz6ezIoAsWaV27x5bhUp3CjqoQ4/wOs/kbQ5k3RvhWKN3KYhi7ZWfT3
         Go8ha7Ny+dDDFuPCC3GiVg7MQ6TYI3HEMxizBto+8YzB0napuWHm0td4Un9lXYVEnjCm
         bydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7AHGxYo2F1tyAP4/knTgDUev2PNwFvE7RNfo85FnlQ=;
        fh=LkVPupS0drKYefIQf+G1DSPZAoJF174UqO0Eu4lDJdo=;
        b=Ewb8q3xDHTkKbwqBPMEgGgzz01Kg2YjyvSWS8D1f+nRvFlKIvg873Hrk0W51Xbky3Y
         cgYUBBLCbrU9/t1L5FSRVsYnumxQgMPDx6AQg1Ga1UrUJfDLZoSMAYc9XZmTI8fFMeZP
         22RPYzXazlQlPkl1qMmd0UzSxeENgCCmJTlRVeqosRzHyQMMVL72GoJhykbnX/ytg9eQ
         QlnVDGezQfyzNW158ExWv55bELFV0kZ149ka6baek3eu5wr6d/A+l0ADDR8fXQ8VTqwP
         2q7eaWIyOrQjjnUXpKgnWS4W4qEcIoZrXxTjw9R7uyxgJugPfkT/RAaj6c8069SxSmw/
         zNbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792702446; x=1793307246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q7AHGxYo2F1tyAP4/knTgDUev2PNwFvE7RNfo85FnlQ=;
        b=LgLPlGNxToMEl/ridbTJTA9mcX1vYVoh8xUituNiM0UbmUD0nXff79LqiFdiLv8de1
         Kox6RiUxupB1lujhPIT3B0aiITEpEk6N99NPSjkfPJWhzcuMkVFpYQev6Cg+PztUZXBV
         VlvxMQJk9EfxWnEZI74hJP11wV8xjmiVEOOF0R4/yJ4lgucsrpfm3oRJEqSwn5bMjLNS
         EuGPsCH3c+umjsomEkN5X8f9bsvlArA/yy9zhQlko7rg7KGq2aUfMmIoIZWh5IhC1Gzk
         Lf9qNByAGhaOolLCRMCievViqkndKOL7DUWmCft43w+LenxcxtqlDQv796K2pUbSc+pQ
         rtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702446; x=1793307246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7AHGxYo2F1tyAP4/knTgDUev2PNwFvE7RNfo85FnlQ=;
        b=AybZ/fSoqtoDLZhpkls1Xjir9TZe3r3XWfNycVqafCxKZUXJiA0hS79ybMkqw0GHNW
         Ng2SCeRJqMdqc06L0ko9u/6lZN//mTTMbVhq4JqIW68RGZJdK8joDqIbHVwl9HN85Bi3
         Vp9h/o/RVRwOkqhzlgVmWm9BSDvh6FVOKcfmfKjpm+epWCGOpFU+XZ68xsLIhx84T2Vb
         gf/j7P3iKbg51S7Btx9XBwkq01JCNPgQof/fHlKIj+0Pee7wELGQQ4vctHR1a8+nVAv5
         Fes+aKEaH0MfWlh+1R2XXbxOuyPoyeSiWdlT2KZ1iDodi0H5l5Ms/zKW4vFrgu5Ywnjr
         Y/FA==
X-Forwarded-Encrypted: i=1; AKwUvBxTFbwkfSDTD4NvhItqM/GLmgnp2hOKDXw2pIAJDJL/aqbfp7n0CtV2E9PRVol+0MnU0af8qo2IxOwHgzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ69kHX7s0Hjxg/HZnMhk9jZx28OrX7Dwovqyv9QCn+7qBxy3U8
	aO75EUI75d0vueVRwm7cuYvUlRGZ3nmAf+E1tq2hRR/ZLg0nsJ9tUbv3jV/Zl+uZt+uiukMaOwM
	AAcRM007xWfJvPS0K/8XixD6WWuwcL17s1rsbikno8A==
X-Gm-Gg: AYBFou3EGCB6EGdndNSl7FVWrgT1kC0eWmvE/Cc/V8dcx5YedJdR2o3aA8ud3uz/CVb
	iGV3lpTkQIplCBlLuNMJDni0QiWs7d1gt4WUeaOrbr0qo0IQYpV5Vwfz3xI55dHs+v6mxOSvZaW
	TRs/j0DULZ+/jN/L9onifmsIguU4HyxZb/qsGYL7B/AYkqCG6w9bSMwY7Br7Ci8HEeE8nmKVgIX
	h8V+94HzEvng8rLD8yqXYPE6bZkTHOI84m+y68g3dvwYZwZntiheuCvxi77xBuemWyCunP2BJna
	gI/v/OvfQTgv/JHDTx1SHOOky01Tmf7WRsaHjzaJJ2I2l/brPClAf4NXK6LdKomHgTWR2R6fdA7
	8eNugm8yUY8rzKLhzUkU2lXKsKdMxrb0rPLOOj/cP3BhnRX2cwzU2UQiF7LxImw23PuGZ
X-Received: by 2002:a05:6402:321c:b0:6b1:c299:b3f8 with SMTP id
 4fb4d7f45d1cf-6b432c1a486mr859420a12.33.1792702445990; Thu, 22 Oct 2026
 13:54:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com> <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com> <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com> <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com> <atpNFEFIlqAoYIwH@google.com>
In-Reply-To: <atpNFEFIlqAoYIwH@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Oct 2026 16:53:28 -0400
X-Gm-Features: AclHuK_o-bcMo-_bEmG9OJEk39HO6mWdZ96jtolFahfwsqDnw1LYQXgLWQ4gcJk
Message-ID: <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
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

On Thu, Oct 22, 2026 at 1:51=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-22 12:11 AM, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 11:53=E2=80=AFPM David Matlack <dmatlack@google=
.com> wrote:
>
> > > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count, paylo=
ad_type) \
> > > >     struct name {                                                  =
         \
> > > >         __u32 size;                                                =
         \
> > > >         __u32 flags;                                               =
         \
> > > >         __u64 ext_flags[ext_flags_count];                          =
         \
> > > >         payload_type payload;                                      =
         \
> > > >     };                                                             =
         \
> > > >     static_assert(sizeof(struct name) =3D=3D (expected_size),      =
             \
> > > >                   "LUO struct " #name " size mismatch!")
> > > >
> > > > For example:
> > > >
> > > > struct luo_memfd_payload {
> > > >     __u64 pos;
> > > >     __u64 size;
> > > > };
> > > >
> > > > DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);
> > >
> > > This looks pretty reasonable but I would name the payload
> > > luo_memfd_ser. The combined struct that DECLARE_LUO_SER() creates
> > > should never be used directly since the offset of the payload in that
> > > struct is only valid in the current kernel. So I would give that
> > > struct a special name that makes it obvious you shouldn't be using it=
.
> >
> > Lets drop the fourth macro argument and generate the combined struct na=
me:
> >
> > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)          =
    \
> >     struct name##_hdr {                                                =
    \
> >         __u32 size;                                                    =
    \
> >         __u32 flags;                                                   =
    \
> >         __u64 ext_flags[ext_flags_count];                              =
    \
> >         struct name payload;                                           =
    \
> >     };                                                                 =
    \
> >     static_assert(sizeof(struct name##_hdr) =3D=3D (expected_size),    =
        \
> >                   "LUO struct " #name " size mismatch!")
> >
> > For example:
> >
> > struct luo_memfd_ser {
> >     __u64 pos;
> >     __u64 size;
> > };
> >
> > DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);
>
> I think we are getting close, bu I have two remaining concerns:
>
>  * Reserving bits in each flags word for continuation leaves gaps
>    in the flag space that users have to know to skip.

Yes, but callers should never manipulate the raw flag words directly,
and we can provide simple accessor macros or inlines that take a
contiguous feature ID (0, 1, 2, ...)

enum luo_memfd_feats {
    LUO_MEMFD_FEAT_HUGETLB =3D 0,
    LUO_MEMFD_FEAT_SEALS   =3D 1,
    /* ... */
    LUO_MEMFD_FEAT_FOO     =3D 15, /* Automatically lands in
ext_flags[0] bits 0:1 */
    LUO_MEMFD_NR_FEATS
};

if (luo_ser_get_feat(hdr, LUO_MEMFD_FEAT_HUGETLB)) {
    /* handle hugetlb */
}

>  * struct name##_hdr only matches structs written by the current kernel
>    (in terms of length of array and offset of payload).

This is not an issue on the incoming path, we never cast incoming data
to struct name##_hdr or access ->payload directly. Instead, we parse
the incoming buffer, dynamically compute the header size from the
continuation bits, and cast the payload offset to "struct name *"
based on the negotiated feature flags.

>
> How about this instead:
>
> struct luo_ser_hdr {
>     __u32 size;        /* Size of header + payload in bytes */
>     __u32 nr_flags;    /* Number of features encoded in flags[] */
>     __u64 flags[];
> };
>
> Each feature occupies 2 bits of flags[], so feature N is always bits
> [2N+1:2N] of flags[N / 32], with no gaps:
>
>   00: Feature not present
>   01: Feature present, safe to ignore if not supported
>   11: Feature present, must be supported by the next kernel
>   10: Invalid
>
> The length of flags[] and the header size are computed directly rather
> than by walking continuation bits:
>
> static inline u32 luo_ser_nr_flag_words(const struct luo_ser_hdr *hdr)
> {
>     return DIV_ROUND_UP(hdr->nr_flags, 32);
> }
>
> static inline size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr)
> {
>     return struct_size(hdr, flags, luo_ser_nr_flag_words(hdr));
> }
>
> static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
> {
>     return (void *)hdr + luo_ser_hdr_size(hdr);
> }
>
> and bounds checking is just luo_ser_hdr_size(hdr) <=3D hdr->size. The
> payload is always 8-byte aligned.
>
> Payload structs are then declared on their own, with no header:
>
> struct luo_memfd_ser {
>     __u64 pos;
>     __u64 size;
> };
> LUO_SER_ASSERT_SIZE(luo_memfd_ser, 16);
>
> The static_assert covers the payload to catch embedded structs changing
> size.  Asserting the header doesn't add anything since its size varies
> by kernel. And because flags[] is a flexible array, the header can't be
> embedded in front of a payload in a combined struct; it can only be
> reached through luo_ser_payload().
>
> I think the only downside is that the header increases to 16-bytes when
> there is at least 1 flag. But I don't think we need to be so concerned
> about an 8 byte difference...

I would prefer to keep the default header at 8 bytes. With 15 features
fitting directly inside the base __u32 flags word, adding the first 15
features to a struct keeps the header at 8 bytes and does not shift
the payload.

Computation-wise it is also very similar: for the 99% of structs that
have <=3D 15 features, LUO_FLAGS_CONT is 0, so computing the header size
is just a single bit test with no loop. Even if a struct ever needs
ext_flags, the loop will walk at most one or two extra words.

Pasha

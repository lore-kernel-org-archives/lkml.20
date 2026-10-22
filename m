Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792639981;
	b=zzo7zJg/aM/5r/f8jwXIInRRJrl5jt3Z40PqSsRDUMArB4MtQKO9FuwbHeQ2mLZ4xIFt
	 ylEicRQEgFeE3C9Vz/GOF06w8Mdt3jQAPsD/ZwZ5EshJAc3qkRSDGABCfMXsk7bKavcQQ
	 zbCK8alFG63MTdU24JDM5nl7Ext/J+nRjK7p14CJ5yL1JJ34gJ6WzRuh0nmKBnR3ZmJt9
	 Sc9Hnb99u+Fs78QQsNNiQPiD0PdRlxr0mdNv8ls/+KvELmAgTSGJoBhFR3bguRNWxXRJD
	 f6n2oydy1IttmHTz+hOeyUth0U1UmSpCxpkHuzEkrtm580LtODhWjb7GXD4MhZjzXGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
	b=n0ayuCfvc6uyzeDcngaGrAwcjMRu518B5w8sOY/l+FE8VgblH2svsGO7Wv0H50D4RYCS
	 A+aFqfB8w6F7RkmsgVsXH3b2uysKYMaTKnmsbGGeXtwHhzHoMiAG5IrEp8kWOOXPRIO4x
	 b1aOlBCRQvUxvkEFZV78/H+u2z7J0uVlEfazag8c+i/+tlkj8gpfGR2sGx0XO8Afb++mv
	 wUD033JhyXR4hv0ZFx5GwxfkK41eUojgvNcdNexJOxXBAN79Dq5JtDLJ21c22vDwkcYmq
	 Vj4PH1zjhZ5ZPrdhCrgWxdKKXUTxp1WNbncz2TxxX8UHkvAyIn42rryt8wVyMkmkZcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	arc=fail smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1125828a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792639974; cv=none;
        d=google.com; s=arc-20260327;
        b=G4qepPItvW/BF6baZKfm2N6f18j3WKUUOqAsMwzBYmdfMF2GfZgFon28qVKWUX0Tbx
         Byp0c8XvkcDBv7D187t+1udao6VZGl4nD8DG6mEWIylVmFJv5DcRBPTL7Gjbly7FybtU
         /lcEzayi6Jxkh1UF35Vk8KE4fkVnVST1UAbXZNQQcW1cIcQGkw3e51dy6HjXSzSnBTS4
         vES+33CELhu75CPvMtKuzAR4GD89ncL/GuNGEVHSTfN7l3wBL6KkhFNvJ29XiWOdebM/
         k4XiovA3prFOXRonHKCRzA+5GgnyptL0JvbelMgWsbd41C6FaEGZjy5CKYr7N1upabLT
         lS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        fh=wrsw1eGhCf2wnY9fX3loiU/iI9cclmB0AlAeFblcvLU=;
        b=fnz18vbyUVDDxFy8fwfWInBPYCCSB0cLIKAeEbt+VicZUihD5MfCa1bKK9E8n3GjYl
         XhdUt5+KAXqaD26KCA0vOvaT3iLfFyGsHjA0nQWDu1U/kwRESreRicKIxeBxQXaDd4P+
         iAHmZb9QcPtejSmYEuEvcACYks323UhbXlqQbPEo21NMM8qxaMHC0y5zpIGzGxymIIXf
         91N5wX3SFmdEQnFcQmhoFtcTh2dEsKGb0r2Sz1nETg0MMvWvi+2SZuQGeBEjHzpX3fv/
         ZQ6/zi9ISbwZEZcAtJsi4cHcBDAu3dqKj5jtXpGnTYNjPHO4PR+C0NkhFecNQOo0EeXM
         V01w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792639974; x=1793244774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        b=ILFNfDSyM6EiDFQ/deqT3sLOP+u8Kf3pirxcTPIufbp2jigDWT1sZcctywPjNdvkXR
         /Dm+VtE+h68vpC8fzKbTsEvzY0yy3f6MBX6XoKZFnwgHJ2O0hmACknanzNY3hOQO6KIk
         m12u80mVcCUkshG1kjotWGwOrpgnBnlDpf/3Zd4avAHjjCpYhMMTyt2eYzc08W4MzR5U
         76LNcn2btDkRwul4O18tWfJJBsI02oF6mtgPS9U4FC03JhvfE722a3yl5a3Qo4GKBgSa
         ea6RF0yEdwB3rPZP1qRKqFW8Dd6JZ/xSsUqBZ1c2piBn8Poiu+0z4ifQ5YeO4K7tALqD
         vKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639974; x=1793244774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        b=x/wUNHhDJFtSi4VgVSbZKC+8a8z7G+bsX8qYHbWV6te4+pWZCrIvfuq/B7I90fC9SV
         TMRRsgouYBsEuYvn+s+VtcCZN/BA2QKgi8XX0yh0g9FUNtymI49IpjurnvDcl50qZOap
         EygmPb2DI7I71knfUT5zHVwBBc1aR9rkQ9OASTPYuIv+AxORchdqvUg7rur15Vcsgj/k
         1CdgWzW4AbA+kPTzeorg4QVaBZEXrIBko1TMA8k2UVZCS8u0gVEMHNhQUfB1fgp3z2ob
         IypWOgNsMSIieSIPDDGY9NHfLu+qes3vi5wJ7mB/lsiUYmVj9a5EueoDCIoAX/yIitDz
         WsJQ==
X-Forwarded-Encrypted: i=1; AKwUvBypXXXc6hzGNsRIFaszWMrgu8d/j0BIio8wUEI/RhAXhinucrCu+vJGHousB8vy6W+qrIpmLFyi61hG9WY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1/4rMAACa5mSbnumB+Uy7EaDc6J/9kyR5/Yq9fBV2fcHH8hpR
	xiHg2NH19cVPdPfUhzSgm7T5U98tZfiGZvdRkNzPvz0S6nf+UIIYMrtXbcD3gmNpNdbK6cxypQe
	68QJ5FMPLXoU+h05FCVxEYBSBO6avp0dhcvVVRcumhA==
X-Gm-Gg: AYBFou2OefsYogklox8v0IuH6u+dM+R7EpRcdOQbjErUqWBttjUf2yUDVM7TBqBeLih
	S+Vo9STBrf8/iCbV950l41ZiVofM2q6x5/7wIWmRq6dwNEM8/IFGth/AgJhan5tRtwze9/i53ZG
	DVsbx/xUCdoS0Twdp3n/eM+XuakWvpCawGAUcRZTkcQpNUKL6qQFOsRyJ6/cxGLBjhTeZaGNXIl
	pxDaNIOvHvy4BMmZQzLNdiO+sdV4Km1crkJPKh1qu4S5acBj4ijlvaA/tMlWGLXktrzRuuMprI2
	m4n4+6EewR+RoIYGvTTS1hCFQetWHjy4R1Yu2VsfGNKooqPEJ16hf3Qh7nf4qcVkQypE6agqAa4
	0IXqbdFgQI3rVwj4wA5JABSh9kdyIagiabVKNOvFLXZku8+Bf5pajjct2ZkAvjN827SjH
X-Received: by 2002:a05:6402:2355:b0:6af:d794:4a8 with SMTP id
 4fb4d7f45d1cf-6b41d595e9cmr1157408a12.12.1792639974111; Wed, 21 Oct 2026
 20:32:54 -0700 (PDT)
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
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com> <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
In-Reply-To: <atl7peoVHdP5hz7z@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 23:32:17 -0400
X-Gm-Features: AclHuK8_AnwdTvKegXWFQaKFyzs_ctZH_O_1uRYIa-PRh8yAhLXciiK9Gp-4xIE
Message-ID: <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 10:57=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
> On 2026-10-21 09:26 PM, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 7:28=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On 2026-10-21 02:50 PM, Pasha Tatashin wrote:
> > > > On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@goo=
gle.com> wrote:
> > > > >
> > > > > On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> w=
rote:
> > > > > >
> > > > > > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> > > > > >
> > > > > > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsah=
u@google.com> wrote:
> > > > > > >>
> > > > > > >> LUO and its file handlers validate handed-over state with mo=
nolithic
> > > > > > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to =
a serialized
> > > > > > >> structure, even an optional additive one, must bump the stri=
ng, which
> > > > > > >> breaks live update between adjacent kernels. Replace the str=
ing in
> > > > > > >> struct luo_ser with a feature header, so that the target ker=
nel can
> > > > > > >> accept or reject the source kernel state per feature.
> > > > > > >>
> > > > > > >> struct luo_feature_hdr is a fixed 128-byte header: the seria=
lized
> > > > > > >
> > > > > > > This patch is all wrong; 128 bytes is far too large. For ever=
y _ser
> > > > > > > struct, we only need 8 bytes instead.
> > > > > >
> > > > > > NOO, It is not. It is intended to avoid complex mess with unnec=
essary
> > > > > > over-engineering.
> > > >
> > > > 128-byte per serialized struct is not starter.
> > > >
> > > > > >
> > > > > > >
> > > > > > > The first 4 bytes are the size, and the next 4 bytes are flag=
s (i.e.,
> > > > > > > 30 feature flags + 2 reserved bits for flags extension). The =
last two
> > > > > > > bits of the flags indicate whether an extended flags field is=
 present.
> > > > > > > Each extended flags field is 8 bytes, and its last two bits i=
ndicate
> > > > > > > that yet another extended flags field follows.
> > > > > >
> > > > > > If we will have dynamic extension of flags, Think about this.
> > > > >
> > > > > To support dynamic extensions in a backward compatible way you wa=
nt
> > > > > something like this:
> > > > >
> > > > > struct luo_feature_hdr {
> > > > >    size
> > > > >    flags
> > > >
> > > > __u32 size
> > > > __u32 flags
> > > >
> > > > >    extensions  // offset of first luo_feature_extensions (or 0)
> > > >
> > > > __u64 extensions[0]  --> but the size should be specificed in
> > > > declaration macro that I showed in the next patch.
> > >
> > > I think you may have misunderstood what I meant. In my proposal,
> > > extensions is an offset to the first extension, not an array of
> > > extensions that immediately follow the header.
> > >
> > > If the extensions immediately follow the header, then the number of
> > > extensions is baked into the struct layout. Every field after them si=
ts
> > > at an offset that depends on how many extensions there are. If we eve=
r
> > > need one more extension, all the fields shift and old and new kernels
> > > can no longer read each other's struct. That is the problem Tarun
> >
> > We can structure it cleanly by nesting the payload: something like
> > struct { struct header {...}h; struct serialize_data { ... }p; };
> > That way, the header can expand dynamically at the front, while all
> > fields inside `serialize_data` stay at fixed offsets relative to the
> > start
> > of the payload.
> >
> > Since the header size is self-describing via continuation bits (e.g.,
> > the last two bits indicating whether another flag word follows), LUO
> > can
> > easily compute where the payload begins in the incoming blob. This
> > keeps the implementation simple, avoids linked lists of offsets.
>
> Oh interesting. I agree a dynamically sized header at the front can work
> and is simpler than a linked list.
>
> So the header and the payload need to be separate, and the payload is
> located with pointer arithmetic on the header. For example:
>
> struct luo_ser_hdr {
>     u32 size;    /* Size of the payload in bytes */
>     u32 flags;    /* Bits [31:30] indicate an extension word follows */
>     /* u64 extension words follow while the continuation bits are set */
> };
>
> /* Size of the header, including any extension words. */
> size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr);
>
> static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
> {
>     return (void *)hdr + luo_ser_hdr_size(hdr);
> }
>
> On preserve:
>
>     hdr =3D kho_alloc_preserve(luo_ser_hdr_size_for(nr_ext) + sizeof(*ser=
));
>     luo_ser_hdr_init(hdr, sizeof(*ser), ...);
>     ser =3D luo_ser_payload(hdr);
>     ...
>     args->serialized_data =3D virt_to_phys(hdr);
>
> On retrieve:
>
>     hdr =3D phys_to_virt(args->serialized_data);
>     err =3D luo_ser_hdr_validate(hdr, ...);
>     if (err)
>         return err;
>
>     ser =3D luo_ser_payload(hdr);
>
> What would size mean in luo_ser_hdr? The size of the payload or the size
> of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing so
> maybe it's just the size of the payload?

> What would size mean in luo_ser_hdr? The size of the payload or the size
> of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing so
> maybe it's just the size of the payload?

Either works, but having size cover the combined hdr + payload
provides a few extra guarantees:

1. A single static_assert validates the entire serialized struct at
compile time, including the header and the number of ext_flags
elements.
2. Bounds checking while traversing the header continuation bits on
retrieve: we can sanity-check that luo_ser_hdr_size(hdr) <=3D hdr->size
so we never walk past the end of the serialized blob if there is
memory corruption.

If we declare the payload struct separately and pass it into the
macro, handlers also get a clean type for luo_ser_payload(hdr):

#define DECLARE_LUO_SER(name, expected_size, ext_flags_count, payload_type)=
 \
    struct name {                                                          =
 \
        __u32 size;                                                        =
 \
        __u32 flags;                                                       =
 \
        __u64 ext_flags[ext_flags_count];                                  =
 \
        payload_type payload;                                              =
 \
    };                                                                     =
 \
    static_assert(sizeof(struct name) =3D=3D (expected_size),              =
     \
                  "LUO struct " #name " size mismatch!")

For example:

struct luo_memfd_payload {
    __u64 pos;
    __u64 size;
};

DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);

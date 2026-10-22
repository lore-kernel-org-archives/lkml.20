Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792641189;
	b=QJuh+WqjQhyszocO1GSxDRsIvWPZDrNemgqCdljohDNj9P0MWpxyTLM1ZrM80XD0WBG1
	 uaHDwslMNtWEcrzinMuEbRtLKbjxLP6khkHDgtHcq/nyigNhO/LofXHYO9/z1wChe2IdQ
	 n9fn8ROqLgFgNbeu1Hg676gngjVEfGyHAivWB1n19PgZbyUWWoa8JFcn73+aK4upX3ki1
	 bSJL4EYxWEH1UtgUilK+jXRn5jA9AhpUEf3zwsskNkHXMAP0w+dau7U57Ce6axFSK0BHd
	 1aznqPY0PGhdOu3/fCeWopGUjs2usUiSVKp2OiGfh8GBfqRdUtP2NHWSCpVvfgYrBjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5AuqEvetTId+KGd9+1A3sRuao4CeyCeXTKq86oAL9AY=;
	b=GEdW1raaq2VGaFS/PVwBVuPZwuE/2RzVYCkR04A1L46jffSWmb39Kt7CKjD2PQc3aIvy
	 hsg7FYqtyKWoBPBO2n/a5X2bb8dGHrcdemwDQQvgWnbAJjgkkkYwsE3fk4xsFwCIK3wM9
	 oGyKe+gGWqrGpiuytqcaGQ4jlWhMCRPA9aJTqw1D8iPLN3CErUDrcJUjPlHQN9oJtwLMv
	 dRujLq6cd4sthORhdPCcb2rG7l+iLHqBc9/V8bgDCdZLMo/2NEvHo92PIedssNHHE9bVQ
	 69ZZbVAFtHBgKgHjJ4R4dkHmQuKJdlZNl1u2LpB+NziD3Nrzg6UH2PiOXghssZdwctw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF0606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BF0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso198845666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792641187; cv=none;
        d=google.com; s=arc-20260327;
        b=cuoZtNs5M4pS9czhZqpxo0vq84DZLM7d4OVajFI0g5tD35SkzzM2etr5OJjUR4e3u5
         2Ew1fzn2pD7/56Agur739Xfak9W+YLuOe7l7BRZiLMy1Z7LWtWTGEiwaJTw+PgDuUXTC
         KQvSVYgv3EEUIyv9YN3y/mHbnjG3GkRaReVnSeKkJvXidUpLxI7V2cyqa4y2eSnKJDpN
         MEXlqrPWGSOcw6oyKX9aWYOEzuRFZL0jpBVaAYwfND9aE7dAg1qJP9Z0Clp+3/grPDrX
         DJzXdXYIHOkjQrlIyDujhqUlhmGuaTgSRebhDaB9qRnjXqboR9W7T89Kh2iUlxpySIzR
         yHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AuqEvetTId+KGd9+1A3sRuao4CeyCeXTKq86oAL9AY=;
        fh=O+KK6KOL+y8winuUxp1EENerIS4UWusCbnA+ndK+XMc=;
        b=e/96f4cVWO+U/Vt0EZNuvIrHSP9vpgdK+L7y6Z6arlwpapzy+xmU7JhVi6o7Y+evb0
         RN7t13nhgfW8EEhvyyg6F1on4xWTHpRPhwdIdOqqGPXpTQbRMUqcS5FViyaa5G+F1nD8
         NllVJMJTHFx9+B4VT41LGF1qE0+ybiME5r7K+q/8UoQEXz+Jg+RY9hFhkx2BLfmTmkA7
         6h6xyxqiA8oxfBFoZUjz9Qh4pVEDsEwSjo+p7CISq1pjpDrwZaxpjgR6/Gp4yKkGq5PA
         Z434hwFAMpNNXNTvlla384fAXjhLRZph94hQYtG1Z0YzDFWXvIjTBb7D8GbYsHRX/sbt
         acAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792641187; x=1793245987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AuqEvetTId+KGd9+1A3sRuao4CeyCeXTKq86oAL9AY=;
        b=LOhbp3WFEcFQe0IjMecKk6I8Kz19GoZar+AHkRdzrCDmEfKyIagdj3cguFRCodjIts
         2K+ZlprU9+K4p456yAE/IebJt/JB/rOfVvmZQmmoWzFFV7Uhk9UJSYbg2Fi1Pe2vOULY
         KWEc5d2pfc2rk/Wh8DzOHlqJ+zuJg1V4nJFaELFzei42i1+yKzrhAiPXdJNMVP1K7p2m
         JS+2xJhikQBG5/GE4vNgGWxkijWuhVZaAZ1XGHPbtlK5UQYpIIH4ZScYaaGOx5D3LAiG
         M7hw8fmN7YUpuY/4QKg9bEL+8FY6TOxB9TunTmZ9BJhIgSXGhPcPvi12WcAM+CvE533E
         FA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641187; x=1793245987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AuqEvetTId+KGd9+1A3sRuao4CeyCeXTKq86oAL9AY=;
        b=BKCPc024oPNkiTtfJn5jnTHZghscPIbOzbld216Ng1FCbSqZf3JdH8SxSuQSrzcuT5
         ZUXMDUApiAQ/+EooOueS6Q6jPR0LnXJcpbfBMYCh7Y00ktRSjyh1PWRJ019n5NrI+24Q
         Gtbu452gHYdseHWDbcackQM0O1w3TQ5xT3uvvOtzeBpTfq6FIinggNYES+qsbOzGInz5
         roLLpFDtZPsz/A9jlHzBZ++ZiyP5SYU9r1tPOM95XK2RWELr88omzFI6adRqMth7yTkr
         jwX1I0WjGUuYFqF1+EGqcO9/DRgUYA6tIhQMRvFrrdHXcDxf3Ok5nJIz/sm4xtE0Sjk5
         nzgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNeD9UOQb37lS+TF1fWxAcDC2ZmMQ/8VXo5b9bhrC9aGrojxFiS1iQfuCXqJuZShunjC/+uOLP7jGjagc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxrPpjJD0R+X7kLuglCwAl+o4HN5KF2mA1w8apX9gM6WnYMdP9
	wX+Kyzhw9qL5If1Lwm82V6PL9SGVixztXyOaeztQkhLoFtKD8BRLQ7OtYLeyhj1y60eaBUtb+kh
	STLIM/J/gYVh51TudxvB0yBRv2lQ9R6kX0mYVuWgg
X-Gm-Gg: AYBFou18agBVz7KS6BVLbK6oS5eqKr4OY4gcaq492yIYhz8Kj9jZ7MnfRhF7hj4SHc7
	LQEV/ggwhZg/D9CYS0IbAKQVQrC0qrtign0Hu/i80NR3SLi5SGHxUCukdqnk7R537y1JSv7BGZe
	MK+EiV1rGf/ZTN7qNKVBaxMr4Puu5kLfzDSDUHU7D9XiiPJYqyRNcan6Ptvo377qdTt7t+Rd2Le
	gKFLKfZg836tZRxufGfAUx7g5WLiMuqHoGK4XKXlR1kHTBmd7wfr3+xDA1EkjX1UPDE+iwiIFzA
	xTVzQt+sjynXja45Hqekoz2yQX5pcEJl+7PfiDjglHJ/Gsi3m1zoMcTVQpIR8pgi1dyQvf7wmkD
	pLN1jPey8BHri84zNqOpixs5WeVfynVLyPczAuA==
X-Received: by 2002:a17:906:dc89:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c46791a979emr355026566b.6.1792641186777; Wed, 21 Oct 2026
 20:53:06 -0700 (PDT)
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
 <atl7peoVHdP5hz7z@google.com> <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
In-Reply-To: <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 21 Oct 2026 20:52:39 -0700
X-Gm-Features: AclHuK_94mheSr-cOV0RjUmA5boG8AcWT7XfL_o8Cm1BzPA_mpTiDbYCVzKwGVg
Message-ID: <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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

On Wed, Oct 21, 2026 at 8:32=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Wed, Oct 21, 2026 at 10:57=E2=80=AFPM David Matlack <dmatlack@google.c=
om> wrote:
> >
> > On 2026-10-21 09:26 PM, Pasha Tatashin wrote:
> > > On Wed, Oct 21, 2026 at 7:28=E2=80=AFPM David Matlack <dmatlack@googl=
e.com> wrote:
> > > >
> > > > On 2026-10-21 02:50 PM, Pasha Tatashin wrote:
> > > > > On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@g=
oogle.com> wrote:
> > > > > >
> > > > > > On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com>=
 wrote:
> > > > > > >
> > > > > > > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> > > > > > >
> > > > > > > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <taruns=
ahu@google.com> wrote:
> > > > > > > >>
> > > > > > > >> LUO and its file handlers validate handed-over state with =
monolithic
> > > > > > > >> compatibility strings ("luo-v5", "memfd-v2"). Any change t=
o a serialized
> > > > > > > >> structure, even an optional additive one, must bump the st=
ring, which
> > > > > > > >> breaks live update between adjacent kernels. Replace the s=
tring in
> > > > > > > >> struct luo_ser with a feature header, so that the target k=
ernel can
> > > > > > > >> accept or reject the source kernel state per feature.
> > > > > > > >>
> > > > > > > >> struct luo_feature_hdr is a fixed 128-byte header: the ser=
ialized
> > > > > > > >
> > > > > > > > This patch is all wrong; 128 bytes is far too large. For ev=
ery _ser
> > > > > > > > struct, we only need 8 bytes instead.
> > > > > > >
> > > > > > > NOO, It is not. It is intended to avoid complex mess with unn=
ecessary
> > > > > > > over-engineering.
> > > > >
> > > > > 128-byte per serialized struct is not starter.
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > The first 4 bytes are the size, and the next 4 bytes are fl=
ags (i.e.,
> > > > > > > > 30 feature flags + 2 reserved bits for flags extension). Th=
e last two
> > > > > > > > bits of the flags indicate whether an extended flags field =
is present.
> > > > > > > > Each extended flags field is 8 bytes, and its last two bits=
 indicate
> > > > > > > > that yet another extended flags field follows.
> > > > > > >
> > > > > > > If we will have dynamic extension of flags, Think about this.
> > > > > >
> > > > > > To support dynamic extensions in a backward compatible way you =
want
> > > > > > something like this:
> > > > > >
> > > > > > struct luo_feature_hdr {
> > > > > >    size
> > > > > >    flags
> > > > >
> > > > > __u32 size
> > > > > __u32 flags
> > > > >
> > > > > >    extensions  // offset of first luo_feature_extensions (or 0)
> > > > >
> > > > > __u64 extensions[0]  --> but the size should be specificed in
> > > > > declaration macro that I showed in the next patch.
> > > >
> > > > I think you may have misunderstood what I meant. In my proposal,
> > > > extensions is an offset to the first extension, not an array of
> > > > extensions that immediately follow the header.
> > > >
> > > > If the extensions immediately follow the header, then the number of
> > > > extensions is baked into the struct layout. Every field after them =
sits
> > > > at an offset that depends on how many extensions there are. If we e=
ver
> > > > need one more extension, all the fields shift and old and new kerne=
ls
> > > > can no longer read each other's struct. That is the problem Tarun
> > >
> > > We can structure it cleanly by nesting the payload: something like
> > > struct { struct header {...}h; struct serialize_data { ... }p; };
> > > That way, the header can expand dynamically at the front, while all
> > > fields inside `serialize_data` stay at fixed offsets relative to the
> > > start
> > > of the payload.
> > >
> > > Since the header size is self-describing via continuation bits (e.g.,
> > > the last two bits indicating whether another flag word follows), LUO
> > > can
> > > easily compute where the payload begins in the incoming blob. This
> > > keeps the implementation simple, avoids linked lists of offsets.
> >
> > Oh interesting. I agree a dynamically sized header at the front can wor=
k
> > and is simpler than a linked list.
> >
> > So the header and the payload need to be separate, and the payload is
> > located with pointer arithmetic on the header. For example:
> >
> > struct luo_ser_hdr {
> >     u32 size;    /* Size of the payload in bytes */
> >     u32 flags;    /* Bits [31:30] indicate an extension word follows */
> >     /* u64 extension words follow while the continuation bits are set *=
/
> > };
> >
> > /* Size of the header, including any extension words. */
> > size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr);
> >
> > static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
> > {
> >     return (void *)hdr + luo_ser_hdr_size(hdr);
> > }
> >
> > On preserve:
> >
> >     hdr =3D kho_alloc_preserve(luo_ser_hdr_size_for(nr_ext) + sizeof(*s=
er));
> >     luo_ser_hdr_init(hdr, sizeof(*ser), ...);
> >     ser =3D luo_ser_payload(hdr);
> >     ...
> >     args->serialized_data =3D virt_to_phys(hdr);
> >
> > On retrieve:
> >
> >     hdr =3D phys_to_virt(args->serialized_data);
> >     err =3D luo_ser_hdr_validate(hdr, ...);
> >     if (err)
> >         return err;
> >
> >     ser =3D luo_ser_payload(hdr);
> >
> > What would size mean in luo_ser_hdr? The size of the payload or the siz=
e
> > of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing s=
o
> > maybe it's just the size of the payload?
>
> > What would size mean in luo_ser_hdr? The size of the payload or the siz=
e
> > of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing s=
o
> > maybe it's just the size of the payload?
>
> Either works, but having size cover the combined hdr + payload
> provides a few extra guarantees:
>
> 1. A single static_assert validates the entire serialized struct at
> compile time, including the header and the number of ext_flags
> elements.
> 2. Bounds checking while traversing the header continuation bits on
> retrieve: we can sanity-check that luo_ser_hdr_size(hdr) <=3D hdr->size
> so we never walk past the end of the serialized blob if there is
> memory corruption.
>
> If we declare the payload struct separately and pass it into the
> macro, handlers also get a clean type for luo_ser_payload(hdr):
>
> #define DECLARE_LUO_SER(name, expected_size, ext_flags_count, payload_typ=
e) \
>     struct name {                                                        =
   \
>         __u32 size;                                                      =
   \
>         __u32 flags;                                                     =
   \
>         __u64 ext_flags[ext_flags_count];                                =
   \
>         payload_type payload;                                            =
   \
>     };                                                                   =
   \
>     static_assert(sizeof(struct name) =3D=3D (expected_size),            =
       \
>                   "LUO struct " #name " size mismatch!")
>
> For example:
>
> struct luo_memfd_payload {
>     __u64 pos;
>     __u64 size;
> };
>
> DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);

This looks pretty reasonable but I would name the payload
luo_memfd_ser. The combined struct that DECLARE_LUO_SER() creates
should never be used directly since the offset of the payload in that
struct is only valid in the current kernel. So I would give that
struct a special name that makes it obvious you shouldn't be using it.

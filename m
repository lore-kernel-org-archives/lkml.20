Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792960747;
	b=domVA6c84W0HGn+/l9v2Z3P08TDykQ6N3u8srsZa08xNGn6EUq+FzLMAOQ5LEB1/zORR
	 lfPGKGspw2YQW2VCOFz3PQzbNO9Y4Uo/lHhQzDMQsYLjdWc64l7zuIFxDAmL5Z+hdK0gB
	 RjlXRotxre19oMAb3ciSN/4Wedj/h8hupbOHIfS7G2zG6kDcd2yq//DrMvLVpVLa7KJiU
	 39JX0rJTnqLQ+6DXUR+sObnbHl+cbBoS93zCbvbdXa1nUTxnJzTFIuyM5XP/1t6zlriFm
	 29ClNOB6d5+i7TcBnRSbH5tSr+m/Wq7I+RD2RlJDRYTPXb1Lef8iTMtMIq1ket5Wk4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
	b=22Kd9Wmr13PmsFGPn9amnWF1G36rODmdqFJNTJZaBx6d9QsGmVnSC5Rzm0UwB2KWYjlT
	 Zh5SH3rYGeYqqsBuFlzpRuUor+MMTTpq+JwLCFCwQQ5r+bPoyDupGGw7fMejQ/sopOVPy
	 8if6d2kIYbVzKW+9QMa0/luheGwTCdtWJbwrlaBsBCaAXeW3R9fMNzEehK9ap+wSNdQD8
	 pYnlaXxFFEnVb6zMP1WQLD3Us4kuSStyfWLk71OwAo99zX5F2tNR2gox5xfCJRwJSyVyh
	 iMxBGs5kovwH6ImQg4uqssU/daQ+JCo+wlEkXy/ZQYiGgNK9YPl9bWGVb3iMzEen+Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="DV/IgpGJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D6606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DV/IgpGJ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3340101a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792960740; cv=none;
        d=google.com; s=arc-20260327;
        b=GzhjccrMsgsbplUJ6Xms66a5xDNEm8wg2mBuxswAelLB50kN1wb57lLFzN81HFw58x
         M0B4X7Bit8pKQFjqgWYDX5YK4BrvfvwkmVZgJd0yul6RNmBPqxWyJOOAL0UbQA8DkJxi
         zSPasV72Hg5BOc4pZuIMbpzybxL9/p42yFI1w+TYgEDW0YO2SJHMu7ycQZ4XFZSUSN5J
         puh4HRlxYld4l2cmrOzluEw4FzRsouAvHQHKJVx7rXYv3OE50IhQ86zefKaw+0q6q2FD
         2AuS4v5w2b9N4EzagDLKzluCIFt89brwhH+BYqNdyvdwyyOJvc2PfMccx9xiUyWVwL/m
         dyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        fh=feZNKBy62XdIacjQkm3SH0yTsncG67hRh9CVSZRwJq0=;
        b=C5cx/5nKhvEa8pKjzFzQZ0e/Tl3v7ZffwgqSN+enlehNWXE0qUU/WWrIIGH4oCPmbD
         Xn9gJYWAcxq7iESLTpDRlW86oYhp8HPVsS6IGcGq27FdHXiKwojJflWoqmw4p1YgwdXe
         pkLbcq3ud3d3Am7lIXnEyK7Tt4XiFogrKArBpwCGN+rIeOqnbKtK8dS31KJAaERJXjRF
         mPuJEQz0jKw8BuCkrekSy3VeUJRu5UzVOc2DQKC663ZBds9dPKxTmL4et118CNr6sIj5
         KZUL5WFNZ4og+WR/LjlMg3R2vKIruDuFX4Yvy0d1mWCgx6u57XJ4yM9Iyvu+lkceSV8k
         8kGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792960740; x=1793565540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        b=DV/IgpGJYzHRXuQDz7DQM0HJY1y2UrWNoj0k9X7vIPdFhTzYbG2hBmzcVoIVY2rS9p
         NRs++i25KutZdEuCIAHKRbFKGEPBoSjokCvm08oMI3dF54EWKUpwXkAFFzWufQVPOsA+
         Gtzn4u8LSb4Fyrciu2eYaaDF1hjmKE0IoXlwpgptO1gt/8O+qxvWxkOIloKbw/bwrMTh
         4pDHCTEIr5/B+DddD3Mdiiu6NgkrFH1jIcgPur2TUw4F6knSq50Qdjy08mHwVUwvH8pH
         KfG5oA5zgGEOmHdXHrATFd2caZEt+SauSD57pYnn8BwZhbAxA0eC5Sr8CrRMjnKrM/LF
         txUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960740; x=1793565540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        b=QENmiG6FxM/wQ4Oz+pzlStludxdAW8iLnn0ei0/Qev+O9tEvx1bvDDXnMTGR6EUnOt
         cRZawxKzbbLa8GNdCrK5sCWz8hIM+EnRz/M/2FUvNhUX8x7973mRo3ICJuj/9WWeRM25
         pVRxrbbGgo3hE39XbxM7unbgJOspePJfL9DMW3yhNYksuIP62jD2+kHUA3yATSihXrC7
         S87iLMgfyB3NJPFv41nW5IBdeAiMPLOBbbp6UR3QIZP3qGh4H0LcjXtV46JcC5aG4J5U
         5EEdez/gGb0GpxdqNa2wIuneYL/PlNdQ+/d2xS/xsE6/PPwJIooUNMYY+O2qJTLumfG4
         X5xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDSg8xLidymE+QC/zJUGVs+YE4ajlnxGK/YG1YrTc5Q5sh7AN4m/an89WNKbmlU/B+RiMnACdCcELYICg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuQibO/4sutWBUM/Hsb0D9Iij42IK+c+JFfuEGTHJmIjq7KxBw
	JnZRFWT2AclRNayZSz0beirZ2qzf3ZQzXUzbwqv0ttwDjij32dLCF0mBV/okT4TFOsyN7XAR0ik
	0lUsfIfMx1fxPFJGs9XVlTlrazF6WSCCDfWsby/6Iog==
X-Gm-Gg: AYBFou3Lniulw5LHRA+sfyTLGWS1ON+RX1q1QrfwI6s68qrMqQVvx6twj0i4Z+7LOqJ
	WIkqNyMR77bv053IUowEAu/3kDwVFkw3OM9srKn3vW3UlZ4IwCAz8xGcXUssbsx6SMHDn1zu07I
	4+hUw9b5OvW/XoswWcjmKpuoLPF5RdjI2k6JLNp3tUlTgvs/sU5XA+OE16lhHh8C51kmL3Y+90W
	gEOJ/uksDbT9Tb9u4rH18fWzgXm3BqOmNnakbmmsw21E0DsZdOkBoSLwm+AjLT78XnNjEN8wN6a
	/FR9w6gU9iPem9fS50oFZoN1LTe4MtU85Cpehl0/nRlFwYI/qPS/8CsSM4T+vy15vYjwYkjhRSG
	23cR7EUcKZWq2dhrB1hDdBhU75bGAR/zkYvnptSFJfJLPJR5t6U5/1PlBAFQp77aLAbLH
X-Received: by 2002:aa7:dd0f:0:b0:6b2:2339:370d with SMTP id
 4fb4d7f45d1cf-6b443000b00mr4543991a12.39.1792960740017; Sun, 25 Oct 2026
 13:39:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com> <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com> <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com> <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
In-Reply-To: <attmFVIFU_mS0Y7p@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 25 Oct 2026 16:38:23 -0400
X-Gm-Features: AclHuK80OiwlBnY6tUr3jZ6atHcY2MdRSOFYk5-Bhewn5rIfzUZ_oGQw-LNyjus
Message-ID: <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
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

On Fri, Oct 23, 2026 at 9:50=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-22 04:53 PM, Pasha Tatashin wrote:
> > On Thu, Oct 22, 2026 at 1:51=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > > On 2026-10-22 12:11 AM, Pasha Tatashin wrote:
>
> > > > Lets drop the fourth macro argument and generate the combined struc=
t name:
> > > >
> > > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)      =
        \
> > > >     struct name##_hdr {                                            =
        \
> > > >         __u32 size;                                                =
        \
> > > >         __u32 flags;                                               =
        \
> > > >         __u64 ext_flags[ext_flags_count];                          =
        \
> > > >         struct name payload;                                       =
        \
> > > >     };                                                             =
        \
> > > >     static_assert(sizeof(struct name##_hdr) =3D=3D (expected_size),=
            \
> > > >                   "LUO struct " #name " size mismatch!")
> > > >
> > > > For example:
> > > >
> > > > struct luo_memfd_ser {
> > > >     __u64 pos;
> > > >     __u64 size;
> > > > };
> > > >
> > > > DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);
> > >
> > > I think we are getting close, bu I have two remaining concerns:
> > >
> > >  * Reserving bits in each flags word for continuation leaves gaps
> > >    in the flag space that users have to know to skip.
> >
> > Yes, but callers should never manipulate the raw flag words directly,
> > and we can provide simple accessor macros or inlines that take a
> > contiguous feature ID (0, 1, 2, ...)
> >
> > enum luo_memfd_feats {
> >     LUO_MEMFD_FEAT_HUGETLB =3D 0,
> >     LUO_MEMFD_FEAT_SEALS   =3D 1,
> >     /* ... */
> >     LUO_MEMFD_FEAT_FOO     =3D 15, /* Automatically lands in
> > ext_flags[0] bits 0:1 */
> >     LUO_MEMFD_NR_FEATS
> > };
> >
> > if (luo_ser_get_feat(hdr, LUO_MEMFD_FEAT_HUGETLB)) {
> >     /* handle hugetlb */
> > }
>
> Sure but why deal with all the complexity just to save 8 bytes? All of
> these structs are allocated on folios and there are kilobytes of unused
> space to fit this header. And even if we optimize that we are talking
> about 8 bytes per FH/FLB... or 16 bytes for structs with arch-specific
> sub-structs like the KVM ones.

The reason I care about keeping the header compact is that we are
defining a foundational kernel ABI and want to use this header across
almost every serialized data structure so we can evolve them later
without breaking compatibility. While some top-level structs are on
sparse folios today, other serialized structs are tightly packed, and
we are looking to add KHO slab support in the future where tightly
packed allocations will be common.

That said, in your proposal, as long as nr_flags =3D=3D 0 is allowed when
a struct has no feature flags yet, luo_ser_hdr_size(hdr) is already 8
bytes and only grows to 16 bytes on the first feature flag. I am OK
with that.

> > >  * struct name##_hdr only matches structs written by the current kern=
el
> > >    (in terms of length of array and offset of payload).
> >
> > This is not an issue on the incoming path, we never cast incoming data
> > to struct name##_hdr or access ->payload directly. Instead, we parse
> > the incoming buffer, dynamically compute the header size from the
> > continuation bits, and cast the payload offset to "struct name *"
> > based on the negotiated feature flags.
>
> How?
>
> This is the only data structure that describes the header. Are you
> saying the incoming path will parse the header purely with a void *? Or
> use this header but just be careful not to access payload?
>
> We should have one header structure that can be used on the incoming and
> outgoing path. We should not have one header data structure that can be
> used on the outgoing path and one that can be used on the incoming
> path.
>
> Also we need a standard header that can be shared across all structs,
> not a per struct header. Otherwise you will need to do weird casting and
> overlays to implement the shared helper routines that parse it.

Having DECLARE_KHO_SER_WRAP() in include/linux/kho/abi/ makes it
immediately clear just by looking at kho/abi/ which serialized structs
have the versioned header and which do not, while also enforcing the
header when preserving and static-asserting the combined struct size a
compile time.

So with your header (and let's use KHO as we want to version KHO
structs as well):

struct kho_ser_hdr {
        __u32 size;        /* Size of header + payload in bytes */
        __u32 nr_flags;    /* Number of features encoded in flags[] */
        __u64 flags[];
};

The wrapped struct will look like:

#define DECLARE_KHO_SER_WRAP(name, expected_size, nr_feats)                =
\
        struct name##_wrap {                                               =
\
                __u32 size;                                                =
    \
                __u32 nr_flags;                                            =
    \
                __u64 flags[DIV_ROUND_UP(nr_feats, 32)];                   =
    \
                struct name payload;                                       =
    \
        };                                                                 =
\
        static_assert(sizeof(struct name##_wrap) =3D=3D (expected_size),   =
    \
                "struct " #name " size mismatch!")

On the incoming kernel we don't use struct name##_wrap, but we use
struct kho_ser_hdr for the wrapped data, validate the flags, and
unwrap it via kho_ser_payload(hdr) to get back the struct name *
payload type.

Pasha

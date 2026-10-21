Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792608694;
	b=MpOm+Tf5oxGxRqN8cAI1shzqQd7ufr6vxIzzPVWdkKG76vQK507wSQ2zc1tL3oA+QgHC
	 ShcuQPCz6ENV4qaLfZ6kucoSzl5KGv4LnyWc9PLijJv9/MxKTJefLC8WJIhwoYfoPwN5r
	 kpQodIpmCgtDoLSU8VdwYKNS9FMe4fmBc/TG3bj/M2xCiP5ZsYmCymAIUyzoNgHxRprOs
	 U0T89NTNxVc1+7S2l0sRhcT9YoA0xZ3hXpaChGEiJJHbsS5UWxv/r0pa0Fscs+Yfu2xIc
	 VrJwYSMBWVdvL77GxkMNQj/+lLtW0efFxxyjollQI2s+zf20yofuzn6MY/fNlW8QhaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
	b=D2NQ4GsW0jz/5WerwDQldTBMp0UcSWcHYmwlObeyH7w0qf1bTQowqlW4gT/+OwMY0pZk
	 4AE+3//O5t9K6qR/5Jl/qRaK/n4XJxmOzTbyJKxP5bSRKnrnVWKXT6FRhhDjmzjZSQR0u
	 T+8hF8ha/yMoo+18E95GAd1zFIKymG2EHsiBPkPpJ78TAvWluqPeB2Ga6KfaWzRf7i6Uw
	 Ab3wHrZjLVSlw14wrQyWeOKpXK1fccQ2pML8tV46sBCPr7TlI9HC1wXqxi+BdOM0MNjWC
	 MlCTtR9Zh0PNy8xUAskifIPcC2je8b3TH1u8RIrdfkBhKyofGiq6iwxGfO8udEVEV4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1069606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1069606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so1131804a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792608692; cv=none;
        d=google.com; s=arc-20260327;
        b=hY5UIzhVcxeWkTcACIYFZ0I8xaDPoKWaMjTGV42EiQiUHbM+Qkd5u7ZhhsO8aBlyzs
         JD5osAFmAVb1sqBKcvDLS6jsvfS6jqJD2eEazy0hrblPIbZ50P0Txz4QnPGBkzVleDmV
         O8ZjPIlUDTdZ6akeV1HDOcHURLqOdfTLHD3d3pSXTlAUUT4KqQ5rNYAlZa9FyAPHEy1s
         xKAvpqNPiayAnLl8JSvRq8l2Ex4Z5LoAu/8sLjQkDQH0St6gta2qsULRBd7ik8CES+n0
         tTwQ2niD00DQcpytbalhz7IfCOG3CYJf/r+xa6sQXOQI7JOXMlAaMhpq7wqBSjKr9l1G
         JX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        fh=LAXcVLWLtdSkTso7cFuDhyAPBgjUzDmc37yMCal3jhQ=;
        b=f9UeIp6EtJs8ByBbQO5YITQqdA2HSKea7ZPNstwAQ/ndLa1ubR8rbS8ueHO8GabEnS
         uuTpJ4ZYZp1JZW2jMvnp/ioaDdMgdffpjCqJW//CEnuevCDkV7zv4BwpT5RjTeEfm+Xm
         1eCZOcAzY+t4V6kly0nBojkthcO4v+8TSipmBu+aZIjR1676k69JCzXYxFYHE0s8sPqT
         sJlIU9iMDtSLI3qSqM5VeS/Z6mIaQcENrVG69y2qthBj1htfhMLvIggsYcDNU2t1BuLS
         DYIKAv3VMfTB3xBRNpSCtBmvj5LKmEPovUmUXXutd6G9zn4PPE5KPE5J0dwZwXLOmdAX
         fBhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792608692; x=1793213492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        b=HlE8O8ANX0EKpSe16g+iBaKuq+PflNI/nF8nfZx6q4OaNXjnD3WcfTP3ZxUZ6C5yww
         AQBlVf8uKRAHdsAZlJ3nOI2KRDtgeKEzjh6KweWDxu1SToMmLpwutL5+Lhr+woZoPbMT
         N1VnHlS+CynNKAT7F1IUt5thcgbaiveM8ggBR3Nw16XMDjcQGNRcVcNo5SDcaGJ27VgC
         SQZcks2KlihqbrkzWQ6XLWFtJ/xz9Gpgi9JXe2qQ02aMC2CNEezI26fvbSwiRyYprEUe
         g6GxU5sGPGr92AGt2GfoO7lQG5xEts7k+b+8LB52OVC6Pn4O+EIbicTODb4yWZNAA2oj
         0ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608692; x=1793213492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        b=cuTaPNlfqybhJYOPfAOPPXg4MUDtlbl11Q2JnZE1jZlwAssWZi6SKjTMrtWGndzZ2R
         vL15GcqZfEyKYzn2ides2+63dgbRkntpX1aTs0Hbege3SUC/JyRPuuylRVu2bSi1S3Om
         Fuy2Napm3BmvCmZ3JSG7U9iyQ9Pf0XGVgbkenguLhwb2QzN/UzCR2Wi5P3LamuRDB2Bq
         LMVTHIVxgm0pB/OsqemOwC47DWQBGrz3xhsYbpgkpHo04RggwRTcZEqqbbvpDl2b6lHK
         amjP64roTJbixZtfxjbZrR4Z35h+7xLVY/3TzBp04opjNrC22HWcvlLSx9Oe8/8vE027
         ufVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAMBRA3/TJ1av3G0PBEgpPxj4xkrfKIaJJ5UXho8AgqTQae/N1pv4CwIxoMFp5ObeDqbKv/SUg3OWRDX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWIMeHIm4ocqxG46yiRfC5Cv5f5i9F6V3JUqqayoixHVOLCS9f
	U1fXLHExIF4EmrCwPYxI2BV4LXIBesGWPFgafsXyhLC4IfeUPEVOKFSrFnNbcm+XviAuUj7mxVN
	a0x6q/WWy0Tk5Hp6P2q9edX5pkwvo/F7sxpyK5j1sEQ==
X-Gm-Gg: AYBFou3rVDVMPro1xUgwF7OFzaN37eLrs5R/iFDX2WL0IifTRqma2GtaMTybjfvQYvd
	UUhasNiDfxwtjIpETWaOs2dzXvGTf3gcSMIpMtMZuuCQOdA7BctFq3qAZMEosO/UfCBrcrLxLqi
	ny3hCkriddOzU00Iopi+8mvBWnBJVAznD1i2Ju6ub9wwZUnQbfbTkz5L0/oCDNNAGcnoEkjFa1Y
	KCCCt9QKPc0YfIjqYG/J2/qEF7Oax/In6RiJIkUvka29o+++YpvmPPNBWL90HkbWucIIvCFaZTd
	rAxruVi2v6NI0HXSEuvVJLXXMmzlGxJJijASi7aLRo6CSSAHdVF24PWVSxDzeXg5SzQUyUKt0AA
	2qgXxX9pPBuYo+eUNCTkkBlGtUOFZ+d2w0aa/YPXqT0BOrh9EtuQMiJdM5VrpxzoE7Dg=
X-Received: by 2002:a05:6402:241a:b0:6b4:1df2:244e with SMTP id
 4fb4d7f45d1cf-6b41df242e6mr53870a12.38.1792608691873; Wed, 21 Oct 2026
 11:51:31 -0700 (PDT)
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
In-Reply-To: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 14:50:54 -0400
X-Gm-Features: AclHuK9td__2XcAMViewCe_NhDoA_TjTC8gr4y8u3SANqGewpEKZoTgIKv6iXME
Message-ID: <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> wrote:
> >
> > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> >
> > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google=
.com> wrote:
> > >>
> > >> LUO and its file handlers validate handed-over state with monolithic
> > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serial=
ized
> > >> structure, even an optional additive one, must bump the string, whic=
h
> > >> breaks live update between adjacent kernels. Replace the string in
> > >> struct luo_ser with a feature header, so that the target kernel can
> > >> accept or reject the source kernel state per feature.
> > >>
> > >> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> > >
> > > This patch is all wrong; 128 bytes is far too large. For every _ser
> > > struct, we only need 8 bytes instead.
> >
> > NOO, It is not. It is intended to avoid complex mess with unnecessary
> > over-engineering.

128-byte per serialized struct is not starter.

> >
> > >
> > > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > > 30 feature flags + 2 reserved bits for flags extension). The last two
> > > bits of the flags indicate whether an extended flags field is present=
.
> > > Each extended flags field is 8 bytes, and its last two bits indicate
> > > that yet another extended flags field follows.
> >
> > If we will have dynamic extension of flags, Think about this.
>
> To support dynamic extensions in a backward compatible way you want
> something like this:
>
> struct luo_feature_hdr {
>    size
>    flags

__u32 size
__u32 flags

>    extensions  // offset of first luo_feature_extensions (or 0)

__u64 extensions[0]  --> but the size should be specificed in
declaration macro that I showed in the next patch.

> }
>
> struct luo_feature_extentions {
>     flags
>     extensions // offset of next luo_feature_extensions (or 0)
> }
>
> And then an example serialization struct would be:
>
> struct foo_ser {
>     struct luo_feature_hdr header;
>     ... fields ...
>     struct luo_feature_extension extensions1;
>     ... fields ...
>     struct luo_feature_extension extensions2;
> }

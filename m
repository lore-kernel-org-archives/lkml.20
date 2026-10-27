Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793122706;
	b=5sVX3Z8sNCYSTf3hqGPWKVTrx1zLqohnqueHyqSYbyF7+qV+beztZAhlDNqf55JaPfxY
	 WZNETsALVypa7zFi0fJOzgllzKzoUYIhg67IsF9RlB2zw4NxcA04iplZv1lg2/1MDx00p
	 IMd01fA6Ei7c+xbpCMfhRbkHT+C3NKZq9p+CGWurofRPhbxFu2p2wZV0JTvxKd9PbO2HB
	 BHR7wJONsda9nirBsPIh9hNGVSTRPvAZ8+OZSee5C9M++W0CTh045DpS9X4gBl0In8U5W
	 QkBn6hrrOIRmtnVGv8jJkrEBWRYuyxRCaFH7sujXduGaqaw2b6k0NmHdBHYUF0v5mbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
	b=2wA9BhYYeJjLHpfnB425rhH7T2vnhFLNIfC5xXzTGo3ieVHxFG1tFMSyPRv1SD29j2ct
	 xTXkc+bM7ZKr2PcodkK89FdS5lASBZC6wq79rSW3fMd8kRqZvPqAaaW3HfJytKtlZD99z
	 1GedffUwU6z1aisoIfkA2tw0V+PhuYnnEn9D0IAGFWqmrZjU7CbIufSWce6E7Fr30afdW
	 Yr76FZg8NDBPQfMZU2vTrYrcb4ZhUWoRDyA+o7LLDoOuih70XIof8Bi+MCYU0z597qRnl
	 8e+EcfF6W2sUOkdOAbWClPuF03Pe9j6fa9U1kX7WqFjb6OjKuK5f085AVWEQKi+WdQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BpaGH1Tx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A6606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BpaGH1Tx
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3fd91337baso9096866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793122704; cv=none;
        d=google.com; s=arc-20260327;
        b=gr/tHc6B4lLLkYuOFRE5mjHRepwE2X9xS+PM1l3keBfFXInKv3KH81Xox2fN/RdFzm
         PeHjxvy3XUymBtZsOW+ZelnJO/hN7PBWwkZjJVyX0uw5zM7y2pBtdgIsaFGyCrif7KdU
         VoIFhU1R8OHl+eZSR1nUjFwn7rD75vnM923I76OBj0wpwcvoT0ouyNo7rpEh6/Z0Jemm
         yfM9ULWrShJMFYZfyTVcMReSQQ/HD1Oe6/bee4Z/mMc0fIBGZ2AD2CD1JnL2z31GIGJK
         7p8NmYv/CIWbxyR+vGj75WwDmo4Bpj+7/clzyF+nCI53tu6D9UGm0mUeObKx36BAYk1D
         jLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        fh=zwbiGZPM/NM/4YCwkzTBlpWOF82dAbguHlv/TArnoEo=;
        b=KYo7813n5C9bK7MwnuOh7AzORnA7QOZiYqHbhfaKtaiaCpCpYxnrXWbm4HG17lC6ED
         7WxT8Ng8wR+A9YwJar5l8ILLfm4m6W8ZVmGgPlG/Dm0nurd34/XjwBI2Kr9Uvwqs7dSE
         2gWMx3nKwiLBRGVIlRcp7Gs+VRdvCrcLzDi3HRX8aQZZxSyUD8PC79j61/6mIAPfzxFi
         4CKV/VL761dtrnS3nYtU76QU0BN3PgP3Dmk5CKfQcLywfUu8c4/N5sk8YPk4dqLDztqV
         VwECw2mZ9g6HEcBXn7b2Iqrx8Jtu3sPgGHXvr63eTHUz40LZDmDj0chHrX9RgKTZJPdZ
         oW2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793122704; x=1793727504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        b=BpaGH1Txd/+w5/V9hrGM2M4C4HXHif8xNS790Y75yM+gjPsyf9RDVpi3ythXOIyyxB
         LHbA39OrkFv6VPnuEf7YxyrFUeKLqjhKTuodkRzxStOKPPqtkjvXRm8JON1kZARoOGZw
         G+WE5WGXAh0gXHbGB/5AAOkcpk6oAAotpa8S4NsTzjTX151h94ky5bJl/0uFFt8oqWBD
         dSi8tn6WRA1fzl/53FwPJp809JfuxeD+VFM72MMcHhy/yO2MVvMG4SAVojeP94ItGytF
         rFXKgKpRIjqswwKzrkuh1/hhW61PeuNmG2g6oTy0jNK4pMKDJifndJWntEqZ/Dne6xve
         QRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122704; x=1793727504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        b=gtvHYzTT6F/p+nOGAVRypZ79+aNs47W5MBku3T1A8bUYKjIOGooaOA3r0O0mfm8m/t
         GRlmaR+wEKG8IL1HSp+QEpCzGQ6JFf97AEWHAvBjsJocNWk2uj8ZyUqkKskz5rQmaqDM
         moTwLAdcz018P7364dZ009TgX46541bIc8/UIWNhlmShGBhdAfgIxpiYHE0K0lI28dSo
         RPGcSA0RmtN2S81ucG7i0InUtj0XodRqaYty9zgHkwr4FbdbOXiH25AmqU8Msu2i7kfa
         Cf1zlP+XCkjzW+WyT5ceJDbPffxEh2VNISrwNvIdo2+4/KFIwjUIp90WQ7dO3JxYWgNZ
         +ZZg==
X-Forwarded-Encrypted: i=1; AKwUvBx4oGfG9hVaWqrdDvg4+Uz3YZnmaw4iK2yQofbjUvlGNe3TE/Xl04eR069aE7d7DUqpzWfqvqFTuJbWRIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJroiHcD8DVGZjg+lCm5tytGYplgECwkgAe79KNFnXMe78CMwq
	T7S1gkeGpDKfh0ehxx4BkWWmgzPZNgsaMhhDNBJncUn8TCKmOaWCngow4CShA/EACM/SOeorsNX
	lF0yVmT/ZMkkpmNqbt01uhs+4ktR7lbSH5NBLrFbu
X-Gm-Gg: AYBFou1zrJNaYrdKj+FS8HpG1kbpHAXbB+mNFqEal8u5QvE47HwovL0G9IlEx0rsLNG
	SNDslnGHD0sDLFoU9xXZAXdn2A2hYh5ts1gfBr3U4O1L9NXs5cZBa0UHg5l9QaPUE4H28N0izGj
	oEflgqSO+kkyv4EpCmIOSOJEjj5shX2GSKoxI1RY5aijEiGbFwM7iTZio5ozsEVJcMRKMMAFM63
	vfsOri2qNamrz6SjWl+Cy6pm8EDGa4rD4yYeicWjha/FwCvCDP7EUINt9AuFUwKGoBziZKNUxnp
	4ZBh2/BhpucePHtfrYuJqtQGSChAidby8IypMRGA+X7DTrei6M2h6LGwvctouNT8Qfw19MTFUd+
	8k5juW+bpQE3WvFkWLYJUY/OAXTlA8XYd+Jwgxg==
X-Received: by 2002:a17:907:d308:b0:c2e:378c:8ce3 with SMTP id
 a640c23a62f3a-c46bde8c44fmr1091193766b.32.1793122703439; Tue, 27 Oct 2026
 10:38:23 -0700 (PDT)
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
 <atlQ_Er0Ig7CCSxv@google.com> <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
 <9huzzew0el59.fsf@tarunix.c.googlers.com> <at_CncIPYCxOVkLo@google.com> <auDT5MjXYq3lcQjE@google.com>
In-Reply-To: <auDT5MjXYq3lcQjE@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 27 Oct 2026 10:37:56 -0700
X-Gm-Features: AclHuK9nhZy1yfbGSOSB3h6FsOr-7RUqfg5DsC4iepC4uLqRp9MK3EAsOEkjOYw
Message-ID: <CALzav=dYKAP7pKfoPtz32X1cT_tH4LN0X47_jTO8_HOCT4Pi=w@mail.gmail.com>
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

On Tue, Oct 27, 2026 at 9:40=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 10-26 21:14, David Matlack wrote:
> > On 2026-10-26 11:50 AM, tarunsahu@google.com wrote:
> > > Right, Required bit should be source kernel payload property to tell
> > > target kernel that the payload must be handled to correctly deseriali=
ze
> > > the data. It should be source kernel (userspace) responsiblity to mak=
e
> > > sure it understand the target kernel before doing liveupdate.
> > >
> > > Saying this, During deserialization, target kernel's required bit is =
not
> > > necessary. So I propose the following truth table.
> > >
> > > Source hdr  Target supported[i]  Action
> > > ----------  -------------------  ----------------------------------
> > > 00          0 or 1               Accept: feature absent in payload
> > > 01          0                    Accept: ignore the feature data
> > > 01          1                    Accept: use the feature data
> > > 11          0                    Reject: -EOPNOTSUPP
> > > 11          1                    Accept: use the feature data
> > > 10          0 or 1               Reject: -EINVAL (invalid encoding)
> >
> > Yes, this matches what I had in mind for the semantics.
> >
> > To be explicit: the source kernel should set the bits for each Live
> > Update based on what is actually preserved, rather than generating the
> > header from a static per-kernel array. E.g. memfd would only mark a
> > feature present for memfds that actually use it. That's what allows
> > rollback to an older kernel as long as nothing being preserved depends
> > on the new feature.
> >
> > But looking at this again, I think the required bit is redundant. Wheth=
er
> > a feature can be safely ignored is a property of the feature itself, no=
t
> > of any particular file. Every file that has a feature present will have
> > the same required bit for it. The only thing that actually varies per
> > file is whether the feature is present.
> >
> > The required bit still has to be conveyed to the target somehow, since
> > the kernel that needs it is the one that doesn't know about the feature=
.
> > But it can be conveyed by the feature's number rather than an extra bit=
:
> > split the flag space into required features and optional features, and
> > assign each feature to one of them when it is defined. This is similar
> > to the required_flags and optional_flags approach in struct pci_ser [1]=
.
> >
> > Keeping the same header shape as discussed with Pasha:
> >
> > struct kho_ser_hdr {
> >     __u32 size;           /* Size of header + payload in bytes */
> >     __u16 nr_required;    /* Number of required feature bits */
> >     __u16 nr_optional;    /* Number of optional feature bits */
> >     __u64 flags[];        /* Required bits, followed by optional bits *=
/
> > };
> >
> > Required feature N is bit N of flags[], and optional feature N is bit
> > nr_required + N (using nr_required from the incoming header). The lengt=
h
> > of flags[] is DIV_ROUND_UP(nr_required + nr_optional, 64). Both spaces
> > are numbered contiguously, so there are no gaps, and up to 64 features
> > still fit in a 16-byte header.
> >
> > Each bit just means the feature is present, so the truth table becomes:
> >
> > Source bit       Target supports  Action
> > ---------------  ---------------  ------------------------------
> > Not set          -                Accept: feature absent
> > Optional set     No               Accept: ignore the feature data
> > Optional set     Yes              Accept: use the feature data
> > Required set     No               Reject: -EOPNOTSUPP
> > Required set     Yes              Accept: use the feature data
> >
>
> I like this proposal. I bet most features are going to be either
> optional or required, and even if we ever have a magical
> sometimes-optional feature, it can have its own required flag. So, no
> need to pay double the cost on every flag.
>
> Just need to make sure that optional features always start from 0, in
> their own enum, so the offset can be computed correctly in the incoming
> kernel.

Right. Instead of having a single 32-bit feature space where every
feature can either be optional or required, we have 2 16-bit feature
spaces, one for required features and one for optional features. Both
feature spaces span from 0 to 2^16-1, and then are packed into
flags[].

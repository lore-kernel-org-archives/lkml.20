Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792608448;
	b=Uo7uYzzvve22n8NIKrvkK4/iF+Ov8wUVO1rZaTMfWNMvQgw4jF6BlJLw6MpJQKLi0AIK
	 PDLpwHXGdh2FEZYtLUu9QCKWj1F0dwQfCCpqAzBNzZlH9d8ISvD+6wcu6IiltS4TBk1aL
	 VA2Z3kstt7awPdI5HWmkQnl9TYwbEap+Ppv1fCyV04lcP1n7e5N8d+D8gLYtkxkVtWp7H
	 ukLGtXnHvBYuFDJmvtDHabpVRJeCCr/wNTKsmJ1XdDhuOc2UdFchFTRf6mH5JzhTWa0ik
	 HsfG6pPonQ2PTAL1PzFMpSHCM1G76D9btyPyMIl4BdnAZpDS+kNn/rfdhBBaiXCFPDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
	b=eOYRtbUH3oWBfrrV62X9L0iy1YYFb7L1GrUPsCEEIcyI6K3Kya0/GnuM+r+tAjrHy3oD
	 Ly1SgJX5pKSbEX16P/ct6lrrkzedN+UEziP14ogtrSgGnVStjyI+gBUotj7ACOeYBCFHV
	 ASuKqYsEhsMPuulgCNPazz1pBkRAaVFQcbXHy83ue3GtPM3qmES+ZWTumhKtC0ZnrPu5R
	 oVPKSs9cb7UCFKOU0GLxBq7MwV2aW0cBvrVWFAXo1rmHIXVl6ZRiNqC21clWiTPJNbNWh
	 TcNZCIdj7n4LxyokhtOViAIIPsBweg3QKKyPkDJ3/aJXJczCfwUZO/YK2DnaP4q4wHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DR2OOg7C;
	arc=fail smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BA606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239BA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DR2OOg7C
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-188406bb948so595772c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792608447; cv=none;
        d=google.com; s=arc-20260327;
        b=sQRqebjjZoTK029YUgJVKbtFuTw3waIEJJydDlS25vtiqzTBQjrqC+GREJNSrdL4rD
         7PzQFE4YitTIZvCNNo//wXqBmE+zdmjOvdIa9Uv1rwW5+lx/fPQG6jpq8eSHt208dowS
         Da7fy71Hw6X0ESbszLyi+E2Jg3S348YMFv8JAREjBxeQSN377qk5C76yEhP3fQD0hXDS
         go1CzSjGtCRaJteX5RU99owqABu/IQ7ZwgIZ5Hkf1SLp3KaMOVQobb9RPTgKI+vtXajw
         qJqHz9Rk4HV6MtIHw2XSbsamGb+Njv0SuruqGJ3CVN8R+wr9BHOqDCc79CVAv8NGk2sn
         J5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        fh=LsDeTXLJJjl9/yQOqZLzP3f7UWY/Y9+qAnR1TrgtOTc=;
        b=ZUjBFfUTJ0Tf47zW0rZg6ii8yujNgcUHFKpbH/Gm7JMOEp0CP6ZUzrSGtyVsCdSR3o
         PrfqEN/RaooJ6lsB3jkNaj624AzszU0mCvJXExClMdEMAxoXSI6LTwOjVemdCkdsY2aM
         BOE0SEPsCPVLHtT+nD4P303rcAq5ME4UHD0NLlAWp1FPd9zcZUIePwESrzif4XGHjk9H
         2GRBfxBNyOqmrW+/7xKr4d6mPOyj/VNuDxr8RNB6UBjxBy44sAQwT3hW6qDYGoMfC1sX
         O4tujFF0yjYWYkA4BCy3aUzorXEqg9kUtyS8ovepYmXudw5GIb0SUq9H/lvGNdHrShp1
         X+ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608447; x=1793213247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        b=DR2OOg7Cokd9wnC8bGWcf8lnE2DgANN4OCX47zntm6YeIxiIKdkNlSyMxGIzvsC8Yi
         +nu2MxLclS6ixH5D2q6uhakgMGBvLuPrRsev9q7rp0TNMBZWLaYyjH6GNRMU3+3bgYS+
         EChGinr+36jPwXttho3bWPBhPi/180HSIH22UBjN0HNhSsGeFnp3Zp3WBQ9ISO4qaWSE
         HVGLY8cSkGFARoh78a43yh3zx5g3O2U4glOPTARO9x5/Sker60qfPLmgksJmd3PLAlKk
         4Obt94H05egCn92XPZL1YpBXXtsyOexkNhnCmVkqiwNzUFxWUOBeJaGGzRVlc3miZe/8
         0meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608447; x=1793213247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        b=I8tT21JfZmss9whYEEzWKe3nTWwFKsevqbhm9chADOW+xJX1jaMNXy93y213kLrSiN
         BRe9Jim2h+tFtyfIsC97+bffBU9eig0zU5RIr7ymaE+U6axUxERRrcsgeuL1zoD4SxZj
         54eKRm/58+63tF+n3C6FsFJeVGq7+SeHHusZVXAcrivO0J+Y9bdHl/0KU/s1y4N2jL1D
         3yJHDFkPuRZdLyuOtINxIpdaKU/TGvfJWOJkAOf0lIwGT1zKx7s0yDxqcBO6Gg1z3H08
         3cxUASMpnlGiiRlaFLWnzpvxh3Yx7hihB2P+H4wTyx+4F4WimGG1qRph1aSw9mA1Yh/K
         scfw==
X-Forwarded-Encrypted: i=1; AKwUvBzM6T/c3VLv6nXythPKIjI8mmA4gg/RDxuv7zXnIgFMmULd25P5ffCabzINw3bETO/FiHXP5NlsRv7Fe/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgUobJJdgpRWyZ3mdOq8frl5MOZY8VHqoEPtQYGEhB3dIgAxuB
	vbZuf+ELFssWAh2vKVCtxBpgplsSXiAmm6F3DzUbEc1uh6TUJkiktAndlMlhwzgPe4rPqOF2+9X
	mXuAofVnDLCn4buZGDxgEHreiiSudBFhpIBk7ukIY
X-Gm-Gg: AYBFou3vmEqFvWRJ7R3Cgj1omgnIgM+CLsxmeQeEA36uTl7eHP+T35ytO4o+xryjxES
	dtHLZktGrRXxGLcD2vs+JYKkoapS34noRU2iDxHHDphRVjb9107GXYz9Yof4mEF+4gRbONHV7QR
	nGCqv3mtafw0x3+rKxjI8ulKipFW3dl0sLExskQqRLVmIWAevbQsipuL1P1z9vRsYgzTJAEKkGA
	+dSTDPBAzQFzS+cwx6p6Wjnnf3uYmclCcHVEsFjTGT5D9Z/RKXlEYtjErENYjFwcZvKV+mzS61S
	/wVYbrGyu3So6Dwpwc4540JcV/EofuRljGtexWIgOnnDDVChDK00BHV07VIuKendHe3X36GJzgN
	heHLWRDqLQ0sVTpb6rPuNydqOU33WywNwbRdVg7JIe4iL6/9o9ZWSDU6x744=
X-Received: by 2002:a05:7022:2507:b0:14c:efa5:ee7 with SMTP id
 a92af1059eb24-190a4d18cc9mr4696437c88.14.1792608446024; Wed, 21 Oct 2026
 11:47:26 -0700 (PDT)
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
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com> <9huzecdi6go0.fsf@tarunix.c.googlers.com>
In-Reply-To: <9huzecdi6go0.fsf@tarunix.c.googlers.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 21 Oct 2026 11:46:56 -0700
X-Gm-Features: AclHuK9GVWu4pH4tc-A36maNXu-EHT2uwChCmCT-hqS2EBFk28gxkLJBLwcVEzg
Message-ID: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: tarunsahu@google.com
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, 
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, 
	arnd@arndb.de, jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> wrote:
>
> Pasha Tatashin <pasha.tatashin@soleen.com> writes:
>
> > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.c=
om> wrote:
> >>
> >> LUO and its file handlers validate handed-over state with monolithic
> >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serializ=
ed
> >> structure, even an optional additive one, must bump the string, which
> >> breaks live update between adjacent kernels. Replace the string in
> >> struct luo_ser with a feature header, so that the target kernel can
> >> accept or reject the source kernel state per feature.
> >>
> >> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> >
> > This patch is all wrong; 128 bytes is far too large. For every _ser
> > struct, we only need 8 bytes instead.
>
> NOO, It is not. It is intended to avoid complex mess with unnecessary
> over-engineering.
>
> >
> > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > 30 feature flags + 2 reserved bits for flags extension). The last two
> > bits of the flags indicate whether an extended flags field is present.
> > Each extended flags field is 8 bytes, and its last two bits indicate
> > that yet another extended flags field follows.
>
> If we will have dynamic extension of flags, Think about this.

To support dynamic extensions in a backward compatible way you want
something like this:

struct luo_feature_hdr {
   size
   flags
   extensions  // offset of first luo_feature_extensions (or 0)
}

struct luo_feature_extentions {
    flags
    extensions // offset of next luo_feature_extensions (or 0)
}

And then an example serialization struct would be:

struct foo_ser {
    struct luo_feature_hdr header;
    ... fields ...
    struct luo_feature_extension extensions1;
    ... fields ...
    struct luo_feature_extension extensions2;
}

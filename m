Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605391;
	b=Ota/2pen3bbiqJJGXacLwOFY4g3PKn6YbBVCXUkO5a0cjFjAaQtRLqEFn9EaHpWR40dK
	 DEe4FEoR01MGy3oIdOXMiyTlzVhTQlIfdsBwf6L+1o0c/4+DwFO/ZL0MDGZRTGzpF0txW
	 4SLk7yrN6JVXZcSy2w/nCKRgBGblu6Ettdvx6D59gIsKzJwAeLS0eAl/xG7C/Dct0RYRH
	 hFefEBVB6ysjSarPcbzXCVjxy4KgYpPJz539s59sziPyL4y1tVeFVin4vHO1muQVJBx5f
	 8VwzEP9SWvE47hJj0D5CfFv2gsnTLtgfU6kLNMT6XQQ7dKaZhl8YZ8WHH3LXXt5VHzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
	b=REC0cZC46QbvQFuvgfFrbAXZo8upa9pUSbrnegTuUBC17JcMivu+jaETZKeJ3aMG+8Tn
	 wJhRzokVWRTRATAUGD0i3fWyI/JkgdEkzoqgqKC6MEt7IeDtphoI0fo5ZYWfziW/8TLov
	 ya1dgTr4S3BLk6f81s+toHp5YfWN8AXXDPLv0bXxd2J6eSiP1fsCmJJICoAUL7uH1Z6uR
	 mKXxj0B7HIhf6V+wUiCiHKQ9X0080A50f3sWLnV9pbn1ONbuvtmFNQppffNaKK6JgocmG
	 jrzCfLJRCl1OMFcajLpkMLmiVD7IXrykFk6ewZNDjPn1zrdRvmtCRNpsGt5OGJD/M8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=CsnNkHId;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B5D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=CsnNkHId
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so840645a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605389; cv=none;
        d=google.com; s=arc-20260327;
        b=a+LNe2Q0oLFoEHFChUbovlDtCXl5h4hZ4momgPe3Pq3NMMW480msVKaW6mv4sythGB
         LDbStKDFyvRPSq5/f6BqwlgItPI/iW25HFzUhA0towRDWryaKOQEHUQ63oYoTW2UQ5AE
         qYExQqEYwvbldotnHvvcYyh72HuIND3v3vb4wsNqMAa6abteaIhQH95wuwypVqk+cll9
         SV0KccSrRq8z838TnenIBnf5hvYX+tlwTJzQr6OlmTrdiXxuGG0jvp8Pg2a5Y+Z2e6sb
         u3yqvxxFlyqo6vvtW6AIk08Go0QNfCLOYvKx2eUVf2SrPcZh+/ml+2FqHSiArAoJliUr
         FURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        fh=PZ4ObLCjHZzWr4QOSKztSJypSDTPw/2FDp2YKMaSZYY=;
        b=HS45gW6GG0z7cKjpSYxq3shHnf563xBfPgsQJQiU5ZnvG+87BLDVEHG7nk5J3cdL26
         VXXZ8DxM/9gr19maEDqwN+lSrx5losGyOSBeOGDjFXUBUXAFTkLBk8z0gTpEL4PrTfNF
         ktSvys7Ns9iiKOepOgM31NVhP+Aj8zO00hM3m8dCdf/G3Pr+ACax7JTLN9yVnKjdj1Jk
         +1WwycQJ5LkXZ3s6Ku7E1QlCGXjcxfI1lHmiZYvuNgzLMM/UylEMtSbWtpM8rc1RGqW/
         oiszCG8LWTQVldp3aTvRea7AJnXenHVdF0dniv2e5dHyx+lIBFQoWCzT9pqLVphZytLF
         IAcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792605389; x=1793210189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        b=CsnNkHId/2HmaPxBHjb/0jR2Ogy9CW+152Se+WQyag2dh21j8P/RHssb1Z44QC5yWC
         C4QlKQrH5IzSaG/OPVbhWVM3PA/cIm1fOy/fqHgVzQMXB+wzQ3KobKxzNHWIF4yHaCSD
         txHLa8F1uvqOKW0HUcSBT/UKnibnqOmjYCzuBGkNyTsfn4IHOirM/RQrbSf1aiLT2X7E
         TgvGTfdyJp6KjZJ9KdiumiVokiBpI9M4awk2Pc8IDRALgaKADIzg57iXw0Hqhfl8ts2G
         zkyDtGt7WXsJ0Qmo6uDo8E2S2BXyQ30jWJlFRuBusxShLi3wKYksnzRG7ma3ngGkK7xJ
         oUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605389; x=1793210189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        b=1NSqGq6GSSwiYUJQgWu84FIKDuAfzG4EKKIjP04XO7vvtia3ZD3QR2onnARdwdDKC0
         YF+3hbRqv6IkG92c9Bn+FIE67ZfAO+zevsn2LPdAr9/lzucuAuE3CGwfq0SdqkUXxveG
         C6EjSpCcneeXZr4twC+G8RPFhI0VReL9O4zjsKsuTM7wiSUU7iz6HTjZx+g2ojj/ZAxZ
         ojj/Mb0VrzheQe6jLoXGqgRRzpuVGnrt/9KMd3aFxgW09ZgQ/DyJ9hmUn+0Ir4RN21Eg
         qt4xEnSnI122YDg6Styccbk4Cq2Rd6c3izP/BzypEYkoYyMf4TthDawb5byp7/jUtHuZ
         hVyQ==
X-Forwarded-Encrypted: i=1; AKwUvByrPLFg/EHh9lBtn07ffignuc31kI2RTs/3tY2rGV7TTvY7Y/wP5xtBK2u4PQ1dX8GFJvmjs5tG9E7ld5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI59QDsmvvaxqobnx+C2S1uG4ZIweDzjUvmCVzQEVvEZq6TNAqz
	xRYqAdS8is4K91jjAdIlUSHjQI678Ct2efPJFf6cLFW8zVzieivSCjc9fvumt2pR0866c9cIZM7
	FPBs4sdlUZ5jE9auTdg/fUoBmbcjdJ+sUe0xyrXaTaQ==
X-Gm-Gg: AYBFou2wpnTSrond/yf5PqsSYf3pp+wLpFA5xCMVXdlexrYTX02EkiZ0dKVODKH8JRN
	qyb7CF4QgXZFOE/WzGz1l2LEmj7vG+ZmvJ2mtc8CupHVDjFtRUT4mtHZMTdI4lf8u2saBn3UyWU
	fONGnkHKetuaGZ/HTk6LLfNQ8qfDUCvoPTPjpyB6BF+/JufzglLAPA2YNzpQB45QIONTPJl8TtG
	bdVidHzTG1+DKFl8z5hpWwe8dQVuRNDUY0EpAXmn/QASh3lEXyVrPDOGDG5xljpacj0FPJgfAvv
	ZsOuAh5snXa9mti2qiLE4PAdlEkOoDcUHnmXPsx5MYTByLUnBlXwslh+wBZpczw+UU+s0AQ0XT4
	0i8voSG+nHKqZZev8oi8yhsZ5xQF18nRg0jWqLWA0bO6Z24Jo8O8AbCUQrar44WUCEiE=
X-Received: by 2002:a05:6402:458e:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6b408e9f045mr1964734a12.11.1792605389455; Wed, 21 Oct 2026
 10:56:29 -0700 (PDT)
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
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com> <20261021174006.GU3008132@nvidia.com>
In-Reply-To: <20261021174006.GU3008132@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 13:55:52 -0400
X-Gm-Features: AclHuK-Q6MQhxMIMUURzzci_OOwzGik9EFivN3YqqlGA_5OHu0xT6GsF67-BzDw
Message-ID: <CA+CK2bDJzo44K0X-+5F77E9g2dmqKdwZvrUf-1SkC7ewrgEgzA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Tarun Sahu <tarunsahu@google.com>, Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	David Matlack <dmatlack@google.com>, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:40=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 01:27:22PM -0400, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.c=
om> wrote:
> > >
> > > LUO and its file handlers validate handed-over state with monolithic
> > > compatibility strings ("luo-v5", "memfd-v2"). Any change to a seriali=
zed
> > > structure, even an optional additive one, must bump the string, which
> > > breaks live update between adjacent kernels. Replace the string in
> > > struct luo_ser with a feature header, so that the target kernel can
> > > accept or reject the source kernel state per feature.
> > >
> > > struct luo_feature_hdr is a fixed 128-byte header: the serialized
> >
> > This patch is all wrong; 128 bytes is far too large. For every _ser
> > struct, we only need 8 bytes instead.
> >
> > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > 30 feature flags + 2 reserved bits for flags extension). The last two
> > bits of the flags indicate whether an extended flags field is present.
> > Each extended flags field is 8 bytes, and its last two bits indicate
> > that yet another extended flags field follows.
>
> I thought we agreed not to loose the string too, it was a tree
>  string -> feature flags -> individual values
>
> The string is the emergency if we really badly mess it up.

Yes, we'll still have the file-handlers/flbs compatibility strings.

>
> Jason

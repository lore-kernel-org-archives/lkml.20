Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BF443C25
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801601; cv=none; b=d2q19U0ixcdwQyT0EPAViDXqRXDNHo/yT4l2VaVwKqsZPVV1ImrqUYkxxqa1qRTrxkFl4zebUCPReJwK/48E2onGX0PFugOZH8Mm62NjJloioFFEUAKfa2/d6umHHDVg3vOOb/HRIKQMHBZihNm8dpCy6iFMH45g+880893PdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801601; c=relaxed/simple;
	bh=AlJQFznlbkoz2NB5Wpaexda128WQ5QBQu/v0eHnZs6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXABE89JlWknox/auZg1ObBQ4AbN5m7wPCgvEdd/OrvjL97lN+HP/1ay2+Exl8jqvMvGJGGynXmPVZ/qtJOgFoQ3eRMEOrL7YPJZn3gU0fOdVoUN9Qv2EBapaZIQ6FXkRkSvskvLErHjHTUX4r0+aTtblhZagHkS176C/xlVCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVmagdbN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVmagdbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3E61F00899
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801599;
	bh=AlJQFznlbkoz2NB5Wpaexda128WQ5QBQu/v0eHnZs6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BVmagdbN57QvAbQeqfC+GmFIdYUEESL3N/SkoF8vjC683WVmFusYKnaUgbXpcVGTz
	 INwLXs83HfOYPzWhzs2gf2pcBgKX6QJT34JaE2mDfgswnwxTTGI+ixYbHEvR7uaGKg
	 EjQywSZhbNvefhVt6G/Gn608ShHCmBbCmdJNL7juBLxRF9cGHevhAXOMfPmwjWQCSX
	 UOkKbx0u17wdbNVVjwi8X1obCbk4Ad+RhZ3Qp8KAVDgN5w2fnDdPPaPQYQ7zvLaHFf
	 Pxo1GH4eCBfFNTuar7vuFPRWxlUNhSMrWRYCm5h7lw6qCvJmBuS9h27wQXLnAPVfAr
	 EVYrBYkLcsW2A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso60260e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYV8ESixFkAOFi3y8juPYYNGR7bTppepmi5JK9M1eWbIkdKgLs8bp0mW2wdeLq949ShFrjXDOiy+2uznA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKWX1bMpXd0k5gT8eWFLmzEMPf7weLelVlTKoRXKVCNsyTfC4G
	RQPUhLdMRni5JcMwGIoCw/bm9reIevPGNRe2UR9zcX0VrJhB3EUuPIAZXk66fXaZLLo73l5kUX5
	St5sUGR+stdRuaroWQe1fKy9pplFzM2g=
X-Received: by 2002:a05:6512:3090:b0:5ba:4185:4bf9 with SMTP id
 2adb3069b0e04-5ba41854c7emr882318e87.27.1790801598673; Wed, 30 Sep 2026
 13:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-5-will@kernel.org>
In-Reply-To: <20260918161407.2300-5-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:53:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLn2oBCCaL_g2kMBC95eakycqqVhUbgPRBDjfFOqQuWgOQ@mail.gmail.com>
X-Gm-Features: AclHuK9IG9N4XO277gRjxi0xMHrF-zX5RSGpnkGUAhr9NCtSwx9DQDyHNN47ev8
Message-ID: <CAD++jLn2oBCCaL_g2kMBC95eakycqqVhUbgPRBDjfFOqQuWgOQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> In preparation for storing 'current' in TPIDRRO_EL0, add support for the
> instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Add to the commit message something like, "so that BPF programs
can get a pointer to current."?
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

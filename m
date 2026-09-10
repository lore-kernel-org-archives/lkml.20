Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A83AAF5A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026408; cv=pass; b=VwKvoDZX1KqPAiaZkhTlq2Ap8gzYLKrJJa0sADrVT1pkbtr6S0aypjH277rX5iFQnzliqY6ziR7MDVIfvxNpvnagHhOs4bvcKaI7OkWA/1mk9QMlrBg/F3TN/sihHQq2rHZsQPlt1qwC4R9A17DHOlW+7aWa6usIao9f0UyAtfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026408; c=relaxed/simple;
	bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbpFZI0NJyBgLkGT5mbO5MDYHj56KJAeJPaC0CYuVbft1OuoChcte80uPCUtw7MmoLwHTuEFx7ob7ffm3p2cgwybvwh2r50dJcyQuFgWdODfCuVWzoSTOXK7Z03DdP2VxOaYmNfkpjjQmDCsmVPuyWO5J08f6jxkt7Neep07ZC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz5OQAsw; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz5OQAsw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so634914f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789026405; cv=none;
        d=google.com; s=arc-20260327;
        b=JkBJX5tRo7vhzS7mq9lbyehvuH0uAz6VWqpjrgLbilFo9d748j1qMtRgiBJYQ3aIkf
         guEfl1PcKvcRVKhEieDz8uptrVt5RZpo/poMSM07f7ZNZJOdMRiGjTTRphA1mJ6X97pb
         NQX/QgVHUHVUStBb0VaDcBlnLtMCBdVOrDyo/fjz+v1F0oRM0GIEDqpb5qJ13MmxP5D6
         5fKnTEdJjEkojrpkGxuyVSBmDxRLK3Dmuu88akZTJ5ZNwZ/m2UW5oT/lmH0n22SDI1V2
         eP3TDWPb8poy8yGGILOMbofu4iTT37RXzFQdzWtZIm+5QLGdiMsaw180qIlBfwuHjNJN
         Bmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        fh=KASADMZudpUgKP7kgTuBjmfdvTeX2XIVuha0zOJ1rVk=;
        b=Zf5JtQis/3GxObUzqsVltX+di8uKpYHwQi/RrRnSN/vYNzZbG/XGmr8+UPI2KpowKv
         rMCXZs8eO+IoddyV8iJfEq6aBFIi6mg6k/fxgfWBpBQTypKmhhexH2jOpSIl8xL+nRU0
         SwnlFyZS6g7gCL5Y9wGmQosgfc1P3mdpriVlvMeEGykPy3gAwKZVyW+RKj1i+v1XUx/h
         uFNfydR1D+ulbMLqCTPpBz+9IVbP5C+r4kWby+s+91lV4gJpsfw5qTu7QDKwy9bctaFP
         ZLX5w2zhbmpEMLSbBx2mT8gIuL+EdlUdRXYl80aqdzZUz08SYIAzkh4lfeG2fRtjeeY7
         luSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026405; x=1789631205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        b=sz5OQAswYWIGQGQarQJ11IxkY2lenVmMQpCEflPY64yWputHbkrmiXOtn/sNhIRRnM
         Z1S4rgDLXk9PEincggyMotohHWLx9256B3PbfVP96G5JgqLrWeflgo85Rt5tKOGHM2L/
         OaPCtYnL9KZqeGPnytaB8J+ja12Xnl+OdEv7JSYairoFOsWsDzCOc4GLfzYviLlcyWn+
         TAqXEWEodjx8x/O/o/GhV1kh5244yXoNQDDWloLRjChoFSb2WlKb0qbqwEAWujjeqUki
         kTofuwEHKYSSaXiYFpYbypSSAEfXFnvXLzCXbGcYxU7R4V0d5CCg3W9228U8mtn10B8s
         XnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026405; x=1789631205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR/8Dy6Nrrh5LDSonTYCX4wiBWSkHbsQtwOFo2cEn6k=;
        b=p59HeivDnmvg0fC/fljZ0sa0A+YTD+SKuAdb9VGrnV4mQH/J/fVq0D+GWd1chkzjkk
         gmKRlR28YEuxZqRcMUkTGbqR4J/4y4Q2vc0bjJWHi7BNgeCLItoEyrFZdeoQ0m98CdFH
         JQJrVLP0MxI44Talb0VnKuSdeA/hRTf9FpT5mbHqq8BFIpB3VdRRjoBD2fSz5C96VnWA
         HfaHRBqXPwDcnFGdoCT1pVkNmCj06NE+0V83twLPCtwMB5WB5B/adjYDOeXZQe2TtZc8
         ZraWd3aIyeD6Unxif2v9ewwsfXSuR+hkQMOZekns2r2r1qJ5IjgM2SBxPtJJUXPmMJj1
         qeWg==
X-Forwarded-Encrypted: i=1; AKwUvBzvzneq9PdstHOWl8TP33reAx2zCY7Dc3IM3DB+awqKRjFn0yofM8yqy8BS22HiUqUgwDNXyNIndUxzd5E=@vger.kernel.org
X-Gm-Message-State: AFuF++mgPVd5+cg/2l/KVMubuk3FX/ltKE0em1LMo/RFiOIp84GlCZBW
	vaiKrGQ/dYeWpnwDdTGcdUyuDopyMPPA7IR+EAx8Xbc2yLm7IEelMj8o0irT+Yf0SMtcpDuA4Ge
	MYcvA54T1AR9bovgZhCjn7QRi6YuMMdU=
X-Gm-Gg: AYBFou0J4agrdQVbgA+e8fCoLwzot6Z6/cdrxqJdmG+sY+hAQ/1Gnkd72yHxBGLGteB
	N91setuTicdyI+inn9uIyqj5vREoaOUAkyYkglux9oeBEkwuVK3/IQ2Z/jpoBFj6DDJdxSd8VRB
	NP8/41nIaIYGDDq9eU9wGvkEpLet2DP3nzwXze+OApOTnJf5f9mvx4F3llZEv/ayr3RCv++5lZc
	BAN5+DXIFoqEi7Y8G4TutLgXMNE5lYVtoojLz2zYhD0uCQyWNA7aNceDsdOr9GzoOtnmfpCB+W1
	+WjNiTpgPK+A0jq7FsE8hcJCGIHbzeveRM7qQ342oYRM6bbqYXPGzwFXnbmsV0HBa9QJNWiy5Ml
	zJ2M4FpA9s+SglrRkpemIrPcsqxIXbwV4yjZCldW5pUT9QDHNH3k=
X-Received: by 2002:a05:6000:2f86:b0:485:82f7:9053 with SMTP id
 ffacd0b85a97d-486d0de1a6amr3798843f8f.1.1789026404909; Thu, 10 Sep 2026
 00:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
 <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org> <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
 <aqJbFXjU53_D7SoP@kernel.org> <401e3beb-e2c5-4241-831c-005ccfb22e34@kernel.org>
In-Reply-To: <401e3beb-e2c5-4241-831c-005ccfb22e34@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 10 Sep 2026 15:46:32 +0800
X-Gm-Features: AcwNN1XRAKyh-nKS165ym6trfmmgm5ZhN281YBrKACOabVg8q_Fxhd9PqW2nK2s
Message-ID: <CA+qSx6yZ4R5_n0PvYMvt-vU7CfsM3YEjHxvBz+N4ann=+BQzdw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:33=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 09:24, Mike Rapoport wrote:
> > On Thu, Sep 10, 2026 at 02:22:25PM +0800, Xueyuan Chen wrote:
> >> On Wed, Sep 9, 2026 at 11:18=E2=80=AFPM David Hildenbrand (Arm)
> >> <david@kernel.org> wrote:
> >>>
> >>>
> >>> I think getting something consistent for now is the most important th=
ing. :)
> >>>
> >> Hi David,
> >>
> >> OK, I'll move the highmem check into set_direct_map_ro().
> >
> > Consistent means leaving highmem check in the caller ...
> >
> >> Should I also update the x86 set_direct_map_invalid_noflush() and
> >> set_direct_map_default_noflush() helpers in this series to skip
> >> highmem pages?
> >
> > ... or checking it in all set_direct_map functions.
> >
> > I'd keep the check in huge_zero_init() in this patchset.
>
> Agreed!
>

OK, I'll keep the check in huge_zero_init() in this patchset.

> --
> Cheers,
>
> David

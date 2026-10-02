Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FFF4FC8CB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961348; cv=pass; b=EHiHz/eCq0nd/oZteBFWTJuA3YxRwwqf41EEcsTpQglHRni+ePQjpShY82qmS4vlCERjCuMmllHMwkJv35UbHGLnZEEr4QlSCBBSTprw5yqdJOYOzqjCE3x1lMkhRNPxjCEGJCuouJQ9mV9+lb5j4ShOXsrVH9jLsyZYReceyqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961348; c=relaxed/simple;
	bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyscdBOrRj8UITn1IJZeiTneob75Ym4c8IzOBc9bECzlgDzjM3Lj+pl1Je8e88Uw1hstW/8oB9TS34j9DfjdRspr7tbo9UDyuxiur2x1LOitYmJ6IrXdNimpkPZ9zdqAcC3ixcAH8FdG/gAvQUNol+DAo0KT50XWIGcqL96h+kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPr7oCgb; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPr7oCgb"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-350e6de7dfeso87408eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961339; cv=none;
        d=google.com; s=arc-20260327;
        b=mk8lTdsd9QiHKB0/cViHVTHPoFloAtx55m2nuJAnafhxM+tigLbRQAxCT5Y93vwqLi
         s1thg6hT1cKTNNQ/Fmn8x5922ul8xwNfhtn6d3ajbVanwtNkGdmGuS9VjSbBz5XKLKoF
         Xd7ME66llzAKZzkfWfN0EMKPwB/x5WC2u6IP5EmmFBCt+X47K7iPku309fwMwu1AZ+Lw
         BnjrsgClR0A7I1sTM1F2ZBWn4u3kFUxqCctrg2MCSLGggU4OrFyUEegVpgM3wUxUgaMJ
         CG6hp8Enir3Kewh5X2ECwnqs1gZhZ+863FJVlvWY9hnDACRXiJPimjO+WIKa0Z69lI8v
         wCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        fh=eWu2GwkXgkPpukeGKgFpTSnR6OagnbGF88htCSUiyKY=;
        b=Tgx6bhT9blSRcX46MkLsJ9SBy7r16WX9P08+oAc6YZS+R5K8v7OZyBqNypFoJtYGdT
         pON7gRCr5ZL0ZL6w+TK/E82tsj/lJL1+qteQFEBk62S91smXd45uP7IuhmxM1E5Ietm9
         MtlPjDIrRFXbyem/1hMFOsk/fJk4IEFx08bbwKhu94d5YF0Wrq2RV1qXtslevad2GUiJ
         oSRcUKcvBKRpmHoG23FE/0hhrj1MAD1dxF9T+pyeCEJ5JNWwbDhjLVyd0SJ+w+5n/GHr
         2WPd/5bvZQEtU1G4PkwlwNbuHvIxEuw4Px+eE+xyk23cvb6Sxv8U+wkU9SjM9ZSDTW1P
         7VFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961339; x=1791566139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=qPr7oCgbCmVmsVRGhY/mlyRZc7AnEiwwEDhns/GQw2KpwtMejOPlZtLG0t7EhUjJbX
         riZCohM6eQUTfHAhxYJk2lZ7ZalM/rV50oooeLx2kQ70HuXzhYYqX19OIzoifElzz8f+
         isrJZRN2131FEhhK7im8v5sTKr94UUXh/d0aMhcS3G9+74CxqXQxpRqgJTFEdEKyo/UR
         fgFWoCsSoUaa29pDk4cYIYmrKlmyYC92ks3vOOSa9NlEdFgoPr3M+mrQNdpyZ1w2hvIs
         eRrsrMnh0zNVBvJNOzCwc9EhXmxk5rEMuyMdmPbDByIettcZa3nvmijIciBfAEEnqlYm
         GV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961339; x=1791566139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=24GFkYYjhS8nStgiv91h/hlFJOQDO/TLEyfSIXp+ZTU+MelZrjlx8tX6RUKygDMRjn
         SBRkYB10jDknWzMkAUEu9caSKvtD3OV1RE4By0sUiFxTcWp+cKzqxiZnqyLDujGWGyNE
         uV2PxjOG09cygNUysuVsayPS928UTD2W5rT91/BkbOLTsfHlLqWDpdKMpVcIbPEGMCvV
         vhMADfkp/5/T/hoFZRKrqL/uNeZaaTPJVOusf7aHyauvJOhGVu86dk2RA3va2QkVJ5b5
         AfECiPWAA+jA3T2RehMH+KuVjPQECTW+8vfepJZCwxE7g9VhjgeS416iaP6clGwNCgCd
         y6wA==
X-Forwarded-Encrypted: i=1; AKwUvBy8N4t4WL8lFDFRpGi2F3BRXKKQq7mRihhYI9HA48vNopuMw4fCCyhZPNh4ci/wcfut8N7Qi4xckfbkc0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuZW8tD09Fe6bZ3YJrK4dtrTrRPqgOxndy7Xf0ru4zdOm6bewo
	1XcfmLHFDQh+vhTGwxWaiWyfWCFL5k2oQtqhHWuwtSgZub6WwoBUnztkvtPpIa4bpj+sQgYCwl1
	Gp5VhCMmiIBlDBmV16LUf6yjTaP0Oalg=
X-Gm-Gg: AYBFou3xvgPnK067wz6UGn1jGUbwK9V8J+XBj3Oo0z0l1IgtubZ2a4V+VV4TJmOiLoh
	Uz4OTbcBonT8vvnTm9Zrtg5aU91r3yTJK6hbP7ZUWBWjX1+TDXuroJ8/I3tUxX4jJjULNP6mVoC
	wc0wqbB5H9PQsYiCs1dcOltlct/hH73pgA5yrtoWT/7euMPKnQvJoNy5nX4UgH/Yuy8ePjpsHFD
	ELkOQtc5cBiQMR+NDHSvMGNOagjFNphIk9YiV97hOmZtbIU2mqIBaVr1h8PP7H2VpGKht8AwJBC
	m6U3+QIoYvGZlk8e1QWYPnJSFNEbyNZGdZ06vuLSkEwJkdl/QVz3Wff2iprtmuXACFLrcR8owIc
	KL/u2/fisYUDy2lvmipf+ZWTvugcvdGmNZyjkd/+/1bSGRiawkt8BRpKbtr3pKDjYkZsxXAS9rq
	/7ZifPeldlqPnyz+mmVawyvcqWiTtTvhNm05jgXMnH0tpN1/b3BbQ=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr5903420eec.2.1790961339293; Fri, 02 Oct 2026
 10:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-cv-v3-0-0f90659e711d@nvidia.com> <20260902-cv-v3-1-0f90659e711d@nvidia.com>
 <DLFPWSS3LZSN.12G96EM0FI18C@nvidia.com> <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
In-Reply-To: <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 19:15:27 +0200
X-Gm-Features: AclHuK8WU7MmTRz2zVr217nxxpeT8qmaOpCUrJpN90HnuhJSuc8jn6MdcGDQfTo
Message-ID: <CANiq72mrp7qw5jikznfRoWMjcWk3Vwm3dzPdWcC1AZ8jGzdibw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:59=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Will send the next version based on drm-rust-next, but Miguel please let
> us know if it's ok to take through drm-rust-next. Thanks!

Ok, given the recent discussions, let's move this forward... I have
replied in v4 with the Acked-by, although with some feedback.

Cheers,
Miguel

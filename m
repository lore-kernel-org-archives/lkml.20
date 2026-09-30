Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED24D9540
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785752; cv=pass; b=RDq4Nxq93HIvriEcNI6JH1+Td7q9dt78HOHyTPUPdNeukCSiUrMDM5XEMj57L/1Ufa0StKoynd+XKkou1v/4thI9ulCAmKjJeMNQDuBeZjJ0/w/VzeLIqa7k9g1afgYku7kOZb0C+I9l/t8srLDi1l7VskMcevpnIOUwnCwoDvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785752; c=relaxed/simple;
	bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbpLowcITjys57Z0/kHmD0nOAJEuYur+HoCOpSszecYzehjJELlgNJpfrwfKby00NTlgdYaBPOHnrKo8GSthu0GY6qttJYy8F2iHk0GyfCIN8tg65OQEGuZ6xcmoXfvzZVTR0Vap6ABnbezC4AsAD6SoESJbs6jGmDGwRY5jARc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmi2/SkA; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmi2/SkA"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so8910422a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785748; cv=none;
        d=google.com; s=arc-20260327;
        b=UeBoXVQoFPLp8XKcZpsmiWtylW5N1CRmsVuGSM2i1bunn2eq6DbEH12zu0z7I31tqd
         mmthOke5z3HMYsB9OiKB4C4Pp778lHSUWXvftu/ok+wbvO5eZmmAQffuBep15aQHfsco
         UKe/ZqxXO8fMZxgSPkOtGGV1nKLNCDg5VfrkohlDqgBuBkXx8Q+ht787DFf1Ij8KsBhp
         ivB30vNoVaNKOt4MHqxfEdsOlEKQUqSzoLPU5NWzWnB1Wue/V6XEozxs9B01IpXcTRaf
         0FU4B9k37C5Gwbz86ydO8uRfXa/nQbPeUNheoSS6/RBSt0lb4/ejB3hQemcX4S50rsa/
         Hqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        fh=UuXZNZg66NbJq5dbSIjVxXUTEnCNzJwcZlVqMKbltQc=;
        b=NA3VLPL9Nau+yvGBo7m5Z0G5t0LClf4IMrtkIMvoLHEWlVWRl4HKrX83HoMJhbPZKd
         JOtPUfTJSp9x3zv1IOn8llOvFTPCUjkHLvv4j8DLExwzm6QFQsqn5TDymFaX1AG7EmOk
         S7ylBxhW16iOD4edfMf7reZaoKGGgdLREIoIXDGllT4VpexXG8F2YUtlLkQA6LO6Hb8w
         lfiTSzToOAjg+TcJmFPittuvozLoob7TUS9oCPfcRZAh3hozeUbey0xH1yt6mTRkc+sV
         WkoL1qLG1EXrJr6Hlk+7roT9ysQs2CmD1VuC5bpE5CszGMpS7ghyrpdLcTZv+tQ9xT1W
         4WlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785748; x=1791390548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        b=Mmi2/SkAK08l1gaN9JUs8LeUCGya5PxzB/UFs+unZNl4teRH9mCp/eYupdfsnOJQYw
         EBhv33ZJPEFWvsXDtJS9m9P/uSUFEWDQVAKFgbdTf0GfPWCj84Zb+9DDJNAVZ55uDpFM
         nr6mbpkqY+bGKsSPgGsXxs0nTAr6TaY59wB0lHctDv31i+Fy353+1BwGdV1wJ6tbrG1B
         zJBwXGTbiPtqcnzITTNACnoN89Y4OkSe/MbFoBMNH+tC45JYBKGdLjja72AZTN3nZMl0
         jwgakU7etkJE6uCLLVlP5Fj7SV2yBwlKkvDaHSN3YZpBj52dar3x2izNq9ApjRGPDuT1
         1iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785748; x=1791390548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        b=YAdfeILzlYdfVwG9bBYq/CpJfT5VgVbLgtFh+xdozmUZ3NsyvqG5WsV1IHU7pQzSVT
         W3WisPQoEMOydKNlfH/CtDwyp0Mlf5z0FLXJO1L+q3yGTC7dTDaR2cT4HdnTgcCgGGot
         yjrd+SYvRlobby5A4SbT1oxNXseNmAkrKwzMoLMJ15iqKr3WIEsH4E4y+Ib5P9E09h+j
         DYChtmeDtpP+c6eJU22Mfy/cwhDyrn7asoJM+A5MG9N22NFYUA6ZL46Y3IzDMvDXWv1a
         Zc3PJexEtzgb86reGTCn7+Ig7IyGP9SXN5Lo1NLy0qfizeNGArUZjOdsWw8UXkVaMZi6
         K4Zg==
X-Forwarded-Encrypted: i=1; AKwUvByEQCIX8oWHx5zsEJMlq2jO/jGr4XI2QUjxpErYcr4/niDa0BlT94NuIRvFDsLFdmcWLOW01TeZZQ+U8Mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjd+k/jeRXyfO2BnTI98baJsoHWf1EK6o1u41KqbwTa+QMt77B
	jIFsjFYFUbU5kONwqLMDXKbFKjWgfLOjnWpatYALVHNCWUfieJTn1pBTJfoc6qXY9tZVQlvCadV
	95AAf/bdqQcmmgfD9WRwjqMor93XufI9WVesF
X-Gm-Gg: AYBFou1vwWvdXRJYjewwEU/smXG3EM1woLEzbhf1zqhsIbndoOrga3pe1oOc0Q+319C
	2lKRmM2Q+ctn7rdAf7DC3L7OsTcaF4ZQwPgueHFvgaau9iMkclDsqNLmI/qVq9UQoalFEKA2PWJ
	H5DlGCPmZQ7a8aBLFVYD4TRCNsP8HBaLt1Bj5SsqlGf6vrwIdlPSaHAHnhVIBRLTQ/8EGV6Tf5Z
	stjtDazN4E2wmzF/WFvLPeAVg1wjoIyY4LVK8q9jsLEbjxWnEkYdpVd0T7s4rVSu28BEh+L/4OW
	MsDf1sTYaAFm+43WEdmyUGIv5mYlxGPpwu7pkN3jpZefWf80C0DUPfSI
X-Received: by 2002:a05:6402:1d54:b0:6aa:734a:a084 with SMTP id
 4fb4d7f45d1cf-6ae198f00d8mr1568406a12.27.1790785748326; Wed, 30 Sep 2026
 09:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-add-from-raw-conversions-v2-1-cef8e6e23ae2@gmail.com> <DLKOI7QW5M8O.II2G717YJDB7@nvidia.com>
In-Reply-To: <DLKOI7QW5M8O.II2G717YJDB7@nvidia.com>
From: Felipe Agger <felipeaggger@gmail.com>
Date: Wed, 30 Sep 2026 13:28:57 -0300
X-Gm-Features: AclHuK9uPC1AAVAFHpuASHRR5VxleuHnGeiAFO-3sqvHcRGMxC0vMih1ABiqeGE
Message-ID: <CAETh986oFE-dHtB_diDETGXQZWsxqx-i7sg5T_wCzVJ2ux6YJg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add conversions for raw flag representations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 21 de set. de 2026 =C3=A0s 00:36, Alexandre Courbot
<acourbot@nvidia.com> escreveu:
>
> On Mon Sep 21, 2026 at 4:18 AM JST, Filipe Xavier wrote:
> > Extend the impl_flags! macro to support conversions between generated f=
lag
> > types and raw C/UAPI integers. Implement TryFrom<Repr> for individual f=
lags
> > (exact variant match) and flag sets (rejecting unknown bits), along wit=
h an
> > unsafe from_raw() constructor for flag sets. Additionally, add BitOr an=
d
> > BitOrAssign implementations between the raw representation and flag typ=
es.
>
> This does 3 different things and would be much more comfortable to
> review if split into 3 distinct patches.

Some things are directly related to this patch, and sending them
separately wouldn't work,
as it would break the build (as happened with v1 for Tyr).
It also seems odd to me to create a class without using it anywhere,
only to use it in a later patch. But I=E2=80=99m open to hearing other opin=
ions on this.

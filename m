Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFB49AA30
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818166; cv=pass; b=GwtVgmZT9LS1GRFevFa1c7ogw9WZ8P+3tbOKMNvLN51eelCRRr9ivrIDhBc2C6IJjLYhQ0EM0/yGQhm8zq2PIp8/f2C3xl9FhEP3K8pH3UNmxMxJB8adnJ9qtrpwx2+h6jvY9JNnoagouTKsw1xh6/Xkmr3Xxfhi11udJyoPMUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818166; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtRrmp0eHWMlVavxrdDJQHo7LAulLLhXF8ioIc6dGaETyNllSzG9WLjJX2lMRI8Mt13FKvoXc+JQ4s0AFRKvDb6RbXEEPR9Dg0hzTXy6RDYXDjFI6t7eKMhPqpt751L1mdcUponVi+D2jxU/ITZPSdfmBJwK/lxcGkp3UV/90pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0BgTGEn; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0BgTGEn"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab432273c5so14971297b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=QPCXN6Am17RiNAl/866VHz9xKqegn9Elg6K7TIHqdXR6r2LXRvK97qniH3ij9QdT82
         +BAbI8ui0+woNwE9haGz+6Kq8Ct9qs7BUVS07glUQTpLaTNL/gM2kW9KYMsHlSqYDcCe
         7SideluU+YVije79+iOT+69b8aMz2ucBIaCz7fPc2OKHJLitwHlCHWh2LoBDwiFrdJZo
         Auy15n1x5+k+ZADG3cYjleZXyYjxRps6Febp17xb3lxpsDTsULrCbsNl9yM/ogiCo8Lm
         6DTrhLk/lpJfBRW7O1g1iUc0P5qsoNGLAeeH/tS91WOLCrnnxsEpjnrfy7ygNkpZtz+J
         coiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=Qb13M21D0B5HSru5gQUmuivpXQ9sDBPBZwiRhbr+u68=;
        b=XV5agWUO7e4W7jtsAE0jI/6hF+htquzJQiqSaVohfZjBYa3cyVGpF7PY0Sd88oQ/rh
         kz8QV6CBZWkVFfCuFhqQtSnJ+H4jrocsQuOB7wfafjsR23guRo0wBsvo0ElDPAkCcwDx
         +6R3cQkAHKeJT9BAI2rjMFMw0vPx0HwOUvKCUKdPamcdC89mCWZmeMbgsOsVEQkI3MSN
         OyDn1aNomVnMDdzjqlT32g2nE4Vz3JVDPo0kPfctyhRXc9lxbXKECuJJYZpxY64rnrRO
         Rxex07bM3HKCWze1cxiYb35QmnQGU7orS+7JprPMjYWhRcJ7EFTXa0Ko8tpqveSycF+w
         RfsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=H0BgTGEnjHPsOpry8zM372M3cPbee1W5JIY+k1KGqv8WNzGyYlMWruUcNGXNpqKqHv
         qAht/Fg1XEZo8JjFRoEHFhUiRD8Q5cYqy8MKiZYc5LQtEbtjmhvyhG/D2J4elSaSnKUV
         ZM8MXqxhRXUvbFnlIr9rEEaR8zAMYY5wS09xL9mUt1dlIaceViENwfpBgQUtW3eVOGlU
         pDKwvkrYloE/6nhq3HRdIEjN85hfMhGmgpxKiemxr8Ipgmoo4uHaSrLyQls+oGGVrOtN
         wPBentZQM0axYBEPhSU6pemvJTTbrMwGD/WXXj/XHgW/LcIPOfUMxG79B8fdKd97k9XK
         U3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=owm6Q+NTLJ9rHLTAvOc40GUi4CZWAIHp5hdcUmia1CqUxp9qjZ+vG33KmCNw5wR9mZ
         3KcOXHL9RIWZ9KTnn7jlhaAxKkbHAqY0lTpyb33msN1iTagkM7sOW2gFkYOCol76sykj
         +roDt6ghAdRrsVnw2VdjJbiOqayGUCY6tqFlCtg3ZycNtQ+0uw00miSNkZvRzqqQbK/D
         IGQ2AYp+HG+JaGQsXjU2kAZYsfvVSyvsFLSC6OBXVjyzvvebY3fAayDEAFiK7YRJfL5l
         L4RYiJtjPcSlDadBF/lHHdzli19QDmbEFzIHQJluzUu/cJweSR9vi+MZaCQulmvFR44t
         4/iA==
X-Forwarded-Encrypted: i=1; AKwUvBzxIWK1x9G9JsMWrNDgHOmimx5DhHraQATkqAamaJQTi83mxyAQqMxsYEDkAuEs1EtWCNmAtSh614MoMcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuV6SIs/MHAWnKoZalciq40qPvwhVPL2CbiGu5vNOmQ2PTON0I
	5d+E3V0i4p7mvo5hKs0pXYDBT/SRlz8o4d742JKRiNRjv5UTFutpdiSQVqV9iKqNnFtcDCpEqD3
	RLw2WanEFfPEXQpBdDC5Q8YF3kOQCYBokU4jo3B10
X-Gm-Gg: AYBFou2VVeP/iUo4m5voRfbSgwp+UMpnjJc0uTcFyyZ4iROUrHHJHz9iWNY2z0NVkQi
	lpp4jMYHC8ygtJv/85OGA5BhKE2K6hSCUUIJd3Z5dmvpEM/KjbEV3j52eYSLc6q/jbs2ZzOGraH
	CxXluT5qO9IEDU1XP8XzevsuuRvQKAbqJdr45g6FSgoxp0dckf44ipcLj9u66qVut1nIYDpmQ29
	tk3dO3B5UUgnmyu7Gayi353ob91iPfICpL7AA88C35nKQ6r+7m84uZHjlrzg4gaK9DGwU2OtrAg
	tjO2r9/IXLj1Us7yLU1LknOPMd9CNa8o5EOymDfviqy0s1oPYTz6sASsvRGvIbCu17roi/tH3x8
	8kIiGGjEhMNmWpny6958l
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.

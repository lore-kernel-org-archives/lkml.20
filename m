Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908041;
	b=4ftWCPTMkR5Fh+ODyUF86Thi7p1mvFtW6exM6AKpFKNf8gLXrfRIxYFTQaA42fevUFD6
	 2gcnWp+UUu+TvKSA3OVpn/8wpKgfURvJ9YyTBvwMn4TN4PmHFm2fDPfoKmaqYDl87zf5Y
	 iCyLef99XJkLnvQOIHRXw8dgyWGVk0OkfTb1ME2x4MpTi1R40bH5PBcN5vuWNNvy8Ty39
	 TM2sd68K+tdC3rSXDmaVAr4oO7s5RlozTSPPVwEZFWoRVggEq0CXnyh829G41oKrDFlHs
	 KZjrJmChV1KFcxYQsum4FdRuCKqFtGMafPLDaFx3cgsih2m6b9/ISf6Zo42MUkfCtKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
	b=V46k/JzDhSdpq2xS7NKv4QaEnVDHVfponS1pWyZxKbuQ4C3XW7QQswzz/jJjFfLimW5O
	 BEHC28/Os660mzgo48SuVF5WYWYuzxFW2kz3lPqD3PML/Mus/Htu9QhpJ4YITmReyINIG
	 hfUvijOUfm75H6qkowgoHqZ/zI68UJhThGOFHAPioVrP3caNRjJ/mm5qdkB34rMbLLcC8
	 AfUeL4CJFrpJTIrYeV91N19TCtVIO6kdKwHsZ43aRNrBsyNo+MrvC9aYXSxa44Rw9k9eW
	 4nANokBFDA6RigOZP9Bk+7Sva4MlyweOSedMcYNupR4FvFIK/dksMbl+UhVC1RxPzjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4880606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4880606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c10faf6easo272770eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908040; cv=none;
        d=google.com; s=arc-20260327;
        b=Vds0IlbC5oV20WdMwS0S6uvH5ci06OPWVQp3//3+wU4g2yAY29JG1S/g/lWErMAaN4
         yDgMgSz/zy9nfSluu8L431o5K83vlK0/8D0hrwwj6ehFnjqiD2ZbDBA1T/0V5kZGKgeJ
         uUG6+nEWjqCyZ3TcH11wtBCy8RZH1124xOrPwkpI7cKgD/c4EtVq4dSCvoTur09NhnKR
         qBK1mgqyeGaocnZrZHmhLCGlfKNIpDf9hyIh/F3+siHIjLutNAzb946gDLMBM+t7d/PV
         fkRa9RloaeKj33PbRcvooYwE9K58xQwa0LBzPDaOGqKW8qbAZwcI1AOGMbwmqF0zhjmq
         0sSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        fh=4SrnA2uZbta2aPQ0P7A21MR9v0ySOYm1ODYFJYTmCGc=;
        b=TNdc8qg4CCZKir5wxl7HKR+dGDybT8O0Wr5eo1pvEYXrUg1VX99AYcHdXElLIXVmtc
         uPlaVuMCRaV9SW+8ojZKuKNkAm0kD3JEz6jl2OEKgarvfYS9t28+6BQ18ErljaO0gPwM
         GDNMlNT1TsWBe/eJlgZ8Q1pTKDV26BWDKw8UAYf5ylxfNzOgfz8UCnJCU57Amvn/dZBX
         oH3aTsYor2symjW3jzlq//WcDwDCZFGLfHjJmnGtY3eQ2YpdhWxJCT72CWjZays1j8uG
         yE7P5ZI8IX4l0Rr8R5fqcphfayF2THULYRuy/zJ2be7bolPVpyO0wgW6lMt/TSE3bawn
         IGmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908040; x=1794512840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=EVKv3WChu9Kx8aUKP6ZsMkpRgy/gQHndf5kOtV41bsorTaM8Z1UhhPBJpX5Xp3akwb
         m6DbXgdoO0mYT93BW8uSA4Cic4KWk+CeSFU1KDrozz16EuBsPUdJkpQUHx79Vr6kes8l
         ZChdIvBwXDjpcLyIbFrGAWohqEuZtB9OsnS+1L4YXdOrxwzZd44XLmFUYBYZ1vjYqEBe
         tBA0n5JoNGmZJyLulSDXQ3amG8GE7pWM8//7PXIJNbcJ1Vn+Rcdt/ZqTzbOqW70MDLPo
         LCkqIXIu9c2hGgJ+kaWM5WShLXaPJ59BMdE13lwF+33HIBjOHz23S6VfAne2MjBX8kwA
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908040; x=1794512840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=e46SyN2wxplkCkquFR+ewmwHYvMQF7VI8ove3qOS1LEde6hWN3PPaWfp0an9cEouRz
         3D1cvuvuYBY8mSKXGdQlY6I3OeMXXxNW9psu0j/MV7fbttRdOEC++cf9AvWQbnRPT3Ph
         yyWR9FqNOsySeIraFqdjkLt+G4VToUATqNdNNrqiznxYr3Iw3jAhd+RGwzXsNAp2XeIR
         YmzaEZqnE0i9ZNY5WDYkGhIjG/LdXw1ZpIbljZGLON7rZAXdjUp2EbscdVkopfGAuwRa
         4Cpdga5RPN6y3+qq0fhshjaELjq1mIjsWs4TOsfQxiBtTGxybZVY858j/rGUYg2ObpFt
         NADQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZkbdrofVP9e+09KBEcFWSRvMLP/5phF4eHjKB5o/8cl931C4Rx9CrFOCyB7oS9ImfyiNFU4ju3gbM/Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pGx7xn4SoTCkRzpz5orrIMcfS7DdrLH3Glbq63jjeghGKEm9g
	uPy+l61iKdIzYm1jimX+J+g059f8kohtyRPrut2nbnB4oIyRIZsPV3IOqeS7d7+m+SY3QzDsss9
	ZYf86+U/CjmmjNjMyp3TR7G32SGRUSdA=
X-Gm-Gg: AYBFou3/ni488cjTt74bhDer5XoWJKYlDMhw3VYxCgAoR9qJJKx7lwQAwY6yCD6Gu+i
	yq4uz34J9rxc4ixjb0xDC/1O7qJ+CzLjM7n61CYOk3WXmGKNnZ8s+LQQB081JUXs0tb6DGPkrSQ
	jZ76e0C8uNXBLl6DPk6gRJJcos8uYfkdFLc/csn+tWK1Z9x/putzKeKrWInKgpIwcVDnQhbg2Hr
	H1PfVV/DjScarzhIEdFM6wtVTZvFMm//0E5nDvkvP9vYDZniirf1hPtAL80ioNsE6+ZfODfFNRN
	KruLYznjwt6QllThjoS1lDtUOGIfYLqJaA8Y6S6ILODjlQHEX1JFE8WcvO97ddkbWQQz0Dn7cyy
	42sjkMYoV3xMYMRnMwOg5UOMg1U6p36t40lzBi/JsotbrXXP65bfzwTKuuPZXaRE5VXBtuhPlvJ
	YLUGfSmzyEs99NiOOG0qvm9KUkzljBDFg1IjptAHEDJma+QW9Jp60dddi4dT60wa3KsGLytUPin
	lheLUa8RBegDTLJlzBHPoBm9vjU4quIHYvI
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr274847eec.1.1793908039634; Thu, 05 Nov 2026
 11:47:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
In-Reply-To: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 20:47:05 +0100
X-Gm-Features: AclHuK8sCw5nDzEQ97QtRVn9Wki3tWu_M3cQQh4H35CVD10ErpOISlcCaQDiaQU
Message-ID: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> since LLVM 17) for C, Rust, and ThinLTO builds when

> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile

I double-checked that the flag was introduced in LLVM 17 as the cover
letter mentions, and so it is likely fine given the Rust 1.85.0
compiler (i.e. our minimum) supports LLVM 18 as the minimum major
version, but if the patch goes ahead in the end, then we should make
sure it works well with that one (or probably you already did, in
which case, please ignore this!).

Cheers,
Miguel

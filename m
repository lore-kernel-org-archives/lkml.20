Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897629;
	b=ynCiwM3n/gdqhi77ZVewWmVRIu1JRwNz/BS09SmgAf5uMa/a6fci4W3pVyCOAUZQwku0
	 rviu4JR4gy0F/2QE4NIxVAQMjipBNBO7Aetjd1Vu0EhgaGLe6qn4blpRc1pJAUhdYGn5G
	 Lz4XaddzE5deqcSr03gKokmv0jNc8y3dC5zQ7kmy/fq0Alnoj9NdxprxV/ab5BBbVeqSf
	 TEL7mpRB2XgeYZVh668Bx5XfqmQIIyh784SUIJCAXi+j2GuAi9Cw2mmX85JHeMePzuaam
	 2tNrEhE0FImynPfili6UQRqruKYyQb/++VSPWSkW2QQUn2eTk3FGs1VqYwYFAOvB9CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
	b=FbcbMi4vgvCz1DBcVutQaYBXdy/QiL3+ZQviBnTVRIFNjx33u4SY3558gDM0HygMuHsm
	 ZxN/M+hljRnr8vbi0jtpAEWifOV5Qxhi2IxfUi9L2tYUR/ZIu1o0Fpz/j+SJK+zxFcVxn
	 fjcOpzHdqUh0S4ug43PimDkL+TlIPIuWsOawvMfC00y5A2UgLs+ZW6FxkJw/AwyammL4r
	 oSsWXigl2n5MaqMm5GAwnqv9kfPYOAVJ73QqZK1LupctJapXw55r6jutYeOr9eww1RdeW
	 T+sODEzxi6ectEZtKSvCaDcQVQxng1MC7ca58WwiWHwSfWhGkI5b7Cv1TzeCTQKobcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIRFwOCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3749F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIRFwOCY
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so5103431fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897627; cv=none;
        d=google.com; s=arc-20260327;
        b=mTQC7n6Zv20hxxSIfA28bXvAGaO1yX+i9F9NP+5KLwjM69PzJcwSa3nHYRrtvwG8xJ
         YKUzZgtwz92PI9bq+AK8pxcn19YkF8n2cfmTzvaBXlaxdwF62XdnJwGJD3Mtcb7mdemS
         /aj1p2vrZqfVGVukBFK9xF9Cz44PENBIVvyqrWiaBnAv9ahmN4YJ5fd8JXle0mZOZ8Bb
         E4uRdpey9HVxjqTIfsSz3GmC1g/F0vFIuL412mpsbcM79CJDFi2kIRxD3Xl6GSKATtgh
         ivSjgKwvgYaPZ5YjDnVVP0fk1c5/ympeULTMSutiP6J6HpDe/QChmw5wormxMiB6fuiC
         XTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        fh=B7bhtZ32PHNqa0FQo/ZnXHPR4lhHwF3zcA1Ds9WW4Ww=;
        b=nimK62Oksd4Nm47ICmR2596TJjFGBZ9h9AeoWqmb1Gi1M9dmIr3HO40HeJ00iGkQ8U
         4gqFmot6cnX+LbZXsgyY7SUXZz4hp3MqlYnvmvuJJ1xo/tV6dFATx3M50VJtiVEle+DM
         jZVToGKDTISAgdVNp5CD49u93J06Ihzk4fKgnPxLd64ZBhm8Jv25jS/KhMQtbaCUhUZl
         ajhv0COHDr+LRngHUvJEK4HyO00eWM5cPI+4W3xOYcaPk/tiDy0IEDVSvm8+2dQ4oizB
         aSyuBcqpNbrq7B0GMChKrm1Hgkg8Wxx7c+grEJhNk5p5Oao/lwoiU9E6qW0S425CEYQb
         xxVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897627; x=1795502427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        b=pIRFwOCYQRg6aJGJnOiyKnNG9c6YYSN6o85ZYYxXAIBG+nkneS57BTLS0ZMhGdx7gt
         73Pq8Jq1zMZq4BGnCGApMta46cRhvKL6hZ7GMCFL1ffulVvZGT6ZBw6pIE5aUhsdRlZL
         OEcXNdqV+A8SKlHD7NA+p4PqnharGSeqxPddVFJsiemwD+c01kHRki8Io/3Nujn4rPIk
         3N+tSkGGsatVDuNCgallXLT0T4kowy0ldDFrPVxbONr+LrPuZuo1p4IAubjb7JrpzLEc
         rlUWAI+7x0KhGGY6xxKjbvUTHCyYVjJST58F877wciel9dPplKwDTy85ZzsuvJJlA4y2
         61Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897627; x=1795502427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        b=bASnWhblHYAzmTNj/xrFrsMUACMOECG9sfKfLsyzSyeWKoKAAG/4XLyyPFVuwz+b57
         YkQzUN3+0K70mLeN1/oLonI7p4OH3NTnzqQmgF5Dh+MuQi4ASR/xe/irEpPdLVyLqgRA
         fVad03p3mgDkhyUp6qB3amOx8rH4DvOKwKyMxaOtbVK2yw9tbF+oR/SoaS1wUlulA7V7
         CUxF46bBwYZJMJvCKCM/lGYMnF6ua3QjIn/uVv8jWQt87FsxpuR/abE3FVf6Cbe3M9r2
         zWLJ3/n6PyF4SpiBErzkFaODql5qcqvydqivLo4U0sq7KwU3ciYhY1BQRf8RY+EnqQrt
         6Iig==
X-Forwarded-Encrypted: i=1; AL+hErFHUWwfGFlQR6PZwiDOdFAu6bHOhnrXXkW0DhscOFQ7pqmm49oPXAF+mGUfLMxvmn+JsxASKtzdO6mNFiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9guCrfzkXEZmjsZBxvqiJAxVxtrYBBqzJ3RYdsSC9Nr5EbGwAY
	gACk9DmElwXVQj+Q1rhb7uPLSfpbuNDvc2XMFVVKGjfltwS83YwD6F4b3FE/NoTTwN1qLqxRrW9
	0S6kWSxtGxikcqGGJXILhG2joRE0rz7w=
X-Gm-Gg: AYBFou35WrYGkLf6tpiFaRgI5ZHaUgrNaHmgBNGC+8FCIwPM8iy3rrRjFwdLqvlie76
	4Xw84tim4xRWXwuRe9olcmTIL7u4bkc+tRQ5FecX2NJBozHWKQGs1L4QCQtAWwaqRv8NPMkAozT
	cxLUYXxmGEkEMG9hW1R71P1NgzjxA9owCV/C5gK8XSHwksFNgblwr4U49Rvv88v0yJYeEnskKO4
	mXeDgL4By2J2uNaqFDToKKE+aIT89GUVX8ve9txkfJyKnG4OQjw01km7n0CYty6jHvPuLpNmuRD
	kW/VCpjn9B7SDYUf+aECFZiNP11USNDyYBtfrHja3AnxcijxTTNUaRO73/cIMAzcj2H+DzFFm7V
	t9gOyUCO5WrKPjhBO5XjceTn0eiFcYU9GPWM2aEFMDQoY7FcvWYoQ3mH72+fhViuOTfoeKRIG0F
	mHK3Q8lXVDn/uiSyo5J+fP1pM1gqQpKq25jaOZqRqVIQjuo0fHDV39uZfOsnHqHTJBAmuYv5cLO
	ngXCEc2BWVlVVjmOUmD/WaixSFI0JCIWuesO2NqHLVTqYRgr9vK176Qion9AxmGuC35aEwo2w==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr5745484e87.2.1794897627214; Mon, 16 Nov 2026
 22:40:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
 <20261114132156.49243-1-marawanzein222@gmail.com>
In-Reply-To: <20261114132156.49243-1-marawanzein222@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:40:14 +0100
X-Gm-Features: Aa3M54oHxETgvJbOaBj3UfHn1YJEXV_kuITRJF35qSCPKbs92-uDgz2TS-kt2rE
Message-ID: <CANiq72knPfBVzEA3kiHOWXuDo0QAUh0mWQnWR6og0hqYwK2PNQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamir@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, spidermana <xuyiwen14@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:22=E2=80=AFPM Marwan Mohamed Zein
<marawanzein222@gmail.com> wrote:
>
> The returned slice is derived from `out`, but lifetime elision
> ties it to `self` because this is a method. Explicitly bind the
> return lifetime to `out` so the returned slice cannot outlive
> its backing buffer.
>
> Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURC=
E")
> Cc: stable@vger.kernel.org
> Reported-by: spidermana <xuyiwen14@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1265
> Signed-off-by: Marwan Mohamed Zein <marawanzein222@gmail.com>

Applied to `rust-fixes` -- tags still welcome for a day or so!

[ Reworded title. - Miguel ]

Cheers,
Miguel

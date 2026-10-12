Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977249B445
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=clIUO+e4VEOV7jGsXYawBTqtGO92sd5mlUTjY94J7jlB1B0EB5YRp1Xal7JuDkhwJcrmQXQsM5udo886QLcK34nYN9SDIgl418yJBKYzJ+5m/scbWNbtztxs74pRdvgH1sd8Zz/gLiKGXA9r1ehu2UDxh7CkVWQBoDjiMGA6guU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9UVbICO; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9UVbICO"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c30fcf33fso265250eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=AqwsYVSEj6LBqxJONC74bjBNVhCsG+6ZHPROyDiFDQjD0IlL2A6wwAJpI82akQHN96
         liHGvRKVZK04Fiwrx/frLqbHi29Zi5RxK2Zi8+jzyaJPFYd3qxUzhW2l3HxNc0SQfgxw
         3ZGilCSnY2psnBJabAYHwB47OGucVDTCyLtBen+KSJWgBHwh94kg9CVZO29v6TlAztYE
         5qToShxFOIgp7GePXHLu9VZFCxZI3m6RbdWIjTt8OJw5LLWLCnEJlFGJW45/RVHaXGJe
         Up3GoJUyUn7S+uugCSftFCM9BC2ka9TxEeycoGUV0mfa91dGtJld7ed/hXPl/EvXvYIG
         DeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=eS+RyZhG0Mk3dsRg5uKsLyEplix8luOy56Fq4dplphc=;
        b=bRmIHgv1Nwfa+IQ3E201cG+tPecW+kKsd6IKJ4ZLf3t5IeAnqgD7S8ZN2DTy/6YoKi
         8y1htOFIIm0lfbbz4O6nG8h8+VUM8lNnrkoa27ALv+tosTZLsKXpL8cFbtWKDwj3NTnB
         rSnLWj722V1JonWxQwao4tiM0T86F54BPGw77/ntSGSCSShS12TaNCqFWC8g8rC0UOHV
         T4QdOOfCiqdNH2kkdibrVHyq6NQ0nB/NlKAn3NswBItUIwwuxZy3q8QZYT8G3DtZWuYt
         Rsu6VnjGDd+JzMmzoNRBou1x2pchWWjnldCaBYn4JaWR5zGI8qSeUt8XMqm+QQjRFsk2
         UBsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=V9UVbICO9Vb3G0dHVTiGb8S4WVniQxs6wmTmPNcXznYmsWz8kd1y+k31MFrHAf8vSr
         F/xu3g2v5JkYjvBeTbKIBSPdbOMtozVeZwNJe/sneeG+41EP6qmE4OlR8ZAft5Aw3GY8
         5QKTN1uz326YnQuvFOv/Dh4E5k3sn+Hyqa94/cPE5CWDlxlTTKSV8V6mLrRTozIwWcOH
         sqHovpjY6+6o70mawD+5zf6vV7GcNVQJpS1asU3zptVn8fG5vEtRCymo5tXcTJVdT/dg
         aOQpLbB7ySZzkjVQwzGgtzrtANP0OAgkCKgoS8RaZIK8+EPmpQgit/8WHVOlQr2kiIk8
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=uJ9GWS/0ppAKwnOEqWJKKhyezk7pyLXMituGMQOa5HkunCi76rQQGi6d+JxENpo01N
         kuOV5ZULZ1TPJ/oDmjAY1JcYQmQKcrT5mD6emOlRhk/lgl62x4vegp19DLjG9YwX37XN
         Sx2eSJMq8syjjg03hRy3dNbnHOTGOMq3FZNArzBaOXp2fWkiK0wEPTChQTlS3gAZwzIp
         bNTlHabZYiAqarUUfSbhFKBwx/V/X5kg5dSS5+a8a3Oz4MpNQotgfDa08y223h3oe+uM
         KEAi7NGxQqy1ggIQD77rb3lKt41TpYgy6HJsyoUoMzB2hLx+MkqXesgEtv//UFOmIszd
         KaaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsq7JS8rRejwyss5ZmDnE+ugz35AcsRUm8jSi9iKdkKeY2qP6QBog8znGqUEKm4+bn6//06H2JgdpEIFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKztdvM6rtwzNa2qUojB/HceVruqqaHKhwOP5W7n5Py1QfSE6N
	8T7me5bWfC/0zW9pwRfcbxlwFOXDdHvyayISkX5CG6HJdvzMkI8txgR/1l9S9Zw+/q4xng8IIVw
	xK0ELh5FoHD8Key0XxRtyPnsSXLjvzx0=
X-Gm-Gg: AYBFou2K6dsr+ke/bPSrModd+ygj/0rbXnpd17+/H3d/QY6VannGVPSdbAYuiN608q9
	NVXb/3L5iVZC9MjjKaXjrG+wOHhFyzKgJSkXL+h0PB2k8rGy/1FahCm4HLsidhybRA2CRaKh6lI
	Ok9Y+JS99Pnd8Vqv6tCom3JFu2G3FdftqcghubO4Ks5FIPnOoIC8fYk2AneSfN2xzTmvQL3+H23
	07sBEVCCLBWKWaIy86nE3aLxyaeTCRui57rMsHeOCP0UsbP5JGxq2lKIzVeQmanjnFq686+Jgry
	nk6rFThaUS1+8K9ZJ8wgV4hJRbDtjKRD/pO8S1lqwKa+jVEcwDgYiW86TV9f3sS8GiG5WsyM9NR
	6lyM/Hvrm0nbEpg0BpxWSwELeStWjshO8lcdwTXQpGHgzYrVoimn4mcO1BkFHsi0pLSV1cs161b
	Tmyyo8oj0ZGygh15icbvIcdEccibDQuTks1pmJv4yMUNN9BPwK1Cc=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel

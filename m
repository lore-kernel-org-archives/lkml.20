Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CD24A3864
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947050; cv=pass; b=hYnycI1VsaTOpLv5eqoYdyFNSR0j6UGmZeyThEJ823zyacqSY5OKC3pZbnXr/0QXppjDzrMndbG20U5FaELXN4Se4mfzfI6Q7EN/0medQy4tUmHAXwFprj9DXZvMAx6buU/sn6unQxDOHclQBsqaCSPSnkbNsgi1sNVRo+ms2m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947050; c=relaxed/simple;
	bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJsZXsfEn/HcGw614nyjSaeGbH4V6q9MysfMNru0LxM/sCga7g04N01OD/7wVSHxVET7tlXoUNnNYJDppwD/x1YqdCcWSQtBtd8BDzN8paYe6G7FH0KydQedXtOqfozreysmkS1eGu2/p0eAtPpf0/jKt9mJJkWHqyIJrmcqY0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crLCc7fj; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crLCc7fj"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b482f7b79so425742eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947048; cv=none;
        d=google.com; s=arc-20260327;
        b=e90fXWtUwrIpTcVOv0oVGkw/PV4YtD1obGK8OBRAy2l/eiopYV8IxFxhCeDqycy9J3
         FjT0PvgGI5FBqS6fOGIzdXfshJz84iUwCCC78xKviJCUUozH3OMdgadQpjWzblXMRbL1
         zlWdLCzj53pHM3MNxGu0DMypZdivzhWYRSpewXXvCpq7iV1aaKkusPMeG6McI/5uyVrC
         Vn9PVbCHcPs5/XLzEXWEHQPg7hQfn9OZojASTQSWyGumlcTZWceMaGXmLn+OXrc/FqFa
         T0lhoLlDRSwE7te0NjPI4DG59PGOgu8mCnl7pP5Cuz0FVnfeKLj4HxkHQ1F9fbVgmUj3
         1ZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        fh=0lNPowIR/DP1zER5c8n0jfEuccgXgQcuHGkEO3O1qJM=;
        b=meW0lPgovTjdpBQqX8Wd1ir+x/Irg3jrt6JAxQj3PoVN3JBqZnxEEyAu421ITLnmhs
         NLPzSFIei/ZLeQE9PhfaKtwolSzbYFjNDyX80yG5WeDLdJdU4z5DOPbgpQML8HNSrUo0
         tA6YGBlvYUnqemdHVaZyR6fTWzKaZzr2qU+bqgsjfZ7wv/gxn5xiRXJ9bDpdnfca6Bg/
         WxFOq8B4ROM+VFIUGR3oq9gfdw/J9xW2bnB804bHj53uaSyME4iu+7WicGATE6qD7J6d
         XVFc8ZZXoNzX8somyIvjSJmT7vpE64FH8Rti8NmUQwuoBIG/w4uVT01EDZU318QmSxDO
         DmcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947048; x=1791551848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        b=crLCc7fj4u2h3uzVdGMqhoxA62rSXWVE18z0NLuCDwkeCluUImdQuR2CBGP2+x/C+E
         fVZ43sD7IbEj0N5UrFGo7zukSYmMMSuOlB+70seiC7cM02+66x51Ulk3HgNIfRJgxbSI
         f8B/rF9epNI9JyDnTZAA0IadXaNnEWKoxgnFUb/Zsb0IemCG4aNSgfSLZijEE4LDMrgg
         rEjJbD+4f2T6Yr7pOei9sLze5XdJe5BZk6PLuM4sT7MxwqWJHhlPunw57vAvXrV7fwM/
         ABTHnk2gTzAF6pCNoGswH3bNj1pTbBKaWQwZRwpQAvo56v+0Tn+x3dWwMQmrkKhPovLf
         38Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947048; x=1791551848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        b=zF3JqNLVoYpmGMTk7sv/UaJ4W4b8VTIIaMZU4toqFR9fKmeNzhc8ALGp2xzMtNjUFy
         sG8Wdgc2fIGa1U7pjpWIivHZhEMnzBPFoWsmF5rOjncpXR+fF/b4PIyw1Ary4lanfRxE
         fgZmTNu3cP7wmfU57objADdDMaEKOGN4gIdrGHyAzxSHzGQOqCyPOl2h/n2YaSifJL59
         Tfh7m1m/cv9B1g1mv+y3WGAEjT2pyw0b8agfpoHX7SXWJ5sURC9p4kl7pTjjFyoxcWj+
         qbtSy3DQQznGjI7lk0RqKISMfZVu1UjJ8i+ePu1nN9A3XLxigjLnf+iaU/wZj+IHpQRO
         /N7A==
X-Forwarded-Encrypted: i=1; AKwUvBwct7hMTYWpgT3s/tSmTUojS5h5hkmrKEha+NYbZ7nXRG+ZWcFf4HMRhhOsmwRFx10IeRZLnLrBYVPGAsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFvn/dDVl6B29FCs6niMBZNS2uyIvkgVnFrU1Q+JPErDyoeyBe
	54VKFXam6BGRSHICpFEs+FQTykYD3Mv8n0H6FKsqoHmYY9fViswdvLW7jn3K40v5i+xElqcCS3k
	ScEnFlVIrmujGhZoBuIDkYQjAdDesP1s=
X-Gm-Gg: AYBFou3GkXtjUp4OHy9r+qKxrdAQgOSmkPIe8WaweUUWPrWa6VAgUssSiPQ6q1wUeup
	mT/J4FbX0azID0rcz7wAS+GGzj1J0VrEJHOWmZyGyxzhy8N5b0MlBBadBmurX9sd+LVMpA8mZ+c
	OdJzmAmrGngga3hSAbD7hllfODFR3Onmu0/7DcswBp7FMi/1scirFNXhF8QzBwxAT/ZdFh2yxm2
	uhyLA5GCyelrVlBYRMjqOVQ/UvuDWBhXbZ1xgCZvXVCJzpDfw53SvaQGOTb+hRmlS+IG0GTImlX
	g5zluL1VeEZ49Rfb5SLDj5FCTYoMWRyN/1CtNsni81bfRpPogio7wCZSE+jA8Q6J1z8s1TzuG6r
	qRtrckRp+Bj2OtiBuB0hy43XA/9259srWlvP/NVySuDWs+Pk4anFhf91QWXFc3tQap8/GW53hkc
	E0WiYItUeLh12dQQ5tk+snTnDLiCyqG+0blRt//+jWQJ8ZLgZd6Io+
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr4975765eec.1.1790947048361; Fri, 02 Oct 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net> <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 15:17:13 +0200
X-Gm-Features: AclHuK8j6jm4ckb1WgLL30lgTNmnSFAELi2oBsp8XXTTjt9_K2EqHepcmdMe70Q
Message-ID: <CANiq72nU8LgH7jYtFRQGdwvNvbdmLNxcP0-5PgMWFUvQ26KRCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: misc: use `#[optional]` attribute of
 `#[vtable]` macro
To: Gary Guo <gary@garyguo.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:56=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Replace the `build_error!(VTABLE_DEFAULT_ERROR)` boilerplate with the
> `#[optional]` attribute.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Arnd, Greg: may I get a quick Acked-by on this patch?

It is a change that simplifies boilerplate -- no "real" change for
you; miscdevice is just the example for the series.

Thanks!

Cheers,
Miguel

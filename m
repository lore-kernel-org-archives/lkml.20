Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967934F247
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896852; cv=pass; b=AYWStGnXn6bwPHLrtPpu47zzEA4Cof4HqpjFO3AID7Pi8WAgQ1RWrMa1GssmvyU7WELUEU2wsV3gCJtd8UcjFDUV98kein4/0Ou8apAsIjnv5qj9VOFmi7hBYAVzrW56v096qWDJ6XyzWn1fciZw1bAgrf31DFgh98oKqux0WbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896852; c=relaxed/simple;
	bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvMZ394ri24CV/dmwBMO0bjo9zH+QTPYwQMe3NDPdHfHhaFDul4mwbGMwH9jjpByhxhekgnfVUyPI3Je/qlgCu6uKZUPiXuc09aUVqRGkNbd8YDskox3oQp2OD4wWqJ8hY0Va1CgNh/JBd8Msx2ml21WYvT1VyDUrEAkdWhTtA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKO4MDZE; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKO4MDZE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso534063a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788896849; cv=none;
        d=google.com; s=arc-20260327;
        b=QPh/PpEVW9pmpmeNfRhsAJIFkjeCBu2/CcgJwPL1YW1nfsQ9Lr/yJ7gopjYye3FUSZ
         8gaX1DvwBd1/1wbwRDvJRu6VVZOHsGA0mjsvMo381HiQa/kqgmBI/z9fBSw5tQyLou3w
         WZ6YZVf2w/+x2GKF8rsLoD13Gqx+nNhCLUr5fWAPaE6FyAC7/HMAao+ZxSGPji848gDs
         Q7G0NTAkkIQE4yV7NRov/1zlGP76zbiYC+f28mIFW9oWK3P/uexMVr4i3tT2c5FqgZFx
         3mwX3Lm/rNpHjoIwTvaddjIM3Al4EHZxv2FC2d8V2gfIvyplIftM5AHgVtGGgc+DQrQZ
         Knlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        fh=kTzd8l+Rt6ahPvTOMALIfU7j9WoELX5CoD8X8cJi+gw=;
        b=DSx6fhJb6AAsar7JekXlzAHXXOunifpksWTvVCRRzU2yM2PTd1B69CAP1aEZ1dSn/n
         7ty8AEksvj8p8NVlarHvNLEs8BmZTFea1++rAEB8Yg2mog7KAWY6/W1uDWLS3kpM/LlZ
         GvaFjlg5BvwgR27yYFkqeoNWxcUG/uioaAXXCo6t+8t2uK+lkxgPTmP8nqb/0cnwH90P
         DhCFn9E+txAJ08Xv0Bc+9cQnZu/3lXUDRbg6GrCaYrPoC3D0C+af4vcx+xC949SoIXtA
         mlT10ulZqfIKZxn3c++CUYtPITkB88wYIwtGUeLyjjKZdV10qQ1mtbYXrq33gyKinxch
         VByA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896849; x=1789501649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        b=WKO4MDZEC19PCK+f2yr3mrZUQazyRNBEAjKxJsxbgYJA1jMqpjl7xaL2sg15NFSMxI
         y2FlGOAt7Rf5rTsgQpqYaM5wBMwzDK6aQ6/VURQA+qcFtgg6f4uZEu80gdaG0nMbY2bP
         /ssUrHWp+qOzfq6N9/tdtpAjm2PP8CLNo5zDCTBS0H7tSHRkJLzOWwrO0VYKE4QyUcGI
         8lnAkcl2m9hck0k1gDVT6YZoGnBKSUokXcIBHw9f9kfEUNG1IMGBjso8lz3H+2xYgLTZ
         DcA7fy3O6+6YOdOCDOGkMkG6NQxo/c9zLlgvVjwbJVMKXnLhS1HqR9R+J3W5Kk01VBHf
         fqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896849; x=1789501649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        b=WpSikhqxixNqNbOVEt7fX2OAbw6RNLbsAwgq3VS5H8rjtow9p3Fy/U7zld2VDG5FRF
         JmNviGyr3o1nqRVhBwVVhDistGB9N59QbaTeRn3TQP0a0tKGsNH9XnhmZ/C5yGpQrOSP
         uxqonkWyHx9ZNhNvH+JSYk7mjB8HD8xcNLmrMpIeVURa4MIKEJWuLwfUqVLyp1ruA7p1
         yCtAvGYzT+Wpfd2bMGNIlCCq2CyeR1l3upfq6WJc8gd0wNSLFpGrL78xoCLOHwkf5zg7
         A+tR+UyjyCWiPjixLYUig8f7jwy2TkSNMXLloldMCoa8e1H/TCxQtPBNmYKQbxAxqcH+
         VTuQ==
X-Forwarded-Encrypted: i=1; AKwUvByvyDQ8eBzz2CwlCF/H+SdAGYA1imW17mGhK3fQxeX0ydTTFvVBH5Kbb1BvbA/GuqSb8sZm4lot8PZXtYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nZat7EAAUi4b08u3Az9Mn9NaUkxqBoZKJNooxUxs8Xo24F/UMn
	cE6kPK201Q8KkNBahNkeC9HuoOSEjhctc/ApUQkCa7LUIcV7EJjzYQThz4hJgr6xAUve5GCgnkL
	oGwysSGvJlv//9I+FFfPwvmrFQn5cG7l2VBCi
X-Gm-Gg: AYBFou3675/bwrHHRv/kUONjz9jdXAqs8kdAgP9XAP8uGLwgH98luODqwYZTbTCvrH3
	3qfGIrMKsDTMuUpyh9xWRPl64jYSUf2FU+Fhqj4c6rdDhckFuQK7tTZYsW4KjeekggLGhXpZjj+
	N/X6XhZZYsXED6a17znbAFGu4gPBYY2vpdygUqW+ucU2mmBu0elM6uqANR+N+2Hplv1qXS08y9j
	gucI6j5JDkPT1mcZvOia9p0HUmGBGnIUuR5RmPTT8Zv0ZzQMVChAiMHOPi+xrZ0amLa6wxMgFtc
	UFKDgrPubIvdGPUWA8wxj64DigSCI4oscRXBh3q5c8HjUmhW1okZeezgckX/A0sIaPCzDHPPKhj
	vjaj1vqLnJRhip0cSm02gxWiWrCc2nLq5hp866BFCgeQqQ0OjBpMTYwh9Hbset38zi4o7Fmz0Lz
	cI+MR580FRuk36vCn81Peu5r1JIDzTokOqMfSrHv8Rwq6KcpjUo+A=
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39b3d7d056fmr21707651a91.4.1788896849093; Tue, 08 Sep 2026
 12:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn> <20260908-tyr-ioctls-v2-1-88bea777df67@kylinos.cn>
In-Reply-To: <20260908-tyr-ioctls-v2-1-88bea777df67@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 21:47:15 +0200
X-Gm-Features: AcwNN1XXa9g_iZLSTKQDHhq0xMt2HPgPqo8BFVOYoRvUTe0z8qL0cOKPZrDxOdc
Message-ID: <CANiq72mdp9hS_U=Mtf5F6Qv8M9=m38xOXtCP_a4c_QtkwhpFEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] rust: sizes: add SZ_4G constant
To: sunke@kylinos.cn
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
	Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 6:48=E2=80=AFPM Ke Sun via B4 Relay
<devnull+sunke.kylinos.cn@kernel.org> wrote:
>
> SZ_4G is used by the Tyr driver when splitting the GPU VA range into
> user and kernel regions.

The message should explain what changes, e.g. a new paragraph after
this one like "Thus add a new trait that ... and implement it for
`u64` because ...".

> +const unsigned long long RUST_CONST_HELPER_SZ_4G =3D SZ_4G;

Is it added here to be nearby other sizes, or something else?

> +/// Only implemented for `u64`.

Intra-doc link: [`u64`]

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

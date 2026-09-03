Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AE35CB6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449714; cv=pass; b=eW7JI1SohNgKA6CYMG7uw7odiLlHHjUkgGDjoTfvr2RehxR/38YvKP9CcW+KBmUnsfBVqozq3JG56Rap2Q7n/kXZ19R25FpdFUtRpIL+FwSUKb1Q2ktoTlWBZhVWZ4b0CKhdeg+AQFVXULbj+baQv6lWwIVsTQTfMQI/RqmNTxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449714; c=relaxed/simple;
	bh=Wel+w58EuWSYu3QVdPuqD8C+kXDhkBOx9VRsUEzu18g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r28yegKLX9UzV+xP3uoMQDs/JYqLQaL9DqTYh7eGjX6wlopBpt2hPimg6qwxUh/tKmGNNOa9qs6RLkfMaHbhtzipb+l34bZO50PiPzgwtR9VLWzsBEWjUQVOhCQ1Aj8bl83PU4Vu2L56dN3ASagbl9QSHXO4muBb8WHobbn/uW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syg0T3nd; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syg0T3nd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbe41618110so3459a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788449713; cv=none;
        d=google.com; s=arc-20260327;
        b=HvkXtlh1JWbVAcdkQEsT/yOGr/Sz3c5h0u6nUYUJa6LlLVNRtVipzgjLwmE7XhbWZ9
         GicZoX6lRv0Cqr9sEo7rqGbTCVnJ5eP2WX+kIB5VH/ZRDXjLTVgdE9T99GFLLcU1sYQZ
         cFc36XlnOD+8q8GlgyY/c0Fml7RbyI+IL/7fDBM6oCopP/30lI0VuGHv3NHX2BNP+INk
         ZSbQaHNwJx6Ue2G3rEjX7T71m9iOjhDSi6FA7NIxk8KcTVHYXnqSo+xDcaogBLL4jotR
         pCg2zfXzC78w9ChlT1N/PLF3F0pHgQ6cGgVJR2H06LKWVoum7qpFbnaVxMjOKMkR2iDy
         WAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        fh=30wG0giVhjF+ko65EPQ6aZ7AOFH2M8jxqCXuokaUSuE=;
        b=NiyPP40WF54Ka9GDA9XTVFNIgbAqiQUQzSTUWaCKvcEzpesGDbiyi0pb8x4D0S5t+Y
         N73STNCzdiIJ5WAbPbaNOxQZJzMTYSSdvwkGH+fUE17Rh3UEmmhulQb9Hwvh3qPTLHfi
         h28OhvRtFG/OcIsuyMUXR3eVX/wP2ayHedKKzYLpTQIKV0k5n7cueJY5YAmflL6JLftg
         ykrDw9XTOEXcoN0KHbMGM+A01gFptByGghVSLN9XYwqaW2Ef3o7p/FvQGYBeK56j019c
         sS3vpdNi+KnjhZQBeDazowPaRrAyqiY6eD0NC9mwhSn1sJrUVhVUkHliRg9T/Y+nC5cy
         X47A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449713; x=1789054513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        b=syg0T3ndehRCKW1Qt2UYtGcgdmsjYJmRWKirOcvFY3YJmjK/uGGlVkl9/B23SnnVgt
         OPAILTlWtCeq1lNRjF9xp5LP9UJHnhVse2XxFTLhghbvHICL9hJr3j8SjVFac4dyBVEr
         VQ7LM87Y29pf6jKbCKPeMd4W4cTiPAFD/7aGT++uYgdB7g1hsO+ywYtn15g3IUpf4FtC
         4A5fYytcrjcbM7BNwLoi0d+u+mx4fAvXsVimZ+RwH+AsM/LbZw9RWzrNZMcNWe4LpIe6
         4ID+c7GVKgjmBRIP386g6vPVT6lmMDy5EiInm1P6S1DD3fgvQFRK9pw5BiOOJMDIxeYi
         rHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449713; x=1789054513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        b=aKRkqXDDAPJM4WHxYFskeAPnZR3ofXqd7SXmQbUNCsB889VilbGe86wTp/CUudDfVk
         nSd1xVq8TCe+9mN8l6shJ9g8qhTIz10+XO1+mRRECUShYc1KAMW7ZOw91qvI+rsxb67A
         MB2PZB7dlB110OB8rK0QHtEfXxJ+Oj3I+dhW3scypMQRXnqdzD1rtj859OGZOKjvqfht
         6zFNEQ0+QMFLKykBP+peMM8ogvXqr5ccZgpFffOKGXQx7GDvzgX9328TsNuuiQgrBadq
         XloJozmP1jcfs3pE2OkDlVGGZDV76tFCZ3e8Zj2FIibJ8w6HLAlR8SZCzacaJFHCOwLo
         XREw==
X-Forwarded-Encrypted: i=1; AKwUvBwiN28oLSNT8l0kIPsmTb1rwIdj6jXX5PSr/5JPH7XwhlcaUyS6AJm0MEZ2JZ9gXzykIKJ7/CDKwujfwV8=@vger.kernel.org
X-Gm-Message-State: AFuF++mh/KkVf6ybjjUiaSEIXOrb5AjsLg1axGRvcO46qCHYJ1Y/JESo
	pAdCFMzJ9V0xPCi5ihl0ZkFd0xhkUY33fI8TcyrfeNerr2Hyz895hihjzAs4IaKGGuw6SpqA9P9
	fJIyRyl1HCfquPAelhUGSjEvBG9n9cPM=
X-Gm-Gg: AYBFou15lQxoniMd1SmAs8tDqJmlIdMHWFEVtd+58/qNok3CjO40uBMOtW+FxKu7X5h
	QjkPVnIH9KFddRSHcwVWYbBu71En6s860oWuFkzxjsdMokeQbKE3rNHQIkE9xu15Qa10knDKYpx
	Kib9eggiKQWd8KdDSF5+dlbZo1zyin0iS03EwGUxZflle/s/Jkpb7f5eGm9wf2h5weyyIDhGuI+
	PzM9dFYG97RjxoJNZKThDh0/dVBVT40sVZ3oDf/0Ftk+FdyFoALFzNOgaKSR3Hm9hnW46mnDGx7
	fT4klros1vQFnJHnTt/Q2NvgytdNJiJpvPaVYebuMoOSIt9nyMwNxXDjFXrCu5crC4xq1PdMpgy
	MCPBlNK+vnnRa1+OhiCzQM07Gx1WD9AzQ85Bwb0mzVOndbwPjmBqSggd0BUoU
X-Received: by 2002:a17:90b:1c89:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39aee12649dmr11584059a91.3.1788449712766; Thu, 03 Sep 2026
 08:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
In-Reply-To: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 17:34:59 +0200
X-Gm-Features: AcwNN1U-DNvbVvz5zFAU4rKPoamceLKbon3dohS4mdpg2OjXc_prN4YYMGEtrLc
Message-ID: <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Add a mechanism to perform const trait method calls, with the same type
> inference capabilities. This would only work for concrete types (not insi=
de
> generic functions).
>
> As an example, convert `as_char_ptr_in_const_context`, so instead of
>
>     kernel::str::as_char_ptr_in_const_context(c_str)
>
> one may write
>
>     const_call!(c_str.as_char_ptr())
>
> instead.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Thanks for resending this!

So I definitely like having `#[const_eval_only]`, because we do want
to limit those calls sometimes and it is nice to have C++'s equivalent
to `consteval` (perhaps this could be called just `#[consteval]` to
match?); i.e. what we talked about in the call.

On `Const` and `const_call!`, i.e. the other two patches: I am not
sure if we care that much to introduce a macro for it, but it doesn't
look bad either. I guess perhaps it helps to have a consistent way to
do it and to easily remove it later when the actual feature lands in
Rust. I would like to hear some thoughts on it from others.

Cheers,
Miguel

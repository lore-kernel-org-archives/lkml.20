Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F949CF59
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193983; cv=pass; b=LMZPpAtbF+7ilDOHKUJG7NMeDfggWhFLCyW0LnfhEibDgmcnMQoOp/QfKDGYja9pUNikvORoHpdXRmLNh77ukF/ObVo1qGobsbF0TT+G1tthlnHgvl9JrQsI4ADdfTMI2whRSiX3CBtUARrUcr/lV3NagvIPMjesyE+Cb1RBCwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193983; c=relaxed/simple;
	bh=WAb2HioeKt8yQ4+e2mWpoQ1jc7oIFNQVMnrcZ1VNVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/CAcnW9ceMApQDT2W3nBAdbr2c/zpiia6q74hO/VUBRRMLNts97W1e4u6LOVDVmH+bTmxfxUdE0fvCFdUNSOOHGx/NMvv8VZGgJP0ZKXoslVI246jhI/ZioYbW+F/FzTrz4s1A5WELxwVT558+kduyvpPCcyVreQQpXDQ+gI9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=refBrwGZ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="refBrwGZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d906cf83b2so2114935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788193981; cv=none;
        d=google.com; s=arc-20260327;
        b=qZFnkO2ZGObYTwhzqDDBi7EMZqChIY+KstpaV1CwM4GDMxNyK9cHg12kXPbtWAyNiS
         8SssrtqrPkjb991xuTz6TOjcPT5JeUnWPZLj9S2WH83zFys6pSVDeVzGQ5yJL1jvNjOY
         z2cIuJ/z3s9p3u1qIEWOAY42YP+vWLL0kMThdmztNnvb4AjlofZi3zK/8NoIYO0BhE/J
         KV/C6Oy7Hmol7da/Q/8wX5gsF7rnEp89lyi8kogfCEC+vrtAJvEh/BfAUmowq1u11tvx
         lDjJVPGMe/hSbKtjPpq3CW3PaI6U991P6kSMQNKHJiXvpW+L9z350GwCl8fCuWBHYvPW
         wurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        fh=UFeZFGkfCsV9PFUn11VmyIa3bMjog353bbOSW8qXmUQ=;
        b=EwO6V7wYNO8z0gfZS8qTOYog9cvPvGXogwRysrZx1U2lh0O0W7Q10DtmzlkB1ePQPb
         LIqi4Syt/BFIIlzi9FtOZ9DtLT9khyg32cnOnZrjaKuhCfBi/hgntY34whXo/PGjAJBa
         /8vDTPLoD0RjMOovZdVUP9PEMWhji7XwwBRxIT3XcJGqqd7/lzyEoRIFeJOkuujlan+f
         Vb8hBmFEzAF5iIsd631TYUc/0X8D66S6a3N6HIwDwYvmQZKtweE30Foe99VuAm3dJABI
         clO7298hED4xCV/YKkPeHqCzA3EsNusgmlP9DVPz+ijwvRwuTPQSEsYUKEPHFz6I801V
         /jdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193981; x=1788798781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=refBrwGZujpvTpihy/NZH9EfEJJVQmjGZhkmcPyHkrJnQJ4uxgMRAQ9qdfAmyXc03L
         LstKISwlWnno/B83pwbIRnUCpigRdbTki/T8o4RL0DdE1mBNwkYNrwXIWkrQZ+S9+hCB
         UNdkFis7VHdX0p4bOSIFoIhPK0E8qrTrv30nvRPTzN1A4fJSUlvLDQzUWVojRbyj4oV1
         Mste31TatK15L0BlxNuCEGPhA8sNxxbmaTrjPTdJBAMEKpm1ncqMeMjRg8oCVYtHZrC6
         qGn/Zx3v/TECkieM3oZCrNErFrlwDqzajUw7EmZPLT4TMWHiJYlTF69pnx9q6XmOqawM
         Zn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193981; x=1788798781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=lmgK5Kfr7HxgGcQr1ZOpR2Ez2/1uJ4zxTUQcYR376Iui3seoJ6P4JFnCg8SUpgBqSV
         r7UCW/f6HPZdijCvGmomMAQc7o4kQmvynVz03916f6VB2EsVV+SUQpzUqoqh658QO4R5
         1Y9Q0gTFzzPz6UGoHHd5CVZMprcYCuhVfrIkbYwpKrfSZUhGO0kAJ2H5ROsNJ/sx3+CC
         UnbAoUunjnN8l5ahFtfkxJPCuSQLAQutY/manmV+VbAyI5RqRF9Q4TcuTMumTTkD2/sT
         vh0YfJk2h0TLFRlyI01F3TT5dt8OzVybtVqdjL74i02YAIDOjMr/w/xa4Eh5dSKA0ASH
         SKdA==
X-Forwarded-Encrypted: i=1; AKwUvBwOLBE2UGF6vRvbrevbVGsld/YHXJzPMvTHhuhrODu6nxCzfuQrh9KU+aKNOn1JdXqslz4rIankTjEg3tk=@vger.kernel.org
X-Gm-Message-State: AFuF++lFGgjiqszWwHjWUUfSxQCc2qs1qs4ShPdWrcyQ4FCdX0aZHeWG
	IQtO4vQDy/Z8p3TwkhSzo+9gsVpJObyJohRGYlcTVuXuDDKYyJyILpOTYmHGFr7o3OQETDXi1ps
	R8BEj1Sv5GN7iXQiEkZshWCi44Rj9US8=
X-Gm-Gg: AYBFou3ZKOFgJfFbO/QBS6YLxKdh4JP6sJiOG9m9TBegXwNCMAj/+6Wns90DjeljTRH
	VWBva75hSU0HXtDq1nF8JP4HWTQJ16Gm7codMLQV8m3exz6MzG6I2q0Xlr2MXkRwLNr/uUcULJo
	DqwAU9MNiEJhmc+9Mui+YPSiT7FLhzFfpG/HB9CtMTqtRZmBwiWelATKuzmyIC1RA8TAoC4wIPG
	g5ST6SaZWDbpDZBhk+Vbx/S4LO5sPG3U+rBCrLAalyJx8xrCroXPi5l/Qs814gUFCdyc1kbYoAX
	N4xg+6CXbUy+nBah79xS6ox7TVaLchUgCn5F2QlwXjUeyxiWl6+DydOPN9JcX1gqGUkg+Kc+q3p
	s96d5i/6rqAHmcXsPNtAMgCcziM4mEUwYnBXyzeL80PjTe40XRL9i32s5gg/z
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr224272585ad.0.1788193980913; Mon, 31 Aug 2026
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org> <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 18:32:46 +0200
X-Gm-Features: AcwNN1WxT2qUEpoESa1nnOxcvqd-4guXTylAIIzIEvrVEhydUWRkwim0NkJ623s
Message-ID: <CANiq72=TYcLdj0t2DbboS31L4BNrSg-0bRmHZe4SDnbRLeoy9g@mail.gmail.com>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Guillaume Tucker <gtucker@gtucker.io>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:25=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> +bindgen                0.71.1           generate Rust bindings

Should this simply say `CONFIG_RUST=3Dy` too?

> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)

Should we add an equivalent one to GNU C?

> +gtags (optional)       6.6.5

It seems the patch missed this one?

> +Sphinx\ [#f1]_         3.4.3

Should the footnote be moved into the new column?

> xfsprogs               2.6.0

Is this always required? There may be others that are actually optional too=
.

Cc'ing Guillaume and Nicolas -- we were discussing Python in this thread:

  https://lore.kernel.org/all/apG3hwaPA8f7SJeI@levanger/

Thanks!

Cheers,
Miguel
